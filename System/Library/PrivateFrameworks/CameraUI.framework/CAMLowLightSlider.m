@implementation CAMLowLightSlider

- (CAMLowLightSlider)initWithFrame:(CGRect)a3
{
  CAMLowLightSlider *v3;
  CAMLowLightSlider *v4;
  void *v5;
  double v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMLowLightSlider;
  v3 = -[CEKDiscreteSlider initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CEKDiscreteSlider setIndexCount:](v3, "setIndexCount:", 3);
    CAMLocalizedFrameworkString(CFSTR("LOW_LIGHT_SLIDER_TITLE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKDiscreteSlider setTitleText:](v4, "setTitleText:", v5);

    -[CEKDiscreteSlider tickMarksHeight](v4, "tickMarksHeight");
    v4->__inactiveTickMarkHeight = v6;
    -[CEKDiscreteSlider tickMarksConfiguration](v4, "tickMarksConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMainTickMarkInterval:", 6);

    -[CEKDiscreteSlider setTickMarkCountBetweenIndexes:](v4, "setTickMarkCountBetweenIndexes:", 5);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->__valueLabelUpdateTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CAMLowLightSlider;
  -[CAMLowLightSlider dealloc](&v3, sel_dealloc);
}

- (void)setDurationMapping:(id)a3
{
  if (a3.var0 != self->_durationMapping.minimumDuration || a3.var1 != self->_durationMapping.maximumDuration)
  {
    self->_durationMapping = ($9A58E5929C033B40A174D578711F86A7)a3;
    if (-[CAMLowLightSlider lowLightMode](self, "lowLightMode"))
      -[CEKDiscreteSlider updateValueLabel](self, "updateValueLabel");
  }
}

- (void)setLowLightActive:(BOOL)a3
{
  if (self->_lowLightActive != a3)
  {
    self->_lowLightActive = a3;
    -[CEKDiscreteSlider updateValueLabel](self, "updateValueLabel");
  }
}

- (void)setLowLightMode:(unint64_t)a3
{
  if (-[CAMLowLightSlider lowLightMode](self, "lowLightMode") != a3 && a3 <= 2)
    -[CEKDiscreteSlider setSelectedIndex:](self, "setSelectedIndex:", a3);
}

- (unint64_t)lowLightMode
{
  unint64_t result;

  if (-[CAMLowLightSlider _isPerformingCaptureAnimation](self, "_isPerformingCaptureAnimation"))
    result = -[CAMLowLightSlider _selectedIndexBeforeCaptureAnimation](self, "_selectedIndexBeforeCaptureAnimation");
  else
    result = -[CEKDiscreteSlider selectedIndex](self, "selectedIndex");
  if (result != 2)
    return result == 1;
  return result;
}

- (id)valueText
{
  unint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  __CFString *v7;
  double v8;
  void *v9;
  CAMLowLightSlider *v10;
  double v11;
  double v12;
  void *v13;

  v3 = -[CAMLowLightSlider lowLightMode](self, "lowLightMode");
  if (-[CAMLowLightSlider _isPerformingCaptureAnimation](self, "_isPerformingCaptureAnimation"))
  {
    -[CAMLowLightSlider _remainingCaptureAnimationTime](self, "_remainingCaptureAnimationTime");
    -[CAMLowLightSlider _valueTextForDuration:](self, "_valueTextForDuration:");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v13 = (void *)v4;
    return v13;
  }
  -[CAMLowLightSlider durationMapping](self, "durationMapping");
  switch(v3)
  {
    case 2uLL:
      v8 = v6;
      CAMLocalizedFrameworkString(CFSTR("LOW_LIGHT_MAX_DURATION_TEXT"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self;
      v11 = v8;
LABEL_10:
      -[CAMLowLightSlider _valueTextForDuration:format:](v10, "_valueTextForDuration:format:", v9, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    case 1uLL:
      v12 = v5;
      if (!-[CAMLowLightSlider isLowLightActive](self, "isLowLightActive"))
      {
        v7 = CFSTR("LOW_LIGHT_AUTO_TEXT");
        goto LABEL_13;
      }
      CAMLocalizedFrameworkString(CFSTR("LOW_LIGHT_AUTO_DURATION_TEXT"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self;
      v11 = v12;
      goto LABEL_10;
    case 0uLL:
      v7 = CFSTR("LOW_LIGHT_OFF_TEXT");
LABEL_13:
      CAMLocalizedFrameworkString(v7, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
  }
  v13 = 0;
  return v13;
}

- (id)_valueTextForDuration:(double)a3
{
  void *v5;
  void *v6;

  CAMLocalizedFrameworkString(CFSTR("LOW_LIGHT_DURATION_TEXT"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLowLightSlider _valueTextForDuration:format:](self, "_valueTextForDuration:format:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_valueTextForDuration:(double)a3 format:(id)a4
{
  double v5;
  unint64_t v6;
  id v7;
  _BOOL4 v8;
  double v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = round(a3);
  v6 = llround(a3);
  v7 = a4;
  v8 = -[CAMLowLightSlider _isPerformingCaptureAnimation](self, "_isPerformingCaptureAnimation");
  v9 = fmax((double)(uint64_t)v5, 1.0);
  if (v8)
    v10 = v6;
  else
    v10 = (uint64_t)v9;
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:locale:", CFSTR("%li"), v12, v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)performCaptureAnimationWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a4;
  if (-[CAMLowLightSlider _isPerformingCaptureAnimation](self, "_isPerformingCaptureAnimation"))
    -[CAMLowLightSlider endCaptureAnimationAnimated:](self, "endCaptureAnimationAnimated:", 0);
  -[CAMLowLightSlider _setSelectedIndexBeforeCaptureAnimation:](self, "_setSelectedIndexBeforeCaptureAnimation:", -[CEKDiscreteSlider selectedIndex](self, "selectedIndex"));
  -[CAMLowLightSlider _setRemainingCaptureAnimationTime:](self, "_setRemainingCaptureAnimationTime:", a3);
  -[CAMLowLightSlider _setPerformingCaptureAnimation:](self, "_setPerformingCaptureAnimation:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider tickMarksConfiguration](self, "tickMarksConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMainTickMarkColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKDiscreteSlider tickMarksConfiguration](self, "tickMarksConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSecondaryTickMarkColor:", v9);

  -[CEKDiscreteSlider setColorHighlight:animated:](self, "setColorHighlight:animated:", 2, 1);
  -[CEKDiscreteSlider setTickMarksHeight:animated:](self, "setTickMarksHeight:animated:", 1, 15.0);
  -[CAMLowLightSlider _startValueLabelUpdateTimerWithDuration:](self, "_startValueLabelUpdateTimerWithDuration:", a3);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__CAMLowLightSlider_performCaptureAnimationWithDuration_completion___block_invoke;
  v12[3] = &unk_1EA32CD90;
  objc_copyWeak(&v14, &location);
  v11 = v6;
  v13 = v11;
  -[CEKDiscreteSlider setSelectedIndex:animatedDuration:animatedCurve:completion:](self, "setSelectedIndex:animatedDuration:animatedCurve:completion:", 0, 0, v12, a3);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

uint64_t __68__CAMLowLightSlider_performCaptureAnimationWithDuration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_stopValueLabelUpdateTimer");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)endCaptureAnimationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;

  v3 = a3;
  if (-[CAMLowLightSlider _isPerformingCaptureAnimation](self, "_isPerformingCaptureAnimation"))
  {
    -[CAMLowLightSlider _stopValueLabelUpdateTimer](self, "_stopValueLabelUpdateTimer");
    -[CAMLowLightSlider _setPerformingCaptureAnimation:](self, "_setPerformingCaptureAnimation:", 0);
    -[CAMLowLightSlider _inactiveTickMarkHeight](self, "_inactiveTickMarkHeight");
    -[CEKDiscreteSlider setTickMarksHeight:animated:](self, "setTickMarksHeight:animated:", v3);
    -[CEKDiscreteSlider setColorHighlight:animated:](self, "setColorHighlight:animated:", 1, 1);
    -[CEKDiscreteSlider tickMarksConfiguration](self, "tickMarksConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMainTickMarkColor:", 0);

    -[CEKDiscreteSlider tickMarksConfiguration](self, "tickMarksConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSecondaryTickMarkColor:", 0);

    v9 = 0;
    v10 = 0.5;
    if (v3)
      v11 = 0.5;
    else
      v11 = 0.0;
    if (v3)
    {
      LODWORD(v10) = 1058642330;
      LODWORD(v7) = 0;
      LODWORD(v8) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", COERCE_DOUBLE(1045220557), v10, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (id)v9;
    -[CEKDiscreteSlider setSelectedIndex:animatedDuration:animatedCurve:completion:](self, "setSelectedIndex:animatedDuration:animatedCurve:completion:", -[CAMLowLightSlider _selectedIndexBeforeCaptureAnimation](self, "_selectedIndexBeforeCaptureAnimation"), v9, 0, v11);

  }
}

- (void)_startValueLabelUpdateTimerWithDuration:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14[3];
  id location;

  -[CAMLowLightSlider _stopValueLabelUpdateTimer](self, "_stopValueLabelUpdateTimer");
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0C99E88];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __61__CAMLowLightSlider__startValueLabelUpdateTimerWithDuration___block_invoke;
  v13 = &unk_1EA32FC68;
  objc_copyWeak(v14, &location);
  v14[1] = v6;
  v14[2] = *(id *)&a3;
  objc_msgSend(v7, "timerWithTimeInterval:repeats:block:", 1, &v10, 0.2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTolerance:", 0.1, v10, v11, v12, v13);
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTimer:forMode:", v8, *MEMORY[0x1E0C99860]);

  -[CAMLowLightSlider _setValueLabelUpdateTimer:](self, "_setValueLabelUpdateTimer:", v8);
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __61__CAMLowLightSlider__startValueLabelUpdateTimerWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleValueLabelUpdateTimerWithStartTime:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)_stopValueLabelUpdateTimer
{
  void *v3;

  -[CAMLowLightSlider _valueLabelUpdateTimer](self, "_valueLabelUpdateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CAMLowLightSlider _setValueLabelUpdateTimer:](self, "_setValueLabelUpdateTimer:", 0);
}

- (void)_handleValueLabelUpdateTimerWithStartTime:(double)a3 duration:(double)a4
{
  double v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[CAMLowLightSlider _setRemainingCaptureAnimationTime:](self, "_setRemainingCaptureAnimationTime:", a4 - (v7 - a3));
  -[CEKDiscreteSlider updateValueLabel](self, "updateValueLabel");
}

- (BOOL)isLowLightActive
{
  return self->_lowLightActive;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)durationMapping
{
  double minimumDuration;
  double maximumDuration;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  minimumDuration = self->_durationMapping.minimumDuration;
  maximumDuration = self->_durationMapping.maximumDuration;
  result.var1 = maximumDuration;
  result.var0 = minimumDuration;
  return result;
}

- (BOOL)_isPerformingCaptureAnimation
{
  return self->__performingCaptureAnimation;
}

- (void)_setPerformingCaptureAnimation:(BOOL)a3
{
  self->__performingCaptureAnimation = a3;
}

- (unint64_t)_selectedIndexBeforeCaptureAnimation
{
  return self->__selectedIndexBeforeCaptureAnimation;
}

- (void)_setSelectedIndexBeforeCaptureAnimation:(unint64_t)a3
{
  self->__selectedIndexBeforeCaptureAnimation = a3;
}

- (double)_remainingCaptureAnimationTime
{
  return self->__remainingCaptureAnimationTime;
}

- (void)_setRemainingCaptureAnimationTime:(double)a3
{
  self->__remainingCaptureAnimationTime = a3;
}

- (NSTimer)_valueLabelUpdateTimer
{
  return self->__valueLabelUpdateTimer;
}

- (void)_setValueLabelUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->__valueLabelUpdateTimer, a3);
}

- (double)_inactiveTickMarkHeight
{
  return self->__inactiveTickMarkHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__valueLabelUpdateTimer, 0);
}

@end

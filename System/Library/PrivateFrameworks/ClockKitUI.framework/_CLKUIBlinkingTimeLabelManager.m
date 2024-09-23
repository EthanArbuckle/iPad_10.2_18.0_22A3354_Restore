@implementation _CLKUIBlinkingTimeLabelManager

- (void)setAnimationsPaused:(BOOL)a3
{
  self->_animationsPaused = a3;
  -[_CLKUIBlinkingTimeLabelManager _startOrStopBlinking](self, "_startOrStopBlinking");
}

- (void)_startOrStopBlinking
{
  if (self->_animationsPaused
    || !-[CLKTimeFormatter reportingLiveTime](self->_timeFormatter, "reportingLiveTime"))
  {
    -[_CLKUIBlinkingTimeLabelManager _stopBlinking](self, "_stopBlinking");
  }
  else
  {
    -[_CLKUIBlinkingTimeLabelManager _startBlinking](self, "_startBlinking");
  }
}

- (void)_stopBlinking
{
  CLKClockTimerToken *blinkTimerToken;
  id v4;

  if (self->_blinkTimerToken)
  {
    -[CLKClockTimer stopUpdatesForToken:](self->_blinkTimer, "stopUpdatesForToken:");
    blinkTimerToken = self->_blinkTimerToken;
    self->_blinkTimerToken = 0;

    if (self->_usesIsolatedBlinkerLabel)
    {
      -[UILabel setAlpha:](self->_minutesBlinkerLabel, "setAlpha:", 1.0);
      -[UILabel setAlpha:](self->_secondsBlinkerLabel, "setAlpha:", 1.0);
    }
    else
    {
      -[_CLKUIBasicTimeLabelManager view](self->_blinkerLabelManager, "view");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAlpha:", 1.0);

    }
  }
}

- (void)_startBlinking
{
  CLKClockTimer *blinkTimer;
  uint64_t v4;
  CLKClockTimerToken *v5;
  CLKClockTimerToken *blinkTimerToken;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_blinkTimerToken)
  {
    objc_initWeak(&location, self);
    blinkTimer = self->_blinkTimer;
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48___CLKUIBlinkingTimeLabelManager__startBlinking__block_invoke;
    v9[3] = &unk_1E86E0000;
    objc_copyWeak(&v10, &location);
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __48___CLKUIBlinkingTimeLabelManager__startBlinking__block_invoke_137;
    v7[3] = &unk_1E86E0568;
    objc_copyWeak(&v8, &location);
    -[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:](blinkTimer, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 2, v9, v7);
    v5 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
    blinkTimerToken = self->_blinkTimerToken;
    self->_blinkTimerToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)updateTimeText
{
  void *v3;
  id v4;

  -[_CLKUIBasicTimeLabelManager updateTimeText](self->_numbersLabelManager, "updateTimeText");
  if (self->_usesIsolatedBlinkerLabel)
  {
    -[_CLKUIBasicTimeLabelManager minutesDesignatorAttributedText](self->_numbersLabelManager, "minutesDesignatorAttributedText");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_CLKUIBasicTimeLabelManager secondsDesignatorAttributedText](self->_numbersLabelManager, "secondsDesignatorAttributedText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_minutesBlinkerLabel, "setAttributedText:", v4);
    -[UILabel setAttributedText:](self->_secondsBlinkerLabel, "setAttributedText:", v3);
    -[UILabel sizeToFit](self->_minutesBlinkerLabel, "sizeToFit");
    -[UILabel sizeToFit](self->_secondsBlinkerLabel, "sizeToFit");

  }
  else
  {
    -[_CLKUIBasicTimeLabelManager updateTimeText](self->_blinkerLabelManager, "updateTimeText");
  }
}

- (CGSize)sizeThatFits
{
  double v2;
  double v3;
  CGSize result;

  -[_CLKUIBasicTimeLabelManager sizeThatFits](self->_numbersLabelManager, "sizeThatFits");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)sizeViewToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[_CLKUIBlinkingTimeLabelManager bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_CLKUIBlinkingTimeLabelManager sizeThatFits](self, "sizeThatFits");
  -[_CLKUIBlinkingTimeLabelManager setBounds:](self, "setBounds:", v4, v6, v7, v8);
  -[_CLKUIBlinkingTimeLabelManager layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UILabel *secondsBlinkerLabel;
  double MidX;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)_CLKUIBlinkingTimeLabelManager;
  -[_CLKUIBlinkingTimeLabelManager layoutSubviews](&v19, sel_layoutSubviews);
  -[_CLKUIBlinkingTimeLabelManager bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_CLKUIBasicTimeLabelManager view](self->_numbersLabelManager, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (self->_usesIsolatedBlinkerLabel)
  {
    -[_CLKUIBasicTimeLabelManager _boundingRectOfMinutesBlinker](self->_numbersLabelManager, "_boundingRectOfMinutesBlinker");
    -[UILabel setFrame:](self->_minutesBlinkerLabel, "setFrame:");
    -[_CLKUIBasicTimeLabelManager _boundingRectOfSecondsBlinker](self->_numbersLabelManager, "_boundingRectOfSecondsBlinker");
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;
    secondsBlinkerLabel = self->_secondsBlinkerLabel;
    MidX = CGRectGetMidX(v20);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    -[UILabel setCenter:](secondsBlinkerLabel, "setCenter:", MidX, CGRectGetMidY(v21));
  }
  else
  {
    -[_CLKUIBasicTimeLabelManager view](self->_blinkerLabelManager, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v4, v6, v8, v10);

  }
}

- (void)_updateBlinkerAlphaForSecondFraction:(double)a3
{
  double v4;
  double v5;
  id v6;

  CLKCompressFraction();
  CLKInterpolateBetweenFloatsClipped();
  v5 = v4;
  if (self->_usesIsolatedBlinkerLabel)
  {
    -[UILabel setAlpha:](self->_minutesBlinkerLabel, "setAlpha:", v4);
    -[UILabel setAlpha:](self->_secondsBlinkerLabel, "setAlpha:", v5);
  }
  else
  {
    -[_CLKUIBasicTimeLabelManager view](self->_blinkerLabelManager, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", v5);

  }
}

- (_CLKUIBlinkingTimeLabelManager)initWithForDevice:(id)a3 timeFormatter:(id)a4 options:(unint64_t)a5 timer:(id)a6 labelFactory:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  _CLKUIBlinkingTimeLabelManager *v16;
  _CLKUIBlinkingTimeLabelManager *v17;
  _CLKUIBasicTimeLabelManager *v18;
  _CLKUIBasicTimeLabelManager *numbersLabelManager;
  void *v20;
  _CLKUIBasicTimeLabelManager *v21;
  _CLKUIBasicTimeLabelManager *blinkerLabelManager;
  void *v23;
  uint64_t v24;
  UILabel *minutesBlinkerLabel;
  uint64_t v26;
  UILabel *secondsBlinkerLabel;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  v29.receiver = self;
  v29.super_class = (Class)_CLKUIBlinkingTimeLabelManager;
  v16 = -[_CLKUIBlinkingTimeLabelManager initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_timeFormatter, a4);
    -[CLKTimeFormatter addObserver:](v17->_timeFormatter, "addObserver:", v17);
    objc_storeStrong((id *)&v17->_blinkTimer, a6);
    v18 = -[_CLKUIBasicTimeLabelManager _initForDevice:primary:withTimeFormatter:options:labelFactory:]([_CLKUIBasicTimeLabelManager alloc], "_initForDevice:primary:withTimeFormatter:options:labelFactory:", v12, 1, v13, a5, v15);
    numbersLabelManager = v17->_numbersLabelManager;
    v17->_numbersLabelManager = v18;

    -[_CLKUIBasicTimeLabelManager setShowsBlinker:](v17->_numbersLabelManager, "setShowsBlinker:", 0);
    -[_CLKUIBasicTimeLabelManager view](v17->_numbersLabelManager, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CLKUIBlinkingTimeLabelManager addSubview:](v17, "addSubview:", v20);

    v17->_usesIsolatedBlinkerLabel = (a5 & 8) != 0;
    if ((a5 & 8) != 0)
    {
      v15[2](v15, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      minutesBlinkerLabel = v17->_minutesBlinkerLabel;
      v17->_minutesBlinkerLabel = (UILabel *)v24;

      v15[2](v15, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      secondsBlinkerLabel = v17->_secondsBlinkerLabel;
      v17->_secondsBlinkerLabel = (UILabel *)v26;

      -[_CLKUIBlinkingTimeLabelManager addSubview:](v17, "addSubview:", v17->_minutesBlinkerLabel);
      -[_CLKUIBlinkingTimeLabelManager addSubview:](v17, "addSubview:", v17->_secondsBlinkerLabel);
    }
    else
    {
      v21 = -[_CLKUIBasicTimeLabelManager _initForDevice:primary:withTimeFormatter:options:labelFactory:]([_CLKUIBasicTimeLabelManager alloc], "_initForDevice:primary:withTimeFormatter:options:labelFactory:", v12, 0, v13, a5, v15);
      blinkerLabelManager = v17->_blinkerLabelManager;
      v17->_blinkerLabelManager = v21;

      -[_CLKUIBasicTimeLabelManager setShowsNumbers:](v17->_blinkerLabelManager, "setShowsNumbers:", 0);
      -[_CLKUIBasicTimeLabelManager view](v17->_blinkerLabelManager, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CLKUIBlinkingTimeLabelManager addSubview:](v17, "addSubview:", v23);

    }
    -[_CLKUIBlinkingTimeLabelManager _startOrStopBlinking](v17, "_startOrStopBlinking");
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[CLKTimeFormatter removeObserver:](self->_timeFormatter, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)_CLKUIBlinkingTimeLabelManager;
  -[_CLKUIBlinkingTimeLabelManager dealloc](&v3, sel_dealloc);
}

- (CGSize)intrinsicSize
{
  double v2;
  double v3;
  CGSize result;

  -[_CLKUIBasicTimeLabelManager intrinsicSize](self->_numbersLabelManager, "intrinsicSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  _CLKUIBasicTimeLabelManager *numbersLabelManager;
  id v5;

  numbersLabelManager = self->_numbersLabelManager;
  v5 = a3;
  -[_CLKUIBasicTimeLabelManager traitCollectionDidChange:](numbersLabelManager, "traitCollectionDidChange:", v5);
  -[_CLKUIBasicTimeLabelManager traitCollectionDidChange:](self->_blinkerLabelManager, "traitCollectionDidChange:", v5);

}

- (UIEdgeInsets)opticalInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_CLKUIBasicTimeLabelManager opticalInsets](self->_numbersLabelManager, "opticalInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setMaxWidth:(double)a3
{
  -[_CLKUIBasicTimeLabelManager setMaxWidth:](self->_numbersLabelManager, "setMaxWidth:");
  if (!self->_usesIsolatedBlinkerLabel)
    -[_CLKUIBasicTimeLabelManager setMaxWidth:](self->_blinkerLabelManager, "setMaxWidth:", a3);
}

- (void)setStyle:(id)a3
{
  id v4;

  v4 = a3;
  -[_CLKUIBasicTimeLabelManager setStyle:](self->_numbersLabelManager, "setStyle:");
  if (!self->_usesIsolatedBlinkerLabel)
    -[_CLKUIBasicTimeLabelManager setStyle:](self->_blinkerLabelManager, "setStyle:", v4);
  -[_CLKUIBlinkingTimeLabelManager updateTimeText](self, "updateTimeText");

}

- (void)setShowsDesignator:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[_CLKUIBasicTimeLabelManager setShowsDesignator:](self->_numbersLabelManager, "setShowsDesignator:");
  if (!self->_usesIsolatedBlinkerLabel)
    -[_CLKUIBasicTimeLabelManager setShowsDesignator:](self->_blinkerLabelManager, "setShowsDesignator:", v3);
}

- (void)setShowSeconds:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[_CLKUIBasicTimeLabelManager setShowSeconds:](self->_numbersLabelManager, "setShowSeconds:");
  if (!self->_usesIsolatedBlinkerLabel)
    -[_CLKUIBasicTimeLabelManager setShowSeconds:](self->_blinkerLabelManager, "setShowSeconds:", v3);
}

- (double)_capOffsetFromBoundsTop
{
  double result;

  -[_CLKUIBasicTimeLabelManager _capOffsetFromBoundsTop](self->_numbersLabelManager, "_capOffsetFromBoundsTop");
  return result;
}

- (double)_lastLineBaseline
{
  double result;

  -[_CLKUIBasicTimeLabelManager _lastLineBaseline](self->_numbersLabelManager, "_lastLineBaseline");
  return result;
}

- (id)viewForLastBaselineLayout
{
  return -[_CLKUIBasicTimeLabelManager viewForLastBaselineLayout](self->_numbersLabelManager, "viewForLastBaselineLayout");
}

- (id)effectiveFont
{
  return -[_CLKUIBasicTimeLabelManager effectiveFont](self->_numbersLabelManager, "effectiveFont");
}

- (id)effectiveAttributedText
{
  return -[_CLKUIBasicTimeLabelManager effectiveAttributedText](self->_numbersLabelManager, "effectiveAttributedText");
}

- (UIColor)textColor
{
  return -[_CLKUIBasicTimeLabelManager textColor](self->_numbersLabelManager, "textColor");
}

- (void)setTextColor:(id)a3
{
  UILabel *minutesBlinkerLabel;
  void *v5;
  UILabel *secondsBlinkerLabel;
  void *v7;
  id v8;

  v8 = a3;
  -[_CLKUIBasicTimeLabelManager setTextColor:](self->_numbersLabelManager, "setTextColor:");
  if (self->_usesIsolatedBlinkerLabel)
  {
    -[UILabel setTextColor:](self->_minutesBlinkerLabel, "setTextColor:", v8);
    minutesBlinkerLabel = self->_minutesBlinkerLabel;
    -[_CLKUIBasicTimeLabelManager minutesDesignatorAttributedText](self->_numbersLabelManager, "minutesDesignatorAttributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](minutesBlinkerLabel, "setAttributedText:", v5);

    -[UILabel setTextColor:](self->_secondsBlinkerLabel, "setTextColor:", v8);
    secondsBlinkerLabel = self->_secondsBlinkerLabel;
    -[_CLKUIBasicTimeLabelManager secondsDesignatorAttributedText](self->_numbersLabelManager, "secondsDesignatorAttributedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](secondsBlinkerLabel, "setAttributedText:", v7);

  }
  else
  {
    -[_CLKUIBasicTimeLabelManager setTextColor:](self->_blinkerLabelManager, "setTextColor:", v8);
  }

}

- (void)enumerateUnderlyingLabelsWithBlock:(id)a3
{
  void (**v4)(id, UILabel *, _QWORD);

  v4 = (void (**)(id, UILabel *, _QWORD))a3;
  -[_CLKUIBasicTimeLabelManager enumerateUnderlyingLabelsWithBlock:](self->_numbersLabelManager, "enumerateUnderlyingLabelsWithBlock:");
  if (self->_usesIsolatedBlinkerLabel)
  {
    v4[2](v4, self->_minutesBlinkerLabel, 0);
    v4[2](v4, self->_secondsBlinkerLabel, 0);
  }
  else
  {
    -[_CLKUIBasicTimeLabelManager enumerateUnderlyingLabelsWithBlock:](self->_blinkerLabelManager, "enumerateUnderlyingLabelsWithBlock:", v4);
  }

}

- (BOOL)animationsPaused
{
  return self->_animationsPaused;
}

- (BOOL)showSeconds
{
  return self->_showSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsBlinkerLabel, 0);
  objc_storeStrong((id *)&self->_minutesBlinkerLabel, 0);
  objc_storeStrong((id *)&self->_blinkTimerToken, 0);
  objc_storeStrong((id *)&self->_blinkTimer, 0);
  objc_storeStrong((id *)&self->_blinkerLabelManager, 0);
  objc_storeStrong((id *)&self->_numbersLabelManager, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
}

@end

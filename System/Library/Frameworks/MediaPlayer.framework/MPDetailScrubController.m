@implementation MPDetailScrubController

- (MPDetailScrubController)initWithScrubbingControl:(id)a3
{
  id v4;
  MPDetailScrubController *v5;
  MPDetailScrubController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPDetailScrubController;
  v5 = -[MPDetailScrubController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrubbingControl, v4);
    v6->_scrubbingVerticalRange = 220.0;
    v6->_detailedScrubbingEnabled = 1;
  }

  return v6;
}

- (MPDetailScrubController)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("-init is invalid. Use -initWithScrubbingControl: instead."));

  return 0;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  MPDetailedScrubbing **p_scrubbingControl;
  id v6;
  id WeakRetained;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  _BOOL4 v12;
  UISelectionFeedbackGenerator *feedbackGenerator;
  UISelectionFeedbackGenerator *v14;
  UISelectionFeedbackGenerator *v15;
  CGPoint v17;
  CGRect v18;

  self->_didBeginTracking = 0;
  p_scrubbingControl = &self->_scrubbingControl;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_scrubbingControl);
  objc_msgSend(v6, "locationInView:", WeakRetained);
  v9 = v8;
  v11 = v10;

  objc_msgSend(WeakRetained, "thumbHitRect");
  v17.x = v9;
  v17.y = v11;
  v12 = CGRectContainsPoint(v18, v17);
  if (v12)
  {
    self->_previousLocationInView.x = v9;
    self->_previousLocationInView.y = v11;
    self->_beginLocationInView.x = v9;
    self->_beginLocationInView.y = v11;
    -[MPDetailScrubController _beginScrubbing](self, "_beginScrubbing");
    feedbackGenerator = self->_feedbackGenerator;
    if (!feedbackGenerator)
    {
      v14 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
      v15 = self->_feedbackGenerator;
      self->_feedbackGenerator = v14;

      feedbackGenerator = self->_feedbackGenerator;
    }
    -[UISelectionFeedbackGenerator prepare](feedbackGenerator, "prepare");
  }

  return v12;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  MPDetailedScrubbing **p_scrubbingControl;
  id v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  double v14;
  int64_t v15;
  id v16;
  float v17;
  float v18;
  char isKindOfClass;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float v25;
  float v26;
  double v27;
  float v28;
  float v29;
  double v30;
  double v31;
  float v32;
  float v33;
  float v34;
  double v35;
  float v36;
  double v37;
  float v38;

  p_scrubbingControl = &self->_scrubbingControl;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_scrubbingControl);
  objc_msgSend(v6, "locationInView:", WeakRetained);
  v9 = v8;
  v11 = v10;

  v12 = 1.0;
  if (self->_detailedScrubbingEnabled
    && -[MPDetailScrubController durationAllowsForDetailedScrubbing](self, "durationAllowsForDetailedScrubbing"))
  {
    -[MPDetailScrubController scaleForVerticalPosition:](self, "scaleForVerticalPosition:", v11);
    v12 = v13;
    v14 = v13;
    if (v14 <= 0.1)
    {
      v15 = 3;
    }
    else if (v14 > 0.35 || v14 <= 0.1)
    {
      v15 = v14 > 0.35 && (unint64_t)(v12 <= 0.75);
    }
    else
    {
      v15 = 2;
    }
    if (self->_currentScrubSpeed != v15)
    {
      self->_currentScrubSpeed = v15;
      -[UISelectionFeedbackGenerator selectionChanged](self->_feedbackGenerator, "selectionChanged");
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v16, "detailScrubController:didChangeScrubSpeed:", self, self->_currentScrubSpeed);

    }
  }
  -[MPDetailScrubController _minimumScale](self, "_minimumScale");
  if (v17 < v12)
    v17 = v12;
  if (!self->_didBeginTracking)
  {
    if (vabdd_f64(self->_beginLocationInView.x, v9) < 12.0)
      goto LABEL_32;
    self->_didBeginTracking = 1;
    self->_accumulatedDelta = 0.0;
  }
  v18 = fminf(v17, 1.0);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(WeakRetained, "bounds");
  v21 = v20;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(WeakRetained, "trackRectForBounds:");
    v21 = v22;
  }
  v23 = v9 - self->_previousLocationInView.x;
  objc_msgSend(WeakRetained, "maximumValue");
  v25 = v24;
  objc_msgSend(WeakRetained, "minimumValue");
  v27 = v23 * ((float)(v25 - v26) / v21);
  objc_msgSend(WeakRetained, "value");
  v29 = v28;
  v30 = v28;
  v31 = v28 + v27 * v18;
  objc_msgSend(WeakRetained, "minimumValue");
  v33 = v32;
  objc_msgSend(WeakRetained, "maximumValue");
  v35 = v34;
  if (v31 <= v35)
    v35 = v31;
  if (v35 <= v33)
    v35 = v33;
  v36 = v35;
  if (vabds_f32(v36, v29) > 0.00000011921)
    self->_needsCommit = 1;
  if (vabdd_f64(self->_lastCommittedLocationInView.x, v9) <= 8.0
    && vabdd_f64(self->_lastCommittedLocationInView.y, v11) <= 4.0)
  {
    v38 = v35 - v30 + self->_accumulatedDelta;
    self->_accumulatedDelta = v38;
  }
  else
  {
    v37 = v35 + self->_accumulatedDelta;
    *(float *)&v37 = v37;
    -[MPDetailScrubController _commitValue:](self, "_commitValue:", v37);
    self->_accumulatedDelta = 0.0;
    self->_lastCommittedLocationInView.x = v9;
    self->_lastCommittedLocationInView.y = v11;
  }
LABEL_32:
  self->_previousLocationInView.x = v9;
  self->_previousLocationInView.y = v11;

  return 1;
}

- (BOOL)durationAllowsForDetailedScrubbing
{
  double duration;
  id WeakRetained;
  BOOL v4;
  CGRect v6;

  duration = self->_duration;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(WeakRetained, "bounds");
  v4 = duration / CGRectGetWidth(v6) >= 0.1;

  return v4;
}

- (float)scaleForVerticalPosition:(double)a3
{
  void *v5;
  uint64_t v6;
  double scrubbingVerticalRange;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  float v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  float v18;
  float v19;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  scrubbingVerticalRange = self->_scrubbingVerticalRange;
  v8 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (scrubbingVerticalRange >= v8)
    scrubbingVerticalRange = v8;
  if (v6 == 1)
    v9 = 20.0;
  else
    v9 = 0.0;
  if (v9 >= scrubbingVerticalRange)
    v10 = v9;
  else
    v10 = scrubbingVerticalRange;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "userInterfaceIdiom") == 1)
    v12 = 20.0;
  else
    v12 = 0.0;
  v13 = v10 - v12;

  v14 = v13;
  v15 = self->_scrubbingVerticalRange;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "userInterfaceIdiom") == 1)
    v17 = 20.0;
  else
    v17 = 0.0;
  v18 = v14 / (v15 - v17);
  v19 = 1.0 - v18;

  return v19;
}

- (float)_minimumScale
{
  id WeakRetained;
  float Width;
  float duration;
  float v6;
  CGRect v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_msgSend(WeakRetained, "bounds");
  Width = CGRectGetWidth(v8);
  duration = self->_duration;
  v6 = (float)(Width / duration) / 20.0;

  return v6;
}

- (float)_scaleForIdealValueForVerticalPosition:(double)a3
{
  double scrubbingVerticalRange;
  double v4;
  double v5;
  BOOL v6;
  BOOL v7;
  double v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  scrubbingVerticalRange = self->_scrubbingVerticalRange;
  v4 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (scrubbingVerticalRange < v4)
    v4 = self->_scrubbingVerticalRange;
  v5 = v4 + -20.0;
  v6 = v4 == 20.0;
  v7 = v4 < 20.0;
  v8 = 0.0;
  if (!v7 && !v6)
    v8 = v5;
  v9 = v8;
  v10 = v9 / (scrubbingVerticalRange + -20.0);
  if (v10 <= 0.15)
  {
    v10 = v10 / 0.15;
    v11 = 0.33333;
  }
  else
  {
    v11 = 0.025;
  }
  v12 = powf(v10, v11);
  if (v12 <= 0.0)
    v13 = 1.0;
  else
    v13 = 1.0 - v12;
  if (v13 > 1.0)
    v13 = 1.0;
  return fmaxf(v13, 0.0);
}

- (void)_beginScrubbing
{
  id WeakRetained;

  if (!self->_isTracking)
  {
    self->_isTracking = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "detailScrubController:didChangeScrubSpeed:", self, 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "detailScrubControllerDidBeginScrubbing:", self);

  }
}

- (void)_endScrubbing
{
  id WeakRetained;

  if (self->_isTracking)
  {
    self->_isTracking = 0;
    self->_currentScrubSpeed = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "detailScrubControllerDidEndScrubbing:", self);

  }
}

- (void)_commitValue:(float)a3
{
  id WeakRetained;
  void *v6;
  char v7;
  double v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (self->_needsCommit)
  {
    v9 = WeakRetained;
    v7 = objc_opt_respondsToSelector();
    v6 = v9;
    if ((v7 & 1) != 0)
    {
      v8 = self->_duration * a3;
      *(float *)&v8 = v8;
      objc_msgSend(v9, "detailScrubController:didChangeValue:", self, v8);
      v6 = v9;
      self->_needsCommit = 0;
    }
  }

}

- (MPDetailedScrubbing)scrubbingControl
{
  return (MPDetailedScrubbing *)objc_loadWeakRetained((id *)&self->_scrubbingControl);
}

- (void)setScrubbingControl:(id)a3
{
  objc_storeWeak((id *)&self->_scrubbingControl, a3);
}

- (MPDetailScrubControllerDelegate)delegate
{
  return (MPDetailScrubControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)scrubbingVerticalRange
{
  return self->_scrubbingVerticalRange;
}

- (void)setScrubbingVerticalRange:(double)a3
{
  self->_scrubbingVerticalRange = a3;
}

- (BOOL)detailedScrubbingEnabled
{
  return self->_detailedScrubbingEnabled;
}

- (void)setDetailedScrubbingEnabled:(BOOL)a3
{
  self->_detailedScrubbingEnabled = a3;
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (int64_t)currentScrubSpeed
{
  return self->_currentScrubSpeed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrubbingControl);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

@end

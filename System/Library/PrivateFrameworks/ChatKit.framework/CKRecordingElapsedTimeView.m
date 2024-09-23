@implementation CKRecordingElapsedTimeView

- (void)_commonCAMElapsedTimeViewInitialization
{
  NSDateComponentsFormatter *v3;
  NSDateComponentsFormatter *durationFormatter;
  id v5;
  UILabel *v6;
  UILabel *timeLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UIView *v14;
  UIView *recordingDotView;
  UIView *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (NSDateComponentsFormatter *)objc_opt_new();
  durationFormatter = self->__durationFormatter;
  self->__durationFormatter = v3;

  -[NSDateComponentsFormatter setUnitsStyle:](self->__durationFormatter, "setUnitsStyle:", 0);
  -[NSDateComponentsFormatter setZeroFormattingBehavior:](self->__durationFormatter, "setZeroFormattingBehavior:", 0x10000);
  -[NSDateComponentsFormatter setAllowedUnits:](self->__durationFormatter, "setAllowedUnits:", 224);
  v5 = objc_alloc(MEMORY[0x1E0CEA700]);
  v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  timeLabel = self->__timeLabel;
  self->__timeLabel = v6;

  v8 = self->__timeLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithName:size:", CFSTR("DINAlternate-Bold"), 20.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8, "setFont:", v9);

  v10 = self->__timeLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v10, "setTextColor:", v11);

  -[UILabel setTextAlignment:](self->__timeLabel, "setTextAlignment:", 1);
  v12 = self->__timeLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v12, "setBackgroundColor:", v13);

  v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  recordingDotView = self->__recordingDotView;
  self->__recordingDotView = v14;

  -[UIView setAlpha:](self->__recordingDotView, "setAlpha:", 0.0);
  v16 = self->__recordingDotView;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "theme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activeRecordingDotColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v16, "setBackgroundColor:", v19);

  -[CKRecordingElapsedTimeView addSubview:](self, "addSubview:", self->__timeLabel);
  -[CKRecordingElapsedTimeView addSubview:](self, "addSubview:", self->__recordingDotView);
  -[CKRecordingElapsedTimeView _update:](self, "_update:", 0);
}

- (CKRecordingElapsedTimeView)initWithFrame:(CGRect)a3
{
  CKRecordingElapsedTimeView *v3;
  CKRecordingElapsedTimeView *v4;
  CKRecordingElapsedTimeView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKRecordingElapsedTimeView;
  v3 = -[CKRecordingElapsedTimeView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKRecordingElapsedTimeView _commonCAMElapsedTimeViewInitialization](v3, "_commonCAMElapsedTimeViewInitialization");
    v5 = v4;
  }

  return v4;
}

- (CKRecordingElapsedTimeView)initWithCoder:(id)a3
{
  CKRecordingElapsedTimeView *v3;
  CKRecordingElapsedTimeView *v4;
  CKRecordingElapsedTimeView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKRecordingElapsedTimeView;
  v3 = -[CKRecordingElapsedTimeView initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CKRecordingElapsedTimeView _commonCAMElapsedTimeViewInitialization](v3, "_commonCAMElapsedTimeViewInitialization");
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  NSTimer *updateTimer;
  NSDate *startTime;
  objc_super v5;

  updateTimer = self->__updateTimer;
  self->__updateTimer = 0;

  startTime = self->__startTime;
  self->__startTime = 0;

  v5.receiver = self;
  v5.super_class = (Class)CKRecordingElapsedTimeView;
  -[CKRecordingElapsedTimeView dealloc](&v5, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->__timeLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MinX;
  void *v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v18.receiver = self;
  v18.super_class = (Class)CKRecordingElapsedTimeView;
  -[CKRecordingElapsedTimeView layoutSubviews](&v18, sel_layoutSubviews);
  -[CKRecordingElapsedTimeView bounds](self, "bounds");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  CGRectGetMinX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  CGRectGetMinY(v20);
  UIRectCenteredIntegralRectScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MinX = CGRectGetMinX(v21);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = MinX - (1.0 / v15 + 12.0);

  -[UIView setFrame:](self->__recordingDotView, "setFrame:", v16, v8, v10, v12);
  -[UIView layer](self->__recordingDotView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", v12 * 0.5);

  -[UILabel setFrame:](self->__timeLabel, "setFrame:", x, y, width, height);
}

- (void)_update:(id)a3
{
  double v4;
  id v5;

  -[NSDate timeIntervalSinceNow](self->__startTime, "timeIntervalSinceNow", a3);
  -[NSDateComponentsFormatter stringFromTimeInterval:](self->__durationFormatter, "stringFromTimeInterval:", 0.0 - v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->__timeLabel, "setText:", v5);

}

- (void)startTimer
{
  NSDate *v3;
  NSDate *startTime;
  NSTimer *v5;
  NSTimer *updateTimer;
  void *v7;
  void *v8;

  v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  startTime = self->__startTime;
  self->__startTime = v3;

  -[NSTimer invalidate](self->__updateTimer, "invalidate");
  v5 = (NSTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", self->__startTime, self, sel__update_, 0, 1, 0.2);
  updateTimer = self->__updateTimer;
  self->__updateTimer = v5;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTimer:forMode:", self->__updateTimer, *MEMORY[0x1E0C99748]);

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTimer:forMode:", self->__updateTimer, *MEMORY[0x1E0CEBDA0]);

  -[CKRecordingElapsedTimeView _beginRecordingAnimation](self, "_beginRecordingAnimation");
}

- (void)endTimer
{
  NSTimer *updateTimer;
  NSDate *startTime;

  -[NSTimer invalidate](self->__updateTimer, "invalidate");
  updateTimer = self->__updateTimer;
  self->__updateTimer = 0;

  startTime = self->__startTime;
  self->__startTime = 0;

  -[CKRecordingElapsedTimeView _endRecordingAnimation](self, "_endRecordingAnimation");
}

- (void)resetTimer
{
  -[CKRecordingElapsedTimeView endTimer](self, "endTimer");
  -[CKRecordingElapsedTimeView _update:](self, "_update:", 0);
  -[CKRecordingElapsedTimeView startTimer](self, "startTimer");
}

- (void)_beginRecordingAnimation
{
  void *v3;
  float v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  -[UIView setAlpha:](self->__recordingDotView, "setAlpha:", 1.0);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValues:", &unk_1E286F730);
  objc_msgSend(v3, "setKeyTimes:", &unk_1E286F748);
  UIAnimationDragCoefficient();
  objc_msgSend(v3, "setDuration:", v4 * 0.82);
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  LODWORD(v5) = 2139095040;
  objc_msgSend(v3, "setRepeatCount:", v5);
  LODWORD(v6) = 998490346;
  LODWORD(v7) = 1013385185;
  LODWORD(v8) = 1.0;
  LODWORD(v9) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v8, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  LODWORD(v11) = 1063043161;
  LODWORD(v12) = 993744730;
  LODWORD(v13) = 1002018232;
  LODWORD(v14) = 1065285772;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunctions:", v16);

  -[UIView layer](self->__recordingDotView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", v3, CFSTR("recordingAnimation"));

}

- (void)_endRecordingAnimation
{
  id v3;

  -[UIView layer](self->__recordingDotView, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");
  -[UIView setAlpha:](self->__recordingDotView, "setAlpha:", 0.0);

}

- (NSDateComponentsFormatter)_durationFormatter
{
  return self->__durationFormatter;
}

- (UILabel)_timeLabel
{
  return self->__timeLabel;
}

- (UIView)_recordingDotView
{
  return self->__recordingDotView;
}

- (NSTimer)_updateTimer
{
  return self->__updateTimer;
}

- (NSDate)_startTime
{
  return self->__startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__startTime, 0);
  objc_storeStrong((id *)&self->__updateTimer, 0);
  objc_storeStrong((id *)&self->__recordingDotView, 0);
  objc_storeStrong((id *)&self->__timeLabel, 0);
  objc_storeStrong((id *)&self->__durationFormatter, 0);
}

@end

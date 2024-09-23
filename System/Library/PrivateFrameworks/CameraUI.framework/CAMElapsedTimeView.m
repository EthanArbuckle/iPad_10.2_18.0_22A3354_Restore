@implementation CAMElapsedTimeView

+ (id)elapsedTimeFormatter
{
  if (elapsedTimeFormatter_onceToken != -1)
    dispatch_once(&elapsedTimeFormatter_onceToken, &__block_literal_global_18);
  return (id)elapsedTimeFormatter_formatter;
}

uint64_t __42__CAMElapsedTimeView_elapsedTimeFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)elapsedTimeFormatter_formatter;
  elapsedTimeFormatter_formatter = (uint64_t)v0;

  objc_msgSend((id)elapsedTimeFormatter_formatter, "setUnitsStyle:", 0);
  objc_msgSend((id)elapsedTimeFormatter_formatter, "setZeroFormattingBehavior:", 0x10000);
  return objc_msgSend((id)elapsedTimeFormatter_formatter, "setAllowedUnits:", 224);
}

- (void)_commonCAMElapsedTimeViewInitializationWithLayoutStyle:(int64_t)a3
{
  id v4;
  UILabel *v5;
  UILabel *timeLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIImageView *v18;
  UIImageView *backgroundView;
  id v20;
  CGSize v21;

  self->_layoutStyle = a3;
  v4 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  timeLabel = self->__timeLabel;
  self->__timeLabel = v5;

  v7 = self->__timeLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v7, "setTextColor:", v8);

  -[UILabel setTextAlignment:](self->__timeLabel, "setTextAlignment:", 1);
  v9 = self->__timeLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[CAMElapsedTimeView _updateFont](self, "_updateFont");
  -[CAMElapsedTimeView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;
  v21.width = 5.0;
  v21.height = 5.0;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v13);

  CAMRedColor();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFill");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 5.0, 5.0, 2.0);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resizableImageWithCapInsets:", 2.0, 2.0, 2.0, 2.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "imageWithRenderingMode:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  v18 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v17);
  backgroundView = self->__backgroundView;
  self->__backgroundView = v18;

  -[CAMElapsedTimeView _updateBackgroundViewAnimated:](self, "_updateBackgroundViewAnimated:", 0);
  -[CAMElapsedTimeView addSubview:](self, "addSubview:", self->__backgroundView);
  -[CAMElapsedTimeView addSubview:](self, "addSubview:", self->__timeLabel);
  -[CAMElapsedTimeView _updateText](self, "_updateText");

}

- (CAMElapsedTimeView)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMElapsedTimeView initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (CAMElapsedTimeView)initWithLayoutStyle:(int64_t)a3
{
  CAMElapsedTimeView *v4;
  CAMElapsedTimeView *v5;
  CAMElapsedTimeView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMElapsedTimeView;
  v4 = -[CAMElapsedTimeView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[CAMElapsedTimeView _commonCAMElapsedTimeViewInitializationWithLayoutStyle:](v4, "_commonCAMElapsedTimeViewInitializationWithLayoutStyle:", a3);
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  NSTimer *updateTimer;
  objc_super v4;

  -[NSTimer invalidate](self->__updateTimer, "invalidate");
  updateTimer = self->__updateTimer;
  self->__updateTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMElapsedTimeView;
  -[CAMElapsedTimeView dealloc](&v4, sel_dealloc);
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMElapsedTimeView _updateFont](self, "_updateFont");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[UILabel intrinsicContentSize](self->__timeLabel, "intrinsicContentSize");
  v3 = v2;
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0D0D028], "_defaultTextInsets");
  UICeilToViewScale();
  v7 = v3 + v6;
  UICeilToViewScale();
  v9 = v5 + v8;
  v10 = v7;
  result.height = v9;
  result.width = v10;
  return result;
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
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMElapsedTimeView;
  -[CAMElapsedTimeView layoutSubviews](&v13, sel_layoutSubviews);
  -[CAMElapsedTimeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMElapsedTimeView _timeLabel](self, "_timeLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CAMElapsedTimeView _backgroundView](self, "_backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

}

- (void)_updateFont
{
  void *v3;
  void *v4;
  id v5;

  -[CAMElapsedTimeView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[CAMFont cameraTimerFontForContentSize:layoutStyle:](CAMFont, "cameraTimerFontForContentSize:layoutStyle:", v5, -[CAMElapsedTimeView layoutStyle](self, "layoutStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->__timeLabel, "setFont:", v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMElapsedTimeView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[CAMElapsedTimeView _updateFont](self, "_updateFont");
    -[CAMElapsedTimeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[CAMElapsedTimeView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateText
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[NSDate timeIntervalSinceNow](self->__startTime, "timeIntervalSinceNow");
  v4 = 0.0 - v3;
  objc_msgSend((id)objc_opt_class(), "elapsedTimeFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromTimeInterval:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->__timeLabel, "setText:", v6);
}

- (void)startTimer
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  NSTimer *updateTimer;
  NSTimer *v12;
  NSTimer *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v16 = v3;
  if (self->__startTime)
  {
    -[CAMElapsedTimeView _pausedTime](self, "_pausedTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMElapsedTimeView _pausedTime](self, "_pausedTime");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", v6);
      v8 = v7;

      -[CAMElapsedTimeView _startTime](self, "_startTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateByAddingTimeInterval:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMElapsedTimeView _setStartTime:](self, "_setStartTime:", v10);

      -[CAMElapsedTimeView set_pausedTime:](self, "set_pausedTime:", 0);
      -[CAMElapsedTimeView _stopPausedAnimation](self, "_stopPausedAnimation");
    }
  }
  else
  {
    -[CAMElapsedTimeView _setStartTime:](self, "_setStartTime:", v3);
  }
  -[NSTimer invalidate](self->__updateTimer, "invalidate");
  updateTimer = self->__updateTimer;
  self->__updateTimer = 0;

  v12 = (NSTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v16, self, sel__updateForTimer_, 0, 1, 0.2);
  v13 = self->__updateTimer;
  self->__updateTimer = v12;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTimer:forMode:", self->__updateTimer, *MEMORY[0x1E0C99748]);

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addTimer:forMode:", self->__updateTimer, *MEMORY[0x1E0DC55B0]);

}

- (void)_setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->__startTime, a3);
  -[CAMElapsedTimeView _updateText](self, "_updateText");
}

- (void)endTimer
{
  NSTimer *updateTimer;

  -[NSTimer invalidate](self->__updateTimer, "invalidate");
  updateTimer = self->__updateTimer;
  self->__updateTimer = 0;

  -[CAMElapsedTimeView _setStartTime:](self, "_setStartTime:", 0);
  -[CAMElapsedTimeView set_pausedTime:](self, "set_pausedTime:", 0);
  -[CAMElapsedTimeView _stopPausedAnimation](self, "_stopPausedAnimation");
}

- (void)resetTimer
{
  -[CAMElapsedTimeView endTimer](self, "endTimer");
  -[CAMElapsedTimeView _updateText](self, "_updateText");
  -[CAMElapsedTimeView startTimer](self, "startTimer");
}

- (BOOL)isTimerPaused
{
  void *v2;
  BOOL v3;

  -[CAMElapsedTimeView _pausedTime](self, "_pausedTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setTimerPaused:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSTimer *updateTimer;

  v3 = a3;
  if (-[CAMElapsedTimeView isTimerPaused](self, "isTimerPaused") != a3)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMElapsedTimeView set_pausedTime:](self, "set_pausedTime:", v5);

      -[NSTimer invalidate](self->__updateTimer, "invalidate");
      updateTimer = self->__updateTimer;
      self->__updateTimer = 0;

      -[CAMElapsedTimeView _startPausedAnimation](self, "_startPausedAnimation");
    }
    else
    {
      -[CAMElapsedTimeView startTimer](self, "startTimer");
    }
  }
}

- (void)_startPausedAnimation
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  id v6;

  -[CAMElapsedTimeView _backgroundView](self, "_backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFromValue:", &unk_1EA3B18F0);
  objc_msgSend(v3, "setToValue:", &unk_1EA3B1900);
  objc_msgSend(v3, "setDuration:", 1.0);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v4);

  objc_msgSend(v3, "setAutoreverses:", 1);
  LODWORD(v5) = 2139095040;
  objc_msgSend(v3, "setRepeatCount:", v5);
  objc_msgSend(v6, "addAnimation:forKey:", v3, CFSTR("opacity"));

}

- (void)_stopPausedAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CAMElapsedTimeView _backgroundView](self, "_backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "animationForKey:", CFSTR("opacity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v11, "presentationLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = v4;
    else
      v5 = v11;
    v6 = v5;

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "opacity");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", v9);

    objc_msgSend(v7, "setToValue:", &unk_1EA3B18F0);
    objc_msgSend(v7, "setDuration:", 0.4);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimingFunction:", v10);

    objc_msgSend(v11, "removeAnimationForKey:", CFSTR("opacity"));
    objc_msgSend(v11, "addAnimation:forKey:", v7, CFSTR("opacity"));

  }
}

- (BOOL)isShowingBackground
{
  return -[CAMElapsedTimeView backgroundStyle](self, "backgroundStyle") != 0;
}

- (void)setShowingBackground:(BOOL)a3
{
  -[CAMElapsedTimeView setShowingBackground:animated:](self, "setShowingBackground:animated:", a3, 0);
}

- (void)setShowingBackground:(BOOL)a3 animated:(BOOL)a4
{
  -[CAMElapsedTimeView setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", a3, a4);
}

- (void)setBackgroundStyle:(int64_t)a3
{
  -[CAMElapsedTimeView setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", a3, 0);
}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    -[CAMElapsedTimeView _updateBackgroundViewAnimated:](self, "_updateBackgroundViewAnimated:", a4);
  }
}

- (void)_updateBackgroundViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a3;
  switch(-[CAMElapsedTimeView backgroundStyle](self, "backgroundStyle"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      CAMRedColor();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  if (v3)
    v6 = 0.5;
  else
    v6 = 0.0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CAMElapsedTimeView__updateBackgroundViewAnimated___block_invoke;
  v8[3] = &unk_1EA328A40;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  +[CAMView animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](CAMView, "animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v8, 0, v6, 1.0, 0.0);

}

void __52__CAMElapsedTimeView__updateBackgroundViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v1);

}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (UILabel)_timeLabel
{
  return self->__timeLabel;
}

- (UIImageView)_backgroundView
{
  return self->__backgroundView;
}

- (NSTimer)_updateTimer
{
  return self->__updateTimer;
}

- (NSDate)_startTime
{
  return self->__startTime;
}

- (NSDate)_pausedTime
{
  return self->__pausedTime;
}

- (void)set_pausedTime:(id)a3
{
  self->__pausedTime = (NSDate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__startTime, 0);
  objc_storeStrong((id *)&self->__updateTimer, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__timeLabel, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
}

@end

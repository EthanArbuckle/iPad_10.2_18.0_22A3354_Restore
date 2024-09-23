@implementation HUTimerCountdownView

- (HUTimerCountdownView)initWithRemainingTime:(double)a3 state:(unint64_t)a4 duration:(double)a5 delegate:(id)a6
{
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  HUTimerCountdownView *v16;
  HUTimerCountdownView *v17;
  uint64_t v18;
  UIView *circleBackgroundView;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  MTUITimerCountdownView *countdownView;
  uint64_t v27;
  UIButton *pauseResumeButton;
  void *v29;
  objc_super v31;

  v11 = a6;
  v31.receiver = self;
  v31.super_class = (Class)HUTimerCountdownView;
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16 = -[HUTimerCountdownView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v13, v14, v15);
  v17 = v16;
  if (v16)
  {
    v16->_remainingTime = a3;
    v16->_state = a4;
    v16->_duration = a5;
    objc_storeStrong((id *)&v16->_delegate, a6);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v12, v13, v14, v15);
    circleBackgroundView = v17->_circleBackgroundView;
    v17->_circleBackgroundView = (UIView *)v18;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17->_circleBackgroundView, "setBackgroundColor:", v20);

    if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTimerCountdownView setTintColor:](v17, "setTintColor:", v21);

    }
    v22 = objc_alloc(MEMORY[0x1E0D4FAE0]);
    -[HUTimerCountdownView tintColor](v17, "tintColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v22, "initWithBarColor:backgroundBarColor:barWidth:remainingTime:duration:", v23, v24, 2.0, a3, a5);
    countdownView = v17->_countdownView;
    v17->_countdownView = (MTUITimerCountdownView *)v25;

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v27 = objc_claimAutoreleasedReturnValue();
    pauseResumeButton = v17->_pauseResumeButton;
    v17->_pauseResumeButton = (UIButton *)v27;

    -[UIButton addTarget:action:forControlEvents:](v17->_pauseResumeButton, "addTarget:action:forControlEvents:", v17, sel_toggle_, 64);
    -[HUTimerCountdownView addSubview:](v17, "addSubview:", v17->_circleBackgroundView);
    -[HUTimerCountdownView addSubview:](v17, "addSubview:", v17->_countdownView);
    -[HUTimerCountdownView addSubview:](v17, "addSubview:", v17->_pauseResumeButton);
    -[HUTimerCountdownView countdownView](v17, "countdownView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v17->_currentState = 0;
    -[HUTimerCountdownView updateToNewState:](v17, "updateToNewState:", a4);
  }

  return v17;
}

- (HUTimerCountdownView)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCoder_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTimerCountdownView.m"), 67, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTimerCountdownView initWithCoder:]",
    v6);

  return 0;
}

- (HUTimerCountdownView)initWithFrame:(CGRect)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithFrame_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTimerCountdownView.m"), 72, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTimerCountdownView initWithFrame:]",
    v6);

  return 0;
}

- (void)layoutSubviews
{
  double MidX;
  double MidY;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)HUTimerCountdownView;
  -[HUTimerCountdownView layoutSubviews](&v29, sel_layoutSubviews);
  -[HUTimerCountdownView bounds](self, "bounds");
  MidX = CGRectGetMidX(v30);
  -[HUTimerCountdownView bounds](self, "bounds");
  MidY = CGRectGetMidY(v31);
  -[HUTimerCountdownView bounds](self, "bounds");
  v6 = v5 + -2.0;
  -[HUTimerCountdownView bounds](self, "bounds");
  v8 = v7 + -2.0;
  -[HUTimerCountdownView circleBackgroundView](self, "circleBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v6, v8);

  -[HUTimerCountdownView circleBackgroundView](self, "circleBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11 * 0.5;
  -[HUTimerCountdownView circleBackgroundView](self, "circleBackgroundView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setContinuousCornerRadius:", v12);

  -[HUTimerCountdownView circleBackgroundView](self, "circleBackgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCenter:", MidX, MidY);

  -[HUTimerCountdownView bounds](self, "bounds");
  v16 = v15;
  -[HUTimerCountdownView bounds](self, "bounds");
  v18 = v17;
  -[HUTimerCountdownView countdownView](self, "countdownView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBounds:", 0.0, 0.0, v16, v18);

  -[HUTimerCountdownView countdownView](self, "countdownView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCenter:", MidX, MidY);

  -[HUTimerCountdownView bounds](self, "bounds");
  v22 = v21 * 0.7;
  -[HUTimerCountdownView bounds](self, "bounds");
  v24 = v23 * 0.7;
  -[HUTimerCountdownView pauseResumeButton](self, "pauseResumeButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBounds:", 0.0, 0.0, v22, v24);

  -[HUTimerCountdownView pauseResumeButton](self, "pauseResumeButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCenter:", MidX, MidY);

  -[HUTimerCountdownView tintColor](self, "tintColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerCountdownView pauseResumeButton](self, "pauseResumeButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTintColor:", v27);

}

- (void)updateToNewTime:(double)a3
{
  id v4;

  -[HUTimerCountdownView countdownView](self, "countdownView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemainingTime:", a3);

}

- (void)updateToNewState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint8_t buf[4];
  HUTimerCountdownView *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[HUTimerCountdownView currentState](self, "currentState") != a3)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v17 = self;
      v18 = 2080;
      v19 = "-[HUTimerCountdownView updateToNewState:]";
      v20 = 2048;
      v21 = -[HUTimerCountdownView currentState](self, "currentState");
      v22 = 2048;
      v23 = a3;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s updating timer: old state (%lu) to newState (%lu)", buf, 0x2Au);
    }

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 7, 20.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 1)
    {
      -[HUTimerCountdownView pauseResumeButton](self, "pauseResumeButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHidden:", 1);

      -[HUTimerCountdownView circleBackgroundView](self, "circleBackgroundView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 1);

      -[HUTimerCountdownView countdownView](self, "countdownView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 1);
    }
    else
    {
      if (a3 == 3)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("pause.fill"), v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUTimerCountdownView pauseResumeButton](self, "pauseResumeButton");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setImage:forState:", v7, 0);

        -[HUTimerCountdownView countdownView](self, "countdownView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isStarted");

        -[HUTimerCountdownView countdownView](self, "countdownView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v15;
        if (v14)
          objc_msgSend(v15, "resume");
        else
          objc_msgSend(v15, "start");
      }
      else
      {
        if (a3 != 2)
        {
          NSLog(CFSTR("Unexpected %s Timer State: %lu"), "-[HUTimerCountdownView updateToNewState:]", a3);
LABEL_15:
          -[HUTimerCountdownView setCurrentState:](self, "setCurrentState:", a3);

          return;
        }
        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("play.fill"), v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUTimerCountdownView pauseResumeButton](self, "pauseResumeButton");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setImage:forState:", v7, 0);

        -[HUTimerCountdownView countdownView](self, "countdownView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "pause");
      }

    }
    goto LABEL_15;
  }
}

- (void)toggle:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  HUTimerCountdownView *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2080;
    v9 = "-[HUTimerCountdownView toggle:]";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User toggled pause/resume timer", (uint8_t *)&v6, 0x16u);
  }

  -[HUTimerCountdownView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleTimer");

}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  self->_remainingTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (UIView)circleBackgroundView
{
  return self->_circleBackgroundView;
}

- (void)setCircleBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_circleBackgroundView, a3);
}

- (MTUITimerCountdownView)countdownView
{
  return self->_countdownView;
}

- (void)setCountdownView:(id)a3
{
  objc_storeStrong((id *)&self->_countdownView, a3);
}

- (HUTimerCountdownDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (UIButton)pauseResumeButton
{
  return self->_pauseResumeButton;
}

- (void)setPauseResumeButton:(id)a3
{
  objc_storeStrong((id *)&self->_pauseResumeButton, a3);
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseResumeButton, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_circleBackgroundView, 0);
}

@end

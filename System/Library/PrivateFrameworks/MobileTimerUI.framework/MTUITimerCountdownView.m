@implementation MTUITimerCountdownView

- (MTUITimerCountdownView)initWithBarColor:(id)a3 backgroundBarColor:(id)a4 barWidth:(double)a5
{
  id v8;
  id v9;
  MTUITimerCountdownView *v10;
  MTUITimerCountdownView *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTUITimerCountdownView;
  v10 = -[MTUITimerCountdownView init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[MTUITimerCountdownView setBarColor:](v10, "setBarColor:", v8);
    -[MTUITimerCountdownView setBarWidth:](v11, "setBarWidth:", a5);
    -[MTUITimerCountdownView setBackgroundBarColor:](v11, "setBackgroundBarColor:", v9);
  }

  return v11;
}

- (MTUITimerCountdownView)initWithBarColor:(id)a3 backgroundBarColor:(id)a4 barWidth:(double)a5 remainingTime:(double)a6 duration:(double)a7
{
  MTUITimerCountdownView *v9;
  MTUITimerCountdownView *v10;

  v9 = -[MTUITimerCountdownView initWithBarColor:backgroundBarColor:barWidth:](self, "initWithBarColor:backgroundBarColor:barWidth:", a3, a4, a5);
  v10 = v9;
  if (v9)
  {
    -[MTUITimerCountdownView setRemainingTime:](v9, "setRemainingTime:", a6);
    -[MTUITimerCountdownView setDuration:](v10, "setDuration:", a7);
  }
  return v10;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MTUITimerCountdownView;
  -[MTUITimerCountdownView layoutSubviews](&v24, sel_layoutSubviews);
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginTime");
  v5 = v4;

  if (v5 > 0.0)
  {
    if (-[MTUITimerCountdownView state](self, "state") == 2)
    {
      -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeOffset");
      v8 = v7;
    }
    else
    {
      v9 = CACurrentMediaTime();
      -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "beginTime");
      v8 = v9 - v10;
    }

    -[MTUITimerCountdownView remainingTime](self, "remainingTime");
    -[MTUITimerCountdownView setRemainingTime:](self, "setRemainingTime:", v11 - v8);
  }
  -[MTUITimerCountdownView mainLayer](self, "mainLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFromSuperlayer");

  v13 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[MTUITimerCountdownView setMainLayer:](self, "setMainLayer:", v13);

  -[MTUITimerCountdownView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUITimerCountdownView mainLayer](self, "mainLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSublayer:", v15);

  -[MTUITimerCountdownView frame](self, "frame");
  v17 = v16;
  -[MTUITimerCountdownView frame](self, "frame");
  v19 = v18;
  -[MTUITimerCountdownView mainLayer](self, "mainLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", 0.0, 0.0, v17, v19);

  -[MTUITimerCountdownView setupBackgroundCircle](self, "setupBackgroundCircle");
  -[MTUITimerCountdownView remainingTime](self, "remainingTime");
  v22 = v21;
  -[MTUITimerCountdownView duration](self, "duration");
  -[MTUITimerCountdownView setAnimationRemainingTime:totalTime:](self, "setAnimationRemainingTime:totalTime:", v22, v23);
  if (-[MTUITimerCountdownView state](self, "state") == 1)
    -[MTUITimerCountdownView start](self, "start");
}

- (void)setupBackgroundCircle
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  -[MTUITimerCountdownView backgroundCircleLayer](self, "backgroundCircleLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MTUITimerCountdownView backgroundCircleLayer](self, "backgroundCircleLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperlayer");

  }
  v5 = (void *)MEMORY[0x24BDF6870];
  -[MTUITimerCountdownView frame](self, "frame");
  v7 = v6 * 0.5;
  -[MTUITimerCountdownView frame](self, "frame");
  v9 = v8 * 0.5;
  -[MTUITimerCountdownView frame](self, "frame");
  v11 = v10 * 0.5;
  -[MTUITimerCountdownView barWidth](self, "barWidth");
  v13 = v11 - v12 * 0.5;
  -[MTUITimerCountdownView degToRad:](self, "degToRad:", -90.0);
  v15 = v14;
  -[MTUITimerCountdownView degToRad:](self, "degToRad:", 270.0);
  objc_msgSend(v5, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v7, v9, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_new();
  -[MTUITimerCountdownView setBackgroundCircleLayer:](self, "setBackgroundCircleLayer:", v18);

  v33 = objc_retainAutorelease(v17);
  v19 = objc_msgSend(v33, "CGPath");
  -[MTUITimerCountdownView backgroundCircleLayer](self, "backgroundCircleLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPath:", v19);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = objc_msgSend(v21, "CGColor");
  -[MTUITimerCountdownView backgroundCircleLayer](self, "backgroundCircleLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFillColor:", v22);

  -[MTUITimerCountdownView backgroundBarColor](self, "backgroundBarColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = objc_msgSend(v24, "CGColor");
  -[MTUITimerCountdownView backgroundCircleLayer](self, "backgroundCircleLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setStrokeColor:", v25);

  -[MTUITimerCountdownView barWidth](self, "barWidth");
  v28 = v27;
  -[MTUITimerCountdownView backgroundCircleLayer](self, "backgroundCircleLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLineWidth:", v28);

  -[MTUITimerCountdownView backgroundCircleLayer](self, "backgroundCircleLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setStrokeEnd:", 1.0);

  -[MTUITimerCountdownView mainLayer](self, "mainLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUITimerCountdownView backgroundCircleLayer](self, "backgroundCircleLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSublayer:", v32);

}

- (void)setAnimationRemainingTime:(double)a3 totalTime:(double)a4
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  -[MTUITimerCountdownView setRemainingTime:](self, "setRemainingTime:");
  -[MTUITimerCountdownView setDuration:](self, "setDuration:", a4);
  -[MTUITimerCountdownView angleForValue:total:](self, "angleForValue:total:", a3, a4);
  v8 = v7;
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperlayer");

  }
  v11 = (void *)MEMORY[0x24BDF6870];
  -[MTUITimerCountdownView frame](self, "frame");
  v13 = v12 * 0.5;
  -[MTUITimerCountdownView frame](self, "frame");
  v15 = v14 * 0.5;
  -[MTUITimerCountdownView frame](self, "frame");
  v17 = v16 * 0.5;
  -[MTUITimerCountdownView barWidth](self, "barWidth");
  v19 = v17 - v18 * 0.5;
  -[MTUITimerCountdownView degToRad:](self, "degToRad:", -90.0);
  v21 = v20;
  -[MTUITimerCountdownView degToRad:](self, "degToRad:", v8);
  objc_msgSend(v11, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v13, v15, v19, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_opt_new();
  -[MTUITimerCountdownView setCountdownCircleLayer:](self, "setCountdownCircleLayer:", v24);

  v41 = objc_retainAutorelease(v23);
  v25 = objc_msgSend(v41, "CGPath");
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPath:", v25);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = objc_msgSend(v27, "CGColor");
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFillColor:", v28);

  -[MTUITimerCountdownView barColor](self, "barColor");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend(v30, "CGColor");
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setStrokeColor:", v31);

  -[MTUITimerCountdownView barWidth](self, "barWidth");
  v34 = v33;
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setLineWidth:", v34);

  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setStrokeEnd:", 1.0);

  v37 = *MEMORY[0x24BDE5CE8];
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setLineCap:", v37);

  -[MTUITimerCountdownView mainLayer](self, "mainLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addSublayer:", v40);

}

- (void)start
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MTUITimerCountdownView setState:](self, "setState:", 1);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MTUITimerCountdownView remainingTime](self, "remainingTime");
  objc_msgSend(v10, "setDuration:");
  objc_msgSend(v10, "setFromValue:", &unk_24F0196C8);
  objc_msgSend(v10, "setToValue:", &unk_24F0196E0);
  objc_msgSend(v10, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimingFunction:", v3);

  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v6 = v5;
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBeginTime:", v6);

  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStrokeEnd:", 0.0);

  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v10, CFSTR("MTUITimerCountdownViewAnimationKey"));

}

- (double)degToRad:(double)a3
{
  return a3 * 3.14159265 / 180.0;
}

- (double)angleForValue:(double)a3 total:(double)a4
{
  return a3 / a4 * 360.0 + -90.0;
}

- (void)pause
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  -[MTUITimerCountdownView setState:](self, "setState:", 2);
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v5 = v4;

  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 0;
  objc_msgSend(v6, "setSpeed:", v7);

  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeOffset:", v5);

}

- (void)stop
{
  id v3;

  -[MTUITimerCountdownView setState:](self, "setState:", 0);
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("MTUITimerCountdownViewAnimationKey"));

}

- (void)resume
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  -[MTUITimerCountdownView setState:](self, "setState:", 1);
  -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("MTUITimerCountdownViewAnimationKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeOffset");
    v7 = v6;

    -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1.0;
    objc_msgSend(v8, "setSpeed:", v9);

    -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimeOffset:", 0.0);

    -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBeginTime:", 0.0);

    -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    v14 = v13 - v7;

    -[MTUITimerCountdownView countdownCircleLayer](self, "countdownCircleLayer");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBeginTime:", v14);

  }
  else
  {
    -[MTUITimerCountdownView start](self, "start");
  }
}

- (BOOL)isStarted
{
  int64_t v3;

  v3 = -[MTUITimerCountdownView state](self, "state");
  if (v3 != 1)
    LOBYTE(v3) = -[MTUITimerCountdownView state](self, "state") == 2;
  return v3;
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

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CAShapeLayer)backgroundCircleLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 440, 1);
}

- (void)setBackgroundCircleLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (CAShapeLayer)countdownCircleLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 448, 1);
}

- (void)setCountdownCircleLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (UIColor)barColor
{
  return (UIColor *)objc_getProperty(self, a2, 456, 1);
}

- (void)setBarColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (UIColor)backgroundBarColor
{
  return (UIColor *)objc_getProperty(self, a2, 464, 1);
}

- (void)setBackgroundBarColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (double)barWidth
{
  return self->_barWidth;
}

- (void)setBarWidth:(double)a3
{
  self->_barWidth = a3;
}

- (CALayer)mainLayer
{
  return (CALayer *)objc_getProperty(self, a2, 480, 1);
}

- (void)setMainLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainLayer, 0);
  objc_storeStrong((id *)&self->_backgroundBarColor, 0);
  objc_storeStrong((id *)&self->_barColor, 0);
  objc_storeStrong((id *)&self->_countdownCircleLayer, 0);
  objc_storeStrong((id *)&self->_backgroundCircleLayer, 0);
}

@end

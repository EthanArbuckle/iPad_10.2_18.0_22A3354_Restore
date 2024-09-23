@implementation ARUIColorAnimation

+ (id)animationWithDuration:(double)a3 startTopColor:(id)a4 endTopColor:(id)a5 startBottomColor:(id)a6 endBottomColor:(id)a7 timingFunction:(id)a8 applier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  ARUIColorAnimation *v21;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = -[ARUIColorAnimation initWithDuration:startTopColor:endTopColor:startBottomColor:endBottomColor:timingFunction:applier:]([ARUIColorAnimation alloc], "initWithDuration:startTopColor:endTopColor:startBottomColor:endBottomColor:timingFunction:applier:", v20, v19, v18, v17, v16, v15, a3);

  return v21;
}

- (ARUIColorAnimation)initWithDuration:(double)a3 startTopColor:(id)a4 endTopColor:(id)a5 startBottomColor:(id)a6 endBottomColor:(id)a7 timingFunction:(id)a8 applier:(id)a9
{
  id v17;
  id v18;
  id v19;
  ARUIColorAnimation *v20;
  ARUIColorAnimation *v21;
  uint64_t v22;
  id applier;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a4;
  v26 = a5;
  v25 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)ARUIColorAnimation;
  v20 = -[ARUIColorAnimation init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_completed = 0;
    v20->_duration = a3;
    v20->_percent = 0.0;
    objc_storeStrong((id *)&v20->_startTopColor, a4);
    objc_storeStrong((id *)&v21->_currentTopColor, a4);
    objc_storeStrong((id *)&v21->_endTopColor, a5);
    objc_storeStrong((id *)&v21->_startBottomColor, a6);
    objc_storeStrong((id *)&v21->_currentBottomColor, a6);
    objc_storeStrong((id *)&v21->_endBottomColor, a7);
    objc_storeStrong((id *)&v21->_timingFunction, a8);
    v22 = MEMORY[0x2199A6364](v19);
    applier = v21->_applier;
    v21->_applier = (id)v22;

  }
  return v21;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should call -[ARUIColorAnimation completeAnimation] before deallocating"));
  v3.receiver = self;
  v3.super_class = (Class)ARUIColorAnimation;
  -[ARUIColorAnimation dealloc](&v3, sel_dealloc);
}

- (void)update:(double)a3
{
  float v5;
  float v6;
  float v7;
  const CGFloat *Components;
  const CGFloat *v9;
  id v10;
  float v11;
  float v12;
  double v13;
  float v14;
  float v15;
  double v16;
  float v17;
  float v18;
  double v19;
  float v20;
  float v21;
  UIColor *v22;
  UIColor *currentTopColor;
  const CGFloat *v24;
  const CGFloat *v25;
  id v26;
  float v27;
  float v28;
  double v29;
  float v30;
  float v31;
  double v32;
  float v33;
  float v34;
  double v35;
  float v36;
  float v37;
  UIColor *v38;
  UIColor *currentBottomColor;

  if (self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should not call update on a ARUIColorAnimation that has already completed"));
  v5 = self->_percent + a3 / self->_duration;
  self->_percent = ARUISaturate(v5);
  -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:");
  v7 = v6;
  Components = CGColorGetComponents(-[UIColor CGColor](self->_startTopColor, "CGColor"));
  v9 = CGColorGetComponents(-[UIColor CGColor](self->_endTopColor, "CGColor"));
  v10 = objc_alloc(MEMORY[0x24BEBD4B8]);
  v11 = *Components;
  v12 = *v9;
  v13 = ARUIMix(v11, v12, v7);
  v14 = Components[1];
  v15 = v9[1];
  v16 = ARUIMix(v14, v15, v7);
  v17 = Components[2];
  v18 = v9[2];
  v19 = ARUIMix(v17, v18, v7);
  v20 = Components[3];
  v21 = v9[3];
  v22 = (UIColor *)objc_msgSend(v10, "initWithRed:green:blue:alpha:", v13, v16, v19, ARUIMix(v20, v21, v7));
  currentTopColor = self->_currentTopColor;
  self->_currentTopColor = v22;

  v24 = CGColorGetComponents(-[UIColor CGColor](self->_startBottomColor, "CGColor"));
  v25 = CGColorGetComponents(-[UIColor CGColor](self->_endBottomColor, "CGColor"));
  v26 = objc_alloc(MEMORY[0x24BEBD4B8]);
  v27 = *v24;
  v28 = *v25;
  v29 = ARUIMix(v27, v28, v7);
  v30 = v24[1];
  v31 = v25[1];
  v32 = ARUIMix(v30, v31, v7);
  v33 = v24[2];
  v34 = v25[2];
  v35 = ARUIMix(v33, v34, v7);
  v36 = v24[3];
  v37 = v25[3];
  v38 = (UIColor *)objc_msgSend(v26, "initWithRed:green:blue:alpha:", v29, v32, v35, ARUIMix(v36, v37, v7));
  currentBottomColor = self->_currentBottomColor;
  self->_currentBottomColor = v38;

  (*((void (**)(double))self->_applier + 2))(a3);
}

- (BOOL)isAnimating
{
  if (-[UIColor isEqual:](self->_currentTopColor, "isEqual:", self->_endTopColor))
    return -[UIColor isEqual:](self->_currentBottomColor, "isEqual:", self->_endBottomColor) ^ 1;
  else
    return 1;
}

- (void)completeAnimation
{
  id WeakRetained;

  if (self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should not call completeAnimation on a ARUIColorAnimation that has already completed"));
  (*((void (**)(double))self->_applier + 2))(0.0);
  self->_completed = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "animationDidComplete:", self);

}

- (ARUIRingGroupAnimationDelegate)delegate
{
  return (ARUIRingGroupAnimationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (UIColor)startTopColor
{
  return self->_startTopColor;
}

- (UIColor)currentTopColor
{
  return self->_currentTopColor;
}

- (UIColor)endTopColor
{
  return self->_endTopColor;
}

- (UIColor)startBottomColor
{
  return self->_startBottomColor;
}

- (UIColor)currentBottomColor
{
  return self->_currentBottomColor;
}

- (UIColor)endBottomColor
{
  return self->_endBottomColor;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong((id *)&self->_endBottomColor, 0);
  objc_storeStrong((id *)&self->_currentBottomColor, 0);
  objc_storeStrong((id *)&self->_startBottomColor, 0);
  objc_storeStrong((id *)&self->_endTopColor, 0);
  objc_storeStrong((id *)&self->_currentTopColor, 0);
  objc_storeStrong((id *)&self->_startTopColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_applier, 0);
}

@end

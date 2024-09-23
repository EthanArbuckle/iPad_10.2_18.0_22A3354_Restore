@implementation CAMAdditiveAnimation

+ (id)animationToValue:(double)a3 fromValue:(double)a4 duration:(double)a5 curve:(id)a6
{
  id v10;
  double *v11;
  void *v12;

  v10 = a6;
  v11 = (double *)objc_alloc_init((Class)a1);
  v11[1] = a3;
  v11[2] = a4;
  v11[3] = a5;
  v12 = (void *)*((_QWORD *)v11 + 4);
  *((_QWORD *)v11 + 4) = v10;

  v11[6] = CACurrentMediaTime();
  return v11;
}

+ (id)animationToValue:(double)a3 fromAnimation:(id)a4 duration:(double)a5 curve:(id)a6
{
  id v10;
  id v11;
  double *v12;
  void *v13;
  id v14;
  void *v15;

  v10 = a4;
  v11 = a6;
  v12 = (double *)objc_alloc_init((Class)a1);
  v12[1] = a3;
  v13 = (void *)*((_QWORD *)v12 + 5);
  *((_QWORD *)v12 + 5) = v10;
  v14 = v10;

  v12[3] = a5;
  v15 = (void *)*((_QWORD *)v12 + 4);
  *((_QWORD *)v12 + 4) = v11;

  v12[6] = CACurrentMediaTime();
  return v12;
}

- (BOOL)isFinished
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[CAMAdditiveAnimation _lastTime](self, "_lastTime");
  v4 = v3;
  -[CAMAdditiveAnimation _startTime](self, "_startTime");
  v6 = v4 - v5;
  -[CAMAdditiveAnimation _duration](self, "_duration");
  return v6 > v7;
}

- (void)updateWithTimestamp:(double)a3
{
  id v5;

  -[CAMAdditiveAnimation _setLastTime:](self, "_setLastTime:");
  -[CAMAdditiveAnimation _fromAnimation](self, "_fromAnimation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithTimestamp:", a3);
  if (objc_msgSend(v5, "isFinished"))
  {
    objc_msgSend(v5, "_toValue");
    -[CAMAdditiveAnimation set_fromValue:](self, "set_fromValue:");
    -[CAMAdditiveAnimation set_fromAnimation:](self, "set_fromAnimation:", 0);
  }

}

- (double)value
{
  double result;
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
  void *v16;
  void *v17;
  double v18;
  float v19;
  double v20;

  if (-[CAMAdditiveAnimation isFinished](self, "isFinished"))
  {
    -[CAMAdditiveAnimation _toValue](self, "_toValue");
  }
  else
  {
    -[CAMAdditiveAnimation _fromAnimation](self, "_fromAnimation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "value");
    else
      -[CAMAdditiveAnimation _fromValue](self, "_fromValue");
    v7 = v6;
    -[CAMAdditiveAnimation _toValue](self, "_toValue");
    v9 = v8;
    -[CAMAdditiveAnimation _lastTime](self, "_lastTime");
    v11 = v10;
    -[CAMAdditiveAnimation _startTime](self, "_startTime");
    v13 = v11 - v12;
    -[CAMAdditiveAnimation _duration](self, "_duration");
    v15 = v13 / v14;
    -[CAMAdditiveAnimation _curve](self, "_curve");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[CAMAdditiveAnimation _curve](self, "_curve");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v18 = v15;
      objc_msgSend(v17, "_solveForInput:", v18);
      v15 = v19;

    }
    v20 = CEKInterpolate(v7, v9, v15);

    return v20;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  -[CAMAdditiveAnimation _fromAnimation](self, "_fromAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAdditiveAnimation value](self, "value");
  v8 = v7;
  if (v3)
  {
    -[CAMAdditiveAnimation _toValue](self, "_toValue");
    v10 = v9;
    -[CAMAdditiveAnimation _duration](self, "_duration");
    v12 = v11;
    -[CAMAdditiveAnimation _startTime](self, "_startTime");
    v14 = v13;
    -[CAMAdditiveAnimation _lastTime](self, "_lastTime");
    v16 = v15;
    -[CAMAdditiveAnimation _fromAnimation](self, "_fromAnimation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; value = %.2f; toValue = %.2f; duration = %.2f; startTime = %.2f; lastTime = %.2f> base animation:\n%@"),
      v6,
      self,
      v8,
      v10,
      v12,
      v14,
      v16,
      v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CAMAdditiveAnimation _fromValue](self, "_fromValue");
    v20 = v19;
    -[CAMAdditiveAnimation _toValue](self, "_toValue");
    v22 = v21;
    -[CAMAdditiveAnimation _duration](self, "_duration");
    v24 = v23;
    -[CAMAdditiveAnimation _startTime](self, "_startTime");
    v26 = v25;
    -[CAMAdditiveAnimation _lastTime](self, "_lastTime");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; value = %.2f; fromValue = %.2f; toValue = %.2f; duration = %.2f; startTime = %.2f; lastTime = %.2f>"),
      v6,
      self,
      v8,
      v20,
      v22,
      v24,
      v26,
      v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (double)_toValue
{
  return self->__toValue;
}

- (double)_fromValue
{
  return self->__fromValue;
}

- (void)set_fromValue:(double)a3
{
  self->__fromValue = a3;
}

- (double)_duration
{
  return self->__duration;
}

- (CAMediaTimingFunction)_curve
{
  return self->__curve;
}

- (CAMAdditiveAnimation)_fromAnimation
{
  return self->__fromAnimation;
}

- (void)set_fromAnimation:(id)a3
{
  objc_storeStrong((id *)&self->__fromAnimation, a3);
}

- (double)_startTime
{
  return self->__startTime;
}

- (void)_setStartTime:(double)a3
{
  self->__startTime = a3;
}

- (double)_lastTime
{
  return self->__lastTime;
}

- (void)_setLastTime:(double)a3
{
  self->__lastTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__fromAnimation, 0);
  objc_storeStrong((id *)&self->__curve, 0);
}

@end

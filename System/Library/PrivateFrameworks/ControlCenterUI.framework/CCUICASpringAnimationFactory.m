@implementation CCUICASpringAnimationFactory

- (CCUICASpringAnimationFactory)initWithParameters:(id)a3 speed:(double)a4
{
  id v7;
  CCUICASpringAnimationFactory *v8;
  CCUICASpringAnimationFactory *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCUICASpringAnimationFactory;
  v8 = -[CCUICASpringAnimationFactory init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parameters, a3);
    v9->_speed = a4;
  }

  return v9;
}

- (double)animationDuration
{
  void *v2;
  double v3;
  double v4;

  -[CCUICASpringAnimationFactory _animation](self, "_animation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "durationForEpsilon:", 0.0);
  v4 = v3;

  return v4;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[CCUICASpringAnimationFactory _animation](self, "_animation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyPath:", v5);

  return v6;
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (id)_animation
{
  void *v3;
  double speed;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v27;
  void *v28;

  objc_msgSend(MEMORY[0x1E0CD2848], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUICASpringAnimationParameters mass](self->_parameters, "mass");
  objc_msgSend(v3, "setMass:");
  -[CCUICASpringAnimationParameters stiffness](self->_parameters, "stiffness");
  objc_msgSend(v3, "setStiffness:");
  -[CCUICASpringAnimationParameters damping](self->_parameters, "damping");
  objc_msgSend(v3, "setDamping:");
  speed = self->_speed;
  *(float *)&speed = speed;
  objc_msgSend(v3, "setSpeed:", speed);
  -[CCUICASpringAnimationParameters timingFunction](self->_parameters, "timingFunction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_opt_class();
  v12 = v7;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v14)
  {
    objc_msgSend(v14, "controlPoint1");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v14, "controlPoint2");
    v19 = v16;
    v20 = v18;
    *(float *)&v22 = v21;
    *(float *)&v24 = v23;
    *(float *)&v21 = v19;
    *(float *)&v23 = v20;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v21, v23, v22, v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v25;
  }
  if (v12 && !v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CAMediaTimingFunction *CATimingFunctionFromDescription(__strong id<CCUIAnimationTimingFunctionDescription>)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("CCUIAnimationRunner.m"), 36, CFSTR("Unknown timing function"));

  }
  objc_msgSend(v3, "setTimingFunction:", v10);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end

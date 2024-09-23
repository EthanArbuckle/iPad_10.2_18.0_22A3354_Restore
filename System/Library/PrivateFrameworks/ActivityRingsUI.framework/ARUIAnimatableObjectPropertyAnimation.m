@implementation ARUIAnimatableObjectPropertyAnimation

+ (id)timingFunctionForMediaTimingFunction:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__ARUIAnimatableObjectPropertyAnimation_timingFunctionForMediaTimingFunction___block_invoke;
  v7[3] = &unk_24CEC61C8;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x2199A6364](v7);

  return v5;
}

double __78__ARUIAnimatableObjectPropertyAnimation_timingFunctionForMediaTimingFunction___block_invoke(uint64_t a1, double a2)
{
  float v2;

  *(float *)&a2 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_solveForInput:", a2);
  return v2;
}

+ (id)linearTimingFunction
{
  return &__block_literal_global_1;
}

+ (id)animationWithDuration:(double)a3 timingFunction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init((Class)a1);
  v11 = v10;
  if (v10)
  {
    *((double *)v10 + 3) = a3;
    v12 = MEMORY[0x2199A6364](v8);
    v13 = (void *)v11[1];
    v11[1] = v12;

    v14 = MEMORY[0x2199A6364](v9);
    v15 = (void *)v11[4];
    v11[4] = v14;

  }
  return v11;
}

- (void)update:(double)a3
{
  double duration;
  double currentAnimationTime;
  double v6;
  double v7;

  currentAnimationTime = self->_currentAnimationTime;
  duration = self->_duration;
  if (currentAnimationTime < duration)
  {
    v6 = currentAnimationTime + a3;
    if (v6 >= duration)
      v6 = self->_duration;
    self->_currentAnimationTime = v6;
    v7 = (*((double (**)(double))self->_animationTimingFunction + 2))(v6 / duration);
    *(float *)&v7 = v7;
    -[ARUIAnimatableObjectPropertyAnimation _updateWithProgress:](self, "_updateWithProgress:", v7);
  }
}

- (BOOL)isFinishedAnimating
{
  void *v3;
  void *v4;
  char v5;

  if (self->_currentAnimationTime >= self->_duration)
    return 1;
  -[ARUIAnimatableObjectPropertyAnimation _currentValue](self, "_currentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIAnimatableObjectPropertyAnimation _endValue](self, "_endValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)callAndReleaseCompletionHandler
{
  id completionHandler;
  id v4;
  void (**v5)(void);

  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v5 = (void (**)(void))MEMORY[0x2199A6364](completionHandler, a2);
    v4 = self->_completionHandler;
    self->_completionHandler = 0;

    v5[2]();
  }
}

- (double)duration
{
  return self->_duration;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_animationTimingFunction, 0);
}

- (id)_startValue
{
  id result;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0();
  return result;
}

- (id)_endValue
{
  id result;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0();
  return result;
}

- (id)_currentValue
{
  id result;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0();
  return result;
}

- (void)_setStartValue:(id)a3
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
}

- (void)_setEndValue:(id)a3
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
}

- (void)_setCurrentValue:(id)a3
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
}

- (void)_updateWithProgress:(float)a3
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
}

- (id)valueByAddingCurrentValueToValue:(id)a3
{
  id result;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0();
  return result;
}

@end

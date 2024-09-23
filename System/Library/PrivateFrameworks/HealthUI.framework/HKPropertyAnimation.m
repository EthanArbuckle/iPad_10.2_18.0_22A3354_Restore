@implementation HKPropertyAnimation

- (HKPropertyAnimation)init
{
  HKPropertyAnimation *v2;
  uint64_t v3;
  CAMediaTimingFunction *timingFunction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKPropertyAnimation;
  v2 = -[HKPropertyAnimation init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v3 = objc_claimAutoreleasedReturnValue();
    timingFunction = v2->_timingFunction;
    v2->_timingFunction = (CAMediaTimingFunction *)v3;

    v2->_secondaryAnimationCurve = 0;
  }
  return v2;
}

- (void)_applyWithCurrentDate:(id)a3
{
  double v4;
  double v5;
  float v6;
  double v7;
  int64_t secondaryAnimationCurve;
  double v9;
  id v10;

  objc_msgSend(a3, "timeIntervalSinceDate:", self->_appliedDate);
  v5 = v4 / self->_duration;
  *(float *)&v5 = v5;
  if (*(float *)&v5 > 1.0)
    *(float *)&v5 = 1.0;
  -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:", v5);
  v7 = v6;
  secondaryAnimationCurve = self->_secondaryAnimationCurve;
  v9 = 1.0 - (v7 + -1.0) * (v7 + -1.0);
  if (secondaryAnimationCurve == 1)
    v7 = v7 * v7;
  if (secondaryAnimationCurve == 2)
    v7 = v9;
  objc_msgSend(self->_fromValue, "hk_midPointToValue:percentage:", self->_toValue, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_propertyApplicationFunction + 2))();

}

- (BOOL)_isCompleted
{
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_appliedDate);
  LOBYTE(self) = v4 >= self->_duration;

  return (char)self;
}

- (void)_validate
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_duration < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKPropertyAnimation.m"), 75, CFSTR("Property animations must have a duration >= 0"));

  }
  if (!self->_fromValue)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKPropertyAnimation.m"), 76, CFSTR("Property animations cannot have a nil fromValue"));

  }
  if (!self->_toValue)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKPropertyAnimation.m"), 77, CFSTR("Property animations cannot have a nil toValue"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKPropertyAnimation.m"), 78, CFSTR("Property animations must have a fromValue that is the same class as toValue"));

  }
  if (!self->_property)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKPropertyAnimation.m"), 79, CFSTR("Property animations cannot have a nil property"));

  }
  if (!self->_propertyApplicationFunction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKPropertyAnimation.m"), 80, CFSTR("Property animations cannot have a nil property animation function"));

  }
}

- (void)_finishCancelled:(BOOL)a3
{
  void (**completion)(id, BOOL);
  id v5;
  id propertyApplicationFunction;

  completion = (void (**)(id, BOOL))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    v5 = self->_completion;
  }
  else
  {
    v5 = 0;
  }
  self->_completion = 0;

  propertyApplicationFunction = self->_propertyApplicationFunction;
  self->_propertyApplicationFunction = 0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_property);
  *(double *)(v4 + 32) = self->_duration;
  objc_storeStrong((id *)(v4 + 16), self->_fromValue);
  objc_storeStrong((id *)(v4 + 24), self->_toValue);
  objc_storeStrong((id *)(v4 + 72), self->_appliedDate);
  objc_storeStrong((id *)(v4 + 40), self->_timingFunction);
  v5 = _Block_copy(self->_completion);
  v6 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v5;

  v7 = _Block_copy(self->_propertyApplicationFunction);
  v8 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v7;

  *(_QWORD *)(v4 + 48) = self->_secondaryAnimationCurve;
  return (id)v4;
}

- (NSString)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
  objc_storeStrong((id *)&self->_property, a3);
}

- (id)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(id)a3
{
  objc_storeStrong(&self->_fromValue, a3);
}

- (id)toValue
{
  return self->_toValue;
}

- (void)setToValue:(id)a3
{
  objc_storeStrong(&self->_toValue, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (int64_t)secondaryAnimationCurve
{
  return self->_secondaryAnimationCurve;
}

- (void)setSecondaryAnimationCurve:(int64_t)a3
{
  self->_secondaryAnimationCurve = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)propertyApplicationFunction
{
  return self->_propertyApplicationFunction;
}

- (void)setPropertyApplicationFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)appliedDate
{
  return self->_appliedDate;
}

- (void)setAppliedDate:(id)a3
{
  objc_storeStrong((id *)&self->_appliedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appliedDate, 0);
  objc_storeStrong(&self->_propertyApplicationFunction, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong(&self->_toValue, 0);
  objc_storeStrong(&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end

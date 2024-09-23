@implementation BWSubjectRelightingCalculatorResult

- (BWSubjectRelightingCalculatorResult)init
{
  BWSubjectRelightingCalculatorResult *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWSubjectRelightingCalculatorResult;
  v2 = -[BWSubjectRelightingCalculatorResult init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    v2->_group = (OS_dispatch_group *)v3;
    dispatch_group_enter(v3);
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSubjectRelightingCalculatorResult;
  -[BWSubjectRelightingCalculatorResult dealloc](&v3, sel_dealloc);
}

- (BOOL)relightingRequired
{
  -[BWSubjectRelightingCalculatorResult waitForResult](self, "waitForResult");
  return self->_relightingRequired;
}

- (float)curveParameter
{
  -[BWSubjectRelightingCalculatorResult waitForResult](self, "waitForResult");
  return self->_curveParameter;
}

- (BOOL)waitForResult
{
  os_unfair_lock_s *p_lock;
  intptr_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = dispatch_group_wait((dispatch_group_t)self->_group, 0);
  if (v4)
    dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
  os_unfair_lock_unlock(p_lock);
  return v4 != 0;
}

- (void)_completeWithRelightingRequired:(BOOL)a3 curveParameter:(float)a4
{
  self->_relightingRequired = a3;
  self->_curveParameter = a4;
  dispatch_group_leave((dispatch_group_t)self->_group);
}

@end

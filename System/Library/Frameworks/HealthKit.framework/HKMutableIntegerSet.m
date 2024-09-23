@implementation HKMutableIntegerSet

- (HKMutableIntegerSet)initWithCapacity:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKMutableIntegerSet;
  return -[HKIntegerSet initWithCapacity:](&v4, sel_initWithCapacity_, a3);
}

- (void)enumerateIntegersUsingBlock:(id)a3
{
  objc_super v4;

  self->_enumerating = 1;
  v4.receiver = self;
  v4.super_class = (Class)HKMutableIntegerSet;
  -[HKIntegerSet enumerateIntegersUsingBlock:](&v4, sel_enumerateIntegersUsingBlock_, a3);
  self->_enumerating = 0;
}

- (void)addInteger:(int64_t)a3
{
  void *v6;
  void *v7;
  id v8;

  if (!self->super._set)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKIntegerSet.m"), 268, CFSTR("_set is nil"), v7);

  }
  if (self->_enumerating)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("HKMutableIntegerSetMutationWhileEnumeratingExceptionName"), CFSTR("you shouldn't mutate a set while enumerating it"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  CFSetAddValue(self->super._set, (const void *)a3);
}

- (void)removeInteger:(int64_t)a3
{
  void *v6;
  void *v7;
  id v8;

  if (!self->super._set)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKIntegerSet.m"), 278, CFSTR("_set is nil"), v7);

  }
  if (self->_enumerating)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("HKMutableIntegerSetMutationWhileEnumeratingExceptionName"), CFSTR("you shouldn't mutate a set while enumerating it"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  CFSetRemoveValue(self->super._set, (const void *)a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

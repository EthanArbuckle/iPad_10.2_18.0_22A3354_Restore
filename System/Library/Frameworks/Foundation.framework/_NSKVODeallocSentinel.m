@implementation _NSKVODeallocSentinel

+ (void)_havingRegistrationLockHeldAttachSentinelToObjectIfNeeded:(id)a3
{
  objc_class *Class;
  const void *v6;
  const void *v7;
  id value;

  Class = object_getClass(a3);
  if (_NSKVOUsesBaseClassObservationInfoImplementationForClass(Class))
  {
    v6 = (const void *)objc_opt_class();
    if (!objc_getAssociatedObject(a3, v6))
    {
      value = (id)objc_msgSend(objc_alloc((Class)a1), "_initWithObservedObject:", a3);
      v7 = (const void *)objc_opt_class();
      objc_setAssociatedObject(a3, v7, value, (void *)0x10001);

    }
  }
}

- (id)_initWithObservedObject:(id)a3
{
  id result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)_NSKVODeallocSentinel;
  result = -[_NSKVODeallocSentinel init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  _NSKeyValueRemoveObservationInfoForObject((uint64_t)self->_observedObject);
  v3.receiver = self;
  v3.super_class = (Class)_NSKVODeallocSentinel;
  -[_NSKVODeallocSentinel dealloc](&v3, sel_dealloc);
}

@end

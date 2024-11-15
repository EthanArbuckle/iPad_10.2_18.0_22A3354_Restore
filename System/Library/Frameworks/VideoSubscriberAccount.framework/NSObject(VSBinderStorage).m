@implementation NSObject(VSBinderStorage)

- (VSBinder)vs_binderCreatingIfNeeded:()VSBinderStorage
{
  id v4;
  uint64_t v5;
  VSBinder *v6;

  v4 = a1;
  objc_sync_enter(v4);
  objc_getAssociatedObject(v4, (const void *)vs_binderCreatingIfNeeded__kVSBinderKey);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (VSBinder *)v5;
  if (a3 && !v5)
  {
    v6 = -[VSBinder initWithBoundObject:]([VSBinder alloc], "initWithBoundObject:", v4);
    objc_setAssociatedObject(v4, (const void *)vs_binderCreatingIfNeeded__kVSBinderKey, v6, (void *)0x301);
  }
  objc_sync_exit(v4);

  return v6;
}

- (VSUnbinder)vs_unbinderCreatingIfNeeded:()VSBinderStorage
{
  id v4;
  uint64_t v5;
  VSUnbinder *v6;

  v4 = a1;
  objc_sync_enter(v4);
  objc_getAssociatedObject(v4, (const void *)vs_unbinderCreatingIfNeeded__kVSUnbinderKey);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (VSUnbinder *)v5;
  if (a3 && !v5)
  {
    v6 = objc_alloc_init(VSUnbinder);
    objc_setAssociatedObject(v4, (const void *)vs_unbinderCreatingIfNeeded__kVSUnbinderKey, v6, (void *)0x301);
  }
  objc_sync_exit(v4);

  return v6;
}

@end

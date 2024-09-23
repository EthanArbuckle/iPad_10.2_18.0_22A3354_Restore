@implementation NSSet(ACTrackingSet)

+ (id)setWithTrackedSet:()ACTrackingSet
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACTrackedSet.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trackedSet"));

  }
  v6 = (void *)objc_msgSend([a1 alloc], "initWithTrackedSet:", v5);

  return v6;
}

- (uint64_t)initWithTrackedSet:()ACTrackingSet
{
  id *v5;
  void *v6;
  uint64_t v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACTrackedSet.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trackedSet"));

  }
  v6 = (void *)objc_msgSend(v5[1], "copy");
  v7 = objc_msgSend(a1, "initWithSet:", v6);

  return v7;
}

@end

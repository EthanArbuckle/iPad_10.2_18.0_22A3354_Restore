@implementation HMHome(PredictionCaching)

- (id)cachedPredictions
{
  void *v4;
  void *v5;
  id v6;

  os_unfair_lock_lock((os_unfair_lock_t)&_cacheLock);
  objc_opt_class();
  objc_getAssociatedObject(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  os_unfair_lock_unlock((os_unfair_lock_t)&_cacheLock);
  return v6;
}

- (void)setCachedPredictions:()PredictionCaching
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_cacheLock);
  objc_setAssociatedObject(a1, sel_cachedPredictions, v4, (void *)1);

  os_unfair_lock_unlock((os_unfair_lock_t)&_cacheLock);
}

@end

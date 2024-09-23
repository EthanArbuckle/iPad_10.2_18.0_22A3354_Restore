@implementation NSXPCInterface(HealthKit)

- (id)hk_setArrayOfClass:()HealthKit forSelector:argumentIndex:ofReply:
{
  void *v10;

  objc_msgSend(a1, "_cachedSetForArrayOfClass:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v10, a4, a5, a6);
  return v10;
}

- (id)hk_setSetOfClass:()HealthKit forSelector:argumentIndex:ofReply:
{
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), a3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v10, a4, a5, a6);
  return v10;
}

- (id)_cachedSetForArrayOfClass:()HealthKit
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_cachedSetForArrayOfClass__lock);
  v4 = (void *)_cachedSetForArrayOfClass__cache;
  if (!_cachedSetForArrayOfClass__cache)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_cachedSetForArrayOfClass__cache;
    _cachedSetForArrayOfClass__cache = v5;

    v4 = (void *)_cachedSetForArrayOfClass__cache;
  }
  objc_msgSend(v4, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), a3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_cachedSetForArrayOfClass__cache, "setObject:forKey:", v7, a3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_cachedSetForArrayOfClass__lock);
  return v7;
}

@end

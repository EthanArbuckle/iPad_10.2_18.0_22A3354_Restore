@implementation NSExtensionContext(ShareExtension)

- (uint64_t)_intents_accessedIntent
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)_accessedIntentPropertyKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)_intents_setAccessedIntent:()ShareExtension
{
  const void *v2;
  id v3;

  v2 = (const void *)_accessedIntentPropertyKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);

}

- (id)_intents_intent
{
  return objc_getAssociatedObject(a1, (const void *)_intentPropertyKey);
}

- (void)_intents_setIntent:()ShareExtension
{
  objc_setAssociatedObject(a1, (const void *)_intentPropertyKey, a3, (void *)1);
}

- (id)intent
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  char v15;
  id v17;

  os_unfair_lock_lock((os_unfair_lock_t)&extentionContextIntentAccessorLock);
  objc_msgSend(a1, "_intents_intent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "_intents_accessedIntent") & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(a1, "_UUID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;

    objc_msgSend(v7, "protocol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.share-services"));

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-[NSExtensionContext intent] can only be called from a share extension."), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    +[INImageServiceConnection sharedConnection](INImageServiceConnection, "sharedConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchShareExtensionIntentForExtensionContextUUID:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_intents_setIntent:", v3);
    objc_msgSend(a1, "_intents_setAccessedIntent:", 1);
    if (v4 && v3)
    {
      objc_msgSend(v3, "_className");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[INIntent _setSharedExtensionContextUUID:forIntentClassName:](INIntent, "_setSharedExtensionContextUUID:forIntentClassName:", v4, v11);

    }
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3
      || (objc_msgSend(v3, "_className"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "isEqualToString:", v13),
          v14,
          (v15 & 1) == 0))
    {
      +[INIntent _setSharedExtensionContextUUID:forIntentClassName:](INIntent, "_setSharedExtensionContextUUID:forIntentClassName:", v4, v13);
    }

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&extentionContextIntentAccessorLock);
  return v3;
}

@end

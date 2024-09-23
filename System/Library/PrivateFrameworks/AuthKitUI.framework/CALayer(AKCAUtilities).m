@implementation CALayer(AKCAUtilities)

- (__CFString)ak_additiveAnimationKeyPrefixForKeyPath:()AKCAUtilities
{
  id v3;
  __CFString *v4;

  v3 = a3;
  v4 = CFSTR("com.apple.AuthenticationServices.additive");
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.AuthenticationServices.additive"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (uint64_t)ak_addAdditiveAnimation:()AKCAUtilities
{
  return objc_msgSend(a1, "ak_addAdditiveAnimation:withKeyPath:", a3, 0);
}

- (id)ak_addAdditiveAnimation:()AKCAUtilities withKeyPath:
{
  id v6;
  void *v7;

  if (a3)
  {
    v6 = a3;
    objc_msgSend(a1, "_ak_nextAdditiveAnimationKeyWithKeyPath:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addAnimation:forKey:", v6, v7);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_ak_nextAdditiveAnimationKeyWithKeyPath:()AKCAUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_getAssociatedObject(a1, &AdditiveAnimationKeyPrefix);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "animationKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "hasPrefix:", CFSTR("com.apple.AuthenticationServices.additive")) & 1) != 0)break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "ak_additiveAnimationKeyPrefixForKeyPath:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.%lu"), v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &AdditiveAnimationKeyPrefix, v15, (void *)0x303);

  return v14;
}

@end

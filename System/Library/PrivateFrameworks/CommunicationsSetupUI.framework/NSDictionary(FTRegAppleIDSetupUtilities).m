@implementation NSDictionary(FTRegAppleIDSetupUtilities)

- (uint64_t)__ftreg_responseAppleID
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("apple-id"));
}

- (id)__ftreg_responseProfileID
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("realm-user-id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
    objc_msgSend(a1, "objectForKey:", CFSTR("profile-id"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

- (uint64_t)__ftreg_responseAuthToken
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("auth-token"));
}

- (uint64_t)__ftreg_responseIsUpgrade
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("isUpgrade"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (BOOL)__ftreg_isValidSetupDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  objc_msgSend(a1, "__ftreg_responseAppleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "length"))
  {
    objc_msgSend(a1, "__ftreg_responseProfileID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "length"))
    {
      objc_msgSend(a1, "__ftreg_responseAuthToken");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        v8 = objc_msgSend(v6, "length") != 0;
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)__ftreg_candidateAliases
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("handles"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && objc_msgSend(v1, "count"))
  {
    objc_msgSend(v2, "__imArrayByApplyingBlock:", &__block_literal_global_10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end

@implementation LSApplicationIdentity(FBSBundleInfo)

- (id)fbs_shortDescription
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_getAssociatedObject(a1, &__FBSShortDescription);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1E0CA5850];
    objc_msgSend(a1, "identityString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifierForIdentityString:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "fbs_personaUniqueString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("-"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v5, v9);
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = v5;
    }
    objc_setAssociatedObject(a1, &__FBSShortDescription, v2, (void *)0x303);

  }
  return v2;
}

- (id)fbs_mediumDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_getAssociatedObject(a1, &__FBSMediumDescription);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1E0CA5850];
    objc_msgSend(a1, "identityString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifierForIdentityString:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "fbs_personaUniqueString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v5;
    }
    v2 = v7;
    objc_setAssociatedObject(a1, &__FBSMediumDescription, v7, (void *)0x303);

  }
  return v2;
}

@end

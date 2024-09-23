@implementation LSBundleRecord(IntentsFoundation)

- (id)if_containingAppRecord
{
  id v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "containingBundleRecord");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v2;

    }
    v2 = 0;
    return v2;
  }
  v2 = a1;
  return v2;
}

- (id)if_allIntentDefinitionURLs
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "intentDefinitionURLs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }
  return v5;
}

@end

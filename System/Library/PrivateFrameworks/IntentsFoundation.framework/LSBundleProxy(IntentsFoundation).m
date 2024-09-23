@implementation LSBundleProxy(IntentsFoundation)

- (uint64_t)if_isSystem
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(a1, "bundleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CA5808]))
  {
    v3 = a1;
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = v3;
      else
        v4 = 0;
    }
    else
    {
      v4 = 0;
    }
    v8 = v4;

    objc_msgSend(v8, "containingBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v8) = objc_msgSend(v9, "if_isSystem");
    if ((v8 & 1) != 0)
      goto LABEL_12;
    objc_msgSend(v3, "if_containingAppProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

LABEL_22:
      objc_msgSend(v3, "if_containingAppProxy");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v5 = (void *)v15;
        v7 = 0;
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(v3, "bundleURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/AppleInternal/Library/"), 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "if_isContainedByDirectoryAtURL:", v16);

      v5 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v11 = v3;
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    v14 = objc_msgSend(v13, "isOnSystemPartition");
    if ((v14 & 1) == 0)
      goto LABEL_22;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CA57F0]) & 1) == 0
         && (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CA5820]) & 1) == 0)
  {
    if (!objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CA57E8]))
    {
      v7 = 0;
      goto LABEL_27;
    }
    objc_msgSend(a1, "bundleURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/System/Library/"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "if_isContainedByDirectoryAtURL:", v6);
    goto LABEL_25;
  }
LABEL_12:
  v7 = 1;
LABEL_27:

  return v7;
}

- (id)if_containingAppProxy
{
  id v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "containingBundle");
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

- (uint64_t)if_isAppExtension
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (uint64_t)if_isWatchKitAppExtension
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v1, "objectForInfoDictionaryKey:ofClass:inScope:", *MEMORY[0x1E0D7D480], objc_opt_class(), 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.watchkit"));

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end

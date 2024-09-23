@implementation IFVariantAgnosticBundle

- (id)infoDictionary
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[IFBundle bundle](self, "bundle"))
    return 0;
  -[IFBundle bundle](self, "bundle");
  v3 = (void *)_CFBundleCopyInfoPlistURL();
  if (v3)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v3, &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      IFDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v12 = v3;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1D4106000, v9, OS_LOG_TYPE_INFO, "Failed to read Info.plist contents at URL: %@. Error: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    IFDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[IFBundle bundleURL](self, "bundleURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D4106000, v5, OS_LOG_TYPE_INFO, "Failed to determine Info.plist URL for bundle at URL: %@", buf, 0xCu);

    }
    v4 = 0;
  }

  return v4;
}

@end

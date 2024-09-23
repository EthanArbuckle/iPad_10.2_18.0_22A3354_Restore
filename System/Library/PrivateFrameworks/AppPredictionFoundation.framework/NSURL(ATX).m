@implementation NSURL(ATX)

- (uint64_t)atx_isOpenableFaceTimeURL
{
  void *v1;
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[8];
  id v10;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("facetime.apple.com"));

  if (v2)
  {
    v10 = 0;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.facetime"), 1, &v10);
    v4 = v10;
    if (v3)
    {
      objc_msgSend(v3, "applicationState");
      v5 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isInstalled](v5, "isInstalled")
        && (-[NSObject isRestricted](v5, "isRestricted") & 1) == 0
        && (objc_msgSend(MEMORY[0x1E0D81588], "isFaceTimeSupported") & 1) != 0)
      {
        v6 = 1;
LABEL_14:

        return v6;
      }
      __atxlog_handle_default();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1C99CA000, v7, OS_LOG_TYPE_DEFAULT, "isOpenableFaceTimeURL: not allowed", v9, 2u);
      }

    }
    else
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[NSURL(ATX) atx_isOpenableFaceTimeURL].cold.1((uint64_t)v4, v5);
    }
    v6 = 0;
    goto LABEL_14;
  }
  return 0;
}

- (id)schemelessAbsoluteString
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "resourceSpecifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("//")))
  {
    objc_msgSend(v1, "substringFromIndex:", objc_msgSend(CFSTR("//"), "length"));
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v2;
  }
  return v1;
}

- (void)atx_isOpenableFaceTimeURL
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99CA000, a2, OS_LOG_TYPE_ERROR, "isOpenableFaceTimeURL: could not obtain record: %@", (uint8_t *)&v2, 0xCu);
}

@end

@implementation CPAnalyticsPropertyProviderClassLoader

+ (id)mediaPropertyProviderForPHPhotoLibrary:(id)a3
{
  return +[CPAnalyticsPropertyProviderClassLoader _loadDynamicPHPropertyProvider:forPHPhotoLibrary:](CPAnalyticsPropertyProviderClassLoader, "_loadDynamicPHPropertyProvider:forPHPhotoLibrary:", CFSTR("PHCPAnalyticsMediaPropertyProvider"), a3);
}

+ (id)propertyProviderForPHPhotoLibrary:(id)a3
{
  return +[CPAnalyticsPropertyProviderClassLoader _loadPHPropertyProvider:forPHPhotoLibrary:](CPAnalyticsPropertyProviderClassLoader, "_loadPHPropertyProvider:forPHPhotoLibrary:", CFSTR("PHCPAnalyticsCachedPropertyProvider"), a3);
}

+ (id)_loadDynamicPHPropertyProvider:(id)a3 forPHPhotoLibrary:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a1, "_loadPHPropertyProvider:forPHPhotoLibrary:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_getDynamicProperty_forEventName_payloadForSystemPropertyExtraction_) & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    CPAnalyticsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_20AB22000, v9, OS_LOG_TYPE_ERROR, "%@ does not comply with CPAnalyticsDynamicPropertyProvider protocol", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)_loadPHPropertyProvider:(id)a3 forPHPhotoLibrary:(id)a4
{
  NSString *v5;
  id v6;
  objc_class *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (NSString *)a3;
  v6 = a4;
  v7 = NSClassFromString(v5);
  if (!v7)
  {
    CPAnalyticsLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_error_impl(&dword_20AB22000, v8, OS_LOG_TYPE_ERROR, "Failed to load %@ class", (uint8_t *)&v12, 0xCu);
    }

  }
  if (-[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", sel_initWithPhotoLibrary_)&& -[objc_class instancesRespondToSelector:](v7, "instancesRespondToSelector:", sel_registerSystemProperties_))
  {
    v9 = (void *)objc_msgSend([v7 alloc], "initWithPhotoLibrary:", v6);
  }
  else
  {
    CPAnalyticsLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_error_impl(&dword_20AB22000, v10, OS_LOG_TYPE_ERROR, "%@ does not comply with CPAnalyticsPhotoKitPropertyProvider protocol", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

@end

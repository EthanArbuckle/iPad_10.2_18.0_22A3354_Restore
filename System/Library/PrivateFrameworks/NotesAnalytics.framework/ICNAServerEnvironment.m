@implementation ICNAServerEnvironment

+ (NSURL)fallbackDefaultTargetURLFromPrefs
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)sFallbackDefaultURLFromPrefs;
  if (!sFallbackDefaultURLFromPrefs)
  {
    objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForKey:", CFSTR("analyticsFallbackDefaultURL"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = (void *)sFallbackDefaultURLFromPrefs;
    sFallbackDefaultURLFromPrefs = v5;

    v2 = (void *)sFallbackDefaultURLFromPrefs;
  }
  return (NSURL *)v2;
}

- (ICNAServerEnvironment)init
{
  ICNAServerEnvironment *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICNAServerEnvironment;
  v2 = -[ICNAServerEnvironment init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAServerEnvironment setServerEnvironmentType:](v2, "setServerEnvironmentType:", (char)objc_msgSend(v3, "integerForKey:", CFSTR("analyticsInternalServerEnvironmentType")));

    switch(-[ICNAServerEnvironment serverEnvironmentType](v2, "serverEnvironmentType"))
    {
      case 0:
      case 5:
        -[ICNAServerEnvironment fallbackDefaultTargetURL](v2, "fallbackDefaultTargetURL");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNAServerEnvironment setTargetURL:](v2, "setTargetURL:", v4);

        -[ICNAServerEnvironment setAaEndPointTypeName:](v2, "setAaEndPointTypeName:", CFSTR("mobilenotes-production"));
        objc_initWeak(&location, v2);
        dispatch_get_global_queue(17, 0);
        v5 = objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __29__ICNAServerEnvironment_init__block_invoke;
        v13[3] = &unk_1E771C188;
        objc_copyWeak(&v14, &location);
        dispatch_async(v5, v13);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
        break;
      case 1:
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://devel.notes-analytics-events.newsapps.apple.com/analyticseventsv2/async"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNAServerEnvironment setTargetURL:](v2, "setTargetURL:", v6);

        v7 = CFSTR("mobilenotes-dev");
        goto LABEL_8;
      case 2:
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://qa.notes-analytics-events.newsapps.apple.com/analyticseventsv2/async"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNAServerEnvironment setTargetURL:](v2, "setTargetURL:", v8);

        v7 = CFSTR("mobilenotes-qa");
        goto LABEL_8;
      case 3:
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://test.notes-analytics-events.newsapps.apple.com/analyticseventsv2/async"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNAServerEnvironment setTargetURL:](v2, "setTargetURL:", v9);

        v7 = CFSTR("mobilenotes-test");
        goto LABEL_8;
      case 4:
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://staging.notes-analytics-events.newsapps.apple.com/analyticseventsv2/async"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNAServerEnvironment setTargetURL:](v2, "setTargetURL:", v10);

        v7 = CFSTR("mobilenotes-staging");
LABEL_8:
        -[ICNAServerEnvironment setAaEndPointTypeName:](v2, "setAaEndPointTypeName:", v7);
        break;
      default:
        break;
    }
    v11 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ICNAServerEnvironment init].cold.1(v2, v11);

  }
  return v2;
}

void __29__ICNAServerEnvironment_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  +[ICNAServerEnvironment defaultAMSBag](ICNAServerEnvironment, "defaultAMSBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", CFSTR("app-analytics-url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__ICNAServerEnvironment_init__block_invoke_2;
  v4[3] = &unk_1E771C3E0;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_msgSend(v3, "valueWithCompletion:", v4);
  objc_destroyWeak(&v5);

}

void __29__ICNAServerEnvironment_init__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setTargetURL:", v6);

    objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setURL:forKey:", v6, CFSTR("analyticsFallbackDefaultURL"));

    v10 = objc_msgSend(v6, "copy");
    v11 = (void *)sFallbackDefaultURLFromPrefs;
    sFallbackDefaultURLFromPrefs = v10;

  }
  else
  {
    v12 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __29__ICNAServerEnvironment_init__block_invoke_2_cold_1((uint64_t)v7, v12);

  }
}

- (id)fallbackDefaultTargetURL
{
  void *v2;

  -[ICNAServerEnvironment targetURL](self, "targetURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend((id)objc_opt_class(), "fallbackDefaultTargetURLFromPrefs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://notes-analytics-events.apple.com/analyticseventsv2/async"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v2;
}

+ (id)defaultAMSBag
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ICNAServerEnvironment_defaultAMSBag__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultAMSBag_onceToken != -1)
    dispatch_once(&defaultAMSBag_onceToken, block);
  return (id)defaultAMSBag_defaultBag;
}

void __38__ICNAServerEnvironment_defaultAMSBag__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(*(id *)(a1 + 32), "ic_defaultBagKeySet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "registerBagKeySet:forProfile:profileVersion:", v2, CFSTR("Notes"), CFSTR("1"));

  objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("Notes"), CFSTR("1"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultAMSBag_defaultBag;
  defaultAMSBag_defaultBag = v3;

}

+ (id)ic_defaultBagKeySet
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CFDBA0]);
  objc_msgSend(v2, "addBagKey:valueType:", CFSTR("app-analytics-url"), 5);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (char)serverEnvironmentType
{
  return self->_serverEnvironmentType;
}

- (void)setServerEnvironmentType:(char)a3
{
  self->_serverEnvironmentType = a3;
}

- (NSURL)targetURL
{
  return self->_targetURL;
}

- (void)setTargetURL:(id)a3
{
  objc_storeStrong((id *)&self->_targetURL, a3);
}

- (NSString)aaEndPointTypeName
{
  return self->_aaEndPointTypeName;
}

- (void)setAaEndPointTypeName:(id)a3
{
  objc_storeStrong((id *)&self->_aaEndPointTypeName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaEndPointTypeName, 0);
  objc_storeStrong((id *)&self->_targetURL, 0);
}

- (void)init
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "targetURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1BDCEC000, a2, OS_LOG_TYPE_DEBUG, "Analytics Server URL is %@", (uint8_t *)&v4, 0xCu);

}

void __29__ICNAServerEnvironment_init__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BDCEC000, a2, OS_LOG_TYPE_ERROR, "No URL found for Upload Session Processor: %@", (uint8_t *)&v2, 0xCu);
}

@end

@implementation INCAppLaunchRequest

- (INCAppLaunchRequest)initWithInteraction:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  INCAppLaunchRequest *v12;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[INCAppLaunchRequest initWithInteraction:userActivity:inBackground:retainsSiri:error:](self, "initWithInteraction:userActivity:inBackground:retainsSiri:error:", v11, v10, v7, -[INCAppLaunchRequest _retainsSiri](self, "_retainsSiri"), a6);

  return v12;
}

- (INCAppLaunchRequest)initWithInteraction:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 retainsSiri:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  INCAppLaunchRequest *v25;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v8 = a6;
  v9 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (v13)
    goto LABEL_4;
  objc_msgSend(v12, "intent");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = objc_alloc(MEMORY[0x1E0CA5920]);
    objc_msgSend(v15, "_className");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v16, "initWithActivityType:", v17);

LABEL_4:
    v30 = 0;
    v31 = v13;
    INCUnderlyingInteractionFromInteraction(v12, &v31, &v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v31;

    v20 = v30;
    objc_msgSend(v18, "intent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setInteraction:donate:", v18, 0);
    v22 = v21;
    if (v21 || (v22 = v20) != 0)
    {
      v23 = v22;
    }
    else
    {
      objc_msgSend(v12, "intent");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;
    self = -[INCAppLaunchRequest initWithIntent:userActivity:inBackground:retainsSiri:error:](self, "initWithIntent:userActivity:inBackground:retainsSiri:error:", v23, v19, v9, v8, a7);

    v25 = self;
    goto LABEL_8;
  }
  v27 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[INCAppLaunchRequest initWithInteraction:userActivity:inBackground:retainsSiri:error:]";
    v36 = 2112;
    v37 = v12;
    _os_log_fault_impl(&dword_1B727D000, v27, OS_LOG_TYPE_FAULT, "%s No intent was provided in the interaction: %@", buf, 0x16u);
  }
  v28 = (void *)MEMORY[0x1E0CB35C8];
  v29 = *MEMORY[0x1E0C99768];
  v32 = *MEMORY[0x1E0CB2D50];
  v33 = CFSTR("No intent was provided in the interaction.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 0, v19);
  v25 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v25;
}

- (INCAppLaunchRequest)initWithIntent:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  INCAppLaunchRequest *v12;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[INCAppLaunchRequest initWithIntent:userActivity:inBackground:retainsSiri:error:](self, "initWithIntent:userActivity:inBackground:retainsSiri:error:", v11, v10, v7, -[INCAppLaunchRequest _retainsSiri](self, "_retainsSiri"), a6);

  return v12;
}

- (INCAppLaunchRequest)initWithIntent:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 retainsSiri:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  INCAppLaunchRequest *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  INCAppLaunchRequest *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v8 = a6;
  v9 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  objc_msgSend(v13, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CBDD60]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    self = -[INCAppLaunchRequest initWithURL:error:](self, "initWithURL:error:", v15, a7);
    v16 = self;
  }
  else
  {
    objc_msgSend(v12, "_intents_bundleIdForLaunching");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v12;
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
      }
      else
      {
        v19 = 0;
      }
      v21 = v19;

      if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.Carousel")) && v21)
      {
        self = -[INCAppLaunchRequest initWithAudioCallIntentForCarousel:error:](self, "initWithAudioCallIntentForCarousel:error:", v21, a7);
      }
      else
      {
        if (!v13)
        {
          v22 = *MEMORY[0x1E0CBD670];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v31 = "-[INCAppLaunchRequest initWithIntent:userActivity:inBackground:retainsSiri:error:]";
            v32 = 2114;
            v33 = self;
            _os_log_error_impl(&dword_1B727D000, v22, OS_LOG_TYPE_ERROR, "%s %{public}@ was not given a user activity, making one", buf, 0x16u);
          }
          v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithIntent:", v18);
        }
        objc_msgSend(v13, "_setExecutionContext:", objc_msgSend(v18, "_executionContext"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9, *MEMORY[0x1E0CA5800]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        self = -[INCAppLaunchRequest initWithBundleIdentifier:options:URL:userActivity:retainsSiri:](self, "initWithBundleIdentifier:options:URL:userActivity:retainsSiri:", v17, v24, 0, v13, v8);
      }

      v16 = self;
    }
    else
    {
      v20 = (void *)*MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        v26 = v20;
        objc_msgSend(v12, "_className");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v31 = "-[INCAppLaunchRequest initWithIntent:userActivity:inBackground:retainsSiri:error:]";
        v32 = 2114;
        v33 = self;
        v34 = 2114;
        v35 = v27;
        _os_log_error_impl(&dword_1B727D000, v26, OS_LOG_TYPE_ERROR, "%s %{public}@ was given a %{public}@ without a bundle identifier to launch", buf, 0x20u);

      }
      v16 = 0;
    }

  }
  return v16;
}

- (INCAppLaunchRequest)initWithAudioCallIntentForCarousel:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "personHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v19 = (void *)*MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v24 = v19;
      objc_msgSend(v6, "_className");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v29 = "-[INCAppLaunchRequest initWithAudioCallIntentForCarousel:error:]";
      v30 = 2114;
      v31 = v25;
      _os_log_error_impl(&dword_1B727D000, v24, OS_LOG_TYPE_ERROR, "%s %{public}@ is missing a personHandle to call", buf, 0x16u);

      if (!p_isa)
        goto LABEL_9;
    }
    else if (!p_isa)
    {
      goto LABEL_9;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CBD458];
    v26 = *MEMORY[0x1E0CB2938];
    v27 = CFSTR("Missing personHandle from INStartAudioCallIntent");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 3002, v22);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
    goto LABEL_9;
  }
  objc_msgSend(v9, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v6, "preferredCallProvider");
  v15 = (void *)MEMORY[0x1E0C99E98];
  if (v14 == 2)
    v16 = CFSTR("facetime://%@");
  else
    v16 = CFSTR("tel://%@");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[INCAppLaunchRequest initWithBundleIdentifier:options:URL:userActivity:](self, "initWithBundleIdentifier:options:URL:userActivity:", CFSTR("com.apple.Carousel"), 0, v18, 0);
  p_isa = (id *)&self->super.isa;
LABEL_9:

  return (INCAppLaunchRequest *)p_isa;
}

- (INCAppLaunchRequest)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  INCAppLaunchRequest *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  os_log_t loga;
  NSObject *log;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLOverrideForURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;

    v6 = v10;
  }
  -[INCAppLaunchRequest URLOverrideForURL:](self, "URLOverrideForURL:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;

    v6 = v12;
  }
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0CA5838], "appLinksWithURL:limit:error:", v6, 2, &v39);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v39;
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      v16 = (void *)*MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        v29 = v16;
        objc_msgSend(v15, "targetApplicationProxy");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "bundleIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v41 = "-[INCAppLaunchRequest initWithURL:error:]";
        v42 = 2114;
        v43 = v31;
        _os_log_error_impl(&dword_1B727D000, v29, OS_LOG_TYPE_ERROR, "%s Multiple app links are available to handle the URL, picking the first one: %{public}@", buf, 0x16u);

      }
    }
    objc_msgSend(v15, "targetApplicationProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[INCAppLaunchRequest initWithBundleIdentifier:options:URL:userActivity:](self, "initWithBundleIdentifier:options:URL:userActivity:", v18, 0, v19, 0);

    v20 = self;
    goto LABEL_21;
  }
  if (v14)
  {
    v21 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[INCAppLaunchRequest initWithURL:error:]";
      v42 = 2112;
      v43 = v14;
      _os_log_error_impl(&dword_1B727D000, v21, OS_LOG_TYPE_ERROR, "%s Failed to get app links for URL: %@", buf, 0x16u);
    }
  }
  objc_msgSend(v7, "applicationsAvailableForOpeningURL:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[INCAppLaunchRequest removeDenyListedApplicationProxies:](INCAppLaunchRequest, "removeDenyListedApplicationProxies:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v15, "count") >= 2)
    {
      v23 = (void *)*MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        log = v23;
        objc_msgSend(v6, "scheme");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bundleIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v41 = "-[INCAppLaunchRequest initWithURL:error:]";
        v42 = 2114;
        v43 = v36;
        v44 = 2114;
        v45 = v34;
        _os_log_error_impl(&dword_1B727D000, log, OS_LOG_TYPE_ERROR, "%s Multiple applications are available to handle the \"%{public}@\" scheme, picking the first one: %{public}@", buf, 0x20u);

      }
    }
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[INCAppLaunchRequest initWithBundleIdentifier:options:URL:userActivity:](self, "initWithBundleIdentifier:options:URL:userActivity:", v18, 0, v6, 0);
    v20 = self;
    goto LABEL_21;
  }
  v24 = (void *)*MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    v32 = v24;
    objc_msgSend(v6, "scheme");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v41 = "-[INCAppLaunchRequest initWithURL:error:]";
    v42 = 2114;
    v43 = v33;
    _os_log_error_impl(&dword_1B727D000, v32, OS_LOG_TYPE_ERROR, "%s No applications are available to handle the \"%{public}@\" scheme", buf, 0x16u);

    if (a4)
      goto LABEL_20;
LABEL_24:
    v20 = 0;
    goto LABEL_22;
  }
  if (!a4)
    goto LABEL_24;
LABEL_20:
  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "scheme");
  loga = (os_log_t)a4;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("No applications are available to handle the %@ scheme"), v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0CB35C8];
  v27 = *MEMORY[0x1E0CBD458];
  v46 = *MEMORY[0x1E0CB2938];
  v47[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "errorWithDomain:code:userInfo:", v27, 2005, v18);
  v20 = 0;
  loga->isa = (Class)(id)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_22:
  return v20;
}

- (INCAppLaunchRequest)initWithBundleIdentifier:(id)a3 options:(id)a4 URL:(id)a5 userActivity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  INCAppLaunchRequest *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[INCAppLaunchRequest initWithBundleIdentifier:options:URL:userActivity:retainsSiri:](self, "initWithBundleIdentifier:options:URL:userActivity:retainsSiri:", v13, v12, v11, v10, -[INCAppLaunchRequest _retainsSiri](self, "_retainsSiri"));

  return v14;
}

- (INCAppLaunchRequest)initWithBundleIdentifier:(id)a3 options:(id)a4 URL:(id)a5 userActivity:(id)a6 retainsSiri:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  INCAppLaunchRequest *v16;
  uint64_t v17;
  NSString *bundleIdentifier;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSURL *URL;
  INCAppLaunchRequest *v24;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)INCAppLaunchRequest;
  v16 = -[INCAppLaunchRequest init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    bundleIdentifier = v16->_bundleIdentifier;
    v16->_bundleIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v16->_options, v21);

    v22 = objc_msgSend(v14, "copy");
    URL = v16->_URL;
    v16->_URL = (NSURL *)v22;

    objc_storeStrong((id *)&v16->_userActivity, a6);
    v16->_retainsSiri = a7;
    v24 = v16;
  }

  return v16;
}

- (BOOL)_retainsSiri
{
  uint64_t (*v2)(void);
  int v3;
  _Unwind_Exception *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr_833;
  v10 = getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr_833;
  if (!getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr_833)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke_834;
    v6[3] = &unk_1E6BC4BF8;
    v6[4] = &v7;
    __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke_834((uint64_t)v6);
    v2 = (uint64_t (*)(void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    dlerror();
    v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v4);
  }
  v3 = v2();
  if (v3)
    LOBYTE(v3) = _os_feature_enabled_impl();
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" {\n    bundleIdentifier = %@,\n    options = %@,\n    URL = %@,\n    userActivity = %@\n}"), self->_bundleIdentifier, self->_options, self->_URL, self->_userActivity);
  v7.receiver = self;
  v7.super_class = (Class)INCAppLaunchRequest;
  -[INCAppLaunchRequest description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_bundleIdentifier, "hash");
  v4 = -[NSDictionary hash](self->_options, "hash") ^ v3;
  v5 = -[NSURL hash](self->_URL, "hash");
  return v4 ^ v5 ^ -[NSUserActivity hash](self->_userActivity, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INCAppLaunchRequest *v4;
  INCAppLaunchRequest *v5;
  NSURL *URL;
  NSUserActivity *userActivity;
  char v8;

  v4 = (INCAppLaunchRequest *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSString isEqual:](self->_bundleIdentifier, "isEqual:", v5->_bundleIdentifier)
        && -[NSDictionary isEqual:](self->_options, "isEqual:", v5->_options)
        && ((URL = self->_URL, URL == v5->_URL) || -[NSURL isEqual:](URL, "isEqual:")))
      {
        userActivity = self->_userActivity;
        if (userActivity == v5->_userActivity)
          v8 = 1;
        else
          v8 = -[NSUserActivity isEqual:](userActivity, "isEqual:");
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
  }

  return v8;
}

- (id)URLOverrideForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("https")))
  {

  }
  else
  {
    objc_msgSend(v3, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("http"));

    if (!v6)
    {
LABEL_6:
      v14 = 0;
      goto LABEL_7;
    }
  }
  objc_msgSend(v3, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("facetime.apple.com"));

  if (!v8)
    goto LABEL_6;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setScheme:", CFSTR("facetime-open-link"));
  v10 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(v3, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("link"), v11);
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setQueryItems:", v13);

  objc_msgSend(v9, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v14;
}

- (BOOL)isSupportedInCarPlay
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 buf;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v3 = (void *)getGEOCountryConfigurationClass_softClass;
  v24 = getGEOCountryConfigurationClass_softClass;
  if (!getGEOCountryConfigurationClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v26 = __getGEOCountryConfigurationClass_block_invoke;
    v27 = &unk_1E6BC4BF8;
    v28 = &v21;
    __getGEOCountryConfigurationClass_block_invoke((uint64_t)&buf);
    v3 = (void *)v22[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v4, "sharedConfiguration", v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[INCAppLaunchRequest bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v8, "isInstalled");

    if (!(_DWORD)v9)
    {
LABEL_17:

      goto LABEL_18;
    }
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v10 = (void *)getCRCarPlayAppPolicyEvaluatorClass_softClass;
    v24 = getCRCarPlayAppPolicyEvaluatorClass_softClass;
    if (!getCRCarPlayAppPolicyEvaluatorClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v26 = __getCRCarPlayAppPolicyEvaluatorClass_block_invoke;
      v27 = &unk_1E6BC4BF8;
      v28 = &v21;
      __getCRCarPlayAppPolicyEvaluatorClass_block_invoke((uint64_t)&buf);
      v10 = (void *)v22[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v21, 8);
    v12 = objc_alloc_init(v11);
    objc_msgSend(v12, "setGeoSupported:", objc_msgSend(v5, "currentCountrySupportsCarIntegration", v21));
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v13 = (void *)getCRCarPlayAppDeclarationClass_softClass;
    v24 = getCRCarPlayAppDeclarationClass_softClass;
    if (!getCRCarPlayAppDeclarationClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v26 = __getCRCarPlayAppDeclarationClass_block_invoke;
      v27 = &unk_1E6BC4BF8;
      v28 = &v21;
      __getCRCarPlayAppDeclarationClass_block_invoke((uint64_t)&buf);
      v13 = (void *)v22[3];
    }
    v9 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v21, 8);
    objc_msgSend(v9, "declarationForAppProxy:", v7, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "effectivePolicyForAppDeclaration:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v15, "isCarPlaySupported");
    -[INCAppLaunchRequest URL](self, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      -[INCAppLaunchRequest userActivity](self, "userActivity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (v19)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    LOBYTE(v9) = objc_msgSend(v15, "canDisplayOnCarScreen");
    goto LABEL_16;
  }
  v17 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[INCAppLaunchRequest isSupportedInCarPlay]";
    _os_log_error_impl(&dword_1B727D000, v17, OS_LOG_TYPE_ERROR, "%s Failed to get the GEOCountryConfiguration, falling back to the default service", (uint8_t *)&buf, 0xCu);
  }
  LOBYTE(v9) = 0;
LABEL_18:

  return (char)v9;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[16];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)getCARSessionStatusClass_815()), "initAndWaitUntilSessionUpdated");
  objc_msgSend(v6, "currentSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && -[INCAppLaunchRequest isSupportedInCarPlay](self, "isSupportedInCarPlay"))
  {
    if (!CarPlayServicesLibraryCore_frameworkLibrary_825)
    {
      *(_OWORD *)buf = xmmword_1E6BC4B48;
      v15 = 0;
      CarPlayServicesLibraryCore_frameworkLibrary_825 = _sl_dlopen();
      if (!CarPlayServicesLibraryCore_frameworkLibrary_825)
      {
        v13 = 0;
        v12 = (void *)abort_report_np();
        free(v12);
      }
    }
    objc_msgSend(MEMORY[0x1E0D23170], "dashboardService", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;

      v5 = v10;
    }
    else
    {
      v11 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[INCAppLaunchRequest performWithCompletionHandler:]";
        _os_log_error_impl(&dword_1B727D000, v11, OS_LOG_TYPE_ERROR, "%s Failed to get the CarPlay dashboard service (is the process properly entitled?). Falling back to the default service.", buf, 0xCu);
      }
    }

  }
  -[INCAppLaunchRequest performWithService:retainsSiri:completionHandler:](self, "performWithService:retainsSiri:completionHandler:", v5, -[INCAppLaunchRequest retainsSiri](self, "retainsSiri"), v4);

}

- (void)performWithService:(id)a3 retainsSiri:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _BYTE buf[24];
  void *v41;
  uint64_t *v42;
  uint64_t v43;

  v6 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[INCAppLaunchRequest options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[INCAppLaunchRequest userActivity](self, "userActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCAppLaunchRequest URL](self, "URL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v32 = 0;
    INCSerializeNSUserActivity(v12, &v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v32;
    if (v13)
    {
      v38 = &unk_1E6BC8B68;
      v39 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v34 = &v33;
      v35 = 0x2050000000;
      v15 = (void *)getUIActivityContinuationActionClass_softClass;
      v36 = getUIActivityContinuationActionClass_softClass;
      if (!getUIActivityContinuationActionClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getUIActivityContinuationActionClass_block_invoke;
        v41 = &unk_1E6BC4BF8;
        v42 = &v33;
        __getUIActivityContinuationActionClass_block_invoke((uint64_t)buf);
        v15 = (void *)v34[3];
      }
      v16 = objc_retainAutorelease(v15);
      _Block_object_dispose(&v33, 8);
      v17 = (void *)objc_msgSend([v16 alloc], "initWithSettings:", v14);
      v37 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D22CE0]);

    }
    else
    {
      v19 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[INCAppLaunchRequest performWithService:retainsSiri:completionHandler:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v27;
        _os_log_error_impl(&dword_1B727D000, v19, OS_LOG_TYPE_ERROR, "%s Failed to serialize user activity: %{public}@", buf, 0x16u);
      }
    }

  }
  else if (v28)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D22D78]);
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22DA8], v27);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D88]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DAB870]);

  -[INCAppLaunchRequest userActivity](self, "userActivity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "interaction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCAppLaunchRequest bundleIdentifier](self, "bundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __72__INCAppLaunchRequest_performWithService_retainsSiri_completionHandler___block_invoke;
  v29[3] = &unk_1E6BC4A90;
  v30 = v22;
  v31 = v9;
  v25 = v9;
  v26 = v22;
  objc_msgSend(v8, "openApplication:withOptions:completion:", v24, v23, v29);

}

- (void)observeForAppLaunchWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6;
  INCDisplayLayoutMonitor *v7;
  id v8;
  uint64_t v9;
  INCDisplayLayoutMonitor *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *, void *);
  void *v20;
  INCAppLaunchRequest *v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  INCDisplayLayoutMonitor *v26;
  id v27;
  _QWORD v28[5];
  id v29;

  v6 = a4;
  v7 = objc_alloc_init(INCDisplayLayoutMonitor);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__813;
  v28[4] = __Block_byref_object_dispose__814;
  v8 = objc_alloc(MEMORY[0x1E0CBDD00]);
  v9 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__INCAppLaunchRequest_observeForAppLaunchWithTimeout_completionHandler___block_invoke;
  v25[3] = &unk_1E6BC4AB8;
  v10 = v7;
  v26 = v10;
  v11 = v6;
  v27 = v11;
  v29 = (id)objc_msgSend(v8, "initWithTimeoutInterval:timeoutHandler:", v25, a3);
  v12 = (void *)objc_opt_class();
  -[INCAppLaunchRequest bundleIdentifier](self, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "specialElementIdentifierForBundleIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v9;
  v18 = 3221225472;
  v19 = __72__INCAppLaunchRequest_observeForAppLaunchWithTimeout_completionHandler___block_invoke_2;
  v20 = &unk_1E6BC4AE0;
  v21 = self;
  v15 = v14;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  v24 = v28;
  -[INCDisplayLayoutMonitor setTransitionHandler:](v10, "setTransitionHandler:", &v17);
  -[INCDisplayLayoutMonitor resume](v10, "resume", v17, v18, v19, v20, v21);

  _Block_object_dispose(v28, 8);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (BOOL)retainsSiri
{
  return self->_retainsSiri;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

uint64_t __72__INCAppLaunchRequest_observeForAppLaunchWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__INCAppLaunchRequest_observeForAppLaunchWithTimeout_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)getCARSessionStatusClass_815()), "initAndWaitUntilSessionUpdated");
  objc_msgSend(v8, "currentSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || !objc_msgSend(*(id *)(a1 + 32), "isSupportedInCarPlay")
    || objc_msgSend(v6, "isCarDisplay"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v7, "elements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      v19 = v6;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(a1 + 40)))
          {

LABEL_15:
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "cancel");
            v6 = v19;
            goto LABEL_16;
          }
          objc_msgSend(v15, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", *(_QWORD *)(a1 + 40));

          if (v18)
            goto LABEL_15;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v6 = v19;
        if (v12)
          continue;
        break;
      }
    }
LABEL_16:

  }
}

void __72__INCAppLaunchRequest_performWithService_retainsSiri_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _OWORD v11[2];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "auditToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "realToken");
    else
      memset(v11, 0, sizeof(v11));
    objc_msgSend(v7, "inc_associateFileURLsWithAuditToken:", v11);

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v6 == 0, v6);

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

+ (id)specialElementIdentifierForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(&unk_1E6BC8B98, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v3;
  v6 = v4;

  return v6;
}

+ (id)removeDenyListedApplicationProxies:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "bundleIdentifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(&unk_1E6BC8BC0, "containsObject:", v11);

        if (v12)
          objc_msgSend(v4, "removeObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

@end

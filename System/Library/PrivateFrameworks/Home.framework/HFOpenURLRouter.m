@implementation HFOpenURLRouter

+ (HFOpenURLRouter)sharedInstance
{
  if (_MergedGlobals_224 != -1)
    dispatch_once(&_MergedGlobals_224, &__block_literal_global_2_3);
  return (HFOpenURLRouter *)(id)qword_1ED378DE0;
}

- (void)setApplicationURLHandler:(id)a3
{
  objc_storeWeak((id *)&self->_applicationURLHandler, a3);
}

void __33__HFOpenURLRouter_sharedInstance__block_invoke_2()
{
  HFOpenURLRouter *v0;
  void *v1;

  v0 = objc_alloc_init(HFOpenURLRouter);
  v1 = (void *)qword_1ED378DE0;
  qword_1ED378DE0 = (uint64_t)v0;

}

- (id)openURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x46uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "HFOpenURLRouter received request to open URL: %@.", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1002, MEMORY[0x1E0C9AA70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "futureWithError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFOpenURLRouter applicationURLHandler](self, "applicationURLHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HFOpenURLRouter applicationURLHandler](self, "applicationURLHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openApplicationURL:", v4);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __27__HFOpenURLRouter_openURL___block_invoke;
  v15[3] = &unk_1EA726990;
  v15[4] = self;
  v16 = v4;
  v12 = v4;
  objc_msgSend(v8, "recover:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __27__HFOpenURLRouter_openURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openSensitiveURL:", *(_QWORD *)(a1 + 40));
}

- (id)openSensitiveURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x46uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "HFOpenURLRouter received request to open sensitive URL: %@.", buf, 0xCu);
  }

  if (+[HFURLComponents isHomeAppURL:](HFURLComponents, "isHomeAppURL:", v4))
  {
    +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hostProcess");

    if (!v7)
      NSLog(CFSTR("Trying to open Home app URL from within the app via the standard IPC-based APIs! This is not secure and should be avoided. URL: %@"), v4);
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D88]);
  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
  {
    v9 = (void *)MEMORY[0x1E0D519C0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __36__HFOpenURLRouter_openSensitiveURL___block_invoke;
    v16[3] = &unk_1EA7268F0;
    v17 = v4;
    objc_msgSend(v9, "futureWithCompletionHandlerAdapterBlock:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v11, "openSensitiveURL:withOptions:error:", v4, v8, &v15);
    v12 = v15;

    if (v12)
    {
      HFLogForCategory(0x46uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = v12;
        _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "Failed to open URL: %@, error: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HFOpenURLRouter _sendAnalyticsEventForURL:](self, "_sendAnalyticsEventForURL:", v4);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

void __36__HFOpenURLRouter_openSensitiveURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CA5878];
  v4 = a2;
  objc_msgSend(v3, "defaultWorkspace");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:configuration:completionHandler:", *(_QWORD *)(a1 + 32), 0, v4);

}

- (void)_sendAnalyticsEventForURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a3;
  objc_msgSend(v3, "hf_photosLibraryPeopleAlbumURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    +[HFAnalytics sendEvent:](HFAnalytics, "sendEvent:", 6);
}

- (HFApplicationURLHandling)applicationURLHandler
{
  return (HFApplicationURLHandling *)objc_loadWeakRetained((id *)&self->_applicationURLHandler);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationURLHandler);
}

@end

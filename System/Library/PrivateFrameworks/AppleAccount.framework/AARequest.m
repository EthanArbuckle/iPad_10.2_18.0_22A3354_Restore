@implementation AARequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

+ (id)protocolVersion
{
  return CFSTR("1.0");
}

- (AARequest)initWithURLString:(id)a3
{
  id v5;
  AARequest *v6;
  AARequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AARequest;
  v6 = -[AARequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_initialURLString, a3);

  return v7;
}

- (void)setCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  OpaqueCFHTTPCookieStorage *cookieStorage;

  cookieStorage = self->_cookieStorage;
  if (cookieStorage != a3)
  {
    if (cookieStorage)
      CFRelease(cookieStorage);
    self->_cookieStorage = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (void)setDeviceProvisioningOneTimePassword:(id)a3
{
  objc_storeStrong((id *)&self->_oneTimePassword, a3);
}

- (void)setDeviceProvisioningMachineId:(id)a3
{
  objc_storeStrong((id *)&self->_machineId, a3);
}

- (id)urlString
{
  return self->_initialURLString;
}

- (NSURLRequest)urlRequest
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  __CFString *v31;
  NSObject *v32;
  NSDictionary *customHeaders;
  NSDictionary *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[AARequest urlString](self, "urlString");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("https://setup.icloud.com");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v4);
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = (uint64_t)v5;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Request URL: %@", buf, 0xCu);
  }

  v7 = -[AARequest flushCache](self, "flushCache");
  v8 = (void *)MEMORY[0x1E0C92C28];
  v45 = v5;
  objc_msgSend(v5, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:cachePolicy:timeoutInterval:", v9, v7, 60.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[AADeviceInfo clientInfoHeader](AADeviceInfo, "clientInfoHeader");
  v11 = objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v11;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Client Info Header: %@", buf, 0xCu);
  }

  v44 = (void *)v11;
  objc_msgSend(v10, "addValue:forHTTPHeaderField:", v11, CFSTR("X-MMe-Client-Info"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uppercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addValue:forHTTPHeaderField:", v15, CFSTR("X-MMe-Country"));

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("en");
  objc_msgSend(v10, "addValue:forHTTPHeaderField:", v19, CFSTR("X-MMe-Language"));

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "minimizedLanguagesFromLanguages:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (__CFString *)v22;
  else
    v24 = CFSTR("en");
  v25 = v24;

  objc_msgSend(v10, "addValue:forHTTPHeaderField:", v25, CFSTR("Accept-Language"));
  if (self->_cookieStorage)
  {
    objc_msgSend(objc_retainAutorelease(v10), "_CFURLRequest");
    CFURLRequestSetHTTPCookieStorage();
    _AALogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = (uint64_t)v4;
      _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "Use custom cookie storage for urlRequest: %@", buf, 0xCu);
    }

  }
  if (self->_oneTimePassword)
  {
    _AALogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v27, OS_LOG_TYPE_DEFAULT, "Adding device provisioning OTP to the request header", buf, 2u);
    }

    objc_msgSend(v10, "addValue:forHTTPHeaderField:", self->_oneTimePassword, CFSTR("X-Apple-MD"));
  }
  if (self->_machineId)
  {
    _AALogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v28, OS_LOG_TYPE_DEFAULT, "Adding device provisioning machineId to the request header", buf, 2u);
    }

    objc_msgSend(v10, "addValue:forHTTPHeaderField:", self->_machineId, CFSTR("X-Apple-MD-M"));
  }
  objc_msgSend(v10, "aa_addMultiUserDeviceHeaderIfEnabled");
  if (+[AAPreferences isExperimentalModeEnabled](AAPreferences, "isExperimentalModeEnabled"))
  {
    _AALogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v29, OS_LOG_TYPE_DEFAULT, "Adding exp mode header", buf, 2u);
    }

    objc_msgSend(v10, "addValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-iCloud-Experiment-Mode"));
  }
  if (self->_customHeaders)
  {
    v42 = v25;
    v43 = v21;
    v30 = v20;
    v31 = v4;
    _AALogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      customHeaders = self->_customHeaders;
      *(_DWORD *)buf = 138412290;
      v52 = (uint64_t)customHeaders;
      _os_log_impl(&dword_19EACA000, v32, OS_LOG_TYPE_DEFAULT, "Appending custom headers %@", buf, 0xCu);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v34 = self->_customHeaders;
    v35 = -[NSDictionary countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v47 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_customHeaders, "objectForKeyedSubscript:", v39, v42, v43);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forHTTPHeaderField:", v40, v39);

        }
        v36 = -[NSDictionary countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v36);
    }

    v4 = v31;
    v20 = v30;
    v25 = v42;
    v21 = v43;
  }

  return (NSURLRequest *)v10;
}

- (id)urlCredential
{
  return 0;
}

- (id)bodyDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "protocolVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("protocolVersion"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("timezone"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (__CFString *)v8;
  else
    v9 = CFSTR("en");
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("language"));
  +[AADeviceInfo appleIDClientIdentifier](AADeviceInfo, "appleIDClientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("client-id"));

  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("userInfo"));
  return v2;
}

- (void)performRequestWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[AAURLSession sharedSession](AAURLSession, "sharedSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AARequest performRequestWithSession:withHandler:](self, "performRequestWithSession:withHandler:", v5, v4);

}

- (void)performSignedRequestWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[AAURLSession sharedSigningSession](AAURLSession, "sharedSigningSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AARequest performRequestWithSession:withHandler:](self, "performRequestWithSession:withHandler:", v5, v4);

}

- (void)performPinnedRequestWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[AAURLSession sharedPinningSession](AAURLSession, "sharedPinningSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AARequest performRequestWithSession:withHandler:](self, "performRequestWithSession:withHandler:", v5, v4);

}

- (void)performPinnedOnlyRequestWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[AAURLSession sharedPinningOnlySession](AAURLSession, "sharedPinningOnlySession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AARequest performRequestWithSession:withHandler:](self, "performRequestWithSession:withHandler:", v5, v4);

}

- (void)performRequestForDevice:(id)a3 withHandler:(id)a4
{
  -[AARequest performRequestForDevice:anisetteDataProvider:withHandler:](self, "performRequestForDevice:anisetteDataProvider:withHandler:", a3, 0, a4);
}

- (void)performRequestForDevice:(id)a3 anisetteDataProvider:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = -[AAURLSession initForProxiedDevice:anisetteDataProvider:]([AAURLSession alloc], "initForProxiedDevice:anisetteDataProvider:", v8, v9);
  v11 = v17[5];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__AARequest_performRequestForDevice_anisetteDataProvider_withHandler___block_invoke;
  v13[3] = &unk_1E416EA10;
  v15 = &v16;
  v12 = v10;
  v14 = v12;
  -[AARequest performRequestWithSession:withHandler:](self, "performRequestWithSession:withHandler:", v11, v13);

  _Block_object_dispose(&v16, 8);
}

void __70__AARequest_performRequestForDevice_anisetteDataProvider_withHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;
  v9 = a4;
  v10 = a3;
  v11 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performRequestWithSession:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(2, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AARequest_performRequestWithSession_withHandler___block_invoke;
  block[3] = &unk_1E416EA60;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __51__AARequest_performRequestWithSession_withHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "urlString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*v2, "urlRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 8);
      *(_QWORD *)(v6 + 8) = v5;

      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __51__AARequest_performRequestWithSession_withHandler___block_invoke_57;
      v33[3] = &unk_1E416EA38;
      v8 = *(void **)(a1 + 40);
      v33[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "dataTaskWithRequest:completion:", v4, v33);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resume");

    }
    else
    {
      _AALogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __51__AARequest_performRequestWithSession_withHandler___block_invoke_cold_2((uint64_t)v2, v21, v22, v23, v24, v25, v26, v27);

      if (*(_QWORD *)(a1 + 48))
      {
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("ICLOUD_CONFIG_ERROR"), 0, CFSTR("Localizable"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -2, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
    }
    goto LABEL_12;
  }
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __51__AARequest_performRequestWithSession_withHandler___block_invoke_cold_1((uint64_t)v2, v10, v11, v12, v13, v14, v15, v16);

  if (*(_QWORD *)(a1 + 48))
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ICLOUD_CONFIG_ERROR"), 0, CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -2, v20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_12:

  }
}

uint64_t __51__AARequest_performRequestWithSession_withHandler___block_invoke_57(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDataTaskCompletionWithData:response:error:", a2, a3, a4);
}

- (void)_handleDataTaskCompletionWithData:(id)a3 response:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void (**handler)(id, AARequest *, void *, void *);
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v9;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Data task did complete with error: %@", (uint8_t *)&v18, 0xCu);
  }

  if (!v9)
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Response: %@", (uint8_t *)&v18, 0xCu);
    }

  }
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithHTTPResponse:data:", v8, v10);

  if (!v13)
  {
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "Failed to parse an AAResponse", (uint8_t *)&v18, 2u);
    }

  }
  objc_msgSend(v9, "_aa_userReadableError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  handler = (void (**)(id, AARequest *, void *, void *))self->_handler;
  if (handler)
  {
    handler[2](handler, self, v13, v15);
    v17 = self->_handler;
    self->_handler = 0;

  }
}

- (void)dealloc
{
  OpaqueCFHTTPCookieStorage *cookieStorage;
  objc_super v4;

  cookieStorage = self->_cookieStorage;
  if (cookieStorage)
    CFRelease(cookieStorage);
  v4.receiver = self;
  v4.super_class = (Class)AARequest;
  -[AARequest dealloc](&v4, sel_dealloc);
}

- (id)redactedBodyStringWithPropertyList:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(&unk_1E41A68D0, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(&unk_1E41A68D0);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "valueForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "unredactedSuffixOfLength:", 4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("...%@"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setValue:forKey:", v12, v8);

        }
      }
      v5 = objc_msgSend(&unk_1E41A68D0, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 100, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15 = objc_retainAutorelease(v13);
  v16 = (void *)objc_msgSend(v14, "initWithBytes:length:encoding:", objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 4);

  return v16;
}

+ (id)redactedHeadersFromHTTPHeaders:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(&unk_1E41A68E8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(&unk_1E41A68E8);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "valueForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "unredactedSuffixOfLength:", 4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("...%@"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setValue:forKey:", v12, v8);

        }
      }
      v5 = objc_msgSend(&unk_1E41A68E8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  return v3;
}

- (BOOL)flushCache
{
  return self->_flushCache;
}

- (void)setFlushCache:(BOOL)a3
{
  self->_flushCache = a3;
}

- (NSDictionary)customHeaders
{
  return self->_customHeaders;
}

- (void)setCustomHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customHeaders, 0);
  objc_storeStrong((id *)&self->_machineId, 0);
  objc_storeStrong((id *)&self->_oneTimePassword, 0);
  objc_storeStrong((id *)&self->_initialURLString, 0);
  objc_storeStrong(&self->_handler, 0);
}

void __51__AARequest_performRequestWithSession_withHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a2, a3, "AARequest has nil URL (%{private}@). Calling handler with an error.", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1_0();
}

void __51__AARequest_performRequestWithSession_withHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a2, a3, "AARequest has nil underlying request (%{private}@). Calling handler with an error.", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1_0();
}

@end

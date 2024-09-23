@implementation NEHotspotConfigurationManager

- (void)applyConfiguration:(NEHotspotConfiguration *)configuration completionHandler:(void *)completionHandler
{
  NEHotspotConfiguration *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  NEHotspotConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NEHotspotConfigurationManager *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = configuration;
  v7 = completionHandler;
  v8 = -[NEHotspotConfiguration validate](v6, "validate");
  if (v8 != 100)
  {
    v15 = v8;
    v16 = self;
LABEL_11:
    -[NEHotspotConfigurationManager reportError:completionHandler:]((uint64_t)v16, v15, v7);
    goto LABEL_17;
  }
  if (!self)
    goto LABEL_8;
  v9 = (objc_class *)MEMORY[0x1E0CB36F8];
  v10 = v6;
  v11 = (void *)objc_msgSend([v9 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("NEHotspotConfigurationKey"));

  objc_msgSend(v11, "finishEncoding");
  objc_msgSend(v11, "encodedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_8:
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = (id)objc_opt_class();
      v19 = v24;
      _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "%@ failed to serialize configuration object", buf, 0xCu);

    }
    v16 = self;
    v15 = 107;
    goto LABEL_11;
  }
  +[NEHotspotConfigurationHelper sharedManager]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if (v7)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __70__NEHotspotConfigurationManager_applyConfiguration_completionHandler___block_invoke;
      v21[3] = &unk_1E3CC0930;
      v21[4] = self;
      v22 = v7;
      -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v14, v12, 0, v21);

    }
    else
    {
      -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v13, v12, 0, 0);
    }
  }
  else
  {
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = (id)objc_opt_class();
      v20 = v24;
      _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "%@ failed to instantiate hotspot configuration helper.", buf, 0xCu);

    }
    -[NEHotspotConfigurationManager reportError:completionHandler:]((uint64_t)self, 107, v7);
  }

LABEL_17:
}

- (void)removeConfigurationForSSID:(NSString *)SSID
{
  NSString *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = SSID;
  +[NEHotspotConfigurationHelper sharedManager]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v4, v3, 1, 0);
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = (id)objc_opt_class();
      v7 = v9;
      _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "%@ failed to instantiate hotspot configuration helper.", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)removeConfigurationForHS20DomainName:(NSString *)domainName
{
  NSString *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = domainName;
  +[NEHotspotConfigurationHelper sharedManager]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v4, v3, 1, 0);
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = (id)objc_opt_class();
      v7 = v9;
      _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "%@ failed to instantiate hotspot configuration helper.", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)getConfiguredSSIDsWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  NSObject *v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = completionHandler;
  if (v3)
  {
    +[NEHotspotConfigurationHelper sharedManager]();
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke;
      v7[3] = &unk_1E3CC0958;
      v8 = v3;
      -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v4, 0, 2, v7);
      v5 = v8;
    }
    else
    {
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = (id)objc_opt_class();
        v6 = v10;
        _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "%@ Failed to instantiate NEHotspotConfigurationHelper.", buf, 0xCu);

      }
    }

  }
  else
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "no completion handler providd.", buf, 2u);
    }
  }

}

- (void)joinAccessoryHotspot:(id)a3 passphrase:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NEHotspotConfiguration *v11;
  NSObject *v12;
  NEHotspotConfigurationManager *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "SSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = (id)objc_opt_class();
      v16 = v19;
      _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "%@ ASAccessory object not provided", (uint8_t *)&v18, 0xCu);

    }
    v13 = self;
    v14 = 101;
    goto LABEL_10;
  }
  if (!v8)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = (id)objc_opt_class();
      v17 = v19;
      _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "%@ passphrase string not provided", (uint8_t *)&v18, 0xCu);

    }
    v13 = self;
    v14 = 102;
LABEL_10:
    -[NEHotspotConfigurationManager reportError:completionHandler:]((uint64_t)v13, v14, v9);
    goto LABEL_11;
  }
  v11 = -[NEHotspotConfiguration initWithSSID:passphrase:isWEP:]([NEHotspotConfiguration alloc], "initWithSSID:passphrase:isWEP:", v10, v8, 0);
  -[NEHotspotConfiguration setJoinOnce:](v11, "setJoinOnce:", 1);
  -[NEHotspotConfiguration setIsAccessory:](v11, "setIsAccessory:", 1);
  -[NEHotspotConfigurationManager applyConfiguration:completionHandler:](self, "applyConfiguration:completionHandler:", v11, v9);

LABEL_11:
}

- (void)joinAccessoryHotspotWithoutSecurity:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NEHotspotConfiguration *v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "SSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[NEHotspotConfiguration initWithSSID:]([NEHotspotConfiguration alloc], "initWithSSID:", v7);
    -[NEHotspotConfiguration setJoinOnce:](v8, "setJoinOnce:", 1);
    -[NEHotspotConfiguration setIsAccessory:](v8, "setIsAccessory:", 1);
    -[NEHotspotConfigurationManager applyConfiguration:completionHandler:](self, "applyConfiguration:completionHandler:", v8, v6);

  }
  else
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = (id)objc_opt_class();
      v10 = v12;
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "%@ ASAccessory object not provided", (uint8_t *)&v11, 0xCu);

    }
    -[NEHotspotConfigurationManager reportError:completionHandler:]((uint64_t)self, 101, v6);

  }
}

- (void)reportError:(void *)a3 completionHandler:
{
  id v5;
  void *v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v5 = a3;
  v6 = v5;
  if (a1 && v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__NEHotspotConfigurationManager_reportError_completionHandler___block_invoke;
    block[3] = &unk_1E3CC3B80;
    block[4] = a1;
    v8 = v5;
    v9 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __63__NEHotspotConfigurationManager_reportError_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v1 = a1[5];
  if (a1[4])
  {
    v2 = 0;
    v3 = a1[6];
    switch(v3)
    {
      case 0:
        break;
      case 1:
        v5 = CFSTR("failed to get user's approval.");
        v6 = 7;
        goto LABEL_23;
      case 2:
LABEL_7:
        v5 = CFSTR("internal error.");
        v6 = 8;
        goto LABEL_23;
      case 3:
        v5 = CFSTR("pending request.");
        v6 = 9;
        goto LABEL_23;
      case 4:
        v5 = CFSTR("unknown error.");
        goto LABEL_16;
      case 5:
        v5 = CFSTR("cannot modify system configuration.");
        v6 = 10;
        goto LABEL_23;
      case 6:
        v5 = CFSTR("already associated.");
        v6 = 13;
        goto LABEL_23;
      case 7:
      case 9:
LABEL_15:
        v5 = CFSTR("<unknown>");
LABEL_16:
        v6 = 11;
        goto LABEL_23;
      case 8:
        v5 = CFSTR("application is not in the foreground.");
        v6 = 14;
        goto LABEL_23;
      case 10:
        v5 = CFSTR("accessory access is unauthorized by the user.");
        v6 = 16;
        goto LABEL_23;
      case 11:
        v5 = CFSTR("system denied configuration of the accessory network.");
        v6 = 17;
LABEL_23:
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v11 = *MEMORY[0x1E0CB2D50];
        v12[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("NEHotspotConfigurationErrorDomain"), v6, v8);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        v2 = v9;
        break;
      default:
        v4 = v3 - 100;
        v5 = CFSTR("invalid SSID.");
        v6 = 1;
        switch(v4)
        {
          case 0:
            goto LABEL_24;
          case 1:
            goto LABEL_23;
          case 2:
            v5 = CFSTR("invalid WPA/WPA2 Passphrase.");
            v6 = 2;
            goto LABEL_23;
          case 3:
            v5 = CFSTR("invalid WEP Passphrase.");
            v6 = 3;
            goto LABEL_23;
          case 4:
            v5 = CFSTR("invalid EAP settings.");
            v6 = 4;
            goto LABEL_23;
          case 5:
            v5 = CFSTR("invalid Hotspot 2.0 Settings.");
            v6 = 5;
            goto LABEL_23;
          case 6:
            v5 = CFSTR("invalid Hotspot 2.0 Domain Name.");
            v6 = 6;
            goto LABEL_23;
          case 7:
            goto LABEL_7;
          case 9:
            v5 = CFSTR("JoinOnce is not supported for EAP security type.");
            v6 = 12;
            goto LABEL_23;
          case 10:
            v5 = CFSTR("invalid SSID Prefix.");
            v6 = 15;
            goto LABEL_23;
          default:
            goto LABEL_15;
        }
    }
  }
  else
  {
    v2 = 0;
  }
LABEL_24:
  v10 = v2;
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E3CC46A8;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t (*v2)(void);

  if (*(_QWORD *)(a1 + 32) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  else
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  return v2();
}

void __70__NEHotspotConfigurationManager_applyConfiguration_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412546;
    v7 = (id)objc_opt_class();
    v8 = 2048;
    v9 = a2;
    v5 = v7;
    _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "%@ received result code %lld", (uint8_t *)&v6, 0x16u);

  }
  -[NEHotspotConfigurationManager reportError:completionHandler:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40));
}

+ (NEHotspotConfigurationManager)sharedManager
{
  if (sharedManager_init_manager_7270 != -1)
    dispatch_once(&sharedManager_init_manager_7270, &__block_literal_global_7271);
  return (NEHotspotConfigurationManager *)(id)sharedManager_g_manager_7272;
}

void __46__NEHotspotConfigurationManager_sharedManager__block_invoke()
{
  NEHotspotConfigurationManager *v0;
  void *v1;

  v0 = objc_alloc_init(NEHotspotConfigurationManager);
  v1 = (void *)sharedManager_g_manager_7272;
  sharedManager_g_manager_7272 = (uint64_t)v0;

}

@end

@implementation NSPPrivateAccessTokenClientState

- (NSPPrivateAccessTokenClientState)init
{
  NSPPrivateAccessTokenClientState *v2;
  __SecKey *v3;
  __SecKey *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  SecKeyRef RandomKey;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  SEL v14;
  NSObject *v15;
  const char *v16;
  size_t v17;
  void *v18;
  void *v19;
  SEL v20;
  SEL v21;
  NSPPrivateAccessTokenClientState *v22;
  objc_super v24;
  uint8_t buf[16];
  uint8_t v26[8];
  uint64_t v27;
  uint8_t v28[8];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)NSPPrivateAccessTokenClientState;
  v2 = -[NSPPrivateAccessTokenClientState init](&v24, sel_init);
  if (v2)
  {
    v3 = +[NPUtilities copyKeyFromKeychainWithIdentifier:](NPUtilities, "copyKeyFromKeychainWithIdentifier:", CFSTR("com.apple.NetworkServiceProxy.PrivateAccessTokens.ClientKey"));
    if (v3)
    {
      v4 = v3;
      nplog_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v28 = 0;
        _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Found client key in keychain", v28, 2u);
      }

      v2->_clientKey = v4;
    }
    else if (!v2->_clientKey)
    {
      v6 = *MEMORY[0x1E0CD6A50];
      v7 = *MEMORY[0x1E0CD6A20];
      *(_QWORD *)v26 = *MEMORY[0x1E0CD6A38];
      v27 = v7;
      *(_QWORD *)v28 = v6;
      v29 = &unk_1E4151540;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v26, 2);
      v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      RandomKey = SecKeyCreateRandomKey(v8, 0);
      if (RandomKey)
      {
        v2->_clientKey = RandomKey;
        +[NPUtilities saveKeyToKeychain:withIdentifier:](NPUtilities, "saveKeyToKeychain:withIdentifier:", RandomKey, CFSTR("com.apple.NetworkServiceProxy.PrivateAccessTokens.ClientKey"));
        nplog_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "Generated new client key", buf, 2u);
        }
      }
      else
      {
        nplog_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_ERROR, "SecKeyCreateRandomKey failed to generate client key", buf, 2u);
        }
      }

    }
    v12 = +[NPUtilities copyDataFromKeychainWithIdentifier:accountName:](NPUtilities, "copyDataFromKeychainWithIdentifier:accountName:", CFSTR("com.apple.NetworkServiceProxy.PrivateAccessTokens.Secret"), CFSTR("client-tokens"));
    if (v12)
    {
      nplog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v28 = 0;
        _os_log_debug_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_DEBUG, "Found client secret in keychain", v28, 2u);
      }

      objc_setProperty_atomic(v2, v14, v12, 16);
      goto LABEL_28;
    }
    if (objc_getProperty(v2, v11, 16, 1))
    {
LABEL_28:
      v22 = v2;
      goto LABEL_29;
    }
    *(_DWORD *)v28 = 0;
    ccrng();
    if (*(_DWORD *)v28)
    {
      nplog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        v16 = "Failed to generate random";
LABEL_24:
        _os_log_error_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_ERROR, v16, v26, 2u);
      }
    }
    else
    {
      v17 = (32 * *(_QWORD *)MEMORY[0x1A1AEA080]()) | 0x10;
      v18 = malloc_type_calloc(1uLL, v17, 0x5C22F50FuLL);
      if (!ccec_generate_key())
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v18, v17);
        objc_setProperty_atomic(v2, v20, v19, 16);

        free(v18);
        +[NPUtilities saveDataToKeychain:withIdentifier:accountName:](NPUtilities, "saveDataToKeychain:withIdentifier:accountName:", objc_getProperty(v2, v21, 16, 1), CFSTR("com.apple.NetworkServiceProxy.PrivateAccessTokens.Secret"), CFSTR("client-tokens"));
        nplog_obj();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v26 = 0;
          _os_log_debug_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_DEBUG, "Generated new client secret", v26, 2u);
        }
        goto LABEL_27;
      }
      nplog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        v16 = "Failed to generate key";
        goto LABEL_24;
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  nplog_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_fault_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_FAULT, "[super init] failed", v28, 2u);
  }
LABEL_29:

  return v2;
}

- (void)dealloc
{
  __SecKey *clientKey;
  objc_super v4;

  if (self)
  {
    clientKey = self->_clientKey;
    if (clientKey)
    {
      CFRelease(clientKey);
      self->_clientKey = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSPPrivateAccessTokenClientState;
  -[NSPPrivateAccessTokenClientState dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSecret, 0);
}

@end

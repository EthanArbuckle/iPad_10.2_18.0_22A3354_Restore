@implementation VSApplicationBootURLOperation

- (VSApplicationBootURLOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSApplicationBootURLOperation)initWithBootURL:(id)a3 isDeveloper:(BOOL)a4
{
  id v7;
  VSApplicationBootURLOperation *v8;
  VSApplicationBootURLOperation *v9;
  VSPreferences *v10;
  VSPreferences *preferences;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSApplicationBootURLOperation;
  v8 = -[VSApplicationBootURLOperation init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    v9->_developer = a4;
    v10 = objc_alloc_init(VSPreferences);
    preferences = v9->_preferences;
    v9->_preferences = v10;

  }
  return v9;
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  id buf;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[VSApplicationBootURLOperation url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VSApplicationBootURLOperation isForTesting](self, "isForTesting"))
  {
    v5 = 0;
  }
  else
  {
    -[VSApplicationBootURLOperation preferences](self, "preferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "allowInsecureAuthContext");

  }
  if (-[VSApplicationBootURLOperation isDeveloper](self, "isDeveloper"))
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "URL is for a developer added provider, skipping system trust verification.", (uint8_t *)&buf, 2u);
    }
LABEL_7:

    +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSApplicationBootURLOperation setUrlOrError:](self, "setUrlOrError:", v8);

    -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
    goto LABEL_19;
  }
  if (-[VSApplicationBootURLOperation skipSystemTrustVerification](self, "skipSystemTrustVerification"))
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "System trust is set to be skipped, skipping system trust verification.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_7;
  }
  if (v4
    && ((objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CB3318]) & 1) != 0
     || ((objc_msgSend(v4, "isEqualToString:", CFSTR("https")) | v5) & 1) != 0))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB37A8]);
    -[VSApplicationBootURLOperation url](self, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithURL:", v10);

    objc_msgSend(v11, "_setNonAppInitiated:", 1);
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VSApplicationBootURLOperation isForTesting](self, "isForTesting"))
      objc_msgSend(v12, "setRequestCachePolicy:", 1);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v12, self, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&buf, self);
    -[VSApplicationBootURLOperation url](self, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v14);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke;
    v21[3] = &unk_1E93A10D8;
    objc_copyWeak(&v22, &buf);
    objc_copyWeak(&v23, &location);
    objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v11, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resume");

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    objc_destroyWeak(&buf);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("URL_BAD_SCHEME_ERROR_DESCRIPTION"), 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VSErrorDomain"), 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSApplicationBootURLOperation setUrlOrError:](self, "setUrlOrError:", v20);

    -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
  }
LABEL_19:

}

void __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7)
  {
    VSErrorLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_4(v9, (uint64_t)v7, v10);

    v11 = v7;
    if (objc_msgSend(v11, "code") == -999)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SYSTEM_TRUST_VERIFICATION_ERROR_DESCRIPTION"), 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = *MEMORY[0x1E0CB2D50];
      v31[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VSErrorDomain"), 6, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[VSFailable failableWithError:](VSFailable, "failableWithError:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setUrlOrError:", v16);

LABEL_29:
LABEL_30:

      goto LABEL_31;
    }
LABEL_28:
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setUrlOrError:", v13);
    goto LABEL_29;
  }
  if (v6)
  {
    if ((objc_msgSend(WeakRetained, "isForTesting") & 1) != 0)
    {
      VSDefaultLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2419000, v17, OS_LOG_TYPE_DEFAULT, "Boot URL fetched for testing or EV was skipped, skipping storage.", buf, 2u);
      }

      +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setUrlOrError:", v11);
      goto LABEL_30;
    }
    v19 = v6;
    objc_msgSend(WeakRetained, "generateFilePathForURL:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v27 = 0;
      objc_msgSend(v19, "writeToFile:options:error:", v20, 0, &v27);
      v11 = v27;
      if (v11)
      {
        VSErrorLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_3();

        v22 = v11;
      }
      else
      {
        VSDefaultLogObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v20;
          _os_log_impl(&dword_1D2419000, v24, OS_LOG_TYPE_DEFAULT, "Wrote boot URL contents to %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setUrlOrError:", v26);

      }
    }
    else
    {
      VSErrorLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_2();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VSErrorDomain"), 2, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (v11)
      goto LABEL_28;
  }
  else
  {
    VSErrorLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_1(v9, v18);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VSErrorDomain"), 1, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_28;
  }
LABEL_31:
  objc_msgSend(WeakRetained, "finishExecutionIfPossible");

}

- (id)generateFilePathForURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  _QWORD v27[3];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  NSTemporaryDirectory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4)
  {
    VSErrorLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[VSApplicationBootURLOperation generateFilePathForURL:].cold.1();
    goto LABEL_12;
  }
  v6 = (void *)MEMORY[0x1E0C99E98];
  v28[0] = v4;
  v28[1] = CFSTR("com.apple.VideoSubscriberAccount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPathComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    VSErrorLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[VSApplicationBootURLOperation generateFilePathForURL:].cold.2();

LABEL_12:
    v15 = 0;
    goto LABEL_20;
  }
  v9 = v9;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 0, 0, &v26);
  v11 = v26;

  if (v11)
  {
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
    {
      v13 = objc_msgSend(v11, "code");

      if (v13 == 516)
        goto LABEL_17;
    }
    else
    {

    }
    VSErrorLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[VSApplicationBootURLOperation generateFilePathForURL:].cold.3((uint64_t)v11, v16, v17);

  }
LABEL_17:
  objc_msgSend(v3, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [url absoluteString] parameter must not be nil."));
  objc_msgSend(v3, "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "hash"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E98];
  v27[0] = v5;
  v27[1] = CFSTR("com.apple.VideoSubscriberAccount");
  v27[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fileURLWithPathComponents:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v15;
}

- (BOOL)validateTrust:(__SecTrust *)a3
{
  BOOL v3;
  NSObject *v4;
  uint64_t v5;
  CFErrorRef error;

  error = 0;
  v3 = SecTrustEvaluateWithError(a3, &error);
  if (!v3)
  {
    VSErrorLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[VSApplicationBootURLOperation validateTrust:].cold.1((uint64_t *)&error, v4, v5);

  }
  return v3;
}

- (BOOL)verifyCertificateIsSystemTrustedWithTrust:(__SecTrust *)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  CFArrayRef v9;
  NSObject *v10;
  uint8_t v12[16];

  -[VSApplicationBootURLOperation preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowNonSystemTrust");

  if (!v6)
  {
    if (a3)
    {
      if (-[VSApplicationBootURLOperation validateTrust:](self, "validateTrust:", a3))
      {
        v9 = SecTrustCopyCertificateChain(a3);
        v7 = v9;
        if (v9)
        {
          if (-[__CFArray lastObject](v9, "lastObject"))
          {
            v8 = 1;
            SecTrustStoreForDomain();
            if (SecTrustStoreContains())
              goto LABEL_22;
            VSErrorLogObject();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              -[VSApplicationBootURLOperation verifyCertificateIsSystemTrustedWithTrust:].cold.4();
          }
          else
          {
            VSErrorLogObject();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              -[VSApplicationBootURLOperation verifyCertificateIsSystemTrustedWithTrust:].cold.3();
          }
        }
        else
        {
          VSErrorLogObject();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[VSApplicationBootURLOperation verifyCertificateIsSystemTrustedWithTrust:].cold.2();
        }

      }
      else
      {
        VSErrorLogObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[VSApplicationBootURLOperation verifyCertificateIsSystemTrustedWithTrust:].cold.5();
      }
    }
    else
    {
      VSErrorLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[VSApplicationBootURLOperation verifyCertificateIsSystemTrustedWithTrust:].cold.1();
    }
    v8 = 0;
    goto LABEL_22;
  }
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Skipping system trust requirement due to default override.", v12, 2u);
  }
  v8 = 1;
LABEL_22:

  return v8;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, uint64_t, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v7 = (void (**)(id, uint64_t, void *))a5;
  objc_msgSend(a4, "protectionSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "serverTrust");
  v10 = (void *)SecTrustCopyInfo();
  -[VSApplicationBootURLOperation setTrustInfo:](self, "setTrustInfo:", v10);
  objc_msgSend(v8, "authenticationMethod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB32C8]);

  if (v12)
  {
    if (-[VSApplicationBootURLOperation verifyCertificateIsSystemTrustedWithTrust:](self, "verifyCertificateIsSystemTrustedWithTrust:", v9))
    {
      VSDefaultLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2419000, v13, OS_LOG_TYPE_DEFAULT, "System trust verified.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB39A8], "credentialForTrust:", objc_msgSend(v8, "serverTrust"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
    }
    else
    {
      VSErrorLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[VSApplicationBootURLOperation URLSession:didReceiveChallenge:completionHandler:].cold.1();

      v14 = 0;
      v15 = 2;
    }
  }
  else
  {
    VSDefaultLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D2419000, v16, OS_LOG_TYPE_DEFAULT, "Challenge was not server trust.", v18, 2u);
    }

    v14 = 0;
    v15 = 1;
  }
  v7[2](v7, v15, v14);

}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (BOOL)isDeveloper
{
  return self->_developer;
}

- (void)setDeveloper:(BOOL)a3
{
  self->_developer = a3;
}

- (VSFailable)urlOrError
{
  return self->_urlOrError;
}

- (void)setUrlOrError:(id)a3
{
  objc_storeStrong((id *)&self->_urlOrError, a3);
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (BOOL)isForTesting
{
  return self->_test;
}

- (void)setTest:(BOOL)a3
{
  self->_test = a3;
}

- (BOOL)skipSystemTrustVerification
{
  return self->_skipSystemTrustVerification;
}

- (void)setSkipSystemTrustVerification:(BOOL)a3
{
  self->_skipSystemTrustVerification = a3;
}

- (NSDictionary)trustInfo
{
  return self->_trustInfo;
}

- (void)setTrustInfo:(id)a3
{
  objc_storeStrong((id *)&self->_trustInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustInfo, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_urlOrError, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

void __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D2419000, a2, v4, "Request to application boot URL %@ returned no contents.", (uint8_t *)&v5);

}

void __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Error generating new temporary file path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = v0;
  OUTLINED_FUNCTION_6(&dword_1D2419000, v1, (uint64_t)v1, "Error writing boot URL contents to %@: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __50__VSApplicationBootURLOperation_executionDidBegin__block_invoke_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v8 = a2;
  OUTLINED_FUNCTION_6(&dword_1D2419000, a3, v6, "Error fetching application boot URL contents from %@: %@", v7);

}

- (void)generateFilePathForURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Default temporary directory was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)generateFilePathForURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Temporary subdirectory was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)generateFilePathForURL:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1D2419000, a2, a3, "Error creating temporary directory: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

- (void)validateTrust:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D2419000, a2, a3, "Error validating certificate trust: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Invalid trust provided for system trust verification.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "No certificate chain, failing system trust validation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "No root certificate, failing system trust validation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Root certificate is not system trusted, failing validation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Certificate is not trusted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "System trust verification failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end

@implementation DATrustHandler

- (DATrustHandler)initWithDelegate:(id)a3
{
  id v4;
  DATrustHandler *v5;
  DATrustHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DATrustHandler;
  v5 = -[DATrustHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (BOOL)haveWarnedAboutCert:(id)a3 forHost:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_haveWarnedAboutCertDict, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = objc_msgSend(v7, "containsObject:", v6);
  else
    v9 = v7 != 0;

  return v9;
}

- (void)setHaveWarnedAboutCert:(id)a3 forHost:(id)a4
{
  id v6;
  NSMutableDictionary *haveWarnedAboutCertDict;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  haveWarnedAboutCertDict = self->_haveWarnedAboutCertDict;
  if (!haveWarnedAboutCertDict)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_haveWarnedAboutCertDict;
    self->_haveWarnedAboutCertDict = v8;

    haveWarnedAboutCertDict = self->_haveWarnedAboutCertDict;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](haveWarnedAboutCertDict, "objectForKeyedSubscript:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_haveWarnedAboutCertDict, "setObject:forKeyedSubscript:", v10, v11);
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v6)
LABEL_5:
    objc_msgSend(v10, "addObject:", v6);
LABEL_6:

}

- (BOOL)resetCertWarnings
{
  NSMutableDictionary *haveWarnedAboutCertDict;

  haveWarnedAboutCertDict = self->_haveWarnedAboutCertDict;
  self->_haveWarnedAboutCertDict = 0;

  return 1;
}

- (int)_actionForTrust:(__SecTrust *)a3 host:(id)a4 service:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  const void *v14;
  CFDataRef v15;
  CFDataRef v16;
  void *v18;
  void *v19;

  v8 = a4;
  v9 = a5;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "actionForTrust:forHost:andService:", a3, v8, v9);

    if (v11 == 2)
    {
      if (SecTrustGetCertificateCount(a3))
      {
        SecTrustGetCertificateAtIndex(a3, 0);
        v12 = (id)SecCertificateGetSHA1Digest();
        if (v12)
        {
          -[DATrustHandler delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (const void *)objc_msgSend(v13, "exceptionsForDigest:", v12);

          if (v14)
          {
            v15 = SecTrustCopyExceptions(a3);
            if (v15)
            {
              v16 = v15;
              if (CFEqual(v14, v15))
              {
                v11 = 2;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "allowTrust:forHost:service:", a3, v8, v9);

                -[DATrustHandler delegate](self, "delegate");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setExceptions:forDigest:", 0, v12);

                v11 = 1;
              }
              CFRelease(v16);
              goto LABEL_12;
            }
          }
        }
      }
      else
      {
        v12 = 0;
      }
      v11 = 2;
LABEL_12:

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_serverSuffixesToAlwaysFail
{
  if (_serverSuffixesToAlwaysFail_onceToken != -1)
    dispatch_once(&_serverSuffixesToAlwaysFail_onceToken, &__block_literal_global_12);
  return (id)_serverSuffixesToAlwaysFail__sServerSuffixes;
}

void __45__DATrustHandler__serverSuffixesToAlwaysFail__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR(".me.com"), CFSTR(".icloud.com"), 0);
  v1 = (void *)_serverSuffixesToAlwaysFail__sServerSuffixes;
  _serverSuffixesToAlwaysFail__sServerSuffixes = v0;

}

- (void)handleTrust:(__SecTrust *)a3 forHost:(id)a4 forAccount:(id)a5 withCompletionBlock:(id)a6
{
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  uint64_t v12;
  os_log_type_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  id v29;
  id v30;
  BOOL v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  id v44;
  _QWORD v45[4];
  id v46;
  DATrustHandler *v47;
  id v48;
  id v49;
  void (**v50)(id, uint64_t);
  __SecTrust *v51;
  _QWORD v52[4];
  id v53;
  _BYTE *v54;
  uint8_t v55[4];
  id v56;
  _BYTE buf[24];
  char v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v44 = a5;
  v10 = (void (**)(id, uint64_t))a6;
  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0D1C448];
  v13 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v11, v13))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B51E4000, v11, v13, "Checking to see if we should trust the server certificate", buf, 2u);
  }

  v14 = (id)*MEMORY[0x1E0D0D590];
  if (!a3)
  {
    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = *(unsigned __int8 *)(v12 + 3);
    if (os_log_type_enabled(v15, *(os_log_type_t *)(v12 + 3)))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1B51E4000, v15, (os_log_type_t)v21, "Terminating connection because server does not have an SSL certificate. Host: %@", buf, 0xCu);
    }
    v20 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v44, "accountPropertyForKey:", CFSTR("DAAccountUseTrustedSSLCertificate"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "rawTrustResultForSSLTrust:hostname:service:", a3, v9, v14);

  if (v17 == 1)
    goto LABEL_11;
  if (v17 != 5)
  {
    if (v17 != 4)
    {
      DALoggingwithCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, v13))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v17;
        _os_log_impl(&dword_1B51E4000, v19, v13, "Got SecTrustEvaluate result %u. Denying.", buf, 8u);
      }
      v20 = 0;
      goto LABEL_25;
    }
    if ((-[NSObject BOOLValue](v15, "BOOLValue") & 1) == 0)
    {
      DALoggingwithCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, v13))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = CFSTR("DAAccountUseTrustedSSLCertificate");
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v44;
        _os_log_impl(&dword_1B51E4000, v18, v13, "Account now requires trusted certificate. Setting %@ to YES for account: %@", buf, 0x16u);
      }

      objc_msgSend(v44, "setAccountProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("DAAccountUseTrustedSSLCertificate"));
      objc_msgSend(v44, "updateExistingAccountProperties");
    }
LABEL_11:
    DALoggingwithCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, v13))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v17;
      _os_log_impl(&dword_1B51E4000, v19, v13, "Got SecTrustEvaluate result %u. Allowing.", buf, 8u);
    }
    v20 = 1;
LABEL_25:

LABEL_26:
    v29 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v58 = 1;
LABEL_27:
    v10[2](v10, v20);
    goto LABEL_28;
  }
  DALoggingwithCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, v13))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 5;
    _os_log_impl(&dword_1B51E4000, v22, v13, "Got SecTrustEvaluate result %u. Checking if needing to prompt.", buf, 8u);
  }

  v42 = -[NSObject BOOLValue](v15, "BOOLValue");
  DALoggingwithCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v42)
  {
    v25 = *(_BYTE *)(v12 + 3);
    if (os_log_type_enabled(v23, v25))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v44;
      v26 = "Terminating connection and warning user about an untrusted SSL certificate. The account requires trusted SSL"
            " certificate. Account: %@";
      v27 = v24;
      v28 = v25;
LABEL_31:
      _os_log_impl(&dword_1B51E4000, v27, v28, v26, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v23, v13))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v44;
    v26 = "Account does not require trusted certificate. Prompting user. Account: %@";
    v27 = v24;
    v28 = v13;
    goto LABEL_31;
  }

  if (SecTrustGetCertificateCount(a3)
    && (SecTrustGetCertificateAtIndex(a3, 0),
        (v30 = (id)SecCertificateGetSHA1Digest()) != 0))
  {
    v29 = v30;
    v31 = -[DATrustHandler haveWarnedAboutCert:forHost:](self, "haveWarnedAboutCert:forHost:", v30, v9);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v58 = 1;
    if (v31)
    {
LABEL_49:
      v20 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    v29 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v58 = 1;
  }
  if ((objc_msgSend(MEMORY[0x1E0D1C3E8], "promptForAllCerts") & 1) == 0)
  {
    objc_msgSend(v9, "lowercaseString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[DATrustHandler _serverSuffixesToAlwaysFail](self, "_serverSuffixesToAlwaysFail");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke;
    v52[3] = &unk_1E68CBE50;
    v34 = v32;
    v53 = v34;
    v54 = buf;
    objc_msgSend(v33, "enumerateObjectsUsingBlock:", v52);

  }
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    DALoggingwithCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = *(_BYTE *)(v12 + 4);
    if (os_log_type_enabled(v35, v36))
    {
      *(_DWORD *)v55 = 138412290;
      v56 = v9;
      _os_log_impl(&dword_1B51E4000, v35, v36, "IT'S A TARP!!! We received an untrusted cert for %@. You really think we're going to fall for that?", v55, 0xCu);
    }

    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      goto LABEL_49;
  }
  DALoggingwithCategory();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, v13))
  {
    *(_DWORD *)v55 = 138412290;
    v56 = v9;
    _os_log_impl(&dword_1B51E4000, v37, v13, "prompting certificate for host: %@", v55, 0xCu);
  }

  v38 = (void *)objc_opt_new();
  objc_msgSend(v38, "setTrust:", a3);
  objc_msgSend(v38, "setHost:", v9);
  objc_msgSend(v38, "setService:", v14);
  -[DATrustHandler delegate](self, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "accountDescription");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setConnectionDisplayName:", v40);

  if (v42)
  {
    v41 = (void *)objc_opt_new();
    objc_msgSend(v41, "setObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D0D5A8]);
  }
  else
  {
    v41 = 0;
  }
  CFRetain(a3);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke_10;
  v45[3] = &unk_1E68CBEA0;
  v29 = v29;
  v46 = v29;
  v47 = self;
  v48 = v9;
  v51 = a3;
  v49 = v14;
  v50 = v10;
  objc_msgSend(v38, "showPromptWithOptions:responseBlock:", v41, v45);

LABEL_28:
  _Block_object_dispose(buf, 8);

}

void __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasSuffix:") & 1) != 0
    || (v5 = *(void **)(a1 + 32),
        objc_msgSend(v7, "substringFromIndex:", 1),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        (_DWORD)v5))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }

}

void __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke_10(uint64_t a1, int a2)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;

  dataaccess_get_global_queue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke_2;
  block[3] = &unk_1E68CBE78;
  v17 = a2;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v11 = v5;
  v12 = v6;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 72);
  v13 = v8;
  v16 = v9;
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  dispatch_async(v4, block);

}

uint64_t __69__DATrustHandler_handleTrust_forHost_forAccount_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_DWORD *)(a1 + 80);
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_1B51E4000, v2, v3, "got prompt response %d", (uint8_t *)v9, 8u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setHaveWarnedAboutCert:forHost:", v5, *(_QWORD *)(a1 + 48));
  if (*(_DWORD *)(a1 + 80) == 2)
  {
    objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allowTrust:forHost:service:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  v7 = *(const void **)(a1 + 72);
  if (v7)
    CFRelease(v7);
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_DWORD *)(a1 + 80) != 0);
}

- (BOOL)handleTrustChallenge:(id)a3 forAccount:(id)a4
{
  return -[DATrustHandler handleTrustChallenge:forAccount:completionHandler:](self, "handleTrustChallenge:forAccount:completionHandler:", a3, a4, 0);
}

- (BOOL)handleTrustChallenge:(id)a3 forAccount:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v21;
  DATrustHandler *v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (handleTrustChallenge_forAccount_completionHandler__onceToken != -1)
    dispatch_once(&handleTrustChallenge_forAccount_completionHandler__onceToken, &__block_literal_global_12);
  -[DATrustHandler delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistentUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[DAPowerAssertionManager sharedPowerAssertionManager](DAPowerAssertionManager, "sharedPowerAssertionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dropPowerAssertionsForGroupIdentifier:", v12);

  v14 = handleTrustChallenge_forAccount_completionHandler__sTrustChallengeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__DATrustHandler_handleTrustChallenge_forAccount_completionHandler___block_invoke_2;
  block[3] = &unk_1E68CBF10;
  v21 = v8;
  v22 = self;
  v23 = v9;
  v24 = v12;
  v25 = v10;
  v15 = v10;
  v16 = v12;
  v17 = v9;
  v18 = v8;
  dispatch_async(v14, block);

  return 0;
}

void __68__DATrustHandler_handleTrustChallenge_forAccount_completionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  dispatch_semaphore_t v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.dataaccess.trustChallengeQueue", 0);
  v1 = (void *)handleTrustChallenge_forAccount_completionHandler__sTrustChallengeQueue;
  handleTrustChallenge_forAccount_completionHandler__sTrustChallengeQueue = (uint64_t)v0;

  v2 = dispatch_semaphore_create(1);
  v3 = (void *)handleTrustChallenge_forAccount_completionHandler__outstandingTrustChallengeLock;
  handleTrustChallenge_forAccount_completionHandler__outstandingTrustChallengeLock = (uint64_t)v2;

}

void __68__DATrustHandler_handleTrustChallenge_forAccount_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B51E4000, v2, v3, "Grabbing trust challenge lock...", buf, 2u);
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)handleTrustChallenge_forAccount_completionHandler__outstandingTrustChallengeLock, 0xFFFFFFFFFFFFFFFFLL);
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B51E4000, v4, v3, "Lock acquired. Checking trust.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "protectionSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "protectionSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "serverTrust");

  v9 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__DATrustHandler_handleTrustChallenge_forAccount_completionHandler___block_invoke_15;
  v11[3] = &unk_1E68CBEE8;
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 64);
  objc_msgSend(v9, "handleTrust:forHost:forAccount:withCompletionBlock:", v8, v6, v10, v11);

}

void __68__DATrustHandler_handleTrustChallenge_forAccount_completionHandler___block_invoke_15(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  const __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[DAPowerAssertionManager sharedPowerAssertionManager](DAPowerAssertionManager, "sharedPowerAssertionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reattainPowerAssertionsForGroupIdentifier:", *(_QWORD *)(a1 + 32));

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = CFSTR("Not ");
    if (a2)
      v7 = &stru_1E68CCDC0;
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1B51E4000, v5, v6, "%@Continuing connection", (uint8_t *)&v14, 0xCu);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)handleTrustChallenge_forAccount_completionHandler__outstandingTrustChallengeLock);
  if (a2)
  {
    v8 = objc_alloc(MEMORY[0x1E0C92C60]);
    objc_msgSend(*(id *)(a1 + 40), "protectionSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTrust:", objc_msgSend(v9, "serverTrust"));

    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
    {
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "sender");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "useCredential:forAuthenticationChallenge:", v10, *(_QWORD *)(a1 + 40));

    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, 1, 0);
      return;
    }
    objc_msgSend(*(id *)(a1 + 40), "sender");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "continueWithoutCredentialForAuthenticationChallenge:", *(_QWORD *)(a1 + 40));
  }

}

- (DATrustHandlerDelegate)delegate
{
  return (DATrustHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)haveWarnedAboutCertDict
{
  return self->_haveWarnedAboutCertDict;
}

- (void)setHaveWarnedAboutCertDict:(id)a3
{
  objc_storeStrong((id *)&self->_haveWarnedAboutCertDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_haveWarnedAboutCertDict, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation NSPPrivateAccessTokenFetcher

- (NSPPrivateAccessTokenFetcher)initWithChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSPPrivateAccessTokenFetcher *v11;
  const char *v12;
  NSPPrivateAccessTokenFetcher *v13;
  SEL v14;
  SEL v15;
  NSObject *v17;
  const char *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    nplog_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
LABEL_9:

LABEL_12:
      v13 = 0;
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v21 = "-[NSPPrivateAccessTokenFetcher initWithChallenge:tokenKey:originNameKey:]";
    v18 = "%s called with null challenge";
LABEL_14:
    _os_log_fault_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v9)
  {
    nplog_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    v21 = "-[NSPPrivateAccessTokenFetcher initWithChallenge:tokenKey:originNameKey:]";
    v18 = "%s called with null tokenKey";
    goto LABEL_14;
  }
  v19.receiver = self;
  v19.super_class = (Class)NSPPrivateAccessTokenFetcher;
  v11 = -[NSPPrivateAccessTokenFetcher init](&v19, sel_init);
  if (!v11)
  {
    nplog_obj();
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19E8FE000, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    goto LABEL_12;
  }
  v13 = v11;
  objc_setProperty_atomic(v11, v12, v8, 48);
  objc_setProperty_atomic(v13, v14, v9, 64);
  objc_setProperty_atomic(v13, v15, v10, 72);
LABEL_5:

  return v13;
}

- (id)initForKnownIssuerWithChallenge:(id)a3
{
  id v4;
  NSPPrivateAccessTokenFetcher *v5;
  const char *v6;
  NSPPrivateAccessTokenFetcher *v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithChallenge:]";
      _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, "%s called with null challenge", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v10.receiver = self;
  v10.super_class = (Class)NSPPrivateAccessTokenFetcher;
  v5 = -[NSPPrivateAccessTokenFetcher init](&v10, sel_init);
  if (!v5)
  {
    nplog_obj();
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19E8FE000, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
LABEL_10:

    v7 = 0;
    goto LABEL_4;
  }
  v7 = v5;
  objc_setProperty_atomic(v5, v6, v4, 48);
LABEL_4:

  return v7;
}

- (id)initForKnownIssuerWithLongLivedTokenChallenge:(id)a3 oneTimeTokenChallenge:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSPPrivateAccessTokenFetcher *v9;
  const char *v10;
  NSPPrivateAccessTokenFetcher *v11;
  SEL v12;
  NSObject *v14;
  const char *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
LABEL_9:

LABEL_12:
      v11 = 0;
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v18 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithLongLivedTokenChallenge:oneTimeTokenChallenge:]";
    v15 = "%s called with null longLivedTokenChallenge";
LABEL_14:
    _os_log_fault_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v7)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    v18 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithLongLivedTokenChallenge:oneTimeTokenChallenge:]";
    v15 = "%s called with null oneTimeTokenChallenge";
    goto LABEL_14;
  }
  v16.receiver = self;
  v16.super_class = (Class)NSPPrivateAccessTokenFetcher;
  v9 = -[NSPPrivateAccessTokenFetcher init](&v16, sel_init);
  if (!v9)
  {
    nplog_obj();
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19E8FE000, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    goto LABEL_12;
  }
  v11 = v9;
  objc_setProperty_atomic(v9, v10, v6, 48);
  objc_setProperty_atomic(v11, v12, v8, 56);
LABEL_5:

  return v11;
}

- (void)addSecondaryChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  NSPPrivateAccessTokenFetcher *v12;
  const char *v13;
  id v14;
  SEL v15;
  id Property;
  NSPPrivateAccessTokenFetcher *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v17 = -[NSPPrivateAccessTokenFetcher initWithChallenge:tokenKey:originNameKey:]([NSPPrivateAccessTokenFetcher alloc], "initWithChallenge:tokenKey:originNameKey:", v10, v9, v8);

  v12 = v17;
  if (v17)
  {
    if (self)
    {
      if (!objc_getProperty(self, v11, 80, 1))
      {
        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_setProperty_atomic(self, v15, v14, 80);

      }
      Property = objc_getProperty(self, v13, 80, 1);
    }
    else
    {

      Property = 0;
    }
    objc_msgSend(Property, "addObject:", v17);
    v12 = v17;
  }

}

- (void)setCustomAttester:(id)a3 headers:(id)a4
{
  SEL v6;
  SEL v7;
  id newValue;

  if (self)
  {
    newValue = a4;
    objc_setProperty_atomic(self, v6, a3, 32);
    objc_setProperty_atomic(self, v7, newValue, 40);

  }
}

- (void)fetchTokenWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v16 = "-[NSPPrivateAccessTokenFetcher fetchTokenWithQueue:completionHandler:]";
    v11 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_FAULT, v11, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v7)
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v16 = "-[NSPPrivateAccessTokenFetcher fetchTokenWithQueue:completionHandler:]";
    v11 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  getServerConnection();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__NSPPrivateAccessTokenFetcher_fetchTokenWithQueue_completionHandler___block_invoke;
  v12[3] = &unk_1E4137C78;
  v13 = v6;
  v14 = v8;
  objc_msgSend(v9, "fetchPrivateAccessTokenWithFetcher:completionHandler:", self, v12);

  v10 = v13;
LABEL_4:

}

void __70__NSPPrivateAccessTokenFetcher_fetchTokenWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_error_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch private access token: %@", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__NSPPrivateAccessTokenFetcher_fetchTokenWithQueue_completionHandler___block_invoke_135;
  block[3] = &unk_1E4137A28;
  v8 = *(NSObject **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

uint64_t __70__NSPPrivateAccessTokenFetcher_fetchTokenWithQueue_completionHandler___block_invoke_135(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchTokenPairWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v16 = "-[NSPPrivateAccessTokenFetcher fetchTokenPairWithQueue:completionHandler:]";
    v11 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_FAULT, v11, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v7)
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v16 = "-[NSPPrivateAccessTokenFetcher fetchTokenPairWithQueue:completionHandler:]";
    v11 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  getServerConnection();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__NSPPrivateAccessTokenFetcher_fetchTokenPairWithQueue_completionHandler___block_invoke;
  v12[3] = &unk_1E4137CA0;
  v13 = v6;
  v14 = v8;
  objc_msgSend(v9, "fetchPrivateAccessTokenPairWithFetcher:completionHandler:", self, v12);

  v10 = v13;
LABEL_4:

}

void __74__NSPPrivateAccessTokenFetcher_fetchTokenPairWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch private access token pair: %@", buf, 0xCu);
    }

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__NSPPrivateAccessTokenFetcher_fetchTokenPairWithQueue_completionHandler___block_invoke_137;
  v17[3] = &unk_1E4137B90;
  v12 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v21 = v13;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v12, v17);

}

uint64_t __74__NSPPrivateAccessTokenFetcher_fetchTokenPairWithQueue_completionHandler___block_invoke_137(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)fetchLinkedTokenPairWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v16 = "-[NSPPrivateAccessTokenFetcher fetchLinkedTokenPairWithQueue:completionHandler:]";
    v11 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_FAULT, v11, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v7)
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v16 = "-[NSPPrivateAccessTokenFetcher fetchLinkedTokenPairWithQueue:completionHandler:]";
    v11 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  getServerConnection();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__NSPPrivateAccessTokenFetcher_fetchLinkedTokenPairWithQueue_completionHandler___block_invoke;
  v12[3] = &unk_1E4137CA0;
  v13 = v6;
  v14 = v8;
  objc_msgSend(v9, "fetchPrivateAccessTokenPairWithFetcher:completionHandler:", self, v12);

  v10 = v13;
LABEL_4:

}

void __80__NSPPrivateAccessTokenFetcher_fetchLinkedTokenPairWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    nplog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      _os_log_error_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch linked private access token pair: %@", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__NSPPrivateAccessTokenFetcher_fetchLinkedTokenPairWithQueue_completionHandler___block_invoke_139;
  block[3] = &unk_1E4137C00;
  v14 = *(NSObject **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v24 = v12;
  v25 = v15;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = v9;
  dispatch_async(v14, block);

}

uint64_t __80__NSPPrivateAccessTokenFetcher_fetchLinkedTokenPairWithQueue_completionHandler___block_invoke_139(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

+ (BOOL)checkOriginAllowedAsThirdParty:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    getServerConnection();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "checkOriginAllowedAsThirdParty:", v3);

  }
  else
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315138;
      v9 = "+[NSPPrivateAccessTokenFetcher checkOriginAllowedAsThirdParty:]";
      _os_log_fault_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_FAULT, "%s called with null origin", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (BOOL)systemClient
{
  return self->_systemClient;
}

- (void)setSystemClient:(BOOL)a3
{
  self->_systemClient = a3;
}

- (NSString)selectedOrigin
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSelectedOrigin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (void)setAuditToken:(id *)a3
{
  objc_copyStruct(&self->_auditToken, a3, 32, 1, 0);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURL)customAttester
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)customAttesterHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFetchers, 0);
  objc_storeStrong((id *)&self->_originNameKey, 0);
  objc_storeStrong((id *)&self->_tokenKey, 0);
  objc_storeStrong((id *)&self->_pairedChallengeData, 0);
  objc_storeStrong((id *)&self->_challengeData, 0);
  objc_storeStrong((id *)&self->_customAttesterHeaders, 0);
  objc_storeStrong((id *)&self->_customAttester, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_selectedOrigin, 0);
}

@end

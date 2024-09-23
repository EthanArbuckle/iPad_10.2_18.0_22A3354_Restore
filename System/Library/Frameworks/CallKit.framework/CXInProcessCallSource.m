@implementation CXInProcessCallSource

- (CXInProcessCallSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return -[CXInProcessCallSource initWithIdentifier:bundleIdentifier:fallbackLocalizedName:](self, "initWithIdentifier:bundleIdentifier:fallbackLocalizedName:", a3, a4, 0);
}

- (CXInProcessCallSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 fallbackLocalizedName:(id)a5
{
  id v8;
  id v9;
  CXInProcessCallSource *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *bundleIdentifier;
  uint64_t v15;
  NSURL *bundleURL;
  void *v17;
  uint64_t v18;
  NSString *localizedName;
  NSObject *v20;
  NSString *v21;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CXInProcessCallSource;
  v10 = -[CXCallSource initWithIdentifier:](&v23, sel_initWithIdentifier_, a3);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CA5870], "cx_applicationRecordForBundleIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "bundleIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      bundleIdentifier = v10->_bundleIdentifier;
      v10->_bundleIdentifier = (NSString *)v13;

      objc_msgSend(v12, "URL");
      v15 = objc_claimAutoreleasedReturnValue();
      bundleURL = v10->_bundleURL;
      v10->_bundleURL = (NSURL *)v15;

      objc_msgSend(v12, "localizedName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      localizedName = v10->_localizedName;
      v10->_localizedName = (NSString *)v18;

    }
    else
    {
      CXDefaultLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v8;
        _os_log_impl(&dword_1A402D000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot find application record for bundle identifier: %@", buf, 0xCu);
      }

      v21 = (NSString *)v9;
      v17 = v10->_localizedName;
      v10->_localizedName = v21;
    }

  }
  return v10;
}

- (void)setProvider:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__CXInProcessCallSource_setProvider___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __37__CXInProcessCallSource_setProvider___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setConnected:", 1);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  *(_OWORD *)retstr->var0 = v3;
  *(_OWORD *)&retstr->var0[4] = v3;
  return ($115C4C562B26FF47E01F9F4EA65B5887 *)auditTokenForTask(*MEMORY[0x1E0C83DA0], retstr);
}

- (BOOL)isPermittedToUsePublicAPI
{
  return 1;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  return 1;
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)bundleURL
{
  return self->_bundleURL;
}

- (id)localizedName
{
  return self->_localizedName;
}

- (CXInProcessProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end

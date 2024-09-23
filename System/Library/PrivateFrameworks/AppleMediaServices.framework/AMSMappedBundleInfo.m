@implementation AMSMappedBundleInfo

- (NSString)accountMediaType
{
  return self->_accountMediaType;
}

+ (id)bundleInfoForProcessInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E2548760;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(&unk_1E25B0280, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "integerValue");
  v11 = -[AMSMappedBundleInfo _initWithClient:processInfo:]([AMSMappedBundleInfo alloc], "_initWithClient:processInfo:", v10, v3);

  return v11;
}

- (id)_initWithClient:(int64_t)a3 processInfo:(id)a4
{
  id v6;
  AMSMappedBundleInfo *v7;
  int64_t v8;
  char v9;
  char v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  __CFString *v18;
  char v19;
  uint64_t v20;
  void *v21;
  AMSProcessInfo *v22;
  uint64_t v23;
  NSString *bundleIdentifier;
  uint64_t v25;
  NSString *clientName;
  uint64_t v27;
  NSString *clientVersion;
  uint64_t v29;
  NSString *accountMediaType;
  NSString *scheme;
  NSString *secureScheme;
  uint64_t v33;
  NSString *proxyAppBundleID;
  uint64_t v35;
  NSString *userAgentSuffix;
  const __CFString *v38;
  objc_super v39;

  v6 = a4;
  v39.receiver = self;
  v39.super_class = (Class)AMSMappedBundleInfo;
  v7 = -[AMSMappedBundleInfo init](&v39, sel_init);
  if (!v7)
    goto LABEL_44;
  v8 = a3 - 1;
  v9 = 0;
  v10 = 0;
  v11 = CFSTR("macappstores");
  v12 = CFSTR("macappstore");
  v13 = CFSTR("3.0");
  v14 = CFSTR("MacAppStore");
  v15 = CFSTR("com.apple.AppStore");
  switch(v8)
  {
    case 0:
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v15 = 0;
      v10 = 1;
      LOBYTE(v20) = 1;
      v38 = CFSTR("AppleTV");
      break;
    case 1:
      v9 = 0;
      v13 = 0;
      v11 = CFSTR("itms-appss");
      v12 = CFSTR("itms-apps");
      v10 = 1;
      v14 = CFSTR("AppStore");
      goto LABEL_29;
    case 2:
      v9 = 0;
      v13 = 0;
      v11 = CFSTR("itms-bookss");
      v12 = CFSTR("itms-books");
      v10 = 1;
      v14 = CFSTR("iBooks");
      v15 = CFSTR("com.apple.iBooks");
      goto LABEL_29;
    case 3:
      v9 = 0;
      v13 = 0;
      v12 = 0;
      v11 = 0;
      v10 = 1;
      v14 = CFSTR("AMSFollowUpExtension");
      v15 = CFSTR("com.apple.AppleMediaServices.FollowUpExtension");
      goto LABEL_29;
    case 4:
      v9 = 0;
      v13 = 0;
      v12 = 0;
      v11 = 0;
      v10 = 1;
      v14 = CFSTR("itunesstored");
      v15 = CFSTR("com.apple.itunesstored");
      goto LABEL_29;
    case 5:
      v9 = 0;
      v13 = 0;
      v11 = CFSTR("itms-itunesus");
      v12 = CFSTR("itms-itunesu");
      v10 = 1;
      v14 = CFSTR("iTunesU");
      v15 = CFSTR("com.apple.itunesu");
      goto LABEL_29;
    case 6:
      v9 = 0;
      v13 = 0;
      v12 = 0;
      v11 = 0;
      v10 = 1;
      v14 = CFSTR("Maps");
      v15 = CFSTR("com.apple.Maps");
      goto LABEL_29;
    case 7:
      v9 = 0;
      v13 = 0;
      v12 = 0;
      v11 = 0;
      v10 = 1;
      v14 = CFSTR("matd");
      v15 = CFSTR("com.apple.WelcomeKit");
      goto LABEL_29;
    case 8:
      v9 = 0;
      v13 = 0;
      v12 = 0;
      v11 = 0;
      v10 = 1;
      v14 = CFSTR("Messages");
      v15 = CFSTR("com.apple.MobileSMS");
      goto LABEL_29;
    case 9:
      v9 = 0;
      v13 = 0;
      v11 = CFSTR("itmss");
      v12 = CFSTR("itms");
      v10 = 1;
      v14 = CFSTR("MobileStore");
      v15 = CFSTR("com.apple.MobileStore");
      goto LABEL_29;
    case 10:
      v9 = 0;
      v13 = 0;
      v11 = CFSTR("musics");
      v12 = CFSTR("music");
      goto LABEL_25;
    case 11:
    case 22:
      v9 = 0;
      v13 = 0;
      v12 = CFSTR("itms-podcasts");
      v10 = 1;
      v14 = CFSTR("Podcasts");
      v15 = CFSTR("com.apple.podcasts");
      goto LABEL_27;
    case 12:
      v9 = 0;
      v13 = 0;
      v12 = 0;
      v11 = 0;
      v10 = 1;
      v14 = CFSTR("StoreKitUIService");
      v15 = CFSTR("com.apple.StoreKitUIService");
      goto LABEL_29;
    case 13:
      v14 = 0;
      v13 = 0;
      v11 = CFSTR("its-videoss");
      v12 = CFSTR("its-videos");
      v9 = 1;
      v10 = 1;
      v15 = CFSTR("com.apple.videos");
      goto LABEL_29;
    case 14:
      v18 = 0;
      v19 = 0;
      v15 = 0;
      v38 = CFSTR("Watch");
      v10 = 1;
      v17 = CFSTR("itms-watch");
      LOBYTE(v20) = 1;
      v16 = CFSTR("itms-watchs");
      break;
    case 15:
      v14 = 0;
      v13 = 0;
      v12 = CFSTR("fitnessapp");
      v9 = 1;
      v15 = CFSTR("com.apple.Fitness");
      v10 = 1;
      goto LABEL_27;
    case 16:
      v14 = 0;
      v13 = 0;
      v9 = 1;
      v15 = CFSTR("com.apple.tv");
      v10 = 1;
      v12 = CFSTR("com.apple.tv");
      v11 = CFSTR("com.apple.tv");
      goto LABEL_29;
    case 17:
    case 24:
      v9 = 0;
      v13 = 0;
      v11 = CFSTR("applenewss");
      v12 = CFSTR("applenews");
      v10 = 1;
      v14 = CFSTR("News");
      v15 = CFSTR("com.apple.news");
      goto LABEL_29;
    case 18:
      goto LABEL_29;
    case 19:
      v9 = 0;
      v13 = 0;
      v11 = CFSTR("itms-bookss");
      v12 = CFSTR("itms-books");
      v10 = 1;
      v14 = CFSTR("iBooks");
      v15 = CFSTR("com.apple.iBooksX");
      goto LABEL_29;
    case 20:
      v9 = 0;
      v13 = 0;
      v12 = 0;
      v11 = 0;
      v10 = 1;
      v14 = CFSTR("Configurator");
      v15 = CFSTR("com.apple.configurator.ui");
      goto LABEL_29;
    case 21:
      v9 = 0;
      v13 = 0;
      v11 = CFSTR("itmss");
      v12 = CFSTR("itms");
LABEL_25:
      v10 = 1;
      v14 = CFSTR("Music");
      v15 = CFSTR("com.apple.Music");
      goto LABEL_29;
    case 23:
      v9 = 0;
      v13 = 0;
      v12 = CFSTR("com.apple.tv");
      v10 = 1;
      v14 = CFSTR("TV");
      v15 = CFSTR("com.apple.TV");
LABEL_27:
      v11 = v12;
      goto LABEL_29;
    case 25:
      v9 = 0;
      v13 = 0;
      v10 = 1;
      v14 = CFSTR("iCloudQuota");
      v15 = CFSTR("com.apple.iCloudQuota.ICQFollowup");
LABEL_29:
      v38 = v14;
      objc_msgSend(v6, "bundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v21, "compare:options:", v15, 1);

      if (v20)
      {
        v22 = -[AMSProcessInfo initWithBundleIdentifier:]([AMSProcessInfo alloc], "initWithBundleIdentifier:", v15);

        LOBYTE(v20) = 0;
        v6 = v22;
      }
      v18 = (__CFString *)v13;
      v19 = v9;
      v17 = v12;
      v16 = v11;
      break;
    default:
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v38 = 0;
      v15 = 0;
      v10 = 1;
      v19 = 1;
      LOBYTE(v20) = 1;
      break;
  }
  if (!v6)
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((v20 & 1) != 0)
      goto LABEL_34;
LABEL_36:
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = &v15->isa;
    goto LABEL_37;
  }
  if ((v20 & 1) == 0)
    goto LABEL_36;
LABEL_34:
  objc_msgSend(v6, "bundleIdentifier");
  v23 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v7->_bundleIdentifier;
  v7->_bundleIdentifier = (NSString *)v23;
LABEL_37:

  if ((v19 & 1) != 0)
  {
    +[AMSMappedBundleInfo _clientNameFromProcessInfo:](AMSMappedBundleInfo, "_clientNameFromProcessInfo:", v6);
    v25 = objc_claimAutoreleasedReturnValue();
    clientName = v7->_clientName;
    v7->_clientName = (NSString *)v25;
  }
  else
  {
    clientName = v7->_clientName;
    v7->_clientName = &v38->isa;
  }

  if ((v10 & 1) != 0)
  {
    +[AMSMappedBundleInfo _clientVersionFromProcessInfo:clientName:](AMSMappedBundleInfo, "_clientVersionFromProcessInfo:clientName:", v6, v7->_clientName);
    v27 = objc_claimAutoreleasedReturnValue();
    clientVersion = v7->_clientVersion;
    v7->_clientVersion = (NSString *)v27;
  }
  else
  {
    clientVersion = v7->_clientVersion;
    v7->_clientVersion = &v18->isa;
  }

  +[AMSMappedBundleInfo _accountMediaTypeForClientName:bundleID:](AMSMappedBundleInfo, "_accountMediaTypeForClientName:bundleID:", v7->_clientName, v7->_bundleIdentifier);
  v29 = objc_claimAutoreleasedReturnValue();
  accountMediaType = v7->_accountMediaType;
  v7->_accountMediaType = (NSString *)v29;

  scheme = v7->_scheme;
  v7->_scheme = &v17->isa;

  secureScheme = v7->_secureScheme;
  v7->_secureScheme = &v16->isa;

  objc_msgSend(v6, "proxyAppBundleID");
  v33 = objc_claimAutoreleasedReturnValue();
  proxyAppBundleID = v7->_proxyAppBundleID;
  v7->_proxyAppBundleID = (NSString *)v33;

  objc_msgSend(v6, "userAgentSuffix");
  v35 = objc_claimAutoreleasedReturnValue();
  userAgentSuffix = v7->_userAgentSuffix;
  v7->_userAgentSuffix = (NSString *)v35;

LABEL_44:
  return v7;
}

+ (id)_accountMediaTypeForClientName:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AMSAccountMediaTypeProduction;
  if (_MergedGlobals_118 != -1)
    dispatch_once(&_MergedGlobals_118, &__block_literal_global_70);
  v9 = (id)qword_1ECEAD588;
  objc_sync_enter(v9);
  if (v6 && (objc_msgSend(v9, "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(v9, "addObject:", v6);
    objc_sync_exit(v9);

    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544386;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v6;
      v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ -> %{public}@ (%{public}@) = %{public}@", (uint8_t *)&v15, 0x34u);

    }
  }
  else
  {
    objc_sync_exit(v9);

  }
  return v8;
}

+ (id)_clientVersionFromProcessInfo:(id)a3 clientName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(a4, "isEqualToString:", CFSTR("Messages")))
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/Messages/iMessageBalloons/ASMessagesProvider.bundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C9AAF0]),
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
LABEL_13:
    objc_msgSend(v5, "clientVersion");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = (void *)objc_opt_class();
        v12 = v11;
        objc_msgSend(v5, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v11;
        v17 = 2114;
        v18 = v13;
        _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Couldn't find %{public}@ store version (iOS), falling back to hardcoded", (uint8_t *)&v15, 0x16u);

      }
      v8 = CFSTR("1.0");
    }
  }

  return v8;
}

+ (id)_clientNameFromProcessInfo:(id)a3
{
  id v3;
  __CFString *v4;
  uint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "executableName");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = (__CFString *)v5;
    else
      v4 = CFSTR("itunesstored");
  }

  return v4;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)clientName
{
  return self->_clientName;
}

+ (id)accountMediaTypeInfoForProcessInfo:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentSuffix, 0);
  objc_storeStrong((id *)&self->_proxyAppBundleID, 0);
  objc_storeStrong((id *)&self->_accountMediaType, 0);
  objc_storeStrong((id *)&self->_secureScheme, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

void __63__AMSMappedBundleInfo__accountMediaTypeForClientName_bundleID___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)qword_1ECEAD588;
  qword_1ECEAD588 = (uint64_t)v0;

}

+ (AMSMappedBundleInfo)currentBundleInfo
{
  void *v3;
  void *v4;

  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleInfoForProcessInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSMappedBundleInfo *)v4;
}

+ (id)bundleInfoForMobileAppStoreWithProcessInfo:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[AMSMappedBundleInfo _initWithClient:processInfo:]([AMSMappedBundleInfo alloc], "_initWithClient:processInfo:", 2, v3);

  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (void)setClientVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clientVersion, a3);
}

- (NSString)scheme
{
  return self->_scheme;
}

- (void)setScheme:(id)a3
{
  objc_storeStrong((id *)&self->_scheme, a3);
}

- (NSString)secureScheme
{
  return self->_secureScheme;
}

- (void)setSecureScheme:(id)a3
{
  objc_storeStrong((id *)&self->_secureScheme, a3);
}

- (void)setAccountMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_accountMediaType, a3);
}

- (NSString)proxyAppBundleID
{
  return self->_proxyAppBundleID;
}

- (void)setProxyAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_proxyAppBundleID, a3);
}

- (NSString)userAgentSuffix
{
  return self->_userAgentSuffix;
}

- (void)setUserAgentSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_userAgentSuffix, a3);
}

@end

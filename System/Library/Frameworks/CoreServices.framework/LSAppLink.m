@implementation LSAppLink

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)appLinksWithURL:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  objc_msgSend(a1, "appLinksWithURL:limit:includeLinksForCurrentApplication:error:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)appLinksWithURL:(id)a3 limit:(unint64_t)a4 includeLinksForCurrentApplication:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v11;
  _LSAppLinkOpenState *v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a5;
  v11 = a3;
  if (v11)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aURL != nil"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit > 0"));

LABEL_3:
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 79, CFSTR("Cannot call this method from within the Launch Services daemon."));

  }
  v12 = objc_alloc_init(_LSAppLinkOpenState);
  -[_LSAppLinkOpenState setURL:](v12, "setURL:", v11);
  -[_LSAppLinkOpenState setAuditToken:](v12, "setAuditToken:", _LSGetAuditTokenForSelf());
  -[_LSAppLinkOpenState setIncludeLinksForCallingApplication:](v12, "setIncludeLinksForCallingApplication:", v7);
  v20 = 0;
  objc_msgSend(a1, "_appLinksWithState:context:limit:error:", v12, 0, a4, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  v15 = v14;
  if (a6 && !v13)
    *a6 = objc_retainAutorelease(v14);

  return v13;
}

+ (void)getAppLinkWithURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  objc_msgSend((id)objc_opt_class(), "_dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__LSAppLink_getAppLinkWithURL_completionHandler___block_invoke;
  block[3] = &unk_1E10415B8;
  v15 = v8;
  v16 = a1;
  v14 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __49__LSAppLink_getAppLinkWithURL_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)a1[6];
  v3 = a1[4];
  v8 = 0;
  objc_msgSend(v2, "appLinksWithURL:limit:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = a1[5];
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);

}

+ (void)getAppLinksWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__LSAppLink_getAppLinksWithURL_completionHandler___block_invoke;
  block[3] = &unk_1E10415B8;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__LSAppLink_getAppLinksWithURL_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)a1[6];
  v3 = a1[4];
  v6 = 0;
  objc_msgSend(v2, "appLinksWithURL:limit:error:", v3, -1, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(a1[5] + 16))();

}

+ (void)afterAppLinksBecomeAvailableForURL:(id)a3 limit:(unint64_t)a4 performBlock:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  char v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aURL != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

LABEL_3:
  v16 = 0;
  v12 = objc_msgSend(a1, "_URLIsValidForAppLinks:error:", v9, &v16);
  v13 = v16;
  if ((v12 & 1) != 0)
    +[_LSSharedWebCredentialsAppLink afterAppLinksBecomeAvailableForURL:limit:performBlock:](_LSSharedWebCredentialsAppLink, "afterAppLinksBecomeAvailableForURL:limit:performBlock:", v9, a4, v11);
  else
    ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v13);

}

+ (BOOL)areEnabledByDefault
{
  void *v2;
  char v3;

  if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isAppleInternal"))
    return 1;
  v2 = (void *)CFPreferencesCopyValue(CFSTR("LSAppLinksEnabledByDefault"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (BOOL)isAlwaysEnabled
{
  return 0;
}

- (BOOL)isEnabled
{
  return objc_msgSend((id)objc_opt_class(), "areEnabledByDefault");
}

- (void)setEnabled:(BOOL)a3
{
  -[LSAppLink setEnabled:error:](self, "setEnabled:error:", a3, 0);
}

- (BOOL)setEnabled:(BOOL)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSAppLink setEnabled:error:]", 169, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LSAppLink URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LSAppLink targetApplicationRecord](self, "targetApplicationRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LSAppLink *v4;
  LSAppLink *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (LSAppLink *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[LSAppLink URL](v5, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LSAppLink URL](self, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[LSAppLink targetApplicationRecord](v5, "targetApplicationRecord");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[LSAppLink targetApplicationRecord](self, "targetApplicationRecord");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[LSAppLink URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSAppLink targetApplicationRecord](self, "targetApplicationRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> { url = %@, app = %@ }"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LSAppLink URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("URL"));

  -[LSAppLink targetApplicationRecord](self, "targetApplicationRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("targetApplicationRecord"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_targetApplicationProxy, CFSTR("targetApplicationProxy"));
}

- (LSAppLink)initWithCoder:(id)a3
{
  id v4;
  LSAppLink *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  LSApplicationProxy *targetApplicationProxy;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[LSAppLink init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSAppLink setURL:](v5, "setURL:", v6);

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetApplicationRecord"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSAppLink setTargetApplicationRecord:](v5, "setTargetApplicationRecord:", v7);

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetApplicationProxy"));
    v8 = objc_claimAutoreleasedReturnValue();
    targetApplicationProxy = v5->_targetApplicationProxy;
    v5->_targetApplicationProxy = (LSApplicationProxy *)v8;

    -[LSAppLink URL](v5, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || (-[LSAppLink targetApplicationRecord](v5, "targetApplicationRecord"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          !v11))
    {

      v5 = 0;
    }
  }

  return v5;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (LSApplicationProxy)targetApplicationProxy
{
  return (LSApplicationProxy *)objc_getProperty(self, a2, 16, 1);
}

- (LSApplicationRecord)targetApplicationRecord
{
  return (LSApplicationRecord *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTargetApplicationRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetApplicationRecord, 0);
  objc_storeStrong((id *)&self->_targetApplicationProxy, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (BOOL)currentProcessHasReadAccess
{
  _OWORD *v3;
  __int128 v4;
  _OWORD v6[2];

  v3 = (_OWORD *)_LSGetAuditTokenForSelf();
  if (v3)
  {
    v4 = v3[1];
    v6[0] = *v3;
    v6[1] = v4;
    LOBYTE(v3) = objc_msgSend(a1, "auditTokenHasReadAccess:", v6);
  }
  return (char)v3;
}

+ (BOOL)auditTokenHasReadAccess:(id *)a3
{
  int MayMapDatabase;
  void *v5;
  __int128 v6;
  _OWORD v8[2];

  MayMapDatabase = _LSAuditTokenMayMapDatabase((uint64_t)a3);
  if (MayMapDatabase)
  {
    v5 = (void *)_LSSWCServiceDetailsClass();
    v6 = *(_OWORD *)&a3->var0[4];
    v8[0] = *(_OWORD *)a3->var0;
    v8[1] = v6;
    LOBYTE(MayMapDatabase) = objc_msgSend(v5, "auditTokenHasReadAccess:", v8);
  }
  return MayMapDatabase;
}

+ (BOOL)currentProcessHasWriteAccess
{
  _OWORD *v3;
  __int128 v4;
  _OWORD v6[2];

  v3 = (_OWORD *)_LSGetAuditTokenForSelf();
  if (v3)
  {
    v4 = v3[1];
    v6[0] = *v3;
    v6[1] = v4;
    LOBYTE(v3) = objc_msgSend(a1, "auditTokenHasWriteAccess:", v6);
  }
  return (char)v3;
}

+ (BOOL)auditTokenHasWriteAccess:(id *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v7[2];

  v4 = (void *)_LSSWCServiceDetailsClass();
  v5 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  return objc_msgSend(v4, "auditTokenHasWriteAccess:", v7);
}

+ (int64_t)settingsSwitchStateForApplicationIdentifier:(id)a3
{
  return +[_LSSharedWebCredentialsAppLink settingsSwitchStateForApplicationIdentifier:](_LSSharedWebCredentialsAppLink, "settingsSwitchStateForApplicationIdentifier:", a3);
}

+ (BOOL)setSettingsSwitchState:(int64_t)a3 forApplicationIdentifier:(id)a4 error:(id *)a5
{
  return +[_LSSharedWebCredentialsAppLink setSettingsSwitchState:forApplicationIdentifier:error:](_LSSharedWebCredentialsAppLink, "setSettingsSwitchState:forApplicationIdentifier:error:", a3, a4, a5);
}

- (void)openWithCompletionHandler:(id)a3
{
  -[LSAppLink openWithConfiguration:completionHandler:](self, "openWithConfiguration:completionHandler:", 0, a3);
}

+ (void)openWithURL:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a1, "openWithURL:configuration:completionHandler:", a3, 0, a4);
}

- (void)openWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSAppLink.mm"), 336, CFSTR("Cannot call this method from within the Launch Services daemon."));

  }
  objc_msgSend((id)objc_opt_class(), "_dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__LSAppLink_Open__openWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_1E10401F0;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __59__LSAppLink_Open__openWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _LSAppLinkOpenState *v3;

  v3 = objc_alloc_init(_LSAppLinkOpenState);
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSAppLinkOpenState setURL:](v3, "setURL:", v2);

  -[_LSAppLinkOpenState setOpenConfiguration:](v3, "setOpenConfiguration:", *(_QWORD *)(a1 + 40));
  objc_msgSend((id)objc_opt_class(), "_openWithAppLink:state:completionHandler:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 48));

}

+ (void)openWithURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 361, CFSTR("Cannot call this method from within the Launch Services daemon."));

  }
  objc_msgSend(a1, "_dispatchQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__LSAppLink_Open__openWithURL_configuration_completionHandler___block_invoke;
  v17[3] = &unk_1E10415E0;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v21 = a1;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v17);

}

void __63__LSAppLink_Open__openWithURL_configuration_completionHandler___block_invoke(uint64_t a1)
{
  _LSAppLinkOpenState *v2;

  v2 = objc_alloc_init(_LSAppLinkOpenState);
  -[_LSAppLinkOpenState setURL:](v2, "setURL:", *(_QWORD *)(a1 + 32));
  -[_LSAppLinkOpenState setOpenConfiguration:](v2, "setOpenConfiguration:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 56), "_openWithAppLink:state:completionHandler:", 0, v2, *(_QWORD *)(a1 + 48));

}

- (NSDictionary)browserSettings
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (void)setBrowserSettings:(id)a3
{
  -[LSAppLink setBrowserSettings:error:](self, "setBrowserSettings:error:", a3, 0);
}

- (BOOL)setBrowserSettings:(id)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSAppLink(BrowserSettings) setBrowserSettings:error:]", 398, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)removeSettingsReturningError:(id *)a3
{
  if (a3)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSAppLink(BrowserSettings) removeSettingsReturningError:]", 404, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)removeAllSettingsReturningError:(id *)a3
{
  return +[_LSSharedWebCredentialsAppLink removeAllSettingsReturningError:](_LSSharedWebCredentialsAppLink, "removeAllSettingsReturningError:", a3);
}

- (int64_t)openStrategy
{
  if (-[LSAppLink isEnabled](self, "isEnabled"))
    return 2;
  else
    return 0;
}

- (void)setOpenStrategy:(int64_t)a3
{
  -[LSAppLink setEnabled:](self, "setEnabled:", a3 != 0);
}

- (void)openInWebBrowser:(BOOL)a3 setAppropriateOpenStrategyAndWebBrowserState:(id)a4 completionHandler:(id)a5
{
  -[LSAppLink openInWebBrowser:setOpenStrategy:webBrowserState:completionHandler:](self, "openInWebBrowser:setOpenStrategy:webBrowserState:completionHandler:");
}

- (void)openInWebBrowser:(BOOL)a3 setOpenStrategy:(int64_t)a4 webBrowserState:(id)a5 completionHandler:(id)a6
{
  -[LSAppLink openInWebBrowser:setOpenStrategy:webBrowserState:configuration:completionHandler:](self, "openInWebBrowser:setOpenStrategy:webBrowserState:configuration:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)openInWebBrowser:(BOOL)a3 setOpenStrategy:(int64_t)a4 webBrowserState:(id)a5 configuration:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  int64_t v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x186DAE9BC]();
  MEMORY[0x186DAF208]();
  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke;
  v29[3] = &unk_1E103FE30;
  v17 = v15;
  v30 = v17;
  v18 = (void *)MEMORY[0x186DAE9BC](v29);

  objc_msgSend((id)objc_opt_class(), "_dispatchQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke_2;
  block[3] = &unk_1E1041608;
  v26 = v18;
  v27 = a4;
  block[4] = self;
  v24 = v12;
  v28 = a3;
  v25 = v13;
  v20 = v18;
  v21 = v13;
  v22 = v12;
  dispatch_async(v19, block);

}

void __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v5 = (*(uint64_t (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  MEMORY[0x186DAF214](v5);

}

void __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke_2(uint64_t a1)
{
  _LSAppLinkOpenState *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (*v7)(_QWORD, _QWORD);
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setOpenStrategy:", *(_QWORD *)(a1 + 64));
  v2 = objc_alloc_init(_LSAppLinkOpenState);
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSAppLinkOpenState setURL:](v2, "setURL:", v3);

  -[_LSAppLinkOpenState setBrowserState:](v2, "setBrowserState:", *(_QWORD *)(a1 + 40));
  -[_LSAppLinkOpenState setOpenConfiguration:](v2, "setOpenConfiguration:", *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 72))
  {
    v7 = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke_3;
    v10 = &unk_1E103FE08;
    v11 = *(id *)(a1 + 56);
    +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("_LSAppLinkOpenStateLaunchOptionKey");
    v13[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performOpenOperationWithURL:fileHandle:bundleIdentifier:documentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:completionHandler:", v5, 0, CFSTR("com.apple.mobilesafari"), 0, 0, 0, 0, v6, 0, *(_QWORD *)(a1 + 56), v7, v8, v9, v10);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_openWithAppLink:state:completionHandler:", *(_QWORD *)(a1 + 32), v2, *(_QWORD *)(a1 + 56));
  }

}

uint64_t __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_dispatchQueue
{
  if (+[LSAppLink(Internal) _dispatchQueue]::once != -1)
    dispatch_once(&+[LSAppLink(Internal) _dispatchQueue]::once, &__block_literal_global_8);
  return (id)+[LSAppLink(Internal) _dispatchQueue]::result;
}

void __37__LSAppLink_Internal___dispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.launchservices.applinks", v2);
  v1 = (void *)+[LSAppLink(Internal) _dispatchQueue]::result;
  +[LSAppLink(Internal) _dispatchQueue]::result = (uint64_t)v0;

}

+ (BOOL)_URLIsValidForAppLinks:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v6, 1);
  LOBYTE(a4) = objc_msgSend(a1, "URLComponentsAreValidForAppLinks:error:", v7, a4);

  return (char)a4;
}

+ (id)_appLinksWithState:(id)a3 context:(LSContext *)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || (objc_opt_class(), (v10 == 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
  {
    v26 = *MEMORY[0x1E0CB2938];
    v27[0] = CFSTR("invalid input parameters");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[LSAppLink(Internal) _appLinksWithState:context:limit:error:]", 691, v12);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v20 = 0;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v11, 1);
    v25 = 0;
    v13 = objc_msgSend(a1, "URLComponentsAreValidForAppLinks:error:", v12, &v25);
    v14 = v25;
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v12, "scheme");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lowercaseString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setScheme:", v17);

      objc_msgSend(v12, "host");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lowercaseString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHost:", v19);

      v24 = 0;
      objc_msgSend(a1, "_appLinksWithState:context:limit:URLComponents:error:", v10, a4, a5, v12, &v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v24;
    }
    else
    {
      v20 = 0;
      v21 = v14;
    }
    v22 = v21;

  }
  if (a6 && !v20)
    *a6 = objc_retainAutorelease(v22);

  return v20;
}

+ (id)_appLinkWithURL:(id)a3 applicationRecord:(id)a4 plugInClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 705, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aURL != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 706, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appRecord != nil"));

LABEL_3:
  v11 = objc_alloc_init((Class)a1);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setURL:", v8);
    objc_msgSend(v12, "setTargetApplicationRecord:", v10);
    objc_msgSend(v10, "compatibilityObject");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v12[2];
    v12[2] = v13;

  }
  return v12;
}

+ (void)_openWithAppLink:(id)a3 state:(id)a4 completionHandler:(id)a5
{
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const audit_token_t *v19;
  audit_token_t *v20;
  NSObject *v21;
  int v22;
  CFURLRef v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void (*v28[4])(_QWORD, _QWORD);
  id v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = (uint64_t)a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  if (!(v9 | v10))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 725, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLink != nil || openState != nil"));

  }
  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) == 0)
  {
    v13 = &__block_literal_global_201;
    if (v11)
      v13 = v11;
    v28[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v28[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v28[2] = (void (*)(_QWORD, _QWORD))__64__LSAppLink_Internal___openWithAppLink_state_completionHandler___block_invoke_2;
    v28[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FE08;
    v11 = v13;
    v29 = v11;
    +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "openAppLink:state:completionHandler:", v9, v10, v11);

    v12 = v29;
    goto LABEL_12;
  }
  if (v10)
  {
    if (v9)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v27 = 0;
    objc_msgSend(a1, "_appLinksWithState:context:limit:error:", v10, 0, 1, &v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v27;
    if (v16)
    {
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "firstObject");
        v9 = objc_claimAutoreleasedReturnValue();

        if (v9)
        {
LABEL_7:
          if ((objc_msgSend((id)v9, "isEnabled") & 1) != 0)
          {
LABEL_8:
            objc_msgSend(a1, "_openAppLink:state:completionHandler:", v9, v10, v11);
            goto LABEL_12;
          }
          objc_msgSend((id)v10, "openConfiguration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "ignoreAppLinkEnabledProperty");

          if (v18)
          {
            v19 = (const audit_token_t *)objc_msgSend((id)v10, "auditToken");
            v20 = (audit_token_t *)v19;
            if (v19)
            {
              if (_LSCheckEntitlementForAuditToken(v19, CFSTR("com.apple.private.canIgnoreAppLinkEnabledProperty")))
                goto LABEL_8;
              if (_LSCheckEntitlementForAuditToken(v20, CFSTR("com.apple.private.canIgnoreAppLinkOpenStrategy")))
              {
                if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isAppleInternal"))
                {
                  _LSDefaultLog();
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                  {
                    v22 = _LSGetPIDFromToken(v20);
                    v23 = _LSCopyExecutableURLForAuditToken();
                    +[LSAppLink(Internal) _openWithAppLink:state:completionHandler:].cold.1(v22, v23, buf, v21);
                  }

                }
                goto LABEL_8;
              }
            }
          }
          if (v11)
          {
            _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -912, (uint64_t)"+[LSAppLink(Internal) _openWithAppLink:state:completionHandler:]", 795, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v24);

          }
          goto LABEL_12;
        }
LABEL_32:
        if (v11)
          (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v12);
        v9 = 0;
        goto LABEL_12;
      }
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"+[LSAppLink(Internal) _openWithAppLink:state:completionHandler:]", 763, 0);
      v25 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v25;
    }

    goto LABEL_32;
  }
  if (!v11)
    goto LABEL_13;
  v30 = *MEMORY[0x1E0CB2938];
  v31 = CFSTR("invalid input parameters");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[LSAppLink(Internal) _openWithAppLink:state:completionHandler:]", 809, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v15);

LABEL_12:
LABEL_13:

}

uint64_t __64__LSAppLink_Internal___openWithAppLink_state_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_openAppLink:(id)a3 state:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void (*v32[4])(_QWORD, _QWORD);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 817, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLink != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSAppLink.mm"), 818, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("openState != nil"));

LABEL_3:
  objc_msgSend(v9, "targetApplicationRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isSystemPlaceholder"))
  {
    v32[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v32[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v32[2] = (void (*)(_QWORD, _QWORD))__60__LSAppLink_Internal___openAppLink_state_completionHandler___block_invoke;
    v32[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FE08;
    v13 = v11;
    v33 = v13;
    +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "failedToOpenApplication:withURL:completionHandler:", v15, v16, v13);

    v17 = v33;
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v10, "XPCConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v31 = 0;
    objc_msgSend(v9, "_userActivityWithState:error:", v10, &v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v31;
    v21 = v20;
    if (v19)
    {
      v30 = v20;
      _LSGetDataForUserActivity(v19, &v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v30;

      if (v22)
      {
        objc_msgSend(v19, "_uniqueIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "activityType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "XPCConnection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        _LSServer_OpenUserActivity(v29, v22, v23, 1, v24, v9, v10, 0, v25, v11);

      }
      else if (v11)
      {
        (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v17);
      }

    }
    else
    {
      if (v11)
        (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v20);
      v17 = v21;
    }

    goto LABEL_18;
  }
  if (v11)
  {
    v34 = *MEMORY[0x1E0CB2938];
    v35[0] = CFSTR("openState.XPCConnection");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[LSAppLink(Internal) _openAppLink:state:completionHandler:]", 842, v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v26);

    goto LABEL_18;
  }
LABEL_19:

}

uint64_t __60__LSAppLink_Internal___openAppLink_state_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)URLComponentsAreValidForAppLinks:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[_LSAppLinkPlugIn plugInClasses](_LSAppLinkPlugIn, "plugInClasses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "canHandleURLComponents:", v5) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_16;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  objc_msgSend(v5, "URL");
  v10 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v10;
  if (v10)
  {
    if (a4)
    {
      v18 = *MEMORY[0x1E0CB32F0];
      v19 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB32E8], -1002, (uint64_t)"+[LSAppLink(Private) URLComponentsAreValidForAppLinks:error:]", 920, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
  if (!a4)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB32E8], -1002, (uint64_t)"+[LSAppLink(Private) URLComponentsAreValidForAppLinks:error:]", 922, 0);
  v12 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v12;
}

+ (id)_appLinksWithState:(id)a3 context:(LSContext *)a4 limit:(unint64_t)a5 URLComponents:(id)a6 error:(id *)a7
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _BOOL4 v20;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v9 = a6;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  +[_LSAppLinkPlugIn plugInClasses](_LSAppLinkPlugIn, "plugInClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = 0;
    v13 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(objc_class **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (-[objc_class canHandleURLComponents:](v15, "canHandleURLComponents:", v9))
        {
          v16 = objc_alloc_init(v15);
          if (v16)
          {
            v17 = (void *)objc_msgSend(v9, "copy");
            objc_msgSend(v16, "setURLComponents:", v17);

            objc_msgSend(v16, "setLimit:", a5);
            objc_msgSend(v16, "setState:", v24);
            v26 = v12;
            objc_msgSend(v16, "appLinksWithContext:error:", a4, &v26);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v26;

            if (!v18
              || (objc_msgSend(v25, "addObjectsFromArray:", v18),
                  v20 = objc_msgSend(v25, "count") < a5,
                  v18,
                  !v20))
            {

              v12 = v19;
              goto LABEL_16;
            }
            v12 = v19;
          }
        }
        else
        {
          v16 = 0;
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v11)
        continue;
      break;
    }
LABEL_16:

    if (v12)
    {

      v25 = 0;
      goto LABEL_24;
    }
  }
  else
  {

  }
  if (objc_msgSend(v25, "count"))
  {
    if (objc_msgSend(v25, "count") > a5)
      objc_msgSend(v25, "removeObjectsInRange:", a5, objc_msgSend(v25, "count") - a5);
    v12 = 0;
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"+[LSAppLink(Private) _appLinksWithState:context:limit:URLComponents:error:]", 985, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_24:
  if (a7 && !v25)
    *a7 = objc_retainAutorelease(v12);

  return v25;
}

- (id)_userActivityWithState:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CB3B10]);
  v8 = (void *)objc_msgSend(v7, "initWithActivityType:", *MEMORY[0x1E0CB3418]);
  if (v8)
  {
    -[LSAppLink URL](self, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWebpageURL:", v9);

    objc_msgSend(v6, "openConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "referrerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setReferrerURL:", v11);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "set_universalLink:", 1);
  }
  else if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -41, (uint64_t)"-[LSAppLink(Private) _userActivityWithState:error:]", 1011, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end

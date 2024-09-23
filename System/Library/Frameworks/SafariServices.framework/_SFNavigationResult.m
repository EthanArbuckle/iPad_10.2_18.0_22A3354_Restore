@implementation _SFNavigationResult

- (id)_initWithType:(int64_t)a3 URL:(id)a4 externalApplication:(id)a5 appLink:(id)a6
{
  NSURL *v10;
  LSApplicationProxy *v11;
  WBSAppLink *v12;
  _SFNavigationResult *v13;
  LSApplicationProxy *externalApplication;
  LSApplicationProxy *v15;
  uint64_t v16;
  NSURL *URL;
  NSURL *v18;
  WBSAppLink *appLink;
  objc_super v21;

  v10 = (NSURL *)a4;
  v11 = (LSApplicationProxy *)a5;
  v12 = (WBSAppLink *)a6;
  v21.receiver = self;
  v21.super_class = (Class)_SFNavigationResult;
  v13 = -[_SFNavigationResult init](&v21, sel_init);
  externalApplication = v13->_externalApplication;
  v13->_externalApplication = v11;
  v15 = v11;

  if (a3 == 3)
    v16 = categoryForURL(v10);
  else
    v16 = 0;
  v13->_externalApplicationCategory = v16;
  v13->_type = a3;
  URL = v13->_URL;
  v13->_URL = v10;
  v18 = v10;

  appLink = v13->_appLink;
  v13->_appLink = v12;

  return v13;
}

- (BOOL)appliesOneTimeUserInitiatedActionPolicy
{
  return self->_externalApplicationCategory == 2;
}

- (BOOL)isRedirectToAppleServices
{
  void *v2;
  char v3;

  -[LSApplicationProxy bundleIdentifier](self->_externalApplication, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = objc_msgSend(&unk_1E4B27388, "containsObject:", v2);
  else
    v3 = 0;

  return v3;
}

- (BOOL)shouldPromptWithPolicy:(int64_t)a3 telephonyNavigationPolicy:(id)a4 userAction:(id)a5 inBackgroundOrPrivateBrowsing:(BOOL)a6 inLockdownMode:(BOOL)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  char v15;
  int v16;
  char v17;
  char v18;
  char v20;

  v8 = a6;
  v12 = a4;
  v13 = a5;
  -[LSApplicationProxy bundleIdentifier](self->_externalApplication, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple."));

  if (v12)
    v16 = objc_msgSend(v12, "policyAppliesToURL:", self->_URL);
  else
    v16 = 0;
  switch(a3)
  {
    case 3:
      if (self->_externalApplication)
        v18 = v16;
      else
        v18 = 1;
      v17 = v18 ^ 1;
      if ((v18 & 1) == 0 && !v8 && !a7)
      {
        if ((-[NSURL safari_hasScheme:](self->_URL, "safari_hasScheme:", CFSTR("icloud-sharing")) & 1) != 0
          || (-[NSURL safari_hasScheme:](self->_URL, "safari_hasScheme:", CFSTR("com.apple.tv")) & 1) != 0)
        {
          goto LABEL_16;
        }
        if (-[_SFNavigationResult isRedirectToAppleServices](self, "isRedirectToAppleServices"))
        {
          v20 = -[NSURL safari_hasScheme:](self->_URL, "safari_hasScheme:", CFSTR("itms-apps"));
          goto LABEL_26;
        }
LABEL_27:
        v17 = 1;
      }
      break;
    case 2:
      v17 = v16 ^ 1;
      if (((v16 | v8) & 1) == 0 && !a7)
      {
        if (!-[_SFNavigationResult appliesOneTimeUserInitiatedActionPolicy](self, "appliesOneTimeUserInitiatedActionPolicy"))
        {
          v17 = v15 ^ 1;
          break;
        }
        if (v13)
        {
          v20 = objc_msgSend(v13, "isConsumed");
LABEL_26:
          v17 = v20;
          break;
        }
        goto LABEL_27;
      }
      break;
    case 1:
      v17 = (self->_externalApplication != 0) & ~(_BYTE)v16 & a7 | v15 ^ 1;
      break;
    default:
LABEL_16:
      v17 = 0;
      break;
  }

  return v17;
}

+ (id)resultOfType:(int64_t)a3 withURL:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithType:URL:externalApplication:appLink:", a3, v6, 0, 0);

  return v7;
}

+ (id)resultWithRedirectToExternalURL:(id)a3 preferredApplicationBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationsAvailableForOpeningURL:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    if (!v7)
      goto LABEL_4;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __92___SFNavigationResult_resultWithRedirectToExternalURL_preferredApplicationBundleIdentifier___block_invoke;
    v13[3] = &unk_1E4AC7770;
    v14 = v7;
    objc_msgSend(v9, "safari_firstObjectPassingTest:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_4:
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithType:URL:externalApplication:appLink:", 3, v6, v10, 0);

  }
  else
  {
    objc_msgSend(a1, "resultOfType:withURL:", 0, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)resultWithAppLink:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousTargetApplicationProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "_initWithType:URL:externalApplication:appLink:", 3, v6, v7, v4);

  return v8;
}

+ (id)resultOfLoadingRequest:(id)a3 isMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5 preferredApplicationBundleIdentifier:(id)a6 redirectDecisionHandler:(id)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v11;
  id v12;
  uint64_t (**v13)(id, void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int IsPad;
  char v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v33;
  unint64_t v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a6;
  v13 = (uint64_t (**)(id, void *))a7;
  objc_msgSend(v11, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v10 || v9)
  {
LABEL_22:
    objc_msgSend(v15, "radarWebURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (!v9)
      {
        +[_SFNavigationResult resultWithRedirectToExternalURL:preferredApplicationBundleIdentifier:](_SFNavigationResult, "resultWithRedirectToExternalURL:preferredApplicationBundleIdentifier:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "type") == 3)
        {
LABEL_33:

          goto LABEL_34;
        }

      }
      v27 = 2;
      v28 = v18;
      goto LABEL_31;
    }
    if (objc_msgSend(MEMORY[0x1E0CEF680], "_canHandleRequest:", v11))
      goto LABEL_29;
    objc_msgSend(v11, "URL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "safari_isSafariWebExtensionURL");

    if (v30)
      goto LABEL_29;
    if (!objc_msgSend(v15, "safari_isXWebSearchURL"))
    {
      if (categoryForURL(v15) == 1)
      {
        objc_msgSend(v15, "safari_originalDataAsString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "length");

        if (v34 >= 0x3E9)
        {
          v27 = 0;
          goto LABEL_30;
        }
        if (objc_msgSend(v15, "isFaceTimeMultiwayURL"))
        {
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD308]), "initWithURL:", v15);
          v38 = v37;
          if (!v37)
          {
            +[_SFNavigationResult resultOfType:withURL:](_SFNavigationResult, "resultOfType:withURL:", 0, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_66;
          }
          objc_msgSend(v37, "setShowUIPrompt:", 1);
LABEL_53:
          objc_msgSend(v38, "URL");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          +[_SFNavigationResult resultWithRedirectToExternalURL:preferredApplicationBundleIdentifier:](_SFNavigationResult, "resultWithRedirectToExternalURL:preferredApplicationBundleIdentifier:", v39, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_66:
          goto LABEL_33;
        }
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2E0]), "initWithURL:", v15);
        objc_msgSend(v38, "setShowUIPrompt:", 1);
        if (objc_msgSend(v38, "isValid"))
          goto LABEL_53;

      }
      if (!v9)
      {
        if (!objc_msgSend(v15, "safari_isMarketplaceKitURL"))
        {
          v40 = v15;
          v41 = v12;
          goto LABEL_59;
        }
LABEL_29:
        v27 = 1;
LABEL_30:
        v28 = v15;
LABEL_31:
        +[_SFNavigationResult resultOfType:withURL:](_SFNavigationResult, "resultOfType:withURL:", v27, v28);
        v31 = objc_claimAutoreleasedReturnValue();
LABEL_32:
        v16 = (void *)v31;
        goto LABEL_33;
      }
    }
    v27 = 0;
    v28 = 0;
    goto LABEL_31;
  }
  if (!objc_msgSend(v14, "safari_hasFeedScheme"))
  {
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLOverrideForURL:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        +[_SFNavigationResult resultOfLoadingRequest:isMainFrame:disallowRedirectToExternalApps:preferredApplicationBundleIdentifier:redirectDecisionHandler:].cold.1(v19);
      v18 = 0;
    }
    objc_msgSend(v18, "scheme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scheme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "caseInsensitiveCompare:", v21))
    {
      objc_msgSend(v18, "scheme");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "caseInsensitiveCompare:", CFSTR("fb")))
      {
        IsPad = _SFDeviceIsPad();
        v24 = IsPad;
        if (IsPad)
        {
          objc_msgSend(v18, "scheme");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v43, "safari_isCaseInsensitiveEqualToString:", CFSTR("maps")))
          {
            objc_msgSend(v15, "host");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v44, "safari_isCaseInsensitiveEqualToString:", CFSTR("maps.apple.com")))
            {
              objc_msgSend(v15, "path");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v22;
              if ((objc_msgSend(v25, "safari_hasPrefix:", CFSTR("/place")) & 1) != 0)
              {
                v26 = 0;
              }
              else if (v13)
              {
                v26 = v13[2](v13, v18);
              }
              else
              {
                v26 = 1;
              }

              v36 = v26;
              v22 = v42;
            }
            else if (v13)
            {
              v36 = v13[2](v13, v18);
            }
            else
            {
              v36 = 1;
            }

            v35 = v43;
LABEL_57:

            if ((v36 & 1) != 0)
            {
LABEL_58:
              v40 = v18;
              v41 = 0;
LABEL_59:
              +[_SFNavigationResult resultWithRedirectToExternalURL:preferredApplicationBundleIdentifier:](_SFNavigationResult, "resultWithRedirectToExternalURL:preferredApplicationBundleIdentifier:", v40, v41);
              v31 = objc_claimAutoreleasedReturnValue();
              goto LABEL_32;
            }
            goto LABEL_21;
          }
        }
        if (v13)
          v45 = v13[2](v13, v18);
        else
          v45 = 1;
        v35 = v43;
        if ((v24 & 1) != 0)
        {
          v36 = v45;
          goto LABEL_57;
        }

        if ((v45 & 1) != 0)
          goto LABEL_58;
LABEL_21:

        goto LABEL_22;
      }

    }
    goto LABEL_21;
  }
  +[_SFNavigationResult resultWithRedirectToExternalURL:preferredApplicationBundleIdentifier:](_SFNavigationResult, "resultWithRedirectToExternalURL:preferredApplicationBundleIdentifier:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

  return v16;
}

+ (void)determineResultOfLoadingRequest:(id)a3 isMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5 preferredApplicationBundleIdentifier:(id)a6 redirectDecisionHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  id v26;
  BOOL v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__14;
  v29[4] = __Block_byref_object_dispose__14;
  v30 = (id)MEMORY[0x1A8598C40](a8);
  if (navigationResultQueue_onceToken != -1)
    dispatch_once(&navigationResultQueue_onceToken, &__block_literal_global_66);
  v17 = navigationResultQueue_navigationResultQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __177___SFNavigationResult_determineResultOfLoadingRequest_isMainFrame_disallowRedirectToExternalApps_preferredApplicationBundleIdentifier_redirectDecisionHandler_completionHandler___block_invoke;
  v21[3] = &unk_1E4AC7798;
  v27 = a4;
  v28 = a5;
  v22 = v14;
  v23 = v15;
  v24 = v16;
  v25 = v29;
  v26 = a1;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  dispatch_async(v17, v21);

  _Block_object_dispose(v29, 8);
}

- (LSApplicationProxy)externalApplication
{
  return self->_externalApplication;
}

- (int64_t)externalApplicationCategory
{
  return self->_externalApplicationCategory;
}

- (int64_t)type
{
  return self->_type;
}

- (NSURL)URL
{
  return self->_URL;
}

- (WBSAppLink)appLink
{
  return self->_appLink;
}

- (BOOL)loadWasUserDriven
{
  return self->_loadWasUserDriven;
}

- (void)setLoadWasUserDriven:(BOOL)a3
{
  self->_loadWasUserDriven = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLink, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_externalApplication, 0);
}

+ (void)resultOfLoadingRequest:(os_log_t)log isMainFrame:disallowRedirectToExternalApps:preferredApplicationBundleIdentifier:redirectDecisionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_FAULT, "Attempting to create _SFNavigationResult app redirect URL with nil input URL, which would crash", v1, 2u);
}

@end

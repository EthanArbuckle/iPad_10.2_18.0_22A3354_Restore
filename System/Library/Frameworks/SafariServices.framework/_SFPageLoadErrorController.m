@implementation _SFPageLoadErrorController

- (void)setDialogPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_dialogPresenter, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_SFPageLoadErrorController)initWithWebView:(id)a3
{
  id v4;
  _SFPageLoadErrorController *v5;
  _SFPageLoadErrorController *v6;
  _SFPageLoadErrorController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPageLoadErrorController;
  v5 = -[_SFPageLoadErrorController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    -[_SFPageLoadErrorController _setUpCertificateWarningPageHandlerInterface](v6, "_setUpCertificateWarningPageHandlerInterface");
    v7 = v6;
  }

  return v6;
}

- (void)_setUpCertificateWarningPageHandlerInterface
{
  _WKRemoteObjectInterface *v3;
  _WKRemoteObjectInterface *certificateWarningPageHandlerInterface;
  void *v5;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE71F570);
  v3 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  certificateWarningPageHandlerInterface = self->_certificateWarningPageHandlerInterface;
  self->_certificateWarningPageHandlerInterface = v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "_remoteObjectRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerExportedObject:interface:", self, self->_certificateWarningPageHandlerInterface);

}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_FAULT, "-[_SFPageLoadErrorController dealloc] must be called on the main thread", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)invalidate
{
  if (!self->_certificateWarningPageHandlerInterfaceInvalidated)
  {
    self->_certificateWarningPageHandlerInterfaceInvalidated = 1;
    -[_SFPageLoadErrorController _clearCertificateWarningPageHandlerInterface](self, "_clearCertificateWarningPageHandlerInterface");
  }
}

- (void)_cacheSecIdentityIfNeeded:(__SecIdentity *)a3 forIdentityDomain:(id)a4
{
  id v6;
  WBSSecIdentitiesCache *secIdentitiesCache;
  WBSSecIdentitiesCache *v8;
  WBSSecIdentitiesCache *v9;
  id v10;

  v6 = a4;
  secIdentitiesCache = self->_secIdentitiesCache;
  v10 = v6;
  if (!secIdentitiesCache)
  {
    v8 = (WBSSecIdentitiesCache *)objc_alloc_init(MEMORY[0x1E0D8AC50]);
    v9 = self->_secIdentitiesCache;
    self->_secIdentitiesCache = v8;

    v6 = v10;
    secIdentitiesCache = self->_secIdentitiesCache;
  }
  -[WBSSecIdentitiesCache setSecIdentity:forDomain:](secIdentitiesCache, "setSecIdentity:forDomain:", a3, v6);

}

- (void)_clearCertificateWarningPageHandlerInterface
{
  id WeakRetained;
  _WKRemoteObjectInterface *certificateWarningPageHandlerInterface;
  id v5;

  if (self->_certificateWarningPageHandlerInterface)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "_remoteObjectRegistry");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "unregisterExportedObject:interface:", self, self->_certificateWarningPageHandlerInterface);
    certificateWarningPageHandlerInterface = self->_certificateWarningPageHandlerInterface;
    self->_certificateWarningPageHandlerInterface = 0;

  }
}

- (void)_fetchSpecializedMessageForError:(id)a3 URL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v8, "failingURL");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = v9;
    v12 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (v11)
        goto LABEL_4;
LABEL_18:
      v10[2](v10, 0);
      goto LABEL_11;
    }
    -[_SFPageLoadErrorController _fetchSpecializedMessageForError:URL:completionHandler:].cold.1(v12, v8);
    if (!v11)
      goto LABEL_18;
  }
LABEL_4:
  if (!objc_msgSend(v8, "safari_isPrivacyProxyError"))
  {
    if (objc_msgSend(v8, "safari_isLocalNetworkContentFilteringError"))
    {
      objc_msgSend(v11, "host");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchLocalNetworkContentFilteringErrorMessageForFailingURLString:withCompletionHandler:", v14, v10);
      goto LABEL_9;
    }
    if (objc_msgSend(v8, "_web_errorIsInDomain:", *MEMORY[0x1E0CB32E8]))
    {
      -[_SFPageLoadErrorController _errorMessageForNSURLErrorDomain:url:](self, "_errorMessageForNSURLErrorDomain:url:", v8, v11);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (!objc_msgSend(v8, "_web_errorIsInDomain:", *MEMORY[0x1E0CB2FE0])
      || objc_msgSend(v8, "code") != 54)
    {
      v10[2](v10, 0);
      goto LABEL_10;
    }
  }
  _WBSLocalizedString();
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v14 = (void *)v13;
  v10[2](v10, v13);
LABEL_9:

LABEL_10:
LABEL_11:

}

- (id)_errorMessageForNSURLErrorDomain:(id)a3 url:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_URLForKey:", *MEMORY[0x1E0CB32F0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByRemovingPercentEncoding");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v5, "code");
  v12 = 0;
  if (v11 > -1103)
  {
    switch(v11)
    {
      case -1018:
      case -1014:
      case -1011:
      case -1010:
      case -1008:
      case -1007:
      case -1006:
      case -1005:
      case -1004:
      case -1003:
      case -1001:
      case -1000:
        goto LABEL_24;
      case -1017:
      case -1016:
      case -1015:
      case -1013:
      case -1012:
        goto LABEL_25;
      case -1009:
        goto LABEL_10;
      case -1002:
        v17 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safari_userVisibleScheme");
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      default:
        if (v11 == -1102)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          _WBSLocalizedString();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "displayNameAtPath:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", v16, v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_22;
        }
        if (v11 != -1100)
          goto LABEL_25;
        v17 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "path");
        v18 = objc_claimAutoreleasedReturnValue();
        break;
    }
    goto LABEL_19;
  }
  if (v11 > -1201)
  {
    if (v11 != -1200)
    {
      if (v11 == -1103)
        goto LABEL_24;
      goto LABEL_25;
    }
    if (isDiffieHellmanError(v5))
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "host");
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_19:
      v19 = (void *)v18;
      objc_msgSend(v17, "stringWithFormat:", v16, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

      goto LABEL_23;
    }
LABEL_24:
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (v11 == -2000)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0D8A8B8], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "deviceClass");

    if (v14 == 3 && objc_msgSend(v10, "length"))
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v11 == -1205)
    goto LABEL_24;
LABEL_25:

  return v12;
}

- (id)_genericMessageForError:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "_web_localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addDialog:(id)a3
{
  SFDialogPresenting **p_dialogPresenter;
  id v5;
  id v6;
  id WeakRetained;

  p_dialogPresenter = &self->_dialogPresenter;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dialogPresenter);
  objc_msgSend(WeakRetained, "presentDialog:sender:", v5, self);

  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "pageLoadErrorControllerDidAddAlert:", self);

}

- (void)addAlert:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  _SFPageLoadErrorController *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D4EC60];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __39___SFPageLoadErrorController_addAlert___block_invoke;
  v11 = &unk_1E4AC0668;
  v12 = v4;
  v13 = self;
  v6 = v4;
  objc_msgSend(v5, "dialogWithWebUIAlert:completionHandler:", v6, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPageLoadErrorController addDialog:](self, "addDialog:", v7, v8, v9, v10, v11);

}

- (void)_continueAfterCertificateAlertWithURL:(id)a3 trust:(__SecTrust *)a4 recoveryAttempter:(id)a5
{
  void *v6;
  CFIndex CertificateCount;
  CFIndex v8;
  CFIndex i;
  SecCertificateRef CertificateAtIndex;
  void (**v11)(void);

  v11 = (void (**)(void))a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    CertificateCount = SecTrustGetCertificateCount(a4);
    if (CertificateCount >= 1)
    {
      v8 = CertificateCount;
      for (i = 0; i != v8; ++i)
      {
        CertificateAtIndex = SecTrustGetCertificateAtIndex(a4, i);
        if (CertificateAtIndex)
          objc_msgSend(v6, "addObject:", CertificateAtIndex);
      }
    }
  }
  if (v11)
    v11[2]();

}

- (void)_continueWithoutCredentialsUsingAlertContext:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "objectForKey:", CFSTR("reason"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("reasonAuthenticationChallenge"));

    v3 = v8;
    if (v5)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("completionHandler"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 3, 0);

      v3 = v8;
    }
  }

}

- (void)performAction:(int)a3 forAlert:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(v6, "type");
  if (v7 == 4)
  {
    if (a3 != 4)
    {
      if (a3 != 5)
        goto LABEL_19;
      objc_msgSend(v6, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "selectedIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          objc_msgSend(v6, "identities");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 134217984;
          v27 = objc_msgSend(v14, "count");
          _os_log_impl(&dword_1A3B2D000, v13, OS_LOG_TYPE_DEFAULT, "User has selected an identity out of %lu", (uint8_t *)&v26, 0xCu);

        }
        objc_msgSend(v10, "objectForKey:", CFSTR("authenticationChallenge"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "protectionSpace");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "safari_identityPreferenceDomain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFPageLoadErrorController _cacheSecIdentityIfNeeded:forIdentityDomain:](self, "_cacheSecIdentityIfNeeded:forIdentityDomain:", v11, v17);

        proceedWithClientCertificateIdentity((uint64_t)v11, v10);
        objc_msgSend(v6, "identities");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19 == 1)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "pageLoadErrorControllerGetSecIdentityPreferencesController:", self);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("authenticationChallenge"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "protectionSpace");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "_sf_highLevelDomainAndPort");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "saveShouldUseOnlyAvailableIdentityWithoutPrompting:forDomainAndPort:", 1, v24);

        }
      }

LABEL_18:
      goto LABEL_19;
    }
    v25 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1A3B2D000, v25, OS_LOG_TYPE_DEFAULT, "User has cancelled identities picker", (uint8_t *)&v26, 2u);
    }
LABEL_17:
    objc_msgSend(v6, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageLoadErrorController _continueWithoutCredentialsUsingAlertContext:](self, "_continueWithoutCredentialsUsingAlertContext:", v10);
    goto LABEL_18;
  }
  if (v7 != 3)
    goto LABEL_19;
  if (a3 == 4)
    goto LABEL_17;
  if (a3 == 5)
  {
    objc_msgSend(v6, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    newAlertToListPossibleClientSideCertificatesWithContext(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFPageLoadErrorController addAlert:](self, "addAlert:", v9);
  }
LABEL_19:

}

- (void)addFormAlertWithTitle:(id)a3 decisionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D4EC60];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68___SFPageLoadErrorController_addFormAlertWithTitle_decisionHandler___block_invoke;
  v10[3] = &unk_1E4AC0690;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "formSubmissionDialogWithMessage:completionHandler:", a3, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPageLoadErrorController addDialog:](self, "addDialog:", v9);

}

- (void)addAlertWithTitle:(id)a3 bodyText:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0D4EC60], "genericErrorDialogWithTitle:message:applicationModal:", a3, a4, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFPageLoadErrorController addDialog:](self, "addDialog:", v5);

}

- (void)showErrorPageWithTitle:(id)a3 bodyText:(id)a4 learnMoreLink:(id)a5 forError:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  int v30;
  __CFString *v31;
  __CFString *v32;
  id WeakRetained;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD block[5];
  id v45;
  id v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a6, "failingURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pathForResource:ofType:", CFSTR("StandardError"), CFSTR("html"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v15, 4, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v11, "safari_stringByReplacingMarkupCharactersWithHTMLEntities");
        v42 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "safari_stringByReplacingLastOccurrenceOfWhitespaceWithANonBreakingSpace");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR("<br>"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v42;
        objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("<br>"));
        v20 = objc_claimAutoreleasedReturnValue();

        v43 = (void *)v20;
        if (v20)
        {
          if (v12)
          {
            v21 = (void *)MEMORY[0x1E0CB3940];
            _WBSLocalizedString();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR(" <a href=\"%@\">%@</a>"), v12, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringByAppendingString:", v23);
            v24 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)v24;
          }
          objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "firstObject");
          v26 = objc_claimAutoreleasedReturnValue();

          v27 = &stru_1E4AC8470;
          v41 = (void *)v26;
          if (v26 && objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v26) == 2)
            v27 = CFSTR("body { direction: rtl; }\n");
          v28 = (void *)MEMORY[0x1E0D8A8B8];
          v40 = v27;
          objc_msgSend(v28, "currentDevice");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "deviceClass");

          v31 = CFSTR("phone");
          if (v30 == 6)
            v31 = CFSTR("watch");
          if (v30 == 3)
            v31 = CFSTR("pad");
          v32 = v31;
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v34 = objc_msgSend(WeakRetained, "pageLoadErrorControllerIsInPreviewMode:", self);

          if (v34)
          {
            -[__CFString stringByAppendingFormat:](v32, "stringByAppendingFormat:", CFSTR(" %@"), CFSTR("preview"));
            v35 = objc_claimAutoreleasedReturnValue();

            v32 = (__CFString *)v35;
          }
          v36 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "safari_stringByReplacingMarkupCharactersWithHTMLEntities");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v36;
          v16 = v42;
          objc_msgSend(v38, "stringWithFormat:", v42, v41, v40, v37, v32, v43);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __85___SFPageLoadErrorController_showErrorPageWithTitle_bodyText_learnMoreLink_forError___block_invoke;
            block[3] = &unk_1E4ABFC38;
            block[4] = self;
            v45 = v39;
            v46 = v13;
            dispatch_async(MEMORY[0x1E0C80D38], block);

          }
        }
      }

    }
  }

}

- (void)showErrorPageWithTitle:(id)a3 bodyText:(id)a4 forError:(id)a5
{
  -[_SFPageLoadErrorController showErrorPageWithTitle:bodyText:learnMoreLink:forError:](self, "showErrorPageWithTitle:bodyText:learnMoreLink:forError:", a3, a4, 0, a5);
}

- (id)_certificateWarningPagePresenterProxy
{
  WBSCertificateWarningPagePresenter *certificateWarningPagePresenterProxy;
  id WeakRetained;
  void *v5;
  void *v6;
  WBSCertificateWarningPagePresenter *v7;
  WBSCertificateWarningPagePresenter *v8;

  certificateWarningPagePresenterProxy = self->_certificateWarningPagePresenterProxy;
  if (!certificateWarningPagePresenterProxy)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "_remoteObjectRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE77BC00);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxyWithInterface:", v6);
    v7 = (WBSCertificateWarningPagePresenter *)objc_claimAutoreleasedReturnValue();
    v8 = self->_certificateWarningPagePresenterProxy;
    self->_certificateWarningPagePresenterProxy = v7;

    certificateWarningPagePresenterProxy = self->_certificateWarningPagePresenterProxy;
  }
  return certificateWarningPagePresenterProxy;
}

- (void)_loadCertificateWarningPageForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  if (!self->_certificateWarningPageHandlerInterfaceInvalidated)
  {
    -[_SFPageLoadErrorController _certificateWarningPagePresenterProxy](self, "_certificateWarningPagePresenterProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareCertificateWarningPage:", v4);

    objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariSharedBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("CertificateWarningFall2023"), CFSTR("html"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v7, 4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68___SFPageLoadErrorController__loadCertificateWarningPageForContext___block_invoke;
    v11[3] = &unk_1E4AC06B8;
    v11[4] = self;
    v12 = v8;
    v13 = v7;
    v14 = v4;
    v9 = v7;
    v10 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

- (void)_handleCertificateError:(id)a3 forURL:(id)a4 isMainFrame:(BOOL)a5 recoveryAttempter:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t);
  id WeakRetained;
  char v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SecPolicyRef SSL;
  id v34;
  void *v35;
  int v36;
  void *v37;
  id certificateRecoveryAttempter;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *certificates;
  id v48;
  id v49;
  __CFString *hostname;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  void (**v55)(id, uint64_t);
  SecTrustRef trust;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, uint64_t))a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = objc_msgSend(WeakRetained, "pageLoadErrorControllerShouldHandleCertificateError:", self);

  if ((v17 & 1) != 0)
  {
    if (v9 && objc_msgSend(v12, "safari_isPrivacyProxyFailClosedError"))
    {
      objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isPrivacyProxySetToTrackersAndWebsites");

      v20 = objc_alloc(MEMORY[0x1E0D8A820]);
      -[_SFPageLoadErrorController _firstItemWithUniqueURLInBackListFromURL:](self, "_firstItemWithUniqueURLInBackListFromURL:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initPrivateRelayFailClosedNavigationWarningWithFailingURL:isPrivateRelaySetToTrackersAndWebsites:canGoBack:", v13, v19, v21 != 0);
      -[_SFPageLoadErrorController _loadCertificateWarningPageForContext:](self, "_loadCertificateWarningPageForContext:", v22);

      if (v15)
        v15[2](v15, 1);
      goto LABEL_37;
    }
    if ((objc_msgSend(v12, "_web_errorIsInDomain:", *MEMORY[0x1E0CB32E8]) & 1) != 0)
    {
      v48 = v14;
      objc_msgSend(v12, "failingURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "host");
      hostname = (__CFString *)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(v12, "code");
      v25 = v24 & 0xFFFFFFFFFFFFFFFELL;
      if ((v24 & 0xFFFFFFFFFFFFFFFCLL) != 0xFFFFFFFFFFFFFB4CLL && v25 != -1206)
      {
        v14 = v48;
        if (v15)
          v15[2](v15, 0);
        goto LABEL_36;
      }
      v26 = WBS_LOG_CHANNEL_PREFIXCertificates();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[_SFPageLoadErrorController _handleCertificateError:forURL:isMainFrame:recoveryAttempter:completionHandler:].cold.1(v26, v12);
      if (v25 == -1206)
      {
        newAlertToHandleClientSideCertificateErrorCode(v24, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          objc_msgSend(v27, "setHideAction:", 4);
          -[_SFPageLoadErrorController addAlert:](self, "addAlert:", v28);
        }
        v14 = v48;
        if (v15)
          v15[2](v15, 1);

        goto LABEL_36;
      }
      objc_msgSend(v12, "userInfo");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("NSErrorPeerCertificateChainKey"));
      certificates = (void *)objc_claimAutoreleasedReturnValue();

      v45 = v29;
      objc_msgSend(v29, "userInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0C93268]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      trust = (SecTrustRef)v32;
      if (v32)
      {
        v14 = v48;
      }
      else
      {
        v14 = v48;
        if (certificates)
        {
          SSL = SecPolicyCreateSSL(1u, hostname);
          SecTrustCreateWithCertificates(certificates, SSL, &trust);
          CFRelease(SSL);
          CFAutorelease(trust);
          v32 = trust;
        }
        if (!v32)
        {
          v40 = v45;
          v39 = v46;
          v41 = certificates;
          if (v15)
            v15[2](v15, 0);
          goto LABEL_35;
        }
      }
      v34 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(MEMORY[0x1E0D8A818], "sharedManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v34;
      v36 = objc_msgSend(v35, "didInvalidCertificateExceptionsApplySuccessfullyForProtectionSpace:inPrivateBrowsing:", self->_protectionSpaceForInvalidCertificateBypass, objc_msgSend(v34, "pageLoadErrorControllerShouldPermanentlyAcceptCertificate:", self));

      self->_certificateTrust = (__SecTrust *)CFRetain(trust);
      v37 = (void *)MEMORY[0x1A8598C40](v14);
      certificateRecoveryAttempter = self->_certificateRecoveryAttempter;
      self->_certificateRecoveryAttempter = v37;

      objc_storeStrong((id *)&self->_certificateFailingURL, a4);
      if (v9)
      {
        if (!v36)
        {
          v43 = (void *)MEMORY[0x1E0C99D68];
          v44 = *MEMORY[0x1E0D8B180];
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __109___SFPageLoadErrorController__handleCertificateError_forURL_isMainFrame_recoveryAttempter_completionHandler___block_invoke;
          v51[3] = &unk_1E4AC0708;
          v51[4] = self;
          v52 = v12;
          v41 = certificates;
          v53 = certificates;
          v54 = v13;
          v55 = v15;
          objc_msgSend(v43, "safari_dateFromNTPServerWithTimeout:completionHandler:", v51, v44);

          v40 = v45;
          v39 = v46;
          v42 = v49;
LABEL_34:

LABEL_35:
LABEL_36:

          goto LABEL_37;
        }
        -[_SFPageLoadErrorController _continueAfterCertificateAlertWithURL:trust:recoveryAttempter:](self, "_continueAfterCertificateAlertWithURL:trust:recoveryAttempter:", v13, self->_certificateTrust, v14);
      }
      v40 = v45;
      v39 = v46;
      v41 = certificates;
      v42 = v49;
      if (v15)
        v15[2](v15, 1);
      goto LABEL_34;
    }
  }
  if (v15)
    v15[2](v15, 0);
LABEL_37:

}

- (void)_reachabilityChanged:(id)a3
{
  void *v4;
  int v5;
  id WeakRetained;
  char v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safari_BOOLForKey:", *MEMORY[0x1E0CFA300]);

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_msgSend(WeakRetained, "pageLoadErrorControllerShouldReloadAfterError:", self);

    if ((v7 & 1) != 0)
      -[_SFPageLoadErrorController reloadAfterError](self, "reloadAfterError");
    else
      self->_reloadAfterResume = 1;
  }
}

- (void)_setFailedRequest:(id)a3
{
  NSURLRequest *v5;
  NSURLRequest *failedRequest;
  void *v7;
  void *v8;
  void *v9;
  NSURLRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  NSURLRequest *v14;

  v5 = (NSURLRequest *)a3;
  failedRequest = self->_failedRequest;
  v14 = v5;
  if (failedRequest != v5)
  {
    if (failedRequest)
    {
      -[NSURLRequest URL](failedRequest, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObserver:forHostname:", self, v8);

      }
    }
    objc_storeStrong((id *)&self->_failedRequest, a3);
    self->_reloadAfterResume = 0;
    v10 = self->_failedRequest;
    if (v10)
    {
      -[NSURLRequest URL](v10, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObserver:selector:forHostname:", self, sel__reachabilityChanged_, v12);

      }
    }
  }

}

- (id)_titleForError:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  if (v4 != -1205 && v4 != -1102 && v4 != -1100)
    isDiffieHellmanError(v3);
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_handleFrameLoadError:(id)a3 forURL:(id)a4 recoveryAttempter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "code");
  if ((!objc_msgSend(v8, "_web_errorIsInDomain:", *MEMORY[0x1E0CEF7D8]) || v11 != 102)
    && (!objc_msgSend(v8, "_web_errorIsInDomain:", *MEMORY[0x1E0CB32E8]) || v11 != -1012 && v11 != -999))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke;
    v12[3] = &unk_1E4AC0758;
    v12[4] = self;
    v13 = v8;
    v15 = v11;
    v14 = v9;
    -[_SFPageLoadErrorController _handleCertificateError:forURL:isMainFrame:recoveryAttempter:completionHandler:](self, "_handleCertificateError:forURL:isMainFrame:recoveryAttempter:completionHandler:", v13, v14, 1, v10, v12);

  }
}

- (void)addDisallowedUseOfJavaScriptAlert
{
  void *v3;
  id v4;

  _WBSLocalizedString();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPageLoadErrorController addAlertWithTitle:bodyText:](self, "addAlertWithTitle:bodyText:", v4, v3);

}

- (void)addDisallowedFileURLAlert
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D4EC60];
  _WBSLocalizedString();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageLoadErrorWithMessage:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPageLoadErrorController addDialog:](self, "addDialog:", v4);

}

- (void)clearFailedRequest
{
  -[_SFPageLoadErrorController _setFailedRequest:](self, "_setFailedRequest:", 0);
  self->_reloadingFailedRequest = 0;
}

- (void)reloadAfterError
{
  id WeakRetained;

  objc_retainAutorelease(self->_failedRequest);
  self->_reloadingFailedRequest = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pageLoadErrorController:loadFailedRequestAfterError:", self, self->_failedRequest);

}

- (void)handleFrameLoadError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "failingURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51___SFPageLoadErrorController_handleFrameLoadError___block_invoke;
  v7[3] = &unk_1E4AC0780;
  v8 = v4;
  v6 = v4;
  -[_SFPageLoadErrorController _handleFrameLoadError:forURL:recoveryAttempter:](self, "_handleFrameLoadError:forURL:recoveryAttempter:", v6, v5, v7);

}

- (void)handleSubframeCertificateError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "failingURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61___SFPageLoadErrorController_handleSubframeCertificateError___block_invoke;
  v7[3] = &unk_1E4AC0780;
  v8 = v4;
  v6 = v4;
  -[_SFPageLoadErrorController _handleCertificateError:forURL:isMainFrame:recoveryAttempter:completionHandler:](self, "_handleCertificateError:forURL:isMainFrame:recoveryAttempter:completionHandler:", v6, v5, 0, v7, 0);

}

- (void)handleLegacyTLSWithFailingURL:(id)a3 clickThroughURL:(id)a4 authenticationChallenge:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __100___SFPageLoadErrorController_handleLegacyTLSWithFailingURL_clickThroughURL_authenticationChallenge___block_invoke;
  v11[3] = &unk_1E4AC07A8;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)handleClientCertificateAuthenticationChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  WBSSecIdentitiesCache *secIdentitiesCache;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[4];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pageLoadErrorControllerGetSecIdentityPreferencesController:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "protectionSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_sf_highLevelDomainAndPort");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v9, "shouldUseOnlyAvailableIdentityWithoutPromptingForDomainAndPort:", v11);
  v13 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    v28 = v11;
    v29 = 1024;
    v30 = v12;
    _os_log_impl(&dword_1A3B2D000, v13, OS_LOG_TYPE_DEFAULT, "Received challenge for domain: %{sensitive}@, use only available identity without prompt: %d", buf, 0x12u);
  }
  v26[0] = v6;
  v26[1] = CFSTR("reasonAuthenticationChallenge");
  v14 = (void *)objc_msgSend(v7, "copy", CFSTR("authenticationChallenge"), CFSTR("reason"), CFSTR("completionHandler"));

  v26[2] = v14;
  v25[3] = CFSTR("useOnlyAvailableIdentityWithoutPrompting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  secIdentitiesCache = self->_secIdentitiesCache;
  objc_msgSend(v6, "protectionSpace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safari_identityPreferenceDomain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[WBSSecIdentitiesCache secIdentityForDomain:](secIdentitiesCache, "secIdentityForDomain:", v19);

  v21 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v21, OS_LOG_TYPE_DEFAULT, "Found a preferred identity to skip prompting", buf, 2u);
    }
    proceedWithClientCertificateIdentity(v20, v16);
  }
  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v21, OS_LOG_TYPE_DEFAULT, "Could not find a preferred identity to skip prompting", buf, 2u);
    }
    newAlertToHandleClientSideCertificateErrorCode(-1206, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "setHideAction:", 4);
      objc_msgSend(v24, "setContext:", v16);
      -[_SFPageLoadErrorController addAlert:](self, "addAlert:", v24);
    }

  }
}

- (void)addInvalidURLAlert
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D4EC60];
  _WBSLocalizedString();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageLoadErrorWithMessage:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPageLoadErrorController addDialog:](self, "addDialog:", v4);

}

- (void)addInvalidProfileAlert
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D4EC60];
  _WBSLocalizedString();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "genericErrorDialogWithTitle:message:applicationModal:", v6, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPageLoadErrorController addDialog:](self, "addDialog:", v5);

}

- (void)addDownloadFailedAlertWithDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (!v4)
  {
    _WBSLocalizedString();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v4;
  v5 = (void *)MEMORY[0x1E0D4EC60];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "genericErrorDialogWithTitle:message:applicationModal:", v6, v8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPageLoadErrorController addDialog:](self, "addDialog:", v7);

}

- (void)_showRepeatedWebProcessCrashError:(id)a3 URLString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  _WBSLocalizedString();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFPageLoadErrorController showErrorPageWithTitle:bodyText:forError:](self, "showErrorPageWithTitle:bodyText:forError:", v11, v10, v7);
}

- (void)_resetCrashCount:(id)a3
{
  self->_crashesSinceLastSuccessfulLoad = 0;
}

- (void)clearCrashCountResetTimer
{
  NSTimer *crashCountResetTimer;

  -[NSTimer invalidate](self->_crashCountResetTimer, "invalidate");
  crashCountResetTimer = self->_crashCountResetTimer;
  self->_crashCountResetTimer = 0;

}

- (void)_resetCrashCountSoon
{
  NSTimer *v3;
  NSTimer *crashCountResetTimer;

  -[_SFPageLoadErrorController clearCrashCountResetTimer](self, "clearCrashCountResetTimer");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__resetCrashCount_, 0, 0, 30.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  crashCountResetTimer = self->_crashCountResetTimer;
  self->_crashCountResetTimer = v3;

}

- (BOOL)updateCrashesAndShowCrashError:(id)a3 URLString:(id)a4
{
  unint64_t v4;

  v4 = self->_crashesSinceLastSuccessfulLoad + 1;
  self->_crashesSinceLastSuccessfulLoad = v4;
  if (v4 >= 2)
  {
    self->_crashesSinceLastSuccessfulLoad = 0;
    -[_SFPageLoadErrorController _showRepeatedWebProcessCrashError:URLString:](self, "_showRepeatedWebProcessCrashError:URLString:", a3, a4);
  }
  return v4 > 1;
}

- (void)scheduleResetCrashCount
{
  if (self->_crashesSinceLastSuccessfulLoad)
    -[_SFPageLoadErrorController _resetCrashCountSoon](self, "_resetCrashCountSoon");
}

- (void)webViewDidCommitErrorPagePreview:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("document.body.classList.remove('%@')"), CFSTR("preview"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evaluateJavaScript:completionHandler:", v5, 0);

}

- (void)goBackButtonClicked
{
  NSURLProtectionSpace *protectionSpaceForInvalidCertificateBypass;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id WeakRetained;

  protectionSpaceForInvalidCertificateBypass = self->_protectionSpaceForInvalidCertificateBypass;
  self->_protectionSpaceForInvalidCertificateBypass = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v4 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "backForwardList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "backForwardList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "safari_isEqualToURL:", v10))
  {
    -[_SFPageLoadErrorController _firstItemWithUniqueURLInBackListFromURL:](self, "_firstItemWithUniqueURLInBackListFromURL:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = (id)objc_msgSend(WeakRetained, "goToBackForwardListItem:", v11);
    else
      objc_msgSend(v4, "pageLoadErrorControllerClosePage:", self);

  }
  else if (objc_msgSend(WeakRetained, "canGoBack"))
  {
    v13 = (id)objc_msgSend(WeakRetained, "goBack");
  }
  else
  {
    objc_msgSend(v4, "pageLoadErrorControllerClosePage:", self);
  }

}

- (id)_firstItemWithUniqueURLInBackListFromURL:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "backForwardList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "backForwardList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "safari_isEqualToURL:", v10);

  if ((v11 & 1) != 0)
  {
    v23 = v7;
    v24 = v4;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v7, "reverseObjectEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
          objc_msgSend(v9, "URL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "URL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "safari_isEqualToURL:", v19);

          if (!v20)
          {
            v21 = v17;

            goto LABEL_13;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v14)
          continue;
        break;
      }
    }

    v21 = 0;
LABEL_13:
    v7 = v23;
    v4 = v24;
  }
  else
  {
    v21 = v9;
  }

  return v21;
}

- (void)visitInsecureWebsiteWithTemporaryBypass
{
  void *v3;
  NSURLProtectionSpace *protectionSpaceForInvalidCertificateBypass;

  objc_msgSend(MEMORY[0x1E0D8A818], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rememberCertificateBypassForProtectionSpace:inPrivateBrowsing:", self->_protectionSpaceForInvalidCertificateBypass, 1);

  -[_SFPageLoadErrorController _continueAfterCertificateAlertWithURL:trust:recoveryAttempter:](self, "_continueAfterCertificateAlertWithURL:trust:recoveryAttempter:", self->_certificateFailingURL, self->_certificateTrust, self->_certificateRecoveryAttempter);
  protectionSpaceForInvalidCertificateBypass = self->_protectionSpaceForInvalidCertificateBypass;
  self->_protectionSpaceForInvalidCertificateBypass = 0;

}

- (void)visitInsecureWebsite
{
  id WeakRetained;
  WBSCertificateWarningPageContext *legacyTLSWarningPageContext;
  void *v5;
  WBSCertificateWarningPageContext *v6;
  NSURL *clickThroughURL;
  void *v8;
  _QWORD v9[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  legacyTLSWarningPageContext = self->_legacyTLSWarningPageContext;
  if (legacyTLSWarningPageContext)
  {
    -[WBSCertificateWarningPageContext failingURL](legacyTLSWarningPageContext, "failingURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "pageLoadErrorController:allowLegacyTLSConnectionForURL:navigateToURL:", self, v5, self->_clickThroughURL);

    v6 = self->_legacyTLSWarningPageContext;
    self->_legacyTLSWarningPageContext = 0;

    clickThroughURL = self->_clickThroughURL;
    self->_clickThroughURL = 0;

  }
  else if ((objc_msgSend(WeakRetained, "pageLoadErrorControllerShouldPermanentlyAcceptCertificate:", self) & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50___SFPageLoadErrorController_visitInsecureWebsite__block_invoke;
    v9[3] = &unk_1E4ABFE00;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0D4EC60], "permanentlyAcceptCertificateDialogWithAcceptanceHandler:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageLoadErrorController addDialog:](self, "addDialog:", v8);

  }
  else
  {
    -[_SFPageLoadErrorController visitInsecureWebsiteWithTemporaryBypass](self, "visitInsecureWebsiteWithTemporaryBypass");
  }

}

- (void)openClockSettings
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=DATE_AND_TIME"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

+ (void)clearOldCertificateBypasses
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllTrusts");

}

- (void)showCertificateInformation
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UINavigationController *v11;
  UINavigationController *certificateNavigationViewController;
  id WeakRetained;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v3 = (void *)getCertificateViewControllerClass_softClass;
  v18 = getCertificateViewControllerClass_softClass;
  if (!getCertificateViewControllerClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getCertificateViewControllerClass_block_invoke;
    v14[3] = &unk_1E4ABFC78;
    v14[4] = &v15;
    __getCertificateViewControllerClass_block_invoke((uint64_t)v14);
    v3 = (void *)v16[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v15, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "initWithTrust:action:", self->_certificateTrust, 2);
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v8, 2, self, sel__dismissCertificateViewButtonTapped);
  objc_msgSend(v5, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

  v11 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  certificateNavigationViewController = self->_certificateNavigationViewController;
  self->_certificateNavigationViewController = v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pageLoadErrorController:presentViewController:", self, self->_certificateNavigationViewController);

}

- (void)_dismissCertificateViewButtonTapped
{
  UINavigationController *certificateNavigationViewController;

  -[UINavigationController dismissViewControllerAnimated:completion:](self->_certificateNavigationViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  certificateNavigationViewController = self->_certificateNavigationViewController;
  self->_certificateNavigationViewController = 0;

}

- (void)visitWebsiteWithoutPrivateRelay
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pageLoadErrorControllerReloadWithoutPrivateRelay:", self);

}

- (_SFPageLoadErrorControllerDelegate)delegate
{
  return (_SFPageLoadErrorControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)reloadingFailedRequest
{
  return self->_reloadingFailedRequest;
}

- (NSURLRequest)failedRequest
{
  return self->_failedRequest;
}

- (unint64_t)crashesSinceLastSuccessfulLoad
{
  return self->_crashesSinceLastSuccessfulLoad;
}

- (SFDialogPresenting)dialogPresenter
{
  return (SFDialogPresenting *)objc_loadWeakRetained((id *)&self->_dialogPresenter);
}

- (NSURLProtectionSpace)protectionSpaceForInvalidCertificateBypass
{
  return self->_protectionSpaceForInvalidCertificateBypass;
}

- (void)setProtectionSpaceForInvalidCertificateBypass:(id)a3
{
  objc_storeStrong((id *)&self->_protectionSpaceForInvalidCertificateBypass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionSpaceForInvalidCertificateBypass, 0);
  objc_destroyWeak((id *)&self->_dialogPresenter);
  objc_storeStrong((id *)&self->_failedRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_certificateNavigationViewController, 0);
  objc_storeStrong((id *)&self->_clickThroughURL, 0);
  objc_storeStrong((id *)&self->_certificateFailingURL, 0);
  objc_storeStrong(&self->_certificateRecoveryAttempter, 0);
  objc_storeStrong((id *)&self->_certificateWarningPageHandlerInterface, 0);
  objc_storeStrong((id *)&self->_certificateWarningPagePresenterProxy, 0);
  objc_storeStrong((id *)&self->_legacyTLSWarningPageContext, 0);
  objc_storeStrong((id *)&self->_secIdentitiesCache, 0);
  objc_storeStrong((id *)&self->_crashCountResetTimer, 0);
  objc_destroyWeak((id *)&self->_webView);
}

- (void)_fetchSpecializedMessageForError:(void *)a1 URL:(void *)a2 completionHandler:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;
  void *v9;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);

}

- (void)_handleCertificateError:(void *)a1 forURL:(void *)a2 isMainFrame:recoveryAttempter:completionHandler:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_t v8;
  os_log_type_t v9;
  const char *v10;
  uint8_t *v11;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_numberForKey:", *MEMORY[0x1E0C93028]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intValue");
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(v7, v8, v9, v10, v11, 0x12u);

  OUTLINED_FUNCTION_0_1();
}

@end

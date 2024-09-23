@implementation SLExternalServiceGatekeeper

- (id)initForPermissionToAccessURL:(id)a3 fromURLString:(id)a4 completion:(id)a5
{
  uint64_t v5;
  id v10;
  id v11;
  id v12;
  SLExternalServiceGatekeeper *v13;
  void *v14;
  uint64_t v15;
  NSString *redirectHost;
  uint64_t v17;
  id completion;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SLExternalServiceGatekeeper *v31;
  void *v33;
  uint64_t v34;
  objc_super v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v35.receiver = self;
  v35.super_class = (Class)SLExternalServiceGatekeeper;
  v13 = -[SLExternalServiceGatekeeper init](&v35, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "host");
    v15 = objc_claimAutoreleasedReturnValue();
    redirectHost = v13->_redirectHost;
    v13->_redirectHost = (NSString *)v15;

    objc_storeStrong((id *)&v13->_url, a3);
    v17 = MEMORY[0x1C3B6C8B8](v12);
    completion = v13->_completion;
    v13->_completion = (id)v17;

    if (-[SLExternalServiceGatekeeper _gatekeepingIsNotAvailable](v13, "_gatekeepingIsNotAvailable"))
    {
      v19 = 0;
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:cachePolicy:timeoutInterval:", v19, 1, 30.0, v33);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v5, 7, CFSTR("SLExternalServiceGatekeeper loading modified URL: %{private}@"));
      v26 = (void *)MEMORY[0x1E0CB39F0];
      objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration", v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sessionWithConfiguration:delegate:delegateQueue:", v27, v13, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "dataTaskWithRequest:", v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "resume");

      v31 = v13;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v10, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "host");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "length") && objc_msgSend(v23, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@%@"), v22, v23);
    }
    else
    {
      if (!objc_msgSend(v22, "length"))
      {
        _SLLog(v5, 3, CFSTR("Failed to parse hostname from loginURL, this can't be good..."));
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), v22, v34);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPath:", v24);

LABEL_11:
    objc_msgSend(v21, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v19;
    _SLLog(v5, 7, CFSTR("SLExternalServiceGatekeeper modified the URL: %{private}@"));

    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

- (BOOL)_gatekeepingIsNotAvailable
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.social.SLYahooAuth.SLYahooAuthService"));
  return CFPreferencesGetAppBooleanValue(CFSTR("com.apple.social.yahoo.gatekeepingIsNotAvailable"), CFSTR("com.apple.social.SLYahooAuth.SLYahooAuthService"), 0) != 0;
}

- (void)_completeWithURLToLoad:(id)a3 error:(id)a4
{
  id v6;
  SLExternalServiceGatekeeper *v7;
  void (**completion)(id, id, id);
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  completion = (void (**)(id, id, id))v7->_completion;
  if (completion)
  {
    completion[2](completion, v10, v6);
    v9 = v7->_completion;
    v7->_completion = 0;

  }
  objc_sync_exit(v7);

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v7;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = (void (**)(id, _QWORD))a7;
  objc_msgSend(v12, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "host");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v7, 7, CFSTR("SLExternalServiceGatekeeper willSendRequest called for host: %@"));

  objc_msgSend(v12, "URL", v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL host](self->_url, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToString:", v17);

  if (v18)
  {
    objc_msgSend(v11, "invalidateAndCancel");
    -[SLExternalServiceGatekeeper _completeWithURLToLoad:error:](self, "_completeWithURLToLoad:error:", self->_url, 0);
LABEL_6:
    v13[2](v13, 0);
    goto LABEL_7;
  }
  objc_msgSend(v12, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "host");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", self->_redirectHost);

  objc_msgSend(v12, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if ((v21 & 1) == 0)
  {
    v31 = v22;
    _SLLog(v7, 3, CFSTR("SLExternalServiceGatekeeper continuing to load unexpected URL: %{private}@"));

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class(), v31, v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("BAD_REDIRECT_ERROR_DESCRIPTION"), &stru_1E7592238, CFSTR("Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("SLErrorDomain"), -2, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLExternalServiceGatekeeper _completeWithURLToLoad:error:](self, "_completeWithURLToLoad:error:", 0, v28);

    goto LABEL_6;
  }
  objc_msgSend(v22, "host");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v7, 7, CFSTR("SLExternalServiceGatekeeper continuing to load original URL with host: %@"));

  ((void (**)(id, id))v13)[2](v13, v12);
LABEL_7:

}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v6;
  void (**v8)(id, _QWORD, void *);
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;

  v8 = (void (**)(id, _QWORD, void *))a6;
  v9 = a5;
  _SLLog(v6, 7, CFSTR("SLExternalServiceGatekeeper received authentication challenge"));
  objc_msgSend(v9, "protectionSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "serverTrust");

  objc_msgSend(v9, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "authenticationMethod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB32C8]);

  if (v14)
  {
    v20 = 0;
    if (!MEMORY[0x1C3B6C444](v11, &v20) && (v20 == 4 || v20 == 1))
    {
      v15 = (void *)SecTrustCopyInfo();
      if (v15)
      {
        v16 = v15;
        objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CD7048]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "isEqualToString:", CFSTR("Apple Inc.")))
        {
          _SLLog(v6, 7, CFSTR("SLExternalServiceGatekeeper verified this challenge is Apple's EV SSL certificate"));

          objc_msgSend(MEMORY[0x1E0CB39A8], "credentialForTrust:", v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, 0, v19);

          goto LABEL_4;
        }

      }
    }
  }
  _SLLog(v6, 7, CFSTR("SLExternalServiceGatekeeper failed to identify Apple's EV certificate. Cancelling."));
  v8[2](v8, 2, 0);
LABEL_4:

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v4;
  id v6;

  if (self->_completion)
  {
    v6 = a4;
    _SLLog(v4, 7, CFSTR("SLExternalServiceGatekeeper failed with error - %@"));
    -[SLExternalServiceGatekeeper _completeWithURLToLoad:error:](self, "_completeWithURLToLoad:error:", 0, v6, v6);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v5;
  id v7;

  if (self->_completion)
  {
    v7 = a5;
    _SLLog(v5, 7, CFSTR("SLExternalServiceGatekeeper completed with error - %@"));
    -[SLExternalServiceGatekeeper _completeWithURLToLoad:error:](self, "_completeWithURLToLoad:error:", 0, v7, v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_redirectHost, 0);
}

@end

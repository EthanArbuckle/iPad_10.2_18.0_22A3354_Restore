@implementation AKAppleIDAuthenticationCommandLineContext

- (AKAppleIDAuthenticationCommandLineContext)init
{
  return -[AKAppleIDAuthenticationCommandLineContext initWithVerificationType:](self, "initWithVerificationType:", 0);
}

- (AKAppleIDAuthenticationCommandLineContext)initWithVerificationType:(int64_t)a3
{
  AKAppleIDAuthenticationCommandLineContext *v4;
  AKCommandLineUtilities *v5;
  AKCommandLineUtilities *utility;
  uint64_t v7;
  NSString *rootPath;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AKAppleIDAuthenticationCommandLineContext;
  v4 = -[AKAppleIDAuthenticationContext init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AKCommandLineUtilities);
    utility = v4->_utility;
    v4->_utility = v5;

    v4->_verificationType = a3;
    -[AKAppleIDAuthenticationCommandLineContext _rootPath](v4, "_rootPath");
    v7 = objc_claimAutoreleasedReturnValue();
    rootPath = v4->_rootPath;
    v4->_rootPath = (NSString *)v7;

    if (!v4->_verificationType)
      -[AKAppleIDAuthenticationContext setSupportsPiggybacking:](v4, "setSupportsPiggybacking:", 1);
  }
  return v4;
}

- (unint64_t)_capabilityForUIDisplay
{
  return 2;
}

- (void)setNeedsNewAppleID:(BOOL)a3
{
  NSString *v4;
  NSString *rootPath;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKAppleIDAuthenticationCommandLineContext;
  -[AKAppleIDAuthenticationContext setNeedsNewAppleID:](&v6, sel_setNeedsNewAppleID_, a3);
  -[AKAppleIDAuthenticationCommandLineContext _rootPath](self, "_rootPath");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  rootPath = self->_rootPath;
  self->_rootPath = v4;

}

- (id)_rootPath
{
  _BOOL4 v2;
  __CFString **v3;

  v2 = -[AKAppleIDAuthenticationContext needsNewAppleID](self, "needsNewAppleID");
  v3 = AKAuthorizationAppleAccountPathString;
  if (!v2)
    v3 = AKAuthorizationAuthPathString;
  return *v3;
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AKAppleIDAuthenticationCommandLineContext _promptForUsername](self, "_promptForUsername");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationCommandLineContext _promptForPassword](self, "_promptForPassword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *, _QWORD, _QWORD))v4 + 2))(v4, v6, v5, 0, 0);

}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a6;
  objc_msgSend(a3, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AKPrintLine(CFSTR("Failed to validate username and password combination: %@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  -[AKAppleIDAuthenticationContext _setPassword:](self, "_setPassword:", 0);
  -[AKAppleIDAuthenticationCommandLineContext presentBasicLoginUIWithCompletion:](self, "presentBasicLoginUIWithCompletion:", v16);

}

- (void)presentSecondFactorUIWithCompletion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(id, void *, _QWORD);

  v25 = (void (**)(id, void *, _QWORD))a3;
  -[AKAppleIDAuthenticationCommandLineContext secondFactorCode](self, "secondFactorCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v25[2](v25, v11, 0);
  }
  else
  {
    AKPrint(CFSTR("Enter 6 digit code: "), v4, v5, v6, v7, v8, v9, v10, v23);
    AKReadLine(10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "integerValue"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAppleIDAuthenticationCommandLineContext setSecondFactorCode:](self, "setSecondFactorCode:", v21);

      -[AKAppleIDAuthenticationCommandLineContext secondFactorCode](self, "secondFactorCode");
    }
    else
    {
      AKPrintLine(CFSTR("Failed to read code!"), v13, v14, v15, v16, v17, v18, v19, v24);
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7012);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void))v25[2])();

  }
}

- (void)dismissSecondFactorUIWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a6;
  objc_msgSend(a3, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AKPrintLine(CFSTR("Failed to validate code: %@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  -[AKAppleIDAuthenticationCommandLineContext presentSecondFactorUIWithCompletion:](self, "presentSecondFactorUIWithCompletion:", v16);
}

- (void)presentServerProvidedUIWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  v6 = a4;
  v7 = objc_msgSend(v25, "requestType");
  if (v7)
  {
    if (v7 == 1)
    {
      AKPrintLine(CFSTR("IDP second factor-authentication is not supported!"), v8, 1, v10, v11, v12, v13, v14, v24);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AKPrintLine(CFSTR("Unexpected second-factor authentication (%@)!"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7014);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v23);

  }
  else
  {
    AKPrintLine(CFSTR("Requesting second-factor ServerUI..."), v8, v9, v10, v11, v12, v13, v14, v24);
    -[AKAppleIDAuthenticationCommandLineContext _presentServerUISecondFactorWithConfiguration:completion:](self, "_presentServerUISecondFactorWithConfiguration:completion:", v25, v6);
  }

}

- (void)dismissServerProvidedUIWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)_presentServerUISecondFactorWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int64_t verificationType;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;

  v6 = a3;
  v14 = a4;
  verificationType = self->_verificationType;
  if (verificationType)
  {
    if (verificationType != 1)
    {
      AKPrintLine(CFSTR("Unknown verification type"), v7, v8, v9, v10, v11, v12, v13, v21);
      v18 = 0;
      goto LABEL_8;
    }
    -[AKAppleIDAuthenticationCommandLineContext utility](self, "utility");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDAuthenticationCommandLineContext rootPath](self, "rootPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mutableJSONRequestForPath:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    _AKLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationCommandLineContext _presentServerUISecondFactorWithConfiguration:completion:].cold.1(v6, v19);
  }
  else
  {
    objc_msgSend(v6, "request");
    v19 = objc_claimAutoreleasedReturnValue();
    v18 = -[NSObject mutableCopy](v19, "mutableCopy");
  }

LABEL_8:
  objc_msgSend(v6, "resourceLoadDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "signRequest:", v18);

  -[AKAppleIDAuthenticationCommandLineContext _beginDataTaskWithRequest:configuration:completion:](self, "_beginDataTaskWithRequest:configuration:completion:", v18, v6, v14);
}

- (void)_handleServerUISecondFactorWithObjectModel:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  AKAppleIDAuthenticationCommandLineContext *v64;
  _QWORD v65[4];
  id v66;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __113__AKAppleIDAuthenticationCommandLineContext__handleServerUISecondFactorWithObjectModel_configuration_completion___block_invoke;
  v65[3] = &unk_1E2E61B08;
  v11 = v10;
  v66 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x194022E4C](v65);
  objc_msgSend(v8, "allPages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "passcodeViewOM");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v16, "attributes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("url"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v64 = self;
          objc_msgSend(v16, "attributes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("httpMethod"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v14, "navTitle");
            v22 = objc_claimAutoreleasedReturnValue();
            v30 = (void *)v22;
            if (v22)
              AKPrintLine(CFSTR("%@"), v23, v24, v25, v26, v27, v28, v29, v22);
            v61 = v30;
            v62 = v19;
            v63 = v17;
            -[AKAppleIDAuthenticationCommandLineContext _parseHeaderTitleForPasscodeView:](v64, "_parseHeaderTitleForPasscodeView:", v16);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v31;
            if (v31)
              AKPrint(v31, v32, v33, v34, v35, v36, v37, v38, v57);
            objc_msgSend(v16, "attributes");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("secure"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = v39;
            v42 = objc_msgSend(v41, "BOOLValue");

            -[AKAppleIDAuthenticationCommandLineContext _promptForVerificationCodeWithSecureEntry:forTrustedNumber:](v64, "_promptForVerificationCodeWithSecureEntry:forTrustedNumber:", v42, 0);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v59, v63);
            objc_msgSend(v8, "serverInfo");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, CFSTR("serverInfo"));

            objc_msgSend(v8, "absoluteURLWithString:", v62);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[AKAppleIDAuthenticationCommandLineContext _xmlUIRequestForURL:withPostbackDictionary:](v64, "_xmlUIRequestForURL:withPostbackDictionary:", v58, v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setHTTPMethod:", v21);
            objc_msgSend(v9, "resourceLoadDelegate");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "signRequest:", v45);

            v17 = v63;
            -[AKAppleIDAuthenticationCommandLineContext _verifySecondFactorCodeWithRequest:completion:](v64, "_verifySecondFactorCodeWithRequest:completion:", v45, v11);

            v19 = v62;
          }
          else
          {
            ((void (**)(_QWORD, const __CFString *))v12)[2](v12, CFSTR("missing HTTP method"));
          }

        }
        else
        {
          ((void (**)(_QWORD, const __CFString *))v12)[2](v12, CFSTR("missing response URL"));
        }

      }
      else
      {
        ((void (**)(_QWORD, const __CFString *))v12)[2](v12, CFSTR("missing passcode identifier"));
      }

    }
    else
    {
      ((void (**)(_QWORD, const __CFString *))v12)[2](v12, CFSTR("missing passcode view"));
    }

  }
  else
  {
    objc_msgSend(v8, "primaryAlert");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend(v8, "primaryAlert");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "message");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      AKPrintLine(v49, v50, v51, v52, v53, v54, v55, v56, v57);

    }
    ((void (**)(_QWORD, const __CFString *))v12)[2](v12, CFSTR("missing page"));
  }

}

void __113__AKAppleIDAuthenticationCommandLineContext__handleServerUISecondFactorWithObjectModel_configuration_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  id v10;

  AKPrintLine(CFSTR("Unsupported object model found: %@"), a2, a3, a4, a5, a6, a7, a8, a2);
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7014);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v9 + 16))(v9, 0, 0, v10);

}

- (void)_handleServerUIWithDictionary:(id)a3 statusCode:(int64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, id, void *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v10 = a5;
  v11 = (void (**)(id, _QWORD, id, void *))a6;
  if (-[AKAppleIDAuthenticationContext needsNewAppleID](self, "needsNewAppleID"))
  {
    if ((unint64_t)(a4 - 200) > 0x63)
    {
      -[AKAppleIDAuthenticationCommandLineContext utility](self, "utility");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorFromServerResponseBody:", v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v13, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D68]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        AKPrintError(CFSTR("Error creating an account: %@.\n%@"), v17, v18, v19, v20, v21, v22, v23, (uint64_t)v15);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:underlyingError:", -7029, v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0, v26, v24);

    }
    else
    {
      -[AKAppleIDAuthenticationCommandLineContext _handleServerUIBirthdayVerificationWithResponseDictionary:configuration:completion:](self, "_handleServerUIBirthdayVerificationWithResponseDictionary:configuration:completion:", v26, v10, v11);
    }
  }
  else
  {
    -[AKAppleIDAuthenticationCommandLineContext _handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:](self, "_handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:", v26, a4, v10, v11);
  }

}

- (void)_verifySecondFactorCodeWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  v6 = a4;
  AKPrintLine(CFSTR("Verifying code…"), v7, v8, v9, v10, v11, v12, v13, v17);
  +[AKURLSession sharedURLSession](AKURLSession, "sharedURLSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__AKAppleIDAuthenticationCommandLineContext__verifySecondFactorCodeWithRequest_completion___block_invoke;
  v18[3] = &unk_1E2E61B30;
  v19 = v6;
  v15 = v6;
  v16 = (id)objc_msgSend(v14, "beginDataTaskWithRequest:completionHandler:", v5, v18);

}

void __91__AKAppleIDAuthenticationCommandLineContext__verifySecondFactorCodeWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v10 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v10)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      goto LABEL_8;
    }
  }
  else
  {

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v8 + 16))(v8, 0, 0, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7014);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v8 + 16))(v8, 0, 0, v9);

  }
LABEL_8:

}

- (void)_handleServerUIBirthdayVerificationWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25[4];
  id v26;
  id v27;
  id v28;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AKAppleIDAuthenticationCommandLineContext _accountCreationRequestBodyFromResponseDictionary:shouldIncludePhoneNumber:shouldIncludeForSecurityCode:](self, "_accountCreationRequestBodyFromResponseDictionary:shouldIncludePhoneNumber:shouldIncludeForSecurityCode:", v8, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationCommandLineContext rootPath](self, "rootPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("/birthday"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationCommandLineContext _handleServerUIBirthdayVerificationWithResponseDictionary:configuration:completion:].cold.1();

  AKPrintLine(CFSTR("☾ Verifying Birthday with server…"), v15, v16, v17, v18, v19, v20, v21, v25[0]);
  objc_initWeak(&location, self);
  -[AKAppleIDAuthenticationCommandLineContext utility](self, "utility");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = (uint64_t)__128__AKAppleIDAuthenticationCommandLineContext__handleServerUIBirthdayVerificationWithResponseDictionary_configuration_completion___block_invoke;
  v25[3] = (uint64_t)&unk_1E2E61B58;
  objc_copyWeak(&v28, &location);
  v23 = v9;
  v26 = v23;
  v24 = v10;
  v27 = v24;
  objc_msgSend(v22, "createAndExecuteRequestForPath:requestBody:httpMethod:configuration:completion:", v13, v11, CFSTR("POST"), v23, v25);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __128__AKAppleIDAuthenticationCommandLineContext__handleServerUIBirthdayVerificationWithResponseDictionary_configuration_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, id, uint64_t);
  id WeakRetained;

  if (!a3 || a4)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 16);
    WeakRetained = a3;
    v9(v8, a2, WeakRetained, a4);
  }
  else
  {
    v7 = a3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_handleServerUIPasswordVerificationWithResponseDictionary:configuration:completion:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_handleServerUIPasswordVerificationWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25[4];
  id v26;
  id v27;
  id v28;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AKAppleIDAuthenticationCommandLineContext _accountCreationRequestBodyFromResponseDictionary:shouldIncludePhoneNumber:shouldIncludeForSecurityCode:](self, "_accountCreationRequestBodyFromResponseDictionary:shouldIncludePhoneNumber:shouldIncludeForSecurityCode:", v8, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationCommandLineContext rootPath](self, "rootPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("/password"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationCommandLineContext _handleServerUIPasswordVerificationWithResponseDictionary:configuration:completion:].cold.1();

  AKPrintLine(CFSTR("⊛ Verifying Password with server…"), v15, v16, v17, v18, v19, v20, v21, v25[0]);
  objc_initWeak(&location, self);
  -[AKAppleIDAuthenticationCommandLineContext utility](self, "utility");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = (uint64_t)__128__AKAppleIDAuthenticationCommandLineContext__handleServerUIPasswordVerificationWithResponseDictionary_configuration_completion___block_invoke;
  v25[3] = (uint64_t)&unk_1E2E61B58;
  objc_copyWeak(&v28, &location);
  v23 = v9;
  v26 = v23;
  v24 = v10;
  v27 = v24;
  objc_msgSend(v22, "createAndExecuteRequestForPath:requestBody:httpMethod:configuration:completion:", v13, v11, CFSTR("POST"), v23, v25);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __128__AKAppleIDAuthenticationCommandLineContext__handleServerUIPasswordVerificationWithResponseDictionary_configuration_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, id, uint64_t);
  id WeakRetained;

  if (!a3 || a4)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 16);
    WeakRetained = a3;
    v9(v8, a2, WeakRetained, a4);
  }
  else
  {
    v7 = a3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_handleServerUIPhoneVerificationWithResponseDictionary:configuration:completion:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_handleServerUIPhoneVerificationWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26[4];
  id v27;
  id v28;
  id v29;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = (uint64_t)__125__AKAppleIDAuthenticationCommandLineContext__handleServerUIPhoneVerificationWithResponseDictionary_configuration_completion___block_invoke;
  v26[3] = (uint64_t)&unk_1E2E61B58;
  objc_copyWeak(&v29, &location);
  v11 = v9;
  v27 = v11;
  v12 = v10;
  v28 = v12;
  v13 = (void *)MEMORY[0x194022E4C](v26);
  -[AKAppleIDAuthenticationCommandLineContext _accountCreationRequestBodyFromResponseDictionary:shouldIncludePhoneNumber:shouldIncludeForSecurityCode:](self, "_accountCreationRequestBodyFromResponseDictionary:shouldIncludePhoneNumber:shouldIncludeForSecurityCode:", v8, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationCommandLineContext rootPath](self, "rootPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("/verify/phone"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationCommandLineContext _handleServerUIPhoneVerificationWithResponseDictionary:configuration:completion:].cold.1();

  AKPrintLine(CFSTR("☏ Verifying Phone Number with server…"), v18, v19, v20, v21, v22, v23, v24, v26[0]);
  -[AKAppleIDAuthenticationCommandLineContext utility](self, "utility");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "createAndExecuteRequestForPath:requestBody:httpMethod:configuration:completion:", v16, v14, CFSTR("PUT"), v11, v13);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __125__AKAppleIDAuthenticationCommandLineContext__handleServerUIPhoneVerificationWithResponseDictionary_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v10 = WeakRetained;
  if (v8 || !WeakRetained)
  {
    objc_msgSend(v8, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D68]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AKPrintError(CFSTR("Error Validating phone number: %@\n%@"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(WeakRetained, "_accountCreationRequestBodyFromResponseDictionary:shouldIncludePhoneNumber:shouldIncludeForSecurityCode:", v7, 1, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_collectAndPostSecondFactorCodeWithRequestBody:configuration:completion:", v11, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_collectAndHandleTermsAndConditionsWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26[5];
  id v27;
  id v28;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = (uint64_t)__128__AKAppleIDAuthenticationCommandLineContext__collectAndHandleTermsAndConditionsWithResponseDictionary_configuration_completion___block_invoke;
  v26[3] = (uint64_t)&unk_1E2E61B58;
  objc_copyWeak(&v28, &location);
  v26[4] = (uint64_t)self;
  v11 = v10;
  v27 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v26);
  -[AKAppleIDAuthenticationCommandLineContext _accountCreationRequestBodyFromResponseDictionary:shouldIncludePhoneNumber:shouldIncludeForSecurityCode:](self, "_accountCreationRequestBodyFromResponseDictionary:shouldIncludePhoneNumber:shouldIncludeForSecurityCode:", v8, 1, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  -[AKAppleIDAuthenticationCommandLineContext _promptUserForTermsWithResponseDictionary:](self, "_promptUserForTermsWithResponseDictionary:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addEntriesFromDictionary:", v15);

  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationCommandLineContext _collectAndHandleTermsAndConditionsWithResponseDictionary:configuration:completion:].cold.1();

  AKPrintLine(CFSTR("✓ Final verification with server…"), v17, v18, v19, v20, v21, v22, v23, v26[0]);
  -[AKAppleIDAuthenticationCommandLineContext utility](self, "utility");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationCommandLineContext rootPath](self, "rootPath");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "createAndExecuteRequestForPath:requestBody:httpMethod:configuration:completion:", v25, v14, CFSTR("POST"), v9, v12);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __128__AKAppleIDAuthenticationCommandLineContext__collectAndHandleTermsAndConditionsWithResponseDictionary_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v10 = WeakRetained;
  if (!v8 && WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_password");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("AKPassword"));

    objc_msgSend(*(id *)(a1 + 32), "username");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("AKUsername"));

    v14 = *(_QWORD *)(a1 + 40);
    v15 = (void *)objc_msgSend(v11, "copy");
    (*(void (**)(uint64_t, id, void *, _QWORD))(v14 + 16))(v14, v17, v15, 0);

LABEL_7:
    goto LABEL_8;
  }
  v16 = *(_QWORD *)(a1 + 40);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7014);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v16 + 16))(v16, 0, 0, v11);
    goto LABEL_7;
  }
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v16 + 16))(v16, 0, 0, v8);
LABEL_8:

}

- (void)_handleServerUISMSVerificationWithResponseDictionary:(id)a3 statusCode:(int64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  AKTrustedPhoneNumber *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  int64_t v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint8_t buf[16];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  id v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v49 = a4;
  v65 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke;
  v61[3] = &unk_1E2E61B80;
  v52 = v11;
  v63 = v52;
  v61[4] = self;
  v51 = v10;
  v62 = v51;
  v12 = MEMORY[0x194022E4C](v61);
  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationCommandLineContext _handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:].cold.3();

  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v50 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("trustedPhoneNumbers"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(v15);
        v20 = -[AKTrustedPhoneNumber initWithJSONDictionary:]([AKTrustedPhoneNumber alloc], "initWithJSONDictionary:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i));
        -[AKTrustedPhoneNumber identifier](v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v17);
  }

  if ((unint64_t)objc_msgSend(v14, "count") < 2)
  {
    _AKLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v12;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v35, OS_LOG_TYPE_DEFAULT, "Server indicates we only have one trusted number, lets use that.", buf, 2u);
    }

    objc_msgSend(v14, "allKeys");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v37);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    v31 = v50;
    v32 = v52;
    if ((unint64_t)(v49 - 200) > 0x63)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v12 + 16))(v12, v29, 0);
      v30 = v51;
      goto LABEL_23;
    }
    v30 = v51;
  }
  else
  {
    AKPrintLine(CFSTR("Multiple trusted numbers found!\n"), v22, v23, v24, v25, v26, v27, v28, v49);
    -[AKAppleIDAuthenticationCommandLineContext _promptUserForSelectionWithTrustedNumbers:](self, "_promptUserForSelectionWithTrustedNumbers:", v14);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v31 = v50;
    v30 = v51;
    v32 = v52;
    v33 = (void *)v12;
    if (!v29)
    {
      _AKLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[AKAppleIDAuthenticationCommandLineContext _handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:].cold.1();

      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7012);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, id))v52 + 2))(v52, 0, 0, v29);
      goto LABEL_23;
    }
  }
  v38 = v31;
  -[AKAppleIDAuthenticationCommandLineContext rootPath](self, "rootPath", v49);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringByAppendingPathComponent:", CFSTR("/verify/phone"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAppleIDAuthenticationCommandLineContext utility](self, "utility");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "mutableJSONRequestForPath:", v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationCommandLineContext _jsonPostbackDictionaryForCode:numberId:](self, "_jsonPostbackDictionaryForCode:numberId:", 0, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "ak_setJSONBodyWithParameters:", v44);
  objc_msgSend(v42, "setHTTPMethod:", CFSTR("PUT"));
  objc_msgSend(v30, "resourceLoadDelegate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "signRequest:", v42);

  _AKLogSystem();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationCommandLineContext _handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:].cold.2();

  +[AKURLSession sharedURLSession](AKURLSession, "sharedURLSession");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_92;
  v53[3] = &unk_1E2E60FD0;
  v54 = v29;
  v55 = v33;
  v29 = v29;
  v48 = (id)objc_msgSend(v47, "beginDataTaskWithRequest:completionHandler:", v42, v53);

  v31 = v38;
LABEL_23:

}

void __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Prompting for second factor code", v13, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_promptForVerificationCodeWithSecureEntry:forTrustedNumber:", 0, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_jsonPostbackDictionaryForCode:numberId:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_collectAndPostSecondFactorCodeWithRequestBody:configuration:completion:", v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_92(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_92_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_collectAndPostSecondFactorCodeWithRequestBody:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = (uint64_t)__117__AKAppleIDAuthenticationCommandLineContext__collectAndPostSecondFactorCodeWithRequestBody_configuration_completion___block_invoke;
  v25[3] = (uint64_t)&unk_1E2E61BA8;
  objc_copyWeak(&v29, &location);
  v25[4] = (uint64_t)self;
  v11 = v8;
  v26 = v11;
  v12 = v9;
  v27 = v12;
  v13 = v10;
  v28 = v13;
  v14 = (void *)MEMORY[0x194022E4C](v25);
  -[AKAppleIDAuthenticationCommandLineContext rootPath](self, "rootPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("/verify/phone/securitycode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  AKPrintLine(CFSTR("Verifying code..."), v17, v18, v19, v20, v21, v22, v23, v25[0]);
  -[AKAppleIDAuthenticationCommandLineContext utility](self, "utility");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "createAndExecuteRequestForPath:requestBody:httpMethod:configuration:completion:", v16, v11, CFSTR("POST"), v12, v14);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __117__AKAppleIDAuthenticationCommandLineContext__collectAndPostSecondFactorCodeWithRequestBody_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && objc_msgSend(*(id *)(a1 + 32), "needsNewAppleID"))
  {
    if (objc_msgSend(v8, "ak_isServiceError"))
    {
      objc_msgSend(v8, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D68]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      AKPrintError(CFSTR("ᐞᐞᐞ %@\n%@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)v11);

      objc_msgSend(WeakRetained, "setSmsSecurityCode:", 0);
      objc_msgSend(WeakRetained, "_handleServerUIPhoneVerificationWithResponseDictionary:configuration:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      objc_msgSend(WeakRetained, "_collectAndHandleTermsAndConditionsWithResponseDictionary:configuration:completion:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
  }
  else if (v23)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
  }
  else
  {
    v20 = *(_QWORD *)(a1 + 56);
    if (v8)
    {
      (*(void (**)(uint64_t))(v20 + 16))(v20);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7014);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v20 + 16))(v20, 0, 0, v21);

    }
  }

}

- (id)_promptUserForSelectionWithTrustedNumbers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  uint64_t v19;

  v3 = a3;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_49);
  AKPrintLine(CFSTR("Please select a trusted number: "), v4, v5, v6, v7, v8, v9, v10, v19);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  AKReadLine(10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v13);

  if (v15)
  {
    objc_msgSend(v3, "objectForKey:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AKLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationCommandLineContext _promptUserForSelectionWithTrustedNumbers:].cold.1();

    v16 = 0;
  }

  return v16;
}

void __87__AKAppleIDAuthenticationCommandLineContext__promptUserForSelectionWithTrustedNumbers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithDialCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AKPrintLine(CFSTR("%@. %@ via %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v13);
}

- (id)_parseTrustedPhoneNumberFromResponseDictionary:(id)a3
{
  void *v4;
  void *v5;
  AKTrustedPhoneNumber *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("phoneNumberVerification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[AKTrustedPhoneNumber initWithJSONDictionary:]([AKTrustedPhoneNumber alloc], "initWithJSONDictionary:", v5);
    -[AKTrustedPhoneNumber number](v6, "number");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AKTrustedPhoneNumber number](v6, "number");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAppleIDAuthenticationCommandLineContext setPhoneNumber:](self, "setPhoneNumber:", v8);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_accountCreationRequestBodyFromResponseDictionary:(id)a3 shouldIncludePhoneNumber:(BOOL)a4 shouldIncludeForSecurityCode:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
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
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[4];

  v5 = a5;
  v6 = a4;
  v40[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[AKAppleIDAuthenticationCommandLineContext _accountDictionary](self, "_accountDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationCommandLineContext _createContextDictionaryFromResponse:](self, "_createContextDictionaryFromResponse:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = CFSTR("account");
  v39[1] = CFSTR("createContext");
  v40[0] = v9;
  v40[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (v6)
  {
    v28 = v12;
    v37[0] = CFSTR("phoneNumber");
    v35[0] = CFSTR("number");
    -[AKAppleIDAuthenticationCommandLineContext _promptForPhoneNumber](self, "_promptForPhoneNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v13;
    v35[1] = CFSTR("countryCode");
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v27 = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "countryCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = CFSTR("mode");
    v38[0] = v16;
    v38[1] = CFSTR("sms");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    if (v27)
    {
      -[AKAppleIDAuthenticationCommandLineContext _parseTrustedPhoneNumberFromResponseDictionary:](self, "_parseTrustedPhoneNumberFromResponseDictionary:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAppleIDAuthenticationCommandLineContext _promptForVerificationCodeWithSecureEntry:forTrustedNumber:](self, "_promptForVerificationCodeWithSecureEntry:forTrustedNumber:", 0, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v33 = CFSTR("securityCode");
      v22 = &stru_1E2E647A8;
      if (v20)
        v22 = (const __CFString *)v20;
      v31 = CFSTR("code");
      v32 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addEntriesFromDictionary:", v24);

    }
    v29 = CFSTR("phoneNumberVerification");
    v30 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v28;
    objc_msgSend(v28, "addEntriesFromDictionary:", v25);

  }
  return v12;
}

- (id)_createContextDictionaryFromResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("createContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("token");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = CFSTR("type");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accountDictionary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AKAppleIDAuthenticationCommandLineContext__accountDictionary__block_invoke;
  block[3] = &unk_1E2E5E1D0;
  block[4] = self;
  if (_accountDictionary_onceToken != -1)
    dispatch_once(&_accountDictionary_onceToken, block);
  return (id)_accountDictionary_accountDictionary;
}

void __63__AKAppleIDAuthenticationCommandLineContext__accountDictionary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_promptForUsername");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_promptForPassword");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_promptForFirstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_promptForLastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_promptForBirthday");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("name");
  v15[1] = CFSTR("password");
  v16[0] = v2;
  v16[1] = v3;
  v15[2] = CFSTR("person");
  v14[0] = v6;
  v13[0] = CFSTR("birthday");
  v13[1] = CFSTR("name");
  v11[0] = CFSTR("firstName");
  v11[1] = CFSTR("lastName");
  v12[0] = v4;
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_accountDictionary_accountDictionary;
  _accountDictionary_accountDictionary = v9;

}

- (void)_beginDataTaskWithRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[AKURLSession sharedURLSession](AKURLSession, "sharedURLSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke;
  v16[3] = &unk_1E2E61C18;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  v15 = (id)objc_msgSend(v11, "beginDataTaskWithRequest:completionHandler:", v12, v16);

}

void __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_cold_1();

  if (v7)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_106;
    v13[3] = &unk_1E2E61BF0;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    v15 = v8;
    v16 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 56);
    if (v9)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v11 + 16))(v11, 0, 0, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7014);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v11 + 16))(v11, 0, 0, v12);

    }
  }

}

void __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_106(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_class *RUIParserClass;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v2 = objc_msgSend(*(id *)(a1 + 32), "verificationType");
  v3 = *(void **)(a1 + 32);
  if (v2 == 1)
  {
    objc_msgSend(v3, "utility");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsonDictionaryForData:error:", *(_QWORD *)(a1 + 40), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v5 = *(void **)(a1 + 32);
      v6 = *(id *)(a1 + 48);
      objc_msgSend(v5, "_handleServerUIWithDictionary:statusCode:configuration:completion:", v18, objc_msgSend(v6, "statusCode"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
    }
    else
    {
      v10 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7014);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v10 + 16))(v10, 0, 0, v6);
    }
LABEL_17:

    return;
  }
  if (!objc_msgSend(v3, "verificationType"))
  {
    RUIParserClass = (objc_class *)RemoteUILibraryCore();
    if (RUIParserClass)
      RUIParserClass = (objc_class *)getRUIParserClass();
    v12 = [RUIParserClass alloc];
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 64), "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v12, "initWithXML:baseURL:delegate:", v13, v14, 0);

    objc_msgSend(v18, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uiObjectModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "_handleServerUISecondFactorWithObjectModel:configuration:completion:", v15, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 72);
      if (v6)
      {
        (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v16 + 16))(v16, 0, 0, v6);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7014);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v16 + 16))(v16, 0, 0, v17);

      }
    }

    goto LABEL_17;
  }
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_106_cold_1();

  v8 = *(_QWORD *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7014);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v8 + 16))(v8, 0, 0, v9);

}

- (id)_parseHeaderTitleForPasscodeView:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  NSSelectorFromString(CFSTR("HTMLContent"));
  objc_msgSend(v3, "HTMLHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v4, "valueForKey:", CFSTR("HTMLContent"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (v6)
    {
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x1E0CB3498]);
      v10 = UIKitLibraryCore();
      if (v10)
      {
        getNSDocumentTypeDocumentAttribute();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      v17 = v11;
      v12 = UIKitLibraryCore();
      if (v12)
      {
        getNSHTMLTextDocumentType();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      v18[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v9, "initWithData:options:documentAttributes:error:", v8, v14, 0, 0);

      if (v12)
      if (v10)

      if (v15)
      {
        objc_msgSend(v15, "string");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_xmlUIRequestForURL:(id)a3 withServerInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("serverInfo"));
  -[AKAppleIDAuthenticationCommandLineContext _xmlUIRequestForURL:withPostbackDictionary:](self, "_xmlUIRequestForURL:withPostbackDictionary:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_xmlUIRequestForURL:(id)a3 withPostbackDictionary:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0C92C28];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithURL:", v7);

  objc_msgSend(v8, "ak_setBodyWithParameters:", v6);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/x-buddyml"), CFSTR("Accept"));
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
  return v8;
}

- (id)_promptForVerificationCodeWithSecureEntry:(BOOL)a3 forTrustedNumber:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  void *v28;

  v6 = a4;
  -[AKAppleIDAuthenticationCommandLineContext smsSecurityCode](self, "smsSecurityCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v15 = v7;
  }
  else
  {
    if (v6)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "numberWithDialCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pushMode");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("A second factor code was send to %@ via %@"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AKPrintLine(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v17);

    }
    AKPrint(CFSTR("Enter second factor code: "), v8, v9, v10, v11, v12, v13, v14, v27);
    if (a3)
      AKReadLineSecure(10);
    else
      AKReadLine(10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[AKAppleIDAuthenticationCommandLineContext setSmsSecurityCode:](self, "setSmsSecurityCode:", v15);
  }

  return v15;
}

- (id)_promptForBirthday
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;

  -[AKAppleIDAuthenticationCommandLineContext birthday](self, "birthday");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKAppleIDAuthenticationCommandLineContext utility](self, "utility");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDAuthenticationCommandLineContext birthday](self, "birthday");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (!objc_msgSend(v7, "length"))
  {
    AKPrint(CFSTR("Enter your birthday(YYYY-MM-DD): "), v8, v9, v10, v11, v12, v13, v14, v33);
    AKReadLine(12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    _AKLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationCommandLineContext _promptForBirthday].cold.1();

    -[AKAppleIDAuthenticationCommandLineContext utility](self, "utility");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateFormatter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dateFromString:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[AKAppleIDAuthenticationCommandLineContext setBirthday:](self, "setBirthday:", v19);
    }
    else
    {
      -[AKAppleIDAuthenticationCommandLineContext utility](self, "utility");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateFormatter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringFromDate:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AKPrintError(CFSTR("Please enter a valid birthday(%@)!"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)v23);

      -[AKAppleIDAuthenticationCommandLineContext _promptForBirthday](self, "_promptForBirthday");
      v31 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v31;
    }

    v7 = v15;
  }
  return v7;
}

- (id)_promptForPassword
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  -[AKAppleIDAuthenticationContext _password](self, "_password");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    AKPrint(CFSTR("Enter password: "), v4, v5, v6, v7, v8, v9, v10, v13);
    AKReadLineSecure(1024);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[AKAppleIDAuthenticationContext _setPassword:](self, "_setPassword:", v11);
      v3 = (void *)v11;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)_promptForUsername
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  -[AKAppleIDAuthenticationContext username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    AKPrint(CFSTR("Enter username: "), v4, v5, v6, v7, v8, v9, v10, v13);
    AKReadLine(1024);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[AKAppleIDAuthenticationContext setUsername:](self, "setUsername:", v11);
      v3 = (void *)v11;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)_promptForPhoneNumber
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  -[AKAppleIDAuthenticationCommandLineContext phoneNumber](self, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    AKPrint(CFSTR("Phone Number for this account: "), v4, v5, v6, v7, v8, v9, v10, v13);
    AKReadLine(1024);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[AKAppleIDAuthenticationCommandLineContext setPhoneNumber:](self, "setPhoneNumber:", v11);
      v3 = (void *)v11;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)_promptForFirstName
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  -[AKAppleIDAuthenticationCommandLineContext firstName](self, "firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    AKPrint(CFSTR("Enter first name for the account: "), v4, v5, v6, v7, v8, v9, v10, v13);
    AKReadLine(1024);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[AKAppleIDAuthenticationCommandLineContext setFirstName:](self, "setFirstName:", v11);
      v3 = (void *)v11;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)_promptForLastName
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  -[AKAppleIDAuthenticationCommandLineContext lastName](self, "lastName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    AKPrint(CFSTR("Enter last name for the account: "), v4, v5, v6, v7, v8, v9, v10, v13);
    AKReadLine(1024);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[AKAppleIDAuthenticationCommandLineContext setLastName:](self, "setLastName:", v11);
      v3 = (void *)v11;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)_promptUserForTermsWithResponseDictionary:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v96;
  _QWORD v97[2];
  _QWORD v98[2];
  const __CFString *v99;
  _QWORD v100[2];

  v100[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("termsList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_12;
  if (!-[AKAppleIDAuthenticationCommandLineContext termsAccepted](self, "termsAccepted"))
  {
    AKPrintLine(CFSTR("Do you agree to terms and conditions?"), v6, v7, v8, v9, v10, v11, v12, v96);
    AKPrint(CFSTR("Y to agree / READ to print out the terms (please just say yess!): "), v13, v14, v15, v16, v17, v18, v19, v96);
    AKReadLine(10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("READ")))
    {
      AKPrintLine(CFSTR("OK here we go…"), v21, v22, v23, v24, v25, v26, v27, v96);
      AKPrintLine(&stru_1E2E647A8, v28, v29, v30, v31, v32, v33, v34, v96);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("termsPageDetails"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("title"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      AKPrintLine(v36, v37, v38, v39, v40, v41, v42, v43, v96);

      AKPrintLine(&stru_1E2E647A8, v44, v45, v46, v47, v48, v49, v50, v96);
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("prologue"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      AKPrintLine(v51, v52, v53, v54, v55, v56, v57, v58, v96);

      AKPrintLine(&stru_1E2E647A8, v59, v60, v61, v62, v63, v64, v65, v96);
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("agree"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      AKPrintLine(v66, v67, v68, v69, v70, v71, v72, v73, v96);

      AKPrint(CFSTR("Y to agree: "), v74, v75, v76, v77, v78, v79, v80, v96);
      AKReadLine(10);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v81, "lowercaseString");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "substringToIndex:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v20, "isEqualToString:", CFSTR("y")))
        -[AKAppleIDAuthenticationCommandLineContext setTermsAccepted:](self, "setTermsAccepted:", 1);

    }
  }
  if (-[AKAppleIDAuthenticationCommandLineContext termsAccepted](self, "termsAccepted"))
  {
    _AKLogSystem();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v96) = 0;
      _os_log_impl(&dword_19202F000, v83, OS_LOG_TYPE_DEFAULT, "User agreed to terms and conditions", (uint8_t *)&v96, 2u);
    }

    AKPrintLine(CFSTR("⚖ Terms and Conditions Accepted…"), v84, v85, v86, v87, v88, v89, v90, v96);
    v99 = CFSTR("acceptedTerms");
    v97[0] = CFSTR("versions");
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v91;
    v97[1] = CFSTR("deviceVersions");
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v92;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = v93;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, &v99, 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_12:
    v94 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v94;
}

- (id)_jsonPostbackDictionaryForCode:(id)a3 numberId:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = CFSTR("id");
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("phoneNumber"));
  if (v5)
  {
    v12 = CFSTR("code");
    v13 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("securityCode"));

  }
  objc_msgSend(v7, "setObject:forKey:", CFSTR("sms"), CFSTR("mode"));
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationCommandLineContext _jsonPostbackDictionaryForCode:numberId:].cold.1();

  return v7;
}

- (NSNumber)secondFactorCode
{
  return self->_secondFactorCode;
}

- (void)setSecondFactorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (int64_t)verificationType
{
  return self->_verificationType;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (NSDate)birthday
{
  return self->_birthday;
}

- (void)setBirthday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (BOOL)termsAccepted
{
  return self->_termsAccepted;
}

- (void)setTermsAccepted:(BOOL)a3
{
  self->_termsAccepted = a3;
}

- (NSString)smsSecurityCode
{
  return self->_smsSecurityCode;
}

- (void)setSmsSecurityCode:(id)a3
{
  objc_storeStrong((id *)&self->_smsSecurityCode, a3);
}

- (AKCommandLineUtilities)utility
{
  return self->_utility;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_utility, 0);
  objc_storeStrong((id *)&self->_smsSecurityCode, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_secondFactorCode, 0);
}

- (void)_presentServerUISecondFactorWithConfiguration:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_19202F000, a2, v4, "request: %@", v5);

}

- (void)_handleServerUIBirthdayVerificationWithResponseDictionary:configuration:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Providing birthday info.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_handleServerUIPasswordVerificationWithResponseDictionary:configuration:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Providing password info.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_handleServerUIPhoneVerificationWithResponseDictionary:configuration:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Providing Phone number info.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_collectAndHandleTermsAndConditionsWithResponseDictionary:configuration:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Finishing up Apple ID creation flow.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "No trusted number selected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Sending selected trusted number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Selecting trusted numbers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Error, not attempting to collect second factor code", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_92_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Selected trusted number response %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_promptUserForSelectionWithTrustedNumbers:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_19202F000, v1, OS_LOG_TYPE_ERROR, "Invalid trusted number selection %@ - %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Received response %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_106_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Attempt to show server UI with unsupported configuration (still in the works)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_promptForBirthday
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_19202F000, v0, v1, "(%@)", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_jsonPostbackDictionaryForCode:numberId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Constructed SMS postback dictionary - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

@implementation AKFidoAuthorizationController

- (void)performRegistrationRequestWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id registrationCompletion;
  id v10;

  v6 = a4;
  v7 = a3;
  -[AKFidoAuthorizationController setContext:](self, "setContext:", v7);
  -[AKFidoAuthorizationController _requestFromContext:](self, "_requestFromContext:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x194022E4C](v6);

  registrationCompletion = self->_registrationCompletion;
  self->_registrationCompletion = v8;

  -[AKFidoAuthorizationController _startAuthControllerWithRequest:context:](self, "_startAuthControllerWithRequest:context:", v10, v7);
}

- (void)performAuthenticationRequestWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id authCompletion;
  id v10;

  v6 = a4;
  v7 = a3;
  -[AKFidoAuthorizationController setContext:](self, "setContext:", v7);
  -[AKFidoAuthorizationController _authRequestFromContext:](self, "_authRequestFromContext:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x194022E4C](v6);

  authCompletion = self->_authCompletion;
  self->_authCompletion = v8;

  -[AKFidoAuthorizationController _startAuthControllerWithRequest:context:](self, "_startAuthControllerWithRequest:context:", v10, v7);
}

- (void)_startAuthControllerWithRequest:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  objc_class *ASAuthorizationControllerClass;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  ASAuthorizationControllerClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationControllerClass)
    ASAuthorizationControllerClass = (objc_class *)getASAuthorizationControllerClass();
  v9 = [ASAuthorizationControllerClass alloc];
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithAuthorizationRequests:", v10);
  -[AKFidoAuthorizationController set_authController:](self, "set_authController:", v11);

  -[AKFidoAuthorizationController _authController](self, "_authController");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "setDelegate:", self);

  -[AKFidoAuthorizationController _populateCustomStringsFromContext:](self, "_populateCustomStringsFromContext:", v6);
  -[AKFidoAuthorizationController uiProvider](self, "uiProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AKFidoAuthorizationController uiProvider](self, "uiProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFidoAuthorizationController _authController](self, "_authController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPresentationContextProvider:", v14);

  }
  -[AKFidoAuthorizationController _authController](self, "_authController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performRequests");

}

- (id)_requestFromContext:(id)a3
{
  id v3;
  objc_class *ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  objc_class *ASAuthorizationPublicKeyCredentialParametersClass;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass)
    ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass = (objc_class *)getASAuthorizationSecurityKeyPublicKeyCredentialProviderClass();
  v5 = [ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass alloc];
  objc_msgSend(v3, "relyingPartyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRelyingPartyIdentifier:", v6);

  objc_msgSend(v3, "challenge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credentialName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createCredentialRegistrationRequestWithChallenge:displayName:name:userID:", v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "credentials");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v3, "credentials");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      _AKLogFido();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[AKFidoAuthorizationController _requestFromContext:].cold.1(v3, v17);

      objc_msgSend(v3, "credentials");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "aaf_map:", &__block_literal_global_6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setExcludedCredentials:", v19);
    }
  }
  else
  {

  }
  ASAuthorizationPublicKeyCredentialParametersClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationPublicKeyCredentialParametersClass)
    ASAuthorizationPublicKeyCredentialParametersClass = (objc_class *)getASAuthorizationPublicKeyCredentialParametersClass();
  v21 = (void *)objc_msgSend([ASAuthorizationPublicKeyCredentialParametersClass alloc], "initWithAlgorithm:", -7);
  v26[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCredentialParameters:", v22);

  if (AuthenticationServicesLibraryCore())
  {
    getASAuthorizationPublicKeyCredentialResidentKeyPreferencePreferred();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setResidentKeyPreference:", v23);

  }
  else
  {
    objc_msgSend(v12, "setResidentKeyPreference:", 0);
  }
  if (AuthenticationServicesLibraryCore())
  {
    getASAuthorizationPublicKeyCredentialAttestationKindDirect();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttestationPreference:", v24);

  }
  else
  {
    objc_msgSend(v12, "setAttestationPreference:", 0);
  }

  return v12;
}

id __53__AKFidoAuthorizationController__requestFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass;
  id v9;
  void *v10;
  void *v11;

  v2 = a2;
  _AKLogFido();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_3();

  objc_msgSend(MEMORY[0x1E0C99D50], "ak_dataWithBase64UrlEncodedString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    _AKLogFido();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_2();

    objc_msgSend(v2, "dataUsingEncoding:", 4);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  _AKLogFido();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_1(v4, v7);

  ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass)
    ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass = (objc_class *)getASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass();
  v9 = [ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass alloc];
  _ASAuthorizationAllSupportedPublicKeyCredentialDescriptorTransports();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCredentialID:transports:", v4, v10);

  return v11;
}

- (id)_authRequestFromContext:(id)a3
{
  id v3;
  objc_class *ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a3;
  ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass)
    ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass = (objc_class *)getASAuthorizationSecurityKeyPublicKeyCredentialProviderClass();
  v5 = [ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass alloc];
  objc_msgSend(v3, "relyingPartyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRelyingPartyIdentifier:", v6);

  objc_msgSend(v3, "challenge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createCredentialAssertionRequestWithChallenge:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "credentials");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
    goto LABEL_6;
  objc_msgSend(v3, "credentials");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    objc_msgSend(v3, "credentials");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "aaf_map:", &__block_literal_global_15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAllowedCredentials:", v10);
LABEL_6:

  }
  return v9;
}

id __57__AKFidoAuthorizationController__authRequestFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass;
  id v9;
  void *v10;
  void *v11;

  v2 = a2;
  _AKLogFido();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_3();

  objc_msgSend(MEMORY[0x1E0C99D50], "ak_dataWithBase64UrlEncodedString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    _AKLogFido();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_2();

    objc_msgSend(v2, "dataUsingEncoding:", 4);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  _AKLogFido();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_1(v4, v7);

  ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass)
    ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass = (objc_class *)getASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass();
  v9 = [ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass alloc];
  _ASAuthorizationAllSupportedPublicKeyCredentialDescriptorTransports();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCredentialID:transports:", v4, v10);

  return v11;
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  AKFidoRegistrationResponse *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  char v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  AKFidoAuthenticationResponse *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  AKFidoAuthenticationResponse *v51;
  void *v52;
  void (**v53)(_QWORD, _QWORD, _QWORD);
  AKFidoContext *context;
  void *v55;
  AKFidoRegistrationResponse *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;

  v5 = a4;
  objc_msgSend(v5, "credential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (AuthenticationServicesLibraryCore())
    getASAuthorizationSecurityKeyPublicKeyCredentialRegistrationClass();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    _AKLogFido();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AKFidoAuthorizationController authorizationController:didCompleteWithAuthorization:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

    objc_msgSend(v5, "credential");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _AKLogFido();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[AKFidoAuthorizationController authorizationController:didCompleteWithAuthorization:].cold.1(v16);

    -[AKFidoAuthorizationController registrationCompletion](self, "registrationCompletion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_20;
    v61 = v5;
    v56 = [AKFidoRegistrationResponse alloc];
    -[AKFidoAuthorizationController context](self, "context");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "originalChallenge");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rawAttestationObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "credentialID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v16;
    objc_msgSend(v16, "rawClientDataJSON");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFidoAuthorizationController context](self, "context");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "relyingPartyIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFidoAuthorizationController context](self, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "credentialName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFidoAuthorizationController context](self, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "userIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[AKFidoRegistrationResponse initWithChallengeString:attestationsData:credentialID:clientData:relyingPartyIdentifier:credentialName:userIdentifier:](v56, "initWithChallengeString:attestationsData:credentialID:clientData:relyingPartyIdentifier:credentialName:userIdentifier:", v55, v19, v20, v21, v22, v24, v26);

    -[AKFidoAuthorizationController registrationCompletion](self, "registrationCompletion");
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, AKFidoRegistrationResponse *, _QWORD))v28)[2](v28, v27, 0);

    -[AKFidoAuthorizationController setRegistrationCompletion:](self, "setRegistrationCompletion:", 0);
LABEL_19:

    v16 = v60;
    v5 = v61;
LABEL_20:
    context = self->_context;
    self->_context = 0;

    goto LABEL_21;
  }
  objc_msgSend(v5, "credential");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (AuthenticationServicesLibraryCore())
    getASAuthorizationSecurityKeyPublicKeyCredentialAssertionClass();
  v30 = objc_opt_isKindOfClass();

  if ((v30 & 1) != 0)
  {
    _AKLogFido();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[AKFidoAuthorizationController authorizationController:didCompleteWithAuthorization:].cold.4(v31, v32, v33, v34, v35, v36, v37, v38);

    objc_msgSend(v5, "credential");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _AKLogFido();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      -[AKFidoAuthorizationController authorizationController:didCompleteWithAuthorization:].cold.3(v16);

    -[AKFidoAuthorizationController authCompletion](self, "authCompletion");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
      goto LABEL_20;
    v61 = v5;
    v41 = [AKFidoAuthenticationResponse alloc];
    objc_msgSend(v16, "rawAuthenticatorData");
    v42 = objc_claimAutoreleasedReturnValue();
    -[AKFidoAuthorizationController context](self, "context");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "originalChallenge");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFidoAuthorizationController context](self, "context");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "relyingPartyIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "signature");
    v46 = v16;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "rawClientDataJSON");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "credentialID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v46;
    objc_msgSend(v46, "userID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v41;
    v52 = (void *)v42;
    v27 = -[AKFidoAuthenticationResponse initWithAuthenticatorData:challengeString:relyingPartyIdentifier:signature:clientData:credentialID:userIdentifier:](v51, "initWithAuthenticatorData:challengeString:relyingPartyIdentifier:signature:clientData:credentialID:userIdentifier:", v42, v43, v45, v47, v48, v49, v50);

    -[AKFidoAuthorizationController authCompletion](self, "authCompletion");
    v53 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, AKFidoRegistrationResponse *, _QWORD))v53)[2](v53, v27, 0);

    -[AKFidoAuthorizationController setAuthCompletion:](self, "setAuthCompletion:", 0);
    goto LABEL_19;
  }
LABEL_21:

}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  AKFidoContext *context;

  v5 = a4;
  _AKLogFido();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[AKFidoAuthorizationController authorizationController:didCompleteWithError:].cold.1();

  -[AKFidoAuthorizationController registrationCompletion](self, "registrationCompletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AKFidoAuthorizationController registrationCompletion](self, "registrationCompletion");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v5);

    -[AKFidoAuthorizationController setRegistrationCompletion:](self, "setRegistrationCompletion:", 0);
  }
  -[AKFidoAuthorizationController authCompletion](self, "authCompletion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AKFidoAuthorizationController authCompletion](self, "authCompletion");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v5);

    -[AKFidoAuthorizationController setAuthCompletion:](self, "setAuthCompletion:", 0);
  }
  context = self->_context;
  self->_context = 0;

}

+ (BOOL)isFidoUserCancelError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = AuthenticationServicesLibraryCore();
  if (v5)
  {
    getASAuthorizationErrorDomain();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (!objc_msgSend(v4, "isEqualToString:", v6))
  {
    v7 = 0;
    if (!v5)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = objc_msgSend(v3, "code") == 1001;
  if (v5)
LABEL_8:

LABEL_9:
  _AKLogFido();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[AKFidoAuthorizationController isFidoUserCancelError:].cold.1(v7, v8, v9);

  return v7;
}

- (void)_populateCustomStringsFromContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogFido();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKFidoAuthorizationController _populateCustomStringsFromContext:].cold.1(v4, v5);

  objc_msgSend(v4, "promptHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v4, "promptHeader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFidoAuthorizationController _authController](self, "_authController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProxySheetHeaderOverride:", v8);

  }
  objc_msgSend(v4, "promptTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    objc_msgSend(v4, "promptTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFidoAuthorizationController _authController](self, "_authController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProxySheetTitleOverride:", v12);

  }
  objc_msgSend(v4, "promptBody");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    objc_msgSend(v4, "promptBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFidoAuthorizationController _authController](self, "_authController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setProxySheetSubtitleOverride:", v16);

  }
  v18 = objc_msgSend(v4, "useAlternativeKeysIcon");
  -[AKFidoAuthorizationController _authController](self, "_authController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUseAlternativeSecurityKeysIcon:", v18);

  objc_msgSend(v4, "relyingPartyIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFidoAuthorizationController _authController](self, "_authController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setProxiedAssociatedDomains:", v21);

  objc_msgSend(v4, "incorrectKeyPresentedMessage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFidoAuthorizationController _authController](self, "_authController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setProxySheetNoCredentialsErrorMessageOverride:", v23);

}

- (AKFidoUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
  objc_storeStrong((id *)&self->_uiProvider, a3);
}

- (id)registrationCompletion
{
  return self->_registrationCompletion;
}

- (void)setRegistrationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)authCompletion
{
  return self->_authCompletion;
}

- (void)setAuthCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ASAuthorizationController)_authController
{
  return self->__authController;
}

- (void)set_authController:(id)a3
{
  objc_storeStrong((id *)&self->__authController, a3);
}

- (AKFidoContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->__authController, 0);
  objc_storeStrong(&self->_authCompletion, 0);
  objc_storeStrong(&self->_registrationCompletion, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
}

- (void)_requestFromContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "credentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, a2, v4, "Adding %lu credentials to the excluded credentials list.", v5);

  OUTLINED_FUNCTION_2_0();
}

void __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, a2, v4, "Adding credential to the list: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Invalid credential was sent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, v0, v1, "Converting credential to base64: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)authorizationController:(void *)a1 didCompleteWithAuthorization:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "credentialID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rawAttestationObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rawClientDataJSON");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0(&dword_19202F000, v5, v6, "Fido registration CredentialID: %@\nAttestation Data: %@\nClientData: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_7_0();
}

- (void)authorizationController:(uint64_t)a3 didCompleteWithAuthorization:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_19202F000, a1, a3, "Fido registration was a success", a5, a6, a7, a8, 0);
}

- (void)authorizationController:(void *)a1 didCompleteWithAuthorization:.cold.3(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "signature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rawAuthenticatorData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0(&dword_19202F000, v5, v6, "Fido authentication Signature: %@\nAuthenticator Data: %@\nUserID: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_7_0();
}

- (void)authorizationController:(uint64_t)a3 didCompleteWithAuthorization:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_19202F000, a1, a3, "Fido authentication was a success", a5, a6, a7, a8, 0);
}

- (void)authorizationController:didCompleteWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Unable to complete the Fido interaction: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)isFidoUserCancelError:(uint64_t)a3 .cold.1(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR(" not");
  if ((a1 & 1) != 0)
    v3 = &stru_1E2E647A8;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_19202F000, a2, a3, "Provided error is%{public}@ an AS user cancel error.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)_populateCustomStringsFromContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, a2, v4, "Populating strings from context: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

@end

@implementation ASAuthorizationController

+ (ASAuthorizationController)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ASAuthorizationController)init
{
  -[ASAuthorizationController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ASAuthorizationController)initWithAuthorizationRequests:(NSArray *)authorizationRequests
{
  NSArray *v6;
  ASAuthorizationController *v7;
  ASAuthorizationController *v8;
  void *v10;
  objc_super v11;

  v6 = authorizationRequests;
  if (!-[NSArray count](v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAuthorizationController.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authorizationRequests.count"));

  }
  v11.receiver = self;
  v11.super_class = (Class)ASAuthorizationController;
  v7 = -[ASAuthorizationController init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_authorizationRequests, authorizationRequests);

  return v8;
}

- (void)performRequests
{
  -[ASAuthorizationController performRequestsWithOptions:](self, "performRequestsWithOptions:", 0);
}

- (void)_performRequestsWithStyle:(int64_t)a3 options:(unint64_t)a4
{
  uint64_t v7;
  NSArray *authorizationRequests;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  void *v23;
  void *v24;
  NSURL *v25;
  NSURL *appSSORequestURL;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  SOAuthorization *v47;
  SOAuthorization *appSSOAuthorization;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD block[5];
  id v65;
  int64_t v66;
  unint64_t v67;
  _QWORD v68[5];
  _BYTE v69[128];
  uint64_t v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x24BDAC8D0];
  v7 = MEMORY[0x24BDAC760];
  authorizationRequests = self->_authorizationRequests;
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke;
  v68[3] = &__block_descriptor_40_e32_B16__0__ASAuthorizationRequest_8l;
  v68[4] = a3;
  -[NSArray safari_filterObjectsUsingBlock:](authorizationRequests, "safari_filterObjectsUsingBlock:", v68);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    if (a3 == 2)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v9, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("\"%@\" does not support conditional requests."), v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 1)
      {
        if (a3)
          v10 = 0;
        else
          v10 = CFSTR("Unexpected failure.");
        goto LABEL_14;
      }
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v9, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("\"%@\" does not support AutoFill assistance."), v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (__CFString *)v16;

LABEL_14:
    v19 = (void *)MEMORY[0x24BDD1540];
    v70 = *MEMORY[0x24BDD0FD8];
    v71[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASAuthorizationController _failWithError:](self, "_failWithError:", v21);
    goto LABEL_35;
  }
  if (-[ASAuthorizationController _shouldPerformRequestsWithAuthKit:](self, "_shouldPerformRequestsWithAuthKit:", self->_authorizationRequests))
  {
    -[ASAuthorizationController _authKitRequests](self, "_authKitRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationController _performAuthKitRequests:options:](self, "_performAuthKitRequests:options:", v11, a4);

  }
  else
  {
    -[ASAuthorizationController _authorizationRequestsHandledByAuthenticationServicesDaemon:](self, "_authorizationRequestsHandledByAuthenticationServicesDaemon:", self->_authorizationRequests);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "count"))
    {
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke_2;
      block[3] = &unk_24C950988;
      block[4] = self;
      v65 = v52;
      v66 = a3;
      v67 = a4;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      v58 = 0;
      v59 = &v58;
      v60 = 0x3032000000;
      v61 = __Block_byref_object_copy__1;
      v62 = __Block_byref_object_dispose__1;
      v63 = 0;
      v22 = self->_authorizationRequests;
      v57[0] = v7;
      v57[1] = 3221225472;
      v57[2] = __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke_30;
      v57[3] = &unk_24C9509B0;
      v57[4] = &v58;
      -[NSArray enumerateObjectsUsingBlock:](v22, "enumerateObjectsUsingBlock:", v57);
      v23 = (void *)v59[5];
      if (v23)
      {
        objc_msgSend(v23, "provider");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "url");
        v25 = (NSURL *)objc_claimAutoreleasedReturnValue();
        appSSORequestURL = self->_appSSORequestURL;
        self->_appSSORequestURL = v25;

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend((id)v59[5], "authorizationOptions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v54 != v30)
                objc_enumerationMutation(v28);
              v32 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              objc_msgSend(v32, "value");
              v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (v33)
                v35 = v33;
              else
                v35 = &stru_24C955390;
              objc_msgSend(v27, "setObject:forKeyedSubscript:", v35, v34);

            }
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
          }
          while (v29);
        }

        objc_msgSend((id)v59[5], "state");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend((id)v59[5], "state");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v37, CFSTR("state"));

        }
        objc_msgSend((id)v59[5], "nonce");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend((id)v59[5], "nonce");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v39, CFSTR("nonce"));

        }
        objc_msgSend((id)v59[5], "requestedScopes");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend((id)v59[5], "requestedScopes");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "componentsJoinedByString:", CFSTR(" "));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v42, CFSTR("scope"));

        }
        v43 = objc_alloc_init(MEMORY[0x24BE04358]);
        objc_msgSend((id)v59[5], "requestedOperation");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setOperation:", v44);

        objc_msgSend(v43, "setUrl:", self->_appSSORequestURL);
        v45 = (void *)objc_msgSend(v27, "copy");
        objc_msgSend(v43, "setHttpHeaders:", v45);

        v46 = objc_alloc_init(MEMORY[0x24BDBCE50]);
        objc_msgSend(v43, "setHttpBody:", v46);

        objc_msgSend(v43, "setUseInternalExtensions:", 0);
        v47 = (SOAuthorization *)objc_alloc_init(MEMORY[0x24BE04350]);
        appSSOAuthorization = self->_appSSOAuthorization;
        self->_appSSOAuthorization = v47;

        v49 = (void *)objc_msgSend(v27, "copy");
        -[SOAuthorization setAuthorizationOptions:](self->_appSSOAuthorization, "setAuthorizationOptions:", v49);

        -[SOAuthorization setEnableUserInteraction:](self->_appSSOAuthorization, "setEnableUserInteraction:", objc_msgSend((id)v59[5], "isUserInterfaceEnabled"));
        -[SOAuthorization setDelegate:](self->_appSSOAuthorization, "setDelegate:", self);
        -[ASAuthorizationController presentationContextProvider](self, "presentationContextProvider");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "presentationAnchorForAuthorizationController:", self);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[SOAuthorization setEnableEmbeddedAuthorizationViewController:](self->_appSSOAuthorization, "setEnableEmbeddedAuthorizationViewController:", v51 != 0);

        -[SOAuthorization beginAuthorizationWithParameters:](self->_appSSOAuthorization, "beginAuthorizationWithParameters:", v43);
        _Block_object_dispose(&v58, 8);

      }
      else
      {
        _Block_object_dispose(&v58, 8);

      }
    }

  }
LABEL_35:

}

uint64_t __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsStyle:", *(_QWORD *)(a1 + 32)) ^ 1;
}

uint64_t __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performAuthorizationRequests:requestStyle:requestOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __63__ASAuthorizationController__performRequestsWithStyle_options___block_invoke_30(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_performAuthKitRequests:(id)a3 options:(unint64_t)a4
{
  char v4;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x24BE0AD60];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setCredentialRequests:", v7);

  objc_msgSend(v8, "setRequestOptions:", v4 & 1);
  v9 = objc_alloc_init(MEMORY[0x24BE0ACF0]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__ASAuthorizationController__performAuthKitRequests_options___block_invoke;
  v10[3] = &unk_24C9509D8;
  v10[4] = self;
  objc_msgSend(v9, "performAuthorizationWithContext:completion:", v8, v10);

}

void __61__ASAuthorizationController__performAuthKitRequests_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "_authorizationFromAuthKitResult:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_completeWithAuthorization:");
  }
  else
  {
    objc_msgSend(v3, "_publicErrorFromAuthKitError:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_failWithError:");
  }

}

- (id)_publicErrorFromAuthKitError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE0AB28]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    if (v6 == -7089 || v6 == -7003)
      v8 = 1001;
    else
      v8 = 1000;
  }
  else
  {
    v8 = 1000;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)performAutoFillAssistedRequests
{
  OS_os_activity *v3;
  OS_os_activity *authorizationActivity;
  NSObject *v5;
  _QWORD block[5];

  v3 = (OS_os_activity *)_os_activity_create(&dword_20E4D9000, "AutoFill authorization request", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DETACHED);
  authorizationActivity = self->_authorizationActivity;
  self->_authorizationActivity = v3;

  v5 = self->_authorizationActivity;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__ASAuthorizationController_performAutoFillAssistedRequests__block_invoke;
  block[3] = &unk_24C94F558;
  block[4] = self;
  os_activity_apply(v5, block);
}

uint64_t __60__ASAuthorizationController_performAutoFillAssistedRequests__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performRequestsWithStyle:options:", 1, 0);
}

- (void)performSilentRequests
{
  -[ASAuthorizationController _performRequestsWithStyle:options:](self, "_performRequestsWithStyle:options:", 2, 0);
}

- (void)getPasskeysDataForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ASAuthorizationController _authenticationServicesAgentProxy](self, "_authenticationServicesAgentProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getPasskeysDataForRelyingParty:withCompletionHandler:", v7, v6);

}

- (void)deletePasskeyForRelyingParty:(id)a3 withCredentialID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ASAuthorizationController _authenticationServicesAgentProxy](self, "_authenticationServicesAgentProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deletePasskeyForRelyingParty:withCredentialID:completionHandler:", v10, v9, v8);

}

- (void)deleteAllPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ASAuthorizationController _authenticationServicesAgentProxy](self, "_authenticationServicesAgentProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteAllPasskeysForRelyingParty:completionHandler:", v7, v6);

}

- (void)preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASAuthorizationController _authenticationServicesAgentProxy](self, "_authenticationServicesAgentProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:", v4);

}

- (void)renamePasskeyWithCredentialID:(id)a3 newName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ASAuthorizationController _authenticationServicesAgentProxy](self, "_authenticationServicesAgentProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "renamePasskeyWithCredentialID:newName:completionHandler:", v10, v9, v8);

}

- (void)cancel
{
  id v2;

  -[ASAuthorizationController _authenticationServicesAgentProxy](self, "_authenticationServicesAgentProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelCurrentRequest");

}

- (id)_authKitRequests
{
  id v3;
  NSArray *authorizationRequests;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  ASAuthorizationController *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  authorizationRequests = self->_authorizationRequests;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __45__ASAuthorizationController__authKitRequests__block_invoke;
  v11 = &unk_24C950A00;
  v12 = self;
  v13 = v3;
  v5 = v3;
  -[NSArray enumerateObjectsUsingBlock:](authorizationRequests, "enumerateObjectsUsingBlock:", &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return v6;
}

void __45__ASAuthorizationController__authKitRequests__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_authKitRequestFromAppleIDRequest:", v5);
    v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE0ADB8]);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_authKitRequestFromAppleIDRequest:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v3 = (objc_class *)MEMORY[0x24BE0AD18];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserIdentifier:", v6);

  objc_msgSend(v4, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", v7);

  objc_msgSend(v4, "nonce");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNonce:", v8);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestedScopes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__ASAuthorizationController__authKitRequestFromAppleIDRequest___block_invoke;
  v13[3] = &unk_24C950A28;
  v14 = v9;
  v11 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

  objc_msgSend(v5, "setRequestedScopes:", v11);
  return v5;
}

void __63__ASAuthorizationController__authKitRequestFromAppleIDRequest___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("full_name")) & 1) != 0)
  {
    v3 = (_QWORD *)MEMORY[0x24BE0AC00];
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *v3);
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("email")))
  {
    v3 = (_QWORD *)MEMORY[0x24BE0ABF8];
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_authorizationFromAuthKitResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  ASPasswordCredential *v7;
  __objc2_class **v8;
  void *v9;
  char v10;
  ASPasswordCredential *v11;
  void *v12;
  void *v13;
  id v14;
  ASAuthorization *v15;

  v3 = a3;
  objc_msgSend(v3, "credential");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "authenticationServicesCredential");
    v7 = (ASPasswordCredential *)objc_claimAutoreleasedReturnValue();
    v8 = off_24C94E340;
  }
  else
  {
    objc_msgSend(v3, "credential");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = objc_opt_isKindOfClass();

    if ((v10 & 1) == 0)
    {
      v7 = 0;
      v14 = 0;
      goto LABEL_7;
    }
    v11 = [ASPasswordCredential alloc];
    objc_msgSend(v4, "userIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "password");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ASPasswordCredential initWithUser:password:](v11, "initWithUser:password:", v12, v13);

    v8 = off_24C94E358;
  }
  v14 = objc_alloc_init(*v8);
LABEL_7:
  v15 = -[ASAuthorization initWithProvider:credential:]([ASAuthorization alloc], "initWithProvider:credential:", v14, v7);

  return v15;
}

- (void)_finishAppSSO
{
  SOAuthorization *appSSOAuthorization;
  NSURL *appSSORequestURL;
  UIViewController *appSSOViewController;
  UIViewController *v6;
  UIWindow *appSSOPresentationAnchor;

  appSSOAuthorization = self->_appSSOAuthorization;
  self->_appSSOAuthorization = 0;

  appSSORequestURL = self->_appSSORequestURL;
  self->_appSSORequestURL = 0;

  appSSOViewController = self->_appSSOViewController;
  if (appSSOViewController)
  {
    -[UIViewController dismissViewControllerAnimated:completion:](appSSOViewController, "dismissViewControllerAnimated:completion:", 1, 0);
    v6 = self->_appSSOViewController;
    self->_appSSOViewController = 0;

    appSSOPresentationAnchor = self->_appSSOPresentationAnchor;
    self->_appSSOPresentationAnchor = 0;

  }
}

- (id)_authenticatedResponseFromHTTPResponse:(id)a3 httpBody:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allHeaderFields");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
      {
        objc_msgSend(v5, "allHeaderFields");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addEntriesFromDictionary:", v11);

      }
      objc_msgSend(v8, "addEntriesFromDictionary:", v6);
      v12 = objc_alloc(MEMORY[0x24BDD15B8]);
      objc_msgSend(v5, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v12, "initWithURL:statusCode:HTTPVersion:headerFields:", v13, objc_msgSend(v5, "statusCode"), CFSTR("HTTP/1.1"), v8);

    }
  }

  return v7;
}

- (void)performRequestsWithOptions:(ASAuthorizationControllerRequestOptions)options
{
  OS_os_activity *v5;
  OS_os_activity *authorizationActivity;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *authorizationRequests;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[7];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = (OS_os_activity *)_os_activity_create(&dword_20E4D9000, "Modal authorization request with options", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DETACHED);
  authorizationActivity = self->_authorizationActivity;
  self->_authorizationActivity = v5;

  -[NSArray safari_firstObjectPassingTest:](self->_authorizationRequests, "safari_firstObjectPassingTest:", &__block_literal_global_14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "requestStyle") == 1)
  {
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    authorizationRequests = self->_authorizationRequests;
    self->_authorizationRequests = v9;

    v11 = 2;
  }
  else
  {
    v11 = 0;
  }
  v12 = self->_authorizationActivity;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ASAuthorizationController_performRequestsWithOptions___block_invoke_2;
  block[3] = &unk_24C950A90;
  block[4] = self;
  block[5] = v11;
  block[6] = options;
  os_activity_apply(v12, block);

}

uint64_t __56__ASAuthorizationController_performRequestsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __56__ASAuthorizationController_performRequestsWithOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performRequestsWithStyle:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)authorizationDidNotHandle:(id)a3
{
  id WeakRetained;
  char isKindOfClass;
  void *v6;
  void *v7;
  ASAuthorization *v8;

  if ((dyld_program_sdk_at_least() & 1) != 0
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        WeakRetained,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1003, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationController _failWithError:](self, "_failWithError:", v6);
  }
  else
  {
    +[ASAuthorizationSingleSignOnCredential emptyCredential](ASAuthorizationSingleSignOnCredential, "emptyCredential");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:](ASAuthorizationSingleSignOnProvider, "authorizationProviderWithIdentityProviderURL:", self->_appSSORequestURL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ASAuthorization initWithProvider:credential:]([ASAuthorization alloc], "initWithProvider:credential:", v7, v6);
    -[ASAuthorizationController _completeWithAuthorization:](self, "_completeWithAuthorization:", v8);

  }
  -[ASAuthorizationController _finishAppSSO](self, "_finishAppSSO");
}

- (void)authorizationDidCancel:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1001, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationController _failWithError:](self, "_failWithError:", v4);
  -[ASAuthorizationController _finishAppSSO](self, "_finishAppSSO");

}

- (void)authorizationDidComplete:(id)a3
{
  void *v4;
  ASAuthorization *v5;
  id v6;

  +[ASAuthorizationSingleSignOnCredential emptyCredential](ASAuthorizationSingleSignOnCredential, "emptyCredential", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:](ASAuthorizationSingleSignOnProvider, "authorizationProviderWithIdentityProviderURL:", self->_appSSORequestURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASAuthorization initWithProvider:credential:]([ASAuthorization alloc], "initWithProvider:credential:", v4, v6);
  -[ASAuthorizationController _completeWithAuthorization:](self, "_completeWithAuthorization:", v5);
  -[ASAuthorizationController _finishAppSSO](self, "_finishAppSSO");

}

- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1002, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationController _failWithError:](self, "_failWithError:", v5);
  -[ASAuthorizationController _finishAppSSO](self, "_finishAppSSO");

}

- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5
{
  ASAuthorizationSingleSignOnCredential *v6;
  void *v7;
  ASAuthorization *v8;
  id v9;

  -[ASAuthorizationController _authenticatedResponseFromHTTPResponse:httpBody:](self, "_authenticatedResponseFromHTTPResponse:httpBody:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v6 = -[ASAuthorizationSingleSignOnCredential initWithAuthenticatedResponse:]([ASAuthorizationSingleSignOnCredential alloc], "initWithAuthenticatedResponse:", v9);
    +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:](ASAuthorizationSingleSignOnProvider, "authorizationProviderWithIdentityProviderURL:", self->_appSSORequestURL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ASAuthorization initWithProvider:credential:]([ASAuthorization alloc], "initWithProvider:credential:", v7, v6);
    -[ASAuthorizationController _completeWithAuthorization:](self, "_completeWithAuthorization:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1002, 0);
    v6 = (ASAuthorizationSingleSignOnCredential *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationController _failWithError:](self, "_failWithError:", v6);
  }

  -[ASAuthorizationController _finishAppSSO](self, "_finishAppSSO");
}

- (void)authorization:(id)a3 didCompleteWithAuthorizationResult:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ASAuthorizationSingleSignOnCredential *v9;
  void *v10;
  ASAuthorizationSingleSignOnCredential *v11;
  void *v12;
  ASAuthorization *v13;
  id v14;

  v14 = a4;
  objc_msgSend(v14, "httpAuthorizationHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_2;
  objc_msgSend(v14, "httpResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  objc_msgSend(v14, "httpResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "httpBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationController _authenticatedResponseFromHTTPResponse:httpBody:](self, "_authenticatedResponseFromHTTPResponse:httpBody:", v7, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_2:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1002, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationController _failWithError:](self, "_failWithError:", v6);
    -[ASAuthorizationController _finishAppSSO](self, "_finishAppSSO");
  }
  else
  {
LABEL_5:
    v9 = [ASAuthorizationSingleSignOnCredential alloc];
    objc_msgSend(v14, "privateKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ASAuthorizationSingleSignOnCredential initWithAuthenticatedResponse:privateKeys:](v9, "initWithAuthenticatedResponse:privateKeys:", v6, v10);

    +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:](ASAuthorizationSingleSignOnProvider, "authorizationProviderWithIdentityProviderURL:", self->_appSSORequestURL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ASAuthorization initWithProvider:credential:]([ASAuthorization alloc], "initWithProvider:credential:", v12, v11);
    -[ASAuthorizationController _completeWithAuthorization:](self, "_completeWithAuthorization:", v13);
    -[ASAuthorizationController _finishAppSSO](self, "_finishAppSSO");

  }
}

- (void)authorization:(id)a3 didCompleteWithError:(id)a4
{
  void *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v10 = a4;
  objc_msgSend(v10, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"));

  if ((v6 & 1) != 0)
  {
    v7 = v10;
  }
  else
  {
    if (objc_msgSend(v10, "safari_matchesErrorDomain:andCode:", *MEMORY[0x24BE04380], -12))
      v8 = 1005;
    else
      v8 = 1000;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }
  v11 = v7;
  -[ASAuthorizationController _failWithError:](self, "_failWithError:", v7);
  -[ASAuthorizationController _finishAppSSO](self, "_finishAppSSO");

}

- (void)authorization:(id)a3 presentViewController:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  UIWindow *v15;
  UIWindow *appSSOPresentationAnchor;
  UIViewController **p_appSSOViewController;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  uint64_t v21;
  void *v22;
  void *v23;
  UIViewController *v24;
  id v25;
  _QWORD v26[4];
  void (**v27)(_QWORD, _QWORD, _QWORD);
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[4];
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke;
  v38[3] = &unk_24C950AB8;
  v12 = v10;
  v39 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x212BBEFEC](v38);
  -[ASAuthorizationController presentationContextProvider](self, "presentationContextProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentationAnchorForAuthorizationController:", self);
  v15 = (UIWindow *)objc_claimAutoreleasedReturnValue();
  appSSOPresentationAnchor = self->_appSSOPresentationAnchor;
  self->_appSSOPresentationAnchor = v15;

  if (self->_appSSOPresentationAnchor)
  {
    p_appSSOViewController = &self->_appSSOViewController;
    objc_storeStrong((id *)&self->_appSSOViewController, a4);
    objc_msgSend(MEMORY[0x24BEBDB08], "_viewControllerForFullScreenPresentationFromView:", self->_appSSOPresentationAnchor);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__1;
      v36 = __Block_byref_object_dispose__1;
      v37 = 0;
      v19 = (void *)MEMORY[0x24BDBCF40];
      v29[0] = v11;
      v29[1] = 3221225472;
      v29[2] = __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_2;
      v29[3] = &unk_24C950AE0;
      v31 = &v32;
      v20 = v13;
      v30 = v20;
      objc_msgSend(v19, "timerWithTimeInterval:repeats:block:", 0, v29, 3.0);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v33[5];
      v33[5] = v21;

      objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addTimer:forMode:", v33[5], *MEMORY[0x24BDBCB80]);

      v24 = *p_appSSOViewController;
      v26[0] = v11;
      v26[1] = 3221225472;
      v26[2] = __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_76;
      v26[3] = &unk_24C950B08;
      v28 = &v32;
      v27 = v20;
      objc_msgSend(v18, "presentViewController:animated:completion:", v24, 1, v26);

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      v25 = objc_alloc_init(MEMORY[0x24BEBDC18]);
      objc_msgSend(v25, "_presentViewController:sendingView:animated:", *p_appSSOViewController, 0, 1);
      v13[2](v13, 1, 0);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v18);
  }

}

uint64_t __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
}

void *__80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_76(uint64_t a1)
{
  void *result;
  uint64_t v3;
  void *v4;

  result = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    objc_msgSend(result, "invalidate");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    return (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

- (BOOL)_onlyHasAppleIDRequest:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)_authorizationRequestsHandledByAuthenticationServicesDaemon:(id)a3
{
  return (id)objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &__block_literal_global_78);
}

uint64_t __89__ASAuthorizationController__authorizationRequestsHandledByAuthenticationServicesDaemon___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)_performAuthorizationRequests:(id)a3 requestStyle:(int64_t)a4 requestOptions:(unint64_t)a5
{
  char v5;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v27[5];

  v5 = a5;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __87__ASAuthorizationController__performAuthorizationRequests_requestStyle_requestOptions___block_invoke;
  v27[3] = &unk_24C950B50;
  v27[4] = self;
  v8 = a3;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x212BBEFEC](v27);
  v26 = 0;
  -[ASAuthorizationController _requestContextWithRequests:error:](self, "_requestContextWithRequests:error:", v8, &v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v26;
  if (v10)
  {
    objc_msgSend(v10, "authenticatedContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      a4 = 2;
    objc_msgSend(v10, "setRequestStyle:", a4);
    objc_msgSend(v10, "setRequestOptions:", v5 & 1);
    -[ASAuthorizationController presentationContextProvider](self, "presentationContextProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentationAnchorForAuthorizationController:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "windowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_sceneIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWindowSceneIdentifier:", v16);

    if ((unint64_t)a4 >= 2)
    {
      if (a4 != 2)
      {
LABEL_12:

        goto LABEL_13;
      }
      -[ASAuthorizationController _authenticationServicesAgentProxy](self, "_authenticationServicesAgentProxy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "performSilentAuthorizationRequestsForContext:withCompletionHandler:", v10, v9);
    }
    else
    {
      -[ASAuthorizationController _authenticationServicesAgentProxy](self, "_authenticationServicesAgentProxy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "performAuthorizationRequestsForContext:withCompletionHandler:", v10, v9);
    }

    goto LABEL_12;
  }
  v18 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[ASAuthorizationController _performAuthorizationRequests:requestStyle:requestOptions:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
  ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v11);
LABEL_13:

}

void __87__ASAuthorizationController__performAuthorizationRequests_requestStyle_requestOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    +[ASAuthorization authorizationFromCredential:](ASAuthorization, "authorizationFromCredential:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_completeWithAuthorization:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_failWithError:");
  }
}

- (id)_authenticationServicesAgentProxy
{
  ASCAgentProxy *authenticationServicesAgentProxy;
  ASCAgentProxy *v4;
  ASCAgentProxy *v5;

  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  if (!authenticationServicesAgentProxy)
  {
    v4 = (ASCAgentProxy *)objc_alloc_init(MEMORY[0x24BE0B1F8]);
    v5 = self->_authenticationServicesAgentProxy;
    self->_authenticationServicesAgentProxy = v4;

    authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  }
  return authenticationServicesAgentProxy;
}

- (id)_requestContextWithRequests:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const __CFString **v39;
  uint64_t *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString **v49;
  uint64_t *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t *v57;
  void *v60;
  id v61;
  void *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  uint8_t v79[4];
  uint64_t v80;
  uint64_t v81;
  const __CFString *v82;
  uint64_t v83;
  const __CFString *v84;
  _BYTE v85[128];
  uint64_t v86;
  const __CFString *v87;
  uint64_t v88;
  const __CFString *v89;
  uint64_t v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x24BDAC8D0];
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
  v61 = v4;
  if (!v5)
  {
    v62 = 0;
    v63 = 0;
    v7 = 0;
    v64 = 0;
    v66 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_45;
  }
  v6 = v5;
  v62 = 0;
  v63 = 0;
  v7 = 0;
  v64 = 0;
  v66 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v68;
  v57 = &v80;
  v65 = *(_QWORD *)v68;
  do
  {
    v60 = (void *)v7;
    v12 = 0;
    do
    {
      if (*(_QWORD *)v68 != v11)
        objc_enumerationMutation(v4);
      v13 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = 0;
        v15 = 1;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = objc_alloc_init(MEMORY[0x24BE0AD18]);

        objc_msgSend(v13, "user");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setUserIdentifier:", v17);

        objc_msgSend(v13, "state");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setState:", v18);

        objc_msgSend(v13, "nonce");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setNonce:", v19);
        v14 = 0;
        v15 = 2;
        v9 = v16;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v13;
          objc_msgSend(v19, "coreCredentialCreationOptions");
          v20 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "relyingPartyIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "attestationPreference");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("none"));

          if ((v22 & 1) == 0)
          {
            objc_msgSend(v19, "attestationPreference");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("enterprise"));

            if ((v24 & 1) == 0)
            {
              v53 = (void *)MEMORY[0x24BDD1540];
              v83 = *MEMORY[0x24BDD0FC8];
              v84 = CFSTR("Passkeys do not support attestation.");
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, v54);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              v44 = 0;
              v7 = (unint64_t)v60;
              v4 = v61;
              v35 = v61;
              v66 = v20;
              goto LABEL_63;
            }
          }
          v15 = 4;
          v66 = v20;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = v13;
            objc_msgSend(v19, "relyingPartyIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "coreCredentialAssertionOptions");
            v25 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "authenticatedContext");
            v26 = objc_claimAutoreleasedReturnValue();

            v15 = 8;
            v62 = (void *)v26;
            v4 = v61;
            v64 = v25;
            goto LABEL_17;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v33 = WBS_LOG_CHANNEL_PREFIXAuthorization();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                -[ASAuthorizationController _requestContextWithRequests:error:].cold.1(v79, v33, (uint64_t)v13, &v80);
              goto LABEL_32;
            }
            v19 = v13;
            objc_msgSend(v19, "relyingPartyIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "coreCredentialAssertionOptions");
            v32 = objc_claimAutoreleasedReturnValue();

            v15 = 32;
            v60 = (void *)v32;
            goto LABEL_17;
          }
          v19 = v13;
          objc_msgSend(v19, "coreCredentialCreationOptions");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "supportedAlgorithmIdentifiers");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "count");

          if (!v31)
          {
            v55 = (void *)MEMORY[0x24BDD1540];
            v81 = *MEMORY[0x24BDD0FC8];
            v82 = CFSTR("No algorithms specified for ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest.");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, v56);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            v44 = 0;
            v14 = v19;
            v7 = (unint64_t)v60;
            v4 = v61;
            v35 = v61;
            v63 = (unint64_t)v29;
            goto LABEL_63;
          }
          objc_msgSend(v19, "relyingPartyIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 16;
          v63 = (unint64_t)v29;
        }
        v4 = v61;
      }
LABEL_17:

      v11 = v65;
LABEL_18:
      v27 = dyld_program_sdk_at_least();
      if ((v15 & v10) != 0 && v27)
      {
        v47 = (void *)MEMORY[0x24BDD1540];
        v90 = *MEMORY[0x24BDD0FC8];
        v91[0] = CFSTR("Found duplicate requests. Only one of each type of request is currently supported.");
        v48 = (void *)MEMORY[0x24BDBCE70];
        v49 = (const __CFString **)v91;
        v50 = &v90;
        goto LABEL_61;
      }
      if (((1 << v15) & 6) == 0)
      {
        if (((1 << v15) & 0x10010) != 0)
        {
          if ((v10 & 0xFFFFFFFFFFFFFFEBLL) != 0)
          {
            v47 = (void *)MEMORY[0x24BDD1540];
            v88 = *MEMORY[0x24BDD0FC8];
            v89 = CFSTR("Registration requests cannot be used with other types of requests.");
            v48 = (void *)MEMORY[0x24BDBCE70];
            v49 = &v89;
            v50 = &v88;
LABEL_61:
            objc_msgSend(v48, "dictionaryWithObjects:forKeys:count:", v49, v50, 1, &v80);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, v51);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_62:
            v44 = 0;
            v35 = v4;
            v7 = (unint64_t)v60;
            goto LABEL_63;
          }
        }
        else
        {
          if (((1 << v15) & 0x100000100) == 0)
            goto LABEL_62;
          if ((v10 & 0x14) != 0)
          {
            v47 = (void *)MEMORY[0x24BDD1540];
            v86 = *MEMORY[0x24BDD0FC8];
            v87 = CFSTR("Registration requests cannot be used with other types of requests.");
            v48 = (void *)MEMORY[0x24BDBCE70];
            v49 = &v87;
            v50 = &v86;
            goto LABEL_61;
          }
        }
      }
      v10 |= v15;
      if (v14 && v8)
      {
        if ((objc_msgSend(v14, "isEqualToString:", v8) & 1) == 0)
        {
          v45 = (void *)MEMORY[0x24BDD1540];
          v77 = *MEMORY[0x24BDD0FC8];
          v78 = CFSTR("All Public Key Credential requests must use the same relyingPartyIdentifier.");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, v46);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_62;
        }
      }
      else if (!v14)
      {
        goto LABEL_32;
      }
      v28 = v14;

      v8 = v28;
LABEL_32:
      ++v12;
    }
    while (v6 != v12);
    v34 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
    v6 = v34;
    v7 = (unint64_t)v60;
  }
  while (v34);
LABEL_45:

  objc_msgSend((id)v66, "relyingPartyIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v63, "relyingPartyIdentifier");
  v36 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v36;
  if (v35 && v36 && (objc_msgSend(v35, "isEqualToString:", v36) & 1) == 0)
  {
    v37 = (void *)MEMORY[0x24BDD1540];
    v75 = *MEMORY[0x24BDD0FC8];
    v76 = CFSTR("All Public Key Credential requests must use the same relyingPartyIdentifier.");
    v38 = (void *)MEMORY[0x24BDBCE70];
    v39 = &v76;
    v40 = &v75;
LABEL_58:
    objc_msgSend(v38, "dictionaryWithObjects:forKeys:count:", v39, v40, 1, v57);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, v41);
    v44 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v66 | v64 | v63 | v7 && !v8)
    {
      v37 = (void *)MEMORY[0x24BDD1540];
      v73 = *MEMORY[0x24BDD0FC8];
      v74 = CFSTR("All Public Key Credential requests must specify a relyingPartyIdentifier.");
      v38 = (void *)MEMORY[0x24BDBCE70];
      v39 = &v74;
      v40 = &v73;
      goto LABEL_58;
    }
    v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE0B218]), "initWithRequestTypes:", v10);
    objc_msgSend(v41, "setAppleIDAuthorizationRequest:", v9);
    objc_msgSend(v41, "setRelyingPartyIdentifier:", v8);
    objc_msgSend(v41, "setPlatformKeyCredentialCreationOptions:", v66);
    objc_msgSend(v41, "setPlatformKeyCredentialAssertionOptions:", v64);
    objc_msgSend(v41, "setSecurityKeyCredentialCreationOptions:", v63);
    objc_msgSend(v41, "setSecurityKeyCredentialAssertionOptions:", v7);
    objc_msgSend(v41, "setAuthenticatedContext:", v62);
    objc_msgSend(v41, "setProxiedAppName:", self->_proxiedAppName);
    objc_msgSend(v41, "setProxiedAppIdentifier:", self->_proxiedAppIdentifier);
    objc_msgSend(v41, "setProxiedBundleIdentifier:", self->_proxiedBundleIdentifier);
    objc_msgSend(v41, "setProxiedTeamIdentifier:", self->_proxiedTeamIdentifier);
    objc_msgSend(v41, "setProxiedAssociatedDomains:", self->_proxiedAssociatedDomains);
    objc_msgSend(v41, "setProxiedIconData:", self->_proxiedIconData);
    objc_msgSend(v41, "setProxiedIconScale:", self->_proxiedIconScale);
    objc_msgSend(v41, "setProxiedOriginDeviceName:", self->_proxiedOriginDeviceName);
    objc_msgSend(v41, "setProxySheetHeaderOverride:", self->_proxySheetHeaderOverride);
    objc_msgSend(v41, "setProxySheetTitleOverride:", self->_proxySheetTitleOverride);
    objc_msgSend(v41, "setProxySheetSubtitleOverride:", self->_proxySheetSubtitleOverride);
    objc_msgSend(v41, "setProxySheetNoCredentialsErrorTitleOverride:", self->_proxySheetNoCredentialsErrorTitleOverride);
    objc_msgSend(v41, "setProxySheetNoCredentialsErrorMessageOverride:", self->_proxySheetNoCredentialsErrorMessageOverride);
    objc_msgSend(v41, "setUseAlternativeSecurityKeysIcon:", self->_useAlternativeSecurityKeysIcon);
    if (self->_proxySheetHeaderOverride || self->_proxySheetTitleOverride || self->_proxySheetSubtitleOverride)
    {
      if ((v10 & 0xFFFFFFFFFFFFFFCFLL) != 0)
        goto LABEL_56;
LABEL_68:
      *a4 = 0;
      v41 = v41;
      v44 = v41;
    }
    else
    {
      if (!self->_useAlternativeSecurityKeysIcon || (v10 & 0xFFFFFFFFFFFFFFCFLL) == 0)
        goto LABEL_68;
LABEL_56:
      v42 = (void *)MEMORY[0x24BDD1540];
      v71 = *MEMORY[0x24BDD0FC8];
      v72 = CFSTR("Proxy sheet overrides are only available for security key requests.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1, v57);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, v43);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v4 = v61;
      v44 = 0;
    }
  }

LABEL_63:
  return v44;
}

- (id)_convertCoreErrorToPublicError:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  v5 = 0;
  if (v4 <= 11)
  {
    if (!v4)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v3, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
      v11 = 1000;
      goto LABEL_15;
    }
    if (v4 != 1)
    {
      if (v4 != 2)
        goto LABEL_16;
      goto LABEL_10;
    }
    v6 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v3, "userInfo");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v9 = (void *)v7;
    v10 = v6;
    v11 = 1004;
    goto LABEL_15;
  }
  switch(v4)
  {
    case 12:
LABEL_10:
      v8 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v3, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = 1001;
LABEL_15:
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), v11, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 14:
      v13 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v3, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      v11 = 1002;
      goto LABEL_15;
    case 17:
      v6 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BDD1398];
      v16[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
  }
LABEL_16:

  return v5;
}

- (id)_convertCredentialProviderErrorToPublicError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *authorizationActivity;
  _QWORD block[4];
  id v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "code");
  if (v5 == 102)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = 1006;
  }
  else
  {
    if (v5 != 100)
    {
      authorizationActivity = self->_authorizationActivity;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __74__ASAuthorizationController__convertCredentialProviderErrorToPublicError___block_invoke;
      block[3] = &unk_24C94F558;
      v12 = v4;
      os_activity_apply(authorizationActivity, block);

      v8 = 0;
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = 1001;
  }
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

void __74__ASAuthorizationController__convertCredentialProviderErrorToPublicError___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __74__ASAuthorizationController__convertCredentialProviderErrorToPublicError___block_invoke_cold_1(a1, v2);
}

- (id)_convertWebKitErrorToPublicError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *authorizationActivity;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "code");
  if (v5 == 31)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = 1001;
  }
  else
  {
    if (v5 != 8)
    {
      authorizationActivity = self->_authorizationActivity;
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __62__ASAuthorizationController__convertWebKitErrorToPublicError___block_invoke;
      v17 = &unk_24C94F558;
      v10 = v4;
      v18 = v10;
      os_activity_apply(authorizationActivity, &v14);
      v11 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD1398];
      v20[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1, v14, v15, v16, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = 1006;
  }
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

void __62__ASAuthorizationController__convertWebKitErrorToPublicError___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __62__ASAuthorizationController__convertWebKitErrorToPublicError___block_invoke_cold_1(a1, v2);
}

- (void)_completeWithAuthorization:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  SOAuthorization *appSSOAuthorization;
  _QWORD block[4];
  id v9;
  void (**v10)(_QWORD, _QWORD);
  _QWORD v11[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__ASAuthorizationController__completeWithAuthorization___block_invoke;
  v11[3] = &unk_24C950B78;
  v11[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BBEFEC](v11);
  appSSOAuthorization = self->_appSSOAuthorization;
  if (appSSOAuthorization
    && (-[SOAuthorization isUserInteractionEnabled](appSSOAuthorization, "isUserInteractionEnabled") & 1) == 0)
  {
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
  }
  else
  {
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __56__ASAuthorizationController__completeWithAuthorization___block_invoke_98;
    block[3] = &unk_24C9501B8;
    v10 = v6;
    v9 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __56__ASAuthorizationController__completeWithAuthorization___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ASAuthorizationController__completeWithAuthorization___block_invoke_2;
  block[3] = &unk_24C94F5F8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  os_activity_apply(v5, block);

}

void __56__ASAuthorizationController__completeWithAuthorization___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "credential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_DEFAULT, "Successfully completed authorization: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "authorizationController:didCompleteWithAuthorization:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

uint64_t __56__ASAuthorizationController__completeWithAuthorization___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_failWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  SOAuthorization *appSSOAuthorization;
  _QWORD block[4];
  id v9;
  void (**v10)(_QWORD, _QWORD);
  _QWORD v11[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__ASAuthorizationController__failWithError___block_invoke;
  v11[3] = &unk_24C950710;
  v11[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BBEFEC](v11);
  appSSOAuthorization = self->_appSSOAuthorization;
  if (appSSOAuthorization
    && (-[SOAuthorization isUserInteractionEnabled](appSSOAuthorization, "isUserInteractionEnabled") & 1) == 0)
  {
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
  }
  else
  {
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __44__ASAuthorizationController__failWithError___block_invoke_102;
    block[3] = &unk_24C9501B8;
    v10 = v6;
    v9 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __44__ASAuthorizationController__failWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ASAuthorizationController__failWithError___block_invoke_2;
  block[3] = &unk_24C94F5F8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  os_activity_apply(v5, block);

}

void __44__ASAuthorizationController__failWithError___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  id WeakRetained;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0B1C8]);

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v5, "_convertCoreErrorToPublicError:", v2);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "_shouldConvertExtensionAndWebKitErrors"))
      goto LABEL_9;
    objc_msgSend(v2, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ASExtensionErrorDomain"));

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "_convertCredentialProviderErrorToPublicError:", v2);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v2, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDFA9D0]);

      if (!v10)
        goto LABEL_9;
      objc_msgSend(*(id *)(a1 + 40), "_convertWebKitErrorToPublicError:", v2);
      v6 = objc_claimAutoreleasedReturnValue();
    }
  }
  v11 = (void *)v6;

  v2 = v11;
LABEL_9:
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1000, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __44__ASAuthorizationController__failWithError___block_invoke_2_cold_1(v12);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "authorizationController:didCompleteWithError:", *(_QWORD *)(a1 + 40), v2);

}

uint64_t __44__ASAuthorizationController__failWithError___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)_shouldConvertExtensionAndWebKitErrors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = objc_alloc(MEMORY[0x24BDC1540]);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v5 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v15);
  v6 = v15;

  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ASAuthorizationController _shouldConvertExtensionAndWebKitErrors].cold.1(v7);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v5, "platform") - 1;
  if (v8 > 0xB || ((0xC63u >> v8) & 1) == 0)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v11 = qword_20E55E660[v8];
  objc_msgSend(v5, "SDKVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
    v9 = objc_msgSend(v14, "integerValue") >= v11;
  else
    v9 = 0;

LABEL_7:
  return v9;
}

- (NSArray)authorizationRequests
{
  return self->_authorizationRequests;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (id)presentationContextProvider
{
  return objc_loadWeakRetained((id *)&self->_presentationContextProvider);
}

- (void)setPresentationContextProvider:(id)presentationContextProvider
{
  objc_storeWeak((id *)&self->_presentationContextProvider, presentationContextProvider);
}

- (NSArray)customAuthorizationMethods
{
  return self->_customAuthorizationMethods;
}

- (void)setCustomAuthorizationMethods:(NSArray *)customAuthorizationMethods
{
  objc_setProperty_nonatomic_copy(self, a2, customAuthorizationMethods, 96);
}

- (NSString)proxiedAppName
{
  return self->_proxiedAppName;
}

- (void)setProxiedAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)proxiedAppIdentifier
{
  return self->_proxiedAppIdentifier;
}

- (void)setProxiedAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)proxiedBundleIdentifier
{
  return self->_proxiedBundleIdentifier;
}

- (void)setProxiedBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)proxiedTeamIdentifier
{
  return self->_proxiedTeamIdentifier;
}

- (void)setProxiedTeamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)proxiedAssociatedDomains
{
  return self->_proxiedAssociatedDomains;
}

- (void)setProxiedAssociatedDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSData)proxiedIconData
{
  return self->_proxiedIconData;
}

- (void)setProxiedIconData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)proxiedIconScale
{
  return self->_proxiedIconScale;
}

- (void)setProxiedIconScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)proxiedOriginDeviceName
{
  return self->_proxiedOriginDeviceName;
}

- (void)setProxiedOriginDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)proxySheetHeaderOverride
{
  return self->_proxySheetHeaderOverride;
}

- (void)setProxySheetHeaderOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)proxySheetTitleOverride
{
  return self->_proxySheetTitleOverride;
}

- (void)setProxySheetTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)proxySheetSubtitleOverride
{
  return self->_proxySheetSubtitleOverride;
}

- (void)setProxySheetSubtitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)proxySheetNoCredentialsErrorTitleOverride
{
  return self->_proxySheetNoCredentialsErrorTitleOverride;
}

- (void)setProxySheetNoCredentialsErrorTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)proxySheetNoCredentialsErrorMessageOverride
{
  return self->_proxySheetNoCredentialsErrorMessageOverride;
}

- (void)setProxySheetNoCredentialsErrorMessageOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)useAlternativeSecurityKeysIcon
{
  return self->_useAlternativeSecurityKeysIcon;
}

- (void)setUseAlternativeSecurityKeysIcon:(BOOL)a3
{
  self->_useAlternativeSecurityKeysIcon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxySheetNoCredentialsErrorMessageOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetNoCredentialsErrorTitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetSubtitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetTitleOverride, 0);
  objc_storeStrong((id *)&self->_proxySheetHeaderOverride, 0);
  objc_storeStrong((id *)&self->_proxiedOriginDeviceName, 0);
  objc_storeStrong((id *)&self->_proxiedIconScale, 0);
  objc_storeStrong((id *)&self->_proxiedIconData, 0);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_proxiedTeamIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppName, 0);
  objc_storeStrong((id *)&self->_customAuthorizationMethods, 0);
  objc_destroyWeak((id *)&self->_presentationContextProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authorizationRequests, 0);
  objc_storeStrong((id *)&self->_referenceToSelf, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong((id *)&self->_appSSOViewController, 0);
  objc_storeStrong((id *)&self->_appSSOPresentationAnchor, 0);
  objc_storeStrong((id *)&self->_appSSORequestURL, 0);
  objc_storeStrong((id *)&self->_appSSOAuthorization, 0);
}

void __80__ASAuthorizationController_authorization_presentViewController_withCompletion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, a1, a3, "Timed out presenting SSO authorization view controller.", a5, a6, a7, a8, 0);
}

- (void)_performAuthorizationRequests:(uint64_t)a3 requestStyle:(uint64_t)a4 requestOptions:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, a1, a3, "Rejecting invalid requests.", a5, a6, a7, a8, 0);
}

- (void)_requestContextWithRequests:(uint64_t)a3 error:(uint64_t *)a4 .cold.1(uint8_t *a1, void *a2, uint64_t a3, uint64_t *a4)
{
  NSObject *v6;
  uint64_t v7;

  v6 = a2;
  v7 = objc_opt_class();
  *(_DWORD *)a1 = 138477827;
  *a4 = v7;
  _os_log_error_impl(&dword_20E4D9000, v6, OS_LOG_TYPE_ERROR, "Found request for unexpected type: %{private}@", a1, 0xCu);

}

void __74__ASAuthorizationController__convertCredentialProviderErrorToPublicError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Received unexpected credential provider error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __62__ASAuthorizationController__convertWebKitErrorToPublicError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Received unexpected WebKit error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __44__ASAuthorizationController__failWithError___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "ASAuthorizationController credential request failed with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)_shouldConvertExtensionAndWebKitErrors
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Failed to get application extension record: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

@end

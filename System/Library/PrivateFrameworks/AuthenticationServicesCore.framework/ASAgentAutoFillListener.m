@implementation ASAgentAutoFillListener

- (ASAgentAutoFillListener)initWithPublicKeyCredentialManager:(id)a3 signInEventCollector:(id)a4
{
  id v7;
  id v8;
  ASAgentAutoFillListener *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSXPCListener *listener;
  uint64_t v14;
  NSHashTable *weakActiveConnections;
  ASAgentAutoFillListener *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ASAgentAutoFillListener;
  v9 = -[ASAgentAutoFillListener init](&v18, sel_init);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x24BDD1998]);
    WBSAuthenticationServicesAgentAutoFillServiceName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithMachServiceName:", v11);
    listener = v9->_listener;
    v9->_listener = (NSXPCListener *)v12;

    -[NSXPCListener setDelegate:](v9->_listener, "setDelegate:", v9);
    objc_storeStrong((id *)&v9->_publicKeyCredentialManager, a3);
    objc_msgSend(v7, "setPasskeyAutoFillManagerDelegate:", v9);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    weakActiveConnections = v9->_weakActiveConnections;
    v9->_weakActiveConnections = (NSHashTable *)v14;

    v9->_internalLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_signInEventCollector, a4);
    -[NSXPCListener resume](v9->_listener, "resume");
    v16 = v9;
  }

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  __int128 v13[2];
  __int128 v14;
  __int128 v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v14 = 0u;
  v15 = 0u;
  if (v7)
    objc_msgSend(v7, "auditToken");
  v13[0] = v14;
  v13[1] = v15;
  v9 = isClientWithAuditTokenProperlyEntitled(v13);
  if (v9)
  {
    os_unfair_lock_lock(&self->_internalLock);
    -[NSHashTable addObject:](self->_weakActiveConnections, "addObject:", v8);
    os_unfair_lock_unlock(&self->_internalLock);
    WBSAuthenticationServicesAgentDelegateInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v10);

    WBSAuthenticationServicesAgentInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v11);

    objc_msgSend(v8, "setExportedObject:", self);
    objc_msgSend(v8, "resume");
  }

  return v9;
}

- (void)getPasskeysForRunningAssertionWithApplicationIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int16 v15[8];
  __int128 v16[4];

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "auditToken");
    if ((WBSAuditTokenHasEntitlement() & 1) == 0)
    {
      objc_msgSend(v9, "auditToken");
      goto LABEL_6;
    }
LABEL_7:
    -[ASPublicKeyCredentialManagerInterface autoFillOperationUUIDForApplicationIdentifier:](self->_publicKeyCredentialManager, "autoFillOperationUUIDForApplicationIdentifier:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[ASPublicKeyCredentialManagerInterface autoFillPasskeysForOperationUUID:](self->_publicKeyCredentialManager, "autoFillPasskeysForOperationUUID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "first");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "second");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v12, v13);

    }
    else
    {
      v7[2](v7, (void *)MEMORY[0x24BDBD1A8], 0);
    }

    goto LABEL_14;
  }
  memset(&v16[2], 0, 32);
  if ((WBSAuditTokenHasEntitlement() & 1) != 0)
    goto LABEL_7;
  memset(v16, 0, 32);
LABEL_6:
  if ((isClientWithAuditTokenProperlyEntitled(v16) & 1) != 0)
    goto LABEL_7;
  v14 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 0;
    _os_log_impl(&dword_20E648000, v14, OS_LOG_TYPE_DEFAULT, "Rejecting unentitled process from requesting passkeys.", (uint8_t *)v15, 2u);
  }
  v7[2](v7, (void *)MEMORY[0x24BDBD1A8], 0);
LABEL_14:

}

- (void)getPasskeysForRunningAssertionWithWebFrameIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  ASGlobalFrameIdentifier *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int16 v16[8];
  __int128 v17[2];

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "auditToken");
  else
    memset(v17, 0, sizeof(v17));
  if ((isClientWithAuditTokenProperlyEntitled(v17) & 1) != 0)
  {
    v10 = -[ASGlobalFrameIdentifier initWithCoreFrameIdentifier:]([ASGlobalFrameIdentifier alloc], "initWithCoreFrameIdentifier:", v6);
    -[ASPublicKeyCredentialManagerInterface autoFillOperationUUIDForWebFrameIdentifier:](self->_publicKeyCredentialManager, "autoFillOperationUUIDForWebFrameIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[ASPublicKeyCredentialManagerInterface autoFillPasskeysForOperationUUID:](self->_publicKeyCredentialManager, "autoFillPasskeysForOperationUUID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "first");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "second");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v13, v14);

    }
    else
    {
      v7[2](v7, (void *)MEMORY[0x24BDBD1A8], 0);
    }

  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 0;
      _os_log_impl(&dword_20E648000, v15, OS_LOG_TYPE_DEFAULT, "Rejecting unentitled process from requesting passkeys.", (uint8_t *)v16, 2u);
    }
    v7[2](v7, (void *)MEMORY[0x24BDBD1A8], 0);
  }

}

- (void)userSelectedAutoFillPasskey:(id)a3 authenticatedLAContext:(id)a4 savedAccountContext:(id)a5 completionHandler:(id)a6
{
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void (**v15)(void);

  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  v15 = (void (**)(void))a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "operationUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASPublicKeyCredentialManagerInterface assertUsingAutoFillPasskeyWithIdentifier:authenticatedContext:savedAccountContext:forOperationUUID:](publicKeyCredentialManager, "assertUsingAutoFillPasskeyWithIdentifier:authenticatedContext:savedAccountContext:forOperationUUID:", v13, v11, v10, v14);
  v15[2]();

}

- (void)userSelectedAutoFillNearbyDevice:(id)a3 completionHandler:(id)a4
{
  ASPublicKeyCredentialManagerInterface *publicKeyCredentialManager;
  id v6;
  id v7;

  publicKeyCredentialManager = self->_publicKeyCredentialManager;
  v6 = a4;
  objc_msgSend(a3, "operationUUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ASPublicKeyCredentialManagerInterface presentCABLESheetForOperationUUID:withCompletionHandler:](publicKeyCredentialManager, "presentCABLESheetForOperationUUID:withCompletionHandler:", v7, v6);

}

- (void)test_createPasskeyWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  ASCPublicKeyCredentialCreationOptions *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  ASCPublicKeyCredentialCreationOptions *v29;
  ASPublicKeyCredentialOperationTestDelegate *v30;
  id v31;
  NSObject *v32;
  ASAgentAutoFillListener *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _OWORD v39[2];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v36 = a4;
  v35 = a5;
  v34 = a6;
  v14 = a7;
  +[ASFeatureManager sharedManager](ASFeatureManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = v13;
  if (v16)
    objc_msgSend(v16, "auditToken");
  else
    memset(v39, 0, sizeof(v39));
  v19 = objc_msgSend(v15, "isClientEntitledForInternalTestingWithAuditToken:", v39);

  if ((v19 & 1) != 0)
  {
    v20 = [ASCPublicKeyCredentialCreationOptions alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dataUsingEncoding:", 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = &unk_24C9904F0;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
    v33 = self;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v35;
    v25 = v36;
    v27 = v13;
    v28 = v34;
    v29 = -[ASCPublicKeyCredentialCreationOptions initWithChallenge:clientDataJSON:clientDataHash:relyingPartyIdentifier:userName:userIdentifier:userDisplayName:supportedAlgorithmIdentifiers:attestationPreference:userVerificationPreference:excludedCredentials:extensions:origin:](v20, "initWithChallenge:clientDataJSON:clientDataHash:relyingPartyIdentifier:userName:userIdentifier:userDisplayName:supportedAlgorithmIdentifiers:attestationPreference:userVerificationPreference:excludedCredentials:extensions:origin:", v23, 0, 0, v35, v27, v34, v36, v24, CFSTR("none"), 0, 0, 0, 0);

    v30 = objc_alloc_init(ASPublicKeyCredentialOperationTestDelegate);
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __122__ASAgentAutoFillListener_test_createPasskeyWithUserName_displayName_relyingPartyIdentifier_userHandle_completionHandler___block_invoke;
    v37[3] = &unk_24C97E8F0;
    v38 = v14;
    -[ASPublicKeyCredentialOperationTestDelegate setDidCompletionRegistrationCallback:](v30, "setDidCompletionRegistrationCallback:", v37);
    v31 = (id)-[ASPublicKeyCredentialManagerInterface createNewPlatformCredentialWithOptions:authenticatedContext:delegate:webFrameIdentifier:parentActivity:isConditionalRegistration:](v33->_publicKeyCredentialManager, "createNewPlatformCredentialWithOptions:authenticatedContext:delegate:webFrameIdentifier:parentActivity:isConditionalRegistration:", v29, 0, v30, 0, MEMORY[0x24BDACB08], 0);

  }
  else
  {
    v32 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      -[ASAgentAutoFillListener test_createPasskeyWithUserName:displayName:relyingPartyIdentifier:userHandle:completionHandler:].cold.1(v32, a2);
    (*((void (**)(id, _QWORD))v14 + 2))(v14, 0);
    v26 = v35;
    v25 = v36;
    v28 = v34;
  }

}

void __122__ASAgentAutoFillListener_test_createPasskeyWithUserName_displayName_relyingPartyIdentifier_userHandle_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_20E648000, v7, OS_LOG_TYPE_INFO, "Test passkey creation completed: %{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5 != 0);

}

- (void)getExternalPasskeyRequestForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6
{
  -[ASPublicKeyCredentialManagerInterface getExternalPasskeyRequestForWebFrameIdentifier:relyingPartyIdentifier:credentialID:completionHandler:](self->_publicKeyCredentialManager, "getExternalPasskeyRequestForWebFrameIdentifier:relyingPartyIdentifier:credentialID:completionHandler:", a3, a4, a5, a6);
}

- (void)getExternalPasskeyRequestForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6
{
  -[ASPublicKeyCredentialManagerInterface getExternalPasskeyRequestForApplicationIdentifier:relyingPartyIdentifier:credentialID:completionHandler:](self->_publicKeyCredentialManager, "getExternalPasskeyRequestForApplicationIdentifier:relyingPartyIdentifier:credentialID:completionHandler:", a3, a4, a5, a6);
}

- (void)completeAssertionWithExternalPasskeyForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  ASCPlatformPublicKeyCredentialAssertion *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  LOBYTE(v20) = 1;
  v21 = -[ASCPlatformPublicKeyCredentialAssertion initWithRelyingPartyIdentifier:authenticatorData:signature:userHandle:rawClientDataJSON:credentialID:extensions:attachment:isExternal:]([ASCPlatformPublicKeyCredentialAssertion alloc], "initWithRelyingPartyIdentifier:authenticatorData:signature:userHandle:rawClientDataJSON:credentialID:extensions:attachment:isExternal:", v18, v17, v16, v15, 0, v14, 0, CFSTR("platform"), v20);

  -[ASPublicKeyCredentialManagerInterface completeAssertionWithExternalPasskeyForWebFrameIdentifier:usingCredential:](self->_publicKeyCredentialManager, "completeAssertionWithExternalPasskeyForWebFrameIdentifier:usingCredential:", v19, v21);
}

- (void)completeAssertionWithExternalPasskeyForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  ASCPlatformPublicKeyCredentialAssertion *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  LOBYTE(v20) = 1;
  v21 = -[ASCPlatformPublicKeyCredentialAssertion initWithRelyingPartyIdentifier:authenticatorData:signature:userHandle:rawClientDataJSON:credentialID:extensions:attachment:isExternal:]([ASCPlatformPublicKeyCredentialAssertion alloc], "initWithRelyingPartyIdentifier:authenticatorData:signature:userHandle:rawClientDataJSON:credentialID:extensions:attachment:isExternal:", v18, v17, v16, v15, 0, v14, 0, CFSTR("platform"), v20);

  -[ASPublicKeyCredentialManagerInterface completeAssertionWithExternalPasskeyForApplicationIdentifier:usingCredential:](self->_publicKeyCredentialManager, "completeAssertionWithExternalPasskeyForApplicationIdentifier:usingCredential:", v19, v21);
}

- (void)getPasskeyAssertionRequestParametersForWebFrameIdentifier:(id)a3 completionHandler:(id)a4
{
  -[ASPublicKeyCredentialManagerInterface getPasskeyAssertionRequestParametersForWebFrameIdentifier:completionHandler:](self->_publicKeyCredentialManager, "getPasskeyAssertionRequestParametersForWebFrameIdentifier:completionHandler:", a3, a4);
}

- (void)getPasskeyAssertionRequestParametersForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
  -[ASPublicKeyCredentialManagerInterface getPasskeyAssertionRequestParametersForApplicationIdentifier:completionHandler:](self->_publicKeyCredentialManager, "getPasskeyAssertionRequestParametersForApplicationIdentifier:completionHandler:", a3, a4);
}

- (void)getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:(id)a3
{
  -[ASPublicKeyCredentialManagerInterface getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:](self->_publicKeyCredentialManager, "getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:", a3);
}

- (void)getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:(id)a3 orApplicationIdentifier:(id)a4 completionHandler:(id)a5
{
  -[ASPublicKeyCredentialManagerInterface getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:orApplicationIdentifier:completionHandler:](self->_publicKeyCredentialManager, "getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:orApplicationIdentifier:completionHandler:", a3, a4, a5);
}

- (void)didFillCredentialForUsername:(id)a3 forHost:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inAppWithBundleIdentifier:(id)a6
{
  -[ASPasswordSignInEventCollector didUseCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:](self->_signInEventCollector, "didUseCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:", a3, a4, a5, a6);
}

- (void)didFillCredentialForUsername:(id)a3 forURL:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inBrowserWithBundleIdentifier:(id)a6
{
  -[ASPasswordSignInEventCollector didUseCredentialForUsername:forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:](self->_signInEventCollector, "didUseCredentialForUsername:forURL:fromProviderWithBundleIdentifier:inBrowserWithBundleIdentifier:", a3, a4, a5, a6);
}

- (void)isOrigin:(id)a3 relatedToRelyingPartyIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TtC26AuthenticationServicesCore23ASCRelatedOriginFetcher *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_TtC26AuthenticationServicesCore23ASCRelatedOriginFetcher);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__ASAgentAutoFillListener_isOrigin_relatedToRelyingPartyIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_24C97E918;
  v13 = v7;
  v11 = v7;
  -[ASCRelatedOriginFetcher isOrigin:relatedToRelyingPartyIdentifier:completionHandler:](v10, "isOrigin:relatedToRelyingPartyIdentifier:completionHandler:", v9, v8, v12);

}

uint64_t __86__ASAgentAutoFillListener_isOrigin_relatedToRelyingPartyIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)newPasskeysAvailableForApplicationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  os_unfair_lock_s *p_internalLock;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v4;
    _os_log_impl(&dword_20E648000, v5, OS_LOG_TYPE_INFO, "Passkeys loaded for %{public}@", buf, 0xCu);
  }
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_weakActiveConnections;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "remoteObjectProxy", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "newPasskeysAvailableForApplicationIdentifier:", v4);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_internalLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInEventCollector, 0);
  objc_storeStrong((id *)&self->_weakActiveConnections, 0);
  objc_storeStrong((id *)&self->_publicKeyCredentialManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)test_createPasskeyWithUserName:(void *)a1 displayName:(const char *)a2 relyingPartyIdentifier:userHandle:completionHandler:.cold.1(void *a1, const char *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_20E648000, v3, OS_LOG_TYPE_FAULT, "Rejecting invocation of restricted method %{public}@ from unentitled process.", (uint8_t *)&v5, 0xCu);

}

@end

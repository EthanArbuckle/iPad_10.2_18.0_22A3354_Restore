@implementation ASPublicKeyCredentialManager

- (ASPublicKeyCredentialManager)init
{
  return (ASPublicKeyCredentialManager *)-[ASPublicKeyCredentialManager initForTesting:](self, "initForTesting:", 0);
}

- (id)initForTesting:(BOOL)a3
{
  ASPublicKeyCredentialManager *v4;
  ASPublicKeyCredentialManager *v5;
  uint64_t v6;
  NSMutableDictionary *uuidToOperation;
  uint64_t v8;
  NSMapTable *panelToWeakOperation;
  uint64_t v10;
  NSMapTable *applicationIdentifierToWeakOperation;
  uint64_t v12;
  NSMapTable *webFrameIdentifierToWeakOperationForBrowser;
  void *v14;
  NSObject *v15;
  ASPublicKeyCredentialManager *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ASPublicKeyCredentialManager;
  v4 = -[ASPublicKeyCredentialManager init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isForTesting = a3;
    v4->_operationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    uuidToOperation = v5->_uuidToOperation;
    v5->_uuidToOperation = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    panelToWeakOperation = v5->_panelToWeakOperation;
    v5->_panelToWeakOperation = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    applicationIdentifierToWeakOperation = v5->_applicationIdentifierToWeakOperation;
    v5->_applicationIdentifierToWeakOperation = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    webFrameIdentifierToWeakOperationForBrowser = v5->_webFrameIdentifierToWeakOperationForBrowser;
    v5->_webFrameIdentifierToWeakOperationForBrowser = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ASPublicKeyCredentialManager initForTesting:].cold.1();
    v16 = v5;

  }
  return v5;
}

- (void)panel:(id)a3 updateWebAuthenticationPanel:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;

  -[ASPublicKeyCredentialManager _operationForPanel:](self, "_operationForPanel:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 4;
    switch(a4)
    {
      case 0:
        goto LABEL_11;
      case 1:
        v10 = 5;
        goto LABEL_11;
      case 2:
        v10 = 10;
        goto LABEL_11;
      case 3:
        v10 = 9;
        goto LABEL_11;
      case 4:
        v10 = 8;
        goto LABEL_11;
      case 5:
        v10 = 6;
        goto LABEL_11;
      case 6:
        objc_msgSend(v7, "activity", 4);
        v11 = objc_claimAutoreleasedReturnValue();
        os_activity_apply(v11, &__block_literal_global_30);

        v10 = 7;
        goto LABEL_11;
      case 7:
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __67__ASPublicKeyCredentialManager_panel_updateWebAuthenticationPanel___block_invoke_4;
        v12[3] = &unk_24C94F940;
        v13 = v8;
        -[ASPublicKeyCredentialManager _queryExternalLoginChoicesForOperation:completionHandler:](self, "_queryExternalLoginChoicesForOperation:completionHandler:", v7, v12);

        break;
      case 8:
        v10 = 13;
LABEL_11:
        objc_msgSend(v9, "didReceiveError:", v10);
        break;
      default:
        break;
    }

  }
}

void __67__ASPublicKeyCredentialManager_panel_updateWebAuthenticationPanel___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E4D9000, v0, OS_LOG_TYPE_INFO, "Exclude credentials matched.", v1, 2u);
  }
}

uint64_t __67__ASPublicKeyCredentialManager_panel_updateWebAuthenticationPanel___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFetchPlatformLoginChoices:", a2);
}

- (void)panel:(id)a3 selectAssertionResponse:(id)a4 source:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  ASPublicKeyCredentialManager *v42;
  _QWORD v43[4];
  id v44;
  ASPublicKeyCredentialManager *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  void *v49;
  id v50;
  id v51;

  v10 = a4;
  v11 = a6;
  -[ASPublicKeyCredentialManager _operationForPanel:](self, "_operationForPanel:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5 == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_6;
      v35[3] = &unk_24C951AC0;
      v26 = &v36;
      v36 = v28;
      v32 = &v37;
      v37 = v15;
      v18 = v28;
      objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mergeIdentifiersToAssertionResponses:", v18);
      v33[0] = v29;
      v33[1] = 3221225472;
      v33[2] = __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_7;
      v33[3] = &unk_24C951AE8;
      v34 = v11;
      objc_msgSend(v13, "setSecurityKeyAssertionSelectionCallback:", v33);
      objc_msgSend(v14, "didFetchSecurityKeyLoginChoices:", v27);

    }
    else
    {
      if (a5)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke;
      v48[3] = &unk_24C951A48;
      v49 = v16;
      v32 = &v50;
      v17 = v13;
      v50 = v17;
      v51 = v15;
      v18 = v16;
      objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", v48);
      v31 = v15;
      v19 = v14;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mergeIdentifiersToAssertionResponses:", v18);
      objc_msgSend(v17, "relyingPartyIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "savedAccountContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_2;
      v43[3] = &unk_24C951A70;
      v44 = v21;
      v45 = self;
      v46 = v22;
      v47 = v11;
      v30 = v22;
      v23 = v21;
      objc_msgSend(v17, "setPlatformAssertionSelectionCallback:", v43);
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_4;
      v38[3] = &unk_24C951A98;
      v39 = v19;
      v40 = v20;
      v41 = v17;
      v42 = self;
      v24 = v20;
      v14 = v19;
      v15 = v31;
      v25 = v24;
      -[ASPublicKeyCredentialManager _queryExternalLoginChoicesForOperation:completionHandler:](self, "_queryExternalLoginChoicesForOperation:completionHandler:", v41, v38);

      v26 = &v49;
      v27 = v51;
    }

    goto LABEL_8;
  }
  (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_9:

}

id __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v3 = a2;
  if (shouldUseAssertionResponseForSignIn_once != -1)
    dispatch_once(&shouldUseAssertionResponseForSignIn_once, &__block_literal_global_286);
  v4 = (void *)shouldUseAssertionResponseForSignIn_allowedAccessGroups;
  objc_msgSend(v3, "accessGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    identifierForAssertionResponse(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v6);
    objc_msgSend(v3, "userHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD1820];
    objc_msgSend(*(id *)(a1 + 40), "relyingPartyIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "group");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_customTitleForPasskeyWithUserHandle:relyingPartyID:groupID:", v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x24BE0B240]);
    objc_msgSend(v3, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "relyingPartyIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "group");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v13, "initWithName:displayName:customTitle:identifier:userHandle:relyingPartyIdentifier:publicKeyCredentialOperationUUID:groupID:", v14, v15, v12, v6, v8, v16, v17, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3 && (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("apple.com")) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_updateLastUsedDateForPasskeySavedAccountWithAssertion:relyingParty:context:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_3;
  v6[3] = &unk_24C9501B8;
  v4 = *(id *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  int8x16_t v7;
  _QWORD block[4];
  int8x16_t v9;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didFetchPlatformLoginChoices:", v4);

  objc_msgSend(*(id *)(a1 + 48), "activity");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_5;
  block[3] = &unk_24C94F5F8;
  v7 = *(int8x16_t *)(a1 + 48);
  v6 = (id)v7.i64[0];
  v9 = vextq_s8(v7, v7, 8uLL);
  os_activity_apply(v5, block);

}

void __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "sourceApplicationIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "newPasskeysAvailableForApplicationIdentifier:", v2);

}

id __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  identifierForAssertionResponse(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
  v5 = objc_alloc(MEMORY[0x24BE0B270]);
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithName:displayName:identifier:publicKeyCredentialOperationUUID:", v6, v7, v4, *(_QWORD *)(a1 + 40));
  return v8;
}

void __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_8;
  v6[3] = &unk_24C9501B8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __87__ASPublicKeyCredentialManager_panel_selectAssertionResponse_source_completionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)panel:(id)a3 dismissWebAuthenticationPanelWithResult:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  int64_t v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ASPublicKeyCredentialManager _operationForPanelIfExists:](self, "_operationForPanelIfExists:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "activity");
    v9 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __78__ASPublicKeyCredentialManager_panel_dismissWebAuthenticationPanelWithResult___block_invoke;
    v16 = &unk_24C951B10;
    v10 = v8;
    v17 = v10;
    v18 = a4;
    os_activity_apply(v9, &v13);

    objc_msgSend(v10, "uuid", v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASPublicKeyCredentialManager cancelOperationIfNecessaryWithUUID:overrideError:](self, "cancelOperationIfNecessaryWithUUID:overrideError:", v11, 0);

  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v6;
      _os_log_impl(&dword_20E4D9000, v12, OS_LOG_TYPE_INFO, "Operation for panel %p already dismissed.", buf, 0xCu);
    }
  }

}

void __78__ASPublicKeyCredentialManager_panel_dismissWebAuthenticationPanelWithResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing operation %{public}@ with result %ld.", (uint8_t *)&v7, 0x16u);

  }
}

- (void)panel:(id)a3 requestLAContextForUserVerificationWithCompletionHandler:(id)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void (**v11)(id, void *);
  _QWORD block[4];
  id v13;

  v11 = (void (**)(id, void *))a4;
  -[ASPublicKeyCredentialManager _operationForPanel:](self, "_operationForPanel:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "activity");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __95__ASPublicKeyCredentialManager_panel_requestLAContextForUserVerificationWithCompletionHandler___block_invoke;
    block[3] = &unk_24C94F558;
    v9 = v7;
    v13 = v9;
    os_activity_apply(v8, block);

    objc_msgSend(v9, "authenticatedLAContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v10);

  }
  else
  {
    v11[2](v11, 0);
  }

}

void __95__ASPublicKeyCredentialManager_panel_requestLAContextForUserVerificationWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "authenticatedLAContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_INFO, "Providing LAContext %p for operation %{public}@.", (uint8_t *)&v7, 0x16u);

  }
}

- (void)panel:(id)a3 requestPINWithRemainingRetries:(unint64_t)a4 completionHandler:(id)a5
{
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void (**v13)(id, const __CFString *);
  _QWORD block[4];
  id v15;

  v13 = (void (**)(id, const __CFString *))a5;
  -[ASPublicKeyCredentialManager _operationForPanel:](self, "_operationForPanel:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "activity");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__ASPublicKeyCredentialManager_panel_requestPINWithRemainingRetries_completionHandler___block_invoke;
    block[3] = &unk_24C94F558;
    v11 = v9;
    v15 = v11;
    os_activity_apply(v10, block);

    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestPINWithRemainingRetries:completionHandler:", a4, v13);

  }
  else
  {
    v13[2](v13, &stru_24C955390);
  }

}

void __87__ASPublicKeyCredentialManager_panel_requestPINWithRemainingRetries_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_INFO, "Requesting PIN for security key for operation %{public}@.", (uint8_t *)&v6, 0xCu);

  }
}

- (id)beginAssertionsWithOptions:(id)a3 forProcessWithApplicationIdentifier:(id)a4 delegate:(id)a5 requestStyle:(int64_t)a6 webFrameIdentifier:(id)a7 parentActivity:(id)a8
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  int64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD block[5];
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  _QWORD v63[4];
  id v64;
  id v65;
  NSObject *v66;
  ASPublicKeyCredentialManager *v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[6];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  _BYTE v81[128];
  uint64_t v82;

  v45 = a6;
  v82 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v48 = a4;
  v52 = a5;
  v49 = a7;
  v50 = a8;
  v53 = v13;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASPublicKeyCredentialManager computeClientDataIfNeededForAssertionOptions:](self, "computeClientDataIfNeededForAssertionOptions:", v14);

  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__2;
  v79 = __Block_byref_object_dispose__2;
  v80 = 0;
  v74[0] = MEMORY[0x24BDAC760];
  v74[1] = 3221225472;
  v74[2] = __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke;
  v74[3] = &unk_24C951B38;
  v74[4] = self;
  v74[5] = &v75;
  objc_msgSend(v13, "safari_mapObjectsUsingBlock:", v74);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "relyingPartyIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  v51 = v16;
  v54 = -[ASPublicKeyCredentialManager _newOperationWithRelyingPartyIdentifier:delegate:sourceApplicationIdentifier:webFrameIdentifier:shouldRequireUserVerification:parentActivity:](self, "_newOperationWithRelyingPartyIdentifier:delegate:sourceApplicationIdentifier:webFrameIdentifier:shouldRequireUserVerification:parentActivity:", v17, v52, v48, v49, objc_msgSend(v16, "userVerification") == 0, v50);
  objc_msgSend(v13, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setAssertionOptions:", v18);
  v47 = (void *)v17;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v20 = v15;
  v21 = 0;
  v22 = 0;
  v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
  if (!v23)
    goto LABEL_13;
  v24 = *(_QWORD *)v71;
  do
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v71 != v24)
        objc_enumerationMutation(v20);
      v26 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
      v27 = objc_msgSend(v26, "authenticatorAttachment", v45, v47);
      if (v27 == 1)
      {
        objc_msgSend(v26, "allowCredentials");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "safari_addObjectsFromArrayUnlessNil:", v28);
        v22 = 1;
      }
      else
      {
        if (v27 != 2)
          continue;
        objc_msgSend(v26, "allowCredentials");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "safari_addObjectsFromArrayUnlessNil:", v28);
        v21 = 1;
      }

    }
    v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
  }
  while (v23);
LABEL_13:

  objc_msgSend(v54, "setRequestUsedNonEmptyAllowList:", objc_msgSend(v19, "count") != 0);
  if ((v22 & 1) != 0)
    v29 = (v22 & v21 & 1) == 0;
  else
    v29 = 2;
  if (((v22 | v21) & 1) != 0)
  {
    v30 = v51;
    if (v76[5])
    {
      objc_msgSend(v51, "setExtensionsCBOR:", 0);
      v31 = objc_alloc_init(MEMORY[0x24BDFA968]);
      objc_msgSend(v31, "setAppid:", v76[5]);
      objc_msgSend(v51, "setExtensions:", v31);

      v30 = v51;
    }
    objc_msgSend(v30, "setAuthenticatorAttachment:", v29, v45);
    if (objc_msgSend(v19, "count"))
      objc_msgSend(v30, "setAllowCredentials:", v19);
    objc_msgSend(v53, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "clientDataJSON");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v54, "setClientDataJSONForApps:", v33);
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_20;
    v63[3] = &unk_24C951B80;
    v34 = v54;
    v64 = v34;
    v65 = v47;
    v35 = v33;
    v66 = v35;
    v67 = self;
    v36 = v53;
    v68 = v36;
    v37 = v52;
    v69 = v37;
    v38 = (void *)MEMORY[0x212BBEFEC](v63);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_25;
    block[3] = &unk_24C951BA8;
    block[4] = self;
    v39 = v34;
    v58 = v39;
    v62 = v46;
    v59 = v36;
    v60 = v51;
    v40 = v38;
    v61 = v40;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    if ((v22 & 1) != 0)
    {
      if ((objc_msgSend(MEMORY[0x24BDFA9C0], "isUserVerifyingPlatformAuthenticatorAvailable") & 1) == 0)
      {
        objc_msgSend(v39, "activity");
        v41 = objc_claimAutoreleasedReturnValue();
        os_activity_apply(v41, &__block_literal_global_30_0);

        v55[0] = MEMORY[0x24BDAC760];
        v55[1] = 3221225472;
        v55[2] = __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_31;
        v55[3] = &unk_24C94F940;
        v56 = v37;
        -[ASPublicKeyCredentialManager _queryExternalLoginChoicesForOperation:completionHandler:](self, "_queryExternalLoginChoicesForOperation:completionHandler:", v39, v55);

      }
    }
    else
    {
      objc_msgSend(v39, "activity");
      v43 = objc_claimAutoreleasedReturnValue();
      os_activity_apply(v43, &__block_literal_global_27_2);

      objc_msgSend(v37, "didFetchPlatformLoginChoices:", 0);
    }
    objc_msgSend(v39, "uuid");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v54, "activity");
    v35 = objc_claimAutoreleasedReturnValue();
    os_activity_apply(v35, &__block_literal_global_18);
    v42 = 0;
  }

  _Block_object_dispose(&v75, 8);
  return v42;
}

id __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v3, "appIDForSecurityKeys");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  objc_msgSend(*(id *)(a1 + 32), "_asToWKCredentialAssertionOptions:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_2()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_2_cold_1();
}

void __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t (*__ptr32 *v9)();
  id *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD block[4];
  _QWORD v50[2];

  v43 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = &off_20E55E000;
  if (v43)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_2_21;
    block[3] = &unk_24C94F558;
    v10 = (id *)v50;
    v11 = v43;
    v50[0] = v11;
    os_activity_apply(v7, block);

    v12 = *(void **)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    v14 = v11;
    v15 = v12;
    v16 = v13;
    v17 = objc_msgSend(v14, "attachment");
    if (v17 >= 2)
    {
      if (v17 != 2)
      {
        objc_msgSend(v14, "extensionOutputsCBOR");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

        v32 = *(void **)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", 0);
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "extensionOutputsCBOR");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleExtensionsIfNeededForCredential:withAssertionOptions:webKitExtensionOutputs:", v3, v7, v33);

        goto LABEL_10;
      }
      objc_msgSend(v14, "extensionOutputsCBOR");
      v42 = objc_claimAutoreleasedReturnValue();
      v41 = objc_alloc(MEMORY[0x24BE0B268]);
      objc_msgSend(v14, "authenticatorData");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "signature");
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userHandle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rawId");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      wkAttachmentToASAttachment((id)objc_msgSend(v14, "attachment"));
      v27 = v16;
      v28 = v15;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v38) = 0;
      v30 = (void *)v24;
      v3 = (void *)objc_msgSend(v41, "initWithRelyingPartyIdentifier:authenticatorData:signature:userHandle:rawClientDataJSON:credentialID:extensionOutputsCBOR:attachment:appID:", v28, v39, v24, v25, v27, v26, v42, v29, v38);

      v15 = v28;
      v16 = v27;

      v10 = (id *)v50;
      v8 = MEMORY[0x24BDAC760];
    }
    else
    {
      objc_msgSend(v14, "extensionOutputsCBOR");
      v42 = objc_claimAutoreleasedReturnValue();
      v40 = objc_alloc(MEMORY[0x24BE0B238]);
      objc_msgSend(v14, "authenticatorData");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "signature");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userHandle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rawId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      wkAttachmentToASAttachment((id)objc_msgSend(v14, "attachment"));
      v21 = v16;
      v22 = v15;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v38) = 0;
      v3 = (void *)objc_msgSend(v40, "initWithRelyingPartyIdentifier:authenticatorData:signature:userHandle:rawClientDataJSON:credentialID:extensions:attachment:isExternal:", v22, v39, v18, v19, v21, v20, 0, v23, v38);

      v15 = v22;
      v16 = v21;

      v8 = MEMORY[0x24BDAC760];
      v10 = (id *)v50;
    }

    v31 = (void *)v42;
    v9 = &off_20E55E000;
    goto LABEL_9;
  }
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_22;
  v47[3] = &unk_24C94F558;
  v10 = &v48;
  v48 = v6;
  os_activity_apply(v7, v47);
  v3 = 0;
LABEL_10:

  objc_msgSend(*(id *)(a1 + 32), "overrideError");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v6 && !v3 && v34)
  {
    objc_msgSend(*(id *)(a1 + 32), "activity");
    v36 = objc_claimAutoreleasedReturnValue();
    v44[0] = v8;
    v44[1] = *((_QWORD *)v9 + 175);
    v44[2] = __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_23;
    v44[3] = &unk_24C94F5F8;
    v45 = v6;
    v37 = v35;
    v46 = v37;
    os_activity_apply(v36, v44);

    v6 = v37;
  }
  objc_msgSend(*(id *)(a1 + 72), "didCompleteAssertionWithCredential:error:", v3, v6);

}

void __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_2_21(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = 134217984;
    v6 = objc_msgSend(v3, "attachment");
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_INFO, "Assertion completed: %ld.", (uint8_t *)&v5, 0xCu);

  }
}

void __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_22(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_22_cold_1(a1, v2);
}

void __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_23(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "safari_privacyPreservingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_INFO, "Replacing error %{public}@ with %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_25(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "_newPanelForOperation:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 72);
  if (v2 > 2)
    v3 = 0;
  else
    v3 = qword_20E55E7C8[v2];
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientDataHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAssertionWithMediationRequirement:clientDataHash:options:completionHandler:", v3, v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_2_26()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E4D9000, v0, OS_LOG_TYPE_INFO, "Not requesting platform credentials.", v1, 2u);
  }
}

void __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_29()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E4D9000, v0, OS_LOG_TYPE_INFO, "Platform authenticator not available.", v1, 2u);
  }
}

uint64_t __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_31(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFetchPlatformLoginChoices:", a2);
}

- (id)createNewPlatformCredentialWithOptions:(id)a3 authenticatedContext:(id)a4 delegate:(id)a5 webFrameIdentifier:(id)a6 parentActivity:(id)a7 isConditionalRegistration:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[ASPublicKeyCredentialManager _createCredentialOfKind:withOptions:authenticatedLAContext:delegate:webFrameIdentifier:parentActivity:isConditionalRegistration:](self, "_createCredentialOfKind:withOptions:authenticatedLAContext:delegate:webFrameIdentifier:parentActivity:isConditionalRegistration:", 1, a3, a4, a5, a6, a7, v9);
}

- (void)assertUsingPlatformCredentialForLoginChoice:(id)a3 authenticatedContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "publicKeyCredentialOperationUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASPublicKeyCredentialManager _finishAssertionForOperationWithUUID:identifier:authenticatedContext:savedAccountContext:](self, "_finishAssertionForOperationWithUUID:identifier:authenticatedContext:savedAccountContext:", v9, v8, v6, 0);
}

- (void)_finishAssertionForOperationWithUUID:(id)a3 identifier:(id)a4 authenticatedContext:(id)a5 savedAccountContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v19;

  v17 = a4;
  v10 = a5;
  v11 = a6;
  -[ASPublicKeyCredentialManager _operationForUUID:](self, "_operationForUUID:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "identifiersToAssertionResponses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v13, "setSavedAccountContext:", v11);
      objc_msgSend(v15, "setLAContext:", v10);
      objc_msgSend(v13, "selectPlatformAssertion:", v15);
    }
    else
    {
      objc_msgSend(v13, "activity");
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __121__ASPublicKeyCredentialManager__finishAssertionForOperationWithUUID_identifier_authenticatedContext_savedAccountContext___block_invoke;
      block[3] = &unk_24C94F558;
      v19 = v17;
      os_activity_apply(v16, block);

    }
  }

}

void __121__ASPublicKeyCredentialManager__finishAssertionForOperationWithUUID_identifier_authenticatedContext_savedAccountContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __121__ASPublicKeyCredentialManager__finishAssertionForOperationWithUUID_identifier_authenticatedContext_savedAccountContext___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
}

- (void)_updateLastUsedDateForPasskeySavedAccountWithAssertion:(id)a3 relyingParty:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v7 = a5;
  v8 = (void *)MEMORY[0x24BDD1820];
  v9 = (void *)MEMORY[0x24BDBCE60];
  v10 = a3;
  objc_msgSend(v9, "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "group");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v8, "safari_setLastUsedDate:forPasskeyWithUserHandle:relyingPartyID:groupID:context:", v11, v13, v16, v14, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE82DC0], "defaultContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_setLastUsedDate:forPasskeyWithUserHandle:relyingPartyID:groupID:context:", v11, v13, v16, v14, v15);

  }
}

- (id)autoFillOperationUUIDForApplicationIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    -[ASPublicKeyCredentialManager _operationForApplicationIdentifierIfExists:](self, "_operationForApplicationIdentifierIfExists:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)autoFillOperationUUIDForWebFrameIdentifier:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    -[ASPublicKeyCredentialManager _operationForWebFrameIdentifier:](self, "_operationForWebFrameIdentifier:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ASPublicKeyCredentialManager autoFillOperationUUIDForWebFrameIdentifier:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    v4 = 0;
  }
  return v4;
}

- (id)autoFillPasskeysForOperationUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  char v40;
  unsigned int v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  _QWORD block[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ASPublicKeyCredentialManager _operationForUUIDIfExists:](self, "_operationForUUIDIfExists:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  if (objc_msgSend(v5, "hasSelectedAssertion"))
  {
    objc_msgSend(v6, "activity");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__ASPublicKeyCredentialManager_autoFillPasskeysForOperationUUID___block_invoke;
    block[3] = &unk_24C94F558;
    v47 = v4;
    os_activity_apply(v7, block);

    v8 = objc_alloc(MEMORY[0x24BE82D08]);
    v9 = (void *)objc_msgSend(v8, "initWithFirst:second:", MEMORY[0x24BDBD1A8], 0);

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BE0B280], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDeviceConfiguredToAllowPasskeys");

  if ((v11 & 1) == 0)
  {
LABEL_7:
    v15 = objc_alloc(MEMORY[0x24BE82D08]);
    v9 = (void *)objc_msgSend(v15, "initWithFirst:second:", MEMORY[0x24BDBD1A8], 0);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "atLeastOneEnabledExtensionSupportsPasskeys") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE83018], "sharedFeatureManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldAutoFillPasswordsFromKeychain");

    if ((v14 & 1) == 0)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend(v6, "identifiersToAssertionResponses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relyingPartyIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v6, "shouldRequireUserVerification");
  v38 = v6;
  v40 = objc_msgSend(v6, "requestUsedNonEmptyAllowList");
  v19 = v17;
  v43 = v18;
  v39 = v4;
  v44 = v4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v49;
    do
    {
      v24 = 0;
      v45 = v22;
      do
      {
        if (*(_QWORD *)v49 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v24));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "synchronizable"))
        {
          objc_msgSend(v25, "userHandle");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "base64EncodedStringWithOptions:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = (void *)MEMORY[0x24BDD1820];
          objc_msgSend(v25, "group");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "safari_customTitleForPasskeyWithUserHandle:relyingPartyID:groupID:", v27, v43, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = objc_alloc(MEMORY[0x24BE82CA0]);
          objc_msgSend(v25, "name");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          identifierForAssertionResponse(v25);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v37) = v40;
          v34 = (void *)objc_msgSend(v31, "initWithUsername:customTitle:relyingPartyIdentifier:identifier:operationUUID:shouldRequireUserVerification:requestUsedNonEmptyAllowList:", v32, v30, v43, v33, v44, v41, v37);

          objc_msgSend(v42, "addObject:", v34);
          v22 = v45;

        }
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v22);
  }

  v35 = (void *)objc_msgSend(v42, "copy");
  if (objc_msgSend(MEMORY[0x24BE0B290], "isCABLEClient"))
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D10]), "initWithOperationUUID:", v44);
  else
    v36 = 0;
  v6 = v38;
  v4 = v39;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D08]), "initWithFirst:second:", v35, v36);

LABEL_8:
  return v9;
}

void __65__ASPublicKeyCredentialManager_autoFillPasskeysForOperationUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_20E4D9000, v2, OS_LOG_TYPE_INFO, "Requested AutoFill passkeys for operation %{public}@ after already selecting an assertion. Ignoring.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)assertUsingAutoFillPasskeyWithIdentifier:(id)a3 authenticatedContext:(id)a4 savedAccountContext:(id)a5 forOperationUUID:(id)a6
{
  -[ASPublicKeyCredentialManager _finishAssertionForOperationWithUUID:identifier:authenticatedContext:savedAccountContext:](self, "_finishAssertionForOperationWithUUID:identifier:authenticatedContext:savedAccountContext:", a6, a3, a4, a5);
}

- (void)presentCABLESheetForOperationUUID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_20E4D9000, v8, OS_LOG_TYPE_INFO, "Asked to present caBLE for AutoFill operation %{public}@", (uint8_t *)&v13, 0xCu);
  }
  -[ASPublicKeyCredentialManager _operationForUUIDIfExists:](self, "_operationForUUIDIfExists:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentCABLESheetWithCompletionHandler:", v7);

  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_20E4D9000, v12, OS_LOG_TYPE_DEFAULT, "Could not find operation.", (uint8_t *)&v13, 2u);
    }
    v7[2](v7, 0);
  }

}

- (id)beginCreatingNewSecurityKeyCredentialIfAvailableWithOptions:(id)a3 delegate:(id)a4 webFrameIdentifier:(id)a5 parentActivity:(id)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[ASPublicKeyCredentialManager _createCredentialOfKind:withOptions:authenticatedLAContext:delegate:webFrameIdentifier:parentActivity:isConditionalRegistration:](self, "_createCredentialOfKind:withOptions:authenticatedLAContext:delegate:webFrameIdentifier:parentActivity:isConditionalRegistration:", 2, a3, 0, a4, a5, a6, v7);
}

- (void)assertUsingSecurityKeyCredentialForLoginChoice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;

  v10 = a3;
  objc_msgSend(v10, "publicKeyCredentialOperationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASPublicKeyCredentialManager _operationForUUID:](self, "_operationForUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "identifiersToAssertionResponses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "selectSecurityKeyAssertion:", v8);
    }
    else
    {
      objc_msgSend(v5, "activity");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __79__ASPublicKeyCredentialManager_assertUsingSecurityKeyCredentialForLoginChoice___block_invoke;
      block[3] = &unk_24C94F558;
      v12 = v10;
      os_activity_apply(v9, block);

    }
  }

}

void __79__ASPublicKeyCredentialManager_assertUsingSecurityKeyCredentialForLoginChoice___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __79__ASPublicKeyCredentialManager_assertUsingSecurityKeyCredentialForLoginChoice___block_invoke_cold_1(a1, v2);
}

- (void)clearAllCredentials
{
  objc_msgSend(MEMORY[0x24BDFA9C0], "clearAllLocalAuthenticatorCredentials");
}

- (void)cancelOperationIfNecessaryWithUUID:(id)a3 overrideError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v12 = a3;
  v6 = a4;
  -[ASPublicKeyCredentialManager _operationForUUIDIfExists:](self, "_operationForUUIDIfExists:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "activity");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__ASPublicKeyCredentialManager_cancelOperationIfNecessaryWithUUID_overrideError___block_invoke;
    block[3] = &unk_24C94F5F8;
    v10 = v12;
    v14 = v10;
    v11 = v6;
    v15 = v11;
    os_activity_apply(v9, block);

    if (v11)
      objc_msgSend(v8, "setOverrideError:", v11);
    -[ASPublicKeyCredentialManager _tearDownOperationWithUUID:](self, "_tearDownOperationWithUUID:", v10);

  }
}

void __81__ASPublicKeyCredentialManager_cancelOperationIfNecessaryWithUUID_overrideError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "safari_privacyPreservingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_20E4D9000, v5, OS_LOG_TYPE_DEFAULT, "Asked to cancel operation %{public}@, override error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

- (id)encodeMakeCredentialCommandWithOptions:(id)a3 authenticatorUserVerificationAvailability:(unint64_t)a4 authenticatorSupportedExtensions:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a5;
  if (a4 == 2)
    v10 = 2;
  else
    v10 = a4 == 1;
  -[ASPublicKeyCredentialManager _asToWKCredentialCreationOptions:forCredentialKind:](self, "_asToWKCredentialCreationOptions:forCredentialKind:", v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDataJSON");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = (void *)MEMORY[0x24BDFA9C0];
    objc_msgSend(v8, "challenge");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relyingPartyIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("https://"), "stringByAppendingString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getClientDataJSONForAuthenticationType:challenge:origin:", 0, v14, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "clientDataHash");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v17)
      objc_msgSend(MEMORY[0x24BDFA9C0], "encodeMakeCredentialCommandWithClientDataHash:options:userVerificationAvailability:authenticatorSupportedExtensions:", v17, v11, v10, v9);
    else
      objc_msgSend(MEMORY[0x24BDFA9C0], "encodeMakeCredentialCommandWithClientDataJSON:options:userVerificationAvailability:authenticatorSupportedExtensions:", v12, v11, v10, v9);
  }
  else if (v17)
  {
    objc_msgSend(MEMORY[0x24BDFA9C0], "encodeMakeCredentialCommandWithClientDataHash:options:userVerificationAvailability:", v17, v11, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA9C0], "encodeMakeCredentialCommandWithClientDataJSON:options:userVerificationAvailability:", v12, v11, v10);
  }
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D08]), "initWithFirst:second:", v12, v18);

  return v20;
}

- (id)encodeGetAssertionCommandWithOptions:(id)a3 authenticatorUserVerificationAvailability:(unint64_t)a4 authenticatorSupportedExtensions:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a5;
  if (a4 == 2)
    v10 = 2;
  else
    v10 = a4 == 1;
  -[ASPublicKeyCredentialManager _asToWKCredentialAssertionOptions:](self, "_asToWKCredentialAssertionOptions:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDataJSON");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = (void *)MEMORY[0x24BDFA9C0];
    objc_msgSend(v8, "challenge");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relyingPartyIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("https://"), "stringByAppendingString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getClientDataJSONForAuthenticationType:challenge:origin:", 1, v14, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "clientDataHash");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v17)
      objc_msgSend(MEMORY[0x24BDFA9C0], "encodeGetAssertionCommandWithClientDataHash:options:userVerificationAvailability:authenticatorSupportedExtensions:", v17, v11, v10, v9);
    else
      objc_msgSend(MEMORY[0x24BDFA9C0], "encodeGetAssertionCommandWithClientDataJSON:options:userVerificationAvailability:authenticatorSupportedExtensions:", v12, v11, v10, v9);
  }
  else if (v17)
  {
    objc_msgSend(MEMORY[0x24BDFA9C0], "encodeGetAssertionCommandWithClientDataHash:options:userVerificationAvailability:", v17, v11, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA9C0], "encodeGetAssertionCommandWithClientDataJSON:options:userVerificationAvailability:", v12, v11, v10);
  }
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D08]), "initWithFirst:second:", v12, v18);

  return v20;
}

- (id)browserPasskeysForRelyingParty:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDFA9C0];
  v4 = a3;
  objc_msgSend(v3, "getAllLocalAuthenticatorCredentialsWithRPID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_47);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v10 = (void *)MEMORY[0x24BE83068];
  v20[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__ASPublicKeyCredentialManager_browserPasskeysForRelyingParty___block_invoke_2;
  v17[3] = &unk_24C951C50;
  v12 = v8;
  v18 = v12;
  v19 = v9;
  v13 = v9;
  objc_msgSend(v10, "getExternalPasskeyCredentialIdentitiesForDomains:completionHandler:", v11, v17);

  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  v14 = v19;
  v15 = v12;

  return v15;
}

id __63__ASPublicKeyCredentialManager_browserPasskeysForRelyingParty___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  void *v9;

  v2 = a2;
  if (objc_msgSend(v2, "safari_BOOLForKey:", *MEMORY[0x24BDFAA98]))
  {
    objc_msgSend(v2, "safari_stringForKey:", *MEMORY[0x24BDFAA88]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_stringForKey:", *MEMORY[0x24BDFAA90]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_dataForKey:", *MEMORY[0x24BDFAA70]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_dataForKey:", *MEMORY[0x24BDFAAA0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BE82DF0]);
    if (objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabled"))
      v8 = CFSTR("Apple Passwords");
    else
      v8 = CFSTR("iCloud Keychain");
    v9 = (void *)objc_msgSend(v7, "initWithName:relyingParty:credentialID:userHandle:customTitle:providerName:", v3, v4, v5, v6, 0, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __63__ASPublicKeyCredentialManager_browserPasskeysForRelyingParty___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a2;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v17)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v20 = *(void **)(a1 + 32);
        v3 = (objc_class *)MEMORY[0x24BE82DF0];
        v4 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v2);
        v18 = [v3 alloc];
        objc_msgSend(v4, "user");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "serviceIdentifier");
        v5 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "credentialID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safari_base64DecodedData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "userHandle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_base64DecodedData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "owningExtensionState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedDisplayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)v5;
        v13 = (void *)objc_msgSend(v18, "initWithName:relyingParty:credentialID:userHandle:customTitle:providerName:", v19, v5, v7, v9, 0, v11);
        objc_msgSend(v20, "addObject:", v13);

        ++v2;
      }
      while (v17 != v2);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (id)allPasskeysDataForRelyingParty:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDFA9C0], "getAllLocalAuthenticatorCredentialsWithRPID:", a3);
}

- (BOOL)deletePasskeyForRelyingParty:(id)a3 withCredentialID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDFA9C0], "getAllLocalAuthenticatorCredentialsWithRPID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __84__ASPublicKeyCredentialManager_deletePasskeyForRelyingParty_withCredentialID_error___block_invoke;
  v19 = &unk_24C951C78;
  v10 = v8;
  v20 = v10;
  v11 = objc_msgSend(v9, "safari_containsObjectPassingTest:", &v16);
  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDFA9C0], "deleteLocalAuthenticatorCredentialWithID:", v10, v16, v17, v18, v19);
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ASPublicKeyCredentialManager deletePasskeyForRelyingParty:withCredentialID:error:].cold.1();
    v13 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0FD8];
    v22[0] = CFSTR("Could not find expected passkey.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1, v16, v17, v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

uint64_t __84__ASPublicKeyCredentialManager_deletePasskeyForRelyingParty_withCredentialID_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "safari_dataForKey:", *MEMORY[0x24BDFAA70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToData:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)deleteAllPasskeysForRelyingParty:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDFA9C0], "getAllLocalAuthenticatorCredentialsWithRPID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (!v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      v33 = (uint64_t)v5;
      v23 = 1;
      _os_log_impl(&dword_20E4D9000, v8, OS_LOG_TYPE_INFO, "Found no passkeys for %{public}@.", buf, 0xCu);
      goto LABEL_18;
    }
LABEL_17:
    v23 = 1;
    goto LABEL_18;
  }
  if (v9)
  {
    v10 = v8;
    *(_DWORD *)buf = 134349056;
    v33 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_20E4D9000, v10, OS_LOG_TYPE_INFO, "Deleting %{public}ld passkeys.", buf, 0xCu);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    v15 = *MEMORY[0x24BDFAA70];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "safari_dataForKey:", v15, (_QWORD)v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDFA9C0], "deleteLocalAuthenticatorCredentialWithID:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x24BDFA9C0], "getAllLocalAuthenticatorCredentialsWithRPID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
    goto LABEL_17;
  v18 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = v18;
    v20 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134349056;
    v33 = v20;
    _os_log_impl(&dword_20E4D9000, v19, OS_LOG_TYPE_INFO, "Could not delete %{public}ld passkeys.", buf, 0xCu);

  }
  v21 = (void *)MEMORY[0x24BDD1540];
  v29 = *MEMORY[0x24BDD0FD8];
  v30 = CFSTR("Unable to delete some passkeys.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1, (_QWORD)v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1000, v22);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v23 = 0;
LABEL_18:

  return v23;
}

- (BOOL)renamePasskeywithIdentifier:(id)a3 newName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
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
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(v7, "credentialID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithBase64EncodedString:options:", v10, 0);

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDFA9C0];
    objc_msgSend(v7, "groupID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNameForLocalCredentialWithGroupAndID:credential:name:", v13, v11, v8);

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0FD8];
    v25[0] = CFSTR("Could not decode credentialID as base64.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1004, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v16 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ASPublicKeyCredentialManager renamePasskeywithIdentifier:newName:error:].cold.1((uint64_t)a5, v16, v17, v18, v19, v20, v21, v22);
  }

  return v11 != 0;
}

- (void)getExternalPasskeyRequestForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x24BE0B288];
  v14 = a3;
  v15 = (void *)objc_msgSend([v13 alloc], "initWithCoreFrameIdentifier:", v14);

  -[ASPublicKeyCredentialManager _operationForWebFrameIdentifier:](self, "_operationForWebFrameIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __133__ASPublicKeyCredentialManager_getExternalPasskeyRequestForWebFrameIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke;
    v18[3] = &unk_24C951CA0;
    v19 = v12;
    -[ASPublicKeyCredentialManager _getExternalPasskeyRequestForOperation:relyingPartyIdentifier:credentialID:completionHandler:](self, "_getExternalPasskeyRequestForOperation:relyingPartyIdentifier:credentialID:completionHandler:", v16, v10, v11, v18);

  }
  else
  {
    v17 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ASPublicKeyCredentialManager getExternalPasskeyRequestForWebFrameIdentifier:relyingPartyIdentifier:credentialID:completionHandler:].cold.1();
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

uint64_t __133__ASPublicKeyCredentialManager_getExternalPasskeyRequestForWebFrameIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getExternalPasskeyRequestForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[ASPublicKeyCredentialManager _operationForApplicationIdentifierIfExists:](self, "_operationForApplicationIdentifierIfExists:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __136__ASPublicKeyCredentialManager_getExternalPasskeyRequestForApplicationIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke;
    v15[3] = &unk_24C951CA0;
    v16 = v12;
    -[ASPublicKeyCredentialManager _getExternalPasskeyRequestForOperation:relyingPartyIdentifier:credentialID:completionHandler:](self, "_getExternalPasskeyRequestForOperation:relyingPartyIdentifier:credentialID:completionHandler:", v13, v10, v11, v15);

  }
  else
  {
    v14 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ASPublicKeyCredentialManager getExternalPasskeyRequestForWebFrameIdentifier:relyingPartyIdentifier:credentialID:completionHandler:].cold.1();
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

uint64_t __136__ASPublicKeyCredentialManager_getExternalPasskeyRequestForApplicationIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_getExternalPasskeyRequestForOperation:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __125__ASPublicKeyCredentialManager__getExternalPasskeyRequestForOperation_relyingPartyIdentifier_credentialID_completionHandler___block_invoke;
  v18[3] = &unk_24C951CC8;
  v19 = v11;
  v20 = v12;
  v21 = v10;
  v22 = v13;
  v14 = v13;
  v15 = v10;
  v16 = v12;
  v17 = v11;
  -[ASPublicKeyCredentialManager _queryExternalLoginChoicesForOperation:completionHandler:](self, "_queryExternalLoginChoicesForOperation:completionHandler:", v15, v18);

}

void __125__ASPublicKeyCredentialManager__getExternalPasskeyRequestForOperation_relyingPartyIdentifier_credentialID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ASPasskeyAssertionCredentialExtensionInput *v18;
  void *v19;
  ASPasskeyCredentialRequest *v20;
  ASPasskeyCredentialRequest *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "relyingPartyIdentifier", (_QWORD)v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
        {
          objc_msgSend(v8, "credentialIdentity");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "credentialID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 40));

          if (v12)
          {
            objc_msgSend(*(id *)(a1 + 48), "assertionOptions");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = *(void **)(a1 + 48);
            if (v14)
            {
              objc_msgSend(v15, "assertionOptions");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "extensions");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
                v18 = -[ASPasskeyAssertionCredentialExtensionInput initWithCoreExtensions:]([ASPasskeyAssertionCredentialExtensionInput alloc], "initWithCoreExtensions:", v17);
              else
                v18 = 0;
              v20 = -[ASPasskeyCredentialRequest initWithLoginChoice:assertionExtensionInput:]([ASPasskeyCredentialRequest alloc], "initWithLoginChoice:assertionExtensionInput:", v8, v18);
            }
            else
            {
              objc_msgSend(v15, "creationOptions");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "extensions");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
                v18 = -[ASPasskeyRegistrationCredentialExtensionInput initWithCoreExtensions:]([ASPasskeyRegistrationCredentialExtensionInput alloc], "initWithCoreExtensions:", v17);
              else
                v18 = 0;
              v20 = -[ASPasskeyCredentialRequest initWithLoginChoice:registrationExtensionInput:]([ASPasskeyCredentialRequest alloc], "initWithLoginChoice:registrationExtensionInput:", v8, v18);
            }
            v21 = v20;

            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
            goto LABEL_25;
          }
        }
        else
        {

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v5)
        continue;
      break;
    }
  }

  v13 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    __125__ASPublicKeyCredentialManager__getExternalPasskeyRequestForOperation_relyingPartyIdentifier_credentialID_completionHandler___block_invoke_cold_1(a1, v13);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_25:

}

- (void)completeAssertionWithExternalPasskeyForWebFrameIdentifier:(id)a3 usingCredential:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x24BE0B288];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithCoreFrameIdentifier:", v8);

  -[ASPublicKeyCredentialManager _operationForWebFrameIdentifier:](self, "_operationForWebFrameIdentifier:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ASPublicKeyCredentialManager _completeAssertionWithExternalPasskeyForOperation:usingCredential:](self, "_completeAssertionWithExternalPasskeyForOperation:usingCredential:", v10, v7);
}

- (void)completeAssertionWithExternalPasskeyForApplicationIdentifier:(id)a3 usingCredential:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ASPublicKeyCredentialManager _operationForApplicationIdentifierIfExists:](self, "_operationForApplicationIdentifierIfExists:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ASPublicKeyCredentialManager _completeAssertionWithExternalPasskeyForOperation:usingCredential:](self, "_completeAssertionWithExternalPasskeyForOperation:usingCredential:", v7, v6);

}

- (void)completeAssertionWithExternalPasskeyForUUID:(id)a3 usingCredential:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ASPublicKeyCredentialManager _operationForUUID:](self, "_operationForUUID:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ASPublicKeyCredentialManager _completeAssertionWithExternalPasskeyForOperation:usingCredential:](self, "_completeAssertionWithExternalPasskeyForOperation:usingCredential:", v7, v6);

}

- (void)_completeAssertionWithExternalPasskeyForOperation:(id)a3 usingCredential:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x24BE0B1C8], 12, CFSTR("Operation performed with external passkey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASPublicKeyCredentialManager cancelOperationIfNecessaryWithUUID:overrideError:](self, "cancelOperationIfNecessaryWithUUID:overrideError:", v7, v8);

  objc_msgSend(v12, "clientDataJSONForApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v12, "clientDataJSONForApps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRawClientDataJSON:", v10);

  }
  objc_msgSend(v12, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didCompleteAssertionWithCredential:error:", v6, 0);

}

- (void)_queryExternalLoginChoicesForOperation:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  BOOL v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "assertionOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "assertionOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allowedCredentials");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_mapObjectsUsingBlock:", &__block_literal_global_74);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "count") != 0;
    v12 = (void *)MEMORY[0x24BE83068];
    objc_msgSend(v5, "relyingPartyIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __89__ASPublicKeyCredentialManager__queryExternalLoginChoicesForOperation_completionHandler___block_invoke_2;
    v17[3] = &unk_24C951D58;
    v21 = v11;
    v18 = v10;
    v19 = v5;
    v20 = v6;
    v15 = v10;
    objc_msgSend(v12, "getExternalPasskeyCredentialIdentitiesForDomains:completionHandler:", v14, v17);

  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ASPublicKeyCredentialManager _queryExternalLoginChoicesForOperation:completionHandler:].cold.1();
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

id __89__ASPublicKeyCredentialManager__queryExternalLoginChoicesForOperation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "credentialID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __89__ASPublicKeyCredentialManager__queryExternalLoginChoicesForOperation_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __89__ASPublicKeyCredentialManager__queryExternalLoginChoicesForOperation_completionHandler___block_invoke_3;
  v5[3] = &unk_24C951D30;
  v8 = *(_BYTE *)(a1 + 56);
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(a2, "safari_mapAndFilterObjectsUsingBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

id __89__ASPublicKeyCredentialManager__queryExternalLoginChoicesForOperation_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 48)
    && (v5 = *(void **)(a1 + 32),
        objc_msgSend(v3, "credentialID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6),
        v6,
        !(_DWORD)v5))
  {
    v15 = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BE0B240]);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "assertionOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientDataHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "assertionOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userVerificationPreference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "creationOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "supportedAlgorithmIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v7, "initWithCredentialIdentity:publicKeyCredentialOperationUUID:clientDataHash:userVerificationPreference:supportedAlgorithms:", v4, v8, v10, v12, v14);

  }
  return v15;
}

- (void)getPasskeyAssertionRequestParametersForWebFrameIdentifier:(id)a3 completionHandler:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x24BE0B288];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithCoreFrameIdentifier:", v8);

  -[ASPublicKeyCredentialManager _operationForWebFrameIdentifier:](self, "_operationForWebFrameIdentifier:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ASPublicKeyCredentialManager _getPasskeyAssertionRequestParametersForOperation:completionHandler:](self, "_getPasskeyAssertionRequestParametersForOperation:completionHandler:", v10, v7);
}

- (void)getPasskeyAssertionRequestParametersForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ASPublicKeyCredentialManager _operationForApplicationIdentifierIfExists:](self, "_operationForApplicationIdentifierIfExists:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ASPublicKeyCredentialManager _getPasskeyAssertionRequestParametersForOperation:completionHandler:](self, "_getPasskeyAssertionRequestParametersForOperation:completionHandler:", v7, v6);

}

- (void)getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_operationsLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_uuidToOperation, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isCABLEAuthenticatorRequest");

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(&self->_operationsLock);
  -[ASPublicKeyCredentialManager _getPasskeyAssertionRequestParametersForOperation:completionHandler:](self, "_getPasskeyAssertionRequestParametersForOperation:completionHandler:", v6, v4);

}

- (void)getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:(id)a3 orApplicationIdentifier:(id)a4 completionHandler:(id)a5
{
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    v8 = (objc_class *)MEMORY[0x24BE0B288];
    v9 = a5;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithCoreFrameIdentifier:", v12);
    -[ASPublicKeyCredentialManager _operationForWebFrameIdentifier:](self, "_operationForWebFrameIdentifier:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, BOOL))a5 + 2))(v9, v11 != 0);

  }
  else
  {
    v11 = a5;
    -[ASPublicKeyCredentialManager _operationForApplicationIdentifierIfExists:](self, "_operationForApplicationIdentifierIfExists:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, BOOL))a5 + 2))(v11, v10 != 0);
  }

}

- (void)_getPasskeyAssertionRequestParametersForOperation:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ASPasskeyAssertionCredentialExtensionInput *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  ASPasskeyCredentialRequestParameters *v19;
  void *v20;
  void *v21;
  void *v22;
  ASPasskeyCredentialRequestParameters *v23;

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "atLeastOneEnabledExtensionSupportsPasskeys");

  if ((v8 & 1) == 0)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ASPublicKeyCredentialManager _getPasskeyAssertionRequestParametersForOperation:completionHandler:].cold.3();
    goto LABEL_10;
  }
  if (!v5)
  {
    v17 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ASPublicKeyCredentialManager _getPasskeyAssertionRequestParametersForOperation:completionHandler:].cold.1();
LABEL_10:
    v6[2](v6, 0);
    goto LABEL_17;
  }
  objc_msgSend(v5, "assertionOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "allowedCredentials");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &__block_literal_global_77);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "assertionOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extensions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v15 = -[ASPasskeyAssertionCredentialExtensionInput initWithCoreExtensions:]([ASPasskeyAssertionCredentialExtensionInput alloc], "initWithCoreExtensions:", v14);
    else
      v15 = 0;
    v19 = [ASPasskeyCredentialRequestParameters alloc];
    objc_msgSend(v5, "relyingPartyIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientDataHash");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userVerificationPreference");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[ASPasskeyCredentialRequestParameters initWithRelyingPartyIdentifier:clientDataHash:userVerificationPreference:allowedCredentials:extensionInput:](v19, "initWithRelyingPartyIdentifier:clientDataHash:userVerificationPreference:allowedCredentials:extensionInput:", v20, v21, v22, v12, v15);

    ((void (**)(id, ASPasskeyCredentialRequestParameters *))v6)[2](v6, v23);
  }
  else
  {
    v18 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ASPublicKeyCredentialManager _getPasskeyAssertionRequestParametersForOperation:completionHandler:].cold.2();
    v6[2](v6, 0);
  }

LABEL_17:
}

uint64_t __100__ASPublicKeyCredentialManager__getPasskeyAssertionRequestParametersForOperation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "credentialID");
}

- (id)_asToWKCredentialCreationOptions:(id)a3 forCredentialKind:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD v31[4];
  char v32;

  v5 = a3;
  objc_msgSend(v5, "supportedAlgorithmIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_80_0);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "relyingPartyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA998]), "initWithName:", v8);
  objc_msgSend(v9, "setIdentifier:", v8);
  v10 = objc_alloc(MEMORY[0x24BDFA9A8]);
  objc_msgSend(v5, "userName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDisplayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithName:identifier:displayName:", v11, v12, v13);

  v30 = (void *)v7;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA980]), "initWithRelyingParty:user:publicKeyCredentialParamaters:", v9, v14, v7);
  v16 = objc_alloc_init(MEMORY[0x24BDFA970]);
  v17 = v16;
  if (a4 == 1)
  {
    v20 = 1;
    objc_msgSend(v16, "setAuthenticatorAttachment:", 1);
    objc_msgSend(v5, "attestationPreference");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "length"))
      goto LABEL_11;
    v20 = 1;
    if (wkAttestationPreferenceFromString(v18) != 3)
      goto LABEL_11;
    v19 = 3;
  }
  else
  {
    if (a4 != 2)
    {
      v20 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v16, "setAuthenticatorAttachment:", 2);
    objc_msgSend(v5, "attestationPreference");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "length"))
    {
      v20 = 0;
      goto LABEL_11;
    }
    v19 = wkAttestationPreferenceFromString(v18);
    v20 = 0;
  }
  objc_msgSend(v15, "setAttestation:", v19);
LABEL_11:

LABEL_12:
  v21 = objc_msgSend(v5, "residentKeyPreference");
  if (v21 >= 4)
  {
    v23 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ASPublicKeyCredentialManager _asToWKCredentialCreationOptions:forCredentialKind:].cold.1();
    v22 = 0;
  }
  else
  {
    v22 = qword_20E55E7E0[v21];
  }
  objc_msgSend(v17, "setResidentKey:", v22);
  objc_msgSend(v5, "excludedCredentials");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __83__ASPublicKeyCredentialManager__asToWKCredentialCreationOptions_forCredentialKind___block_invoke_2;
    v31[3] = &__block_descriptor_33_e76____WKPublicKeyCredentialDescriptor_16__0__ASCPublicKeyCredentialDescriptor_8l;
    v32 = v20;
    objc_msgSend(v24, "safari_mapObjectsUsingBlock:", v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setExcludeCredentials:", v25);

  }
  objc_msgSend(v5, "userVerificationPreference");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "length"))
    objc_msgSend(v17, "setUserVerification:", wkUserVerificationRequirementFromString(v26));
  objc_msgSend(v15, "setAuthenticatorSelection:", v17);
  objc_msgSend(v5, "timeout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v15, "setTimeout:", v27);
  objc_msgSend(v5, "extensionsCBORForWebKit");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v15, "setExtensionsCBOR:", v28);

  return v15;
}

id __83__ASPublicKeyCredentialManager__asToWKCredentialCreationOptions_forCredentialKind___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDFA990];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithAlgorithm:", v3);

  return v4;
}

id __83__ASPublicKeyCredentialManager__asToWKCredentialCreationOptions_forCredentialKind___block_invoke_2(uint64_t a1, void *a2)
{
  return ascCredentialDescriptorToWKDescriptor(a2, *(unsigned __int8 *)(a1 + 32));
}

- (id)_asToWKCredentialAssertionOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDFA9A0]);
  objc_msgSend(v4, "relyingPartyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelyingPartyIdentifier:", v6);
  v7 = objc_msgSend(v4, "credentialKind");
  if (v7 == 1)
    v8 = 1;
  else
    v8 = 2 * (v7 == 2);
  objc_msgSend(v5, "setAuthenticatorAttachment:", v8);
  -[ASPublicKeyCredentialManager _allowedCredentialsForAssertionOptions:](self, "_allowedCredentialsForAssertionOptions:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v5, "setAllowCredentials:", v9);
  objc_msgSend(v4, "userVerificationPreference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v5, "setUserVerification:", wkUserVerificationRequirementFromString(v10));
  objc_msgSend(v4, "timeout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v5, "setTimeout:", v11);
  objc_msgSend(v4, "extensionsCBORForWebKit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v5, "setExtensionsCBOR:", v12);

  return v5;
}

- (id)_allowedCredentialsForAssertionOptions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "credentialKind");
  if (v5 == 2)
  {
    objc_msgSend(v3, "allowedCredentials");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = &__block_literal_global_89_0;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    objc_msgSend(v3, "allowedCredentials");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = &__block_literal_global_88;
LABEL_5:
    objc_msgSend(v6, "safari_mapObjectsUsingBlock:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v9);

  }
  return v4;
}

id __71__ASPublicKeyCredentialManager__allowedCredentialsForAssertionOptions___block_invoke(uint64_t a1, void *a2)
{
  return ascCredentialDescriptorToWKDescriptor(a2, 1);
}

id __71__ASPublicKeyCredentialManager__allowedCredentialsForAssertionOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return ascCredentialDescriptorToWKDescriptor(a2, 0);
}

- (id)_createCredentialOfKind:(unint64_t)a3 withOptions:(id)a4 authenticatedLAContext:(id)a5 delegate:(id)a6 webFrameIdentifier:(id)a7 parentActivity:(id)a8 isConditionalRegistration:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  _QWORD block[5];
  id v39;
  id v40;
  id v41;
  id v42;
  BOOL v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  ASPublicKeyCredentialManager *v48;
  id v49;
  id v50;
  unint64_t v51;

  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  -[ASPublicKeyCredentialManager computeClientDataIfNeededForCreationOptions:](self, "computeClientDataIfNeededForCreationOptions:", v15);
  objc_msgSend(v15, "relyingPartyIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASPublicKeyCredentialManager _asToWKCredentialCreationOptions:forCredentialKind:](self, "_asToWKCredentialCreationOptions:forCredentialKind:", v15, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "authenticatorSelection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[ASPublicKeyCredentialManager _newOperationWithRelyingPartyIdentifier:delegate:sourceApplicationIdentifier:webFrameIdentifier:shouldRequireUserVerification:parentActivity:](self, "_newOperationWithRelyingPartyIdentifier:delegate:sourceApplicationIdentifier:webFrameIdentifier:shouldRequireUserVerification:parentActivity:", v20, v16, 0, v18, objc_msgSend(v22, "userVerification") == 0, v17);

  objc_msgSend(v23, "setAuthenticatedLAContext:", v19);
  objc_msgSend(v23, "setCreationOptions:", v15);
  objc_msgSend(v15, "clientDataJSON");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __160__ASPublicKeyCredentialManager__createCredentialOfKind_withOptions_authenticatedLAContext_delegate_webFrameIdentifier_parentActivity_isConditionalRegistration___block_invoke;
  v44[3] = &unk_24C951E80;
  v26 = v23;
  v51 = a3;
  v45 = v26;
  v46 = v20;
  v47 = v24;
  v48 = self;
  v27 = v15;
  v49 = v27;
  v50 = v16;
  v28 = v16;
  v29 = v24;
  v30 = v20;
  block[0] = v25;
  block[1] = 3221225472;
  block[2] = __160__ASPublicKeyCredentialManager__createCredentialOfKind_withOptions_authenticatedLAContext_delegate_webFrameIdentifier_parentActivity_isConditionalRegistration___block_invoke_93;
  block[3] = &unk_24C951EA8;
  block[4] = self;
  v39 = v26;
  v43 = a9;
  v40 = v27;
  v41 = v21;
  v42 = (id)MEMORY[0x212BBEFEC](v44);
  v31 = v42;
  v32 = v21;
  v33 = v27;
  v34 = v26;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(v34, "uuid");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

void __160__ASPublicKeyCredentialManager__createCredentialOfKind_withOptions_authenticatedLAContext_delegate_webFrameIdentifier_parentActivity_isConditionalRegistration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
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
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD block[5];

  v33 = a2;
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  if (v33)
  {
    objc_msgSend(*(id *)(a1 + 32), "activity");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __160__ASPublicKeyCredentialManager__createCredentialOfKind_withOptions_authenticatedLAContext_delegate_webFrameIdentifier_parentActivity_isConditionalRegistration___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = *(_QWORD *)(a1 + 80);
    os_activity_apply(v7, block);

    v8 = *(_QWORD *)(a1 + 80);
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v11 = v33;
    v12 = v9;
    v13 = v10;
    objc_msgSend(v11, "transports");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extensionOutputsCBOR");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == 2)
    {
      v21 = v15;
      v32 = objc_alloc(MEMORY[0x24BE0B278]);
      objc_msgSend(v11, "attestationObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rawId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      wkAttachmentToASAttachment((id)objc_msgSend(v11, "attachment"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v32;
      v31 = v21;
      v20 = objc_msgSend(v22, "initWithRelyingPartyIdentifier:attestationObject:rawClientDataJSON:credentialID:transports:extensionOutputsCBOR:attachment:", v12, v17, v13, v18, v14, v21, v19);
    }
    else
    {
      if (v8 != 1)
      {
LABEL_8:

        v23 = *(void **)(a1 + 56);
        v24 = *(_QWORD *)(a1 + 64);
        objc_msgSend(v11, "extensionOutputsCBOR");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleExtensionsIfNeededForCredential:withRegistrationOptions:webKitExtensionOutputs:", v9, v24, v25);

        goto LABEL_9;
      }
      v31 = v15;
      v16 = objc_alloc(MEMORY[0x24BE0B248]);
      objc_msgSend(v11, "attestationObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rawId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      wkAttachmentToASAttachment((id)objc_msgSend(v11, "attachment"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v30) = 0;
      v20 = objc_msgSend(v16, "initWithRelyingPartyIdentifier:attestationObject:rawClientDataJSON:credentialID:transports:extensions:attachment:isExternal:", v12, v17, v13, v18, v14, 0, v19, v30);
    }
    v9 = (void *)v20;

    v6 = MEMORY[0x24BDAC760];
    v15 = v31;
    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "overrideError");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v5 && !v9 && v26)
  {
    objc_msgSend(*(id *)(a1 + 32), "activity");
    v28 = objc_claimAutoreleasedReturnValue();
    v34[0] = v6;
    v34[1] = 3221225472;
    v34[2] = __160__ASPublicKeyCredentialManager__createCredentialOfKind_withOptions_authenticatedLAContext_delegate_webFrameIdentifier_parentActivity_isConditionalRegistration___block_invoke_91;
    v34[3] = &unk_24C94F5F8;
    v35 = v5;
    v29 = v27;
    v36 = v29;
    os_activity_apply(v28, v34);

    v5 = v29;
  }
  objc_msgSend(*(id *)(a1 + 72), "didCompleteRegistrationWithCredential:error:", v9, v5);

}

void __160__ASPublicKeyCredentialManager__createCredentialOfKind_withOptions_authenticatedLAContext_delegate_webFrameIdentifier_parentActivity_isConditionalRegistration___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_20E4D9000, v2, OS_LOG_TYPE_DEFAULT, "Completion registration: %lu.", (uint8_t *)&v4, 0xCu);
  }
}

void __160__ASPublicKeyCredentialManager__createCredentialOfKind_withOptions_authenticatedLAContext_delegate_webFrameIdentifier_parentActivity_isConditionalRegistration___block_invoke_91(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "safari_privacyPreservingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_INFO, "Replacing error %{public}@ with %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __160__ASPublicKeyCredentialManager__createCredentialOfKind_withOptions_authenticatedLAContext_delegate_webFrameIdentifier_parentActivity_isConditionalRegistration___block_invoke_93(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "_newPanelForOperation:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 72))
    v2 = 3;
  else
    v2 = 1;
  objc_msgSend(*(id *)(a1 + 48), "clientDataHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeCredentialWithMediationRequirement:clientDataHash:options:completionHandler:", v2, v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (id)_newPanelForOperation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  os_unfair_lock_lock(&self->_operationsLock);
  v5 = objc_alloc_init(MEMORY[0x24BDFA9C0]);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v4, "setPanel:", v5);
  objc_msgSend(v4, "activity");
  v6 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __54__ASPublicKeyCredentialManager__newPanelForOperation___block_invoke;
  v15 = &unk_24C94F5F8;
  v7 = v5;
  v16 = v7;
  v17 = v4;
  v8 = v4;
  os_activity_apply(v6, &v12);

  -[NSMapTable setObject:forKey:](self->_panelToWeakOperation, "setObject:forKey:", v8, v7, v12, v13, v14, v15);
  os_unfair_lock_unlock(&self->_operationsLock);
  v9 = v17;
  v10 = v7;

  return v10;
}

void __54__ASPublicKeyCredentialManager__newPanelForOperation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_20E4D9000, v5, OS_LOG_TYPE_DEFAULT, "Creating panel %p for %{public}@.", (uint8_t *)&v7, 0x16u);

  }
}

- (id)_newOperationWithRelyingPartyIdentifier:(id)a3 delegate:(id)a4 sourceApplicationIdentifier:(id)a5 webFrameIdentifier:(id)a6 shouldRequireUserVerification:(BOOL)a7 parentActivity:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ASPublicKeyCredentialOperation *v19;
  NSObject *v20;
  ASPublicKeyCredentialOperation *v21;
  id v22;
  NSMutableDictionary *uuidToOperation;
  void *v24;
  void *v25;
  ASPublicKeyCredentialOperation *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  ASPublicKeyCredentialOperation *v32;
  id v33;

  v9 = a7;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a4;
  v18 = a3;
  os_unfair_lock_lock(&self->_operationsLock);
  v19 = -[ASPublicKeyCredentialOperation initWithRelyingPartyIdentifier:delegate:parentActivity:]([ASPublicKeyCredentialOperation alloc], "initWithRelyingPartyIdentifier:delegate:parentActivity:", v18, v17, v16);

  -[ASPublicKeyCredentialOperation setSourceApplicationIdentifier:](v19, "setSourceApplicationIdentifier:", v14);
  -[ASPublicKeyCredentialOperation setShouldRequireUserVerification:](v19, "setShouldRequireUserVerification:", v9);
  -[ASPublicKeyCredentialOperation activity](v19, "activity");
  v20 = objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __173__ASPublicKeyCredentialManager__newOperationWithRelyingPartyIdentifier_delegate_sourceApplicationIdentifier_webFrameIdentifier_shouldRequireUserVerification_parentActivity___block_invoke;
  v31 = &unk_24C94F5F8;
  v21 = v19;
  v32 = v21;
  v22 = v14;
  v33 = v22;
  os_activity_apply(v20, &v28);

  uuidToOperation = self->_uuidToOperation;
  -[ASPublicKeyCredentialOperation uuid](v21, "uuid", v28, v29, v30, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](uuidToOperation, "setObject:forKeyedSubscript:", v21, v24);

  if (v15)
    -[NSMapTable setObject:forKey:](self->_webFrameIdentifierToWeakOperationForBrowser, "setObject:forKey:", v21, v15);
  if (v22)
    -[NSMapTable setObject:forKey:](self->_applicationIdentifierToWeakOperation, "setObject:forKey:", v21, v22);
  os_unfair_lock_unlock(&self->_operationsLock);
  v25 = v33;
  v26 = v21;

  return v26;
}

void __173__ASPublicKeyCredentialManager__newOperationWithRelyingPartyIdentifier_delegate_sourceApplicationIdentifier_webFrameIdentifier_shouldRequireUserVerification_parentActivity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_DEFAULT, "Beginning operation %{public}@ for %{public}@.", (uint8_t *)&v7, 0x16u);

  }
}

- (void)_tearDownOperationWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  os_unfair_lock_lock(&self->_operationsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToOperation, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activity");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__ASPublicKeyCredentialManager__tearDownOperationWithUUID___block_invoke;
  block[3] = &unk_24C94F558;
  v9 = v4;
  v6 = v4;
  os_activity_apply(v5, block);

  objc_msgSend(v7, "tearDownIfNecessary");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uuidToOperation, "setObject:forKeyedSubscript:", 0, v6);
  os_unfair_lock_unlock(&self->_operationsLock);

}

void __59__ASPublicKeyCredentialManager__tearDownOperationWithUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_20E4D9000, v2, OS_LOG_TYPE_DEFAULT, "Tearing down operation %{public}@.", (uint8_t *)&v4, 0xCu);
  }
}

- (id)_operationForPanelIfExists:(id)a3
{
  os_unfair_lock_s *p_operationsLock;
  id v5;
  void *v6;

  p_operationsLock = &self->_operationsLock;
  v5 = a3;
  os_unfair_lock_lock(p_operationsLock);
  -[NSMapTable objectForKey:](self->_panelToWeakOperation, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_operationsLock);
  return v6;
}

- (id)_operationForPanel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v4 = a3;
  -[ASPublicKeyCredentialManager _operationForPanelIfExists:](self, "_operationForPanelIfExists:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ASPublicKeyCredentialManager _operationForPanel:].cold.1();
  }

  return v6;
}

- (id)_operationForUUIDIfExists:(id)a3
{
  os_unfair_lock_s *p_operationsLock;
  id v5;
  void *v6;

  p_operationsLock = &self->_operationsLock;
  v5 = a3;
  os_unfair_lock_lock(p_operationsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToOperation, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_operationsLock);
  return v6;
}

- (id)_operationForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v4 = a3;
  -[ASPublicKeyCredentialManager _operationForUUIDIfExists:](self, "_operationForUUIDIfExists:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ASPublicKeyCredentialManager _operationForUUID:].cold.1();
  }

  return v6;
}

- (id)_operationForApplicationIdentifierIfExists:(id)a3
{
  os_unfair_lock_s *p_operationsLock;
  id v5;
  void *v6;

  p_operationsLock = &self->_operationsLock;
  v5 = a3;
  os_unfair_lock_lock(p_operationsLock);
  -[NSMapTable objectForKey:](self->_applicationIdentifierToWeakOperation, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_operationsLock);
  return v6;
}

- (id)_operationForWebFrameIdentifier:(id)a3
{
  os_unfair_lock_s *p_operationsLock;
  id v5;
  void *v6;

  p_operationsLock = &self->_operationsLock;
  v5 = a3;
  os_unfair_lock_lock(p_operationsLock);
  -[NSMapTable objectForKey:](self->_webFrameIdentifierToWeakOperationForBrowser, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_operationsLock);
  return v6;
}

- (void)computeClientDataIfNeededForCreationOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  CC_LONG v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "clientDataJSON");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  objc_msgSend(v15, "clientDataHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v11 = (void *)MEMORY[0x24BDFA9C0];
    objc_msgSend(v15, "challenge");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "relyingPartyIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("https://"), "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getClientDataJSONForAuthenticationType:challenge:origin:", 0, v3, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClientDataJSON:", v14);

LABEL_2:
  }
  objc_msgSend(v15, "clientDataHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clientDataJSON");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const void *)objc_msgSend(v7, "bytes");
    v9 = objc_msgSend(v7, "length");
    v10 = objc_retainAutorelease(v6);
    CC_SHA256(v8, v9, (unsigned __int8 *)objc_msgSend(v10, "mutableBytes"));
    objc_msgSend(v15, "setClientDataHash:", v10);

  }
}

- (void)computeClientDataIfNeededForAssertionOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  CC_LONG v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "clientDataJSON");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  objc_msgSend(v15, "clientDataHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v11 = (void *)MEMORY[0x24BDFA9C0];
    objc_msgSend(v15, "challenge");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "relyingPartyIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("https://"), "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getClientDataJSONForAuthenticationType:challenge:origin:", 1, v3, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClientDataJSON:", v14);

LABEL_2:
  }
  objc_msgSend(v15, "clientDataHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clientDataJSON");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const void *)objc_msgSend(v7, "bytes");
    v9 = objc_msgSend(v7, "length");
    v10 = objc_retainAutorelease(v6);
    CC_SHA256(v8, v9, (unsigned __int8 *)objc_msgSend(v10, "mutableBytes"));
    objc_msgSend(v15, "setClientDataHash:", v10);

  }
}

- (id)internalErrorToWKErrorIfApplicable:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "safari_matchesErrorDomain:andCode:", *MEMORY[0x24BE0B1C8], 7))
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = *MEMORY[0x24BDFA9D0];
    v10 = *MEMORY[0x24BDD0FC8];
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 8, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v3;
  }

  return v8;
}

- (ASPasskeyAutoFillManagerDelegate)passkeyAutoFillManagerDelegate
{
  return self->_passkeyAutoFillManagerDelegate;
}

- (void)setPasskeyAutoFillManagerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_passkeyAutoFillManagerDelegate, a3);
}

- (BOOL)isForTesting
{
  return self->_isForTesting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkeyAutoFillManagerDelegate, 0);
  objc_storeStrong((id *)&self->_webFrameIdentifierToWeakOperationForBrowser, 0);
  objc_storeStrong((id *)&self->_applicationIdentifierToWeakOperation, 0);
  objc_storeStrong((id *)&self->_panelToWeakOperation, 0);
  objc_storeStrong((id *)&self->_uuidToOperation, 0);
}

- (void)handleExtensionsIfNeededForCredential:(id)a3 withAssertionOptions:(id)a4 webKitExtensionOutputs:(id)a5
{
  sub_20E54A9B0(self, (uint64_t)a2, (uint64_t)a3, a4, a5, ASPublicKeyCredentialManager.handleExtensionsIfNeeded(for:options:webKitExtensionOutputs:));
}

- (void)handleExtensionsIfNeededForCredential:(id)a3 withRegistrationOptions:(id)a4 webKitExtensionOutputs:(id)a5
{
  sub_20E54A9B0(self, (uint64_t)a2, (uint64_t)a3, a4, a5, ASPublicKeyCredentialManager.handleExtensionsIfNeeded(for:options:webKitExtensionOutputs:));
}

- (BOOL)passkeyExistsForRelyingParty:(id)a3 username:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ASPublicKeyCredentialManager *v11;
  _QWORD *v12;

  v5 = sub_20E5572B4();
  v7 = v6;
  v8 = sub_20E5572B4();
  v10 = v9;
  v11 = self;
  v12 = sub_20E54AD3C(v5, v7);
  swift_bridgeObjectRetain();
  LOBYTE(v8) = sub_20E54D9C8((uint64_t)v12, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v8 & 1;
}

- (void)initForTesting:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_20E4D9000, v0, OS_LOG_TYPE_DEBUG, "Sharing group provider initialized: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "Received unexpected assertion options.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __151__ASPublicKeyCredentialManager_beginAssertionsWithOptions_forProcessWithApplicationIdentifier_delegate_requestStyle_webFrameIdentifier_parentActivity___block_invoke_22_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_ERROR, "Assertion failed: %{public}@", v5, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

void __121__ASPublicKeyCredentialManager__finishAssertionForOperationWithUUID_identifier_authenticatedContext_savedAccountContext___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_20E4D9000, a2, a3, "Could not find assertion for identifier: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)autoFillOperationUUIDForWebFrameIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_20E4D9000, a1, a3, "Passkey AutoFill request for invalid frame identifier: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __79__ASPublicKeyCredentialManager_assertUsingSecurityKeyCredentialForLoginChoice___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_FAULT, "Could not find assertion for identifier: %{public}@", v5, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

- (void)deletePasskeyForRelyingParty:withCredentialID:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_20E4D9000, v1, OS_LOG_TYPE_ERROR, "Could not find passkey %{public}@ for %{public}@.", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)renamePasskeywithIdentifier:(uint64_t)a3 newName:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_20E4D9000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getExternalPasskeyRequestForWebFrameIdentifier:relyingPartyIdentifier:credentialID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "Received nil operation for web frame identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __125__ASPublicKeyCredentialManager__getExternalPasskeyRequestForOperation_relyingPartyIdentifier_credentialID_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 141558275;
  v4 = 1752392040;
  v5 = 2113;
  v6 = v2;
  _os_log_fault_impl(&dword_20E4D9000, a2, OS_LOG_TYPE_FAULT, "Login choice corresponding to selected credential for %{private, mask.hash}@ not found, should not happen", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_queryExternalLoginChoicesForOperation:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "Attempted to query external login choices for nil operation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_getPasskeyAssertionRequestParametersForOperation:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "operation not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_getPasskeyAssertionRequestParametersForOperation:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "assertion options not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_getPasskeyAssertionRequestParametersForOperation:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "no enabled credential provider extensions supports passkeys", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_asToWKCredentialCreationOptions:forCredentialKind:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_20E4D9000, v0, v1, "Found unknown resident key preference: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_operationForPanel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_20E4D9000, v0, v1, "Unexpectedly tried to read operation for unknown panel: %p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_operationForUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_20E4D9000, v0, v1, "Unexpectedly tried to read operation for unknown UUID: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end

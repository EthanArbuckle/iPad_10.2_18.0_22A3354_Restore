@implementation FACircleRemoteUIDelegate

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_2);
  return isInternalBuild_isInternalBuild;
}

uint64_t __43__FACircleRemoteUIDelegate_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  isInternalBuild_isInternalBuild = result;
  return result;
}

- (FACircleRemoteUIDelegate)init
{
  -[FACircleRemoteUIDelegate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (FACircleRemoteUIDelegate)initWithContext:(id)a3 serverHookHandler:(id)a4 pictureStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  FACircleRemoteUIDelegate *v12;
  FACircleRemoteUIDelegate *v13;
  FARequestConfigurator *v14;
  FARequestConfigurator *requestConfigurator;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *objectModelDecorators;
  NSArray *v19;
  NSArray *recommendations;
  NSArray *v21;
  NSArray *emergencyContacts;
  uint64_t v23;
  FAInviteSuggestions *suggester;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)FACircleRemoteUIDelegate;
  v12 = -[FACircleRemoteUIDelegate init](&v36, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    v14 = (FARequestConfigurator *)objc_alloc_init(MEMORY[0x24BE30AE0]);
    requestConfigurator = v13->_requestConfigurator;
    v13->_requestConfigurator = v14;

    objc_msgSend(v9, "authContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FARequestConfigurator setAuthContext:](v13->_requestConfigurator, "setAuthContext:", v16);

    objc_storeStrong((id *)&v13->_serverHookHandler, a4);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    objectModelDecorators = v13->_objectModelDecorators;
    v13->_objectModelDecorators = v17;

    objc_storeStrong((id *)&v13->_familyPictureStore, a5);
    v19 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    recommendations = v13->_recommendations;
    v13->_recommendations = v19;

    v13->_proactiveModelUsed = 1;
    v21 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    emergencyContacts = v13->_emergencyContacts;
    v13->_emergencyContacts = v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BE30AB0]), "initForOneTapInvite");
    suggester = v13->_suggester;
    v13->_suggester = (FAInviteSuggestions *)v23;

    v13->_accumulateDismissInfo = 0;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v10, "serverHooks", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v33;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v33 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v29);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v30, "setRemoteUIDelegate:", v13);
          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v27);
    }

  }
  return v13;
}

- (void)configureHookHandlersForRUIController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  FAPickerSelectMemberHook *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id location;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FACircleRemoteUIDelegate context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("FACircleEventTypeFamilyPicker"));

  if (v7)
  {
    -[FACircleRemoteUIDelegate context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ephemeralAuthResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FAFamilyImageLoader shared](_TtC14FamilyCircleUI19FAFamilyImageLoader, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAuthResults:", v9);

    objc_initWeak(&location, self);
    v11 = objc_alloc_init(FAPickerSelectMemberHook);
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __66__FACircleRemoteUIDelegate_configureHookHandlersForRUIController___block_invoke;
    v33[3] = &unk_24C88BAD0;
    objc_copyWeak(&v34, &location);
    -[FAPickerSelectMemberHook setActivateAction:](v11, "setActivateAction:", v33);
    -[AAUIServerUIHookHandler serverHooks](self->_serverHookHandler, "serverHooks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "addObject:", v11);
    v14 = (void *)objc_msgSend(v13, "copy");
    -[AAUIServerUIHookHandler setServerHooks:](self->_serverHookHandler, "setServerHooks:", v14);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  -[FACircleRemoteUIDelegate context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "authContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appProvidedContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BE0AB20]);

  if (v18)
  {
    self->_accumulateDismissInfo = 1;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[AAUIServerUIHookHandler serverHooks](self->_serverHookHandler, "serverHooks");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = v23;
            -[FACircleRemoteUIDelegate context](self, "context");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "ephemeralAuthResults");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setEphemeralAuthResults:", v26);

            objc_msgSend(v24, "setIsChildDevice:", 1);
            objc_initWeak(&location, self);
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __66__FACircleRemoteUIDelegate_configureHookHandlersForRUIController___block_invoke_2;
            v27[3] = &unk_24C88BAF8;
            objc_copyWeak(&v28, &location);
            objc_msgSend(v24, "setCompletionAction:", v27);
            objc_destroyWeak(&v28);
            objc_destroyWeak(&location);

            goto LABEL_14;
          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        if (v20)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

void __66__FACircleRemoteUIDelegate_configureHookHandlersForRUIController___block_invoke(id *a1, void *a2)
{
  void *v3;
  id WeakRetained;
  id v5;

  objc_msgSend(a2, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "setDismissInfo:", v3);

  v5 = objc_loadWeakRetained(a1);
  objc_msgSend(v5, "_notifyDelegateOfCompletionWithSuccess:error:", 1, 0);

}

void __66__FACircleRemoteUIDelegate_configureHookHandlersForRUIController___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateDismissInfo:", v3);

}

- (void)_notifyDelegateOfCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    _FALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109378;
      v13[1] = v4;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "FACircleRemoteUIDelegate We have a delegate - notifying completion success: %d error: %@", (uint8_t *)v13, 0x12u);
    }

    v9 = objc_alloc(MEMORY[0x24BE30A38]);
    -[FACircleRemoteUIDelegate dismissInfo](self, "dismissInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithLoadSuccess:error:userInfo:", v4, v6, v10);

    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "circleRemoteUIDelegate:completedWithResponse:", self, v11);

  }
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSURLRequest *v14;
  NSURLRequest *cachedRequest;
  void *v16;
  void *v17;
  FARequestConfigurator *requestConfigurator;
  void *v19;
  void *v20;
  FARequestConfigurator *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (NSURLRequest *)objc_msgSend(v11, "copy");
  cachedRequest = self->_cachedRequest;
  self->_cachedRequest = v14;

  -[FACircleRemoteUIDelegate context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ephemeralAuthResults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    requestConfigurator = self->_requestConfigurator;
    -[FACircleRemoteUIDelegate context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ephemeralAuthResults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FARequestConfigurator updateWithEphemeralAuthResults:](requestConfigurator, "updateWithEphemeralAuthResults:", v20);

  }
  objc_initWeak(&location, self);
  v21 = self->_requestConfigurator;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __104__FACircleRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke;
  v24[3] = &unk_24C88BB20;
  objc_copyWeak(&v27, &location);
  v22 = v11;
  v25 = v22;
  v23 = v13;
  v26 = v23;
  -[FARequestConfigurator addFresnoHeadersToRequest:withCompletion:](v21, "addFresnoHeadersToRequest:withCompletion:", v22, v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __104__FACircleRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "additionalParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v8, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "additionalParameters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addEntriesFromDictionary:", v12);

    }
    objc_msgSend(v8[14], "clientName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE308F0]);

    objc_msgSend(v8[14], "clientBundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE308E8]);

    objc_msgSend(MEMORY[0x24BE30AE0], "addMessageEligibilityToPayload:", v6);
    objc_msgSend(*(id *)(a1 + 32), "HTTPMethod");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("POST"));

    if (v16)
      objc_msgSend(v8[1], "addFresnoPayloadToRequest:additionalPayload:", *(_QWORD *)(a1 + 32), v6);
  }
  _FALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    __104__FACircleRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_1(a1, v17);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)getEmergencyContacts
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFC2F8]), "initWithBlock:", &__block_literal_global_44);
}

void __48__FACircleRemoteUIDelegate_getEmergencyContacts__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v2 = a2;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v3 = (void *)getHKHealthStoreClass_softClass;
  v21 = getHKHealthStoreClass_softClass;
  v4 = MEMORY[0x24BDAC760];
  if (!getHKHealthStoreClass_softClass)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __getHKHealthStoreClass_block_invoke;
    v16 = &unk_24C88B7B0;
    v17 = &v18;
    __getHKHealthStoreClass_block_invoke((uint64_t)&v13);
    v3 = (void *)v19[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v18, 8);
  v6 = objc_alloc_init(v5);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v7 = (void *)getHKMedicalIDStoreClass_softClass;
  v21 = getHKMedicalIDStoreClass_softClass;
  if (!getHKMedicalIDStoreClass_softClass)
  {
    v13 = v4;
    v14 = 3221225472;
    v15 = __getHKMedicalIDStoreClass_block_invoke;
    v16 = &unk_24C88B7B0;
    v17 = &v18;
    __getHKMedicalIDStoreClass_block_invoke((uint64_t)&v13);
    v7 = (void *)v19[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v18, 8);
  v9 = (void *)objc_msgSend([v8 alloc], "initWithHealthStore:", v6);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __48__FACircleRemoteUIDelegate_getEmergencyContacts__block_invoke_2;
  v11[3] = &unk_24C88BB88;
  v12 = v2;
  v10 = v2;
  objc_msgSend(v9, "fetchMedicalIDEmergencyContactsWithCompletion:", v11);

}

uint64_t __48__FACircleRemoteUIDelegate_getEmergencyContacts__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getIMessageHandlesForRecommendations
{
  IDSRecommendationProvider *v3;
  IMessageHandlesForPeopleRecommendations *v4;
  id v5;
  IMessageHandlesForPeopleRecommendations *v6;
  void *v7;
  _QWORD v9[4];
  IMessageHandlesForPeopleRecommendations *v10;
  FACircleRemoteUIDelegate *v11;

  v3 = objc_alloc_init(IDSRecommendationProvider);
  v4 = -[IMessageHandlesForPeopleRecommendations initWithProvider:]([IMessageHandlesForPeopleRecommendations alloc], "initWithProvider:", v3);
  v5 = objc_alloc(MEMORY[0x24BDFC2F8]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__FACircleRemoteUIDelegate_getIMessageHandlesForRecommendations__block_invoke;
  v9[3] = &unk_24C88BBB0;
  v10 = v4;
  v11 = self;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithBlock:", v9);

  return v7;
}

uint64_t __64__FACircleRemoteUIDelegate_getIMessageHandlesForRecommendations__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "getRecommendationsWith:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), a2);
}

- (id)getInviteSuggestionsDependencies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDFC2F8];
  -[FACircleRemoteUIDelegate getIMessageHandlesForRecommendations](self, "getIMessageHandlesForRecommendations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  -[FACircleRemoteUIDelegate getEmergencyContacts](self, "getEmergencyContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "all:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "then");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v8)[2](v8, &__block_literal_global_49);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __60__FACircleRemoteUIDelegate_getInviteSuggestionsDependencies__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("validIMessageHandles"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("emergencyContacts"));

  return v9;
}

- (void)setIMessageHandlesForRecommendations:(id)a3
{
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  NSArray *obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_recommendations;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v6, "contact");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "emailAddressStrings");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v31;
LABEL_8:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v31 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v12);
            v14 = (void *)_IDSCopyIDForEmailAddress();
            v15 = objc_msgSend(v4, "containsObject:", v14);

            if ((v15 & 1) != 0)
              break;
            if (v10 == ++v12)
            {
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
              if (v10)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v6, "contact");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "phoneNumberStrings");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          if (!v17)
            goto LABEL_24;
          v18 = v17;
          v19 = *(_QWORD *)v27;
LABEL_16:
          v20 = 0;
          while (1)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
            v21 = (void *)_IDSCopyIDForPhoneNumberWithOptions();
            v22 = objc_msgSend(v4, "containsObject:", v21);

            if ((v22 & 1) != 0)
              break;
            if (v18 == ++v20)
            {
              v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
              if (v18)
                goto LABEL_16;
              goto LABEL_24;
            }
          }
        }
        objc_msgSend(v6, "setIMessageHandle:", v13);
LABEL_24:

      }
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v25);
  }

}

- (void)remoteUIController:(id)a3 loadResourcesForObjectModel:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  FAInviteSuggestions *suggester;
  void *v13;
  char *v14;
  NSObject *v15;
  NSArray *v16;
  NSArray *recommendations;
  NSObject *v18;
  int64_t proactiveModelUsed;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSArray *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSUInteger v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  NSUInteger v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[4];
  id v45;
  FACircleRemoteUIDelegate *v46;
  _QWORD v47[5];
  id v48;
  char *v49;
  id v50;
  NSUInteger v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int64_t v55;
  __int16 v56;
  NSArray *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "defaultPages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[FASuggestionsTableViewDecorator shouldShowSuggestionsInPage:](FASuggestionsTableViewDecorator, "shouldShowSuggestionsInPage:", v10))
  {
    _FALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      suggester = self->_suggester;
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)suggester;
      _os_log_impl(&dword_20DE41000, v11, OS_LOG_TYPE_DEFAULT, "In shouldShowSuggestion, suggester is %@", buf, 0xCu);
    }

    objc_msgSend(v7, "clientInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("useSuggester"));
    v14 = (char *)objc_claimAutoreleasedReturnValue();

    _FALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v14;
      _os_log_impl(&dword_20DE41000, v15, OS_LOG_TYPE_DEFAULT, "Reading suggester model from RUI: %@", buf, 0xCu);
    }

    -[FAInviteSuggestions fetchFamilyMemberSuggestions:useSuggester:](self->_suggester, "fetchFamilyMemberSuggestions:useSuggester:", &self->_proactiveModelUsed, v14);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    recommendations = self->_recommendations;
    self->_recommendations = v16;

    _FALogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      proactiveModelUsed = self->_proactiveModelUsed;
      *(_DWORD *)buf = 136315394;
      v53 = "-[FACircleRemoteUIDelegate remoteUIController:loadResourcesForObjectModel:completion:]";
      v54 = 2048;
      v55 = proactiveModelUsed;
      _os_log_impl(&dword_20DE41000, v18, OS_LOG_TYPE_DEFAULT, "%s: used proactive model %li for invite suggestions", buf, 0x16u);
    }

    v41 = -[NSArray count](self->_recommendations, "count");
    v20 = objc_alloc(MEMORY[0x24BE30AA8]);
    objc_msgSend(v7, "clientInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithResults:", v21);

    _FALogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v22, "maxFamilySuggestions");
      v25 = self->_recommendations;
      *(_DWORD *)buf = 136315650;
      v53 = "-[FACircleRemoteUIDelegate remoteUIController:loadResourcesForObjectModel:completion:]";
      v54 = 2048;
      v55 = v24;
      v56 = 2112;
      v57 = v25;
      _os_log_impl(&dword_20DE41000, v23, OS_LOG_TYPE_DEFAULT, "%s: Recommendations for %li spots: %@", buf, 0x20u);
    }

    -[FAProfilePictureStore fetchProfilePicturesForRecommendedFamilyMembers:](self->_familyPictureStore, "fetchProfilePicturesForRecommendedFamilyMembers:", self->_recommendations);
    if (-[NSArray count](self->_recommendations, "count"))
    {
      -[FACircleRemoteUIDelegate getInviteSuggestionsDependencies](self, "getInviteSuggestionsDependencies");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke;
      v47[3] = &unk_24C88BC18;
      v47[4] = self;
      v48 = v22;
      v50 = v8;
      v51 = v41;
      v49 = v14;
      objc_msgSend(v26, "onComplete:onQueue:", v47, MEMORY[0x24BDAC9B8]);

    }
    else
    {
      v40 = v22;
      _FALogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DE41000, v28, OS_LOG_TYPE_DEFAULT, "Recommendations are zero, no need to fetch dependencies", buf, 2u);
      }

      +[FamilyInviteAnalytics shared](_TtC14FamilyCircleUI21FamilyInviteAnalytics, "shared");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[NSArray count](self->_recommendations, "count");
      -[FAInviteSuggestions feedbackContext](self->_suggester, "feedbackContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "peopleSuggesterPredictionContext");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "seedContactIdentifiers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count") != 0;
      if (v14)
        v35 = (const __CFString *)v14;
      else
        v35 = CFSTR("-");
      objc_msgSend(v29, "sendFamilySuggestionsEventWithFamilySuggestionsProactiveCount:familySuggestionsDisplayedCount:hasBoostedContacts:proactiveModelUsed:serverRequestedModel:", v41, v30, v34, self->_proactiveModelUsed, v35);

      (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
      v22 = v40;
    }
    if (+[FACircleRemoteUIDelegate isInternalBuild](FACircleRemoteUIDelegate, "isInternalBuild")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE7EDB0], "tapToRadarButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_68;
      v44[3] = &unk_24C88B958;
      v37 = v22;
      v38 = v10;
      v45 = v38;
      v46 = self;
      objc_msgSend(v36, "setAction:", v44);
      v39 = v38;
      v22 = v37;
      objc_msgSend(v39, "setLeftNavigationBarButtonItem:", v36);

    }
LABEL_27:

    goto LABEL_28;
  }
  if (+[FAProfilePictureTableViewDecorator shouldShowPicturesInPage:](FAProfilePictureTableViewDecorator, "shouldShowPicturesInPage:", v10))
  {
    v14 = (char *)objc_opt_new();
    objc_msgSend(v14, "setCachePolicy:", 1);
    objc_msgSend(v14, "setQualityOfService:", 33);
    _FALogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v27, OS_LOG_TYPE_DEFAULT, "Starting family request.", buf, 2u);
    }

    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_75;
    v42[3] = &unk_24C88BCB8;
    v42[4] = self;
    v43 = v8;
    objc_msgSend(v14, "startRequestWithCompletionHandler:", v42);

    goto LABEL_27;
  }
  (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
LABEL_28:

}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_cold_1((uint64_t)v6, v7);

  }
  v30 = v6;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("validIMessageHandles"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIMessageHandlesForRecommendations:", v8);
  _FALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    *(_DWORD *)buf = 136315394;
    v32 = "-[FACircleRemoteUIDelegate remoteUIController:loadResourcesForObjectModel:completion:]_block_invoke";
    v33 = 2112;
    v34 = v10;
    _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "%s: Recommendations before filtering: %@", buf, 0x16u);
  }

  +[FASuggestionsHelper filterAndTrimMessagesHandleSuggestions:maxSuggestions:](FASuggestionsHelper, "filterAndTrimMessagesHandleSuggestions:maxSuggestions:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), objc_msgSend(*(id *)(a1 + 40), "maxFamilySuggestions"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 48);
  *(_QWORD *)(v12 + 48) = v11;

  _FALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    *(_DWORD *)buf = 136315394;
    v32 = "-[FACircleRemoteUIDelegate remoteUIController:loadResourcesForObjectModel:completion:]_block_invoke";
    v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_20DE41000, v14, OS_LOG_TYPE_DEFAULT, "%s: Final recommendations: %@", buf, 0x16u);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("emergencyContacts"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v16, "debugDescription");
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v18;
    _os_log_impl(&dword_20DE41000, v17, OS_LOG_TYPE_DEFAULT, "EC returned from Health: %@", buf, 0xCu);

  }
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 64);
  *(_QWORD *)(v19 + 64) = v16;
  v21 = v16;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  +[FamilyInviteAnalytics shared](_TtC14FamilyCircleUI21FamilyInviteAnalytics, "shared");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(a1 + 64);
  v24 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "feedbackContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "peopleSuggesterPredictionContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "seedContactIdentifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");
  if (*(_QWORD *)(a1 + 48))
    v29 = *(const __CFString **)(a1 + 48);
  else
    v29 = CFSTR("-");
  objc_msgSend(v22, "sendFamilySuggestionsEventWithFamilySuggestionsProactiveCount:familySuggestionsDisplayedCount:hasBoostedContacts:proactiveModelUsed:serverRequestedModel:", v23, v24, v28 != 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v29);

}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_68(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  FamilySuggestionsTapToRadar *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  _FALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, v2, OS_LOG_TYPE_DEFAULT, "Suggestions tap-to-radar button tapped :(", buf, 2u);
  }

  v3 = objc_alloc(MEMORY[0x24BEBD618]);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v7 = (void *)objc_msgSend(v3, "initWithSize:", v5, v6);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_70;
  v10[3] = &unk_24C88BC40;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v7, "imageWithActions:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FamilySuggestionsTapToRadar initWithSuggestions:screenshot:]([FamilySuggestionsTapToRadar alloc], "initWithSuggestions:screenshot:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), v8);
  -[FamilySuggestionsTapToRadar open](v9, "open");

}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_70(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "drawViewHierarchyInRect:afterScreenUpdates:", 1);

}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_2;
  v10[3] = &unk_24C88BC90;
  v11 = v6;
  v7 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = v7;
  v12 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    _FALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32) == 0);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setFamilyCircle:", *(_QWORD *)(a1 + 48));
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_76;
    v11[3] = &unk_24C88BC68;
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v10, "fetchProfileImagesWithCompletion:", v11);

  }
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_76(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (v4)
  {
    _FALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_76_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  RUIPage *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  RUIPage **p_cachedPage;
  FARequestConfigurator *requestConfigurator;
  RUIPage *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];
  RUIPage *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "allHeaderFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x24BE30910]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE30A58], "handleURLResponse:", v7);
  objc_msgSend(v7, "allHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BE30920]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    _FALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v12, OS_LOG_TYPE_DEFAULT, "FACircleRemoteUIDelegate - Family services have changed", buf, 2u);
    }

    -[FACircleRemoteUIDelegate _broadcastServicesDidChangeNotification](self, "_broadcastServicesDidChangeNotification");
  }
  objc_msgSend(v7, "allHeaderFields");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE30B50]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    _FALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = (uint64_t)v14;
      _os_log_impl(&dword_20DE41000, v15, OS_LOG_TYPE_DEFAULT, "Received a command to teardown followup with an identifier: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE30A98], "tearDownFollowupItemWithIdentifier:completion:", v14, 0);
  }
  if (objc_msgSend(v7, "statusCode") >= 400 && objc_msgSend(v7, "statusCode") <= 505)
  {
    objc_msgSend(v6, "displayedPages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (RUIPage *)objc_claimAutoreleasedReturnValue();

    _FALogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v7, "statusCode");
      *(_DWORD *)buf = 134217984;
      v37 = v19;
      _os_log_impl(&dword_20DE41000, v18, OS_LOG_TYPE_DEFAULT, "Family Circle RemoteUI request failed with status %ld", buf, 0xCu);
    }

    if (objc_msgSend(v7, "statusCode") == 401 && v17)
    {
      _FALogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DE41000, v20, OS_LOG_TYPE_DEFAULT, "Recieved a 401, attempting re-auth", buf, 2u);
      }

      p_cachedPage = &self->_cachedPage;
      if (v17 == self->_cachedPage)
      {
        _FALogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[FACircleRemoteUIDelegate remoteUIController:didReceiveHTTPResponse:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

        v23 = *p_cachedPage;
        *p_cachedPage = 0;
      }
      else
      {
        objc_storeStrong((id *)&self->_cachedPage, v17);
        -[FACircleRemoteUIDelegate _setUserInteractionForRUIPage:enabled:](self, "_setUserInteractionForRUIPage:enabled:", v17, 0);
        requestConfigurator = self->_requestConfigurator;
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __70__FACircleRemoteUIDelegate_remoteUIController_didReceiveHTTPResponse___block_invoke;
        v32[3] = &unk_24C88BCE0;
        v32[4] = self;
        v33 = v17;
        v34 = v6;
        v35 = v7;
        -[FARequestConfigurator renewCredentialsWithCompletion:](requestConfigurator, "renewCredentialsWithCompletion:", v32);

        v23 = v33;
      }

    }
    else
    {
      -[FACircleRemoteUIDelegate _reportRequestFailureWithResponse:](self, "_reportRequestFailureWithResponse:", v7);
    }

  }
}

uint64_t __70__FACircleRemoteUIDelegate_remoteUIController_didReceiveHTTPResponse___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;

  v4 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_setUserInteractionForRUIPage:enabled:", *(_QWORD *)(a1 + 40), 1);
  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "_reportRequestFailureWithResponse:", *(_QWORD *)(a1 + 56));
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __70__FACircleRemoteUIDelegate_remoteUIController_didReceiveHTTPResponse___block_invoke_cold_1(v4, v5);

  return objc_msgSend(*(id *)(a1 + 48), "loadRequest:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0);
}

- (void)_setUserInteractionForRUIPage:(id)a3 enabled:(BOOL)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  NSObject *v16;
  BOOL v17;

  v5 = a3;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[FACircleRemoteUIDelegate _setUserInteractionForRUIPage:enabled:].cold.2((uint64_t)v5, a4, v6);

  if (v5)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __66__FACircleRemoteUIDelegate__setUserInteractionForRUIPage_enabled___block_invoke;
    v15[3] = &unk_24C88BD08;
    v16 = v5;
    v17 = a4;
    dispatch_async(MEMORY[0x24BDAC9B8], v15);
    v7 = v16;
  }
  else
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FACircleRemoteUIDelegate _setUserInteractionForRUIPage:enabled:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

uint64_t __66__FACircleRemoteUIDelegate__setUserInteractionForRUIPage_enabled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "buttonItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "setEnabled:", *(unsigned __int8 *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", *(unsigned __int8 *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "setLoading:", *(_BYTE *)(a1 + 40) == 0);
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v9, "displayedPages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      -[FACircleRemoteUIDelegate _notifyDelegateOfCompletionWithSuccess:error:](self, "_notifyDelegateOfCompletionWithSuccess:error:", 0, v6);
  }

}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  -[FACircleRemoteUIDelegate _handleObjectModelChangeForController:objectModel:isModal:](self, "_handleObjectModelChangeForController:objectModel:isModal:", a3, a4, 0);
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  self->_isReplacing = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v9, "allPages", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setHidesBottomBarWhenPushed:", 1);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  -[FACircleRemoteUIDelegate _handleObjectModelChangeForController:objectModel:isModal:](self, "_handleObjectModelChangeForController:objectModel:isModal:", v8, v9, v5);
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  FACircleRemoteUIDelegateDelegate **p_delegate;
  id WeakRetained;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "circleRemoteUIDelegateDidPresent:", self);

  }
}

- (id)getPresentationDecoratorWhenPendingMember:(id)a3 memberBeingViewed:(id)a4 page:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FAProfileViewTableViewDecorator *v13;
  void *v14;
  FAProfileViewTableViewDecorator *v15;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "tableViewOM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FACircleContext userInfo](self->_context, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE30B60]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = [FAProfileViewTableViewDecorator alloc];
    objc_msgSend(v8, "tableViewOM");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[FAProfileViewTableViewDecorator initWithTableView:ruiTableView:forPerson:pictureStore:](v13, "initWithTableView:ruiTableView:forPerson:pictureStore:", v10, v14, v7, self->_familyPictureStore);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  FAProfilePictureTableViewDecorator *v20;
  void *v21;
  FAProfilePictureTableViewDecorator *v22;
  FAProfilePictureTableViewDecorator *v23;
  uint64_t v24;
  FAProfilePictureTableViewDecorator *v25;
  void *v26;
  NSMutableDictionary *objectModelDecorators;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  FASuggestionsTableViewDecorator *v32;
  void *v33;
  uint64_t v34;
  NSMutableDictionary *v35;
  void *v36;
  _TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator *v37;
  void *v38;
  _TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator *v39;
  _TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator *v40;
  NSMutableDictionary *v41;
  void *v42;
  FAProfilePictureTableViewDecorator *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v5 = a5;
  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _FALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v11;
    _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "handleObjectModelChangeForController - %@", buf, 0xCu);

  }
  objc_msgSend(v9, "defaultPages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "hasTableView"))
  {
    objc_msgSend(v9, "sourceURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v13, "tableViewOM");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tableView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[FACircleContext userInfo](self->_context, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BE30B60]);
      v18 = objc_claimAutoreleasedReturnValue();

      v44 = (void *)v18;
      -[FACircleRemoteUIDelegate getPresentationDecoratorWhenPendingMember:memberBeingViewed:page:](self, "getPresentationDecoratorWhenPendingMember:memberBeingViewed:page:", v9, v18, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = [FAProfilePictureTableViewDecorator alloc];
        objc_msgSend(v13, "tableViewOM");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[FAProfilePictureTableViewDecorator initWithTableView:ruiTableView:pictureStore:](v20, "initWithTableView:ruiTableView:pictureStore:", v19, v21, self->_familyPictureStore);

        v23 = v22;
        v24 = (uint64_t)v23;
      }
      else
      {
        if (!+[FAProfilePictureTableViewDecorator shouldShowPicturesInPage:](FAProfilePictureTableViewDecorator, "shouldShowPicturesInPage:", v13))
        {
          v23 = 0;
          goto LABEL_10;
        }
        v25 = [FAProfilePictureTableViewDecorator alloc];
        objc_msgSend(v13, "tableViewOM");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[FAProfilePictureTableViewDecorator initWithTableView:ruiTableView:pictureStore:](v25, "initWithTableView:ruiTableView:pictureStore:", v16, v26, self->_familyPictureStore);

        objectModelDecorators = self->_objectModelDecorators;
        objc_msgSend(v9, "sourceURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](objectModelDecorators, "setObject:forKey:", v24, v28);

        v23 = 0;
      }

      v16 = (void *)v24;
LABEL_10:
      if (+[FASuggestionsTableViewDecorator shouldShowSuggestionsInPage:](FASuggestionsTableViewDecorator, "shouldShowSuggestionsInPage:", v13))
      {
        v29 = objc_alloc(MEMORY[0x24BE30AA8]);
        objc_msgSend(v9, "clientInfo");
        v43 = v23;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithResults:", v30);

        v32 = [FASuggestionsTableViewDecorator alloc];
        objc_msgSend(v13, "tableViewOM");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[FASuggestionsTableViewDecorator initWithTableView:ruiTableView:pictureStore:recommendations:proactiveModelUsed:emergencyContacts:context:viewController:suggester:objectModel:](v32, "initWithTableView:ruiTableView:pictureStore:recommendations:proactiveModelUsed:emergencyContacts:context:viewController:suggester:objectModel:", v16, v33, self->_familyPictureStore, self->_recommendations, self->_proactiveModelUsed, self->_emergencyContacts, v31, v8, self->_suggester, v9);

        v35 = self->_objectModelDecorators;
        objc_msgSend(v9, "sourceURL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v35, "setObject:forKey:", v34, v36);

        v16 = (void *)v34;
        v23 = v43;
      }
      v37 = [_TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator alloc];
      objc_msgSend(v13, "tableViewOM");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[FASettingsPresetsTableViewDecorator initWithTableView:ruiTableView:parentViewController:](v37, "initWithTableView:ruiTableView:parentViewController:", v16, v38, v13);

      v40 = v39;
      v41 = self->_objectModelDecorators;
      objc_msgSend(v9, "sourceURL");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v41, "setObject:forKey:", v40, v42);

    }
  }
  -[AAUIServerUIHookHandler processObjectModel:isModal:](self->_serverHookHandler, "processObjectModel:isModal:", v9, v5);

}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  objc_msgSend(a4, "setModalInPresentation:", 0);
}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "_objectModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    -[FACircleRemoteUIDelegate _notifyDelegateOfCompletionWithSuccess:error:](self, "_notifyDelegateOfCompletionWithSuccess:error:", 1, 0);
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  -[FACircleRemoteUIDelegate _notifyDelegateOfCompletionWithSuccess:error:](self, "_notifyDelegateOfCompletionWithSuccess:error:", 1, 0);
  -[NSMutableDictionary removeAllObjects](self->_objectModelDecorators, "removeAllObjects");
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  id v21;

  v7 = a4;
  objc_msgSend(v7, "sourceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rangeOfString:", *MEMORY[0x24BE308E0]);
  v11 = v10;

  if (v11)
  {
    *a5 = 4;
LABEL_9:
    -[FACircleRemoteUIDelegate _updateDismissInfo:](self, "_updateDismissInfo:", 0);
    goto LABEL_10;
  }
  if (*a5 != 1)
    goto LABEL_9;
  -[AAUIServerUIHookHandler processObjectModel:isModal:](self->_serverHookHandler, "processObjectModel:isModal:", v7, 0);
  objc_msgSend(v7, "clientInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FACircleRemoteUIDelegate _updateDismissInfo:](self, "_updateDismissInfo:", v12);

  -[FACircleRemoteUIDelegate dismissInfo](self, "dismissInfo");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    if (v16 == 1)
    {
      _FALogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[FACircleRemoteUIDelegate remoteUIController:didReceiveObjectModel:actionSignal:].cold.1(v17);

      v18 = (void *)MEMORY[0x24BE30A30];
      -[FACircleRemoteUIDelegate dismissInfo](self, "dismissInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "broadcastRemoteUIWillDismissNotification:", v19);

    }
  }
LABEL_10:
  self->_isReplacing = *a5 == 3;
  if (*a5 == 7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v21 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v21, "circleRemoteUIDelegateDidPresent:", self);

    }
  }

}

- (NSDictionary)dismissInfo
{
  return self->_dismissInfo;
}

- (void)_updateDismissInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *dismissInfo;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_accumulateDismissInfo)
  {
    v5 = (void *)-[NSDictionary mutableCopy](self->_dismissInfo, "mutableCopy");
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = v7;

    -[NSDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", v10);
  }
  else
  {
    v8 = (NSDictionary *)v4;
  }
  dismissInfo = self->_dismissInfo;
  self->_dismissInfo = v8;

}

- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *objectModelDecorators;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!self->_isReplacing)
  {
    objc_msgSend(v12, "displayedPages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      -[FACircleRemoteUIDelegate _notifyDelegateOfCompletionWithSuccess:error:](self, "_notifyDelegateOfCompletionWithSuccess:error:", 1, 0);
  }
  objc_msgSend(v6, "sourceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objectModelDecorators = self->_objectModelDecorators;
    objc_msgSend(v6, "sourceURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](objectModelDecorators, "removeObjectForKey:", v11);

  }
}

- (void)_reportRequestFailureWithResponse:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BE30900];
  v10 = *MEMORY[0x24BE30908];
  v11[0] = a3;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -1002, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FACircleRemoteUIDelegate _notifyDelegateOfCompletionWithSuccess:error:](self, "_notifyDelegateOfCompletionWithSuccess:error:", 0, v9);
}

- (void)_broadcastServicesDidChangeNotification
{
  objc_msgSend(MEMORY[0x24BE30A30], "broadcastServicesChangedNotification");
}

- (void)setDismissInfo:(id)a3
{
  objc_storeStrong((id *)&self->_dismissInfo, a3);
}

- (FACircleContext)context
{
  return self->_context;
}

- (FACircleRemoteUIDelegateDelegate)delegate
{
  return (FACircleRemoteUIDelegateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dismissInfo, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_cachedPage, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_recommendations, 0);
  objc_storeStrong((id *)&self->_familyPictureStore, 0);
  objc_storeStrong((id *)&self->_objectModelDecorators, 0);
  objc_storeStrong((id *)&self->_cachedRequest, 0);
  objc_storeStrong((id *)&self->_serverHookHandler, 0);
  objc_storeStrong((id *)&self->_requestConfigurator, 0);
}

void __104__FACircleRemoteUIDelegate_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "allHTTPHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "HTTPBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136381443;
  v8 = "-[FACircleRemoteUIDelegate remoteUIController:shouldLoadRequest:redirectResponse:withCompletionHandler:]_block_invoke";
  v9 = 2113;
  v10 = v4;
  v11 = 2113;
  v12 = v5;
  v13 = 2113;
  v14 = v6;
  _os_log_debug_impl(&dword_20DE41000, a2, OS_LOG_TYPE_DEBUG, "%{private}s request: %{private}@, headers: %{private}@, body: %{private}@", (uint8_t *)&v7, 0x2Au);

}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[FACircleRemoteUIDelegate remoteUIController:loadResourcesForObjectModel:completion:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_20DE41000, a2, OS_LOG_TYPE_ERROR, "%s: Error %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DE41000, a2, a3, "Error fetching family circle: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __86__FACircleRemoteUIDelegate_remoteUIController_loadResourcesForObjectModel_completion___block_invoke_76_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DE41000, a2, a3, "Error fetching profile images: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteUIController:(uint64_t)a3 didReceiveHTTPResponse:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DE41000, a1, a3, "We're in a 401 loop, bailing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __70__FACircleRemoteUIDelegate_remoteUIController_didReceiveHTTPResponse___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_20DE41000, a2, OS_LOG_TYPE_DEBUG, "Family replaying RUI request %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_setUserInteractionForRUIPage:(uint64_t)a3 enabled:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DE41000, a1, a3, "No page provided to toggle user interaction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_setUserInteractionForRUIPage:(os_log_t)log enabled:.cold.2(uint64_t a1, char a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("NO");
  v5 = "-[FACircleRemoteUIDelegate _setUserInteractionForRUIPage:enabled:]";
  v4 = 136315650;
  v6 = 2112;
  v7 = a1;
  if ((a2 & 1) != 0)
    v3 = CFSTR("YES");
  v8 = 2112;
  v9 = v3;
  _os_log_debug_impl(&dword_20DE41000, log, OS_LOG_TYPE_DEBUG, "%s page:%@ enabled:%@", (uint8_t *)&v4, 0x20u);
}

- (void)remoteUIController:(os_log_t)log didReceiveObjectModel:actionSignal:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20DE41000, log, OS_LOG_TYPE_DEBUG, "Broadcasting remote dismiss", v1, 2u);
  OUTLINED_FUNCTION_3();
}

@end

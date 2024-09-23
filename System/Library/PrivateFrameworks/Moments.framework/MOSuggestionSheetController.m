@implementation MOSuggestionSheetController

- (id)initForScene:(id)a3
{
  id v4;
  MOSuggestionSheetController *v5;
  void *v6;
  FBSSceneIdentityToken *v7;
  FBSSceneIdentityToken *instanceSceneIdentityToken;
  FBSSceneIdentityToken *v9;
  uint64_t v10;
  NSMutableArray *sandboxTokenHandles;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOSuggestionSheetController;
  v5 = -[MOSuggestionSheetController init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identityToken");
    v7 = (FBSSceneIdentityToken *)objc_claimAutoreleasedReturnValue();

    instanceSceneIdentityToken = v5->_instanceSceneIdentityToken;
    v5->_instanceSceneIdentityToken = v7;
    v9 = v7;

    v10 = objc_opt_new();
    sandboxTokenHandles = v5->_sandboxTokenHandles;
    v5->_sandboxTokenHandles = (NSMutableArray *)v10;

  }
  return v5;
}

- (void)activate
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_9(&dword_1CAE42000, a1, a3, "Can't connect to MomentsUIService endpoint", v3);
  OUTLINED_FUNCTION_1_2();
}

void __39__MOSuggestionSheetController_activate__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("com.apple.moments.ui-services.presenter"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EF99CD28);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v0);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EF997748);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);

  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)activate___interface;
  activate___interface = v2;

}

void __39__MOSuggestionSheetController_activate__block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  MOSuggestionsSheetClientProxyTarget *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setInterface:", activate___interface);
  v5 = -[MOSuggestionsSheetClientProxyTarget initWithController:]([MOSuggestionsSheetClientProxyTarget alloc], "initWithController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", v5);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__MOSuggestionSheetController_activate__block_invoke_2;
  v11[3] = &unk_1E8543348;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  objc_msgSend(v3, "setActivationHandler:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __39__MOSuggestionSheetController_activate__block_invoke_3;
  v9[3] = &unk_1E8543348;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __39__MOSuggestionSheetController_activate__block_invoke_137;
  v7[3] = &unk_1E8543348;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);

}

void __39__MOSuggestionSheetController_activate__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didActivateConnection");

}

void __39__MOSuggestionSheetController_activate__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CAE42000, v2, OS_LOG_TYPE_DEFAULT, "suggestions sheet service endpoint connection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didDropConnection");

}

void __39__MOSuggestionSheetController_activate__block_invoke_137(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CAE42000, v2, OS_LOG_TYPE_DEFAULT, "suggestions sheet service endpoint connection invalidated", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didDropConnection");

}

- (void)didDropConnection
{
  BSServiceConnectionClient *angelConnection;
  MOSuggestionsUIServer *remoteTarget;
  void *v5;
  char v6;
  id v7;

  -[BSServiceConnectionClient invalidate](self->_angelConnection, "invalidate");
  angelConnection = self->_angelConnection;
  self->_angelConnection = 0;

  remoteTarget = self->_remoteTarget;
  self->_remoteTarget = 0;

  -[MOSuggestionSheetController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MOSuggestionSheetController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestionSheetController:didTransitionTo:", self, 0);

  }
}

- (void)didActivateConnection
{
  NSObject *v2;
  uint8_t v3[16];

  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CAE42000, v2, OS_LOG_TYPE_DEFAULT, "Activated connection to MomentsUIService process", v3, 2u);
  }

}

- (void)reconnectIfNecessary
{
  if (!self->_angelConnection)
    -[MOSuggestionSheetController activate](self, "activate");
}

- (id)server
{
  MOSuggestionsUIServer *remoteTarget;
  void *v4;
  BSServiceConnectionClient *angelConnection;
  void *v6;
  MOSuggestionsUIServer *v7;
  MOSuggestionsUIServer *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[MOSuggestionSheetController reconnectIfNecessary](self, "reconnectIfNecessary");
  remoteTarget = self->_remoteTarget;
  if (!remoteTarget)
  {
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    angelConnection = self->_angelConnection;
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](angelConnection, "remoteTargetWithLaunchingAssertionAttributes:", v6);
    v7 = (MOSuggestionsUIServer *)objc_claimAutoreleasedReturnValue();
    v8 = self->_remoteTarget;
    self->_remoteTarget = v7;

    remoteTarget = self->_remoteTarget;
  }
  return remoteTarget;
}

- (void)requestPickerWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "controller, requesting sheet with options. %@", (uint8_t *)&v8, 0xCu);

  }
  -[MOSuggestionSheetController server](self, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestPickerForSceneIdentiyToken:withOptions:", self->_instanceSceneIdentityToken, v4);

}

- (void)updatePickerState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = a3;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "controller, requesting sheet view transition to state=%lu", (uint8_t *)&v13, 0xCu);
  }

  if (a3 || self->_angelConnection)
  {
    -[MOSuggestionSheetController server](self, "server");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject updatePickerState:animated:](v8, "updatePickerState:animated:", v9, v10);

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOSuggestionSheetController updatePickerState:animated:].cold.1(v8, v11, v12);
  }

}

- (void)terminate
{
  id v2;

  -[MOSuggestionSheetController server](self, "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "terminate");

}

- (void)getAssetsForSuggestion:(id)a3 withTypes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "suggestionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEFAULT, "(Legacy) controller, requesting assets for suggestion identifier=%@", buf, 0xCu);

  }
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setRequestedTypes:", v10);

  -[MOSuggestionSheetController server](self, "server");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__MOSuggestionSheetController_getAssetsForSuggestion_withTypes_completion___block_invoke;
  v18[3] = &unk_1E8543398;
  v19 = v8;
  v20 = v9;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v15, "fetchAssets:withTypes:completion:", v17, v14, v18);

}

void __75__MOSuggestionSheetController_getAssetsForSuggestion_withTypes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "suggestionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "debugDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "Received assets for suggestion ID=%@ with assets=%@", (uint8_t *)&v12, 0x16u);

LABEL_6:
    }
  }
  else if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "suggestionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEFAULT, "Received nil assets for suggestion ID=%@", (uint8_t *)&v12, 0xCu);
    goto LABEL_6;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getAssetsForSuggestion:(id)a3 withTypes:(id)a4 onAssetsCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MOSuggestionSheetController *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "suggestionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    _os_log_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEFAULT, "controller, requesting assets for suggestion identifier=%@", buf, 0xCu);

  }
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setRequestedTypes:", v10);

  -[MOSuggestionSheetController server](self, "server");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__MOSuggestionSheetController_getAssetsForSuggestion_withTypes_onAssetsCallback___block_invoke;
  v18[3] = &unk_1E85433C0;
  v19 = v8;
  v20 = self;
  v21 = v9;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v15, "fetchAssets:withTypes:onAssetsCallback:", v17, v14, v18);

}

void __81__MOSuggestionSheetController_getAssetsForSuggestion_withTypes_onAssetsCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && (objc_msgSend(v5, "assets"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "suggestionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assets");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v10;
      v20 = 2048;
      v21 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEFAULT, "Received assets for suggestionID=%@, count=%lu", (uint8_t *)&v18, 0x16u);

    }
    if (objc_msgSend(*(id *)(a1 + 40), "disableAssetUnwrapping"))
    {
      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "assets");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v6);
    }
    else
    {
      objc_msgSend(v5, "assets");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[MOSuggestionSheetController processedAssets:](MOSuggestionSheetController, "processedAssets:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v13, v6);
    }

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "suggestionIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_1CAE42000, v14, OS_LOG_TYPE_DEFAULT, "Received nil assets for suggestion ID=%@", (uint8_t *)&v18, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

+ (id)processedAssets:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  NSObject *v28;
  _BYTE *v30;
  char v31;
  _BYTE v32[7];
  char v33;
  _BYTE v34[15];
  char v35;
  _BYTE v36[15];
  char v37;
  _BYTE v38[15];
  char v39;
  _BYTE v40[15];
  char v41;
  _BYTE v42[15];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v49 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1CAE42000, v4, OS_LOG_TYPE_DEFAULT, "Processing assets for count=%lu", buf, 0xCu);
  }

  v5 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    v30 = v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v10);
        _mo_log_facility_get_os_log(MOLogFacilityUIService);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "debugDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v49 = (uint64_t)v13;
          _os_log_impl(&dword_1CAE42000, v12, OS_LOG_TYPE_DEFAULT, "--%@", buf, 0xCu);

        }
        objc_msgSend(v11, "assetType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", MOSuggestionAssetsTypeMotionActivity);

        if (v15)
        {
          +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:](MOSuggestionAssetUtilities, "unwrappedMotionActivityFrom:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            _mo_log_facility_get_os_log(MOLogFacilityUIService);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              +[MOSuggestionSheetController processedAssets:].cold.1(&v41, v42);
            goto LABEL_38;
          }
LABEL_32:
          objc_msgSend(v5, "addObject:", v16, v30);
LABEL_39:

          goto LABEL_40;
        }
        objc_msgSend(v11, "assetType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", MOSuggestionAssetsTypeMediaCoverArt);

        if (v19)
        {
          +[MOSuggestionAssetUtilities unwrappedMediaItemFrom:](MOSuggestionAssetUtilities, "unwrappedMediaItemFrom:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            goto LABEL_32;
          _mo_log_facility_get_os_log(MOLogFacilityUIService);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            +[MOSuggestionSheetController processedAssets:].cold.2(&v39, v40);
LABEL_38:

          goto LABEL_39;
        }
        objc_msgSend(v11, "assetType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", MOSuggestionAssetsTypeWorkoutGroup);

        if (v21)
        {
          +[MOSuggestionAssetUtilities unwrappeCombinedWorkoutObjectFrom:](MOSuggestionAssetUtilities, "unwrappeCombinedWorkoutObjectFrom:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            goto LABEL_32;
          _mo_log_facility_get_os_log(MOLogFacilityUIService);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            +[MOSuggestionSheetController processedAssets:].cold.3(&v37, v38);
          goto LABEL_38;
        }
        objc_msgSend(v11, "assetType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", MOSuggestionAssetsTypeWorkout);

        if (v23)
        {
          +[MOSuggestionAssetUtilities unwrappedWorkoutObjectFrom:](MOSuggestionAssetUtilities, "unwrappedWorkoutObjectFrom:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            goto LABEL_32;
          _mo_log_facility_get_os_log(MOLogFacilityUIService);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            +[MOSuggestionSheetController processedAssets:].cold.4(&v35, v36);
          goto LABEL_38;
        }
        objc_msgSend(v11, "assetType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", MOSuggestionAssetsTypeContactPhoto);

        if (v25)
        {
          +[MOSuggestionAssetUtilities unwrappedContactPhotoFrom:](MOSuggestionAssetUtilities, "unwrappedContactPhotoFrom:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            goto LABEL_32;
          _mo_log_facility_get_os_log(MOLogFacilityUIService);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            +[MOSuggestionSheetController processedAssets:].cold.5(&v33, v34);
          goto LABEL_38;
        }
        objc_msgSend(v11, "assetType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", MOSuggestionAssetsTypeStateOfMindAsset);

        if (v27)
        {
          +[MOSuggestionAssetUtilities unwrappedStateOfMindFrom:](MOSuggestionAssetUtilities, "unwrappedStateOfMindFrom:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            goto LABEL_32;
          _mo_log_facility_get_os_log(MOLogFacilityUIService);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            +[MOSuggestionSheetController processedAssets:].cold.6(&v31, v30);
          goto LABEL_38;
        }
        _mo_log_facility_get_os_log(MOLogFacilityUIService);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAE42000, v28, OS_LOG_TYPE_DEFAULT, "Pass through without further unwrapping", buf, 2u);
        }

        objc_msgSend(v5, "addObject:", v11);
LABEL_40:
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)addSandboxHandle:(id)a3
{
  -[NSMutableArray addObject:](self->_sandboxTokenHandles, "addObject:", a3);
}

- (void)releaseSandboxHandles
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_sandboxTokenHandles;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "intValue", (_QWORD)v7);
        sandbox_extension_release();
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (MOSuggestionSheetControllerDelegate)delegate
{
  return (MOSuggestionSheetControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)disableAssetUnwrapping
{
  return self->_disableAssetUnwrapping;
}

- (void)setDisableAssetUnwrapping:(BOOL)a3
{
  self->_disableAssetUnwrapping = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sandboxTokenHandles, 0);
  objc_storeStrong((id *)&self->_remoteTarget, 0);
  objc_storeStrong((id *)&self->_instanceSceneIdentityToken, 0);
  objc_storeStrong((id *)&self->_angelConnectionQueue, 0);
  objc_storeStrong((id *)&self->_angelConnection, 0);
  objc_storeStrong((id *)&self->_localTarget, 0);
}

- (void)updatePickerState:(uint64_t)a3 animated:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_9(&dword_1CAE42000, a1, a3, "Double dismiss of MOSuggestionSheet", v3);
  OUTLINED_FUNCTION_1_2();
}

+ (void)processedAssets:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_6(a1, a2);
  OUTLINED_FUNCTION_0_9(&dword_1CAE42000, v2, (uint64_t)v2, "(MotionActivity) Unwrapping failed, dropping", v3);
}

+ (void)processedAssets:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_6(a1, a2);
  OUTLINED_FUNCTION_0_9(&dword_1CAE42000, v2, (uint64_t)v2, "(MediaItem) Unwrapping failed, dropping", v3);
}

+ (void)processedAssets:(_BYTE *)a1 .cold.3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_6(a1, a2);
  OUTLINED_FUNCTION_0_9(&dword_1CAE42000, v2, (uint64_t)v2, "(CombinedWorkoutGlyph) Unwrapping failed, dropping", v3);
}

+ (void)processedAssets:(_BYTE *)a1 .cold.4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_6(a1, a2);
  OUTLINED_FUNCTION_0_9(&dword_1CAE42000, v2, (uint64_t)v2, "(WorkoutObject) Unwrapping failed, dropping", v3);
}

+ (void)processedAssets:(_BYTE *)a1 .cold.5(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_6(a1, a2);
  OUTLINED_FUNCTION_0_9(&dword_1CAE42000, v2, (uint64_t)v2, "(ContactPhoto) Unwrapping failed, dropping", v3);
}

+ (void)processedAssets:(_BYTE *)a1 .cold.6(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_6(a1, a2);
  OUTLINED_FUNCTION_0_9(&dword_1CAE42000, v2, (uint64_t)v2, "(StateOfMind) Unwrapping failed, dropping", v3);
}

@end

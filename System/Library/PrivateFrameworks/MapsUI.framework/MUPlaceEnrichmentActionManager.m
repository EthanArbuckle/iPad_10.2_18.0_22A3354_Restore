@implementation MUPlaceEnrichmentActionManager

- (MUPlaceEnrichmentActionManager)initWithPlaceActionManager:(id)a3 mapItem:(id)a4 dataAvailability:(id)a5 amsResultProvider:(id)a6 callToActionDelegate:(id)a7 contextMenuDelegate:(id)a8 externalActionHandler:(id)a9 analyticsDelegate:(id)a10 onActionUpdate:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  MUPlaceEnrichmentActionManager *v23;
  MUPlaceEnrichmentActionManager *v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *externalActionsPairs;
  NSMutableArray *v27;
  NSMutableArray *externalActionsControllers;
  void *v29;
  id onActionUpdate;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v34 = a4;
  v33 = a5;
  v32 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v36.receiver = self;
  v36.super_class = (Class)MUPlaceEnrichmentActionManager;
  v23 = -[MUPlaceEnrichmentActionManager init](&v36, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_placeActionManager, a3);
    objc_storeStrong((id *)&v24->_mapItem, a4);
    objc_storeStrong((id *)&v24->_dataAvailability, a5);
    objc_storeStrong((id *)&v24->_amsResultProvider, a6);
    objc_storeWeak((id *)&v24->_callToActionDelegate, v18);
    objc_storeWeak((id *)&v24->_contextMenuDelegate, v19);
    objc_storeWeak((id *)&v24->_externalActionHandler, v20);
    objc_storeWeak((id *)&v24->_analyticsDelegate, v21);
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    externalActionsPairs = v24->_externalActionsPairs;
    v24->_externalActionsPairs = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    externalActionsControllers = v24->_externalActionsControllers;
    v24->_externalActionsControllers = v27;

    v29 = _Block_copy(v22);
    onActionUpdate = v24->_onActionUpdate;
    v24->_onActionUpdate = v29;

  }
  return v24;
}

- (id)supportedPlaceEnrichmentActions
{
  id v3;
  id v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[MUPlaceEnrichmentActionManager setSupportedActions:](self, "setSupportedActions:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUPlaceEnrichmentActionManager placeActionManager](self, "placeActionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createRowActionsWithStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  -[MUPlaceEnrichmentActionManager placeActionManager](self, "placeActionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createFooterActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  -[MUPlaceEnrichmentActionManager placeActionManager](self, "placeActionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createContactActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__MUPlaceEnrichmentActionManager_supportedPlaceEnrichmentActions__block_invoke;
  v20[3] = &unk_1E2E03A18;
  v20[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v20);
  -[MUPlaceEnrichmentActionManager supportedActions](self, "supportedActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceEnrichmentActionManager directionsAction:](self, "directionsAction:", v11);

  -[MUPlaceEnrichmentActionManager supportedActions](self, "supportedActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceEnrichmentActionManager ratePlaceAction:](self, "ratePlaceAction:", v12);

  -[MUPlaceEnrichmentActionManager supportedActions](self, "supportedActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceEnrichmentActionManager addPhotoAction:](self, "addPhotoAction:", v13);

  -[MUPlaceEnrichmentActionManager supportedActions](self, "supportedActions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceEnrichmentActionManager getAppAction:](self, "getAppAction:", v14);

  -[MUPlaceEnrichmentActionManager supportedActions](self, "supportedActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceEnrichmentActionManager contextMenuAction:](self, "contextMenuAction:", v15);

  -[MUPlaceEnrichmentActionManager supportedActions](self, "supportedActions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceEnrichmentActionManager addExternalActionsAsSupportedActions:](self, "addExternalActionsAsSupportedActions:", v16);

  -[MUPlaceEnrichmentActionManager supportedActions](self, "supportedActions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");

  return v18;
}

void __65__MUPlaceEnrichmentActionManager_supportedPlaceEnrichmentActions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  MUPlaceEnrichmentAction *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  MUPlaceEnrichmentAction *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "type");
  switch(v3)
  {
    case 1:
      goto LABEL_4;
    case 2:
    case 3:
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 14:
    case 15:
    case 17:
    case 18:
    case 19:
    case 20:
      goto LABEL_15;
    case 4:
      v4 = [MUPlaceEnrichmentAction alloc];
      v5 = 10;
      v6 = 4;
      goto LABEL_13;
    case 5:
    case 22:
      v4 = [MUPlaceEnrichmentAction alloc];
      v5 = 9;
      v6 = 22;
      goto LABEL_13;
    case 10:
      if (!objc_msgSend(v11, "enabled"))
        goto LABEL_15;
      v4 = [MUPlaceEnrichmentAction alloc];
      v5 = 2;
      v6 = 10;
      goto LABEL_13;
    case 11:
      v4 = [MUPlaceEnrichmentAction alloc];
      v5 = 4;
      v6 = 11;
      goto LABEL_13;
    case 13:
      v4 = [MUPlaceEnrichmentAction alloc];
      v5 = 3;
      v6 = 13;
      goto LABEL_13;
    case 16:
      v4 = [MUPlaceEnrichmentAction alloc];
      v5 = 6;
      v6 = 16;
      goto LABEL_13;
    case 21:
      v4 = [MUPlaceEnrichmentAction alloc];
      v5 = 5;
      v6 = 21;
      goto LABEL_13;
    default:
      if (v3 != 32)
        goto LABEL_15;
LABEL_4:
      objc_msgSend(*(id *)(a1 + 32), "dataAvailability");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "supportsReportAnIssue");

      if (!v8)
        goto LABEL_15;
      v4 = [MUPlaceEnrichmentAction alloc];
      v5 = 11;
      v6 = 32;
LABEL_13:
      v9 = -[MUPlaceEnrichmentAction initWithActionType:isValidated:mkActionType:](v4, "initWithActionType:isValidated:mkActionType:", v5, 1, v6);
      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "supportedActions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v9);

      }
LABEL_15:

      return;
  }
}

- (id)dictionaryForAction:(id)a3
{
  return (id)objc_msgSend(a3, "enrichmentAction");
}

- (void)configureWithEnrichmentDataProvider:(id)a3 presentationOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MUGetMUPlaceEnrichmentActionManagerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_DEBUG, "Configuring enrichmentDataProvider: %@ and presentationOptions: %@", (uint8_t *)&v11, 0x16u);
  }

  -[MUPlaceEnrichmentActionManager setEnrichmentDataProvider:](self, "setEnrichmentDataProvider:", v6);
  -[MUPlaceEnrichmentActionManager setPresentationOptions:](self, "setPresentationOptions:", v7);
  -[MUPlaceEnrichmentActionManager presentationOptions](self, "presentationOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceEnrichmentActionManager setSourceView:](self, "setSourceView:", v10);

}

- (id)adamIDForAppCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MUPlaceEnrichmentActionManager externalActionsPairs](self, "externalActionsPairs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "viewModels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appAdamId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MUGetMUPlaceEnrichmentActionManagerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_DEBUG, "No app adamID found for appCategory: %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (void)performActionUsingArguments:(id)a3 contextMenu:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void (**v13)(void *, _QWORD);
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  _BOOL4 v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  NSObject *v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  void *v70;
  NSObject *v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  _BOOL4 v75;
  void *v76;
  const char *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  NSObject *v83;
  _BOOL4 v84;
  void *v85;
  id v86;
  id v87;
  void (**v88)(void);
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  NSObject *v94;
  __int128 *v95;
  _QWORD v96[4];
  void (**v97)(void *, _QWORD);
  _QWORD v98[4];
  id v99;
  __int128 *v100;
  _QWORD v101[7];
  BOOL v102;
  _QWORD v103[4];
  id v104;
  MUPlaceEnrichmentActionManager *v105;
  uint64_t *v106;
  uint64_t v107;
  BOOL v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  _QWORD aBlock[4];
  id v116;
  __int128 *p_buf;
  uint8_t v118[128];
  uint8_t v119[4];
  id v120;
  __int128 v121;
  uint64_t v122;
  char v123;
  _QWORD v124[2];
  _QWORD v125[2];
  __int128 buf;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  id v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v87 = a4;
  v9 = a5;
  MUGetMUPlaceEnrichmentActionManagerLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_DEBUG, "Performing action using arguments : %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v127 = 0x3032000000;
  v128 = __Block_byref_object_copy__7;
  v129 = __Block_byref_object_dispose__7;
  v130 = 0;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke;
  aBlock[3] = &unk_1E2E03A40;
  v12 = v9;
  v116 = v12;
  p_buf = &buf;
  v13 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__7;
  v113 = __Block_byref_object_dispose__7;
  v114 = 0;
  -[MUPlaceEnrichmentActionManager sourceView](self, "sourceView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom") == 0;

  v103[0] = v11;
  v103[1] = 3221225472;
  v103[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_8;
  v103[3] = &unk_1E2E03A68;
  v108 = v16;
  v17 = v8;
  v106 = &v109;
  v107 = 13;
  v104 = v17;
  v105 = self;
  v88 = (void (**)(void))_Block_copy(v103);
  v101[0] = v11;
  v101[1] = 3221225472;
  v101[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_13;
  v101[3] = &unk_1E2E03AB8;
  v102 = v16;
  v101[5] = &v109;
  v101[6] = 13;
  v101[4] = self;
  v18 = (void (**)(_QWORD))_Block_copy(v101);
  -[MUPlaceEnrichmentActionManager supportedActions](self, "supportedActions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count") == 0;

  if (v20)
  {
    MUGetMUPlaceEnrichmentActionManagerLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v121) = 0;
      _os_log_impl(&dword_191DB8000, v30, OS_LOG_TYPE_ERROR, "ERROR: Performing action as no supported actions.", (uint8_t *)&v121, 2u);
    }

    v13[2](v13, 0);
  }
  else
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", 0x1E2E144C8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", 0x1E2E144C8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceEnrichmentActionManager supportedActions](self, "supportedActions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v98[0] = v11;
      v98[1] = 3221225472;
      v98[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_16;
      v98[3] = &unk_1E2E03AE0;
      v86 = v23;
      v99 = v86;
      v100 = &buf;
      v25 = (id)objc_msgSend(v24, "objectsPassingTest:", v98);

      v26 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v26)
      {
        switch(objc_msgSend(v26, "actionType"))
        {
          case 0:
            MUGetMUPlaceEnrichmentActionManagerLog();
            v31 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              goto LABEL_15;
            LODWORD(v121) = 138412290;
            *(_QWORD *)((char *)&v121 + 4) = v17;
            v32 = "MUPlaceEnrichmentActionManagerUnknown action invoked from Showcase %@";
            goto LABEL_14;
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 9:
          case 10:
          case 11:
            v18[2](v18);
            v88[2]();
            objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", 40);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)v110[5];
            if (v28)
            {
              v29 = v28;
            }
            else
            {
              -[MUPlaceEnrichmentActionManager presentationOptions](self, "presentationOptions");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "sourceView");
              v29 = (id)objc_claimAutoreleasedReturnValue();

            }
            if (v87)
            {
              v35 = v87;

              v29 = v35;
            }
            v36 = *MEMORY[0x1E0CC16A8];
            v124[0] = *MEMORY[0x1E0CC16A0];
            v124[1] = v36;
            v125[0] = v27;
            v125[1] = v29;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 2);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CC18C8], "actionItemWithType:", objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "mkActionType"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUPlaceEnrichmentActionManager placeActionManager](self, "placeActionManager");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v96[0] = v11;
            v96[1] = 3221225472;
            v96[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_20;
            v96[3] = &unk_1E2E017C8;
            v97 = v13;
            objc_msgSend(v39, "performAction:options:completion:", v38, v37, v96);

            break;
          case 7:
            -[MUPlaceEnrichmentActionManager callToActionDelegate](self, "callToActionDelegate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUPlaceEnrichmentActionManager presentationOptions](self, "presentationOptions");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "presentPOIEnrichmentWithPresentationOptions:", v43);

            -[MUPlaceEnrichmentActionManager analyticsDelegate](self, "analyticsDelegate");
            v31 = objc_claimAutoreleasedReturnValue();
            -[NSObject didTapRatePlace](v31, "didTapRatePlace");
            goto LABEL_50;
          case 8:
            v18[2](v18);
            v88[2]();
            v40 = v110[5];
            if (v40)
            {
              v41 = (void *)v110[5];
            }
            else
            {
              -[MUPlaceEnrichmentActionManager presentationOptions](self, "presentationOptions");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "sourceView");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[MUPlaceEnrichmentActionManager presentationOptions](self, "presentationOptions");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setSourceView:", v41);

            if (!v40)
            {

            }
            -[MUPlaceEnrichmentActionManager callToActionDelegate](self, "callToActionDelegate");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUPlaceEnrichmentActionManager presentationOptions](self, "presentationOptions");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "presentAddPhotosWithPresentationOptions:entryPoint:originTarget:", v66, 0, 0);

            -[MUPlaceEnrichmentActionManager analyticsDelegate](self, "analyticsDelegate");
            v31 = objc_claimAutoreleasedReturnValue();
            -[NSObject didTapAddPhoto](v31, "didTapAddPhoto");
LABEL_50:
            v33 = 1;
            goto LABEL_16;
          case 12:
            *(_QWORD *)&v121 = 0;
            *((_QWORD *)&v121 + 1) = &v121;
            v122 = 0x2020000000;
            v123 = 0;
            objc_msgSend(v17, "objectForKeyedSubscript:", 0x1E2E14508);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v17, "objectForKeyedSubscript:", 0x1E2E14508);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = v45 != 0;

            }
            else
            {
              v84 = 0;
            }

            objc_msgSend(v17, "objectForKeyedSubscript:", 0x1E2E144E8);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v17, "objectForKeyedSubscript:", 0x1E2E144E8);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v47 != 0;

              if (v84 && v48)
              {
                objc_msgSend(v17, "objectForKeyedSubscript:", 0x1E2E14508);
                v49 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKeyedSubscript:", 0x1E2E144E8);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = NSBOOLFromString();

                if (v49)
                  v52 = v51;
                else
                  v52 = 0;
                if (v52 != 1)
                {
                  MUGetMUPlaceEnrichmentActionManagerLog();
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v119 = 138412290;
                    v120 = v17;
                    _os_log_impl(&dword_191DB8000, v54, OS_LOG_TYPE_ERROR, "Action arguments not valid for External Action: %@", v119, 0xCu);
                  }
                  goto LABEL_80;
                }
                -[MUPlaceEnrichmentActionManager externalActionsPairs](self, "externalActionsPairs");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKey:", v49);
                v54 = objc_claimAutoreleasedReturnValue();

                MUGetMUPlaceEnrichmentActionManagerLog();
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                {
                  v56 = *(void **)(*((_QWORD *)&buf + 1) + 40);
                  *(_DWORD *)v119 = 138412290;
                  v120 = v56;
                  _os_log_impl(&dword_191DB8000, v55, OS_LOG_TYPE_DEBUG, "Opening external action for showcase: %@", v119, 0xCu);
                }

                -[MUPlaceEnrichmentActionManager enrichmentDataProvider](self, "enrichmentDataProvider");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "placeEnrichmentData");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "enrichmentEntities");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "firstObject");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "appAdamIds");
                v85 = (void *)objc_claimAutoreleasedReturnValue();

                v60 = objc_msgSend(v85, "count");
                MUGetMUPlaceEnrichmentActionManagerLog();
                v61 = objc_claimAutoreleasedReturnValue();
                v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG);
                if (v60)
                {
                  if (v62)
                  {
                    *(_DWORD *)v119 = 138412290;
                    v120 = v85;
                    _os_log_impl(&dword_191DB8000, v61, OS_LOG_TYPE_DEBUG, "AdamId's found were %@", v119, 0xCu);
                  }

                  v93[0] = v11;
                  v93[1] = 3221225472;
                  v93[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_21;
                  v93[3] = &unk_1E2E03B30;
                  v94 = v54;
                  v95 = &v121;
                  objc_msgSend(v85, "enumerateObjectsUsingBlock:", v93);
                  v63 = v94;
                  goto LABEL_67;
                }
                if (v62)
                {
                  *(_WORD *)v119 = 0;
                  _os_log_impl(&dword_191DB8000, v61, OS_LOG_TYPE_DEBUG, "No AdamIds were found which means that we need to execute a flexible action link.", v119, 2u);
                }

                v91 = 0u;
                v92 = 0u;
                v89 = 0u;
                v90 = 0u;
                -[NSObject viewModels](v54, "viewModels");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v67 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v89, v118, 16);
                if (v67)
                {
                  v83 = v54;
                  v68 = *(_QWORD *)v90;
                  while (1)
                  {
                    for (i = 0; i != v67; ++i)
                    {
                      if (*(_QWORD *)v90 != v68)
                        objc_enumerationMutation(v63);
                      v70 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
                      if (objc_msgSend(v70, "linkType") == 4)
                      {
                        MUGetMUPlaceEnrichmentActionManagerLog();
                        v71 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)v119 = 138412290;
                          v120 = v70;
                          _os_log_impl(&dword_191DB8000, v71, OS_LOG_TYPE_DEBUG, "Found a web link with view model %@", v119, 0xCu);
                        }

                        v54 = v83;
                        -[NSObject actionController](v83, "actionController");
                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v72, "openPartnerActionUsingViewModel:", v70);

                        *(_BYTE *)(*((_QWORD *)&v121 + 1) + 24) = 1;
                        goto LABEL_67;
                      }
                    }
                    v67 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v89, v118, 16);
                    if (!v67)
                    {
                      v54 = v83;
                      break;
                    }
                  }
                }
LABEL_67:

                if (*(_BYTE *)(*((_QWORD *)&v121 + 1) + 24))
                {
LABEL_79:

LABEL_80:
                  goto LABEL_81;
                }
                v73 = objc_msgSend(v85, "count");
                MUGetMUPlaceEnrichmentActionManagerLog();
                v74 = objc_claimAutoreleasedReturnValue();
                v75 = os_log_type_enabled(v74, OS_LOG_TYPE_ERROR);
                if (v73)
                {
                  if (v75)
                  {
                    v76 = *(void **)(*((_QWORD *)&buf + 1) + 40);
                    *(_DWORD *)v119 = 138412290;
                    v120 = v76;
                    v77 = "Failed to invoke action: %@ as there are no view models with appAdamIDs that match the showcas"
                          "e specific appAdamIDs";
LABEL_73:
                    _os_log_impl(&dword_191DB8000, v74, OS_LOG_TYPE_ERROR, v77, v119, 0xCu);
                  }
                }
                else if (v75)
                {
                  v78 = *(void **)(*((_QWORD *)&buf + 1) + 40);
                  *(_DWORD *)v119 = 138412290;
                  v120 = v78;
                  v77 = "Failed to invoke action: %@ as there are no view models with flexible action links";
                  goto LABEL_73;
                }

                MUGetMUPlaceEnrichmentActionManagerLog();
                v79 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                {
                  -[NSObject viewModels](v54, "viewModels");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v119 = 138412290;
                  v120 = v80;
                  _os_log_impl(&dword_191DB8000, v79, OS_LOG_TYPE_ERROR, "--> MapItem external action view models : %@", v119, 0xCu);

                }
                MUGetMUPlaceEnrichmentActionManagerLog();
                v81 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v119 = 138412290;
                  v120 = v85;
                  _os_log_impl(&dword_191DB8000, v81, OS_LOG_TYPE_ERROR, "--> Showcase ordered appAdamIds: %@", v119, 0xCu);
                }

                goto LABEL_79;
              }
            }
            else
            {

            }
            MUGetMUPlaceEnrichmentActionManagerLog();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v119 = 138412290;
              v120 = v17;
              _os_log_impl(&dword_191DB8000, v49, OS_LOG_TYPE_ERROR, "Action arguments missing arguments needed to invoke external action: %@", v119, 0xCu);
            }
LABEL_81:

            v13[2](v13, *(unsigned __int8 *)(*((_QWORD *)&v121 + 1) + 24));
            _Block_object_dispose(&v121, 8);
            break;
          default:
            break;
        }
      }
      else
      {
        MUGetMUPlaceEnrichmentActionManagerLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v121) = 138412290;
          *(_QWORD *)((char *)&v121 + 4) = v17;
          v32 = "ERROR: Unsupported action invoked from Showcase %@";
LABEL_14:
          _os_log_impl(&dword_191DB8000, v31, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v121, 0xCu);
        }
LABEL_15:
        v33 = 0;
LABEL_16:

        v13[2](v13, v33);
      }

    }
  }

  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&buf, 8);

}

uint64_t __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    MUGetMUPlaceEnrichmentActionManagerLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40);
      NSStringFromBOOL();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412546;
      v6 = v3;
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_191DB8000, v2, OS_LOG_TYPE_DEBUG, "Invoking completion handler for action: %@. Performed Action: (%@)", (uint8_t *)&v5, 0x16u);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

void __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  CGRect v31;

  v30 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", 0x1E2E14548);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", 0x1E2E14548);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (v2)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", 0x1E2E14548);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", 0x1E2E145A8);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "doubleValue");
        v6 = v5;
        objc_msgSend(v3, "objectForKeyedSubscript:", 0x1E2E145C8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "doubleValue");
        v9 = v8;
        objc_msgSend(v3, "objectForKeyedSubscript:", 0x1E2E14588);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;
        objc_msgSend(v3, "objectForKeyedSubscript:", 0x1E2E14568);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v9, v12, v15);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

        if (GEOConfigGetBOOL())
        {
          v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setBackgroundColor:", v20);

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAlpha:", 0.1);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setUserInteractionEnabled:", 0);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setTag:", *(_QWORD *)(a1 + 56));
        objc_msgSend(*(id *)(a1 + 40), "sourceView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

        MUGetMUPlaceEnrichmentActionManagerLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v31.origin.x = v6;
          v31.origin.y = v9;
          v31.size.width = v12;
          v31.size.height = v15;
          NSStringFromCGRect(v31);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          v27 = v23;
          v28 = 2112;
          v29 = v24;
          _os_log_impl(&dword_191DB8000, v22, OS_LOG_TYPE_DEBUG, "Added a dummy view at: %@. View: %@", buf, 0x16u);

        }
      }
    }
    else
    {

    }
  }
}

void __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[6];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_2;
    v8[3] = &unk_1E2E03A90;
    v4 = *(_QWORD *)(a1 + 48);
    v8[4] = *(_QWORD *)(a1 + 40);
    v8[5] = v4;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      objc_msgSend(v5, "removeFromSuperview");
      MUGetMUPlaceEnrichmentActionManagerLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v10 = v7;
        _os_log_impl(&dword_191DB8000, v6, OS_LOG_TYPE_DEBUG, "Removed a dummy view at: %@", buf, 0xCu);
      }

    }
  }
}

void __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "tag") == *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_16(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  uint64_t v10;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v6, "actionType") - 1;
  if (v8 > 0xD)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1E2E03C28[v8];
  v10 = objc_msgSend(v7, "isEqualToString:", v9);
  if ((_DWORD)v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

  return v10;
}

uint64_t __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_21(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "viewModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_2_22;
  v11[3] = &unk_1E2E03B08;
  v12 = v6;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

}

void __85__MUPlaceEnrichmentActionManager_performActionUsingArguments_contextMenu_completion___block_invoke_2_22(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "appAdamId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    MUGetMUPlaceEnrichmentActionManagerLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_191DB8000, v9, OS_LOG_TYPE_DEBUG, "Showcase action will be executed using app adam ID: %@. View Model: %@", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "actionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openPartnerActionUsingViewModel:", v6);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    **(_BYTE **)(a1 + 56) = 1;
  }

}

- (void)layoutActionsUsingArguments:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char isKindOfClass;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MUPlaceEnrichmentAction *v25;
  void *v26;
  MUPlaceEnrichmentAction *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __CFString *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E144C8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      MUGetMUPlaceEnrichmentActionManagerLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v9;
        _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_ERROR, "ERROR: Arguments is missing actionKey. Arguments: %@", buf, 0xCu);
      }
      goto LABEL_28;
    }
    -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E144C8);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("MUPlaceEnrichmentActionManagerContextMenu")))
    {
      MUGetMUPlaceEnrichmentActionManagerLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v9;
        _os_log_impl(&dword_191DB8000, v16, OS_LOG_TYPE_ERROR, "ERROR: Trying it layout action that is not supported. Arguments: %@", buf, 0xCu);
      }
      goto LABEL_27;
    }
    -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E144E8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E144E8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v15 != 0;

    }
    else
    {
      v33 = 0;
    }

    -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E14548);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E14548);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v18 != 0;

    }
    else
    {
      v32 = 0;
    }

    -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E14528);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E14528);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33 && v32 && v20)
      {
        -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E14548);
        v16 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E14528);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPlaceEnrichmentActionManager contextMenuDelegate](self, "contextMenuDelegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addContextMenuUsingBoundingBox:accessibilityLabel:", v16, v21);

        -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E145E8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E145E8);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
LABEL_23:

LABEL_27:
LABEL_28:

            goto LABEL_29;
          }
          -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", 0x1E2E145E8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = [MUPlaceEnrichmentAction alloc];
          v44 = CFSTR("subActions");
          v45[0] = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[MUPlaceEnrichmentAction initWithActionType:isValidated:mkActionType:metadata:](v25, "initWithActionType:isValidated:mkActionType:metadata:", 13, 1, 0, v26);

          -[MUPlaceEnrichmentActionManager contextMenuDelegate](self, "contextMenuDelegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __73__MUPlaceEnrichmentActionManager_layoutActionsUsingArguments_completion___block_invoke;
          v34[3] = &unk_1E2E02EC0;
          v35 = v7;
          objc_msgSend(v28, "didLayoutContextMenu:completion:", v27, v34);

        }
        goto LABEL_23;
      }
    }
    else
    {

    }
    MUGetMUPlaceEnrichmentActionManagerLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSStringFromBOOL();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v37 = v29;
      v38 = 2112;
      v39 = v30;
      v40 = 2112;
      v41 = v31;
      v42 = 2112;
      v43 = v9;
      _os_log_impl(&dword_191DB8000, v16, OS_LOG_TYPE_ERROR, "ERROR: layout action arguments are not correct. isValidated:%@, boundingBoxValid:%@, accessibilityLabelValid:%@, \nArguments: %@", buf, 0x2Au);

    }
    goto LABEL_27;
  }
  MUGetMUPlaceEnrichmentActionManagerLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v37 = 0;
    _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_ERROR, "ERROR: missing top level arguments for layoutActions callback: %@", buf, 0xCu);
  }
LABEL_29:

}

uint64_t __73__MUPlaceEnrichmentActionManager_layoutActionsUsingArguments_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)directionsAction:(id)a3
{
  void *v4;
  int v5;
  MUPlaceEnrichmentAction *v6;
  id v7;

  v7 = a3;
  -[MUPlaceEnrichmentActionManager dataAvailability](self, "dataAvailability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canShowDirections");

  if (v5)
  {
    v6 = -[MUPlaceEnrichmentAction initWithActionType:isValidated:mkActionType:]([MUPlaceEnrichmentAction alloc], "initWithActionType:isValidated:mkActionType:", 1, 1, 30);
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (void)ratePlaceAction:(id)a3
{
  void *v4;
  void *v5;
  MUPlaceEnrichmentAction *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1E0CC18A8];
  -[MUPlaceEnrichmentActionManager mapItem](self, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "shouldShowRatingsCallToActionForMapItem:", v5);

  if ((_DWORD)v4)
  {
    v6 = -[MUPlaceEnrichmentAction initWithActionType:isValidated:mkActionType:]([MUPlaceEnrichmentAction alloc], "initWithActionType:isValidated:mkActionType:", 7, 1, 0);
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (void)addPhotoAction:(id)a3
{
  void *v4;
  void *v5;
  MUPlaceEnrichmentAction *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1E0CC18A8];
  -[MUPlaceEnrichmentActionManager mapItem](self, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "shouldShowPhotosCallToActionForMapItem:", v5);

  if ((_DWORD)v4)
  {
    v6 = -[MUPlaceEnrichmentAction initWithActionType:isValidated:mkActionType:]([MUPlaceEnrichmentAction alloc], "initWithActionType:isValidated:mkActionType:", 8, 1, 9);
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (void)getAppAction:(id)a3
{
  void *v4;
  int v5;
  MUPlaceEnrichmentAction *v6;
  id v7;

  v7 = a3;
  -[MUPlaceEnrichmentActionManager dataAvailability](self, "dataAvailability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "suportsOfficialApp");

  if (v5)
  {
    v6 = -[MUPlaceEnrichmentAction initWithActionType:isValidated:mkActionType:]([MUPlaceEnrichmentAction alloc], "initWithActionType:isValidated:mkActionType:", 14, 1, 26);
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (void)contextMenuAction:(id)a3
{
  id v3;
  MUPlaceEnrichmentAction *v4;

  v3 = a3;
  v4 = -[MUPlaceEnrichmentAction initWithActionType:isValidated:mkActionType:]([MUPlaceEnrichmentAction alloc], "initWithActionType:isValidated:mkActionType:", 13, 1, 0);
  objc_msgSend(v3, "addObject:", v4);

}

- (void)addExternalActionsAsSupportedActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  dispatch_group_t v28;
  id v29;
  MUPlaceEnrichmentActionManager *v30;
  _QWORD v31[4];
  NSObject *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MUPlaceEnrichmentActionManager mapItem](self, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_externalActionLinks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPlaceEnrichmentActionManager enrichmentDataProvider](self, "enrichmentDataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placeEnrichmentData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enrichmentEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appAdamIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  v13 = (void *)MEMORY[0x1E0CB3880];
  v14 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke;
    v31[3] = &unk_1E2E03B58;
    v15 = v11;
    v32 = v15;
    objc_msgSend(v13, "predicateWithBlock:", v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    MUGetMUPlaceEnrichmentActionManagerLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v17;
      v35 = 2112;
      v36 = v15;
      _os_log_impl(&dword_191DB8000, v18, OS_LOG_TYPE_INFO, "Filtered showcase external actions are: %@. Showcase app adamIDs: %@", buf, 0x16u);
    }

    v19 = v32;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_40);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    MUGetMUPlaceEnrichmentActionManagerLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v17;
      _os_log_impl(&dword_191DB8000, v19, OS_LOG_TYPE_INFO, "Showcase external are: %@. These actions contain providers with no app adam id which is expected because these are not backed by an app store app.", buf, 0xCu);
    }
  }

  if (objc_msgSend(v17, "count")
    || (-[MUPlaceEnrichmentActionManager onActionUpdate](self, "onActionUpdate"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v23,
        !v23))
  {
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_31;
    v27[3] = &unk_1E2E03BE8;
    v28 = dispatch_group_create();
    v29 = v4;
    v30 = self;
    v21 = v28;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v27);
    objc_initWeak((id *)buf, self);
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_36;
    v25[3] = &unk_1E2E01AB0;
    objc_copyWeak(&v26, (id *)buf);
    v25[4] = self;
    dispatch_group_notify(v21, MEMORY[0x1E0C80D38], v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

    v22 = v28;
  }
  else
  {
    MUGetMUPlaceEnrichmentActionManagerLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v24, OS_LOG_TYPE_INFO, "Showcase external actions are not applicable as no adam ids were found.", buf, 2u);
    }

    -[MUPlaceEnrichmentActionManager onActionUpdate](self, "onActionUpdate");
    v21 = objc_claimAutoreleasedReturnValue();
    -[MUPlaceEnrichmentActionManager supportedActions](self, "supportedActions");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(NSObject *, id))v21[2].isa)(v21, v22);
  }

}

uint64_t __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "appAdamIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "intersectsSet:", v4);

  return v5;
}

uint64_t __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_30(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a2, "actionProviders", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "appAdamId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "length");

        if (!v7)
        {
          v3 = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

void __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  MUPlaceEnrichmentAction *v7;
  void *v8;
  void *v9;
  MUPlaceEnrichmentAction *v10;
  MUGroupedExternalActionController *v11;
  void *v12;
  void *v13;
  void *v14;
  MUGroupedExternalActionController *v15;
  void *v16;
  void *v17;
  void *v18;
  MUPlaceEnrichmentAction *v19;
  _QWORD v20[4];
  id v21;
  MUPlaceEnrichmentAction *v22;
  id v23;
  id v24[2];
  id location;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(v5, "categoryId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [MUPlaceEnrichmentAction alloc];
    v26 = CFSTR("appCategory");
    objc_msgSend(v5, "categoryId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MUPlaceEnrichmentAction initWithActionType:isValidated:mkActionType:metadata:](v7, "initWithActionType:isValidated:mkActionType:metadata:", 12, 0, 0, v9);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    v11 = [MUGroupedExternalActionController alloc];
    objc_msgSend(*(id *)(a1 + 48), "amsResultProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "externalActionHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "analyticsDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MUGroupedExternalActionController initWithGroupedExternalAction:amsResultProvider:supportsMultipleVendorSelection:actionHandler:analyticsHandler:](v11, "initWithGroupedExternalAction:amsResultProvider:supportsMultipleVendorSelection:actionHandler:analyticsHandler:", v5, v12, 0, v13, v14);

    -[MUGroupedExternalActionController setSingleVendorAnalyticsTarget:](v15, "setSingleVendorAnalyticsTarget:", 201);
    -[MUGroupedExternalActionController setMultipleVendorAnalyticsTarget:](v15, "setMultipleVendorAnalyticsTarget:", 201);
    -[MUGroupedExternalActionController setAnalyticsModuleType:](v15, "setAnalyticsModuleType:", 5);
    -[MUGroupedExternalActionController setSource:](v15, "setSource:", 11);
    objc_msgSend(*(id *)(a1 + 48), "externalActionsControllers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v15);

    objc_initWeak(&location, *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 48), "externalActionsControllers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_2;
    v20[3] = &unk_1E2E03BC0;
    objc_copyWeak(v24, &location);
    v24[1] = a3;
    v21 = v5;
    v19 = v10;
    v22 = v19;
    v23 = *(id *)(a1 + 32);
    objc_msgSend(v18, "fetchProviderLockupsWithCompletion:", v20);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);

  }
}

void __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  MUExternalActionPair *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  MUPlaceEnrichmentAction *v12;
  void *v13;
  void *v14;
  MUPlaceEnrichmentAction *v15;
  void *v16;
  int v17;
  MUPlaceEnrichmentAction *v18;
  __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (objc_msgSend(v3, "count"))
    {
      v5 = [MUExternalActionPair alloc];
      objc_msgSend(WeakRetained, "externalActionsControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", *(_QWORD *)(a1 + 64));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MUExternalActionPair initWithAction:actionController:](v5, "initWithAction:actionController:", v3, v7);

      objc_msgSend(WeakRetained, "externalActionsPairs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "categoryId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v10);

      objc_msgSend(WeakRetained, "supportedActions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObject:", *(_QWORD *)(a1 + 40));

      v12 = [MUPlaceEnrichmentAction alloc];
      v19 = CFSTR("appCategory");
      objc_msgSend(*(id *)(a1 + 32), "categoryId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MUPlaceEnrichmentAction initWithActionType:isValidated:mkActionType:metadata:](v12, "initWithActionType:isValidated:mkActionType:metadata:", 12, 1, 0, v14);

      objc_msgSend(WeakRetained, "supportedActions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v15);

    }
    else
    {
      MUGetMUPlaceEnrichmentActionManagerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
        goto LABEL_8;
      }
      objc_msgSend(*(id *)(a1 + 32), "actionName");
      v15 = (MUPlaceEnrichmentAction *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_ERROR, "Unable to fetch lockups for action: %@", (uint8_t *)&v17, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_8:

}

void __71__MUPlaceEnrichmentActionManager_addExternalActionsAsSupportedActions___block_invoke_36(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    MUGetMUPlaceEnrichmentActionManagerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "externalActionsPairs");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_191DB8000, v3, OS_LOG_TYPE_DEBUG, "Fetched view models for all actions: %@", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "onActionUpdate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      MUGetMUPlaceEnrichmentActionManagerLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_191DB8000, v6, OS_LOG_TYPE_INFO, "Informing Enrichment section controller about external extensions validation.", (uint8_t *)&v9, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "onActionUpdate");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "supportedActions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v7)[2](v7, v8);

    }
  }

}

- (MUPlaceActionManager)placeActionManager
{
  return self->_placeActionManager;
}

- (void)setPlaceActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_placeActionManager, a3);
}

- (MUPlaceEnrichmentDataProvider)enrichmentDataProvider
{
  return self->_enrichmentDataProvider;
}

- (void)setEnrichmentDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_enrichmentDataProvider, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (MUPlaceDataAvailability)dataAvailability
{
  return self->_dataAvailability;
}

- (void)setDataAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_dataAvailability, a3);
}

- (NSMutableSet)supportedActions
{
  return self->_supportedActions;
}

- (void)setSupportedActions:(id)a3
{
  objc_storeStrong((id *)&self->_supportedActions, a3);
}

- (MUPlaceCallToActionSectionControllerDelegate)callToActionDelegate
{
  return (MUPlaceCallToActionSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_callToActionDelegate);
}

- (void)setCallToActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_callToActionDelegate, a3);
}

- (MUPlaceEnrichmentSectionContextMenuDelegate)contextMenuDelegate
{
  return (MUPlaceEnrichmentSectionContextMenuDelegate *)objc_loadWeakRetained((id *)&self->_contextMenuDelegate);
}

- (void)setContextMenuDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contextMenuDelegate, a3);
}

- (MUExternalActionHandling)externalActionHandler
{
  return (MUExternalActionHandling *)objc_loadWeakRetained((id *)&self->_externalActionHandler);
}

- (void)setExternalActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_externalActionHandler, a3);
}

- (MUPlaceEnrichmentSectionAnalyticsDelegate)analyticsDelegate
{
  return (MUPlaceEnrichmentSectionAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (NSMutableDictionary)externalActionsPairs
{
  return self->_externalActionsPairs;
}

- (void)setExternalActionsPairs:(id)a3
{
  objc_storeStrong((id *)&self->_externalActionsPairs, a3);
}

- (NSMutableArray)externalActionsControllers
{
  return self->_externalActionsControllers;
}

- (void)setExternalActionsControllers:(id)a3
{
  objc_storeStrong((id *)&self->_externalActionsControllers, a3);
}

- (id)onActionUpdate
{
  return self->_onActionUpdate;
}

- (void)setOnActionUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (MUPresentationOptions)presentationOptions
{
  return self->_presentationOptions;
}

- (void)setPresentationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_presentationOptions, a3);
}

- (MUAMSResultProvider)amsResultProvider
{
  return self->_amsResultProvider;
}

- (void)setAmsResultProvider:(id)a3
{
  objc_storeStrong((id *)&self->_amsResultProvider, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_amsResultProvider, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong(&self->_onActionUpdate, 0);
  objc_storeStrong((id *)&self->_externalActionsControllers, 0);
  objc_storeStrong((id *)&self->_externalActionsPairs, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_externalActionHandler);
  objc_destroyWeak((id *)&self->_contextMenuDelegate);
  objc_destroyWeak((id *)&self->_callToActionDelegate);
  objc_storeStrong((id *)&self->_supportedActions, 0);
  objc_storeStrong((id *)&self->_dataAvailability, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_enrichmentDataProvider, 0);
  objc_storeStrong((id *)&self->_placeActionManager, 0);
}

@end

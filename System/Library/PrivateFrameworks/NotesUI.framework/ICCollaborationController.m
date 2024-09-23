@implementation ICCollaborationController

+ (ICCollaborationController)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_57);
  return (ICCollaborationController *)(id)sharedInstance_instance;
}

void __43__ICCollaborationController_sharedInstance__block_invoke()
{
  ICCollaborationController *v0;
  void *v1;

  v0 = -[ICCollaborationController initWithDelegate:]([ICCollaborationController alloc], "initWithDelegate:", 0);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (ICCollaborationController)initWithDelegate:(id)a3
{
  id v4;
  ICCollaborationController *v5;
  ICCollaborationController *v6;
  uint64_t v7;
  NSMutableDictionary *ckShareIDToRootRecordID;
  uint64_t v9;
  ICSelectorDelayer *updateSharesDelayer;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICCollaborationController;
  v5 = -[ICCollaborationController init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collaborationControllerDelegate, v4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    ckShareIDToRootRecordID = v6->_ckShareIDToRootRecordID;
    v6->_ckShareIDToRootRecordID = (NSMutableDictionary *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v6, sel_updateShares, 1, 1, 3.0);
    updateSharesDelayer = v6->_updateSharesDelayer;
    v6->_updateSharesDelayer = (ICSelectorDelayer *)v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel_managedObjectContextObjectsDidChange_, *MEMORY[0x1E0C978B0], 0);

    -[ICCollaborationController updateSharesDelayer](v6, "updateSharesDelayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestFire");

  }
  return v6;
}

- (void)setCollaborationAnalyticsDelegate:(id)a3
{
  ICCollaborationAnalyticsTracker *v4;
  ICCollaborationAnalyticsTracker *collaborationAnalyticsTracker;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_collaborationAnalyticsDelegate, v6);
  if (v6)
  {
    v4 = -[ICCollaborationAnalyticsTracker initWithDelegate:]([ICCollaborationAnalyticsTracker alloc], "initWithDelegate:", v6);
    collaborationAnalyticsTracker = self->_collaborationAnalyticsTracker;
    self->_collaborationAnalyticsTracker = v4;
  }
  else
  {
    collaborationAnalyticsTracker = self->_collaborationAnalyticsTracker;
    self->_collaborationAnalyticsTracker = 0;
  }

}

- (id)viewContext
{
  void *v3;
  void *v4;
  void *v5;

  -[ICCollaborationController collaborationControllerDelegate](self, "collaborationControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICCollaborationController collaborationControllerDelegate](self, "collaborationControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewContextForCollaborationController:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)backgroundContext
{
  void *v3;
  void *v4;
  void *v5;

  -[ICCollaborationController collaborationControllerDelegate](self, "collaborationControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICCollaborationController collaborationControllerDelegate](self, "collaborationControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundContextForCollaborationController:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workerManagedObjectContext");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cloudContext
{
  void *v3;
  void *v4;
  void *v5;

  -[ICCollaborationController collaborationControllerDelegate](self, "collaborationControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICCollaborationController collaborationControllerDelegate](self, "collaborationControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudContextForCollaborationController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D63A80], "sharedContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)registerShareForObject:(id)a3 itemProvider:(id)a4 generateThumbnails:(BOOL)a5
{
  -[ICCollaborationController registerShareForObject:itemProvider:generateThumbnails:sharePreparationHandler:](self, "registerShareForObject:itemProvider:generateThumbnails:sharePreparationHandler:", a3, a4, a5, 0);
}

- (void)registerShareForObject:(id)a3 itemProvider:(id)a4 generateThumbnails:(BOOL)a5 sharePreparationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  os_signpost_id_t v29;
  BOOL v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "shortLoggingDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v14;
    _os_log_impl(&dword_1AC7A1000, v13, OS_LOG_TYPE_INFO, "Registering cloud sharing service for %@", buf, 0xCu);

  }
  v15 = os_log_create("com.apple.notes", "Collaboration");
  v16 = os_signpost_id_generate(v15);
  v17 = v15;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "com.apple.notes.collaboration.registerShare", ", buf, 2u);
  }

  objc_msgSend(v10, "cloudAccount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "accountType") == 1)
  {
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");

    if (v21)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke;
      v23[3] = &unk_1E5C21DF0;
      v23[4] = self;
      v24 = v19;
      v25 = v10;
      v26 = v11;
      v28 = v12;
      v30 = a5;
      v27 = v18;
      v29 = v16;
      objc_msgSend(v24, "performBlockInPersonaContext:", v23);

    }
    else
    {
      v22 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ICCollaborationController registerShareForObject:itemProvider:generateThumbnails:sharePreparationHandler:].cold.1();

    }
  }

}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerForAccountID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_class();
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverShareCheckingParent:managedObjectContext:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = os_log_create("com.apple.notes", "Collaboration");
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
        __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_3((uint64_t)v8, (id *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 32), "updateRootRecordMapWithShare:", v8);
      v11 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C94BA8], "standardOptions");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "registerCKShare:container:allowedSharingOptions:", v8, v4, v12);
    }
    else
    {
      if (v10)
        __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_2((id *)(a1 + 48));

      v13 = _Block_copy(*(const void **)(a1 + 72));
      if (v13)
        v14 = v13;
      else
        v14 = &__block_literal_global_26;
      if (*(_BYTE *)(a1 + 88))
        objc_msgSend(MEMORY[0x1E0C95110], "ic_cacheThumbnailsForObject:", *(_QWORD *)(a1 + 48));
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_2;
      v25 = &unk_1E5C21DC8;
      v30 = v14;
      v15 = *(id *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 32);
      v26 = v15;
      v27 = v16;
      v28 = *(id *)(a1 + 48);
      v17 = *(id *)(a1 + 64);
      v18 = *(_QWORD *)(a1 + 80);
      v29 = v17;
      v31 = v18;
      v12 = v14;
      v19 = _Block_copy(&v22);
      v20 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C94BA8], "standardOptions", v22, v23, v24, v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "registerCKShareWithContainer:allowedSharingOptions:preparationHandler:", v4, v21, v19);

    }
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_1();
  }

}

uint64_t __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_24(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD *);
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 64);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_3;
  v12[3] = &unk_1E5C21DA0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v17 = v3;
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 72);
  v16 = v8;
  v18 = v9;
  v10 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
  v11 = v3;
  v10(v4, v12);

}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_4;
  v8[3] = &unk_1E5C21DA0;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v13 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 72);
  v12 = v6;
  v14 = v7;
  objc_msgSend(v2, "performBlock:", v8);

}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_5;
  v5[3] = &unk_1E5C21DA0;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 64);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 72);
  v8 = v3;
  v10 = v4;
  objc_msgSend(v2, "performBlockInPersonaContext:", v5);

}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v2 = (void *)objc_msgSend((id)objc_opt_class(), "newShareForObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateRootRecordMapWithShare:", v2);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_6;
  v10[3] = &unk_1E5C21D78;
  v11 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 72);
  v12 = v6;
  v13 = v3;
  v8 = *(_QWORD *)(a1 + 32);
  v16 = v7;
  v14 = v8;
  v9 = v3;
  objc_msgSend(v4, "prepareShare:forObject:qualityOfService:completionHandler:", v2, v5, 25, v10);

}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[8];
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_7;
  v19[3] = &unk_1E5C1FE08;
  v22 = *(id *)(a1 + 64);
  v8 = v5;
  v20 = v8;
  v9 = v6;
  v21 = v9;
  objc_msgSend(v7, "performBlockInPersonaContext:", v19);
  v10 = *(id *)(a1 + 40);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v11, OS_SIGNPOST_INTERVAL_END, v12, "com.apple.notes.collaboration.registerShare", ", v18, 2u);
  }

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ic_setNonNilObject:forNonNilKey:", v8, *MEMORY[0x1E0D63858]);
    objc_msgSend(v13, "ic_setNonNilObject:forNonNilKey:", *(_QWORD *)(a1 + 48), *MEMORY[0x1E0D63850]);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0D63848];
    v16 = *(_QWORD *)(a1 + 56);
    v17 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v14, "postNotificationName:object:userInfo:", v15, v16, v17);

  }
}

uint64_t __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_7(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (int64_t)shareStatusOfFolder:(id)a3 objectsForMakingDecision:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    objc_msgSend(v5, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__ICCollaborationController_shareStatusOfFolder_objectsForMakingDecision___block_invoke;
    v10[3] = &unk_1E5C1E760;
    v11 = v5;
    v13 = &v14;
    v12 = v6;
    objc_msgSend(v8, "performBlockAndWait:", v10);

    v7 = (void *)v15[3];
    _Block_object_dispose(&v14, 8);
  }

  return (int64_t)v7;
}

uint64_t __74__ICCollaborationController_shareStatusOfFolder_objectsForMakingDecision___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  void *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "isSharedViaICloud");
  if ((result & 1) != 0)
  {
    v3 = 2;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "canBeSharedViaICloud");
    if ((_DWORD)result)
    {
      v4 = *(void **)(a1 + 40);
      +[ICMoveDecision objectsForMakingDecisionForNonSharedFolder:](ICMoveDecision, "objectsForMakingDecisionForNonSharedFolder:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v5);

      result = objc_msgSend(*(id *)(a1 + 40), "ic_containsObjectPassingTest:", &__block_literal_global_33_0);
      if ((result & 1) != 0)
      {
        v3 = 4;
      }
      else
      {
        result = objc_msgSend(*(id *)(a1 + 40), "ic_containsObjectPassingTest:", &__block_literal_global_34_0);
        if (!(_DWORD)result)
          return result;
        v3 = 5;
      }
    }
    else
    {
      v3 = 3;
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

uint64_t __74__ICCollaborationController_shareStatusOfFolder_objectsForMakingDecision___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isSharedRootObject") && !objc_msgSend(v2, "isOwnedByCurrentUser"))
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isPasswordProtected");

  return v3;
}

uint64_t __74__ICCollaborationController_shareStatusOfFolder_objectsForMakingDecision___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isSharedRootObject"))
    v3 = objc_msgSend(v2, "isOwnedByCurrentUser");
  else
    v3 = 0;

  return v3;
}

+ (UIImage)shareSheetNoteThumbnailImage
{
  if (shareSheetNoteThumbnailImage_onceToken != -1)
    dispatch_once(&shareSheetNoteThumbnailImage_onceToken, &__block_literal_global_35);
  return (UIImage *)(id)shareSheetNoteThumbnailImage_thumbnailImage;
}

void __57__ICCollaborationController_shareSheetNoteThumbnailImage__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v8;
  if (v8)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v8);
    objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A870]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "imageForDescriptor:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "placeholder"))
    {
      objc_msgSend(v2, "prepareImageForDescriptor:", v3);
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithCGImage:", objc_msgSend(v4, "CGImage"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)shareSheetNoteThumbnailImage_thumbnailImage;
    shareSheetNoteThumbnailImage_thumbnailImage = v6;

    v1 = v8;
  }

}

+ (UIImage)shareSheetFolderThumbnailImage
{
  if (shareSheetFolderThumbnailImage_onceToken != -1)
    dispatch_once(&shareSheetFolderThumbnailImage_onceToken, &__block_literal_global_42);
  return (UIImage *)(id)shareSheetFolderThumbnailImage_thumbnailImage;
}

void __59__ICCollaborationController_shareSheetFolderThumbnailImage__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("ios_collaboration_share_sheet_folder_icon"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shareSheetFolderThumbnailImage_thumbnailImage;
  shareSheetFolderThumbnailImage_thumbnailImage = v0;

}

+ (id)rootRecordForObject:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__47;
  v15 = __Block_byref_object_dispose__47;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__ICCollaborationController_rootRecordForObject___block_invoke;
  v8[3] = &unk_1E5C1D9D0;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __49__ICCollaborationController_rootRecordForObject___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "serverRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v6 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_DEFAULT, "Trying to get root record for %@, but we don't have a server record. This likely won't work.", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "makeCloudKitRecordForApproach:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

+ (id)newShareForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "rootRecordForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0C95110]);
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v4, "serverRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "share");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithRootRecord:shareID:", v5, v12);

    v14 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "ic_loggingDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortLoggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      v17 = "Created share %@ with existing share reference for %@";
LABEL_6:
      _os_log_impl(&dword_1AC7A1000, v14, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v19, 0x16u);

    }
  }
  else
  {
    v13 = (void *)objc_msgSend(v8, "initWithRootRecord:", v5);
    v14 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "ic_loggingDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortLoggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      v17 = "Created share %@ for %@";
      goto LABEL_6;
    }
  }

  objc_msgSend(v13, "ic_updateFromObject:", v4);
  return v13;
}

+ (id)serverShareIfRootObject:(id)a3 managedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "updatedShareForObject:includeHierarchicalShare:managedObjectContext:", a3, 0, a4);
}

+ (id)serverShareCheckingParent:(id)a3 managedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "updatedShareForObject:includeHierarchicalShare:managedObjectContext:", a3, 1, a4);
}

+ (id)updatedShareForObject:(id)a3 includeHierarchicalShare:(BOOL)a4 managedObjectContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v7, "managedObjectContext");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = 0;
      goto LABEL_5;
    }
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__47;
  v22 = __Block_byref_object_dispose__47;
  v23 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__ICCollaborationController_updatedShareForObject_includeHierarchicalShare_managedObjectContext___block_invoke;
  v13[3] = &unk_1E5C21E98;
  v17 = a4;
  v14 = v7;
  v16 = &v18;
  v15 = v9;
  objc_msgSend(v15, "performBlockAndWait:", v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
LABEL_5:

  return v11;
}

void __97__ICCollaborationController_updatedShareForObject_includeHierarchicalShare_managedObjectContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __97__ICCollaborationController_updatedShareForObject_includeHierarchicalShare_managedObjectContext___block_invoke_cold_1();

  v3 = *(id *)(a1 + 32);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    do
    {
      if ((objc_msgSend(v4, "shareMatchesRecord") & 1) == 0)
      {
        v6 = os_log_create("com.apple.notes", "Collaboration");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "serverShare");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "ic_loggingDescription");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v20 = v9;
          v21 = 2112;
          v22 = v10;
          _os_log_error_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_ERROR, "Removing mismatched share for object. Share %@, object %@", buf, 0x16u);

        }
        objc_msgSend(v4, "setServerShare:", 0);
        v5 = 1;
        objc_msgSend(v4, "setNeedsToBeFetchedFromCloud:", 1);
      }
      objc_msgSend(v4, "parentCloudObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    v5 = 0;
  }
  v11 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v11, "serverShareCheckingParent");
  else
    objc_msgSend(v11, "serverShare");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v15)
  {
    objc_msgSend(v15, "ic_updateFromObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "invitation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateFromShare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    if (!((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0) | v5 & 1))
      return;
  }
  else if ((v5 & 1) == 0)
  {
    return;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(v17, "addObject:", CFSTR("Share updated from object metadata"));
  if ((v5 & 1) != 0)
    objc_msgSend(v18, "addObject:", CFSTR("Mismatched share removed from object"));
  objc_msgSend(*(id *)(a1 + 40), "ic_saveWithLogDescription:", CFSTR("Reasons: %@"), v18);

}

- (void)prepareShare:(id)a3 forObject:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  ICCollaborationController *v30;
  id v31;
  NSObject *v32;
  id v33;
  int64_t v34;
  os_signpost_id_t v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[16];
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__47;
  v47 = __Block_byref_object_dispose__47;
  v48 = 0;
  objc_msgSend(v11, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke;
  v39[3] = &unk_1E5C1DC18;
  v15 = v10;
  v40 = v15;
  v16 = v11;
  v41 = v16;
  v42 = &v43;
  objc_msgSend(v13, "performBlockAndWait:", v39);

  v17 = os_log_create("com.apple.notes", "Collaboration");
  v18 = os_signpost_id_generate(v17);
  v19 = v17;
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "com.apple.notes.collaboration.prepareShare", ", buf, 2u);
  }

  if ((ICInternalSettingsIsAlexandriaDemoModeEnabled() & 1) == 0)
  {
    objc_msgSend(v16, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v14;
    v36[1] = 3221225472;
    v36[2] = __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_50;
    v36[3] = &unk_1E5C1D540;
    v37 = v16;
    objc_msgSend(v21, "performBlockAndWait:", v36);

  }
  -[ICCollaborationController cloudContext](self, "cloudContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v44[5];
  v28[0] = v14;
  v28[1] = 3221225472;
  v28[2] = __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_2;
  v28[3] = &unk_1E5C21EE8;
  v24 = v16;
  v29 = v24;
  v30 = self;
  v25 = v15;
  v31 = v25;
  v34 = a5;
  v26 = v20;
  v32 = v26;
  v35 = v18;
  v27 = v12;
  v33 = v27;
  objc_msgSend(v22, "finishOperationsForRecordID:qualityOfService:completionHandler:", v23, a5, v28);

  _Block_object_dispose(&v43, 8);
}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "recordID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_50(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "redactAuthorAttributionsToCurrentUser");
  objc_msgSend(*(id *)(a1 + 32), "updateChangeCountWithReason:", CFSTR("Redacted author attributions"));
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_save");

}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_2(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = a1[4];
  v3 = a1[6];
  v4 = a1[7];
  v5 = a1[8];
  performBlockOnMainThread();

}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_4;
  v14[3] = &unk_1E5C1D540;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v2, "performBlockAndWait:", v14);

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 72);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_53;
  v10[3] = &unk_1E5C21EC0;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 80);
  v11 = v8;
  v13 = v9;
  v12 = *(id *)(a1 + 64);
  objc_msgSend(v4, "saveShare:forObject:qualityOfService:completionHandler:", v7, v5, v6, v10);

}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_4_cold_1(a1);

}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v8, OS_SIGNPOST_INTERVAL_END, v9, "com.apple.notes.collaboration.prepareShare", ", v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)saveShare:(id)a3 forObject:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
  -[ICCollaborationController saveShare:attemptNumber:forObject:accountID:container:qualityOfService:retryPrepHandler:completionHandler:](self, "saveShare:attemptNumber:forObject:accountID:container:qualityOfService:retryPrepHandler:completionHandler:", a3, 0, a4, 0, 0, a5, 0, a6);
}

- (void)saveShare:(id)a3 attemptNumber:(id)a4 forObject:(id)a5 accountID:(id)a6 container:(id)a7 qualityOfService:(int64_t)a8 retryPrepHandler:(id)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  dispatch_time_t v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  if (!objc_msgSend(v17, "unsignedIntegerValue"))
  {

    v17 = &unk_1E5C71EC8;
  }
  if ((unint64_t)objc_msgSend(v17, "unsignedIntegerValue") < 6)
  {
    v24 = dispatch_time(0, 1000000000 * objc_msgSend(v17, "unsignedIntegerValue") - 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __135__ICCollaborationController_saveShare_attemptNumber_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke;
    block[3] = &unk_1E5C21F38;
    block[4] = self;
    v26 = v16;
    v27 = v18;
    v28 = v19;
    v29 = v20;
    v33 = a8;
    v31 = v21;
    v30 = v17;
    v32 = v22;
    dispatch_after(v24, MEMORY[0x1E0C80D38], block);

  }
  else if (v22)
  {
    ICGenericError();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v22 + 2))(v22, 0, v23);

  }
}

void __135__ICCollaborationController_saveShare_attemptNumber_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 96);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __135__ICCollaborationController_saveShare_attemptNumber_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2;
  v14[3] = &unk_1E5C21F10;
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  v15 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 88);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v21 = v9;
  v16 = v10;
  v17 = v11;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 96);
  v20 = v12;
  v23 = v13;
  v22 = *(id *)(a1 + 80);
  objc_msgSend(v2, "saveShare:forObject:accountID:container:qualityOfService:retryPrepHandler:completionHandler:", v3, v4, v5, v7, v6, v8, v14);

}

void __135__ICCollaborationController_saveShare_attemptNumber_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((!v10 || v5)
    && objc_msgSend(v5, "ic_shouldRetryCloudKitError")
    && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") < 5)
  {
    v8 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "saveShare:attemptNumber:forObject:accountID:container:qualityOfService:retryPrepHandler:completionHandler:", v7, v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 80));

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 80);
    if (v6)
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v10, v5);
  }

}

- (void)saveShare:(id)a3 forObject:(id)a4 accountID:(id)a5 container:(id)a6 qualityOfService:(int64_t)a7 retryPrepHandler:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  ICCollaborationController *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v28 = a5;
  v29 = a6;
  v17 = a8;
  v18 = a9;
  if (v16)
  {
    if (v15)
    {
LABEL_3:
      v43 = 0;
      v44 = &v43;
      v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__47;
      v47 = __Block_byref_object_dispose__47;
      objc_msgSend((id)objc_opt_class(), "rootRecordForObject:", v16);
      v48 = (id)objc_claimAutoreleasedReturnValue();
      if (v44[5])
      {
        objc_msgSend(v16, "managedObjectContext");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = MEMORY[0x1E0C809B0];
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke;
        v40[3] = &unk_1E5C1D9A8;
        v21 = v15;
        v41 = v21;
        v22 = v16;
        v42 = v22;
        objc_msgSend(v19, "performBlockAndWait:", v40);

        v30[0] = v20;
        v30[1] = 3221225472;
        v30[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2;
        v30[3] = &unk_1E5C22028;
        v31 = v22;
        v32 = self;
        v33 = v21;
        v38 = &v43;
        v34 = v28;
        v35 = v29;
        v39 = a7;
        v36 = v17;
        v37 = v18;
        objc_msgSend(v33, "ic_updateThumbnailsFromObject:completion:", v31, v30);

        v23 = v41;
      }
      else
      {
        v26 = os_log_create("com.apple.notes", "Collaboration");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "shortLoggingDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v50 = v27;
          _os_log_impl(&dword_1AC7A1000, v26, OS_LOG_TYPE_DEFAULT, "No root record for %@", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D63F58], 208, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          (*((void (**)(id, _QWORD, void *))v18 + 2))(v18, 0, v23);
      }

      _Block_object_dispose(&v43, 8);
      goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((object) != nil)", "-[ICCollaborationController saveShare:forObject:accountID:container:qualityOfService:retryPrepHandler:completionHandler:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "object", v28, v29);
    if (v15)
      goto LABEL_3;
  }
  v24 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[ICCollaborationController saveShare:forObject:accountID:container:qualityOfService:retryPrepHandler:completionHandler:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D63F58], 208, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    (*((void (**)(id, _QWORD, void *))v18 + 2))(v18, 0, v25);

LABEL_16:
}

uint64_t __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ic_updateFromObject:", *(_QWORD *)(a1 + 40));
}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5C22000;
  v3 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 88);
  v9 = v4;
  v15 = v5;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 96);
  v12 = v6;
  v16 = v7;
  v13 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 80);
  objc_msgSend(v2, "performBlock:", v8);

}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 96);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_4;
  v13[3] = &unk_1E5C21FD8;
  v14 = v6;
  v15 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 72);
  v21 = *(_QWORD *)(a1 + 88);
  v10 = *(_QWORD *)(a1 + 32);
  v19 = v9;
  v16 = v10;
  v17 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 96);
  v18 = v11;
  v22 = v12;
  v20 = *(id *)(a1 + 80);
  objc_msgSend(v2, "saveShare:withRootRecord:object:accountID:container:qualityOfService:completionHandler:", v3, v5, v14, v7, v8, v4, v13);

}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_5;
    v15[3] = &unk_1E5C21FB0;
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 72);
    v23 = *(_QWORD *)(a1 + 88);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(a1 + 56);
    v21 = v10;
    v18 = v11;
    v19 = v12;
    v13 = *(id *)(a1 + 64);
    v14 = *(_QWORD *)(a1 + 96);
    v20 = v13;
    v24 = v14;
    v22 = *(id *)(a1 + 80);
    objc_msgSend(v9, "performBlock:", v15);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 80);
    if (v8)
      (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v5, 0);
  }

}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  char v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  int8x16_t v39;
  _QWORD v40[4];
  id v41;
  int8x16_t v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v58 = v3;
    _os_log_impl(&dword_1AC7A1000, v2, OS_LOG_TYPE_DEFAULT, "Retrying to save share for %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "serverShare");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 40), "recordChangeTag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serverShare");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordChangeTag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v6)
      v10 = 0;
    else
      v10 = v6;
    v11 = v10;
    if (v9 == v8)
      v12 = 0;
    else
      v12 = v8;
    v13 = v12;
    if (v11 | v13)
    {
      v14 = (void *)v13;
      if (v11)
        v15 = v13 == 0;
      else
        v15 = 1;
      if (v15)
      {

LABEL_22:
        v26 = os_log_create("com.apple.notes", "Collaboration");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "serverShare");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "ic_loggingDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v58 = v28;
          _os_log_impl(&dword_1AC7A1000, v26, OS_LOG_TYPE_DEFAULT, "Using updated server share when retrying %@", buf, 0xCu);

        }
        v29 = *(_QWORD *)(a1 + 72);
        if (v29)
          (*(void (**)(void))(v29 + 16))();
        objc_msgSend(*(id *)(a1 + 32), "serverShare");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "copy");

        objc_msgSend(v31, "ic_updateFromObject:", *(_QWORD *)(a1 + 32));
        v32 = *(void **)(a1 + 32);
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_62;
        v48[3] = &unk_1E5C21F88;
        v33 = v32;
        v34 = *(_QWORD *)(a1 + 88);
        v35 = *(_QWORD *)(a1 + 48);
        v36 = *(void **)(a1 + 56);
        v49 = v33;
        v50 = v35;
        v55 = v34;
        v51 = v31;
        v52 = v36;
        v37 = *(id *)(a1 + 64);
        v38 = *(_QWORD *)(a1 + 96);
        v53 = v37;
        v56 = v38;
        v54 = *(id *)(a1 + 80);
        v24 = v31;
        objc_msgSend(v24, "ic_updateThumbnailsFromObject:completion:", v33, v48);

        goto LABEL_27;
      }
      v25 = objc_msgSend((id)v11, "isEqual:", v13);

      if ((v25 & 1) == 0)
        goto LABEL_22;
    }
    else
    {

    }
  }
  v16 = *(_QWORD *)(a1 + 72);
  if (v16)
    (*(void (**)(void))(v16 + 16))();
  objc_msgSend(*(id *)(a1 + 40), "ic_updateFromObject:", *(_QWORD *)(a1 + 32));
  v17 = *(void **)(a1 + 32);
  v18 = *(void **)(a1 + 40);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_3_64;
  v40[3] = &unk_1E5C21F88;
  v19 = v17;
  v20 = *(_QWORD *)(a1 + 88);
  v41 = v19;
  v46 = v20;
  v39 = *(int8x16_t *)(a1 + 40);
  v21 = (id)v39.i64[0];
  v42 = vextq_s8(v39, v39, 8uLL);
  v43 = *(id *)(a1 + 56);
  v22 = *(id *)(a1 + 64);
  v23 = *(_QWORD *)(a1 + 96);
  v44 = v22;
  v47 = v23;
  v45 = *(id *)(a1 + 80);
  objc_msgSend(v18, "ic_updateThumbnailsFromObject:completion:", v19, v40);

  v24 = v41;
LABEL_27:

}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_62(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2_63;
  v7[3] = &unk_1E5C21F60;
  v13 = *(_QWORD *)(a1 + 80);
  v6 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 88);
  v11 = v4;
  v14 = v5;
  v12 = *(id *)(a1 + 72);
  objc_msgSend(v2, "performBlock:", v7);

}

uint64_t __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_2_63(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "rootRecordForObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "saveShare:withRootRecord:object:accountID:container:qualityOfService:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 72));
}

void __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_3_64(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_4_65;
  v7[3] = &unk_1E5C21F60;
  v13 = *(_QWORD *)(a1 + 80);
  v6 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 88);
  v11 = v4;
  v14 = v5;
  v12 = *(id *)(a1 + 72);
  objc_msgSend(v2, "performBlock:", v7);

}

uint64_t __121__ICCollaborationController_saveShare_forObject_accountID_container_qualityOfService_retryPrepHandler_completionHandler___block_invoke_4_65(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "rootRecordForObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "saveShare:withRootRecord:object:accountID:container:qualityOfService:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 72));
}

- (void)saveShare:(id)a3 withRootRecord:(id)a4 object:(id)a5 accountID:(id)a6 container:(id)a7 qualityOfService:(int64_t)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD, void *);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  id v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  ICCollaborationController *v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  ICCollaborationController *v61;
  id v62;
  id v63;
  NSObject *v64;
  void (**v65)(id, _QWORD, void *);
  id v66[2];
  id location;
  _QWORD v68[2];
  uint8_t buf[4];
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v57 = a7;
  v19 = (void (**)(id, _QWORD, void *))a9;
  if (v15 && v16)
  {
    if (!v18)
    {
      objc_msgSend(v17, "cloudAccount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v18, "length"))
    {
      if (objc_msgSend(v17, "isSharedReadOnly"))
      {
        v21 = (void *)MEMORY[0x1E0D641A0];
        objc_msgSend(v15, "ic_loggingDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "ic_loggingDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCollaborationController saveShare:withRootRecord:object:accountID:container:qualityOfService:completionHandler:]", 1, 0, CFSTR("Tried to save a read-only share (%@) for object: %@"), v22, v23);

        if (v19)
        {
LABEL_8:
          ICGenericError();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v19[2](v19, 0, v24);

        }
      }
      else
      {
        v56 = self;
        objc_msgSend(v15, "rootRecordID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_19;
        objc_msgSend(v15, "rootRecordID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "recordID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if ((v31 & 1) == 0)
        {
          v49 = os_log_create("com.apple.notes", "Collaboration");
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            -[ICCollaborationController saveShare:withRootRecord:object:accountID:container:qualityOfService:completionHandler:].cold.2(v15, v17, v49);

          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCollaborationController saveShare:withRootRecord:object:accountID:container:qualityOfService:completionHandler:]", 1, 1, CFSTR("Tried to save a mismatched share"));
          if (v19)
            ((void (**)(id, id, void *))v19)[2](v19, v15, 0);
        }
        else
        {
LABEL_19:
          v32 = os_log_create("com.apple.notes", "Collaboration");
          v33 = os_signpost_id_generate(v32);
          v34 = v32;
          v35 = v34;
          if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "com.apple.notes.collaboration.saveShare", ", buf, 2u);
          }
          v54 = v35;
          v55 = (void *)v33;

          if (!v57)
          {
            -[ICCollaborationController containerForAccountID:](v56, "containerForAccountID:", v18);
            v57 = (id)objc_claimAutoreleasedReturnValue();
          }
          v36 = objc_alloc(MEMORY[0x1E0C94F10]);
          v68[0] = v15;
          v68[1] = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v36, "initWithRecordsToSave:recordIDsToDelete:", v37, 0);

          objc_msgSend(v38, "setQualityOfService:", a8);
          objc_msgSend(v38, "configuration");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setDiscretionaryNetworkBehavior:", 0);

          objc_msgSend(v15, "recordID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "databaseWithDatabaseScope:", objc_msgSend(v40, "databaseScope"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setDatabase:", v41);

          objc_initWeak(&location, v38);
          v42 = os_log_create("com.apple.notes", "Collaboration");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v15, "ic_loggingDescription");
            v53 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "ic_loggingDescription");
            v43 = (id)objc_claimAutoreleasedReturnValue();
            v44 = objc_loadWeakRetained(&location);
            objc_msgSend(v44, "ic_loggingDescription");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v70 = v53;
            v71 = 2112;
            v72 = v43;
            v73 = 2112;
            v74 = v45;
            _os_log_impl(&dword_1AC7A1000, v42, OS_LOG_TYPE_INFO, "Saving Share: %@ with root record: %@ %@", buf, 0x20u);

          }
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke;
          v58[3] = &unk_1E5C22108;
          objc_copyWeak(v66, &location);
          v59 = v17;
          v60 = v15;
          v61 = v56;
          v62 = v16;
          v18 = v18;
          v63 = v18;
          v46 = v54;
          v64 = v46;
          v66[1] = v55;
          v65 = v19;
          objc_msgSend(v38, "setModifyRecordsCompletionBlock:", v58);
          v47 = objc_alloc_init(MEMORY[0x1E0C94F88]);
          objc_msgSend(v47, "setName:", CFSTR("SaveShare"));
          objc_msgSend(v47, "setQuantity:", 1);
          objc_msgSend(v47, "setExpectedSendSize:", 1);
          objc_msgSend(v47, "setExpectedReceiveSize:", 1);
          objc_msgSend(v38, "setGroup:", v47);
          objc_msgSend(v38, "database");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addOperation:", v38);

          objc_destroyWeak(v66);
          objc_destroyWeak(&location);

        }
      }
    }
    else
    {
      v27 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[ICCollaborationController saveShare:withRootRecord:object:accountID:container:qualityOfService:completionHandler:].cold.1(v15, v17, v27);

      if (v19)
        goto LABEL_8;
    }
  }
  else
  {
    v25 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "ic_loggingDescription");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ic_loggingDescription");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ic_loggingDescription");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v70 = v50;
      v71 = 2112;
      v72 = v51;
      v73 = 2112;
      v74 = v52;
      _os_log_error_impl(&dword_1AC7A1000, v25, OS_LOG_TYPE_ERROR, "Tried to save a nil share (%@) or a nil root record (%@) for object: %@", buf, 0x20u);

    }
    if (v19)
    {
      ICGenericError();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, 0, v26);

    }
  }

}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 11);
  v13 = v7;
  v14 = a1[4];
  v15 = a1[5];
  v16 = WeakRetained;
  v17 = a1[7];
  v18 = a1[8];
  v19 = a1[9];
  v20 = v6;
  v21 = a1[10];
  v9 = v6;
  v10 = WeakRetained;
  v11 = v7;
  performBlockOnMainThread();
  objc_msgSend(a1[6], "cloudContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "informCloudAnalyticsDelegateForOperationDidEnd:recordsByRecordID:operationError:", v10, MEMORY[0x1E0C9AA70], v11);

}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  uint64_t v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_3;
    v40[3] = &unk_1E5C1F1B0;
    v41 = *(id *)(a1 + 48);
    v42 = *(id *)(a1 + 40);
    v43 = *(id *)(a1 + 56);
    v44 = *(id *)(a1 + 32);
    objc_msgSend(v2, "performBlockAndWait:", v40);

    v4 = objc_msgSend(*(id *)(a1 + 32), "code");
    if (v4 == 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v3;
      v37[1] = 3221225472;
      v37[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_73;
      v37[3] = &unk_1E5C1D9A8;
      v38 = *(id *)(a1 + 40);
      v39 = *(id *)(a1 + 56);
      objc_msgSend(v14, "performBlockAndWait:", v37);

      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v31[0] = v3;
      v31[1] = 3221225472;
      v31[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_74;
      v31[3] = &unk_1E5C22078;
      v32 = *(id *)(a1 + 40);
      v33 = *(id *)(a1 + 56);
      v34 = *(id *)(a1 + 72);
      v35 = *(id *)(a1 + 80);
      v36 = *(id *)(a1 + 48);
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v31);

      v6 = v38;
    }
    else
    {
      if (v4 != 25)
        goto LABEL_13;
      v5 = (void *)objc_opt_class();
      objc_msgSend(*(id *)(a1 + 72), "recordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "showQuotaExceededAlertIfNeededWithRecordID:accountID:", v6, *(_QWORD *)(a1 + 80));
    }

LABEL_13:
    v17 = *(id *)(a1 + 88);
    v18 = v17;
    v19 = *(_QWORD *)(a1 + 112);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v18, OS_SIGNPOST_INTERVAL_END, v19, "com.apple.notes.collaboration.saveShare", ", buf, 2u);
    }

    v20 = *(_QWORD *)(a1 + 104);
    if (v20)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v20 + 16))(v20, 0, *(_QWORD *)(a1 + 32));

    v12 = v41;
    goto LABEL_25;
  }
  v7 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v46 = v8;
    v47 = 2112;
    v48 = v9;
    _os_log_impl(&dword_1AC7A1000, v7, OS_LOG_TYPE_INFO, "Saved share %@ %@", buf, 0x16u);

  }
  v10 = objc_msgSend(*(id *)(a1 + 96), "indexOfObjectPassingTest:", &__block_literal_global_82);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_cold_1();
    v12 = 0;
    v13 = v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_83;
    v27[3] = &unk_1E5C1D7C0;
    v28 = *(id *)(a1 + 40);
    v12 = v21;
    v29 = v12;
    v30 = v22;
    v13 = v22;
    -[NSObject performBlockAndWait:](v13, "performBlockAndWait:", v27);

    v11 = v28;
  }

  v23 = *(id *)(a1 + 88);
  v24 = v23;
  v25 = *(_QWORD *)(a1 + 112);
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v24, OS_SIGNPOST_INTERVAL_END, v25, "com.apple.notes.collaboration.saveShare", ", buf, 2u);
  }

  v26 = *(_QWORD *)(a1 + 104);
  if (v26)
    (*(void (**)(uint64_t, id, _QWORD))(v26 + 16))(v26, v12, 0);
LABEL_25:

}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_3()
{
  NSObject *v0;

  v0 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_3_cold_1();

}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_73(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1AC7A1000, v2, OS_LOG_TYPE_DEFAULT, "Partial failure saving share for %@ %@", (uint8_t *)&v5, 0x16u);

  }
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_74(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_75;
  v20[3] = &unk_1E5C1F1B0;
  v21 = a1[4];
  v11 = v5;
  v22 = v11;
  v23 = a1[5];
  v9 = v6;
  v24 = v9;
  objc_msgSend(v7, "performBlockAndWait:", v20);

  if (objc_msgSend(v9, "code") == 14)
  {
    objc_msgSend(a1[4], "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_76;
    v12[3] = &unk_1E5C22050;
    v13 = v9;
    v14 = v11;
    v15 = a1[6];
    v16 = a1[4];
    v17 = a1[5];
    v18 = a1[7];
    v19 = a1[8];
    objc_msgSend(v10, "performBlockAndWait:", v12);

  }
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_75(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 56);
    v7 = 138413058;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1AC7A1000, v2, OS_LOG_TYPE_DEFAULT, "Error saving share for %@ when saving record ID %@ %@: %@", (uint8_t *)&v7, 0x2Au);

  }
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_76(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C949B8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v10 = os_log_create("com.apple.notes", "Collaboration");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      goto LABEL_15;
    }
    objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "shortLoggingDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1AC7A1000, v10, OS_LOG_TYPE_DEFAULT, "No server record from error saving share for %@ %@ %@", (uint8_t *)&v21, 0x20u);

LABEL_8:
    goto LABEL_9;
  }
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqual:", v5);

  if (!(_DWORD)v4)
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 80), "recordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v14, "isEqual:", v15);

    if (!(_DWORD)v14)
      goto LABEL_15;
    v16 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "ic_loggingDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "shortLoggingDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1AC7A1000, v16, OS_LOG_TYPE_DEFAULT, "Saving server share %@ for %@ %@", (uint8_t *)&v21, 0x20u);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "setServerShareIfNewer:", v3);
      goto LABEL_15;
    }
    v10 = os_log_create("com.apple.notes", "Collaboration");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    objc_msgSend(v3, "ic_loggingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1AC7A1000, v10, OS_LOG_TYPE_DEFAULT, "Server record %@ is not a share %@", (uint8_t *)&v21, 0x16u);
    goto LABEL_8;
  }
  v6 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "ic_loggingDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "shortLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v7;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_DEFAULT, "Saving server record %@ for %@ %@", (uint8_t *)&v21, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 56), "objectWasFetchedFromCloudWithRecord:accountID:", v3, *(_QWORD *)(a1 + 72));
LABEL_15:
  objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ic_saveWithLogDescription:", CFSTR("Saving Share"));

}

uint64_t __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_80(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_83(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setServerShareIfNewer:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "ic_save");
}

- (void)fetchShareIfNecessaryForObject:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v39[4];
  id v40;
  ICCollaborationController *v41;
  id v42;
  NSObject *v43;
  void (**v44)(_QWORD);
  id v45[2];
  id location;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(v5, "cloudAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "length");
  v10 = os_log_create("com.apple.notes", "Collaboration");
  v11 = v10;
  if (v9)
  {
    v12 = (char *)os_signpost_id_generate(v10);
    v13 = v11;
    v14 = v13;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v12, "com.apple.notes.collaboration.fetchShare", ", buf, 2u);
    }

    objc_msgSend(v5, "serverRecord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "share");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17
      && (objc_msgSend(v5, "serverShare"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = v18 == 0,
          v18,
          v19))
    {
      v22 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "serverRecord");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "share");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "recordID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "ic_loggingDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "shortLoggingDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = v36;
        v50 = 2112;
        v51 = v25;
        _os_log_impl(&dword_1AC7A1000, v22, OS_LOG_TYPE_INFO, "Need to fetch share %@ for %@", buf, 0x16u);

      }
      -[ICCollaborationController containerForAccountID:](self, "containerForAccountID:", v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc(MEMORY[0x1E0C94E18]);
      v47 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v27, "initWithRecordIDs:", v28);

      objc_msgSend(v26, "databaseWithDatabaseScope:", objc_msgSend(v17, "databaseScope"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setDatabase:", v30);

      objc_msgSend(v29, "setQueuePriority:", 8);
      objc_msgSend(v29, "setQualityOfService:", 17);
      objc_msgSend(v29, "configuration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDiscretionaryNetworkBehavior:", 0);

      objc_initWeak(&location, v29);
      v32 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v17, "ic_loggingDescription");
        v33 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "ic_loggingDescription");
        objc_claimAutoreleasedReturnValue();
        -[ICCollaborationController fetchShareIfNecessaryForObject:completionHandler:].cold.2();
      }

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __78__ICCollaborationController_fetchShareIfNecessaryForObject_completionHandler___block_invoke;
      v39[3] = &unk_1E5C22130;
      v40 = v17;
      objc_copyWeak(v45, &location);
      v41 = self;
      v42 = v8;
      v43 = v14;
      v45[1] = v12;
      v44 = v6;
      objc_msgSend(v29, "setFetchRecordsCompletionBlock:", v39);
      v34 = objc_alloc_init(MEMORY[0x1E0C94F88]);
      objc_msgSend(v34, "setName:", CFSTR("FetchShare"));
      objc_msgSend(v34, "setQuantity:", 1);
      objc_msgSend(v34, "setExpectedSendSize:", 1);
      objc_msgSend(v34, "setExpectedReceiveSize:", 1);
      objc_msgSend(v29, "setGroup:", v34);
      objc_msgSend(v29, "database");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addOperation:", v29);

      objc_destroyWeak(v45);
      objc_destroyWeak(&location);

    }
    else
    {
      v20 = v14;
      v21 = v20;
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v21, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v12, "com.apple.notes.collaboration.fetchShare", ", buf, 2u);
      }

      v6[2](v6);
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICCollaborationController fetchShareIfNecessaryForObject:completionHandler:].cold.1();

    if (v6)
      v6[2](v6);
  }

}

void __78__ICCollaborationController_fetchShareIfNecessaryForObject_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  id v15;
  void *v16;
  id WeakRetained;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = os_log_create("com.apple.notes", "Collaboration");
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __78__ICCollaborationController_fetchShareIfNecessaryForObject_completionHandler___block_invoke_cold_1(v8, a1);

    objc_msgSend(*(id *)(a1 + 40), "saveServerShare:persistParticipantEvents:accountID:", v8, 0, *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(WeakRetained, "ic_loggingDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v16;
      v21 = 2112;
      v22 = v18;
      v23 = 2112;
      v24 = v6;
      _os_log_error_impl(&dword_1AC7A1000, v10, OS_LOG_TYPE_ERROR, "Error fetching share %@ %@: %@", (uint8_t *)&v19, 0x20u);

    }
  }
  v11 = *(id *)(a1 + 56);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 80);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v12, OS_SIGNPOST_INTERVAL_END, v13, "com.apple.notes.collaboration.fetchShare", ", (uint8_t *)&v19, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "cloudContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v14, "informCloudAnalyticsDelegateForOperationDidEnd:recordsByRecordID:operationError:", v15, v5, v6);

}

- (void)didSaveShare:(id)a3 accountID:(id)a4
{
  -[ICCollaborationController saveServerShare:persistParticipantEvents:accountID:](self, "saveServerShare:persistParticipantEvents:accountID:", a3, 1, a4);
}

- (void)saveServerShare:(id)a3 persistParticipantEvents:(BOOL)a4 accountID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a5;
  -[ICCollaborationController viewContext](self, "viewContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__ICCollaborationController_saveServerShare_persistParticipantEvents_accountID___block_invoke;
  v14[3] = &unk_1E5C1F160;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = a4;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "performBlock:", v14);

}

void __80__ICCollaborationController_saveServerShare_persistParticipantEvents_accountID___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForShare:accountID:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.notes", "Collaboration");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_opt_class();
      v6 = v5;
      objc_msgSend(v2, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v5;
      v29 = 2112;
      v30 = v7;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_1AC7A1000, v4, OS_LOG_TYPE_INFO, "Setting server share on %@ %@ %@", buf, 0x20u);

    }
    objc_msgSend(v2, "serverShare");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setServerShareIfNewer:", *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "collaborationControllerDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "collaborationController:persistParticipantActivityEventsOnObject:oldShare:newShare:", *(_QWORD *)(a1 + 32), v2, v9, *(_QWORD *)(a1 + 40));

    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v2, "associatedNoteParticipants", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(a1 + 56), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    objc_msgSend(*(id *)(a1 + 56), "ic_save");
    v16 = objc_alloc(MEMORY[0x1E0D63C10]);
    objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v16, "initWithManagedObjectContext:", v17);

    -[NSObject updateWithCompletion:](v4, "updateWithCompletion:", 0);
    objc_msgSend((id)objc_opt_class(), "postDidUpdateShareNotificationForObject:", v2);
    objc_opt_class();
    ICDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && *(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "collaborationAnalyticsTracker");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "saveNewShare:forNote:", *(_QWORD *)(a1 + 40), v18);

    }
    objc_msgSend(*(id *)(a1 + 32), "collaborationAnalyticsDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trackCollaborationActionSecondShareForObject:share:isInviting:", v2, *(_QWORD *)(a1 + 40), 1);

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_impl(&dword_1AC7A1000, v4, OS_LOG_TYPE_DEFAULT, "Couldn't find cloud object for share %@", buf, 0xCu);

    }
    v9 = v4;
  }

}

+ (void)postDidUpdateShareNotificationForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  objc_msgSend(v3, "serverShareCheckingParent");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v4, CFSTR("ICCloudSyncingObjectShareRecordID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C95110], "ic_systemFieldsValueTransformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transformedValue:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("ICCloudSyncingObjectShareData"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("ICCloudSyncingObjectDidUpdateShare"), v3, v9);

}

- (id)objectForShare:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_log_t v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D638C8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D638D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v14 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ICCollaborationController objectForShare:accountID:context:].cold.1(v8);

    }
    -[ICCollaborationController cloudContext](self, "cloudContext");
    v15 = (os_log_t)objc_claimAutoreleasedReturnValue();
    -[NSObject existingCloudObjectForRecordID:recordType:accountID:context:](v15, "existingCloudObjectForRecordID:recordType:accountID:context:", v12, v13, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "ic_loggingDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v17;
      _os_log_impl(&dword_1AC7A1000, v15, OS_LOG_TYPE_DEFAULT, "No root record reference for share %@", (uint8_t *)&v19, 0xCu);

    }
    v16 = 0;
    v13 = v15;
  }

  return v16;
}

- (void)removeShareIfNeededWithOwnedObjectID:(id)a3 countParticipants:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  ICCollaborationController *v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    -[ICCollaborationController viewContext](self, "viewContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke;
    v13[3] = &unk_1E5C221A8;
    v14 = v11;
    v15 = v8;
    v18 = a4;
    v16 = self;
    v17 = v10;
    v12 = v11;
    objc_msgSend(v12, "performBlock:", v13);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

void __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || !objc_msgSend(v3, "isOwnedByCurrentUser")
    || (objc_msgSend(v3, "serverShare"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_6:
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, 0);
    goto LABEL_8;
  }
  v5 = v4;
  if (*(_BYTE *)(a1 + 64))
  {
    v6 = objc_msgSend(v3, "isPubliclySharedOrHasInvitees");

    if (v6)
      goto LABEL_6;
  }
  else
  {

  }
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "collaborationAnalyticsTracker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unshareNote:", v8);

  }
  objc_msgSend(*(id *)(a1 + 48), "cloudContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5C22180;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = v12;
  objc_msgSend(v10, "deleteSharesForObjects:completionHandler:", v11, v13);

LABEL_8:
}

void __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5C22158;
  v9 = v3;
  v4 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v11 = v5;
  v12 = v6;
  v7 = v3;
  objc_msgSend(v4, "performBlock:", v8);

}

void __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3_cold_2();

    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, *v2);
  }
  else
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 48), "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setNeedsToBeFetchedFromCloud:", 1);
    objc_msgSend(v6, "setServerShare:", 0);
    objc_msgSend(v6, "removeAllCloudSyncingObjectActivityEvents");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v6, "allChildCloudObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v11++), "removeAllCloudSyncingObjectActivityEvents");
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v6, "associatedNoteParticipants", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(a1 + 48), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 48), "ic_save");
    objc_msgSend(*(id *)(a1 + 56), "backgroundContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C10]), "initWithManagedObjectContext:", v17);
      objc_msgSend(v18, "updateWithCompletion:", 0);

    }
    objc_msgSend((id)objc_opt_class(), "postDidUpdateShareNotificationForObject:", v6);
    v19 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3_cold_1();

    v20 = *(_QWORD *)(a1 + 64);
    if (v20)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v20 + 16))(v20, 1, 0);

  }
}

- (void)didStopSharing:(id)a3 recordID:(id)a4 accountID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  ICCollaborationController *v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICCollaborationController viewContext](self, "viewContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke;
  v16[3] = &unk_1E5C221D0;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v20 = v11;
  v21 = v9;
  v12 = v9;
  v13 = v11;
  v14 = v10;
  v15 = v8;
  objc_msgSend(v13, "performBlock:", v16);

}

void __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
    objc_msgSend(v2, "objectForShare:accountID:context:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  else
    objc_msgSend(v2, "objectForCKShareRecordID:accountID:context:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.notes", "Collaboration");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 64);
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v29 = v7;
      v30 = 2112;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_1AC7A1000, v5, OS_LOG_TYPE_DEFAULT, "Successfully fetched cloudObject for share %@ recordID %@ accountID %@", buf, 0x20u);

    }
    v10 = objc_msgSend(v4, "isOwnedByCurrentUser");
    v11 = os_log_create("com.apple.notes", "Collaboration");
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        objc_msgSend(v4, "shortLoggingDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138412802;
        v29 = v13;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v15;
        _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEFAULT, "User stopped sharing %@ share %@ recordID %@", buf, 0x20u);

      }
      v16 = *(void **)(a1 + 40);
      objc_msgSend(v4, "objectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeShareIfNeededWithOwnedObjectID:countParticipants:completionHandler:", v17, 0, 0);
    }
    else
    {
      if (v12)
      {
        objc_msgSend(v4, "shortLoggingDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138412802;
        v29 = v20;
        v30 = 2112;
        v31 = v21;
        v32 = 2112;
        v33 = v22;
        _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEFAULT, "User removed themselves from shared %@ share %@ recordID %@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "collaborationControllerDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "collaborationController:persistLeaveActivityEventOnObject:", *(_QWORD *)(a1 + 40), v4);

      objc_msgSend(*(id *)(a1 + 40), "cloudContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_98;
      v25[3] = &unk_1E5C20FE0;
      v26 = *(id *)(a1 + 56);
      v27 = v4;
      objc_msgSend(v24, "syncWithReason:completionHandler:", CFSTR("SyncAfterDidStopSharing"), v25);

      v17 = v26;
    }

    objc_msgSend(*(id *)(a1 + 40), "collaborationAnalyticsDelegate");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject trackCollaborationActionSecondCancelForObject:share:isInviting:](v5, "trackCollaborationActionSecondCancelForObject:share:isInviting:", v4, *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138412546;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_1AC7A1000, v5, OS_LOG_TYPE_DEFAULT, "Couldn't find cloud object for share %@ recordID %@", buf, 0x16u);

    }
  }

}

void __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_98(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  NSObject *v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_98_cold_1();
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_2;
    v6[3] = &unk_1E5C1D9A8;
    v7 = v5;
    v8 = *(id *)(a1 + 40);
    -[NSObject performBlock:](v7, "performBlock:", v6);

    v4 = v7;
  }

}

void __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "markForDeletion");
    objc_msgSend(v5, "deleteFromLocalDatabase");
    objc_msgSend(*(id *)(a1 + 32), "ic_save");
  }

}

- (void)managedObjectContextObjectsDidChange:(id)a3
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C97878]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_objectsOfClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v35 = v4;
  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A20]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ic_objectsOfClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "ic_objectsPassingTest:", &__block_literal_global_102);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "count"))
  {
    -[ICCollaborationController updateSharesDelayer](self, "updateSharesDelayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "requestFire");

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v34 = v14;
  objc_msgSend(v10, "setByAddingObjectsFromSet:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v21, "serverShare");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)v22;
          objc_msgSend(v21, "invitation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
            v25 = (void *)MEMORY[0x1E0D63B58];
            objc_msgSend(v21, "serverShare");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "URL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "invitationWithShareURL:context:", v27, v6);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              objc_msgSend(v28, "setRootObject:", v21);
              objc_msgSend(v21, "serverShare");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "updateFromShare:", v29);

              v30 = os_log_create("com.apple.notes", "Collaboration");
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v21, "serverShare");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "ic_loggingDescription");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v42 = v31;
                v43 = 2112;
                v44 = v32;
                _os_log_debug_impl(&dword_1AC7A1000, v30, OS_LOG_TYPE_DEBUG, "Updated invitation and associated it with object {share: %@, objectID: %@}", buf, 0x16u);

              }
            }

          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v18);
  }

}

uint64_t __66__ICCollaborationController_managedObjectContextObjectsDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isShareDirty);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

+ (void)didFailToUpdateShareWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collaborationControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collaborationController:didFailToSaveShareWithError:", v6, v4);

}

- (void)acceptShareWithMetadata:(id)a3 managedObjectContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  BOOL v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 *v46;
  _QWORD v47[4];
  NSObject *v48;
  __int128 *p_buf;
  uint8_t v50[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int128 buf;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEFAULT, "Accepting share for metadata %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v8, "callingParticipant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userRecordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__47;
  v57 = __Block_byref_object_dispose__47;
  objc_msgSend(v8, "selectedAccountID");
  v58 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    -[ICCollaborationController containerForAccountID:](self, "containerForAccountID:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v50 = 138412546;
      v51 = v15;
      v52 = 2112;
      v53 = v17;
      _os_log_impl(&dword_1AC7A1000, v16, OS_LOG_TYPE_DEFAULT, "Using container %@ for metadata selected accountID %@", v50, 0x16u);
    }
    goto LABEL_25;
  }
  objc_msgSend(v14, "recordName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C94730]);

  if (v19)
  {
    v20 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:].cold.5();

    objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "primaryICloudACAccount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v23;

    if (!objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "length"))
      goto LABEL_16;
    -[ICCollaborationController containerForAccountID:](self, "containerForAccountID:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICCollaborationController cloudContext](self, "cloudContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "containersByAccountID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (unint64_t)objc_msgSend(v26, "count") > 1;

    if (!v27)
      goto LABEL_16;
    v28 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:].cold.6();

    -[ICCollaborationController containerForUserRecordID:](self, "containerForUserRecordID:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "options");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "accountOverrideInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "accountID");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v31;

  }
  if (!v15)
  {
LABEL_16:
    objc_msgSend(v8, "containerIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33 == 0;

    if (v34)
    {
      v15 = 0;
    }
    else
    {
      v35 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:].cold.4();

      v36 = (void *)MEMORY[0x1E0C94C28];
      objc_msgSend(v8, "containerIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "containerWithIdentifier:", v37);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "length"))
    goto LABEL_26;
  v38 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:].cold.3();

  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke;
  v47[3] = &unk_1E5C1D9D0;
  p_buf = &buf;
  v48 = v9;
  -[NSObject performBlockAndWait:](v48, "performBlockAndWait:", v47);
  v16 = v48;
LABEL_25:

LABEL_26:
  if (!v15)
  {
    v39 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:].cold.1();
    goto LABEL_34;
  }
  if (!objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "length"))
  {
    v39 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:].cold.2();
LABEL_34:

    ICGenericError();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v10 + 2))(v10, v40, 0, 0);

    goto LABEL_35;
  }
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke_109;
  v41[3] = &unk_1E5C22260;
  v41[4] = self;
  v42 = v8;
  v46 = &buf;
  v43 = v9;
  v45 = v10;
  v44 = v15;
  objc_msgSend(v43, "performBlock:", v41);

LABEL_35:
  _Block_object_dispose(&buf, 8);

}

void __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D639C8], "cloudKitAccountInContext:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke_109(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  _QWORD block[5];
  id v21;
  id v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "share");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForShare:accountID:context:", v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v4, "serverShare"), (v5 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v6 = (void *)v5, v7 = objc_msgSend(v4, "markedForDeletion"), v6, (v7 & 1) == 0))
  {
    v14 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "shortLoggingDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "share");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ic_loggingDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v15;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1AC7A1000, v14, OS_LOG_TYPE_DEFAULT, "Found existing object %@ for share metadata %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "share");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didAcceptShare:", v18);

    objc_msgSend(*(id *)(a1 + 48), "ic_save");
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "share");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ic_loggingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_1AC7A1000, v8, OS_LOG_TYPE_INFO, "No existing object for share metadata %@", buf, 0xCu);

    }
    dispatch_get_global_queue(2, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke_110;
    block[3] = &unk_1E5C22238;
    v12 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v21 = v12;
    v22 = *(id *)(a1 + 56);
    v19 = *(_OWORD *)(a1 + 64);
    v13 = (id)v19;
    v23 = v19;
    dispatch_async(v11, block);

  }
}

uint64_t __92__ICCollaborationController_acceptShareWithMetadata_managedObjectContext_completionHandler___block_invoke_110(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "acceptShareWithMetadata:container:accountID:fetchObjectWithCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 56));
}

- (id)containerForUserRecordID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCollaborationController cloudContext](self, "cloudContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containersByAccountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(MEMORY[0x1E0D63A80], "userRecordNameForContainer:", v12, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v4))
        {
          v9 = v12;

          goto LABEL_11;
        }

      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)containerForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "accountID.length > 0", "-[ICCollaborationController containerForAccountID:]", 1, 0, CFSTR("Must have an account ID to get container."));
  if (objc_msgSend(v4, "length"))
  {
    -[ICCollaborationController cloudContext](self, "cloudContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containersByAccountID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)acceptShareWithMetadata:(id)a3 container:(id)a4 accountID:(id)a5 fetchObjectWithCompletionHandler:(id)a6
{
  -[ICCollaborationController acceptShareWithMetadata:attemptNumber:container:accountID:fetchObjectWithCompletionHandler:](self, "acceptShareWithMetadata:attemptNumber:container:accountID:fetchObjectWithCompletionHandler:", a3, 0, a4, a5, a6);
}

- (void)acceptShareWithMetadata:(id)a3 attemptNumber:(id)a4 container:(id)a5 accountID:(id)a6 fetchObjectWithCompletionHandler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  char *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  id v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  ICCollaborationController *v46;
  id v47;
  id v48;
  NSObject *v49;
  id v50;
  id v51;
  id v52[2];
  _QWORD v53[4];
  id v54;
  id location;
  id v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v39 = a5;
  v40 = a6;
  v42 = a7;
  objc_msgSend(v11, "share");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URL");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v41)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((shareURL) != nil)", "-[ICCollaborationController acceptShareWithMetadata:attemptNumber:container:accountID:fetchObjectWithCompletionHandler:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "shareURL");
  v14 = os_log_create("com.apple.notes", "Collaboration");
  v15 = (char *)os_signpost_id_generate(v14);
  v16 = v14;
  v17 = v16;
  if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "com.apple.notes.collaboration.acceptShare", ", buf, 2u);
  }

  if (!objc_msgSend(v12, "unsignedIntegerValue"))
  {

    v12 = &unk_1E5C71EC8;
  }
  if ((unint64_t)objc_msgSend(v12, "unsignedIntegerValue") < 6)
  {
    v21 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v58 = v41;
      v59 = 2112;
      v60 = v40;
      v61 = 2112;
      v62 = v12;
      _os_log_impl(&dword_1AC7A1000, v21, OS_LOG_TYPE_DEFAULT, "Accepting shared object at URL: %@, account ID = %@, attemptNumber = %@", buf, 0x20u);
    }

    v22 = objc_alloc(MEMORY[0x1E0C94B78]);
    v56 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v22, "initWithShareMetadatas:", v23);

    objc_msgSend(v20, "setQualityOfService:", 25);
    objc_msgSend(v20, "setQueuePriority:", 8);
    objc_msgSend(v20, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContainer:", v39);

    objc_msgSend(v20, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDiscretionaryNetworkBehavior:", 0);

    objc_initWeak(&location, v20);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke;
    v53[3] = &unk_1E5C22288;
    v28 = v26;
    v54 = v28;
    objc_msgSend(v20, "setPerShareCompletionBlock:", v53);
    v43[0] = v27;
    v43[1] = 3221225472;
    v43[2] = __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2;
    v43[3] = &unk_1E5C22328;
    v29 = v11;
    v44 = v29;
    objc_copyWeak(v52, &location);
    v45 = v12;
    v46 = self;
    v47 = v39;
    v48 = v40;
    v51 = v42;
    v49 = v17;
    v52[1] = v15;
    v30 = v28;
    v50 = v30;
    objc_msgSend(v20, "setAcceptSharesCompletionBlock:", v43);
    v31 = objc_alloc_init(MEMORY[0x1E0C94F88]);
    objc_msgSend(v31, "setName:", CFSTR("AcceptShare"));
    objc_msgSend(v31, "setQuantity:", 1);
    objc_msgSend(v31, "setExpectedSendSize:", 1);
    objc_msgSend(v31, "setExpectedReceiveSize:", 1);
    objc_msgSend(v20, "setGroup:", v31);
    v32 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v29, "share");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "ic_loggingDescription");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ic_loggingDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v58 = v34;
      v59 = 2112;
      v60 = v35;
      _os_log_impl(&dword_1AC7A1000, v32, OS_LOG_TYPE_DEFAULT, "Accepting %@ with %@", buf, 0x16u);

    }
    -[ICCollaborationController cloudContext](self, "cloudContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "operationQueue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addOperation:", v20);

    objc_destroyWeak(v52);
    objc_destroyWeak(&location);
    goto LABEL_19;
  }
  v18 = v17;
  v19 = v18;
  if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v19, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v15, "com.apple.notes.collaboration.acceptShare", ", buf, 2u);
  }

  if (v42)
  {
    ICGenericError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, id))v42 + 2))(v42, v20, 0, v40);
LABEL_19:

  }
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  if (a3)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a3;
    objc_msgSend(v4, "recordID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v5);

  }
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44[2];
  _QWORD block[5];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Collaboration");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2_cold_2(a1, (uint64_t)v3, v5);

    if (objc_msgSend(v3, "ic_shouldRetryCloudKitError")
      && (unint64_t)objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue") <= 4)
    {
      v6 = dispatch_time(0, 1000000000 * objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
      v7 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2_cold_1(a1, v7);

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_118;
      block[3] = &unk_1E5C222B0;
      block[4] = *(_QWORD *)(a1 + 48);
      v46 = *(id *)(a1 + 32);
      v47 = *(id *)(a1 + 40);
      v48 = *(id *)(a1 + 56);
      v49 = *(id *)(a1 + 64);
      v50 = *(id *)(a1 + 88);
      dispatch_after(v6, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v8 = *(id *)(a1 + 72);
      v9 = v8;
      v10 = *(_QWORD *)(a1 + 104);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v9, OS_SIGNPOST_INTERVAL_END, v10, "com.apple.notes.collaboration.acceptShare", ", buf, 2u);
      }

      v11 = *(_QWORD *)(a1 + 88);
      if (v11)
        (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v11 + 16))(v11, v3, 0, *(_QWORD *)(a1 + 64));
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "share");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
      objc_msgSend(WeakRetained, "ic_loggingDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = v13;
      v54 = 2112;
      v55 = v15;
      _os_log_impl(&dword_1AC7A1000, v5, OS_LOG_TYPE_INFO, "Share accepted for URL %@ %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "hierarchicalRootRecordID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = os_log_create("com.apple.notes", "Collaboration");
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        objc_msgSend(v16, "ic_loggingDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 64);
        *(_DWORD *)buf = 138412546;
        v53 = v19;
        v54 = 2112;
        v55 = v20;
        _os_log_impl(&dword_1AC7A1000, v17, OS_LOG_TYPE_DEFAULT, "Fetching record from share %@, account ID = %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 48), "cloudContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 64);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_121;
      v35[3] = &unk_1E5C22300;
      v24 = v16;
      v25 = *(_QWORD *)(a1 + 48);
      v36 = v24;
      v37 = v25;
      v38 = *(id *)(a1 + 32);
      v39 = *(id *)(a1 + 80);
      objc_copyWeak(v44, (id *)(a1 + 96));
      v40 = *(id *)(a1 + 64);
      v26 = *(id *)(a1 + 72);
      v27 = *(void **)(a1 + 104);
      v41 = v26;
      v44[1] = v27;
      v28 = *(id *)(a1 + 88);
      v42 = 0;
      v43 = v28;
      objc_msgSend(v21, "fetchRecordIDs:accountID:operationGroupName:completionHandler:", v22, v23, CFSTR("FetchRecordForAcceptedShare"), v35);

      objc_destroyWeak(v44);
    }
    else
    {
      if (v18)
      {
        objc_msgSend(*(id *)(a1 + 32), "share");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "ic_loggingDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v30;
        _os_log_impl(&dword_1AC7A1000, v17, OS_LOG_TYPE_DEFAULT, "No root record when accepting share: %@", buf, 0xCu);

      }
      v31 = *(id *)(a1 + 72);
      v32 = v31;
      v33 = *(_QWORD *)(a1 + 104);
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v32, OS_SIGNPOST_INTERVAL_END, v33, "com.apple.notes.collaboration.acceptShare", ", buf, 2u);
      }

      v34 = *(_QWORD *)(a1 + 88);
      if (v34)
        (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v34 + 16))(v34, 0, 0, *(_QWORD *)(a1 + 64));
    }

  }
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_118(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "unsignedIntegerValue") + 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptShareWithMetadata:attemptNumber:container:accountID:fetchObjectWithCompletionHandler:", v3, v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_121(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Collaboration");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_121_cold_1(a1, (uint64_t)v3, v5);
    v6 = v5;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v7;
      _os_log_impl(&dword_1AC7A1000, v5, OS_LOG_TYPE_DEFAULT, "Fetched record from share %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "backgroundContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_122;
    v15[3] = &unk_1E5C222D8;
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    objc_copyWeak(&v22, (id *)(a1 + 96));
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 64);
    v6 = v8;
    v9 = *(_QWORD *)(a1 + 40);
    v20 = v6;
    v21 = v9;
    -[NSObject performBlockAndWait:](v6, "performBlockAndWait:", v15);

    objc_destroyWeak(&v22);
    v5 = v16;
  }

  v10 = *(id *)(a1 + 72);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 104);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v11, OS_SIGNPOST_INTERVAL_END, v12, "com.apple.notes.collaboration.acceptShare", ", buf, 2u);
  }

  v13 = *(_QWORD *)(a1 + 88);
  if (v13)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v13 + 16))(v13, *(_QWORD *)(a1 + 80), 0, *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "cloudContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "syncWithReason:uploadUnsyncedChanges:completionHandler:", CFSTR("SyncAfterAcceptShare"), 0, 0);

}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_122(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "share");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "share");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_122_cold_2(v7);

  if (!v7)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "share");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_122_cold_1(v7);

  }
  objc_msgSend(MEMORY[0x1E0D63A90], "objectWithRecordID:accountID:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didAcceptShare:", v7);
  objc_msgSend(*(id *)(a1 + 72), "collaborationAnalyticsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackCollaborationNotificationAcceptanceForObject:shareURL:", v10, v12);

  objc_msgSend(*(id *)(a1 + 72), "collaborationControllerDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "collaborationController:persistJoinActivityEventOnObject:", *(_QWORD *)(a1 + 72), v10);

  objc_msgSend(*(id *)(a1 + 64), "ic_save");
}

- (void)fetchAndAcceptShareMetadataWithURL:(id)a3 managedObjectContext:(id)a4 alertBlock:(id)a5 showObjectBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    -[ICCollaborationController collaborationControllerDelegate](self, "collaborationControllerDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke;
    v17[3] = &unk_1E5C223A0;
    v17[4] = self;
    v20 = v12;
    v18 = v10;
    v19 = v11;
    v21 = v13;
    objc_msgSend(v14, "collaborationController:fetchShareMetadataWithURLs:completion:", self, v15, v17);

  }
  else
  {
    v16 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ICCollaborationController fetchAndAcceptShareMetadataWithURL:managedObjectContext:alertBlock:showObjectBlock:].cold.1();

  }
}

void __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a2;
  v9 = a4;
  v12 = a1[7];
  v10 = a1[5];
  v11 = a1[6];
  v13 = a1[8];
  v7 = v6;
  v8 = v9;
  performBlockOnMainThread();

}

void __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke_2_cold_1();

    objc_msgSend((id)objc_opt_class(), "genericShareErrorAlert:", *(_QWORD *)(a1 + 72));
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[2] = __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke_127;
    v8[3] = &unk_1E5C22350;
    v5 = *(void **)(a1 + 48);
    v8[4] = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 72);
    v8[1] = 3221225472;
    v9 = v5;
    v10 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 80);
    objc_msgSend(v3, "processShareAcceptanceWithMetadata:managedObjectContext:alertBlock:showObjectBlock:", v4, v6, v7, v8);

  }
}

void __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke_127(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "collaborationControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collaborationController:userAcceptedInvitationWithShareMetadata:associatedObjectID:", v5, v6, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)processShareAcceptanceWithMetadata:(id)a3 managedObjectContext:(id)a4 alertBlock:(id)a5 showObjectBlock:(id)a6
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
  ICCollaborationController *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke;
  v18[3] = &unk_1E5C223F0;
  v19 = v10;
  v20 = self;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v14 = v13;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  -[ICCollaborationController acceptShareWithMetadata:managedObjectContext:completionHandler:](self, "acceptShareWithMetadata:managedObjectContext:completionHandler:", v17, v15, v18);

}

void __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  char v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(_QWORD *);
  void *v38;
  id v39;
  id v40;
  id v41;
  __int128 *p_buf;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t v55[4];
  void *v56;
  __int128 buf;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "hierarchicalRootRecordID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
  {
    v11 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke_cold_1();

    if ((objc_msgSend((id)objc_opt_class(), "showCloudKitShareAcceptancePartialFailureAlertForError:alertBlock:", v7, *(_QWORD *)(a1 + 56)) & 1) == 0)objc_msgSend((id)objc_opt_class(), "genericShareErrorAlert:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (v8)
      v12 = v9 == 0;
    else
      v12 = 1;
    v13 = !v12;
    v14 = os_log_create("com.apple.notes", "Collaboration");
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if ((v13 & 1) != 0)
    {
      if (v15)
      {
        objc_msgSend(v10, "ic_loggingDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_1AC7A1000, v14, OS_LOG_TYPE_DEFAULT, "Trying to show shared object %@", (uint8_t *)&buf, 0xCu);

      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v58 = 0x3032000000;
      v59 = __Block_byref_object_copy__47;
      v60 = __Block_byref_object_dispose__47;
      v61 = 0;
      v49 = 0;
      v50 = &v49;
      v51 = 0x3032000000;
      v52 = __Block_byref_object_copy__47;
      v53 = __Block_byref_object_dispose__47;
      v54 = 0;
      v45 = 0;
      v46 = &v45;
      v47 = 0x2020000000;
      v48 = 0;
      v17 = *(void **)(a1 + 48);
      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke_130;
      v38 = &unk_1E5C223C8;
      p_buf = &buf;
      v39 = v10;
      v40 = v8;
      v41 = *(id *)(a1 + 48);
      v43 = &v49;
      v44 = &v45;
      objc_msgSend(v17, "performBlockAndWait:", &v35);
      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        v18 = *((unsigned __int8 *)v46 + 24);
        v19 = os_log_create("com.apple.notes", "Collaboration");
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          if (v20)
          {
            v21 = (void *)v50[5];
            *(_DWORD *)v55 = 138412290;
            v56 = v21;
            _os_log_impl(&dword_1AC7A1000, v19, OS_LOG_TYPE_DEFAULT, "Showing shared object %@", v55, 0xCu);
          }

          v22 = *(_QWORD *)(a1 + 64);
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectID", v35, v36, v37, v38, v39, v40);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, uint64_t))(v22 + 16))(v22, v23, a3);
        }
        else
        {
          if (v20)
          {
            v29 = (void *)v50[5];
            *(_DWORD *)v55 = 138412290;
            v56 = v29;
            _os_log_impl(&dword_1AC7A1000, v19, OS_LOG_TYPE_DEFAULT, "Found shared %@, but doing nothing", v55, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Item Unavailable"), CFSTR("Item Unavailable"), 0, 1, v35, v36, v37, v38, v39, v40);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "userInterfaceIdiom");

          if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1)
            v32 = CFSTR("To view this item, update to the latest version of iPadOS.");
          else
            v32 = CFSTR("To view this item, update to the latest version of iOS.");
          objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v32, v32, 0, 1);
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = (void *)v33;
          if (v23 && v33)
            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

        }
      }
      else
      {
        v26 = os_log_create("com.apple.notes", "Collaboration");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "share", v35, v36, v37, v38, v39, v40);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "ic_loggingDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v55 = 138412290;
          v56 = v28;
          _os_log_impl(&dword_1AC7A1000, v26, OS_LOG_TYPE_DEFAULT, "Unable to find note after accepting share %@", v55, 0xCu);

        }
        objc_msgSend((id)objc_opt_class(), "genericShareErrorAlert:", *(_QWORD *)(a1 + 56));
      }

      _Block_object_dispose(&v45, 8);
      _Block_object_dispose(&v49, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 32), "share");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "ic_loggingDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v25;
        _os_log_impl(&dword_1AC7A1000, v14, OS_LOG_TYPE_DEFAULT, "No root record or no accountID when accepting share: %@", (uint8_t *)&buf, 0xCu);

      }
    }
  }

}

uint64_t __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke_130(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x1E0D63A90], "objectWithRecordID:accountID:context:", a1[4], a1[5], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (result)
  {
    objc_msgSend((id)result, "shortLoggingDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[8] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), result = objc_opt_isKindOfClass(), (result & 1) != 0))
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "isUnsupported");
      v9 = result ^ 1;
    }
    else
    {
      v9 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = v9;
  }
  return result;
}

+ (void)genericShareErrorAlert:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Can’t Open Note"), CFSTR("Can’t Open Note"), 0, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Sorry, this note can’t be opened right now. Please try again later."), CFSTR("Sorry, this note can’t be opened right now. Please try again later."), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *))a3 + 2))(v5, v7, v6);

}

+ (BOOL)showCloudKitShareAcceptancePartialFailureAlertForError:(id)a3 alertBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C947D8]) & 1) == 0)
  {

    goto LABEL_6;
  }
  v8 = objc_msgSend(v5, "code");

  if (v8 != 2)
  {
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v5, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__ICCollaborationController_showCloudKitShareAcceptancePartialFailureAlertForError_alertBlock___block_invoke;
  v13[3] = &unk_1E5C22418;
  v14 = v6;
  v15 = &v16;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);
  v11 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
LABEL_7:

  return v11;
}

void __95__ICCollaborationController_showCloudKitShareAcceptancePartialFailureAlertForError_alertBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "code") == 29)
  {
    v7 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1AC7A1000, v7, OS_LOG_TYPE_DEFAULT, "Share is at maximum capacity, showing alert for error: %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Note at Capacity"), CFSTR("Note at Capacity"), 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("This note is at maximum capacity right now. Try again soon."), CFSTR("This note is at maximum capacity right now. Try again soon."), 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

+ (id)highlightColorForUserID:(id)a3 inNote:(id)a4 isDark:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "collaborationColorManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "highlightColorForUserID:note:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0.8;
  if (!v5)
    v11 = 1.0;
  objc_msgSend(v10, "colorWithAlphaComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)updateShares
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Updating shares…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __41__ICCollaborationController_updateShares__block_invoke(int8x16_t *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  id v10;
  int8x16_t v11;

  v4 = a3;
  v5 = (void *)a1[2].i64[0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__ICCollaborationController_updateShares__block_invoke_2;
  v9[3] = &unk_1E5C1D7C0;
  v10 = v4;
  v8 = a1[2];
  v6 = (id)v8.i64[0];
  v11 = vextq_s8(v8, v8, 8uLL);
  v7 = v4;
  objc_msgSend(v5, "performBlock:", v9);

}

void __41__ICCollaborationController_updateShares__block_invoke_2(uint64_t a1)
{
  NSObject *v1;

  if (*(_QWORD *)(a1 + 32))
  {
    v1 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __41__ICCollaborationController_updateShares__block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setIsShareDirty:", 0);
    objc_msgSend(*(id *)(a1 + 48), "ic_saveWithLogDescription:", CFSTR("Finished updating share"));
  }
}

- (void)updatePendingInvitationsInAccountWithID:(id)a3 receivedSince:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  ICCollaborationController *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((updatePendingInvitationsInAccountWithID_receivedSince__isUpdatingPendingInvitations & 1) == 0)
  {
    v8 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v17 = v6;
      v18 = 2112;
      v20 = 2080;
      v19 = v7;
      v21 = "-[ICCollaborationController updatePendingInvitationsInAccountWithID:receivedSince:]";
      v22 = 1024;
      v23 = 1512;
      _os_log_impl(&dword_1AC7A1000, v8, OS_LOG_TYPE_DEFAULT, "Updating pending invitations… {accountID: %@, receivedSince: %@}%s:%d", buf, 0x26u);
    }

    updatePendingInvitationsInAccountWithID_receivedSince__isUpdatingPendingInvitations = 1;
    -[ICCollaborationController viewContext](self, "viewContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke;
    v11[3] = &unk_1E5C1F1B0;
    v12 = v6;
    v13 = v9;
    v14 = v7;
    v15 = self;
    v10 = v9;
    objc_msgSend(v10, "performBlock:", v11);

  }
}

void __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "objectWithID:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D63B58], "predicateForPendingInvitationsInAccount:receivedSince:", v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63B58], "invitationsMatchingPredicate:context:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_map:", &__block_literal_global_154);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "collaborationControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke_3;
  v10[3] = &unk_1E5C224A8;
  v11 = v3;
  v12 = *(id *)(a1 + 40);
  v9 = v3;
  objc_msgSend(v7, "collaborationController:fetchShareMetadataWithURLs:completion:", v8, v6, v10);

}

uint64_t __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shareURL");
}

void __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v6 = a2;
  v9 = a4;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = v9;
  performBlockOnMainThread();

}

void __83__ICCollaborationController_updatePendingInvitationsInAccountWithID_receivedSince___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char *v18;
  void *v19;
  __int128 v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      v28 = v3;
      v29 = 2112;
      v30 = v4;
      v31 = 2080;
      v32 = "-[ICCollaborationController updatePendingInvitationsInAccountWithID:receivedSince:]_block_invoke_4";
      v33 = 1024;
      v34 = 1533;
      _os_log_impl(&dword_1AC7A1000, v2, OS_LOG_TYPE_DEFAULT, "Error updating pending invitations {accountID: %@, error: %@}%s:%d", buf, 0x26u);

    }
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v23;
      v10 = 0x1E0D63000uLL;
      *(_QWORD *)&v7 = 138412546;
      v20 = v7;
      v21 = v5;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v5);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v12, v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "share");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v10 + 2904), "invitationWithShareURL:context:", v12, *(_QWORD *)(a1 + 56));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "updateFromShare:", v14);
          v16 = os_log_create("com.apple.notes", "Collaboration");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v14, "ic_loggingDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectID");
            v18 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v28 = v17;
            v29 = 2112;
            v30 = v18;
            _os_log_debug_impl(&dword_1AC7A1000, v16, OS_LOG_TYPE_DEBUG, "Updated invitation {share: %@, objectID: %@}", buf, 0x16u);

            v10 = 0x1E0D63000;
            v5 = v21;
          }

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(a1 + 56), "ic_save");
    v2 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v19;
      v29 = 2080;
      v30 = "-[ICCollaborationController updatePendingInvitationsInAccountWithID:receivedSince:]_block_invoke";
      v31 = 1024;
      LODWORD(v32) = 1550;
      _os_log_impl(&dword_1AC7A1000, v2, OS_LOG_TYPE_DEFAULT, "Updated pending invitations {accountID: %@}%s:%d", buf, 0x1Cu);

    }
  }

  updatePendingInvitationsInAccountWithID_receivedSince__isUpdatingPendingInvitations = 0;
}

+ (void)showQuotaExceededAlertIfNeededWithRecordID:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collaborationControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collaborationController:showQuotaExceededAlertIfNeededWithRecordID:accountID:", v9, v7, v6);

}

- (id)objectForCKShareRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  if (a3)
  {
    v10 = a3;
    -[ICCollaborationController ckShareIDToRootRecordID](self, "ckShareIDToRootRecordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[ICCollaborationController cloudContext](self, "cloudContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "existingCloudObjectForRecordID:recordType:accountID:context:", v12, 0, v8, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)updateRootRecordMapWithShare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D638C8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v6)
    {
      -[ICCollaborationController ckShareIDToRootRecordID](self, "ckShareIDToRootRecordID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "containsObject:", v10);

      if ((v11 & 1) != 0)
      {
LABEL_7:

        v4 = v13;
        goto LABEL_8;
      }
      -[ICCollaborationController ckShareIDToRootRecordID](self, "ckShareIDToRootRecordID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v12);

    }
    goto LABEL_7;
  }
LABEL_8:

}

+ (void)saveActivityType:(id)a3 isCollaborationSelected:(BOOL)a4 error:(id)a5 completed:(BOOL)a6 forNote:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v7 = a6;
  v9 = a4;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  objc_msgSend(a1, "sharedInstance");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "collaborationAnalyticsTracker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "saveActivityType:isCollaborationSelected:error:completed:forNote:", v14, v9, v13, v7, v12);

}

+ (void)trackShare:(id)a3 forNote:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collaborationAnalyticsTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackShare:forNote:", v7, v6);

}

- (ICCollaborationControllerDelegate)collaborationControllerDelegate
{
  return (ICCollaborationControllerDelegate *)objc_loadWeakRetained((id *)&self->_collaborationControllerDelegate);
}

- (void)setCollaborationControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_collaborationControllerDelegate, a3);
}

- (ICCollaborationAnalyticsDelegate)collaborationAnalyticsDelegate
{
  return (ICCollaborationAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_collaborationAnalyticsDelegate);
}

- (ICCollaborationAnalyticsTracker)collaborationAnalyticsTracker
{
  return self->_collaborationAnalyticsTracker;
}

- (void)setCollaborationAnalyticsTracker:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationAnalyticsTracker, a3);
}

- (ICSelectorDelayer)updateSharesDelayer
{
  return self->_updateSharesDelayer;
}

- (NSMutableDictionary)ckShareIDToRootRecordID
{
  return self->_ckShareIDToRootRecordID;
}

- (void)setCkShareIDToRootRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_ckShareIDToRootRecordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckShareIDToRootRecordID, 0);
  objc_storeStrong((id *)&self->_updateSharesDelayer, 0);
  objc_storeStrong((id *)&self->_collaborationAnalyticsTracker, 0);
  objc_destroyWeak((id *)&self->_collaborationAnalyticsDelegate);
  objc_destroyWeak((id *)&self->_collaborationControllerDelegate);
}

- (void)registerShareForObject:itemProvider:generateThumbnails:sharePreparationHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "Trying to registerShareForObject with empty accountID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "Trying to registerShareForObject with nil container", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_2(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "No existing share for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

void __108__ICCollaborationController_registerShareForObject_itemProvider_generateThumbnails_sharePreparationHandler___block_invoke_cold_3(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*a2, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v3, v4, "Hierarchical share exists, using share %@ for managing sharing for %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

void __97__ICCollaborationController_updatedShareForObject_includeHierarchicalShare_managedObjectContext___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_15();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v1), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v0 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v4, v5, "Checking for an existing share for %@, includeHierarchicalShare=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_15();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v1), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 40), "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v4, v5, "Preparing share %@ for %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

void __87__ICCollaborationController_prepareShare_forObject_qualityOfService_completionHandler___block_invoke_4_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_14(a1), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Finished waiting for operations before preparing share for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)saveShare:forObject:accountID:container:qualityOfService:retryPrepHandler:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "saveShare:forObject:qualityOfService:completionHandler: shareArgument is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)saveShare:(NSObject *)a3 withRootRecord:object:accountID:container:qualityOfService:completionHandler:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "ic_loggingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1AC7A1000, a3, v7, "Tried to save a share (%@) without an account ID for object: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_4();
}

- (void)saveShare:(NSObject *)a3 withRootRecord:object:accountID:container:qualityOfService:completionHandler:.cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "ic_loggingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1AC7A1000, a3, v7, "Tried to save a mismatched share (%@) for object: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_4();
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  OUTLINED_FUNCTION_15();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v2 + 40), "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 56), "ic_loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1AC7A1000, v0, v5, "No CKShare or error returned for %@ %@", v6);

  OUTLINED_FUNCTION_4();
}

void __116__ICCollaborationController_saveShare_withRootRecord_object_accountID_container_qualityOfService_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_15();
  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v2 + 32), "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 40), "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 48), "ic_loggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(v1 + 56);
  v7 = 138413058;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  v13 = 2112;
  v14 = v6;
  _os_log_error_impl(&dword_1AC7A1000, v0, OS_LOG_TYPE_ERROR, "Error saving share %@ for %@ %@: %@", (uint8_t *)&v7, 0x2Au);

}

- (void)fetchShareIfNecessaryForObject:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "Trying to fetchShareIfNecessaryForObject with empty accountID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)fetchShareIfNecessaryForObject:completionHandler:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_15();
  *(_DWORD *)v2 = 138412546;
  *(_QWORD *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2112;
  *(_QWORD *)(v2 + 14) = v4;
  _os_log_debug_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_DEBUG, "Fetching share %@ with %@", v5, 0x16u);

}

void __78__ICCollaborationController_fetchShareIfNecessaryForObject_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(a1, "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a2 + 72));
  objc_msgSend(WeakRetained, "ic_loggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v6, v7, "Fetched share %@ %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_4();
}

- (void)objectForShare:(void *)a1 accountID:context:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "No record type in share %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

void __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "removeShareIfNeededWithOwnedObjectID :: Deleting share for objectID %@ succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __102__ICCollaborationController_removeShareIfNeededWithOwnedObjectID_countParticipants_completionHandler___block_invoke_3_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_16();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_1_1(&dword_1AC7A1000, v1, (uint64_t)v1, "removeShareIfNeededWithOwnedObjectID :: Deleting share for objectID %@ failed with error %@", v2);
  OUTLINED_FUNCTION_2();
}

void __63__ICCollaborationController_didStopSharing_recordID_accountID___block_invoke_98_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "An error has occured when syncing the deletion of the share in didStopSharing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Couldn't find container for metadata %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Couldn't find account id for container %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Single account or unable to fetch account ID. Using cloudKitAccountInContext.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Single account or unable to fetch container. Using containerWithIdentifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "userRecordID is CKCurrentUserDefaultName. Fetching accountID and container.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)acceptShareWithMetadata:managedObjectContext:completionHandler:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Multiple accounts detected. Fetching container and accountID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];

  objc_msgSend((id)OUTLINED_FUNCTION_14(a1), "share");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  objc_msgSend(WeakRetained, "ic_loggingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1AC7A1000, a2, v8, "Retrying accept share at URL %@ %@", v9);

}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  __int16 v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "share");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  objc_msgSend(WeakRetained, "ic_loggingDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138412802;
  v12 = v7;
  OUTLINED_FUNCTION_3_1();
  v13 = v10;
  v14 = a2;
  _os_log_error_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_ERROR, "Error accepting share at URL %@ %@: %@", (uint8_t *)&v11, 0x20u);

}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_121_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_14(a1), "ic_loggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_1_1(&dword_1AC7A1000, a3, v6, "Error fetching record from share %@: %@", v7);

  OUTLINED_FUNCTION_4();
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_122_cold_1(void *a1)
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

  objc_msgSend(a1, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  v2 = OUTLINED_FUNCTION_17();
  objc_msgSend(v2, "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v4, v5, "Falling back to share from metadata %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

void __120__ICCollaborationController_acceptShareWithMetadata_attemptNumber_container_accountID_fetchObjectWithCompletionHandler___block_invoke_122_cold_2(void *a1)
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

  objc_msgSend(a1, "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  v2 = OUTLINED_FUNCTION_17();
  objc_msgSend(v2, "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v4, v5, "Using share from per-share completion block %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

- (void)fetchAndAcceptShareMetadataWithURL:managedObjectContext:alertBlock:showObjectBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "URL was nil, cannot fetch and accept share.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __112__ICCollaborationController_fetchAndAcceptShareMetadataWithURL_managedObjectContext_alertBlock_showObjectBlock___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Error fetching share. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __112__ICCollaborationController_processShareAcceptanceWithMetadata_managedObjectContext_alertBlock_showObjectBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Error accepting share. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __41__ICCollaborationController_updateShares__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Error updating share {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end

@implementation PHLibraryScope

+ (id)managedEntityName
{
  return CFSTR("LibraryScope");
}

+ (id)fetchActiveLibraryScopeWithOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHLibraryScope.m"), 231, CFSTR("Valid PHPhotoLibrary must be specified via fetch options"));

  }
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v5, &__block_literal_global_92);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __53__PHLibraryScope_fetchActiveLibraryScopeWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForActiveLibraryScopeWithOptions:](PHQuery, "queryForActiveLibraryScopeWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)managedObjectSupportsShareTrashedState
{
  return 1;
}

+ (BOOL)managedObjectSupportsShareExpiredState
{
  return 1;
}

+ (BOOL)managedObjectSupportsShareExitingState
{
  return 1;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_27597;
}

id __64__PHLibraryScope_fetchPendingLibraryScopeInvitationWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForPendingLibraryScopeInvitationWithOptions:](PHQuery, "queryForPendingLibraryScopeInvitationWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54__PHLibraryScope_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[19];

  v4[18] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("title");
  v4[1] = CFSTR("creationDate");
  v4[2] = CFSTR("uuid");
  v4[3] = CFSTR("status");
  v4[4] = CFSTR("shareURL");
  v4[5] = CFSTR("scopeIdentifier");
  v4[6] = CFSTR("expiryDate");
  v4[7] = CFSTR("trashedState");
  v4[8] = CFSTR("publishState");
  v4[9] = CFSTR("participantCloudUpdateState");
  v4[10] = CFSTR("autoSharePolicy");
  v4[11] = CFSTR("previewState");
  v4[12] = CFSTR("publicPermission");
  v4[13] = CFSTR("rulesData");
  v4[14] = CFSTR("cloudPhotoCount");
  v4[15] = CFSTR("cloudVideoCount");
  v4[16] = CFSTR("cloudItemCount");
  v4[17] = CFSTR("exitState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 18);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_27590;
  transformValueExpression_forKeyPath___passThroughSet_27590 = v2;

}

id __54__PHLibraryScope_fetchPreviewLibraryScopeWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForPreviewLibraryScopeWithOptions:](PHQuery, "queryForPreviewLibraryScopeWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __30__PHLibraryScope_entityKeyMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PHEntityKeyMap *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  _QWORD v42[19];
  _QWORD v43[21];

  v43[19] = *MEMORY[0x1E0C80C00];
  v17 = [PHEntityKeyMap alloc];
  v41 = CFSTR("title");
  v42[0] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v22;
  v42[1] = CFSTR("creationDate");
  v40 = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v21;
  v42[2] = CFSTR("uuid");
  v39 = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v20;
  v42[3] = CFSTR("status");
  v38 = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v19;
  v42[4] = CFSTR("shareURL");
  v37 = CFSTR("shareURL");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v18;
  v42[5] = CFSTR("scopeIdentifier");
  v36 = CFSTR("scopeIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v16;
  v42[6] = CFSTR("expiryDate");
  v35 = CFSTR("expiryDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v15;
  v42[7] = CFSTR("trashedState");
  v34 = CFSTR("trashedState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v14;
  v42[8] = CFSTR("localPublishState");
  v33 = CFSTR("publishState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v13;
  v42[9] = CFSTR("participantCloudUpdateState");
  v32 = CFSTR("participantCloudUpdateState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[9] = v12;
  v42[10] = CFSTR("autoSharePolicy");
  v31 = CFSTR("autoSharePolicy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v43[10] = v0;
  v42[11] = CFSTR("scopeSyncingState");
  v30 = CFSTR("scopeSyncingState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v43[11] = v1;
  v42[12] = CFSTR("previewState");
  v29 = CFSTR("previewState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v43[12] = v2;
  v42[13] = CFSTR("publicPermission");
  v28 = CFSTR("publicPermission");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43[13] = v3;
  v42[14] = CFSTR("rulesData");
  v27 = CFSTR("rulesData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43[14] = v4;
  v42[15] = CFSTR("cloudPhotoCount");
  v26 = CFSTR("cloudPhotoCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43[15] = v5;
  v42[16] = CFSTR("cloudVideoCount");
  v25 = CFSTR("cloudVideoCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43[16] = v6;
  v42[17] = CFSTR("cloudItemCount");
  v24 = CFSTR("cloudItemCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43[17] = v7;
  v42[18] = CFSTR("exitState");
  v23 = CFSTR("exitState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[18] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v17, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_15_27597;
  entityKeyMap_pl_once_object_15_27597 = v10;

}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PHLibraryScope_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_27589 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_27589, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_27590, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)fetchPreviewLibraryScopeWithOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHLibraryScope.m"), 239, CFSTR("Valid PHPhotoLibrary must be specified via fetch options"));

  }
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v5, &__block_literal_global_93);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchPendingLibraryScopeInvitationWithOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHLibraryScope.m"), 247, CFSTR("Valid PHPhotoLibrary must be specified via fetch options"));

  }
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v5, &__block_literal_global_94);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHLibraryScope)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHLibraryScope *v9;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSDate *creationDate;
  void *v14;
  uint64_t v15;
  NSURL *shareURL;
  uint64_t v17;
  NSString *scopeIdentifier;
  uint64_t v19;
  NSDate *expiryDate;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSData *rulesData;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v35;

  v8 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PHLibraryScope;
  v9 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v35, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v9->_title;
    v9->_title = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("status"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_status = objc_msgSend(v14, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shareURL"));
    v15 = objc_claimAutoreleasedReturnValue();
    shareURL = v9->_shareURL;
    v9->_shareURL = (NSURL *)v15;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scopeIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    scopeIdentifier = v9->_scopeIdentifier;
    v9->_scopeIdentifier = (NSString *)v17;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("expiryDate"));
    v19 = objc_claimAutoreleasedReturnValue();
    expiryDate = v9->_expiryDate;
    v9->_expiryDate = (NSDate *)v19;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("trashedState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_trashedState = objc_msgSend(v21, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("localPublishState"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_publishState = objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("participantCloudUpdateState"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_participantCloudUpdateState = objc_msgSend(v23, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("autoSharePolicy"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_autoSharePolicy = objc_msgSend(v24, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("publicPermission"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_publicPermission = objc_msgSend(v25, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("rulesData"));
    v26 = objc_claimAutoreleasedReturnValue();
    rulesData = v9->_rulesData;
    v9->_rulesData = (NSData *)v26;

    v9->_libraryScopeInLocalMode = objc_msgSend(MEMORY[0x1E0D71808], "libraryScopeScopeIdentifierWasCreatedInLocalOnlyMode:", v9->_scopeIdentifier);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scopeSyncingState"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_scopeSyncingState = objc_msgSend(v28, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("previewState"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_previewState = objc_msgSend(v29, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudPhotoCount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_cloudPhotoCount = objc_msgSend(v30, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudVideoCount"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_cloudVideoCount = objc_msgSend(v31, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudItemCount"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_cloudItemCount = objc_msgSend(v32, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("exitState"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_exitState = objc_msgSend(v33, "unsignedIntegerValue");

  }
  return v9;
}

- (void)publishLibraryScopeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PHObject uuid](self, "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PHObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHShare publishShareWithUUID:photoLibrary:completion:](PHShare, "publishShareWithUUID:photoLibrary:completion:", v6, v5, v4);

}

- (void)acceptLibraryScopeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PHObject uuid](self, "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PHObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHShare acceptShareWithUUID:photoLibrary:completion:](PHShare, "acceptShareWithUUID:photoLibrary:completion:", v6, v5, v4);

}

- (id)activateLibraryScopeWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHLibraryScope.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PHObject photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cloudInternalClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__PHLibraryScope_activateLibraryScopeWithCompletion___block_invoke;
  v14[3] = &unk_1E35DF598;
  v15 = v5;
  v10 = v5;
  objc_msgSend(v8, "activateLibraryScope:completionHandler:", v9, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)deactivateLibraryScopeWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHLibraryScope.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PHObject photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cloudInternalClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PHLibraryScope_deactivateLibraryScopeWithCompletion___block_invoke;
  v12[3] = &unk_1E35DF598;
  v13 = v5;
  v10 = v5;
  objc_msgSend(v8, "deactivateLibraryScope:completionHandler:", v9, v12);

}

- (void)startExitFromLibraryScopeWithRetentionPolicy:(int64_t)a3 exitSource:(int64_t)a4 completion:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHLibraryScope.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PHObject photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetsdClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "cloudInternalClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLibraryScope scopeIdentifier](self, "scopeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PHLibraryScope_startExitFromLibraryScopeWithRetentionPolicy_exitSource_completion___block_invoke;
  v16[3] = &unk_1E35DF598;
  v17 = v9;
  v14 = v9;
  objc_msgSend(v12, "startExitFromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", v13, a3, a4, v16);

}

- (void)removeParticipants:(id)a3 exitSource:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHLibraryScope.m"), 315, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PHObject photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetsdClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v18, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v18, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v20);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);
  }

  objc_msgSend(v11, "cloudInternalClient");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLibraryScope scopeIdentifier](self, "scopeIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __59__PHLibraryScope_removeParticipants_exitSource_completion___block_invoke;
  v26[3] = &unk_1E35DF598;
  v27 = v9;
  v23 = v9;
  objc_msgSend(v21, "removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", v12, v22, 0, a4, v26);

}

- (void)refreshLibraryScopeWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHLibraryScope.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PHObject photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cloudInternalClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLibraryScope scopeIdentifier](self, "scopeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__PHLibraryScope_refreshLibraryScopeWithCompletion___block_invoke;
  v12[3] = &unk_1E35DBCE0;
  v13 = v5;
  v10 = v5;
  objc_msgSend(v8, "refreshLibraryScopeWithIdentifier:completionHandler:", v9, v12);

}

- (void)getCloudStatusCountsWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHLibraryScope.m"), 337, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PHObject photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cloudInternalClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainScopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__PHLibraryScope_getCloudStatusCountsWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E35DBD08;
  v14 = v5;
  v11 = v5;
  objc_msgSend(v8, "getLibraryScopeStatusCountsForScopeWithIdentifier:completionHandler:", v10, v13);

}

- (void)unsharePendingAssetsSharedToScope
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PHObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetsdClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cloudInternalClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLibraryScope scopeIdentifier](self, "scopeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsharePendingAssetsSharedToScopeWithIdentifier:", v5);

}

- (id)markOnboardingPreviewAssetsByProcessingRulesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PHUserFeedbackCalculator *v8;
  void *v9;
  PHUserFeedbackCalculator *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHLibraryScope.m"), 353, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PHObject photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PHUserFeedbackCalculator alloc];
  -[PHObject photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHUserFeedbackCalculator initWithPhotoLibrary:](v8, "initWithPhotoLibrary:", v9);

  -[PHUserFeedbackCalculator personUUIDsWithNegativeFeedback](v10, "personUUIDsWithNegativeFeedback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudInternalClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__PHLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithCompletion___block_invoke;
  v18[3] = &unk_1E35DF598;
  v19 = v5;
  v14 = v5;
  objc_msgSend(v12, "markOnboardingPreviewAssetsByProcessingRulesOnLibraryScope:excludePersonUUIDs:completionHandler:", v13, v11, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unsigned)status
{
  return self->_status;
}

- (signed)publicPermission
{
  return self->_publicPermission;
}

- (unsigned)trashedState
{
  return self->_trashedState;
}

- (signed)publishState
{
  return self->_publishState;
}

- (signed)participantCloudUpdateState
{
  return self->_participantCloudUpdateState;
}

- (signed)autoSharePolicy
{
  return self->_autoSharePolicy;
}

- (signed)previewState
{
  return self->_previewState;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSData)rulesData
{
  return self->_rulesData;
}

- (signed)scopeSyncingState
{
  return self->_scopeSyncingState;
}

- (int64_t)exitState
{
  return self->_exitState;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)libraryScopeInLocalMode
{
  return self->_libraryScopeInLocalMode;
}

- (unint64_t)cloudPhotoCount
{
  return self->_cloudPhotoCount;
}

- (unint64_t)cloudVideoCount
{
  return self->_cloudVideoCount;
}

- (unint64_t)cloudItemCount
{
  return self->_cloudItemCount;
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_rulesData, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

void __77__PHLibraryScope_markOnboardingPreviewAssetsByProcessingRulesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2 == 0;
  +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _BOOL8, id))(v2 + 16))(v2, v3, v4);

}

uint64_t __60__PHLibraryScope_getCloudStatusCountsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__PHLibraryScope_refreshLibraryScopeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__PHLibraryScope_removeParticipants_exitSource_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2 == 0;
  +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _BOOL8, id))(v2 + 16))(v2, v3, v4);

}

void __85__PHLibraryScope_startExitFromLibraryScopeWithRetentionPolicy_exitSource_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2 == 0;
  +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _BOOL8, id))(v2 + 16))(v2, v3, v4);

}

void __55__PHLibraryScope_deactivateLibraryScopeWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2 == 0;
  +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _BOOL8, id))(v2 + 16))(v2, v3, v4);

}

void __53__PHLibraryScope_activateLibraryScopeWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2 == 0;
  +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _BOOL8, id))(v2 + 16))(v2, v3, v4);

}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_27603 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_27603, &__block_literal_global_27604);
  return (id)propertiesToFetchWithHint__array_27605;
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHLibraryScope");
  return CFSTR("PHLibraryScope");
}

+ (id)identifierCode
{
  return CFSTR("210");
}

+ (id)localIdentifierWithUUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "identifierCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/L0/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchLibraryScopesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHLibraryScope.m"), 215, CFSTR("Valid PHPhotoLibrary must be specified via fetch options"));

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__PHLibraryScope_fetchLibraryScopesWithLocalIdentifiers_options___block_invoke;
  v14[3] = &unk_1E35DFCC0;
  v15 = v7;
  v10 = v7;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v8, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fetchLibraryScopesWithOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHLibraryScope.m"), 223, CFSTR("Valid PHPhotoLibrary must be specified via fetch options"));

  }
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v5, &__block_literal_global_91);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)fetchLibraryScopeFromShareURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "photoLibrary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchLibraryScopeFromShareURL:ignoreExistingShare:photoLibrary:completionHandler:", v9, 0, v10, v8);

}

+ (void)fetchLibraryScopeFromShareURL:(id)a3 ignoreExistingShare:(BOOL)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHLibraryScope.m"), 259, CFSTR("Valid PHPhotoLibrary must be specified"));

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__PHLibraryScope_fetchLibraryScopeFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke;
  v17[3] = &unk_1E35DBCB8;
  v18 = v12;
  v19 = v13;
  v14 = v12;
  v15 = v13;
  +[PHShare fetchShareFromShareURL:ignoreExistingShare:photoLibrary:completionHandler:](PHShare, "fetchShareFromShareURL:ignoreExistingShare:photoLibrary:completionHandler:", v11, v8, v14, v17);

}

+ (void)resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithPhotoLibrary:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHLibraryScope.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(v7, "assetsdClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudInternalClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__PHLibraryScope_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithPhotoLibrary_completion___block_invoke;
  v13[3] = &unk_1E35DF598;
  v14 = v8;
  v11 = v8;
  objc_msgSend(v10, "resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithCompletionHandler:", v13);

}

+ (unint64_t)estimatedAssetCountToMoveForExitRetentionPolicyContributedOnly:(BOOL)a3 imageCount:(unint64_t *)a4 videoCount:(unint64_t *)a5 audioCount:(unint64_t *)a6 itemCount:(unint64_t *)a7 options:(id)a8 error:(id *)a9
{
  void *v13;
  void *v14;
  unint64_t v15;

  objc_msgSend(a1, "_estimatedAssetCountToMoveForExitRetentionPolicyContributedOnly:options:error:", a3, a8, a9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a4)
    *a4 = objc_msgSend(v13, "countOfAssetsWithMediaType:", 1);
  if (a5)
    *a5 = objc_msgSend(v14, "countOfAssetsWithMediaType:", 2);
  if (a6)
    *a6 = objc_msgSend(v14, "countOfAssetsWithMediaType:", 3);
  if (a7)
    *a7 = objc_msgSend(v14, "countOfAssetsWithMediaType:", 0);
  v15 = objc_msgSend(v14, "count");

  return v15;
}

+ (id)_estimatedAssetCountToMoveForExitRetentionPolicyContributedOnly:(BOOL)a3 options:(id)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
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
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[3];

  v6 = a3;
  v23[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3528];
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeOnlyContentContributedByCurrentUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    objc_msgSend(MEMORY[0x1E0D71880], "predicateForAssetSharingFilter:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "andPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateForAssetSharingFilter:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "andPredicateWithSubpredicates:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v12)
  {
    objc_msgSend(v7, "setShouldPrefetchCount:", 1);
    objc_msgSend(v7, "setInternalPredicate:", v12);
    +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("estimatedAssetCountToMoveForExitRetentionPolicy: generated predate is nil"), *MEMORY[0x1E0CB2D50]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a5)
      *a5 = objc_retainAutorelease(v17);

    v13 = 0;
  }

  return v13;
}

+ (BOOL)removePersonRulesOnActiveLibraryScopeWithPhotoLibrary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  id v22;
  void *v23;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHLibraryScope fetchActiveLibraryScopeWithOptions:](PHLibraryScope, "fetchActiveLibraryScopeWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "autoSharePolicy") == 2)
    {
      objc_msgSend(v5, "librarySpecificFetchOptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v8;
      +[PHLibraryScopeRule fetchLibraryScopeRulesForLibraryScope:options:](PHLibraryScopeRule, "fetchLibraryScopeRulesForLibraryScope:options:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v17, "personCondition");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              objc_msgSend(v17, "removeConditionOfType:", objc_opt_class());
            objc_msgSend(v17, "dateRangeCondition");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
              objc_msgSend(v11, "addObject:", v17);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v14);
      }

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __78__PHLibraryScope_removePersonRulesOnActiveLibraryScopeWithPhotoLibrary_error___block_invoke;
      v27[3] = &unk_1E35DF9E8;
      v8 = v25;
      v28 = v25;
      v20 = v11;
      v29 = v20;
      v26 = 0;
      v21 = objc_msgSend(v5, "performChangesAndWait:error:", v27, &v26);
      v22 = v26;
      v23 = v22;
      if (a4)
        *a4 = objc_retainAutorelease(v22);

    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 1;
  }

  return v21;
}

void __78__PHLibraryScope_removePersonRulesOnActiveLibraryScopeWithPhotoLibrary_error___block_invoke(uint64_t a1)
{
  id v2;

  +[PHLibraryScopeChangeRequest changeRequestForLibraryScope:](PHLibraryScopeChangeRequest, "changeRequestForLibraryScope:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    objc_msgSend(v2, "updateWithCustomRules:", *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(v2, "setAutoSharePolicy:", 0);

}

void __102__PHLibraryScope_resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithPhotoLibrary_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2 == 0;
  +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _BOOL8, id))(v2 + 16))(v2, v3, v4);

}

void __99__PHLibraryScope_fetchLibraryScopeFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 40);
    +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIncludeExitingShares:", 1);
    objc_msgSend(v9, "setIncludeExpiredShares:", 1);
    objc_msgSend(v9, "setIncludeTrashedShares:", 1);
    v18[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHLibraryScope fetchLibraryScopesWithLocalIdentifiers:options:](PHLibraryScope, "fetchLibraryScopesWithLocalIdentifiers:options:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v7 = 0;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to fetch libraryScope with UUID %@"), v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 6003, v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

id __48__PHLibraryScope_fetchLibraryScopesWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForLibraryScopesWithOptions:](PHQuery, "queryForLibraryScopesWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __65__PHLibraryScope_fetchLibraryScopesWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryforLibraryScopesWithLocalIdentifiers:options:](PHQuery, "queryforLibraryScopesWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __44__PHLibraryScope_propertiesToFetchWithHint___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[21];

  v3[20] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  v3[1] = CFSTR("title");
  v3[2] = CFSTR("creationDate");
  v3[3] = CFSTR("uuid");
  v3[4] = CFSTR("status");
  v3[5] = CFSTR("shareURL");
  v3[6] = CFSTR("scopeIdentifier");
  v3[7] = CFSTR("expiryDate");
  v3[8] = CFSTR("trashedState");
  v3[9] = CFSTR("localPublishState");
  v3[10] = CFSTR("participantCloudUpdateState");
  v3[11] = CFSTR("autoSharePolicy");
  v3[12] = CFSTR("scopeSyncingState");
  v3[13] = CFSTR("previewState");
  v3[14] = CFSTR("publicPermission");
  v3[15] = CFSTR("rulesData");
  v3[16] = CFSTR("cloudPhotoCount");
  v3[17] = CFSTR("cloudVideoCount");
  v3[18] = CFSTR("cloudItemCount");
  v3[19] = CFSTR("exitState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 20);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)propertiesToFetchWithHint__array_27605;
  propertiesToFetchWithHint__array_27605 = v1;

}

@end

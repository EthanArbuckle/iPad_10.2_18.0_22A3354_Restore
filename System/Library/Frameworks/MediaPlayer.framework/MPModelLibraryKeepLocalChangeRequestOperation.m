@implementation MPModelLibraryKeepLocalChangeRequestOperation

- (void)execute
{
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  MPStoreLibraryMappingRequestOperation *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *, void *, void *);
  void *v23;
  id v24;
  MPModelLibraryKeepLocalChangeRequestOperation *v25;
  id v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (!self->_operationQueue)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = self->_operationQueue;
    self->_operationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](self->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPModelLibraryKeepLocalChangeRequestOperation.operationQueue"));
    v5 = self->_operationQueue;
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setQualityOfService:](v5, "setQualityOfService:", objc_msgSend(v6, "qualityOfService"));

  }
  -[MPModelLibraryKeepLocalChangeRequest modelObject](self->_request, "modelObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPModelLibraryKeepLocalChangeRequest enableState](self->_request, "enableState") + 1;
  if (v8 > 4)
    v9 = 0;
  else
    v9 = qword_193F0C920[v8];
  v10 = -[MPModelLibraryKeepLocalChangeRequest constraints](self->_request, "constraints");
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "library");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "persistentID");

  if (v15)
  {
    -[MPModelLibraryKeepLocalChangeRequestOperation _handlePersistentID:modelClass:keepLocal:keepLocalConstraints:mediaLibrary:](self, "_handlePersistentID:modelClass:keepLocal:keepLocalConstraints:mediaLibrary:", v15, objc_opt_class(), v9, v10, v12);
  }
  else
  {
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:](MPStoreLibraryPersonalizationRequest, "libraryViewWithUserIdentity:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc_init(MPStoreLibraryMappingRequestOperation);
    -[MPStoreLibraryMappingRequestOperation setLibraryView:](v18, "setLibraryView:", v17);
    -[MPStoreLibraryMappingRequestOperation setModelClass:](v18, "setModelClass:", objc_opt_class());
    v30[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreLibraryMappingRequestOperation setIdentifierSets:](v18, "setIdentifierSets:", v19);

    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __56__MPModelLibraryKeepLocalChangeRequestOperation_execute__block_invoke;
    v23 = &unk_1E31621B0;
    v24 = v13;
    v25 = self;
    v26 = v7;
    v28 = v9;
    v29 = v10;
    v27 = v12;
    -[MPStoreLibraryMappingRequestOperation setResponseHandler:](v18, "setResponseHandler:", &v20);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v18, v20, v21, v22, v23);

  }
}

- (void)_handlePersistentID:(int64_t)a3 modelClass:(Class)a4 keepLocal:(int64_t)a5 keepLocalConstraints:(unint64_t)a6 mediaLibrary:(id)a7
{
  id v12;
  MPMediaQuery *v13;
  void *v14;
  void *v15;
  MPMediaQuery *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void (**responseHandler)(id, _QWORD);
  MPMediaQuery *v28;
  MPMediaQuery *v29;
  void *v30;
  void *v31;
  MPMediaQuery *v32;
  void (**v33)(id, _QWORD);
  void (**v34)(id, _QWORD);
  _QWORD v35[5];
  MPMediaQuery *v36;
  int64_t v37;
  int64_t v38;
  _QWORD v39[5];
  id v40;
  int64_t v41;
  int64_t v42;
  _QWORD v43[8];

  v12 = a7;
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || -[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v12, "itemWithPersistentID:verifyExistence:", a3, 0);
    v13 = (MPMediaQuery *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaQuery setValue:forProperty:](v13, "setValue:forProperty:", v14, CFSTR("keepLocalConstraints"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke;
      v43[3] = &unk_1E31621E8;
      v43[4] = self;
      v43[5] = a5;
      v43[6] = a3;
      -[MPMediaQuery setValue:forProperty:withCompletionBlock:](v13, "setValue:forProperty:withCompletionBlock:", v15, CFSTR("keepLocal"), v43);

LABEL_20:
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || -[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()))
  {
    v16 = [MPMediaQuery alloc];
    v17 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v18, CFSTR("albumPID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithObject:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MPMediaQuery initWithFilterPredicates:](v16, "initWithFilterPredicates:", v20);

    -[MPMediaQuery setMediaLibrary:](v13, "setMediaLibrary:", v12);
    -[MPMediaQuery setIgnoreRestrictionsPredicates:](v13, "setIgnoreRestrictionsPredicates:", 1);
    -[MPMediaQuery setShouldIncludeNonLibraryEntities:](v13, "setShouldIncludeNonLibraryEntities:", 1);
    -[MPMediaQuery setGroupingType:](v13, "setGroupingType:", 1);
    -[MPMediaQuery setEntityLimit:](v13, "setEntityLimit:", 1);
    -[MPMediaQuery collections](v13, "collections");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = v22;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setValue:forProperty:", v24, CFSTR("keepLocalConstraints"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_2;
      v39[3] = &unk_1E3162240;
      v41 = a5;
      v42 = a3;
      v39[4] = self;
      v40 = v23;
      v26 = v23;
      objc_msgSend(v26, "setValue:forProperty:withCompletionBlock:", v25, CFSTR("keepLocal"), v39);

    }
    else
    {
      responseHandler = (void (**)(id, _QWORD))self->_responseHandler;
      if (responseHandler)
        responseHandler[2](responseHandler, 0);
      -[MPAsyncOperation finish](self, "finish");
    }

    goto LABEL_20;
  }
  if (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v12, "playlistWithPersistentID:", a3);
    v28 = (MPMediaQuery *)objc_claimAutoreleasedReturnValue();
    v13 = v28;
    if (v28)
    {
      v29 = v28;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaQuery setValue:forProperty:](v29, "setValue:forProperty:", v30, CFSTR("keepLocalConstraints"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_25;
      v35[3] = &unk_1E3162240;
      v37 = a5;
      v38 = a3;
      v35[4] = self;
      v36 = v29;
      v32 = v29;
      -[MPMediaQuery setValue:forProperty:withCompletionBlock:](v32, "setValue:forProperty:withCompletionBlock:", v31, CFSTR("keepLocal"), v35);

      goto LABEL_20;
    }
LABEL_17:
    v33 = (void (**)(id, _QWORD))self->_responseHandler;
    if (v33)
      v33[2](v33, 0);
    -[MPAsyncOperation finish](self, "finish");
    goto LABEL_20;
  }
  v34 = (void (**)(id, _QWORD))self->_responseHandler;
  if (v34)
    v34[2](v34, 0);
  -[MPAsyncOperation finish](self, "finish");
LABEL_21:

}

- (void)_handleKeepLocalUpdateStatus:(int64_t)a3 forLibraryIdentifier:(int64_t)a4 mediaType:(int64_t)a5 completedWithError:(id)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MPModelLibraryKeepLocalChangeRequestOperation *v15;

  v10 = a6;
  +[MPMediaDownloadManager sharedManager](MPMediaDownloadManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __128__MPModelLibraryKeepLocalChangeRequestOperation__handleKeepLocalUpdateStatus_forLibraryIdentifier_mediaType_completedWithError___block_invoke;
  v13[3] = &unk_1E31637A8;
  v14 = v10;
  v15 = self;
  v12 = v10;
  objc_msgSend(v11, "sendKeepLocalStatusChanged:forLibraryIdentifier:entityType:withCompletionHandler:", a3, a4, a5, v13);

}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (MPModelLibraryKeepLocalChangeRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __128__MPModelLibraryKeepLocalChangeRequestOperation__handleKeepLocalUpdateStatus_forLibraryIdentifier_mediaType_completedWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  if (!v4)
    v4 = v3;
  v5 = v4;
  v6 = *(_QWORD **)(a1 + 40);
  v7 = v6[35];
  if (v7)
  {
    (*(void (**)(_QWORD, id))(v7 + 16))(v6[35], v5);
    v6 = *(_QWORD **)(a1 + 40);
  }
  objc_msgSend(v6, "finishWithError:", v5);

}

uint64_t __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKeepLocalUpdateStatus:forLibraryIdentifier:mediaType:completedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, a3);
}

void __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
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
  uint64_t v21;
  _MPModelLibraryKeepLocalChangeRequestUpdateItemOperation *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 == 1)
  {
    v7 = (void *)MEMORY[0x1E0CB34C8];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_3;
    v29[3] = &unk_1E3162218;
    v29[4] = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 56);
    v31 = 1;
    v32 = v8;
    v30 = v4;
    objc_msgSend(v7, "blockOperationWithBlock:", v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "itemsQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    objc_msgSend(v11, "setIgnoreRestrictionsPredicates:", 1);
    objc_msgSend(v11, "setShouldIncludeNonLibraryEntities:", 0);
    objc_msgSend(v11, "setIgnoreSystemFilterPredicates:", 1);
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", &unk_1E31E4EB8, CFSTR("keepLocal"), 100);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v12;
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", &unk_1E31E4ED0, CFSTR("keepLocalConstraints"), 100);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaCompoundPredicate predicateMatchingPredicates:](MPMediaCompoundAnyPredicate, "predicateMatchingPredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addFilterPredicate:", v15);
    objc_msgSend(v11, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v17)
    {
      v18 = v17;
      v23 = v11;
      v24 = v5;
      v19 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v22 = objc_alloc_init(_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation);
          -[_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation setMediaItem:](v22, "setMediaItem:", v21);
          -[_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation setKeepLocal:](v22, "setKeepLocal:", 0);
          -[_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation setKeepLocalConstraints:](v22, "setKeepLocalConstraints:", 0);
          objc_msgSend(v9, "addDependency:", v22);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "addOperation:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v18);
      v11 = v23;
      v5 = v24;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "addOperation:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleKeepLocalUpdateStatus:forLibraryIdentifier:mediaType:completedWithError:", v6, *(_QWORD *)(a1 + 56), 4, v4);
  }

}

void __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
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
  uint64_t v21;
  _MPModelLibraryKeepLocalChangeRequestUpdateItemOperation *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 == 1)
  {
    v7 = (void *)MEMORY[0x1E0CB34C8];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_2_26;
    v29[3] = &unk_1E3162218;
    v29[4] = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 56);
    v31 = 1;
    v32 = v8;
    v30 = v4;
    objc_msgSend(v7, "blockOperationWithBlock:", v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "itemsQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    objc_msgSend(v11, "setIgnoreRestrictionsPredicates:", 1);
    objc_msgSend(v11, "setShouldIncludeNonLibraryEntities:", 1);
    objc_msgSend(v11, "setIgnoreSystemFilterPredicates:", 1);
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", &unk_1E31E4EB8, CFSTR("keepLocal"), 100);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v12;
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", &unk_1E31E4ED0, CFSTR("keepLocalConstraints"), 100);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaCompoundPredicate predicateMatchingPredicates:](MPMediaCompoundAnyPredicate, "predicateMatchingPredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addFilterPredicate:", v15);
    objc_msgSend(v11, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v17)
    {
      v18 = v17;
      v23 = v11;
      v24 = v5;
      v19 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v22 = objc_alloc_init(_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation);
          -[_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation setMediaItem:](v22, "setMediaItem:", v21);
          -[_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation setKeepLocal:](v22, "setKeepLocal:", 0);
          -[_MPModelLibraryKeepLocalChangeRequestUpdateItemOperation setKeepLocalConstraints:](v22, "setKeepLocalConstraints:", 0);
          objc_msgSend(v9, "addDependency:", v22);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "addOperation:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v18);
      v11 = v23;
      v5 = v24;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "addOperation:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleKeepLocalUpdateStatus:forLibraryIdentifier:mediaType:completedWithError:", v6, *(_QWORD *)(a1 + 56), 1, v4);
  }

}

uint64_t __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_2_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKeepLocalUpdateStatus:forLibraryIdentifier:mediaType:completedWithError:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1, *(_QWORD *)(a1 + 40));
}

uint64_t __124__MPModelLibraryKeepLocalChangeRequestOperation__handlePersistentID_modelClass_keepLocal_keepLocalConstraints_mediaLibrary___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKeepLocalUpdateStatus:forLibraryIdentifier:mediaType:completedWithError:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 4, *(_QWORD *)(a1 + 40));
}

void __56__MPModelLibraryKeepLocalChangeRequestOperation_execute__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (!v13 || v5)
  {
    v10 = (_QWORD *)a1[5];
    v11 = v10[35];
    if (v11)
    {
      (*(void (**)(_QWORD, id))(v11 + 16))(v10[35], v5);
      v10 = (_QWORD *)a1[5];
    }
    objc_msgSend(v10, "finish");
  }
  else
  {
    objc_msgSend(v13, "libraryIdentifierSetForIdentifierSet:", a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "persistentID");

    v9 = (_QWORD *)a1[5];
    if (v8)
    {
      objc_msgSend(v9, "_handlePersistentID:modelClass:keepLocal:keepLocalConstraints:mediaLibrary:", v8, objc_opt_class(), a1[8], a1[9], a1[7]);
    }
    else
    {
      v12 = v9[35];
      if (v12)
      {
        (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
        v9 = (_QWORD *)a1[5];
      }
      objc_msgSend(v9, "finish");
    }

  }
}

@end

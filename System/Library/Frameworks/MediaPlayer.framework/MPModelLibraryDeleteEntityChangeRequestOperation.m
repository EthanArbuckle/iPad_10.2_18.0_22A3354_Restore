@implementation MPModelLibraryDeleteEntityChangeRequestOperation

- (void)execute
{
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  MPStoreLibraryMappingRequestOperation *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *, void *, void *);
  void *v22;
  id v23;
  MPModelLibraryDeleteEntityChangeRequestOperation *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
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
  -[MPModelLibraryDeleteEntityChangeRequest modelObject](self->_request, "modelObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "library");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "persistentID");

  v13 = objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();

  }
  if (v12)
  {
    -[MPModelLibraryDeleteEntityChangeRequestOperation _handlePersistentID:modelClass:mediaLibrary:](self, "_handlePersistentID:modelClass:mediaLibrary:", v12, v13, v9);
  }
  else
  {
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:](MPStoreLibraryPersonalizationRequest, "libraryViewWithUserIdentity:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MPStoreLibraryMappingRequestOperation);
    -[MPStoreLibraryMappingRequestOperation setLibraryView:](v17, "setLibraryView:", v16);
    -[MPStoreLibraryMappingRequestOperation setModelClass:](v17, "setModelClass:", objc_opt_class());
    v27[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreLibraryMappingRequestOperation setIdentifierSets:](v17, "setIdentifierSets:", v18);

    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __59__MPModelLibraryDeleteEntityChangeRequestOperation_execute__block_invoke;
    v22 = &unk_1E31532D0;
    v23 = v10;
    v24 = self;
    v26 = v13;
    v25 = v9;
    -[MPStoreLibraryMappingRequestOperation setResponseHandler:](v17, "setResponseHandler:", &v19);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v17, v19, v20, v21, v22);

  }
}

- (void)_handlePersistentID:(int64_t)a3 modelClass:(Class)a4 mediaLibrary:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MPModelLibraryRequest *v12;
  id v13;
  MPIdentifierSet *v14;
  void *v15;
  uint64_t v16;
  id v17;
  MPIdentifierSet *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  MPIdentifierSet *v25;
  void *v26;
  uint64_t v27;
  id v28;
  MPIdentifierSet *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void (**responseHandler)(id, _QWORD);
  void (**v39)(id, _QWORD);
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *);
  void *v43;
  id v44;
  MPModelLibraryDeleteEntityChangeRequestOperation *v45;
  _QWORD v46[4];
  id v47;
  int64_t v48;
  _QWORD v49[4];
  id v50;
  MPModelLibraryDeleteEntityChangeRequestOperation *v51;
  _QWORD v52[4];
  id v53;
  int64_t v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || -[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v8, "itemWithPersistentID:verifyExistence:", a3, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v58[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPModelLibraryDeleteEntityChangeRequestOperation _deleteItems:withLibrary:](self, "_deleteItems:withLibrary:", v11, v8);

    }
    else
    {
      -[MPModelLibraryDeleteEntityChangeRequestOperation _deleteItems:withLibrary:](self, "_deleteItems:withLibrary:", 0, v8);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()))
  {
    v12 = objc_alloc_init(MPModelLibraryRequest);
    -[MPModelLibraryRequest setMediaLibrary:](v12, "setMediaLibrary:", v8);
    v13 = [a4 alloc];
    v14 = [MPIdentifierSet alloc];
    +[MPModelAlbumKind identityKind](MPModelAlbumKind, "identityKind");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke;
    v52[3] = &unk_1E315F6D0;
    v17 = v8;
    v53 = v17;
    v54 = a3;
    v18 = -[MPIdentifierSet initWithSource:modelKind:block:](v14, "initWithSource:modelKind:block:", CFSTR("LibraryEdit"), v15, v52);
    v19 = (void *)objc_msgSend(v13, "initWithIdentifiers:block:", v18, &__block_literal_global_994);

    +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setItemKind:](v12, "setItemKind:", v20);

    v57 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRequest setScopedContainers:](v12, "setScopedContainers:", v21);

    v49[0] = v16;
    v49[1] = 3221225472;
    v49[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_4;
    v49[3] = &unk_1E3162C70;
    v50 = v17;
    v51 = self;
    v22 = -[MPModelLibraryRequest newOperationWithResponseHandler:](v12, "newOperationWithResponseHandler:", v49);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v22);

    v23 = v53;
LABEL_13:

    goto LABEL_8;
  }
  if (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()))
  {
    v12 = objc_alloc_init(MPModelLibraryRequest);
    -[MPModelLibraryRequest setMediaLibrary:](v12, "setMediaLibrary:", v8);
    v24 = [a4 alloc];
    v25 = [MPIdentifierSet alloc];
    +[MPModelTVSeasonKind identityKind](MPModelTVSeasonKind, "identityKind");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_6;
    v46[3] = &unk_1E315F6D0;
    v28 = v8;
    v47 = v28;
    v48 = a3;
    v29 = -[MPIdentifierSet initWithSource:modelKind:block:](v25, "initWithSource:modelKind:block:", CFSTR("LibraryEdit"), v26, v46);
    v30 = (void *)objc_msgSend(v24, "initWithIdentifiers:block:", v29, &__block_literal_global_27);

    +[MPModelTVEpisode kindWithVariants:](MPModelTVEpisode, "kindWithVariants:", 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setItemKind:](v12, "setItemKind:", v31);

    v56 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRequest setScopedContainers:](v12, "setScopedContainers:", v32);

    v40 = v27;
    v41 = 3221225472;
    v42 = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_9;
    v43 = &unk_1E3162C70;
    v44 = v28;
    v45 = self;
    v33 = -[MPModelLibraryRequest newOperationWithResponseHandler:](v12, "newOperationWithResponseHandler:", &v40);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v33, v40, v41, v42, v43);

    v23 = v47;
    goto LABEL_13;
  }
  if (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v8, "playlistWithPersistentID:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (-[MPModelLibraryDeleteEntityChangeRequestOperation _isCloudLibraryEnabled](self, "_isCloudLibraryEnabled"))
      {
        objc_msgSend(v10, "valueForProperty:", CFSTR("storeCloudID"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "unsignedLongLongValue"))
        {
          -[MPAsyncOperation userIdentity](self, "userIdentity");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "removePlaylistsWithSagaIDs:completionHandler:", v37, 0);

        }
      }
      objc_msgSend(v8, "removePlaylist:", v10);
    }
    responseHandler = (void (**)(id, _QWORD))self->_responseHandler;
    if (responseHandler)
      responseHandler[2](responseHandler, 0);
    -[MPAsyncOperation finish](self, "finish");
    goto LABEL_7;
  }
  v39 = (void (**)(id, _QWORD))self->_responseHandler;
  if (v39)
    v39[2](v39, 0);
  -[MPAsyncOperation finish](self, "finish");
LABEL_8:

}

- (void)_deleteItems:(id)a3 withLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void (**responseHandler)(id, _QWORD);
  id v28;
  void *v29;
  void *v30;
  id v31;
  MPModelLibraryDeleteEntityChangeRequestOperation *v32;
  MPModelLibraryDeleteEntityChangeRequestOperation *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudServiceStatusController cloudServiceStatusControllerWithUserIdentity:](MPCloudServiceStatusController, "cloudServiceStatusControllerWithUserIdentity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[MPModelLibraryDeleteEntityChangeRequestOperation _isCloudLibraryEnabled](self, "_isCloudLibraryEnabled"))
    {
      v29 = v11;
      v30 = v9;
      v32 = self;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v39 != v16)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "valueForProperty:", CFSTR("storeSagaID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "unsignedLongLongValue"))
            {
              if (!v15)
                v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
              objc_msgSend(v15, "addObject:", v18);
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v14);
      }
      else
      {
        v15 = 0;
      }

      if (objc_msgSend(v15, "count"))
      {
        v9 = v30;
        objc_msgSend(v30, "removeItemsWithSagaIDs:completionHandler:", v15, 0);
        self = v32;
LABEL_37:

        v11 = v29;
        goto LABEL_38;
      }
      self = v32;
    }
    else
    {
      if (!objc_msgSend(v11, "isPurchaseHistoryEnabled"))
      {
LABEL_38:
        objc_msgSend(v7, "deleteItems:", v6);

        goto LABEL_39;
      }
      v29 = v11;
      v30 = v9;
      v31 = v7;
      v33 = self;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v28 = v6;
      v19 = v6;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v20)
      {
        v21 = v20;
        v15 = 0;
        v22 = *(_QWORD *)v35;
        v23 = MEMORY[0x1E0C9AAB0];
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v35 != v22)
              objc_enumerationMutation(v19);
            v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
            objc_msgSend(v25, "valueForProperty:", CFSTR("purchaseHistoryID"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v26, "unsignedLongLongValue"))
            {
              if (!v15)
                v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
              objc_msgSend(v15, "addObject:", v26);
              objc_msgSend(v25, "setValue:forProperty:", v23, CFSTR("isHidden"));
            }

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v21);
      }
      else
      {
        v15 = 0;
      }

      if (objc_msgSend(v15, "count"))
      {
        v9 = v30;
        objc_msgSend(v30, "hideItemsWithPurchaseHistoryIDs:completionHandler:", v15, 0);
        v6 = v28;
        v7 = v31;
        self = v33;
        goto LABEL_37;
      }
      v6 = v28;
      v7 = v31;
      self = v33;
    }
    v9 = v30;
    goto LABEL_37;
  }
LABEL_39:
  responseHandler = (void (**)(id, _QWORD))self->_responseHandler;
  if (responseHandler)
    responseHandler[2](responseHandler, 0);
  -[MPAsyncOperation finish](self, "finish");

}

- (BOOL)_isCloudLibraryEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCloudLibraryEnabled");

  return v4;
}

- (MPModelLibraryDeleteEntityChangeRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_2;
  v6[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v5, v6);

}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_5;
  v8[3] = &unk_1E3153318;
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateItemIdentifiersUsingBlock:", v8);

  objc_msgSend(*(id *)(a1 + 40), "_deleteItems:withLibrary:", v7, *(_QWORD *)(a1 + 32));
}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_7;
  v6[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v5, v6);

}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_9(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_10;
  v8[3] = &unk_1E3153318;
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateItemIdentifiersUsingBlock:", v8);

  objc_msgSend(*(id *)(a1 + 40), "_deleteItems:withLibrary:", v7, *(_QWORD *)(a1 + 32));
}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "persistentID");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemWithPersistentID:verifyExistence:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
      v6 = v7;
    }

  }
}

uint64_t __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistentID:", *(_QWORD *)(a1 + 32));
}

void __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "persistentID");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemWithPersistentID:verifyExistence:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
      v6 = v7;
    }

  }
}

uint64_t __96__MPModelLibraryDeleteEntityChangeRequestOperation__handlePersistentID_modelClass_mediaLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistentID:", *(_QWORD *)(a1 + 32));
}

void __59__MPModelLibraryDeleteEntityChangeRequestOperation_execute__block_invoke(_QWORD *a1, void *a2, void *a3)
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
    v11 = v10[36];
    if (v11)
    {
      (*(void (**)(_QWORD, id))(v11 + 16))(v10[36], v5);
      v10 = (_QWORD *)a1[5];
    }
    objc_msgSend(v10, "finishWithError:", v5);
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
      objc_msgSend(v9, "_handlePersistentID:modelClass:mediaLibrary:", v8, a1[7], a1[6]);
    }
    else
    {
      v12 = v9[36];
      if (v12)
      {
        (*(void (**)(_QWORD, _QWORD))(v12 + 16))(v9[36], 0);
        v9 = (_QWORD *)a1[5];
      }
      objc_msgSend(v9, "finish");
    }

  }
}

@end

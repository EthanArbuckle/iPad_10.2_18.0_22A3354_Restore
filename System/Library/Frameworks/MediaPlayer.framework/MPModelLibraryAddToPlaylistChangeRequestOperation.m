@implementation MPModelLibraryAddToPlaylistChangeRequestOperation

- (void)execute
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *itemEntryProperties;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 isCollaborativePlaylist;
  void *v21;
  MPMutableSectionedCollection *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  MPMutableSectionedCollection *v28;
  NSObject *v29;
  uint64_t v30;
  id *v31;
  id v32;
  id *v33;
  void (**v34)(_QWORD);
  void (**v35)(_QWORD, _QWORD);
  void (**responseHandler)(id, _QWORD);
  id v37;
  NSMutableDictionary *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[5];
  void (**v48)(_QWORD);
  _QWORD v49[5];
  id v50;
  MPMutableSectionedCollection *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  MPModelLibraryAddToPlaylistChangeRequestOperation *v58;
  id v59;
  id v60;
  MPMutableSectionedCollection *v61;
  uint8_t buf[4];
  MPModelLibraryAddToPlaylistChangeRequestOperation *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  _BOOL4 v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "qualityOfService");

  -[MPModelLibraryAddToPlaylistChangeRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "playlist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "persistentID");

  if (v11)
  {
    objc_msgSend(v7, "playlistWithPersistentID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistIsCollaborative")))
    {
      self->_isCollaborativePlaylist = objc_msgSend(v8, "isCollaborative");
    }
    else
    {
      objc_msgSend(v12, "valueForProperty:", CFSTR("isCollaborative"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isCollaborativePlaylist = objc_msgSend(v13, "BOOLValue");

    }
    if (objc_msgSend(v8, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistIsOwner")))
    {
      self->_isOwner = objc_msgSend(v8, "isOwner");
    }
    else
    {
      objc_msgSend(v12, "valueForProperty:", CFSTR("iO"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isOwner = objc_msgSend(v14, "BOOLValue");

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    itemEntryProperties = self->_itemEntryProperties;
    self->_itemEntryProperties = v15;

  }
  else
  {
    v12 = 0;
  }
  v17 = os_log_create("com.apple.amp.mediaplayer", "Default_Oversize");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "songResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "totalItemCount");
    isCollaborativePlaylist = self->_isCollaborativePlaylist;
    *(_DWORD *)buf = 138544130;
    v63 = self;
    v64 = 2048;
    v65 = v19;
    v66 = 2114;
    v67 = v8;
    v68 = 1024;
    v69 = isCollaborativePlaylist;
    _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding %ld items to playlist %{public}@. isCollaborative = %{BOOL}u", buf, 0x26u);

  }
  if (v12)
  {
    v39 = v4;
    v40 = v8;
    v42 = v12;
    objc_msgSend(v5, "songResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(MPMutableSectionedCollection);
    -[MPMutableSectionedCollection appendSection:](v22, "appendSection:", &stru_1E3163D10);
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke;
    v56[3] = &unk_1E3159BA8;
    v25 = v7;
    v57 = v25;
    v58 = self;
    v26 = v23;
    v59 = v26;
    v27 = v21;
    v60 = v27;
    v28 = v22;
    v61 = v28;
    objc_msgSend(v27, "enumerateItemIdentifiersUsingBlock:", v56);
    v43 = v5;
    v41 = v7;
    if (-[MPSectionedCollection totalItemCount](v28, "totalItemCount") < 1)
    {
      v12 = v42;
      v37 = v42;
      v38 = self->_itemEntryProperties;
      v44[0] = v24;
      v44[1] = 3221225472;
      v44[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2_25;
      v44[3] = &unk_1E3159700;
      v44[4] = self;
      v31 = &v45;
      v33 = &v46;
      v45 = v26;
      v46 = v37;
      objc_msgSend(v37, "appendItems:andEntryProperties:completion:", v45, v38, v44);
      v8 = v40;
    }
    else
    {
      v29 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = -[MPSectionedCollection totalItemCount](v28, "totalItemCount");
        *(_DWORD *)buf = 138543618;
        v63 = self;
        v64 = 2048;
        v65 = v30;
        _os_log_impl(&dword_193B9B000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Importing %ld songs not in the library", buf, 0x16u);
      }

      v49[0] = v24;
      v49[1] = 3221225472;
      v49[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_11;
      v49[3] = &unk_1E31596B0;
      v49[4] = self;
      v55 = v39;
      v31 = &v50;
      v32 = v5;
      v50 = v32;
      v33 = (id *)&v51;
      v51 = v28;
      v52 = v27;
      v53 = v25;
      v54 = v42;
      v34 = (void (**)(_QWORD))MEMORY[0x19403A810](v49);
      objc_msgSend(v32, "storeImportAllowedHandler");
      v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v47[0] = v24;
        v47[1] = 3221225472;
        v47[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_24;
        v47[3] = &unk_1E31596D8;
        v47[4] = self;
        v48 = v34;
        ((void (**)(_QWORD, _QWORD *))v35)[2](v35, v47);

      }
      else
      {
        v34[2](v34);
      }
      v8 = v40;

      v12 = v42;
    }

    v5 = v43;
    v7 = v41;
  }
  else
  {
    responseHandler = (void (**)(id, _QWORD))self->_responseHandler;
    if (responseHandler)
      responseHandler[2](responseHandler, 0);
    -[MPAsyncOperation finish](self, "finish");
  }

}

- (void)_updateCloudLibraryForPlaylist:(id)a3 withAddedItems:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  BOOL v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[5];
  id v65;
  SEL v66;

  v8 = a3;
  v9 = a4;
  v55 = a5;
  -[MPModelLibraryAddToPlaylistChangeRequest representativeModelObject](self->_request, "representativeModelObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "library");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "persistentID");

  objc_msgSend(v11, "personalizedStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "cloudID");

  objc_msgSend(v11, "universalStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "purchasedAdamID");
  if (!v17)
  {
    objc_msgSend(v11, "universalStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "adamID");
    if (!v17)
    {
      objc_msgSend(v11, "universalStore");
      v51 = v11;
      v19 = v13;
      v20 = v9;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v21, "subscriptionAdamID");

      v9 = v20;
      v13 = v19;
      v11 = v51;
    }

  }
  objc_opt_class();
  v54 = v10;
  LOBYTE(v10) = objc_opt_isKindOfClass();
  if (objc_msgSend(v9, "count") == 1)
  {
    v52 = v11;
    v22 = v13;
    v49 = v8;
    v50 = v9;
    objc_msgSend(v9, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "persistentID");
    objc_msgSend(v23, "valueForProperty:", CFSTR("subscriptionStoreItemAdamID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "unsignedLongLongValue");

    if (!v26)
    {
      objc_msgSend(v23, "valueForProperty:", CFSTR("storeItemAdamID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v27, "unsignedLongLongValue");

    }
    objc_msgSend(v23, "valueForProperty:", CFSTR("storeSagaID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "unsignedLongLongValue");

    if (v24)
      v30 = v22 == 0;
    else
      v30 = 0;
    if (v30)
      v13 = v24;
    else
      v13 = v22;
    if (v15)
    {
      v9 = v50;
      v11 = v52;
    }
    else
    {
      v9 = v50;
      v11 = v52;
      if (v29)
      {
        if ((objc_msgSend(v23, "mediaType") & 1) != 0)
          LOBYTE(v10) = 1;
        else
          v10 = (void *)(((unint64_t)objc_msgSend(v23, "mediaType") >> 11) & 1);
        v15 = v29;
      }
    }
    if (v26)
      v31 = v17 == 0;
    else
      v31 = 0;
    if (v31)
      v17 = v26;

    v8 = v49;
  }
  if (self->_isCollaborativePlaylist)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = MEMORY[0x1E0C809B0];
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke;
    v64[3] = &unk_1E3159730;
    v65 = v32;
    v66 = a2;
    v64[4] = self;
    v34 = v32;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v64);
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v9;
    v38 = objc_msgSend(v8, "persistentID");
    v62[0] = v33;
    v62[1] = 3221225472;
    v62[2] = __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_34;
    v62[3] = &unk_1E31624C0;
    v63 = v55;
    v39 = v38;
    v9 = v37;
    objc_msgSend(v36, "editCollaborationWithPersistentID:properties:trackEdits:completion:", v39, MEMORY[0x1E0C9AA70], v34, v62);

  }
  else if (((v15 != 0) & v10) == 1)
  {
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v8, "persistentID");
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_35;
    v60[3] = &unk_1E31624C0;
    v61 = v55;
    objc_msgSend(v41, "addItemWithSagaID:toPlaylistWithPersistentID:completionHandler:", v15, v42, v60);

    v34 = v61;
  }
  else
  {
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17 || v13)
    {
      +[MPCloudControllerItemIDList cloudItemIDListForPlaylist:](MPCloudControllerItemIDList, "cloudItemIDListForPlaylist:", v8);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v8, "persistentID");
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_38;
      v56[3] = &unk_1E31624C0;
      v57 = v55;
      objc_msgSend(v44, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", 0, v47, v48, v56);

      v34 = v57;
    }
    else
    {
      -[MPModelLibraryAddToPlaylistChangeRequest referralObject](self->_request, "referralObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v8, "persistentID");
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_36;
      v58[3] = &unk_1E31624C0;
      v59 = v55;
      objc_msgSend(v44, "addStoreItemWithAdamID:referralObject:toPlaylistWithPersistentID:completionHandler:", v17, v45, v46, v58);

      v34 = v59;
    }
  }

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

- (MPModelLibraryAddToPlaylistChangeRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_itemEntryProperties, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
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
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(v5, "persistentID");
  objc_msgSend(v5, "valueForProperty:", CFSTR("subscriptionStoreItemAdamID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  if (v8)
    goto LABEL_4;
  objc_msgSend(v5, "valueForProperty:", CFSTR("storeItemAdamID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "unsignedLongLongValue");

  if (v8
    || (objc_msgSend(v5, "valueForProperty:", CFSTR("assetStoreItemAdamID")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v10, "unsignedLongLongValue"),
        v10,
        v8))
  {
LABEL_4:
    v11 = *(void **)(a1[4] + 288);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPModelLibraryAddToPlaylistChangeRequestOperation.m"), 262, CFSTR("No item properties for track with persistent ID %lld"), v6);

    }
    v14 = (void *)a1[5];
    v15 = (void *)MEMORY[0x1E0DDBF18];
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("entryUniversalIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("entryPositionUniversalIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "paramsForAddingTrackWithAdamID:itemUUID:itemPositionUUID:atPosition:", v8, v16, v17, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

  }
  else
  {
    v19 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = a1[4];
      *(_DWORD *)buf = 138543618;
      v23 = v20;
      v24 = 2048;
      v25 = v6;
      _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_ERROR, "%{public}@ No adamID for track %lld - skipping adding to collaboration", buf, 0x16u);
    }

  }
}

void __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "-editCollaborationWithPersistentID completed. error=%{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "-editCollaborationWithPersistentID completed.", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "-addItemWithSagaID:toPlaylistWithPersistentID:completionHandler: completed. error=%{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "-addItemWithSagaID:toPlaylistWithPersistentID:completionHandler: completed.", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "-addStoreItemWithAdamID:referralObject:toPlaylistWithPersistentID:completionHandler: completed. error=%{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "-addStoreItemWithAdamID:referralObject:toPlaylistWithPersistentID:completionHandler: completed.", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "-setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler: completed. error=%{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "-setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler: completed.", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "persistentID");

  if (!v8)
    goto LABEL_12;
  objc_msgSend(*(id *)(a1 + 32), "itemWithPersistentID:verifyExistence:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9
    || (objc_msgSend(v9, "valueForProperty:", CFSTR("isInMyLibrary")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "BOOLValue"),
        v11,
        !v12))
  {

LABEL_12:
    objc_msgSend(*(id *)(a1 + 56), "itemAtIndexPath:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "appendItem:", v10);
    goto LABEL_13;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 280))
  {
    objc_msgSend(v6, "universalStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "subscriptionAdamID"))
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v6, "universalStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "adamID"))
    {

      goto LABEL_8;
    }
    objc_msgSend(v6, "universalStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "assetAdamID");

    if (!v22)
    {
      _MPLogCategoryDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v23 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v27 = v23;
        v28 = 2048;
        v29 = v8;
        v30 = 2114;
        v31 = v6;
        _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Skipping adding song with persistent ID %lld because a store ID is required. identifiers=%{public}@", buf, 0x20u);
      }
      goto LABEL_10;
    }
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
  v15 = objc_msgSend(MEMORY[0x1E0DDBF18], "newIdentifierString", CFSTR("entryUniversalIdentifier"));
  v24[1] = CFSTR("entryPositionUniversalIdentifier");
  v25[0] = v15;
  v16 = (void *)objc_msgSend(MEMORY[0x1E0DDBF18], "newIdentifierString");
  v25[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(a1 + 48);
  v19 = *(void **)(*(_QWORD *)(a1 + 40) + 288);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "count") - 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v20);

LABEL_10:
LABEL_13:

}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  MPModelLibraryImportChangeRequest *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 281))
  {
    v5 = objc_msgSend(v3, "cloudAddToPlaylistBehavior");
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 2;
  }
  if (!*(_QWORD *)(v4 + 272))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 272);
    *(_QWORD *)(v7 + 272) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "setName:", CFSTR("com.apple.MediaPlayer.MPModelLibraryAddToPlaylistChangeRequestOperation.operationQueue"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "setQualityOfService:", *(_QWORD *)(a1 + 80));
  }
  v9 = objc_alloc_init(MPModelLibraryImportChangeRequest);
  objc_msgSend(*(id *)(a1 + 40), "referralObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryImportChangeRequest setReferralObject:](v9, "setReferralObject:", v10);

  -[MPModelLibraryImportChangeRequest setModelObjects:](v9, "setModelObjects:", *(_QWORD *)(a1 + 48));
  -[MPModelLibraryImportChangeRequest setShouldLibraryAdd:](v9, "setShouldLibraryAdd:", v5 == 1);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2;
  v17 = &unk_1E3159688;
  v18 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 32);
  v19 = v11;
  v20 = v12;
  v21 = *(id *)(a1 + 72);
  v13 = -[MPModelLibraryImportChangeRequest newOperationWithResponseHandler:](v9, "newOperationWithResponseHandler:", &v14);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "addOperation:", v13, v14, v15, v16, v17);

}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_24(uint64_t a1, int a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPModelLibraryAddToPlaylistChangeRequestErrorDomain"), -6003, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD **)(a1 + 32);
    v5 = v4[38];
    v6 = (id)v3;
    if (v5)
    {
      (*(void (**)(uint64_t))(v5 + 16))(v5);
      v3 = (uint64_t)v6;
      v4 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v4, "finishWithError:", v3);

  }
}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2_25(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];

  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_isCloudLibraryEnabled")
      && objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v3 = *(_QWORD *)(a1 + 48);
      v5 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_3_26;
      v11[3] = &unk_1E3163100;
      v11[4] = v5;
      objc_msgSend(v5, "_updateCloudLibraryForPlaylist:withAddedItems:completion:", v3, v4, v11);
      return;
    }
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPModelLibraryAddToPlaylistChangeRequestErrorDomain"), -6004, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD **)(a1 + 32);
  v8 = v7[38];
  v9 = (id)v6;
  if (v8)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
    v6 = (uint64_t)v9;
    v7 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v7, "finishWithError:", v6, v9);

}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_3_26(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[38];
  v6 = v3;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    v3 = v6;
    v4 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v4, "finishWithError:", v3);

}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v30 = a1;
  v46 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v7), "identifiers", v30);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "library");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "persistentID");

        objc_msgSend(v8, "universalStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "subscriptionAdamID");
        if (!v12)
        {
          objc_msgSend(v8, "universalStore");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v13, "adamID");

        }
        if (v12)
          v14 = v10 == 0;
        else
          v14 = 1;
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKey:", v15, v16);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v5);
  }
  v17 = v3;

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_3;
  v36[3] = &unk_1E3159B30;
  v37 = v31;
  v20 = *(void **)(v30 + 32);
  v38 = *(id *)(v30 + 40);
  v21 = v18;
  v22 = *(_QWORD *)(v30 + 48);
  v39 = v21;
  v40 = v22;
  v23 = v31;
  objc_msgSend(v20, "enumerateItemIdentifiersUsingBlock:", v36);
  v24 = *(id *)(v30 + 56);
  v25 = *(_QWORD *)(v30 + 48);
  v26 = *(_QWORD *)(v25 + 288);
  v27 = *(void **)(v30 + 56);
  v32[0] = v19;
  v32[1] = 3221225472;
  v32[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_17;
  v32[3] = &unk_1E3159660;
  v32[4] = v25;
  v33 = v21;
  v34 = v24;
  v35 = v27;
  v28 = v21;
  v29 = v24;
  objc_msgSend(v35, "appendItems:andEntryProperties:completion:", v28, v26, v32);

}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "persistentID");

  if (v6)
    goto LABEL_4;
  objc_msgSend(v4, "universalStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "subscriptionAdamID");

  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v11, "longLongValue");

  if (v6)
    goto LABEL_4;
  objc_msgSend(v4, "universalStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "adamID");

  v14 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v16, "longLongValue");

  if (v6)
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 40), "itemWithPersistentID:verifyExistence:", v6, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);
      v29[0] = CFSTR("entryUniversalIdentifier");
      v18 = (void *)objc_msgSend(MEMORY[0x1E0DDBF18], "newIdentifierString");
      v29[1] = CFSTR("entryPositionUniversalIdentifier");
      v30[0] = v18;
      v19 = (void *)objc_msgSend(MEMORY[0x1E0DDBF18], "newIdentifierString");
      v30[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 48);
      v22 = *(void **)(*(_QWORD *)(a1 + 56) + 288);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "count") - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, v23);

    }
  }
  else
  {
    v17 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(a1 + 56);
      v25 = 138543618;
      v26 = v24;
      v27 = 2114;
      v28 = v4;
      _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Failed to re-map song with identifier set %{public}@", (uint8_t *)&v25, 0x16u);
    }
  }

}

uint64_t __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_17(uint64_t a1, int a2)
{
  char v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v2 = a2;
  v24 = *MEMORY[0x1E0C80C00];
  if (a2
    && objc_msgSend(*(id *)(a1 + 32), "_isCloudLibraryEnabled")
    && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2_18;
    v19[3] = &unk_1E3163100;
    v19[4] = v6;
    return objc_msgSend(v6, "_updateCloudLibraryForPlaylist:withAddedItems:completion:", v4, v5, v19);
  }
  v8 = *(_QWORD **)(a1 + 32);
  if (v8[38])
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      if ((v2 & 1) != 0)
      {
        if ((objc_msgSend(*(id *)(a1 + 32), "_isCloudLibraryEnabled") & 1) == 0)
        {
          v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            v10 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 138543362;
            v21 = v10;
            _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "Skipping cloud library update for playlist %{public}@ because cloudLibrary is not enabled", buf, 0xCu);
          }

        }
        v11 = 0;
        goto LABEL_20;
      }
      v16 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = *(_QWORD *)(a1 + 40);
        v18 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        v21 = v17;
        v22 = 2114;
        v23 = v18;
        _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_ERROR, "Failed to add items %{}@ to local database for playlist %{public}@", buf, 0x16u);
      }

      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = -6006;
    }
    else
    {
      v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        v21 = v13;
        _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "Failed to add to playlist %{public}@ because there were no resolvable items to add.", buf, 0xCu);
      }

      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = -6005;
    }
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("MPModelLibraryAddToPlaylistChangeRequestErrorDomain"), v15, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) + 16))();

    v8 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v8, "finish");
}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2_18(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[38];
  v6 = v3;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    v3 = v6;
    v4 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v4, "finishWithError:", v3);

}

@end

@implementation MPModelLibraryRemoveFromPlaylistChangeRequestOperation

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  MPModelLibraryRemoveFromPlaylistChangeRequestOperation *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  MPModelLibraryRemoveFromPlaylistChangeRequestOperation *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryRemoveFromPlaylistChangeRequest mediaLibrary](self->_request, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryRemoveFromPlaylistChangeRequest playlist](self->_request, "playlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "persistentID");

  -[MPModelLibraryRemoveFromPlaylistChangeRequest entriesToRemove](self->_request, "entriesToRemove");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v46 = self;
    v47 = 2114;
    v48 = v4;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removing tracks from playlist %{public}@", buf, 0x16u);
  }

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRemoveFromPlaylistChangeRequestOperation.m"), 29, CFSTR("Must provide a playlist in the library"));

  }
  objc_msgSend(v3, "playlistWithPersistentID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v6;
  v33 = self;
  v29 = v9;
  if (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistIsCollaborative")))
  {
    v10 = objc_msgSend(v4, "isCollaborative");
  }
  else
  {
    objc_msgSend(v9, "valueForProperty:", CFSTR("isCollaborative"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "BOOLValue");

  }
  v32 = v3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v12, "addIndex:", objc_msgSend(v19, "position"));
        if (v10)
        {
          objc_msgSend(v19, "universalIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v27 = v19;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v33, CFSTR("MPModelLibraryRemoveFromPlaylistChangeRequestOperation.m"), 42, CFSTR("No uuid for deleted entry %@"), v27);

          }
          objc_msgSend(MEMORY[0x1E0DDBF18], "paramsForRemovingTrackWithItemUUID:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v21);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v16);
  }

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke;
  v34[3] = &unk_1E315F588;
  v34[4] = v33;
  v35 = v4;
  v39 = v10;
  v36 = v13;
  v37 = v29;
  v38 = v30;
  v23 = v29;
  v24 = v13;
  v25 = v4;
  objc_msgSend(v23, "removeItems:atFilteredIndexes:completionBlock:", MEMORY[0x1E0C9AA60], v12, v34);

}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (MPModelLibraryRemoveFromPlaylistChangeRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_responseHandler, 0);
}

void __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCloudLibraryEnabled");

  if ((a2 & 1) == 0)
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to remove track entries from the database for %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 0, CFSTR("Failed to remove the track entries from the database"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v16);

    goto LABEL_11;
  }
  if ((v6 & 1) == 0)
  {
    v17 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      v31 = 2114;
      v32 = v19;
      _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Finished removing tracks from %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0);
LABEL_11:

    objc_msgSend(*(id *)(a1 + 32), "finish");
    return;
  }
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 64);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke_14;
    v27[3] = &unk_1E31637A8;
    v10 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v27[4] = *(_QWORD *)(a1 + 32);
    v28 = v10;
    objc_msgSend(v8, "editCollaborationWithPersistentID:properties:trackEdits:completion:", v9, MEMORY[0x1E0C9AA70], v11, v27);

  }
  else
  {
    +[MPCloudControllerItemIDList cloudItemIDListForPlaylist:](MPCloudControllerItemIDList, "cloudItemIDListForPlaylist:", *(_QWORD *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(*(id *)(a1 + 56), "persistentID");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke_17;
    v25[3] = &unk_1E31637A8;
    v24 = *(void **)(a1 + 40);
    v25[4] = *(_QWORD *)(a1 + 32);
    v26 = v24;
    objc_msgSend(v22, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", MEMORY[0x1E0C9AA70], v20, v23, v25);

  }
}

void __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%{public}@ finished removing cloud tracks from playlist %{public}@ error=%{public}@", (uint8_t *)&v12, 0x20u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ finished removing cloud tracks from playlist %{public}@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v11)[2](v11, v3);

  objc_msgSend(*(id *)(a1 + 32), "finish");
}

void __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%{public}@ finished removing cloud tracks from playlist %{public}@ error=%{public}@", (uint8_t *)&v12, 0x20u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ finished removing cloud tracks from playlist %{public}@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v11)[2](v11, v3);

  objc_msgSend(*(id *)(a1 + 32), "finish");
}

@end

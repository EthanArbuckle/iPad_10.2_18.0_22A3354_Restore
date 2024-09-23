@implementation MPModelLibraryPlaylistEntryReactionChangeRequestOperation

- (void)execute
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  MPPropertySet *v13;
  void *v14;
  MPModelLibraryRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MPPropertySet *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[3];
  uint8_t buf[4];
  MPModelLibraryPlaylistEntryReactionChangeRequestOperation *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryPlaylistEntryReactionChangeRequest playlist](self->_request, "playlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEntryReactionChangeRequest playlistEntry](self->_request, "playlistEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEntryReactionChangeRequest reactionText](self->_request, "reactionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "persistentID");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryPlaylistEntryReactionChangeRequestOperation.m"), 27, CFSTR("Must be a playlist in the library"));

  }
  if (objc_msgSend(v5, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistEntryUniversalIdentifier")))
  {
    objc_msgSend(v5, "universalIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v10, "length"))
  {
    -[MPModelLibraryPlaylistEntryReactionChangeRequestOperation _performSetReactionRequestForPlaylistWithPlaylist:playlistEntry:reactionText:](self, "_performSetReactionRequestForPlaylistWithPlaylist:playlistEntry:reactionText:", v4, v5, v6);
  }
  else
  {
    v26 = v6;
    v11 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = self;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Reloading playlist entry to get required properties", buf, 0xCu);
    }

    +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [MPPropertySet alloc];
    v34[0] = CFSTR("MPModelPropertyPlaylistEntryUniversalIdentifier");
    v34[1] = CFSTR("MPModelPropertyPlaylistEntryPositionUniversalIdentifier");
    v34[2] = CFSTR("MPModelPropertyPlaylistEntryPosition");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MPPropertySet initWithProperties:relationships:](v13, "initWithProperties:relationships:", v14, 0);

    v15 = objc_alloc_init(MPModelLibraryRequest);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ loading track list"), self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setLabel:](v15, "setLabel:", v16);

    v33 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylist kindWithPlaylistEntryKind:options:](MPModelPlaylist, "kindWithPlaylistEntryKind:options:", v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setSectionKind:](v15, "setSectionKind:", v19);

    -[MPModelRequest setSectionProperties:](v15, "setSectionProperties:", v24);
    v32 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setItemKind:](v15, "setItemKind:", v21);

    -[MPModelRequest setItemProperties:](v15, "setItemProperties:", v25);
    v31 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRequest setScopedContainers:](v15, "setScopedContainers:", v22);

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __68__MPModelLibraryPlaylistEntryReactionChangeRequestOperation_execute__block_invoke;
    v27[3] = &unk_1E315F620;
    v27[4] = self;
    v28 = v5;
    v29 = v4;
    v6 = v26;
    v30 = v26;
    -[MPModelLibraryRequest performWithResponseHandler:](v15, "performWithResponseHandler:", v27);

  }
}

- (void)_performSetReactionRequestForPlaylistWithPlaylist:(id)a3 playlistEntry:(id)a4 reactionText:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  MPMediaPlaylist *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  MPModelLibraryPlaylistEntryReactionChangeRequestOperation *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "library");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "persistentID");

  objc_msgSend(v8, "universalIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v26 = self;
    v27 = 2048;
    v28 = v12;
    v29 = 2114;
    v30 = v13;
    _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating reaction text on playlist %lld/%{public}@", buf, 0x20u);
  }

  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[MPMediaPlaylist initWithPersistentID:mediaLibrary:]([MPMediaPlaylist alloc], "initWithPersistentID:mediaLibrary:", v12, v16);
  v18 = objc_msgSend(v8, "position");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __138__MPModelLibraryPlaylistEntryReactionChangeRequestOperation__performSetReactionRequestForPlaylistWithPlaylist_playlistEntry_reactionText___block_invoke;
  v21[3] = &unk_1E315F668;
  v21[4] = self;
  v22 = v9;
  v23 = v13;
  v24 = v12;
  v19 = v13;
  v20 = v9;
  -[MPMediaPlaylist setReactionText:onEntryAtPosition:completion:](v17, "setReactionText:onEntryAtPosition:completion:", v20, v18, v21);

}

- (void)_finishOperationWithError:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a3;
  -[MPModelLibraryPlaylistEntryReactionChangeRequestOperation responseHandler](self, "responseHandler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v4)[2](v4, v5);

  -[MPAsyncOperation finishWithError:](self, "finishWithError:", v5);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (MPModelLibraryPlaylistEntryReactionChangeRequest)request
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

void __138__MPModelLibraryPlaylistEntryReactionChangeRequestOperation__performSetReactionRequestForPlaylistWithPlaylist_playlistEntry_reactionText___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isCloudLibraryEnabled"))
    {
      v8 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v24 = v9;
        _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sending updating reaction text to cloud library", buf, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      if (v10)
        objc_msgSend(MEMORY[0x1E0DDBF18], "paramsForSettingReaction:onTrackWithItemUUID:", v10, v11);
      else
        objc_msgSend(MEMORY[0x1E0DDBF18], "paramsForUnsettingReaction:onTrackWithItemUUID:", v5, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 56);
      v22 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "editCollaborationWithPersistentID:properties:trackEdits:completion:", v18, MEMORY[0x1E0C9AA70], v19, &__block_literal_global_43036);

    }
    v20 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_impl(&dword_193B9B000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished updating reaction text", buf, 0xCu);
    }

    v15 = *(void **)(a1 + 32);
    v16 = 0;
  }
  else
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v24 = v13;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update local library with new reaction text", buf, 0xCu);
    }

    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 0, CFSTR("Failed to update local library with reaction text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v7;
  }
  objc_msgSend(v15, "_finishOperationWithError:", v16);

}

void __68__MPModelLibraryPlaylistEntryReactionChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(a2, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistEntryPosition"));
    if (v10)
      v11 = objc_msgSend(*(id *)(a1 + 40), "position");
    else
      v11 = -1;
    objc_msgSend(*(id *)(a1 + 40), "identifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "library");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "persistentID");

    if (v10)
    {
      if (objc_msgSend(v9, "count") < (unint64_t)(v11 + 1))
      {
        v15 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v22 = v16;
          v23 = 2048;
          v24 = v11;
          _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Couldn't find entry at position %ld", buf, 0x16u);
        }

        v17 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 0, CFSTR("Couldn't find entry to get uuid from"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_finishOperationWithError:", v18);
        goto LABEL_16;
      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __68__MPModelLibraryPlaylistEntryReactionChangeRequestOperation_execute__block_invoke_17;
      v20[3] = &__block_descriptor_40_e30_B16__0__MPModelPlaylistEntry_8l;
      v20[4] = v14;
      objc_msgSend(v9, "msv_firstWhere:", v20);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v19;
    objc_msgSend(*(id *)(a1 + 32), "_performSetReactionRequestForPlaylistWithPlaylist:playlistEntry:reactionText:", *(_QWORD *)(a1 + 48), v19, *(_QWORD *)(a1 + 56));
LABEL_16:

    goto LABEL_17;
  }
  v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v22 = v7;
    v23 = 2114;
    v24 = (uint64_t)v5;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load playlist entries from library. err=%{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_finishOperationWithError:", v5);
LABEL_17:

}

BOOL __68__MPModelLibraryPlaylistEntryReactionChangeRequestOperation_execute__block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2 == objc_msgSend(v4, "persistentID");

  return v5;
}

@end

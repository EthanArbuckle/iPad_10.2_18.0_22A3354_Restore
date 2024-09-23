@implementation MPModelLibraryStartCollaborationChangeRequestOperation

- (void)execute
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int64_t v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  MPModelLibraryStartCollaborationChangeRequestOperation *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryStartCollaborationChangeRequest playlistToConvert](self->_request, "playlistToConvert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "personalizedStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cloudID");

  objc_msgSend(v5, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "persistentID");

  v10 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[MPModelLibraryStartCollaborationChangeRequest playlistToConvert](self->_request, "playlistToConvert");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = self;
    v21 = 2114;
    v22 = v11;
    v23 = 2048;
    v24 = v9;
    v25 = 2048;
    v26 = v7;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting collaboration using %{public}@ (pid=%lld, cloudID = %lld)", buf, 0x2Au);

  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryStartCollaborationChangeRequestOperation.m"), 30, CFSTR("Must provide a playlist in the library"));

  }
  +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPModelLibraryStartCollaborationChangeRequest collaborationSharingMode](self->_request, "collaborationSharingMode");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke;
  v16[3] = &unk_1E315C240;
  v16[4] = self;
  v17 = v5;
  v18 = v9;
  v14 = v5;
  objc_msgSend(v12, "beginCollaborationUsingPlaylistWithPersistentID:sharingMode:completion:", v9, v13, v16);

}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (MPModelLibraryStartCollaborationChangeRequest)request
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

void __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  MPIdentifierSet *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  MPIdentifierSet *v17;
  MPPropertySet *v18;
  void *v19;
  MPPropertySet *v20;
  MPModelLibraryRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  MPIdentifierSet *v30;
  _QWORD v31[8];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v8;
      v34 = 2048;
      v35 = a2;
      v36 = 2114;
      v37 = v9;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "%{public}@ finished start collaboration request. new collaboration cloud library ID = %lld error=%{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v5);

    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v33 = v11;
      v34 = 2048;
      v35 = a2;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished start collaboration request. new collaboration cloud library ID = %lld", buf, 0x16u);
    }

    v12 = [MPIdentifierSet alloc];
    +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_8;
    v27[3] = &unk_1E315F6D0;
    v15 = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v28 = v15;
    v29 = v16;
    v17 = -[MPIdentifierSet initWithSource:modelKind:block:](v12, "initWithSource:modelKind:block:", CFSTR("StartCollaboration"), v13, v27);

    v18 = [MPPropertySet alloc];
    v31[0] = CFSTR("MPModelPropertyPlaylistArtwork");
    v31[1] = CFSTR("MPModelPropertyPlaylistTracksTiledArtwork");
    v31[2] = CFSTR("MPModelPropertyPlaylistName");
    v31[3] = CFSTR("MPModelPropertyPlaylistIsCollaborative");
    v31[4] = CFSTR("MPModelPropertyPlaylistCollaborationSharingMode");
    v31[5] = CFSTR("MPModelPropertyPlaylistCollaborationMode");
    v31[6] = CFSTR("MPModelPropertyPlaylistCollaboratorPermissions");
    v31[7] = CFSTR("MPModelPropertyPlaylistCollaborationInvitationURL");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MPPropertySet initWithProperties:relationships:](v18, "initWithProperties:relationships:", v19, MEMORY[0x1E0C9AA70]);

    v21 = objc_alloc_init(MPModelLibraryRequest);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ loading new collaboration"), *(_QWORD *)(a1 + 32));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setLabel:](v21, "setLabel:", v22);

    +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setItemKind:](v21, "setItemKind:", v23);

    -[MPModelRequest setItemProperties:](v21, "setItemProperties:", v20);
    v30 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRequest setAllowedItemIdentifiers:](v21, "setAllowedItemIdentifiers:", v24);

    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_3;
    v25[3] = &unk_1E3162C70;
    v25[4] = *(_QWORD *)(a1 + 32);
    v26 = 0;
    -[MPModelLibraryRequest performWithResponseHandler:](v21, "performWithResponseHandler:", v25);

  }
}

void __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "library");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_2;
  v7[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v5, v7);

}

void __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  NSObject *v15;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v19 = 138543618;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load new collaboration from library. err=%{public}@", (uint8_t *)&v19, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v5);
  }
  else
  {
    objc_msgSend(a2, "results");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "playlistToConvert");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mergeWithObject:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v14)[2](v14, v13, 0);

    }
    else
    {
      v15 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v19 = 138543362;
        v20 = v16;
        _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find updated playlist in library", (uint8_t *)&v19, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 4, CFSTR("Failed to find updated playlist in library"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v17)[2](v17, 0, v18);

    }
  }

  objc_msgSend(*(id *)(a1 + 32), "finish");
}

uint64_t __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistentID:", *(_QWORD *)(a1 + 32));
}

@end

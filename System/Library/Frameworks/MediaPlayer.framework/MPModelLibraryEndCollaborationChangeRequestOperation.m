@implementation MPModelLibraryEndCollaborationChangeRequestOperation

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
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  MPModelLibraryEndCollaborationChangeRequestOperation *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryEndCollaborationChangeRequest collaborationToEnd](self->_request, "collaborationToEnd");
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
    -[MPModelLibraryEndCollaborationChangeRequest collaborationToEnd](self->_request, "collaborationToEnd");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = self;
    v20 = 2114;
    v21 = v11;
    v22 = 2048;
    v23 = v7;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ ending collaboration %{public}@ (cloudID = %lld)", buf, 0x20u);

  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryEndCollaborationChangeRequestOperation.m"), 29, CFSTR("Must provide a playlist in the library"));

  }
  +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke;
  v15[3] = &unk_1E315C240;
  v15[4] = self;
  v16 = v5;
  v17 = v9;
  v13 = v5;
  objc_msgSend(v12, "endCollaborationWithPersistentID:completion:", v9, v15);

}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (MPModelLibraryEndCollaborationChangeRequest)request
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

void __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  id v14;
  uint64_t v15;
  MPIdentifierSet *v16;
  MPPropertySet *v17;
  void *v18;
  MPPropertySet *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MPModelLibraryRequest *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  MPIdentifierSet *v32;
  void *v33;
  _QWORD v34[7];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
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
      v36 = v8;
      v37 = 2048;
      v38 = a2;
      v39 = 2114;
      v40 = v9;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "%{public}@ finished end collaboration request. new playlist cloud library ID = %lld error=%{public}@", buf, 0x20u);

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
      v36 = v11;
      v37 = 2048;
      v38 = a2;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished end collaboration request. new playlist cloud library ID = %lld", buf, 0x16u);
    }

    v12 = [MPIdentifierSet alloc];
    +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_8;
    v29[3] = &unk_1E315F6D0;
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v30 = v14;
    v31 = v15;
    v16 = -[MPIdentifierSet initWithSource:modelKind:block:](v12, "initWithSource:modelKind:block:", CFSTR("StartCollaboration"), v13, v29);

    v17 = [MPPropertySet alloc];
    v34[0] = CFSTR("MPModelPropertyPlaylistName");
    v34[1] = CFSTR("MPModelPropertyPlaylistIsCollaborative");
    v34[2] = CFSTR("MPModelPropertyPlaylistCollaborationSharingMode");
    v34[3] = CFSTR("MPModelPropertyPlaylistCollaborationMode");
    v34[4] = CFSTR("MPModelPropertyPlaylistCollaboratorPermissions");
    v34[5] = CFSTR("MPModelPropertyPlaylistCollaborationInvitationURL");
    v34[6] = CFSTR("MPModelPropertyPlaylistCollaboratorStatus");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MPPropertySet initWithProperties:relationships:](v17, "initWithProperties:relationships:", v18, MEMORY[0x1E0C9AA70]);

    +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", 31, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc_init(MPModelLibraryRequest);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ loading new collaboration"), *(_QWORD *)(a1 + 32));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setLabel:](v24, "setLabel:", v25);

    -[MPModelRequest setItemKind:](v24, "setItemKind:", v23);
    -[MPModelRequest setItemProperties:](v24, "setItemProperties:", v19);
    v32 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRequest setAllowedItemIdentifiers:](v24, "setAllowedItemIdentifiers:", v26);

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_3;
    v27[3] = &unk_1E3162C70;
    v27[4] = *(_QWORD *)(a1 + 32);
    v28 = 0;
    -[MPModelLibraryRequest performWithResponseHandler:](v24, "performWithResponseHandler:", v27);

  }
}

void __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_8(uint64_t a1, void *a2)
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
  v7[2] = __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_2;
  v7[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v5, v7);

}

void __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
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
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "collaborationToEnd");
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

uint64_t __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistentID:", *(_QWORD *)(a1 + 32));
}

@end

@implementation MPModelLibraryJoinCollaborationChangeRequestOperation

- (void)execute
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  MPModelLibraryJoinCollaborationChangeRequestOperation *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryJoinCollaborationChangeRequest collaborationToJoin](self->_request, "collaborationToJoin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "globalPlaylistID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPModelLibraryJoinCollaborationChangeRequest invitationURL](self->_request, "invitationURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[MPModelLibraryJoinCollaborationChangeRequest collaborationToJoin](self->_request, "collaborationToJoin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = self;
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ joining collaboration %{public}@ (globalPlaylistID = %{public}@)", buf, 0x20u);

  }
  if (v7)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryJoinCollaborationChangeRequestOperation.m"), 29, CFSTR("Must have a non-nil playlistID and invitation URL"));

  }
  +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__MPModelLibraryJoinCollaborationChangeRequestOperation_execute__block_invoke;
  v15[3] = &unk_1E3162C98;
  v15[4] = self;
  v16 = v5;
  v13 = v5;
  objc_msgSend(v12, "joinCollaborationWithGlobalPlaylistID:invitationURL:completion:", v7, v8, v15);

}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (MPModelLibraryJoinCollaborationChangeRequest)request
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

void __64__MPModelLibraryJoinCollaborationChangeRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  MPPropertySet *v12;
  void *v13;
  MPPropertySet *v14;
  void *v15;
  MPPropertySet *v16;
  void *v17;
  MPPropertySet *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MPModelLibraryRequest *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[2];
  const __CFString *v31;
  MPPropertySet *v32;
  _QWORD v33[7];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v8;
      v36 = 2048;
      v37 = a2;
      v38 = 2114;
      v39 = v9;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "%{public}@ finished join collaboration request. new collaboration cloud library ID = %lld error=%{public}@", buf, 0x20u);

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
      v35 = v11;
      v36 = 2048;
      v37 = a2;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished join collaboration request. new collaboration cloud library ID = %lld", buf, 0x16u);
    }

    v12 = [MPPropertySet alloc];
    v33[0] = CFSTR("MPModelPropertyPlaylistName");
    v33[1] = CFSTR("MPModelPropertyPlaylistIsCollaborative");
    v33[2] = CFSTR("MPModelPropertyPlaylistCollaborationSharingMode");
    v33[3] = CFSTR("MPModelPropertyPlaylistCollaborationMode");
    v33[4] = CFSTR("MPModelPropertyPlaylistCollaboratorPermissions");
    v33[5] = CFSTR("MPModelPropertyPlaylistCollaborationInvitationURL");
    v33[6] = CFSTR("MPModelPropertyPlaylistUserEditableComponents");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = CFSTR("MPModelRelationshipPlaylistCurator");
    v14 = [MPPropertySet alloc];
    v30[0] = CFSTR("MPModelPropertyPersonName");
    v30[1] = CFSTR("MPModelPropertyCuratorHandle");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MPPropertySet initWithProperties:relationships:](v14, "initWithProperties:relationships:", v15, MEMORY[0x1E0C9AA70]);
    v32 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MPPropertySet initWithProperties:relationships:](v12, "initWithProperties:relationships:", v13, v17);

    +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", 31, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MPModelLibraryRequest);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ loading new collaboration"), *(_QWORD *)(a1 + 32));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setLabel:](v23, "setLabel:", v24);

    -[MPModelRequest setItemKind:](v23, "setItemKind:", v22);
    -[MPModelRequest setItemProperties:](v23, "setItemProperties:", v18);
    v28 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRequest setAllowedItemIdentifiers:](v23, "setAllowedItemIdentifiers:", v25);

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __64__MPModelLibraryJoinCollaborationChangeRequestOperation_execute__block_invoke_14;
    v26[3] = &unk_1E3162C70;
    v26[4] = *(_QWORD *)(a1 + 32);
    v27 = 0;
    -[MPModelLibraryRequest performWithResponseHandler:](v23, "performWithResponseHandler:", v26);

  }
}

void __64__MPModelLibraryJoinCollaborationChangeRequestOperation_execute__block_invoke_14(uint64_t a1, void *a2, void *a3)
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v19 = 138543618;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load new collaboration from library. err=%{public}@", (uint8_t *)&v19, 0x16u);
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
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "collaborationToJoin");
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
        _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find new collaboration in library", (uint8_t *)&v19, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 4, CFSTR("Failed to find new collaboration in library"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v17)[2](v17, 0, v18);

    }
  }

  objc_msgSend(*(id *)(a1 + 32), "finish");
}

@end

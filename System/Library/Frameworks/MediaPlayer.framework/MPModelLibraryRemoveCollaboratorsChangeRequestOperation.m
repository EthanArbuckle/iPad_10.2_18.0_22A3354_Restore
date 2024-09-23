@implementation MPModelLibraryRemoveCollaboratorsChangeRequestOperation

- (void)execute
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  MPModelLibraryRemoveCollaboratorsChangeRequestOperation *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryRemoveCollaboratorsChangeRequest collaboration](self->_request, "collaboration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "globalPlaylistID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "persistentID");

  v10 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[MPModelLibraryRemoveCollaboratorsChangeRequest socialProfileIDsToRemove](self->_request, "socialProfileIDsToRemove");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "msv_compactDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = self;
    v25 = 2114;
    v26 = v4;
    v27 = 2114;
    v28 = v7;
    v29 = 2114;
    v30 = v12;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ removing collaborators from %{public}@ (globalPlaylistID = %{public}@); (%{public}@)",
      buf,
      0x2Au);

  }
  if (!v9
    || (-[MPModelLibraryRemoveCollaboratorsChangeRequest socialProfileIDsToRemove](self->_request, "socialProfileIDsToRemove"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v14 = objc_msgSend(v13, "count"), v13, !v14))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRemoveCollaboratorsChangeRequestOperation.m"), 27, CFSTR("Must provide a playlist and social profile IDs to remove"));

  }
  +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryRemoveCollaboratorsChangeRequest socialProfileIDsToRemove](self->_request, "socialProfileIDsToRemove");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__MPModelLibraryRemoveCollaboratorsChangeRequestOperation_execute__block_invoke;
  v20[3] = &unk_1E3163728;
  v20[4] = self;
  v21 = v5;
  v22 = v4;
  v18 = v4;
  v19 = v5;
  objc_msgSend(v16, "removeCollaborators:fromCollaborationWithPersistentID:completion:", v17, v9, v20);

}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (MPModelLibraryRemoveCollaboratorsChangeRequest)request
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

void __66__MPModelLibraryRemoveCollaboratorsChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  MPPropertySet *v10;
  void *v11;
  MPPropertySet *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MPModelLibraryRequest *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[6];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v6;
      v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%{public}@ finished remove collaborators request error=%{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v3);

    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v27 = v9;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ finished remove collaborators request", buf, 0xCu);
    }

    v10 = [MPPropertySet alloc];
    v25[0] = CFSTR("MPModelPropertyPlaylistName");
    v25[1] = CFSTR("MPModelPropertyPlaylistIsCollaborative");
    v25[2] = CFSTR("MPModelPropertyPlaylistCollaborationSharingMode");
    v25[3] = CFSTR("MPModelPropertyPlaylistCollaborationMode");
    v25[4] = CFSTR("MPModelPropertyPlaylistCollaboratorPermissions");
    v25[5] = CFSTR("MPModelPropertyPlaylistCollaborationInvitationURL");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MPPropertySet initWithProperties:relationships:](v10, "initWithProperties:relationships:", v11, MEMORY[0x1E0C9AA70]);

    +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", 31, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MPModelLibraryRequest);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ loading updated playlist"), *(_QWORD *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setLabel:](v17, "setLabel:", v18);

    -[MPModelRequest setItemKind:](v17, "setItemKind:", v16);
    -[MPModelRequest setItemProperties:](v17, "setItemProperties:", v12);
    v23 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRequest setAllowedItemIdentifiers:](v17, "setAllowedItemIdentifiers:", v19);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__MPModelLibraryRemoveCollaboratorsChangeRequestOperation_execute__block_invoke_13;
    v20[3] = &unk_1E3162188;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = 0;
    v22 = *(id *)(a1 + 48);
    -[MPModelLibraryRequest performWithResponseHandler:](v17, "performWithResponseHandler:", v20);

  }
}

void __66__MPModelLibraryRemoveCollaboratorsChangeRequestOperation_execute__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void (**v13)(_QWORD, _QWORD, _QWORD);
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v16 = 138543618;
      v17 = v7;
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load new collaboration from library. err=%{public}@", (uint8_t *)&v16, 0x16u);
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
      objc_msgSend(*(id *)(a1 + 48), "mergeWithObject:", v11);
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13[2](v13, v12, 0);
    }
    else
    {
      v14 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find updated playlist in library", (uint8_t *)&v16, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 4, CFSTR("Failed to find updated playlist in library"));
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v13);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "finish");

}

@end

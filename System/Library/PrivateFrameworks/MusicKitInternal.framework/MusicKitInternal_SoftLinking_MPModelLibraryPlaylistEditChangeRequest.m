@implementation MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest

- (MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithPlaylist:(id)a3 playlistEntries:(id)a4 playlistName:(id)a5 playlistDescription:(id)a6 playlistUserImage:(CGImage *)a7 publicPlaylist:(id)a8 visiblePlaylist:(id)a9 authorStoreIdentifier:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest *v23;
  MPModelLibraryPlaylistEditChangeRequest *v24;
  MPModelLibraryPlaylistEditChangeRequest *underlyingRequest;
  MPModelLibraryPlaylistEditChangeRequest *v26;
  void *v27;
  void *v28;
  MPModelLibraryPlaylistEditChangeRequest *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  CGImage *v35;
  id v36;
  void *v37;
  objc_super v38;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v38.receiver = self;
  v38.super_class = (Class)MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest;
  v23 = -[MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest init](&v38, sel_init);
  if (v23)
  {
    v35 = a7;
    v36 = v18;
    v24 = (MPModelLibraryPlaylistEditChangeRequest *)objc_alloc_init((Class)getMPModelLibraryPlaylistEditChangeRequestClass());
    underlyingRequest = v23->_underlyingRequest;
    v23->_underlyingRequest = v24;

    v26 = v23->_underlyingRequest;
    objc_msgSend(getMPMediaLibraryClass(), "deviceMediaLibrary");
    v27 = v16;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryPlaylistEditChangeRequest setMediaLibrary:](v26, "setMediaLibrary:", v28);

    v29 = v23->_underlyingRequest;
    v37 = v27;
    objc_msgSend(v27, "_underlyingModelObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylist:](v29, "setPlaylist:", v30);

    if (v17)
    {
      objc_msgSend(v17, "msv_map:", &__block_literal_global_7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass_0());
      objc_msgSend(v32, "appendSection:", &stru_1E9C1C058);
      objc_msgSend(v32, "appendItems:", v31);
      -[MPModelLibraryPlaylistEditChangeRequest setPlaylistEntries:](v23->_underlyingRequest, "setPlaylistEntries:", v32);

    }
    v18 = v36;
    if (v35)
    {
      v33 = (void *)objc_msgSend(objc_alloc((Class)getUIImageClass()), "initWithCGImage:", v35);
      -[MPModelLibraryPlaylistEditChangeRequest setPlaylistUserImage:](v23->_underlyingRequest, "setPlaylistUserImage:", v33);

    }
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistName:](v23->_underlyingRequest, "setPlaylistName:", v36);
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistDescription:](v23->_underlyingRequest, "setPlaylistDescription:", v19);
    -[MPModelLibraryPlaylistEditChangeRequest setPublicPlaylist:](v23->_underlyingRequest, "setPublicPlaylist:", v20);
    -[MPModelLibraryPlaylistEditChangeRequest setVisiblePlaylist:](v23->_underlyingRequest, "setVisiblePlaylist:", v21);
    -[MPModelLibraryPlaylistEditChangeRequest setAuthorStoreIdentifier:](v23->_underlyingRequest, "setAuthorStoreIdentifier:", v22);
    v16 = v37;
  }

  return v23;
}

- (MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithParentPlaylist:(id)a3 playlistEntries:(id)a4 playlistName:(id)a5 playlistDescription:(id)a6 playlistUserImage:(CGImage *)a7 coverArtworkRecipe:(id)a8 publicPlaylist:(id)a9 visiblePlaylist:(id)a10 authorStoreIdentifier:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest *v24;
  MPModelLibraryPlaylistEditChangeRequest *v25;
  MPModelLibraryPlaylistEditChangeRequest *underlyingRequest;
  MPModelLibraryPlaylistEditChangeRequest *v27;
  void *v28;
  MPModelLibraryPlaylistEditChangeRequest *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v36;
  objc_super v38;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v38.receiver = self;
  v38.super_class = (Class)MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest;
  v24 = -[MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest init](&v38, sel_init);
  if (v24)
  {
    v36 = v18;
    v25 = (MPModelLibraryPlaylistEditChangeRequest *)objc_alloc_init((Class)getMPModelLibraryPlaylistEditChangeRequestClass());
    underlyingRequest = v24->_underlyingRequest;
    v24->_underlyingRequest = v25;

    v27 = v24->_underlyingRequest;
    objc_msgSend(getMPMediaLibraryClass(), "deviceMediaLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryPlaylistEditChangeRequest setMediaLibrary:](v27, "setMediaLibrary:", v28);

    -[MPModelLibraryPlaylistEditChangeRequest setShouldCreatePlaylist:](v24->_underlyingRequest, "setShouldCreatePlaylist:", 1);
    v29 = v24->_underlyingRequest;
    objc_msgSend(v16, "_underlyingModelObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryPlaylistEditChangeRequest setParentPlaylist:](v29, "setParentPlaylist:", v30);

    if (v17)
    {
      objc_msgSend(v17, "msv_map:", &__block_literal_global_6);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass_0());
      objc_msgSend(v32, "appendSection:", &stru_1E9C1C058);
      objc_msgSend(v32, "appendItems:", v31);
      -[MPModelLibraryPlaylistEditChangeRequest setPlaylistEntries:](v24->_underlyingRequest, "setPlaylistEntries:", v32);

    }
    v18 = v36;
    if (a7)
    {
      v33 = (void *)objc_msgSend(objc_alloc((Class)getUIImageClass()), "initWithCGImage:", a7);
      -[MPModelLibraryPlaylistEditChangeRequest setPlaylistUserImage:](v24->_underlyingRequest, "setPlaylistUserImage:", v33);

    }
    -[MPModelLibraryPlaylistEditChangeRequest setCoverArtworkRecipe:](v24->_underlyingRequest, "setCoverArtworkRecipe:", v20, v19, v36);
    -[MPModelLibraryPlaylistEditChangeRequest setIsOwner:](v24->_underlyingRequest, "setIsOwner:", MEMORY[0x1E0C9AAB0]);
    -[MPModelLibraryPlaylistEditChangeRequest playlist](v24->_underlyingRequest, "playlist");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setOwner:", 1);

    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistName:](v24->_underlyingRequest, "setPlaylistName:", v18);
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistDescription:](v24->_underlyingRequest, "setPlaylistDescription:", v19);
    -[MPModelLibraryPlaylistEditChangeRequest setPublicPlaylist:](v24->_underlyingRequest, "setPublicPlaylist:", v21);
    -[MPModelLibraryPlaylistEditChangeRequest setVisiblePlaylist:](v24->_underlyingRequest, "setVisiblePlaylist:", v22);
    -[MPModelLibraryPlaylistEditChangeRequest setAuthorStoreIdentifier:](v24->_underlyingRequest, "setAuthorStoreIdentifier:", v23);
  }

  return v24;
}

- (void)performWithCompletionPolicy:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a4;
  -[MPModelLibraryPlaylistEditChangeRequest playlistEntries](self->_underlyingRequest, "playlistEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "msv_compactMap:", &__block_literal_global_9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass_0());
    objc_msgSend(v10, "appendSection:", &stru_1E9C1C058);
    objc_msgSend(v10, "appendItems:", v9);
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v11 = (void *)getMPModelLibraryImportChangeRequestClass_softClass;
    v22 = getMPModelLibraryImportChangeRequestClass_softClass;
    v12 = MEMORY[0x1E0C809B0];
    if (!getMPModelLibraryImportChangeRequestClass_softClass)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __getMPModelLibraryImportChangeRequestClass_block_invoke;
      v18[3] = &unk_1E9C05688;
      v18[4] = &v19;
      __getMPModelLibraryImportChangeRequestClass_block_invoke((uint64_t)v18);
      v11 = (void *)v20[3];
    }
    v13 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v19, 8);
    v14 = objc_alloc_init(v13);
    objc_msgSend(v14, "setModelObjects:", v10);
    objc_msgSend(v14, "setShouldLibraryAdd:", 0);
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __118__MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke_2;
    v15[3] = &unk_1E9C05EF0;
    v15[4] = self;
    v16 = v6;
    v17 = a3;
    objc_msgSend(v14, "performWithResponseHandler:", v15);

  }
  else
  {
    -[MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest _performWithRequest:completionPolicy:completionHandler:](self, "_performWithRequest:completionPolicy:completionHandler:", self->_underlyingRequest, a3, v6);
  }

}

- (void)_performWithRequest:(id)a3 completionPolicy:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  MPModelLibraryPlaylistEditChangeRequest *underlyingRequest;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  int64_t v18;
  _QWORD v19[4];
  id v20;
  int64_t v21;

  v7 = a5;
  underlyingRequest = self->_underlyingRequest;
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __127__MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest__performWithRequest_completionPolicy_completionHandler___block_invoke;
  v19[3] = &unk_1E9C05F18;
  v21 = a4;
  v20 = v7;
  v13 = v9;
  v14 = 3221225472;
  v15 = __127__MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest__performWithRequest_completionPolicy_completionHandler___block_invoke_2;
  v16 = &unk_1E9C05F18;
  v17 = v20;
  v18 = a4;
  v10 = v20;
  v11 = (void *)-[MPModelLibraryPlaylistEditChangeRequest newOperationWithLocalPersistenceResponseHandler:completeResponseHandler:](underlyingRequest, "newOperationWithLocalPersistenceResponseHandler:completeResponseHandler:", v19, &v13);
  +[MusicKit_SoftLinking_MPModelLibraryTransientStateController sharedLibraryTransientStateController](MusicKit_SoftLinking_MPModelLibraryTransientStateController, "sharedLibraryTransientStateController", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performOperation:", v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRequest, 0);
}

@end

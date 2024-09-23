@implementation MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest)initWithPlaylist:(id)a3 songIdentifiers:(id)a4 representativeObject:(id)a5 referralObject:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest *v14;
  void *v15;
  objc_class *v16;
  MPModelLibraryAddToPlaylistChangeRequest *v17;
  MPModelLibraryAddToPlaylistChangeRequest *underlyingAddToPlaylistChangeRequest;
  MPModelLibraryAddToPlaylistChangeRequest *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  id v24;
  MPModelLibraryAddToPlaylistChangeRequest *v25;
  void *v26;
  MPModelLibraryAddToPlaylistChangeRequest *v27;
  void *v28;
  objc_super v30;
  uint64_t v31;
  uint64_t v32;
  Class (*v33)(uint64_t);
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest;
  v14 = -[MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest init](&v30, sel_init);
  if (v14)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2050000000;
    v15 = (void *)getMPModelLibraryAddToPlaylistChangeRequestClass_softClass;
    v39 = getMPModelLibraryAddToPlaylistChangeRequestClass_softClass;
    if (!getMPModelLibraryAddToPlaylistChangeRequestClass_softClass)
    {
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __getMPModelLibraryAddToPlaylistChangeRequestClass_block_invoke;
      v34 = &unk_1E9C05688;
      v35 = &v36;
      __getMPModelLibraryAddToPlaylistChangeRequestClass_block_invoke((uint64_t)&v31);
      v15 = (void *)v37[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v36, 8);
    v17 = (MPModelLibraryAddToPlaylistChangeRequest *)objc_alloc_init(v16);
    underlyingAddToPlaylistChangeRequest = v14->_underlyingAddToPlaylistChangeRequest;
    v14->_underlyingAddToPlaylistChangeRequest = v17;

    v19 = v14->_underlyingAddToPlaylistChangeRequest;
    objc_msgSend(v10, "_underlyingModelObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryAddToPlaylistChangeRequest setPlaylist:](v19, "setPlaylist:", v20);

    objc_msgSend(v11, "msv_map:", &__block_literal_global_1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v37 = &v36;
    v38 = 0x2050000000;
    v22 = (void *)getMPMutableSectionedCollectionClass_softClass;
    v39 = getMPMutableSectionedCollectionClass_softClass;
    if (!getMPMutableSectionedCollectionClass_softClass)
    {
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __getMPMutableSectionedCollectionClass_block_invoke;
      v34 = &unk_1E9C05688;
      v35 = &v36;
      __getMPMutableSectionedCollectionClass_block_invoke((uint64_t)&v31);
      v22 = (void *)v37[3];
    }
    v23 = objc_retainAutorelease(v22);
    _Block_object_dispose(&v36, 8);
    v24 = objc_alloc_init(v23);
    objc_msgSend(v24, "appendSection:", &stru_1E9C1C058);
    objc_msgSend(v24, "appendItems:", v21);
    -[MPModelLibraryAddToPlaylistChangeRequest setSongResults:](v14->_underlyingAddToPlaylistChangeRequest, "setSongResults:", v24);
    v25 = v14->_underlyingAddToPlaylistChangeRequest;
    objc_msgSend(v12, "_underlyingModelObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryAddToPlaylistChangeRequest setRepresentativeModelObject:](v25, "setRepresentativeModelObject:", v26);

    v27 = v14->_underlyingAddToPlaylistChangeRequest;
    objc_msgSend(v13, "_underlyingModelObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryAddToPlaylistChangeRequest setReferralObject:](v27, "setReferralObject:", v28);

  }
  return v14;
}

- (MPModelLibraryAddToPlaylistChangeRequest)_underlyingLibraryAddToPlaylistChangeRequest
{
  return self->_underlyingAddToPlaylistChangeRequest;
}

- (void)setStoreImportAllowedHandler:(id)a3
{
  void *v4;
  id storeImportAllowedHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  storeImportAllowedHandler = self->_storeImportAllowedHandler;
  self->_storeImportAllowedHandler = v4;

  -[MPModelLibraryAddToPlaylistChangeRequest setStoreImportAllowedHandler:](self->_underlyingAddToPlaylistChangeRequest, "setStoreImportAllowedHandler:", self->_storeImportAllowedHandler);
}

- (id)storeImportAllowedHandler
{
  return self->_storeImportAllowedHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_storeImportAllowedHandler, 0);
  objc_storeStrong((id *)&self->_underlyingAddToPlaylistChangeRequest, 0);
}

@end

@implementation MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest)initWithPlaylist:(id)a3 entriesToRemove:(id)a4
{
  id v6;
  id v7;
  MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest *v8;
  uint64_t v9;
  MPModelPlaylist *underlyingPlaylist;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  uint64_t v17;
  MPModelLibraryRemoveFromPlaylistChangeRequest *underlyingRequest;
  objc_super v20;
  uint64_t v21;
  uint64_t v22;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest;
  v8 = -[MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest init](&v20, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "_underlyingModelObject");
    v9 = objc_claimAutoreleasedReturnValue();
    underlyingPlaylist = v8->_underlyingPlaylist;
    v8->_underlyingPlaylist = (MPModelPlaylist *)v9;

    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v11 = (void *)getMPMediaLibraryClass_softClass;
    v29 = getMPMediaLibraryClass_softClass;
    if (!getMPMediaLibraryClass_softClass)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __getMPMediaLibraryClass_block_invoke;
      v24 = &unk_1E9C05688;
      v25 = &v26;
      __getMPMediaLibraryClass_block_invoke((uint64_t)&v21);
      v11 = (void *)v27[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v26, 8);
    objc_msgSend(v12, "deviceMediaLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "msv_compactMap:", &__block_literal_global_4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v15 = (void *)getMPModelLibraryRemoveFromPlaylistChangeRequestClass_softClass;
    v29 = getMPModelLibraryRemoveFromPlaylistChangeRequestClass_softClass;
    if (!getMPModelLibraryRemoveFromPlaylistChangeRequestClass_softClass)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __getMPModelLibraryRemoveFromPlaylistChangeRequestClass_block_invoke;
      v24 = &unk_1E9C05688;
      v25 = &v26;
      __getMPModelLibraryRemoveFromPlaylistChangeRequestClass_block_invoke((uint64_t)&v21);
      v15 = (void *)v27[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v26, 8);
    v17 = objc_msgSend([v16 alloc], "initWithPlaylist:inMediaLibrary:andEntriesToRemove:", v8->_underlyingPlaylist, v13, v14);
    underlyingRequest = v8->_underlyingRequest;
    v8->_underlyingRequest = (MPModelLibraryRemoveFromPlaylistChangeRequest *)v17;

  }
  return v8;
}

- (void)performWithCompletionPolicy:(int64_t)a3 completionHandler:(id)a4
{
  id v5;
  MPModelPlaylist *v6;
  MPModelLibraryRemoveFromPlaylistChangeRequest *underlyingRequest;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  MPModelPlaylist *v13;

  v5 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__0;
  v12[4] = __Block_byref_object_dispose__0;
  v6 = self->_underlyingPlaylist;
  underlyingRequest = self->_underlyingRequest;
  v13 = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __116__MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke;
  v9[3] = &unk_1E9C05AA0;
  v11 = v12;
  v8 = v5;
  v10 = v8;
  -[MPModelLibraryRemoveFromPlaylistChangeRequest performWithResponseHandler:](underlyingRequest, "performWithResponseHandler:", v9);

  _Block_object_dispose(v12, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPlaylist, 0);
  objc_storeStrong((id *)&self->_underlyingRequest, 0);
}

@end

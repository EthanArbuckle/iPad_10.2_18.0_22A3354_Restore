@implementation MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest)initWithPlaylist:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MPModelLibraryDuplicatePlaylistChangeRequest *underlyingChangeRequest;
  objc_super v16;
  uint64_t v17;
  uint64_t v18;
  Class (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest;
  v5 = -[MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest init](&v16, sel_init);
  if (v5)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v6 = (void *)getMPModelLibraryDuplicatePlaylistChangeRequestClass_softClass;
    v25 = getMPModelLibraryDuplicatePlaylistChangeRequestClass_softClass;
    if (!getMPModelLibraryDuplicatePlaylistChangeRequestClass_softClass)
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __getMPModelLibraryDuplicatePlaylistChangeRequestClass_block_invoke;
      v20 = &unk_1E9C05688;
      v21 = &v22;
      __getMPModelLibraryDuplicatePlaylistChangeRequestClass_block_invoke((uint64_t)&v17);
      v6 = (void *)v23[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v22, 8);
    v8 = [v7 alloc];
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v9 = (void *)getMPMediaLibraryClass_softClass_0;
    v25 = getMPMediaLibraryClass_softClass_0;
    if (!getMPMediaLibraryClass_softClass_0)
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __getMPMediaLibraryClass_block_invoke_0;
      v20 = &unk_1E9C05688;
      v21 = &v22;
      __getMPMediaLibraryClass_block_invoke_0((uint64_t)&v17);
      v9 = (void *)v23[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v22, 8);
    objc_msgSend(v10, "deviceMediaLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_underlyingModelObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "initWithLibrary:playlist:", v11, v12);
    underlyingChangeRequest = v5->_underlyingChangeRequest;
    v5->_underlyingChangeRequest = (MPModelLibraryDuplicatePlaylistChangeRequest *)v13;

  }
  return v5;
}

- (void)performWithCompletionPolicy:(int64_t)a3 completionHandler:(id)a4
{
  id v5;
  MPModelLibraryDuplicatePlaylistChangeRequest *underlyingChangeRequest;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  underlyingChangeRequest = self->_underlyingChangeRequest;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke;
  v8[3] = &unk_1E9C05D70;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[MPModelLibraryDuplicatePlaylistChangeRequest performWithResponseHandler:](underlyingChangeRequest, "performWithResponseHandler:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingChangeRequest, 0);
}

@end

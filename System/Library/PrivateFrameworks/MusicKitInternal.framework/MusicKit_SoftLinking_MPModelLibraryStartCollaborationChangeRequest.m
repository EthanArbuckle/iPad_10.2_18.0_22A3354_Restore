@implementation MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest)initWithPlaylist:(id)a3 sharingMode:(int64_t)a4
{
  id v6;
  MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest *v7;
  void *v8;
  objc_class *v9;
  MPModelLibraryStartCollaborationChangeRequest *v10;
  MPModelLibraryStartCollaborationChangeRequest *underlyingStartCollaborationRequest;
  MPModelLibraryStartCollaborationChangeRequest *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest;
  v7 = -[MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest init](&v15, sel_init);
  if (v7)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v8 = (void *)getMPModelLibraryStartCollaborationChangeRequestClass_softClass;
    v20 = getMPModelLibraryStartCollaborationChangeRequestClass_softClass;
    if (!getMPModelLibraryStartCollaborationChangeRequestClass_softClass)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getMPModelLibraryStartCollaborationChangeRequestClass_block_invoke;
      v16[3] = &unk_1E9C05688;
      v16[4] = &v17;
      __getMPModelLibraryStartCollaborationChangeRequestClass_block_invoke((uint64_t)v16);
      v8 = (void *)v18[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v17, 8);
    v10 = (MPModelLibraryStartCollaborationChangeRequest *)objc_alloc_init(v9);
    underlyingStartCollaborationRequest = v7->_underlyingStartCollaborationRequest;
    v7->_underlyingStartCollaborationRequest = v10;

    v12 = v7->_underlyingStartCollaborationRequest;
    objc_msgSend(v6, "_underlyingModelObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryStartCollaborationChangeRequest setPlaylistToConvert:](v12, "setPlaylistToConvert:", v13);

    -[MPModelLibraryStartCollaborationChangeRequest setCollaborationSharingMode:](v7->_underlyingStartCollaborationRequest, "setCollaborationSharingMode:", objc_msgSend(MEMORY[0x1E0CCDE30], "_underlyingModelSharingModeForSharingMode:", a4));
  }

  return v7;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  MPModelLibraryStartCollaborationChangeRequest *underlyingStartCollaborationRequest;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  underlyingStartCollaborationRequest = self->_underlyingStartCollaborationRequest;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E9C05870;
  v8 = v4;
  v6 = v4;
  -[MPModelLibraryStartCollaborationChangeRequest performWithResponseHandler:](underlyingStartCollaborationRequest, "performWithResponseHandler:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingStartCollaborationRequest, 0);
}

@end

@implementation MusicKit_SoftLinking_MPModelLibraryPlaylistEntryReactionChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryPlaylistEntryReactionChangeRequest)initWithPlaylist:(id)a3 playlistEntry:(id)a4 reactionText:(id)a5
{
  id v8;
  id v9;
  id v10;
  MusicKit_SoftLinking_MPModelLibraryPlaylistEntryReactionChangeRequest *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MPModelLibraryPlaylistEntryReactionChangeRequest *underlyingPlaylistEntryReactionChangeRequest;
  objc_super v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEntryReactionChangeRequest;
  v11 = -[MusicKit_SoftLinking_MPModelLibraryPlaylistEntryReactionChangeRequest init](&v20, sel_init);
  if (v11)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v12 = (void *)getMPModelLibraryPlaylistEntryReactionChangeRequestClass_softClass;
    v25 = getMPModelLibraryPlaylistEntryReactionChangeRequestClass_softClass;
    if (!getMPModelLibraryPlaylistEntryReactionChangeRequestClass_softClass)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __getMPModelLibraryPlaylistEntryReactionChangeRequestClass_block_invoke;
      v21[3] = &unk_1E9C05688;
      v21[4] = &v22;
      __getMPModelLibraryPlaylistEntryReactionChangeRequestClass_block_invoke((uint64_t)v21);
      v12 = (void *)v23[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v22, 8);
    v14 = [v13 alloc];
    objc_msgSend(v8, "_underlyingModelObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_underlyingModelObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "initWithPlaylist:playlistEntry:reactionText:", v15, v16, v10);
    underlyingPlaylistEntryReactionChangeRequest = v11->_underlyingPlaylistEntryReactionChangeRequest;
    v11->_underlyingPlaylistEntryReactionChangeRequest = (MPModelLibraryPlaylistEntryReactionChangeRequest *)v17;

  }
  return v11;
}

- (void)performWithResponseHandler:(id)a3
{
  -[MPModelLibraryPlaylistEntryReactionChangeRequest performWithResponseHandler:](self->_underlyingPlaylistEntryReactionChangeRequest, "performWithResponseHandler:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPlaylistEntryReactionChangeRequest, 0);
}

@end

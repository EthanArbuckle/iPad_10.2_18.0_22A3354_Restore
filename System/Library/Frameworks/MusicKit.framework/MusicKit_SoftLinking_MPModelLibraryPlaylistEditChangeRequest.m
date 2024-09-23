@implementation MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithPlaylistEntries:(id)a3 playlistName:(id)a4 playlistDescription:(id)a5 authorDisplayName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest *v14;
  uint64_t v15;
  MusicKit_SoftLinking_MPMediaLibrary *mediaLibrary;
  MPModelLibraryPlaylistEditChangeRequest *v17;
  MPModelLibraryPlaylistEditChangeRequest *underlyingRequest;
  MPModelLibraryPlaylistEditChangeRequest *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest;
  v14 = -[MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest init](&v26, sel_init);
  if (v14)
  {
    +[MusicKit_SoftLinking_MPMediaLibrary deviceLibrary](MusicKit_SoftLinking_MPMediaLibrary, "deviceLibrary");
    v15 = objc_claimAutoreleasedReturnValue();
    mediaLibrary = v14->_mediaLibrary;
    v14->_mediaLibrary = (MusicKit_SoftLinking_MPMediaLibrary *)v15;

    v17 = (MPModelLibraryPlaylistEditChangeRequest *)objc_alloc_init((Class)getMPModelLibraryPlaylistEditChangeRequestClass());
    underlyingRequest = v14->_underlyingRequest;
    v14->_underlyingRequest = v17;

    v19 = v14->_underlyingRequest;
    -[MusicKit_SoftLinking_MPMediaLibrary _underlyingMediaLibrary](v14->_mediaLibrary, "_underlyingMediaLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryPlaylistEditChangeRequest setMediaLibrary:](v19, "setMediaLibrary:", v20);

    -[MPModelLibraryPlaylistEditChangeRequest setShouldCreatePlaylist:](v14->_underlyingRequest, "setShouldCreatePlaylist:", 1);
    if (v10)
    {
      objc_msgSend(v10, "msv_map:", &__block_literal_global_5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass());
      objc_msgSend(v22, "appendSection:", &stru_24CD2F188);
      objc_msgSend(v22, "appendItems:", v21);
      -[MPModelLibraryPlaylistEditChangeRequest setMusicKitPlaylistEntries:](v14->_underlyingRequest, "setMusicKitPlaylistEntries:", v22);

    }
    v23 = MEMORY[0x24BDBD1C8];
    -[MPModelLibraryPlaylistEditChangeRequest setIsOwner:](v14->_underlyingRequest, "setIsOwner:", MEMORY[0x24BDBD1C8]);
    -[MPModelLibraryPlaylistEditChangeRequest playlist](v14->_underlyingRequest, "playlist");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setOwner:", 1);

    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistName:](v14->_underlyingRequest, "setPlaylistName:", v11);
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistDescription:](v14->_underlyingRequest, "setPlaylistDescription:", v12);
    -[MPModelLibraryPlaylistEditChangeRequest setPublicPlaylist:](v14->_underlyingRequest, "setPublicPlaylist:", v23);
    -[MPModelLibraryPlaylistEditChangeRequest setVisiblePlaylist:](v14->_underlyingRequest, "setVisiblePlaylist:", v23);
    -[MPModelLibraryPlaylistEditChangeRequest setAuthorDisplayName:](v14->_underlyingRequest, "setAuthorDisplayName:", v13);
  }

  return v14;
}

- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithPlaylist:(id)a3 playlistEntries:(id)a4 playlistName:(id)a5 playlistDescription:(id)a6 authorDisplayName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest *v17;
  uint64_t v18;
  MusicKit_SoftLinking_MPMediaLibrary *mediaLibrary;
  MPModelLibraryPlaylistEditChangeRequest *v20;
  MPModelLibraryPlaylistEditChangeRequest *underlyingRequest;
  MPModelLibraryPlaylistEditChangeRequest *v22;
  void *v23;
  MPModelLibraryPlaylistEditChangeRequest *v24;
  void *v25;
  void *v26;
  id v27;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest;
  v17 = -[MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest init](&v29, sel_init);
  if (v17)
  {
    +[MusicKit_SoftLinking_MPMediaLibrary deviceLibrary](MusicKit_SoftLinking_MPMediaLibrary, "deviceLibrary");
    v18 = objc_claimAutoreleasedReturnValue();
    mediaLibrary = v17->_mediaLibrary;
    v17->_mediaLibrary = (MusicKit_SoftLinking_MPMediaLibrary *)v18;

    v20 = (MPModelLibraryPlaylistEditChangeRequest *)objc_alloc_init((Class)getMPModelLibraryPlaylistEditChangeRequestClass());
    underlyingRequest = v17->_underlyingRequest;
    v17->_underlyingRequest = v20;

    v22 = v17->_underlyingRequest;
    -[MusicKit_SoftLinking_MPMediaLibrary _underlyingMediaLibrary](v17->_mediaLibrary, "_underlyingMediaLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryPlaylistEditChangeRequest setMediaLibrary:](v22, "setMediaLibrary:", v23);

    v24 = v17->_underlyingRequest;
    objc_msgSend(v12, "_underlyingModelObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylist:](v24, "setPlaylist:", v25);

    if (v13)
    {
      objc_msgSend(v13, "msv_map:", &__block_literal_global_2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass());
      objc_msgSend(v27, "appendSection:", &stru_24CD2F188);
      objc_msgSend(v27, "appendItems:", v26);
      -[MPModelLibraryPlaylistEditChangeRequest setMusicKitPlaylistEntries:](v17->_underlyingRequest, "setMusicKitPlaylistEntries:", v27);

    }
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistName:](v17->_underlyingRequest, "setPlaylistName:", v14);
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistDescription:](v17->_underlyingRequest, "setPlaylistDescription:", v15);
    -[MPModelLibraryPlaylistEditChangeRequest setAuthorDisplayName:](v17->_underlyingRequest, "setAuthorDisplayName:", v16);
  }

  return v17;
}

- (void)sdk_performWithCompletionHandler:(id)a3
{
  id v4;
  MPModelLibraryPlaylistEditChangeRequest *underlyingRequest;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  underlyingRequest = self->_underlyingRequest;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __97__MusicKit_SoftLinking_MPModelLibraryPlaylistEditChangeRequest_sdk_performWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_24CD1D4A0;
  v9 = v4;
  v6 = v4;
  v7 = (void *)-[MPModelLibraryPlaylistEditChangeRequest newSDKOperationWithLocalPersistenceResponseHandler:completeResponseHandler:](underlyingRequest, "newSDKOperationWithLocalPersistenceResponseHandler:completeResponseHandler:", &__block_literal_global_4_0, v8);
  -[MusicKit_SoftLinking_MPMediaLibrary performOperation:](self->_mediaLibrary, "performOperation:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_underlyingRequest, 0);
}

@end

@implementation MPModelLibraryDuplicatePlaylistChangeRequest

- (MPModelLibraryDuplicatePlaylistChangeRequest)initWithLibrary:(id)a3 playlist:(id)a4
{
  id v7;
  id v8;
  MPModelLibraryDuplicatePlaylistChangeRequest *v9;
  MPModelLibraryDuplicatePlaylistChangeRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPModelLibraryDuplicatePlaylistChangeRequest;
  v9 = -[MPModelLibraryDuplicatePlaylistChangeRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibrary, a3);
    objc_storeStrong((id *)&v10->_playlist, a4);
  }

  return v10;
}

- (MPModelLibraryDuplicatePlaylistChangeRequest)initWithLibrary:(id)a3 playlistPersistentID:(int64_t)a4
{
  id v7;
  MPModelLibraryDuplicatePlaylistChangeRequest *v8;
  MPModelLibraryDuplicatePlaylistChangeRequest *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPModelLibraryDuplicatePlaylistChangeRequest;
  v8 = -[MPModelLibraryDuplicatePlaylistChangeRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaLibrary, a3);
    v9->_playlistPersistentID = a4;
  }

  return v9;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryDuplicatePlaylistChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryDuplicatePlaylistChangeRequestOperation);
  -[MPModelLibraryDuplicatePlaylistChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryDuplicatePlaylistChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  void *v3;
  id v4;

  v4 = -[MPModelLibraryDuplicatePlaylistChangeRequest newOperationWithResponseHandler:](self, "newOperationWithResponseHandler:", a3);
  +[MPModelLibraryChangeRequest sharedOperationQueue](MPModelLibraryChangeRequest, "sharedOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_mediaLibrary);
    objc_storeStrong((id *)(v5 + 16), self->_playlist);
    *(_QWORD *)(v5 + 24) = self->_playlistPersistentID;
  }
  return (id)v5;
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (int64_t)playlistPersistentID
{
  return self->_playlistPersistentID;
}

- (void)setPlaylistPersistentID:(int64_t)a3
{
  self->_playlistPersistentID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end

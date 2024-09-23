@implementation MPModelLibraryRemoveFromPlaylistChangeRequest

- (MPModelLibraryRemoveFromPlaylistChangeRequest)initWithPlaylist:(id)a3 inMediaLibrary:(id)a4 andEntriesToRemove:(id)a5
{
  id v9;
  id v10;
  id v11;
  MPModelLibraryRemoveFromPlaylistChangeRequest *v12;
  MPModelLibraryRemoveFromPlaylistChangeRequest *v13;
  uint64_t v14;
  NSArray *entriesToRemove;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MPModelLibraryRemoveFromPlaylistChangeRequest;
  v12 = -[MPModelLibraryRemoveFromPlaylistChangeRequest init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mediaLibrary, a4);
    objc_storeStrong((id *)&v13->_playlist, a3);
    v14 = objc_msgSend(v11, "copy");
    entriesToRemove = v13->_entriesToRemove;
    v13->_entriesToRemove = (NSArray *)v14;

  }
  return v13;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryRemoveFromPlaylistChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryRemoveFromPlaylistChangeRequestOperation);
  -[MPModelLibraryRemoveFromPlaylistChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryRemoveFromPlaylistChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  void *v3;
  id v4;

  v4 = -[MPModelLibraryRemoveFromPlaylistChangeRequest newOperationWithResponseHandler:](self, "newOperationWithResponseHandler:", a3);
  +[MPModelLibraryChangeRequest sharedOperationQueue](MPModelLibraryChangeRequest, "sharedOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_mediaLibrary);
    objc_storeStrong(v5 + 2, self->_playlist);
    objc_storeStrong(v5 + 3, self->_entriesToRemove);
  }
  return v5;
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

- (NSArray)entriesToRemove
{
  return self->_entriesToRemove;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entriesToRemove, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end

@implementation MPModelLibraryPlaylistEntryReactionChangeRequest

- (MPModelLibraryPlaylistEntryReactionChangeRequest)initWithPlaylist:(id)a3 playlistEntry:(id)a4 reactionText:(id)a5
{
  id v9;
  id v10;
  id v11;
  MPModelLibraryPlaylistEntryReactionChangeRequest *v12;
  MPModelLibraryPlaylistEntryReactionChangeRequest *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[MPModelLibraryPlaylistEntryReactionChangeRequest init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_playlist, a3);
    objc_storeStrong((id *)&v13->_playlistEntry, a4);
    objc_storeStrong((id *)&v13->_reactionText, a5);
  }

  return v13;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryPlaylistEntryReactionChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryPlaylistEntryReactionChangeRequestOperation);
  -[MPModelLibraryPlaylistEntryReactionChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryPlaylistEntryReactionChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  void *v3;
  id v4;

  v4 = -[MPModelLibraryPlaylistEntryReactionChangeRequest newOperationWithResponseHandler:](self, "newOperationWithResponseHandler:", a3);
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
    objc_storeStrong(v4 + 1, self->_playlist);
    objc_storeStrong(v5 + 2, self->_playlistEntry);
    objc_storeStrong(v5 + 3, self->_reactionText);
  }
  return v5;
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (MPModelPlaylistEntry)playlistEntry
{
  return self->_playlistEntry;
}

- (void)setPlaylistEntry:(id)a3
{
  objc_storeStrong((id *)&self->_playlistEntry, a3);
}

- (NSString)reactionText
{
  return self->_reactionText;
}

- (void)setReactionText:(id)a3
{
  objc_storeStrong((id *)&self->_reactionText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reactionText, 0);
  objc_storeStrong((id *)&self->_playlistEntry, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
}

@end

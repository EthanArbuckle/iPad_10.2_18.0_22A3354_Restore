@implementation MPModelPlaylistEntriesShareEligibilityRequest

- (MPModelPlaylistEntriesShareEligibilityRequest)initWithPlaylist:(id)a3
{
  id v5;
  MPModelPlaylistEntriesShareEligibilityRequest *v6;
  MPModelPlaylistEntriesShareEligibilityRequest *v7;

  v5 = a3;
  v6 = -[MPModelPlaylistEntriesShareEligibilityRequest init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_playlist, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPlaylist:", self->_playlist);
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelPlaylistEntriesShareEligibilityRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelPlaylistEntriesShareEligibilityRequestOperation);
  -[MPModelPlaylistEntriesShareEligibilityRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelPlaylistEntriesShareEligibilityRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlist, 0);
}

@end

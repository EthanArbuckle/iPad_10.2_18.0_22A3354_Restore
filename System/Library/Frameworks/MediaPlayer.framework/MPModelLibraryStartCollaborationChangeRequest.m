@implementation MPModelLibraryStartCollaborationChangeRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _QWORD *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)v4 + 1, self->_playlistToConvert);
    v5[2] = self->_collaborationSharingMode;
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryStartCollaborationChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryStartCollaborationChangeRequestOperation);
  -[MPModelLibraryStartCollaborationChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryStartCollaborationChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  void *v3;
  id v4;

  v4 = -[MPModelLibraryStartCollaborationChangeRequest newOperationWithResponseHandler:](self, "newOperationWithResponseHandler:", a3);
  +[MPModelLibraryChangeRequest sharedOperationQueue](MPModelLibraryChangeRequest, "sharedOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

- (MPModelPlaylist)playlistToConvert
{
  return self->_playlistToConvert;
}

- (void)setPlaylistToConvert:(id)a3
{
  objc_storeStrong((id *)&self->_playlistToConvert, a3);
}

- (int64_t)collaborationSharingMode
{
  return self->_collaborationSharingMode;
}

- (void)setCollaborationSharingMode:(int64_t)a3
{
  self->_collaborationSharingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistToConvert, 0);
}

@end

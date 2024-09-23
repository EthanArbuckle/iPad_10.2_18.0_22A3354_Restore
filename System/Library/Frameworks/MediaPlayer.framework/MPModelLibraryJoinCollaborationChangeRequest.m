@implementation MPModelLibraryJoinCollaborationChangeRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_collaborationToJoin);
    objc_storeStrong(v5 + 2, self->_invitationURL);
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryJoinCollaborationChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryJoinCollaborationChangeRequestOperation);
  -[MPModelLibraryJoinCollaborationChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryJoinCollaborationChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  void *v3;
  id v4;

  v4 = -[MPModelLibraryJoinCollaborationChangeRequest newOperationWithResponseHandler:](self, "newOperationWithResponseHandler:", a3);
  +[MPModelLibraryChangeRequest sharedOperationQueue](MPModelLibraryChangeRequest, "sharedOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

- (MPModelPlaylist)collaborationToJoin
{
  return self->_collaborationToJoin;
}

- (void)setCollaborationToJoin:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationToJoin, a3);
}

- (NSURL)invitationURL
{
  return self->_invitationURL;
}

- (void)setInvitationURL:(id)a3
{
  objc_storeStrong((id *)&self->_invitationURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationURL, 0);
  objc_storeStrong((id *)&self->_collaborationToJoin, 0);
}

@end

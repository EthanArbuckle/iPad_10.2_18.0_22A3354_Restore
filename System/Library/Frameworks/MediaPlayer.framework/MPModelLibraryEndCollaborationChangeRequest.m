@implementation MPModelLibraryEndCollaborationChangeRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 1, self->_collaborationToEnd);
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryEndCollaborationChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryEndCollaborationChangeRequestOperation);
  -[MPModelLibraryEndCollaborationChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryEndCollaborationChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  void *v3;
  id v4;

  v4 = -[MPModelLibraryEndCollaborationChangeRequest newOperationWithResponseHandler:](self, "newOperationWithResponseHandler:", a3);
  +[MPModelLibraryChangeRequest sharedOperationQueue](MPModelLibraryChangeRequest, "sharedOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

- (MPModelPlaylist)collaborationToEnd
{
  return self->_collaborationToEnd;
}

- (void)setCollaborationToEnd:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationToEnd, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationToEnd, 0);
}

@end

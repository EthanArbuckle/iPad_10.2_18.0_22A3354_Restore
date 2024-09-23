@implementation MPModelLibraryRemoveCollaboratorsChangeRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_collaboration);
    objc_storeStrong(v5 + 2, self->_socialProfileIDsToRemove);
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryRemoveCollaboratorsChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryRemoveCollaboratorsChangeRequestOperation);
  -[MPModelLibraryRemoveCollaboratorsChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryRemoveCollaboratorsChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  void *v3;
  id v4;

  v4 = -[MPModelLibraryRemoveCollaboratorsChangeRequest newOperationWithResponseHandler:](self, "newOperationWithResponseHandler:", a3);
  +[MPModelLibraryChangeRequest sharedOperationQueue](MPModelLibraryChangeRequest, "sharedOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

- (MPModelPlaylist)collaboration
{
  return self->_collaboration;
}

- (void)setCollaboration:(id)a3
{
  objc_storeStrong((id *)&self->_collaboration, a3);
}

- (NSArray)socialProfileIDsToRemove
{
  return self->_socialProfileIDsToRemove;
}

- (void)setSocialProfileIDsToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_socialProfileIDsToRemove, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfileIDsToRemove, 0);
  objc_storeStrong((id *)&self->_collaboration, 0);
}

@end

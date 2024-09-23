@implementation MPModelLibraryDeleteEntityChangeRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 1, self->_modelObject);
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryDeleteEntityChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryDeleteEntityChangeRequestOperation);
  -[MPModelLibraryDeleteEntityChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryDeleteEntityChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[MPModelLibraryTransientStateController sharedDeviceLibraryController](MPModelLibraryTransientStateController, "sharedDeviceLibraryController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performDeleteEntityChangeRequest:withRelatedModelObjects:completion:", self, 0, v4);

}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
  objc_storeStrong((id *)&self->_modelObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end

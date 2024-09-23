@implementation MPModelLibraryFavoriteEntityChangeRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_modelObject);
    objc_storeStrong(v5 + 2, self->_requestAction);
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryFavoriteEntityChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryFavoriteEntityChangeRequestOperation);
  -[MPModelLibraryFavoriteEntityChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryFavoriteEntityChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
  objc_storeStrong((id *)&self->_modelObject, a3);
}

- (MPModelLibraryFavoriteEntityRequestAction)requestAction
{
  return self->_requestAction;
}

- (void)setRequestAction:(id)a3
{
  objc_storeStrong((id *)&self->_requestAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAction, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end

@implementation MPModelLibraryAlbumAppDataChangeRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_modelObject);
    objc_storeStrong(v5 + 2, self->_albumAppData);
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryAlbumAppDataChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryAlbumAppDataChangeRequestOperation);
  -[MPModelLibraryAlbumAppDataChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryAlbumAppDataChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

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

- (MPMediaLibraryAlbumAppData)albumAppData
{
  return self->_albumAppData;
}

- (void)setAlbumAppData:(id)a3
{
  objc_storeStrong((id *)&self->_albumAppData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumAppData, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end

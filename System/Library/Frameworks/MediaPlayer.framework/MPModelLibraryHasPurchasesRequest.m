@implementation MPModelLibraryHasPurchasesRequest

- (MPMediaLibrary)mediaLibrary
{
  MPMediaLibrary *mediaLibrary;

  mediaLibrary = self->_mediaLibrary;
  if (mediaLibrary)
    return mediaLibrary;
  +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
  return (MPMediaLibrary *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    -[MPModelLibraryHasPurchasesRequest modelObject](self, "modelObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setModelObject:", v5);

    -[MPModelLibraryHasPurchasesRequest itemKind](self, "itemKind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setItemKind:", v6);

    -[MPModelLibraryHasPurchasesRequest mediaLibrary](self, "mediaLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMediaLibrary:", v7);

  }
  return v4;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryHasPurchasesRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryHasPurchasesRequestOperation);
  -[MPModelLibraryHasPurchasesRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryHasPurchasesRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

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

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (MPModelKind)itemKind
{
  return self->_itemKind;
}

- (void)setItemKind:(id)a3
{
  objc_storeStrong((id *)&self->_itemKind, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemKind, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end

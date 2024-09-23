@implementation MPModelLibraryImportChangeRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_modelObjects);
    *((_BYTE *)v5 + 8) = self->_shouldLibraryAdd;
    objc_storeStrong(v5 + 2, self->_referralObject);
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryImportChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryImportChangeRequestOperation);
  -[MPModelLibraryImportChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryImportChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[MPModelLibraryTransientStateController sharedDeviceLibraryController](MPModelLibraryTransientStateController, "sharedDeviceLibraryController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performLibraryImportChangeRequest:withRelatedModelObjects:completion:", self, 0, v4);

}

- (MPModelObject)referralObject
{
  return self->_referralObject;
}

- (void)setReferralObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MPSectionedCollection)modelObjects
{
  return self->_modelObjects;
}

- (void)setModelObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)shouldLibraryAdd
{
  return self->_shouldLibraryAdd;
}

- (void)setShouldLibraryAdd:(BOOL)a3
{
  self->_shouldLibraryAdd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelObjects, 0);
  objc_storeStrong((id *)&self->_referralObject, 0);
}

@end

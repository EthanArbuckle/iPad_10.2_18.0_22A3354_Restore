@implementation MPModelLibraryKeepLocalChangeRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _QWORD *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)v4 + 1, self->_modelObject);
    v5[2] = self->_enableState;
    v5[3] = self->_constraints;
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryKeepLocalChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryKeepLocalChangeRequestOperation);
  -[MPModelLibraryKeepLocalChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryKeepLocalChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

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

- (int64_t)enableState
{
  return self->_enableState;
}

- (void)setEnableState:(int64_t)a3
{
  self->_enableState = a3;
}

- (unint64_t)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(unint64_t)a3
{
  self->_constraints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end

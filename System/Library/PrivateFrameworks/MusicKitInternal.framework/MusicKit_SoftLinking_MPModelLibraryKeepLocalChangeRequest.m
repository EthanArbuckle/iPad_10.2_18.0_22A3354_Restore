@implementation MusicKit_SoftLinking_MPModelLibraryKeepLocalChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryKeepLocalChangeRequest)init
{
  MusicKit_SoftLinking_MPModelLibraryKeepLocalChangeRequest *v2;
  void *v3;
  objc_class *v4;
  MPModelLibraryKeepLocalChangeRequest *v5;
  MPModelLibraryKeepLocalChangeRequest *underlyingLibraryKeepLocalChangeRequest;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryKeepLocalChangeRequest;
  v2 = -[MusicKit_SoftLinking_MPModelLibraryKeepLocalChangeRequest init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getMPModelLibraryKeepLocalChangeRequestClass_softClass;
    v13 = getMPModelLibraryKeepLocalChangeRequestClass_softClass;
    if (!getMPModelLibraryKeepLocalChangeRequestClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getMPModelLibraryKeepLocalChangeRequestClass_block_invoke;
      v9[3] = &unk_1E9C05688;
      v9[4] = &v10;
      __getMPModelLibraryKeepLocalChangeRequestClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (MPModelLibraryKeepLocalChangeRequest *)objc_alloc_init(v4);
    underlyingLibraryKeepLocalChangeRequest = v2->_underlyingLibraryKeepLocalChangeRequest;
    v2->_underlyingLibraryKeepLocalChangeRequest = v5;

  }
  return v2;
}

- (MPModelLibraryKeepLocalChangeRequest)_underlyingLibraryKeepLocalChangeRequest
{
  return self->_underlyingLibraryKeepLocalChangeRequest;
}

- (void)setModelObject:(id)a3
{
  id v5;
  MPModelLibraryKeepLocalChangeRequest *underlyingLibraryKeepLocalChangeRequest;
  id v7;

  objc_storeStrong((id *)&self->_modelObject, a3);
  v5 = a3;
  underlyingLibraryKeepLocalChangeRequest = self->_underlyingLibraryKeepLocalChangeRequest;
  objc_msgSend(v5, "_underlyingModelObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryKeepLocalChangeRequest setModelObject:](underlyingLibraryKeepLocalChangeRequest, "setModelObject:", v7);

}

- (void)setEnableState:(int64_t)a3
{
  int64_t v3;

  self->_enableState = a3;
  if ((unint64_t)a3 >= 5)
    v3 = 0;
  else
    v3 = a3 - 1;
  -[MPModelLibraryKeepLocalChangeRequest setEnableState:](self->_underlyingLibraryKeepLocalChangeRequest, "setEnableState:", v3);
}

- (void)setConstraints:(unint64_t)a3
{
  -[MPModelLibraryKeepLocalChangeRequest setConstraints:](self->_underlyingLibraryKeepLocalChangeRequest, "setConstraints:", a3 & 0x1F);
}

- (MusicKit_SoftLinking_MPModelObject)modelObject
{
  return self->_modelObject;
}

- (int64_t)enableState
{
  return self->_enableState;
}

- (NSArray)relatedModelObjects
{
  return self->_relatedModelObjects;
}

- (void)setRelatedModelObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)constraints
{
  return self->_constraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedModelObjects, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
  objc_storeStrong((id *)&self->_underlyingLibraryKeepLocalChangeRequest, 0);
}

@end

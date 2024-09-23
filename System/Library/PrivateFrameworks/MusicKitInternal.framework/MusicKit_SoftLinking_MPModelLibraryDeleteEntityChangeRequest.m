@implementation MusicKit_SoftLinking_MPModelLibraryDeleteEntityChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryDeleteEntityChangeRequest)init
{
  MusicKit_SoftLinking_MPModelLibraryDeleteEntityChangeRequest *v2;
  void *v3;
  objc_class *v4;
  MPModelLibraryDeleteEntityChangeRequest *v5;
  MPModelLibraryDeleteEntityChangeRequest *underlyingLibraryDeleteEntityChangeRequest;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryDeleteEntityChangeRequest;
  v2 = -[MusicKit_SoftLinking_MPModelLibraryDeleteEntityChangeRequest init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getMPModelLibraryDeleteEntityChangeRequestClass_softClass;
    v13 = getMPModelLibraryDeleteEntityChangeRequestClass_softClass;
    if (!getMPModelLibraryDeleteEntityChangeRequestClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getMPModelLibraryDeleteEntityChangeRequestClass_block_invoke;
      v9[3] = &unk_1E9C05688;
      v9[4] = &v10;
      __getMPModelLibraryDeleteEntityChangeRequestClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (MPModelLibraryDeleteEntityChangeRequest *)objc_alloc_init(v4);
    underlyingLibraryDeleteEntityChangeRequest = v2->_underlyingLibraryDeleteEntityChangeRequest;
    v2->_underlyingLibraryDeleteEntityChangeRequest = v5;

  }
  return v2;
}

- (MPModelLibraryDeleteEntityChangeRequest)_underlyingLibraryDeleteEntityChangeRequest
{
  return self->_underlyingLibraryDeleteEntityChangeRequest;
}

- (void)setModelObject:(id)a3
{
  MPModelLibraryDeleteEntityChangeRequest *underlyingLibraryDeleteEntityChangeRequest;
  id v4;

  underlyingLibraryDeleteEntityChangeRequest = self->_underlyingLibraryDeleteEntityChangeRequest;
  objc_msgSend(a3, "_underlyingModelObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryDeleteEntityChangeRequest setModelObject:](underlyingLibraryDeleteEntityChangeRequest, "setModelObject:", v4);

}

- (MusicKit_SoftLinking_MPModelObject)modelObject
{
  return self->_modelObject;
}

- (NSArray)relatedModelObjects
{
  return self->_relatedModelObjects;
}

- (void)setRelatedModelObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedModelObjects, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
  objc_storeStrong((id *)&self->_underlyingLibraryDeleteEntityChangeRequest, 0);
}

@end

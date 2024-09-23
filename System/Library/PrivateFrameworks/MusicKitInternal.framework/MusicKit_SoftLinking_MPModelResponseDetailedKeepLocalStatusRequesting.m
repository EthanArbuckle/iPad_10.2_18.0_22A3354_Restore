@implementation MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting

- (MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting)initWithModelObject:(id)a3 children:(id)a4
{
  id v7;
  id v8;
  MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting *v9;
  MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting *v10;
  uint64_t v11;
  NSArray *children;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting;
  v9 = -[MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelObject, a3);
    v11 = objc_msgSend(v8, "copy");
    children = v10->_children;
    v10->_children = (NSArray *)v11;

  }
  return v10;
}

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v7 = (void *)getMPMutableSectionedCollectionClass_softClass_1;
  v32 = getMPMutableSectionedCollectionClass_softClass_1;
  v8 = MEMORY[0x1E0C809B0];
  if (!getMPMutableSectionedCollectionClass_softClass_1)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getMPMutableSectionedCollectionClass_block_invoke_1;
    v27 = &unk_1E9C05688;
    v28 = &v29;
    __getMPMutableSectionedCollectionClass_block_invoke_1((uint64_t)&v24);
    v7 = (void *)v30[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v29, 8);
  v10 = objc_alloc_init(v9);
  -[MusicKit_SoftLinking_MPModelObject _underlyingModelObject](self->_modelObject, "_underlyingModelObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendSection:", v11);

  -[NSArray msv_map:](self->_children, "msv_map:", &__block_literal_global_3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendItems:", v12);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v13 = (void *)getMPStoreLibraryPersonalizationRequestClass_softClass;
  v32 = getMPStoreLibraryPersonalizationRequestClass_softClass;
  if (!getMPStoreLibraryPersonalizationRequestClass_softClass)
  {
    v24 = v8;
    v25 = 3221225472;
    v26 = __getMPStoreLibraryPersonalizationRequestClass_block_invoke;
    v27 = &unk_1E9C05688;
    v28 = &v29;
    __getMPStoreLibraryPersonalizationRequestClass_block_invoke((uint64_t)&v24);
    v13 = (void *)v30[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v29, 8);
  v15 = (void *)objc_msgSend([v14 alloc], "initWithUnpersonalizedContentDescriptors:", v10);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v16 = (void *)getMPStoreLibraryPersonalizationResponseClass_softClass;
  v32 = getMPStoreLibraryPersonalizationResponseClass_softClass;
  if (!getMPStoreLibraryPersonalizationResponseClass_softClass)
  {
    v24 = v8;
    v25 = 3221225472;
    v26 = __getMPStoreLibraryPersonalizationResponseClass_block_invoke;
    v27 = &unk_1E9C05688;
    v28 = &v29;
    __getMPStoreLibraryPersonalizationResponseClass_block_invoke((uint64_t)&v24);
    v16 = (void *)v30[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v29, 8);
  v18 = (void *)objc_msgSend([v17 alloc], "initWithRequest:", v15);
  objc_msgSend(v18, "setResults:", v10);
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __158__MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke_2;
  v22[3] = &unk_1E9C05A48;
  v23 = v6;
  v19 = v6;
  v20 = (void *)objc_msgSend(v18, "newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:responseHandler:", a3, v22);

  return v20;
}

- (MusicKit_SoftLinking_MPModelObject)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
  objc_storeStrong((id *)&self->_modelObject, a3);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end

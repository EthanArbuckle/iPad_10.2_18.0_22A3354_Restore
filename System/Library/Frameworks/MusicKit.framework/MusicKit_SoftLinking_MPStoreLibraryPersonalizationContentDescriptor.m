@implementation MusicKit_SoftLinking_MPStoreLibraryPersonalizationContentDescriptor

- (MusicKit_SoftLinking_MPStoreLibraryPersonalizationContentDescriptor)initWithModel:(id)a3 personalizationStyle:(int64_t)a4
{
  id v6;
  MusicKit_SoftLinking_MPStoreLibraryPersonalizationContentDescriptor *v7;
  int64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  uint64_t v12;
  MPStoreLibraryPersonalizationContentDescriptor *underlyingContentDescriptor;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MusicKit_SoftLinking_MPStoreLibraryPersonalizationContentDescriptor;
  v7 = -[MusicKit_SoftLinking_MPStoreLibraryPersonalizationContentDescriptor init](&v15, sel_init);
  if (v7)
  {
    if ((unint64_t)(a4 - 1) >= 4)
      v8 = 0;
    else
      v8 = a4;
    objc_msgSend(v6, "_underlyingObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v10 = (void *)getMPStoreLibraryPersonalizationContentDescriptorClass_softClass;
    v20 = getMPStoreLibraryPersonalizationContentDescriptorClass_softClass;
    if (!getMPStoreLibraryPersonalizationContentDescriptorClass_softClass)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __getMPStoreLibraryPersonalizationContentDescriptorClass_block_invoke;
      v16[3] = &unk_24CD1CC68;
      v16[4] = &v17;
      __getMPStoreLibraryPersonalizationContentDescriptorClass_block_invoke((uint64_t)v16);
      v10 = (void *)v18[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v17, 8);
    v12 = objc_msgSend([v11 alloc], "initWithModel:personalizationStyle:", v9, v8);
    underlyingContentDescriptor = v7->_underlyingContentDescriptor;
    v7->_underlyingContentDescriptor = (MPStoreLibraryPersonalizationContentDescriptor *)v12;

  }
  return v7;
}

- (MPStoreLibraryPersonalizationContentDescriptor)_underlyingContentDescriptor
{
  return self->_underlyingContentDescriptor;
}

- (id)underlyingObject
{
  return self->_underlyingContentDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingContentDescriptor, 0);
}

@end

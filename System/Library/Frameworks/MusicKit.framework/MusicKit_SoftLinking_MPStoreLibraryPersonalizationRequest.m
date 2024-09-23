@implementation MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest

- (MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest)initWithUnpersonalizedRequest:(id)a3 unpersonalizedContentDescriptors:(id)a4 representedObjects:(id)a5
{
  id v8;
  id v9;
  id v10;
  MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MPStoreLibraryPersonalizationRequest *underlyingPersonalizationRequest;
  MPStoreLibraryPersonalizationRequest *v19;
  void *v20;
  MPStoreLibraryPersonalizationRequest *v21;
  void *v22;
  void *v23;
  objc_super v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest;
  v11 = -[MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest init](&v25, sel_init);
  if (v11)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v12 = (void *)getMPStoreLibraryPersonalizationRequestClass_softClass;
    v30 = getMPStoreLibraryPersonalizationRequestClass_softClass;
    if (!getMPStoreLibraryPersonalizationRequestClass_softClass)
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __getMPStoreLibraryPersonalizationRequestClass_block_invoke;
      v26[3] = &unk_24CD1CC68;
      v26[4] = &v27;
      __getMPStoreLibraryPersonalizationRequestClass_block_invoke((uint64_t)v26);
      v12 = (void *)v28[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v27, 8);
    v14 = [v13 alloc];
    objc_msgSend(v8, "_underlyingRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_underlyingSectionedCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "initWithUnpersonalizedRequest:unpersonalizedContentDescriptors:", v15, v16);
    underlyingPersonalizationRequest = v11->_underlyingPersonalizationRequest;
    v11->_underlyingPersonalizationRequest = (MPStoreLibraryPersonalizationRequest *)v17;

    v19 = v11->_underlyingPersonalizationRequest;
    objc_msgSend(v10, "_underlyingSectionedCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreLibraryPersonalizationRequest setRepresentedObjects:](v19, "setRepresentedObjects:", v20);

    v21 = v11->_underlyingPersonalizationRequest;
    objc_msgSend(v8, "_underlyingRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "itemProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreLibraryPersonalizationRequest setItemProperties:](v21, "setItemProperties:", v23);

  }
  return v11;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  MPStoreLibraryPersonalizationRequest *underlyingPersonalizationRequest;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  underlyingPersonalizationRequest = self->_underlyingPersonalizationRequest;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__MusicKit_SoftLinking_MPStoreLibraryPersonalizationRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_24CD1CD48;
  v8 = v4;
  v6 = v4;
  -[MPStoreLibraryPersonalizationRequest performWithResponseHandler:](underlyingPersonalizationRequest, "performWithResponseHandler:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPersonalizationRequest, 0);
}

@end

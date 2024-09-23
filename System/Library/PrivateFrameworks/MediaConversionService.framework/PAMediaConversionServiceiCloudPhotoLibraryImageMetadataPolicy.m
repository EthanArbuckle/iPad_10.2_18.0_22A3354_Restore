@implementation PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy

- (id)processMetadata:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v4 = (objc_class *)MEMORY[0x1E0D75140];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithImageProperties:contentType:timeZoneLookup:", v5, 0, 0);
  objc_msgSend(v6, "livePhotoPairingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy;
  -[PAMediaConversionServiceDefaultImageMetadataPolicy processMetadata:](&v14, sel_processMetadata_, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    v10 = (void *)MEMORY[0x1E0D75148];
    objc_msgSend(v6, "livePhotoPairingIdentifierMetadataKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "addMakerApplePropertyWithKey:value:toProperties:", v11, v7, v9);

    if ((_DWORD)v10)
    {
      v12 = v9;

      v8 = v12;
    }

  }
  return v8;
}

+ (id)standardPolicy
{
  void *v4;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_class();
  if ((objc_msgSend(v4, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceImageMetadataPolicy.m"), 297, CFSTR("Subclasses must override %@"), v7);

  }
  if (standardPolicy_onceToken_70 != -1)
    dispatch_once(&standardPolicy_onceToken_70, &__block_literal_global_71);
  return (id)standardPolicy_standardPolicy_69;
}

void __79__PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy_standardPolicy__block_invoke()
{
  PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy *v0;
  void *v1;

  v0 = objc_alloc_init(PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy);
  v1 = (void *)standardPolicy_standardPolicy_69;
  standardPolicy_standardPolicy_69 = (uint64_t)v0;

}

@end

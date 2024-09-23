@implementation PHAssetCloudSharedProperties

- (PHAssetCloudSharedProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHAssetCloudSharedProperties *v9;
  PHAssetCloudSharedProperties *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHAssetCloudSharedProperties;
  v9 = -[PHAssetCloudSharedProperties init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cloudIsMyAsset"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_cloudIsMyAsset = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cloudHasCommentsByMe"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_cloudHasCommentsByMe = objc_msgSend(v12, "BOOLValue");

  }
  return v10;
}

- (BOOL)cloudIsMyAsset
{
  return self->_cloudIsMyAsset;
}

- (BOOL)cloudHasCommentsByMe
{
  return self->_cloudHasCommentsByMe;
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetCloudShared");
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)entityName
{
  return 0;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_49;
}

void __49__PHAssetCloudSharedProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("cloudIsMyAsset");
  v3[1] = CFSTR("cloudHasCommentsByMe");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_49;
  propertiesToFetch_pl_once_object_49 = v1;

}

@end

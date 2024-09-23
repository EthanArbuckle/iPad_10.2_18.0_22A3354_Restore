@implementation PHAssetSpatialMediaProperties

- (PHAssetSpatialMediaProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHAssetSpatialMediaProperties *v9;
  PHAssetSpatialMediaProperties *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHAssetSpatialMediaProperties;
  v9 = -[PHAssetSpatialMediaProperties init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("spatialType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_spatialMediaType = objc_msgSend(v11, "shortValue");

  }
  return v10;
}

- (signed)spatialMediaType
{
  return self->_spatialMediaType;
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetSpatialMedia");
}

+ (id)entityName
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_73;
}

void __50__PHAssetSpatialMediaProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("spatialType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_73;
  propertiesToFetch_pl_once_object_73 = v1;

}

@end

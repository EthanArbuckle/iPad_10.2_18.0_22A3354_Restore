@implementation PHAssetPhotosInfoPanelLocationProperties

- (PHAssetPhotosInfoPanelLocationProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  PHAssetPhotosInfoPanelLocationProperties *v8;
  const __CFString *v9;
  uint64_t v10;
  NSData *placeAnnotationData;
  objc_super v13;

  v5 = a5;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHAssetPhotosInfoPanelLocationProperties;
  v8 = -[PHAssetPhotosInfoPanelLocationProperties init](&v13, sel_init);
  if (v8)
  {
    if (v5)
      v9 = CFSTR("additionalAttributes.placeAnnotationData");
    else
      v9 = CFSTR("placeAnnotationData");
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    placeAnnotationData = v8->_placeAnnotationData;
    v8->_placeAnnotationData = (NSData *)v10;

  }
  return v8;
}

- (NSData)placeAnnotationData
{
  return self->_placeAnnotationData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeAnnotationData, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetPhotosInfoPanelLocation");
}

+ (id)keyPathFromPrimaryObject
{
  return CFSTR("additionalAttributes");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_46;
}

void __61__PHAssetPhotosInfoPanelLocationProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("placeAnnotationData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_46;
  propertiesToFetch_pl_once_object_46 = v1;

}

@end

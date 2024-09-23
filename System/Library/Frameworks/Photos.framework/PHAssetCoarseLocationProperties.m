@implementation PHAssetCoarseLocationProperties

- (PHAssetCoarseLocationProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetCoarseLocationProperties *v10;
  PHAssetCoarseLocationProperties *v11;
  const __CFString *v12;
  void *v13;
  double v14;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetCoarseLocationProperties;
  v10 = -[PHAssetCoarseLocationProperties init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
      v12 = CFSTR("additionalAttributes.gpsHorizontalAccuracy");
    else
      v12 = CFSTR("gpsHorizontalAccuracy");
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v11->_gpsHorizontalAccuracy = v14;

  }
  return v11;
}

- (double)gpsHorizontalAccuracy
{
  return self->_gpsHorizontalAccuracy;
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetCoarseLocation");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_66;
}

void __52__PHAssetCoarseLocationProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("gpsHorizontalAccuracy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_66;
  propertiesToFetch_pl_once_object_66 = v1;

}

@end

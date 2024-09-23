@implementation PHAssetIconicScoreProperties

- (PHAssetIconicScoreProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHAssetIconicScoreProperties *v9;
  PHAssetIconicScoreProperties *v10;
  void *v11;
  double v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHAssetIconicScoreProperties;
  v9 = -[PHAssetIconicScoreProperties init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iconicScore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v10->_iconicScore = v12;

  }
  return v10;
}

- (double)iconicScore
{
  return self->_iconicScore;
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

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetIconicScore");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_77;
}

void __49__PHAssetIconicScoreProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("iconicScore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_77;
  propertiesToFetch_pl_once_object_77 = v1;

}

@end

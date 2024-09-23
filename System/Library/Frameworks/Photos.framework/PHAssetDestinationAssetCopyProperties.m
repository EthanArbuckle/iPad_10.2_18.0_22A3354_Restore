@implementation PHAssetDestinationAssetCopyProperties

- (PHAssetDestinationAssetCopyProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetDestinationAssetCopyProperties *v10;
  PHAssetDestinationAssetCopyProperties *v11;
  const __CFString *v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  objc_super v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PHAssetDestinationAssetCopyProperties;
  v10 = -[PHAssetDestinationAssetCopyProperties init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
      v12 = CFSTR("additionalAttributes.destinationAssetCopyState");
    else
      v12 = CFSTR("destinationAssetCopyState");
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    v15 = (v14 + 1);
    if (v15 <= 3)
      v11->_destinationAssetCopyState = v15 - 1;
  }

  return v11;
}

- (int64_t)destinationAssetCopyState
{
  return self->_destinationAssetCopyState;
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetDestinationAssetCopy");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_65;
}

void __58__PHAssetDestinationAssetCopyProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("destinationAssetCopyState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_65;
  propertiesToFetch_pl_once_object_65 = v1;

}

@end

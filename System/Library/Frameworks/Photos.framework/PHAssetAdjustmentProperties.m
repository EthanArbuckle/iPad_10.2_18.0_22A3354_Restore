@implementation PHAssetAdjustmentProperties

- (PHAssetAdjustmentProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetAdjustmentProperties *v10;
  PHAssetAdjustmentProperties *v11;
  BOOL v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  NSString *formatIdentifier;
  uint64_t v18;
  NSString *formatVersion;
  void *v20;
  objc_super v22;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PHAssetAdjustmentProperties;
  v10 = -[PHAssetAdjustmentProperties init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    v12 = !v5;
    if (v5)
      v13 = CFSTR("additionalAttributes.unmanagedAdjustment.adjustmentFormatIdentifier");
    else
      v13 = CFSTR("unmanagedAdjustment.adjustmentFormatIdentifier");
    if (v5)
      v14 = CFSTR("additionalAttributes.unmanagedAdjustment.adjustmentFormatVersion");
    else
      v14 = CFSTR("unmanagedAdjustment.adjustmentFormatVersion");
    if (v12)
      v15 = CFSTR("originalResourceChoice");
    else
      v15 = CFSTR("additionalAttributes.originalResourceChoice");
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    formatIdentifier = v11->_formatIdentifier;
    v11->_formatIdentifier = (NSString *)v16;

    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    formatVersion = v11->_formatVersion;
    v11->_formatVersion = (NSString *)v18;

    objc_msgSend(v8, "objectForKeyedSubscript:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_originalResourceChoice = objc_msgSend(v20, "unsignedIntegerValue");

  }
  return v11;
}

- (NSString)formatIdentifier
{
  return self->_formatIdentifier;
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (unint64_t)originalResourceChoice
{
  return self->_originalResourceChoice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_formatIdentifier, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetAdjustment");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_54;
}

void __48__PHAssetAdjustmentProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("unmanagedAdjustment.adjustmentFormatIdentifier");
  v3[1] = CFSTR("unmanagedAdjustment.adjustmentFormatVersion");
  v3[2] = CFSTR("originalResourceChoice");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_54;
  propertiesToFetch_pl_once_object_54 = v1;

}

@end

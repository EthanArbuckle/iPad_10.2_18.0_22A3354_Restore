@implementation PHAssetMontageProperties

- (PHAssetMontageProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetMontageProperties *v10;
  PHAssetMontageProperties *v11;
  const __CFString *v12;
  uint64_t v13;
  NSString *montage;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetMontageProperties;
  v10 = -[PHAssetMontageProperties init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
      v12 = CFSTR("additionalAttributes.montage");
    else
      v12 = CFSTR("montage");
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    montage = v11->_montage;
    v11->_montage = (NSString *)v13;

  }
  return v11;
}

- (NSString)montage
{
  return self->_montage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_montage, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetMontage");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_72;
}

void __45__PHAssetMontageProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("montage");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_72;
  propertiesToFetch_pl_once_object_72 = v1;

}

@end

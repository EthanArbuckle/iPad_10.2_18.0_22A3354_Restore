@implementation PHAssetDescriptionProperties

- (PHAssetDescriptionProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetDescriptionProperties *v10;
  PHAssetDescriptionProperties *v11;
  BOOL v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  NSString *title;
  void *v19;
  uint64_t v20;
  NSString *assetDescription;
  void *v22;
  uint64_t v23;
  NSString *accessibilityDescription;
  objc_super v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PHAssetDescriptionProperties;
  v10 = -[PHAssetDescriptionProperties init](&v26, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    v12 = !v5;
    if (v5)
      v13 = CFSTR("additionalAttributes.title");
    else
      v13 = CFSTR("title");
    if (v5)
      v14 = CFSTR("additionalAttributes.assetDescription.longDescription");
    else
      v14 = CFSTR("assetDescription.longDescription");
    if (v12)
      v15 = CFSTR("accessibilityDescription");
    else
      v15 = CFSTR("additionalAttributes.accessibilityDescription");
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v17;

    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    assetDescription = v11->_assetDescription;
    v11->_assetDescription = (NSString *)v20;

    objc_msgSend(v8, "objectForKeyedSubscript:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    accessibilityDescription = v11->_accessibilityDescription;
    v11->_accessibilityDescription = (NSString *)v23;

  }
  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)assetDescription
{
  return self->_assetDescription;
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_assetDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetDescription");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_48;
}

void __49__PHAssetDescriptionProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("title");
  v3[1] = CFSTR("assetDescription.longDescription");
  v3[2] = CFSTR("accessibilityDescription");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_48;
  propertiesToFetch_pl_once_object_48 = v1;

}

@end

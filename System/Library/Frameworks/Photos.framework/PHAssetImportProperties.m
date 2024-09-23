@implementation PHAssetImportProperties

- (PHAssetImportProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetImportProperties *v10;
  PHAssetImportProperties *v11;
  const __CFString *v12;
  void *v13;
  unint64_t v14;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetImportProperties;
  v10 = -[PHAssetImportProperties init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
      v12 = CFSTR("additionalAttributes.importedBy");
    else
      v12 = CFSTR("importedBy");
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (v14 <= 0xC)
      v11->_importedBy = v14;
  }

  return v11;
}

- (int64_t)importedBy
{
  return self->_importedBy;
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetImport");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_63;
}

void __44__PHAssetImportProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("importedBy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_63;
  propertiesToFetch_pl_once_object_63 = v1;

}

@end

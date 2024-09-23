@implementation PHAssetGridMetadataProperties

- (PHAssetGridMetadataProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetGridMetadataProperties *v10;
  PHAssetGridMetadataProperties *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *originalFilename;
  objc_super v19;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PHAssetGridMetadataProperties;
  v10 = -[PHAssetGridMetadataProperties init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
      v12 = CFSTR("additionalAttributes.title");
    else
      v12 = CFSTR("title");
    if (v5)
      v13 = CFSTR("additionalAttributes.originalFilename");
    else
      v13 = CFSTR("originalFilename");
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    title = v11->_title;
    v11->_title = (NSString *)v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    originalFilename = v11->_originalFilename;
    v11->_originalFilename = (NSString *)v16;

  }
  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetGridMetadata");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_41;
}

void __50__PHAssetGridMetadataProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("title");
  v3[1] = CFSTR("originalFilename");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_41;
  propertiesToFetch_pl_once_object_41 = v1;

}

@end

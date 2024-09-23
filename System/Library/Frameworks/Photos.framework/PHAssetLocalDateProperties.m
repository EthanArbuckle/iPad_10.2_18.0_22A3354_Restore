@implementation PHAssetLocalDateProperties

- (PHAssetLocalDateProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetLocalDateProperties *v10;
  PHAssetLocalDateProperties *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSNumber *inferredTimeZoneOffset;
  void *v16;
  objc_super v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PHAssetLocalDateProperties;
  v10 = -[PHAssetLocalDateProperties init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
      v12 = CFSTR("additionalAttributes.inferredTimeZoneOffset");
    else
      v12 = CFSTR("inferredTimeZoneOffset");
    if (v5)
      v13 = CFSTR("additionalAttributes.dateCreatedSource");
    else
      v13 = CFSTR("dateCreatedSource");
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    inferredTimeZoneOffset = v11->_inferredTimeZoneOffset;
    v11->_inferredTimeZoneOffset = (NSNumber *)v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_creationDateSource = objc_msgSend(v16, "integerValue");

  }
  return v11;
}

- (NSNumber)inferredTimeZoneOffset
{
  return self->_inferredTimeZoneOffset;
}

- (int64_t)creationDateSource
{
  return self->_creationDateSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredTimeZoneOffset, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetLocalDate");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_43;
}

void __47__PHAssetLocalDateProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("inferredTimeZoneOffset");
  v3[1] = CFSTR("dateCreatedSource");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_43;
  propertiesToFetch_pl_once_object_43 = v1;

}

@end

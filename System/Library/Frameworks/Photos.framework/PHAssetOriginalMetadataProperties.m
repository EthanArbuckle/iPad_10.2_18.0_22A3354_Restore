@implementation PHAssetOriginalMetadataProperties

- (PHAssetOriginalMetadataProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetOriginalMetadataProperties *v10;
  PHAssetOriginalMetadataProperties *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  NSString *originalAssetsUUID;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *originalFilename;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  NSTimeZone *timeZone;
  NSTimeZone *v33;
  uint64_t v34;
  void *v35;
  objc_super v37;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PHAssetOriginalMetadataProperties;
  v10 = -[PHAssetOriginalMetadataProperties init](&v37, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
      v12 = CFSTR("additionalAttributes.originalAssetsUUID");
    else
      v12 = CFSTR("originalAssetsUUID");
    if (v5)
      v13 = CFSTR("additionalAttributes.originalHeight");
    else
      v13 = CFSTR("originalHeight");
    if (v5)
      v14 = CFSTR("additionalAttributes.originalWidth");
    else
      v14 = CFSTR("originalWidth");
    if (v5)
      v15 = CFSTR("additionalAttributes.originalFilename");
    else
      v15 = CFSTR("originalFilename");
    if (v5)
      v16 = CFSTR("additionalAttributes.originalOrientation");
    else
      v16 = CFSTR("originalOrientation");
    if (v5)
      v17 = CFSTR("additionalAttributes.originalFilesize");
    else
      v17 = CFSTR("originalFilesize");
    if (v5)
      v18 = CFSTR("additionalAttributes.timeZoneOffset");
    else
      v18 = CFSTR("timeZoneOffset");
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v19 = objc_claimAutoreleasedReturnValue();
    originalAssetsUUID = v11->_originalAssetsUUID;
    v11->_originalAssetsUUID = (NSString *)v19;

    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_originalHeight = objc_msgSend(v21, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_originalWidth = objc_msgSend(v22, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v15);
    v23 = objc_claimAutoreleasedReturnValue();
    originalFilename = v11->_originalFilename;
    v11->_originalFilename = (NSString *)v23;

    objc_msgSend(v8, "objectForKeyedSubscript:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_originalExifOrientation = objc_msgSend(v25, "shortValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_originalFilesize = objc_msgSend(v26, "unsignedLongLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      v11->_timeZoneOffset = objc_msgSend(v27, "intValue");
    if (v5)
      v29 = CFSTR("additionalAttributes.timeZoneName");
    else
      v29 = CFSTR("timeZoneName");
    objc_msgSend(v8, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", v30);
      timeZone = v11->_timeZone;
      v11->_timeZone = (NSTimeZone *)v31;

    }
    v33 = v11->_timeZone;
    if (!v28 || v33)
    {
      if (v28 || !v33)
        goto LABEL_37;
      objc_msgSend(v9, "creationDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_timeZoneOffset = -[NSTimeZone secondsFromGMTForDate:](v33, "secondsFromGMTForDate:", v35);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", objc_msgSend(v28, "integerValue"));
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v11->_timeZone;
      v11->_timeZone = (NSTimeZone *)v34;
    }

LABEL_37:
  }

  return v11;
}

- (NSString)originalAssetsUUID
{
  return self->_originalAssetsUUID;
}

- (int64_t)originalHeight
{
  return self->_originalHeight;
}

- (int64_t)originalWidth
{
  return self->_originalWidth;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (signed)originalExifOrientation
{
  return self->_originalExifOrientation;
}

- (unint64_t)originalFilesize
{
  return self->_originalFilesize;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int)timeZoneOffset
{
  return self->_timeZoneOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_originalAssetsUUID, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetOriginalMetadata");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_40;
}

void __54__PHAssetOriginalMetadataProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("originalAssetsUUID");
  v3[1] = CFSTR("originalFilename");
  v3[2] = CFSTR("originalFilesize");
  v3[3] = CFSTR("originalHeight");
  v3[4] = CFSTR("originalOrientation");
  v3[5] = CFSTR("originalWidth");
  v3[6] = CFSTR("timeZoneName");
  v3[7] = CFSTR("timeZoneOffset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_40;
  propertiesToFetch_pl_once_object_40 = v1;

}

@end

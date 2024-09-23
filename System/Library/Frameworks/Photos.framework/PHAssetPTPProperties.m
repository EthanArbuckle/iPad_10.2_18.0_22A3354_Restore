@implementation PHAssetPTPProperties

- (PHAssetPTPProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHAssetPTPProperties *v9;
  PHAssetPTPProperties *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *livePhotoPairingIdentifier;
  uint64_t v16;
  NSString *filename;
  uint64_t v18;
  NSString *burstIdentifier;
  uint64_t v20;
  NSData *locationData;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *originalFilename;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *exifTimestampString;
  void *v31;
  uint64_t v32;
  NSString *originatingAssetIdentifier;
  uint64_t v34;
  NSNumber *embeddedThumbnailOffset;
  uint64_t v36;
  NSNumber *embeddedThumbnailLength;
  uint64_t v38;
  NSNumber *embeddedThumbnailWidth;
  uint64_t v40;
  NSNumber *embeddedThumbnailHeight;
  uint64_t v42;
  NSString *fingerprint;
  void *v44;
  uint64_t v45;
  NSDate *dateCreated;
  uint64_t v47;
  NSNumber *originalDuration;
  uint64_t v49;
  NSString *codec;
  objc_super v52;

  v7 = a3;
  v8 = a4;
  v52.receiver = self;
  v52.super_class = (Class)PHAssetPTPProperties;
  v9 = -[PHAssetPTPProperties init](&v52, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kindSubtype"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_kindSubType = objc_msgSend(v11, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kind"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_kind = objc_msgSend(v12, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("avalanchePickType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_burstPickType = objc_msgSend(v13, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mediaGroupUUID"));
    v14 = objc_claimAutoreleasedReturnValue();
    livePhotoPairingIdentifier = v10->_livePhotoPairingIdentifier;
    v10->_livePhotoPairingIdentifier = (NSString *)v14;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("filename"));
    v16 = objc_claimAutoreleasedReturnValue();
    filename = v10->_filename;
    v10->_filename = (NSString *)v16;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("avalancheUUID"));
    v18 = objc_claimAutoreleasedReturnValue();
    burstIdentifier = v10->_burstIdentifier;
    v10->_burstIdentifier = (NSString *)v18;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("locationData"));
    v20 = objc_claimAutoreleasedReturnValue();
    locationData = v10->_locationData;
    v10->_locationData = (NSData *)v20;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hdrType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_hdrType = objc_msgSend(v22, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("deferredProcessingNeeded"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_deferredProcessingNeeded = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.originalFilename"));
    v24 = objc_claimAutoreleasedReturnValue();
    originalFilename = v10->_originalFilename;
    v10->_originalFilename = (NSString *)v24;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.originalFilesize"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_originalFilesize = objc_msgSend(v26, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.originalWidth"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_originalWidth = objc_msgSend(v27, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.originalHeight"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_originalHeight = objc_msgSend(v28, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.exifTimestampString"));
    v29 = objc_claimAutoreleasedReturnValue();
    exifTimestampString = v10->_exifTimestampString;
    v10->_exifTimestampString = (NSString *)v29;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.ptpTrashedState"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_ptpTrashedState = objc_msgSend(v31, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.originatingAssetIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    originatingAssetIdentifier = v10->_originatingAssetIdentifier;
    v10->_originatingAssetIdentifier = (NSString *)v32;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.embeddedThumbnailOffset"));
    v34 = objc_claimAutoreleasedReturnValue();
    embeddedThumbnailOffset = v10->_embeddedThumbnailOffset;
    v10->_embeddedThumbnailOffset = (NSNumber *)v34;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.embeddedThumbnailLength"));
    v36 = objc_claimAutoreleasedReturnValue();
    embeddedThumbnailLength = v10->_embeddedThumbnailLength;
    v10->_embeddedThumbnailLength = (NSNumber *)v36;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.embeddedThumbnailWidth"));
    v38 = objc_claimAutoreleasedReturnValue();
    embeddedThumbnailWidth = v10->_embeddedThumbnailWidth;
    v10->_embeddedThumbnailWidth = (NSNumber *)v38;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.embeddedThumbnailHeight"));
    v40 = objc_claimAutoreleasedReturnValue();
    embeddedThumbnailHeight = v10->_embeddedThumbnailHeight;
    v10->_embeddedThumbnailHeight = (NSNumber *)v40;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.originalStableHash"));
    v42 = objc_claimAutoreleasedReturnValue();
    fingerprint = v10->_fingerprint;
    v10->_fingerprint = (NSString *)v42;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.timeZoneOffset"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_timeZoneOffset = (double)objc_msgSend(v44, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedAttributes.dateCreated"));
    v45 = objc_claimAutoreleasedReturnValue();
    dateCreated = v10->_dateCreated;
    v10->_dateCreated = (NSDate *)v45;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedAttributes.duration"));
    v47 = objc_claimAutoreleasedReturnValue();
    originalDuration = v10->_originalDuration;
    v10->_originalDuration = (NSNumber *)v47;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedAttributes.codec"));
    v49 = objc_claimAutoreleasedReturnValue();
    codec = v10->_codec;
    v10->_codec = (NSString *)v49;

  }
  return v10;
}

- (BOOL)isTimelapseVideo
{
  return self->_kindSubType == 102;
}

- (BOOL)isBurstPicked
{
  return self->_burstPickType == 4;
}

- (BOOL)isBurstFirstPicked
{
  return self->_burstPickType == 32;
}

- (BOOL)isBurstFavorite
{
  return self->_burstPickType == 8;
}

- (BOOL)isLivePhoto
{
  return !self->_kind && self->_kindSubType == 2;
}

- (BOOL)isHighFrameRateVideo
{
  return self->_kind == 1 && self->_kindSubType == 101;
}

- (CLLocation)location
{
  NSData *locationData;

  locationData = self->_locationData;
  if (locationData)
    return (CLLocation *)(id)objc_msgSend(MEMORY[0x1E0D71880], "newLocationFromLocationData:timestampIfMissing:", locationData, self->_dateCreated);
  else
    return (CLLocation *)0;
}

- (BOOL)isHDR
{
  return self->_hdrType != 0;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (NSString)livePhotoPairingIdentifier
{
  return self->_livePhotoPairingIdentifier;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (unint64_t)originalFilesize
{
  return self->_originalFilesize;
}

- (unint64_t)originalWidth
{
  return self->_originalWidth;
}

- (unint64_t)originalHeight
{
  return self->_originalHeight;
}

- (NSString)exifTimestampString
{
  return self->_exifTimestampString;
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (NSString)originatingAssetIdentifier
{
  return self->_originatingAssetIdentifier;
}

- (NSNumber)embeddedThumbnailOffset
{
  return self->_embeddedThumbnailOffset;
}

- (NSNumber)embeddedThumbnailLength
{
  return self->_embeddedThumbnailLength;
}

- (NSNumber)embeddedThumbnailWidth
{
  return self->_embeddedThumbnailWidth;
}

- (NSNumber)embeddedThumbnailHeight
{
  return self->_embeddedThumbnailHeight;
}

- (NSNumber)originalDuration
{
  return self->_originalDuration;
}

- (int64_t)ptpTrashedState
{
  return self->_ptpTrashedState;
}

- (double)timeZoneOffset
{
  return self->_timeZoneOffset;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSString)codec
{
  return self->_codec;
}

- (BOOL)deferredProcessingNeeded
{
  return self->_deferredProcessingNeeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_originalDuration, 0);
  objc_storeStrong((id *)&self->_embeddedThumbnailHeight, 0);
  objc_storeStrong((id *)&self->_embeddedThumbnailWidth, 0);
  objc_storeStrong((id *)&self->_embeddedThumbnailLength, 0);
  objc_storeStrong((id *)&self->_embeddedThumbnailOffset, 0);
  objc_storeStrong((id *)&self->_originatingAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_exifTimestampString, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_locationData, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetPTP");
}

+ (id)entityName
{
  return (id)objc_msgSend(MEMORY[0x1E0D71880], "entityName");
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_76;
}

void __41__PHAssetPTPProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[26];

  v3[25] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("filename");
  v3[1] = CFSTR("mediaGroupUUID");
  v3[2] = CFSTR("kind");
  v3[3] = CFSTR("kindSubtype");
  v3[4] = CFSTR("avalanchePickType");
  v3[5] = CFSTR("avalancheUUID");
  v3[6] = CFSTR("locationData");
  v3[7] = CFSTR("hdrType");
  v3[8] = CFSTR("deferredProcessingNeeded");
  v3[9] = CFSTR("additionalAttributes.originalFilename");
  v3[10] = CFSTR("additionalAttributes.originalFilesize");
  v3[11] = CFSTR("additionalAttributes.originalWidth");
  v3[12] = CFSTR("additionalAttributes.originalHeight");
  v3[13] = CFSTR("additionalAttributes.exifTimestampString");
  v3[14] = CFSTR("additionalAttributes.ptpTrashedState");
  v3[15] = CFSTR("additionalAttributes.originatingAssetIdentifier");
  v3[16] = CFSTR("additionalAttributes.embeddedThumbnailOffset");
  v3[17] = CFSTR("additionalAttributes.embeddedThumbnailLength");
  v3[18] = CFSTR("additionalAttributes.embeddedThumbnailWidth");
  v3[19] = CFSTR("additionalAttributes.embeddedThumbnailHeight");
  v3[20] = CFSTR("additionalAttributes.originalStableHash");
  v3[21] = CFSTR("additionalAttributes.timeZoneOffset");
  v3[22] = CFSTR("extendedAttributes.dateCreated");
  v3[23] = CFSTR("extendedAttributes.duration");
  v3[24] = CFSTR("extendedAttributes.codec");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 25);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_76;
  propertiesToFetch_pl_once_object_76 = v1;

}

@end

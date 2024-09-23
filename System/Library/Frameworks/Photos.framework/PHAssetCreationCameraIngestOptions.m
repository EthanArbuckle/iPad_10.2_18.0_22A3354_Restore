@implementation PHAssetCreationCameraIngestOptions

- (PHAssetCreationCameraIngestOptions)initWithCameraMetadataPath:(id)a3 isCameraRearFacing:(BOOL)a4 isExpectingPairedVideo:(BOOL)a5 finalAssetHeight:(double)a6 finalAssetWidth:(double)a7 dbgFilePath:(id)a8 previewImgSurfaceRef:(void *)a9 creationDate:(id)a10 jobType:(id)a11 placeholderHeight:(double)a12 placeholderWidth:(double)a13 previewImageData:(id)a14 deferredIdentifier:(id)a15 captureID:(id)a16
{
  id v25;
  PHAssetCreationCameraIngestOptions *v26;
  NSString *backupAdjustmentsFile;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  v35 = a8;
  v34 = a10;
  v33 = a11;
  v32 = a14;
  v31 = a15;
  v25 = a16;
  v37.receiver = self;
  v37.super_class = (Class)PHAssetCreationCameraIngestOptions;
  v26 = -[PHAssetCreationCameraIngestOptions init](&v37, sel_init);
  if (v26)
  {
    if (a9)
      v26->_previewImgSurfaceRef = (void *)CFRetain(a9);
    v26->_isRearFacingCamera = a4;
    objc_storeStrong((id *)&v26->_cameraMetadataPath, a3);
    v26->_finalAssetHeight = a6;
    v26->_finalAssetWidth = a7;
    objc_storeStrong((id *)&v26->_dbgFilePath, a8);
    objc_storeStrong((id *)&v26->_creationDate, a10);
    objc_storeStrong((id *)&v26->_jobType, a11);
    v26->_placeholderHeight = a12;
    v26->_placeholderWidth = a13;
    objc_storeStrong((id *)&v26->_previewImageData, a14);
    v26->_candidateOptions = 0;
    objc_storeStrong((id *)&v26->_deferredPhotoIdentifier, a15);
    objc_storeStrong((id *)&v26->_captureID, a16);
    v26->_isExpectingPairedVideo = a5;
    backupAdjustmentsFile = v26->_backupAdjustmentsFile;
    v26->_backupAdjustmentsFile = 0;

  }
  return v26;
}

- (id)initFromJobDictionary:(id)a3 withPreviewImgSurfaceRef:(__IOSurface *)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  PHAssetCreationCameraIngestOptions *v34;

  v4 = a3;
  v5 = *MEMORY[0x1E0D74D18];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D70]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v26 = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D20]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v6, "BOOLValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E98]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v31, "BOOLValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D88]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  v10 = v9;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D98]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  v12 = v11;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E78]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D40]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74ED8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74EE0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v21 = v20;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74EE8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D58]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("captureLogID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PHAssetCreationCameraIngestOptions initWithCameraMetadataPath:isCameraRearFacing:isExpectingPairedVideo:finalAssetHeight:finalAssetWidth:dbgFilePath:previewImgSurfaceRef:creationDate:jobType:placeholderHeight:placeholderWidth:previewImageData:deferredIdentifier:captureID:](self, "initWithCameraMetadataPath:isCameraRearFacing:isExpectingPairedVideo:finalAssetHeight:finalAssetWidth:dbgFilePath:previewImgSurfaceRef:creationDate:jobType:placeholderHeight:placeholderWidth:previewImageData:deferredIdentifier:captureID:", v8, v27, v28, v13, a4, v14, v10, v12, v18, v21, v15, v22, v23, v24);

  return v34;
}

- (BOOL)isEligibleForQuickFaceAnalysis
{
  return -[NSString isEqual:](self->_jobType, "isEqual:", *MEMORY[0x1E0D74E00]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PHAssetCreationCameraIngestOptions *v4;

  v4 = -[PHAssetCreationCameraIngestOptions initWithCameraMetadataPath:isCameraRearFacing:isExpectingPairedVideo:finalAssetHeight:finalAssetWidth:dbgFilePath:previewImgSurfaceRef:creationDate:jobType:placeholderHeight:placeholderWidth:previewImageData:deferredIdentifier:captureID:]([PHAssetCreationCameraIngestOptions alloc], "initWithCameraMetadataPath:isCameraRearFacing:isExpectingPairedVideo:finalAssetHeight:finalAssetWidth:dbgFilePath:previewImgSurfaceRef:creationDate:jobType:placeholderHeight:placeholderWidth:previewImageData:deferredIdentifier:captureID:", self->_cameraMetadataPath, self->_isRearFacingCamera, self->_isExpectingPairedVideo, self->_dbgFilePath, self->_previewImgSurfaceRef, self->_creationDate, self->_finalAssetHeight, self->_finalAssetWidth, self->_placeholderHeight, self->_placeholderWidth, self->_jobType, self->_previewImageData, self->_deferredPhotoIdentifier, self->_captureID);
  -[PHAssetCreationCameraIngestOptions setCandidateOptions:](v4, "setCandidateOptions:", self->_candidateOptions);
  -[PHAssetCreationCameraIngestOptions setBackupAdjustmentsFile:](v4, "setBackupAdjustmentsFile:", self->_backupAdjustmentsFile);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isRearFacingCamera;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 isExpectingPairedVideo;
  void *v9;
  NSString *jobType;
  void *v11;
  NSString *cameraMetadataPath;
  void *v13;
  uint64_t finalAssetHeight;
  void *v15;
  uint64_t finalAssetWidth;
  void *v17;
  uint64_t placeholderHeight;
  void *v19;
  uint64_t placeholderWidth;
  void *v21;
  NSString *dbgFilePath;
  void *v23;
  void *previewImgSurfaceRef;
  void *v25;
  NSDate *creationDate;
  void *v27;
  NSData *previewImageData;
  void *v29;
  uint64_t candidateOptions;
  void *v31;
  NSString *deferredPhotoIdentifier;
  void *v33;
  NSString *portraitEffectFilterName;
  void *v35;
  NSString *captureID;
  void *v37;
  NSString *backupAdjustmentsFile;
  id v39;

  isRearFacingCamera = self->_isRearFacingCamera;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithUTF8String:", "isRearFacingCamera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", isRearFacingCamera, v7);

  isExpectingPairedVideo = self->_isExpectingPairedVideo;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "isExpectingPairedVideo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", isExpectingPairedVideo, v9);

  jobType = self->_jobType;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "jobType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", jobType, v11);

  cameraMetadataPath = self->_cameraMetadataPath;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "cameraMetadataPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", cameraMetadataPath, v13);

  finalAssetHeight = (uint64_t)self->_finalAssetHeight;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetFinalHeight");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeInteger:forKey:", finalAssetHeight, v15);

  finalAssetWidth = (uint64_t)self->_finalAssetWidth;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetFinalWidth");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeInteger:forKey:", finalAssetWidth, v17);

  placeholderHeight = (uint64_t)self->_placeholderHeight;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "placeholderHeight");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeInteger:forKey:", placeholderHeight, v19);

  placeholderWidth = (uint64_t)self->_placeholderWidth;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "placeholderWidth");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeInteger:forKey:", placeholderWidth, v21);

  dbgFilePath = self->_dbgFilePath;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dbgPath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", dbgFilePath, v23);

  previewImgSurfaceRef = self->_previewImgSurfaceRef;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "previewImgSurfaceRef");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", previewImgSurfaceRef, v25);

  creationDate = self->_creationDate;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "creationDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", creationDate, v27);

  previewImageData = self->_previewImageData;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "previewImageData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", previewImageData, v29);

  candidateOptions = self->_candidateOptions;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "processingCandidateOption");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeInt:forKey:", candidateOptions, v31);

  deferredPhotoIdentifier = self->_deferredPhotoIdentifier;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "deferredPhotoIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", deferredPhotoIdentifier, v33);

  portraitEffectFilterName = self->_portraitEffectFilterName;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "portraitEffectFilterName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", portraitEffectFilterName, v35);

  captureID = self->_captureID;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "captureID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", captureID, v37);

  backupAdjustmentsFile = self->_backupAdjustmentsFile;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "backupAdjustmentsFile");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", backupAdjustmentsFile, v39);

}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  xpc_object_t xdict;

  v4 = a3;
  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v4, "cameraIngestOptions", xdict);

  xpc_dictionary_set_BOOL(xdict, "isRearFacingCamera", self->_isRearFacingCamera);
  xpc_dictionary_set_BOOL(xdict, "isExpectingPairedVideo", self->_isExpectingPairedVideo);
  PLXPCDictionarySetString();
  PLXPCDictionarySetString();
  xpc_dictionary_set_double(xdict, "assetFinalHeight", self->_finalAssetHeight);
  xpc_dictionary_set_double(xdict, "assetFinalWidth", self->_finalAssetWidth);
  xpc_dictionary_set_double(xdict, "placeholderHeight", self->_placeholderHeight);
  xpc_dictionary_set_double(xdict, "placeholderWidth", self->_placeholderWidth);
  PLXPCDictionarySetString();
  PLXPCDictionarySetIOSurface();
  PLXPCDictionarySetDate();
  PLXPCDictionarySetData();
  xpc_dictionary_set_int64(xdict, "processingCandidateOption", self->_candidateOptions);
  PLXPCDictionarySetString();
  PLXPCDictionarySetString();
  PLXPCDictionarySetString();
  PLXPCDictionarySetString();

}

- (PHAssetCreationCameraIngestOptions)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  PHAssetCreationCameraIngestOptions *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithUTF8String:", "cameraMetadataPath");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v44);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "isRearFacingCamera");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "decodeBoolForKey:", v43);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "isExpectingPairedVideo");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v4, "decodeBoolForKey:", v42);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetFinalHeight");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v41);
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetFinalWidth");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v40);
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dbgPath");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v38);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "previewImgSurfaceRef");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v4, "decodeObjectForKey:", v35);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "creationDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v34);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "jobType");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "placeholderHeight");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v29);
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "placeholderWidth");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v28);
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "previewImageData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "deferredPhotoIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "captureID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[PHAssetCreationCameraIngestOptions initWithCameraMetadataPath:isCameraRearFacing:isExpectingPairedVideo:finalAssetHeight:finalAssetWidth:dbgFilePath:previewImgSurfaceRef:creationDate:jobType:placeholderHeight:placeholderWidth:previewImageData:deferredIdentifier:captureID:](self, "initWithCameraMetadataPath:isCameraRearFacing:isExpectingPairedVideo:finalAssetHeight:finalAssetWidth:dbgFilePath:previewImgSurfaceRef:creationDate:jobType:placeholderHeight:placeholderWidth:previewImageData:deferredIdentifier:captureID:", v39, v5, v36, v32, v30, v10, v7, v9, v12, v14, v27, v16, v18, v20);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "processingCandidateOption");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationCameraIngestOptions setCandidateOptions:](v37, "setCandidateOptions:", (unsigned __int16)objc_msgSend(v4, "decodeIntForKey:", v21));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "portraitEffectFilterName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationCameraIngestOptions setPortraitEffectFilterName:](v37, "setPortraitEffectFilterName:", v23);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "backupAdjustmentsFile");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAssetCreationCameraIngestOptions setBackupAdjustmentsFile:](v37, "setBackupAdjustmentsFile:", v25);
  return v37;
}

- (PHAssetCreationCameraIngestOptions)initWithXPCDict:(id)a3
{
  void *v4;
  void *v5;
  const void *data;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v22;
  _BOOL4 v23;
  size_t length;

  xpc_dictionary_get_value(a3, "cameraIngestOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    length = 0;
    data = xpc_dictionary_get_data(v4, "previewImageData", &length);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLStringFromXPCDictionary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = xpc_dictionary_get_BOOL(v5, "isRearFacingCamera");
    v22 = xpc_dictionary_get_BOOL(v5, "isExpectingPairedVideo");
    v9 = xpc_dictionary_get_double(v5, "assetFinalHeight");
    v10 = xpc_dictionary_get_double(v5, "assetFinalWidth");
    PLStringFromXPCDictionary();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = PLCreateIOSurfaceFromXPCDictionary();
    PLDateFromXPCDictionary();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PLStringFromXPCDictionary();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = xpc_dictionary_get_double(v5, "placeholderHeight");
    v16 = xpc_dictionary_get_double(v5, "placeholderWidth");
    PLStringFromXPCDictionary();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PLStringFromXPCDictionary();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PHAssetCreationCameraIngestOptions initWithCameraMetadataPath:isCameraRearFacing:isExpectingPairedVideo:finalAssetHeight:finalAssetWidth:dbgFilePath:previewImgSurfaceRef:creationDate:jobType:placeholderHeight:placeholderWidth:previewImageData:deferredIdentifier:captureID:](self, "initWithCameraMetadataPath:isCameraRearFacing:isExpectingPairedVideo:finalAssetHeight:finalAssetWidth:dbgFilePath:previewImgSurfaceRef:creationDate:jobType:placeholderHeight:placeholderWidth:previewImageData:deferredIdentifier:captureID:", v8, v23, v22, v11, v12, v13, v9, v10, v15, v16, v14, v7, v17, v18);

    -[PHAssetCreationCameraIngestOptions setCandidateOptions:](self, "setCandidateOptions:", (unsigned __int16)xpc_dictionary_get_int64(v5, "processingCandidateOption"));
    PLStringFromXPCDictionary();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationCameraIngestOptions setPortraitEffectFilterName:](self, "setPortraitEffectFilterName:", v19);

    PLStringFromXPCDictionary();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationCameraIngestOptions setBackupAdjustmentsFile:](self, "setBackupAdjustmentsFile:", v20);

  }
  return self;
}

- (void)dealloc
{
  void *previewImgSurfaceRef;
  objc_super v4;

  previewImgSurfaceRef = self->_previewImgSurfaceRef;
  if (previewImgSurfaceRef)
  {
    CFRelease(previewImgSurfaceRef);
    self->_previewImgSurfaceRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PHAssetCreationCameraIngestOptions;
  -[PHAssetCreationCameraIngestOptions dealloc](&v4, sel_dealloc);
}

- (NSString)cameraMetadataPath
{
  return self->_cameraMetadataPath;
}

- (void)setCameraMetadataPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)dbgFilePath
{
  return self->_dbgFilePath;
}

- (void)setDbgFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)jobType
{
  return self->_jobType;
}

- (void)setJobType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)portraitEffectFilterName
{
  return self->_portraitEffectFilterName;
}

- (void)setPortraitEffectFilterName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)captureID
{
  return self->_captureID;
}

- (void)setCaptureID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)backupAdjustmentsFile
{
  return self->_backupAdjustmentsFile;
}

- (void)setBackupAdjustmentsFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)deferredPhotoIdentifier
{
  return self->_deferredPhotoIdentifier;
}

- (void)setDeferredPhotoIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (void)setPreviewImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)previewImgSurfaceRef
{
  return self->_previewImgSurfaceRef;
}

- (void)setPreviewImgSurfaceRef:(void *)a3
{
  self->_previewImgSurfaceRef = a3;
}

- (BOOL)isRearFacingCamera
{
  return self->_isRearFacingCamera;
}

- (void)setIsRearFacingCamera:(BOOL)a3
{
  self->_isRearFacingCamera = a3;
}

- (BOOL)isExpectingPairedVideo
{
  return self->_isExpectingPairedVideo;
}

- (void)setIsExpectingPairedVideo:(BOOL)a3
{
  self->_isExpectingPairedVideo = a3;
}

- (double)finalAssetHeight
{
  return self->_finalAssetHeight;
}

- (void)setFinalAssetHeight:(double)a3
{
  self->_finalAssetHeight = a3;
}

- (double)finalAssetWidth
{
  return self->_finalAssetWidth;
}

- (void)setFinalAssetWidth:(double)a3
{
  self->_finalAssetWidth = a3;
}

- (double)placeholderHeight
{
  return self->_placeholderHeight;
}

- (void)setPlaceholderHeight:(double)a3
{
  self->_placeholderHeight = a3;
}

- (double)placeholderWidth
{
  return self->_placeholderWidth;
}

- (void)setPlaceholderWidth:(double)a3
{
  self->_placeholderWidth = a3;
}

- (unsigned)candidateOptions
{
  return self->_candidateOptions;
}

- (void)setCandidateOptions:(unsigned __int16)a3
{
  self->_candidateOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_deferredPhotoIdentifier, 0);
  objc_storeStrong((id *)&self->_backupAdjustmentsFile, 0);
  objc_storeStrong((id *)&self->_captureID, 0);
  objc_storeStrong((id *)&self->_portraitEffectFilterName, 0);
  objc_storeStrong((id *)&self->_jobType, 0);
  objc_storeStrong((id *)&self->_dbgFilePath, 0);
  objc_storeStrong((id *)&self->_cameraMetadataPath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

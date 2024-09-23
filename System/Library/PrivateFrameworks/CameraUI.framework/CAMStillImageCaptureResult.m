@implementation CAMStillImageCaptureResult

- (id)_captureDateFromMetadata:(id)a3
{
  void *v3;

  +[CAMCaptureMetadataUtilities preciseCaptureDateFromStillImageMetadata:](CAMCaptureMetadataUtilities, "preciseCaptureDateFromStillImageMetadata:", self->_metadata);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSError)error
{
  return self->_error;
}

- (CAMCaptureCoordinationInfo)coordinationInfo
{
  return self->_coordinationInfo;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (__IOSurface)stillImageFilteredPreviewSurface
{
  return self->_stillImageFilteredPreviewSurface;
}

- (__IOSurface)stillImageUnfilteredPreviewSurface
{
  return self->_stillImageUnfilteredPreviewSurface;
}

- (NSString)persistenceUUID
{
  return self->_persistenceUUID;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- (AVCapturePhoto)capturePhoto
{
  return self->_capturePhoto;
}

- (BOOL)isExpectingPairedVideo
{
  return self->_expectingPairedVideo;
}

- (NSArray)adjustmentFilters
{
  return self->_adjustmentFilters;
}

- (NSDictionary)compactMetadata
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[10];

  v25[8] = *MEMORY[0x1E0C80C00];
  -[CAMStillImageCaptureResult metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = *MEMORY[0x1E0CBCF70];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("{Diagnostic}"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("AddDebugInfoToUserComments"));
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = *MEMORY[0x1E0D03CE8];
    v25[0] = *MEMORY[0x1E0D03CD8];
    v25[1] = v7;
    v8 = *MEMORY[0x1E0D03D20];
    v25[2] = *MEMORY[0x1E0D03D90];
    v25[3] = v8;
    v9 = *MEMORY[0x1E0C89D50];
    v25[4] = *MEMORY[0x1E0C89CE0];
    v25[5] = v9;
    v10 = *MEMORY[0x1E0D03DE8];
    v25[6] = *MEMORY[0x1E0C89D48];
    v25[7] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 8);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v16, (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v4);
  }
  v18 = (void *)objc_msgSend(v3, "copy", (_QWORD)v20);

  return (NSDictionary *)v18;
}

- (void)dealloc
{
  __IOSurface *stillImageFullsizeSurface;
  __IOSurface *stillImageUnfilteredPreviewSurface;
  __IOSurface *stillImageFilteredPreviewSurface;
  objc_super v6;

  stillImageFullsizeSurface = self->_stillImageFullsizeSurface;
  if (stillImageFullsizeSurface)
  {
    CFRelease(stillImageFullsizeSurface);
    self->_stillImageFullsizeSurface = 0;
  }
  stillImageUnfilteredPreviewSurface = self->_stillImageUnfilteredPreviewSurface;
  if (stillImageUnfilteredPreviewSurface)
  {
    CFRelease(stillImageUnfilteredPreviewSurface);
    self->_stillImageUnfilteredPreviewSurface = 0;
  }
  stillImageFilteredPreviewSurface = self->_stillImageFilteredPreviewSurface;
  if (stillImageFilteredPreviewSurface)
  {
    CFRelease(stillImageFilteredPreviewSurface);
    self->_stillImageFilteredPreviewSurface = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAMStillImageCaptureResult;
  -[CAMStillImageCaptureResult dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinationInfo, 0);
  objc_storeStrong((id *)&self->_persistenceUUID, 0);
  objc_storeStrong((id *)&self->_adjustmentFilters, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_deferredPhotoIdentifier, 0);
  objc_storeStrong((id *)&self->_capturePhoto, 0);
}

- (CAMStillImageCaptureResult)initWithFullsizeSurface:(__IOSurface *)a3 size:(unint64_t)a4 unfilteredPreviewSurface:(__IOSurface *)a5 filteredPreviewSurface:(__IOSurface *)a6 metadata:(id)a7 expectingPairedVideo:(BOOL)a8 shouldPersistAdjustmentSidecar:(BOOL)a9 adjustmentFilters:(id)a10 persistenceUUID:(id)a11 coordinationInfo:(id)a12 error:(id)a13
{
  id v18;
  id v19;
  id v20;
  CAMStillImageCaptureResult *v21;
  CAMStillImageCaptureResult *v22;
  uint64_t v23;
  NSDictionary *metadata;
  uint64_t v25;
  NSArray *adjustmentFilters;
  uint64_t v27;
  NSString *persistenceUUID;
  uint64_t v29;
  NSDate *captureDate;
  CAMStillImageCaptureResult *v31;
  id v34;
  id v35;
  objc_super v36;

  v18 = a7;
  v19 = a10;
  v20 = a11;
  v35 = a12;
  v34 = a13;
  v36.receiver = self;
  v36.super_class = (Class)CAMStillImageCaptureResult;
  v21 = -[CAMStillImageCaptureResult init](&v36, sel_init);
  v22 = v21;
  if (v21)
  {
    if (a3)
    {
      v21->_stillImageFullsizeSurface = a3;
      v21->_stillImageFullsizeSurfaceSize = a4;
      CFRetain(a3);
    }
    if (a5)
    {
      v22->_stillImageUnfilteredPreviewSurface = a5;
      CFRetain(a5);
    }
    if (a6)
    {
      v22->_stillImageFilteredPreviewSurface = a6;
      CFRetain(a6);
    }
    v23 = objc_msgSend(v18, "copy");
    metadata = v22->_metadata;
    v22->_metadata = (NSDictionary *)v23;

    objc_storeStrong((id *)&v22->_error, a13);
    v22->_shouldPersistAdjustmentSidecar = a9;
    v25 = objc_msgSend(v19, "copy");
    adjustmentFilters = v22->_adjustmentFilters;
    v22->_adjustmentFilters = (NSArray *)v25;

    v27 = objc_msgSend(v20, "copy");
    persistenceUUID = v22->_persistenceUUID;
    v22->_persistenceUUID = (NSString *)v27;

    objc_storeStrong((id *)&v22->_coordinationInfo, a12);
    v22->_semanticEnhancement = 0;
    v22->_expectingPairedVideo = a8;
    -[CAMStillImageCaptureResult _captureDateFromMetadata:](v22, "_captureDateFromMetadata:", v22->_metadata);
    v29 = objc_claimAutoreleasedReturnValue();
    captureDate = v22->_captureDate;
    v22->_captureDate = (NSDate *)v29;

    v31 = v22;
  }

  return v22;
}

- (CAMStillImageCaptureResult)initWithCapturePhoto:(id)a3 expectingPairedVideo:(BOOL)a4 adjustmentFilters:(id)a5 filteredPreviewSurface:(__IOSurface *)a6 shouldPersistAdjustmentSidecar:(BOOL)a7 persistenceUUID:(id)a8 coordinationInfo:(id)a9 semanticEnhancement:(int64_t)a10 error:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  CAMStillImageCaptureResult *v21;
  CAMStillImageCaptureResult *v22;
  void *v23;
  uint64_t v24;
  NSDictionary *metadata;
  uint64_t v26;
  NSArray *adjustmentFilters;
  uint64_t v28;
  NSString *persistenceUUID;
  uint64_t v30;
  NSDate *captureDate;
  void *v32;
  void *v33;
  IOSurfaceRef IOSurface;
  CAMStillImageCaptureResult *v35;
  id v38;
  objc_super v39;

  v17 = a3;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v38 = a11;
  v39.receiver = self;
  v39.super_class = (Class)CAMStillImageCaptureResult;
  v21 = -[CAMStillImageCaptureResult init](&v39, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_capturePhoto, a3);
    objc_msgSend(v17, "metadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    metadata = v22->_metadata;
    v22->_metadata = (NSDictionary *)v24;

    objc_storeStrong((id *)&v22->_error, a11);
    v26 = objc_msgSend(v18, "copy");
    adjustmentFilters = v22->_adjustmentFilters;
    v22->_adjustmentFilters = (NSArray *)v26;

    v28 = objc_msgSend(v19, "copy");
    persistenceUUID = v22->_persistenceUUID;
    v22->_persistenceUUID = (NSString *)v28;

    objc_storeStrong((id *)&v22->_coordinationInfo, a9);
    v22->_shouldPersistAdjustmentSidecar = a7;
    v22->_expectingPairedVideo = a4;
    v22->_semanticEnhancement = a10;
    -[CAMStillImageCaptureResult _captureDateFromMetadata:](v22, "_captureDateFromMetadata:", v22->_metadata);
    v30 = objc_claimAutoreleasedReturnValue();
    captureDate = v22->_captureDate;
    v22->_captureDate = (NSDate *)v30;

    -[AVCapturePhoto portraitMetadata](v22->_capturePhoto, "portraitMetadata");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v22->_representsDeferredFilteredProxy = objc_msgSend(v33, "isDeferredPortraitRenderingSupported");

    }
    else
    {
      v22->_representsDeferredFilteredProxy = 0;
    }

    if (a6)
    {
      v22->_stillImageFilteredPreviewSurface = a6;
      CFRetain(a6);
    }
    IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(objc_retainAutorelease(v17), "previewPixelBuffer"));
    if (IOSurface)
    {
      v22->_stillImageUnfilteredPreviewSurface = IOSurface;
      CFRetain(IOSurface);
    }
    v35 = v22;
  }

  return v22;
}

- (CAMStillImageCaptureResult)initWithCaptureDeferredPhotoProxy:(id)a3 expectingPairedVideo:(BOOL)a4 adjustmentFilters:(id)a5 filteredPreviewSurface:(__IOSurface *)a6 shouldPersistAdjustmentSidecar:(BOOL)a7 persistenceUUID:(id)a8 coordinationInfo:(id)a9 semanticEnhancement:(int64_t)a10 error:(id)a11
{
  _BOOL8 v12;
  _BOOL8 v15;
  id v17;
  CAMStillImageCaptureResult *v18;
  uint64_t v19;
  NSString *deferredPhotoIdentifier;

  v12 = a7;
  v15 = a4;
  v17 = a3;
  v18 = -[CAMStillImageCaptureResult initWithCapturePhoto:expectingPairedVideo:adjustmentFilters:filteredPreviewSurface:shouldPersistAdjustmentSidecar:persistenceUUID:coordinationInfo:semanticEnhancement:error:](self, "initWithCapturePhoto:expectingPairedVideo:adjustmentFilters:filteredPreviewSurface:shouldPersistAdjustmentSidecar:persistenceUUID:coordinationInfo:semanticEnhancement:error:", v17, v15, a5, a6, v12, a8, a9, a10, a11);
  objc_msgSend(v17, "deferredPhotoIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();

  deferredPhotoIdentifier = v18->_deferredPhotoIdentifier;
  v18->_deferredPhotoIdentifier = (NSString *)v19;

  return v18;
}

- (NSString)imageGroupIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[CAMStillImageCaptureResult metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03D20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- ($2825F4736939C4A6D3AD43837233062D)predictedFinalAssetPhotoDimensions
{
  void *v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (self->_deferredPhotoIdentifier)
  {
    -[AVCapturePhoto resolvedSettings](self->_capturePhoto, "resolvedSettings");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "photoDimensions");
    v4 = v3;
    v5 = HIDWORD(v3);
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB50]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCC28]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCC30]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "intValue");
    v5 = objc_msgSend(v7, "intValue");

  }
  return ($2825F4736939C4A6D3AD43837233062D)(v4 | (unint64_t)(v5 << 32));
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CAMStillImageCaptureResult error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStillImageCaptureResult captureDate](self, "captureDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStillImageCaptureResult captureDate](self, "captureDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ error:%@, captureDate:%@ (%.3f)>"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (__IOSurface)stillImageFullsizeSurface
{
  return self->_stillImageFullsizeSurface;
}

- (unint64_t)stillImageFullsizeSurfaceSize
{
  return self->_stillImageFullsizeSurfaceSize;
}

- (NSString)deferredPhotoIdentifier
{
  return self->_deferredPhotoIdentifier;
}

- (BOOL)shouldPersistAdjustmentSidecar
{
  return self->_shouldPersistAdjustmentSidecar;
}

- (BOOL)representsDeferredFilteredProxy
{
  return self->_representsDeferredFilteredProxy;
}

- (int64_t)semanticEnhancement
{
  return self->_semanticEnhancement;
}

@end

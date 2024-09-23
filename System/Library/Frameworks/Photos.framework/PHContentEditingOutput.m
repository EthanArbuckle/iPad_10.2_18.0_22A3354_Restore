@implementation PHContentEditingOutput

- (PHContentEditingOutput)initWithContentEditingInput:(PHContentEditingInput *)contentEditingInput
{
  return -[PHContentEditingOutput initWithContentEditingInput:withOptions:](self, "initWithContentEditingInput:withOptions:", contentEditingInput, 0);
}

- (PHContentEditingOutput)initWithContentEditingInput:(id)a3 withOptions:(id)a4
{
  id v7;
  id v8;
  PHContentEditingOutput *v9;
  PHContentEditingOutput *v10;
  uint64_t v11;
  NSURL *appropriateURLForDerivingRenderedContentURLs;
  void *v13;
  NSObject *p_super;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHContentEditingOutput.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentEditingInput != nil"));

  }
  v20.receiver = self;
  v20.super_class = (Class)PHContentEditingOutput;
  v9 = -[PHContentEditingOutput init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestOptions, a4);
    v10->_baseVersion = objc_msgSend(v7, "baseVersion");
    v10->_mediaType = objc_msgSend(v7, "mediaType");
    objc_msgSend(v7, "appropriateURLForDerivingRenderedContentURLs");
    v11 = objc_claimAutoreleasedReturnValue();
    appropriateURLForDerivingRenderedContentURLs = v10->_appropriateURLForDerivingRenderedContentURLs;
    v10->_appropriateURLForDerivingRenderedContentURLs = (NSURL *)v11;

    if ((objc_msgSend(v8, "isAsyncAdjustment") & 1) != 0
      || objc_msgSend(v8, "isOnlyChangingOriginalChoice"))
    {
      v10->_isAsyncAdjustment = 1;
    }
    -[PHContentEditingOutput _setupRequiredRenderedContentURLsWithEditingInput:options:](v10, "_setupRequiredRenderedContentURLsWithEditingInput:options:", v7, v8);
    objc_msgSend(v7, "originalResourceChoice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (v10->_baseVersion)
      {
        PLPhotoKitGetLog();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_ERROR, "Original resource choice is only valid for an unadjusted base version", buf, 2u);
        }
      }
      else
      {
        objc_msgSend(v7, "originalResourceChoice");
        v15 = objc_claimAutoreleasedReturnValue();
        p_super = &v10->_originalResourceChoice->super.super;
        v10->_originalResourceChoice = (NSNumber *)v15;
      }

    }
    PLPhotoEditGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[PHContentEditingOutput debugDescription](v10, "debugDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "Initialized content editing output:\n%@", buf, 0xCu);

    }
  }

  return v10;
}

- (PHContentEditingOutput)initWithPlaceholderForCreatedAsset:(PHObjectPlaceholder *)placeholderForCreatedAsset
{
  PHObjectPlaceholder *v5;
  PHContentEditingOutput *v6;
  PHContentEditingOutput *v7;
  uint64_t v8;
  uint64_t v9;
  NSURL *renderedContentURL;
  void *v12;
  objc_super v13;

  v5 = placeholderForCreatedAsset;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHContentEditingOutput.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placeholderForCreatedAsset != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PHContentEditingOutput;
  v6 = -[PHContentEditingOutput init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_baseVersion = 0;
    v8 = -[PHObjectPlaceholder assetMediaType](v5, "assetMediaType");
    v7->_mediaType = v8;
    -[PHContentEditingOutput renderURLWithExtensionForMediaType:](v7, "renderURLWithExtensionForMediaType:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    renderedContentURL = v7->_renderedContentURL;
    v7->_renderedContentURL = (NSURL *)v9;

  }
  return v7;
}

- (PHContentEditingOutput)initWithAdjustmentBaseVersion:(int64_t)a3 mediaType:(int64_t)a4 appropriateForURL:(id)a5
{
  id v9;
  PHContentEditingOutput *v10;
  PHContentEditingOutput *v11;
  uint64_t v12;
  NSURL *renderedContentURL;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHContentEditingOutput;
  v10 = -[PHContentEditingOutput init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_baseVersion = a3;
    v10->_mediaType = a4;
    -[PHContentEditingOutput renderURLWithExtensionForMediaType:](v10, "renderURLWithExtensionForMediaType:", a4);
    v12 = objc_claimAutoreleasedReturnValue();
    renderedContentURL = v11->_renderedContentURL;
    v11->_renderedContentURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_appropriateURLForDerivingRenderedContentURLs, a5);
  }

  return v11;
}

- (NSArray)supportedRenderedContentTypes
{
  int64_t mediaType;
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  mediaType = self->_mediaType;
  if (mediaType == 2)
  {
    v8 = *MEMORY[0x1E0CEC5B0];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v8;
LABEL_8:
    v6 = 1;
    goto LABEL_9;
  }
  if (mediaType != 1)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  if (!objc_msgSend((id)objc_opt_class(), "_currentDeviceSupportsHEICEncoding"))
  {
    v9 = *MEMORY[0x1E0CEC530];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v9;
    goto LABEL_8;
  }
  v3 = *MEMORY[0x1E0CEC508];
  v10[0] = *MEMORY[0x1E0CEC530];
  v10[1] = v3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = v10;
  v6 = 2;
LABEL_9:
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (UTType)defaultRenderedContentType
{
  int64_t mediaType;
  id *v3;

  mediaType = self->_mediaType;
  if (mediaType == 1)
  {
    v3 = (id *)MEMORY[0x1E0CEC530];
    return (UTType *)*v3;
  }
  if (mediaType == 2)
  {
    v3 = (id *)MEMORY[0x1E0CEC5B0];
    return (UTType *)*v3;
  }
  return (UTType *)0;
}

- (NSURL)renderedContentURLForType:(UTType *)type error:(NSError *)error
{
  UTType *v6;
  NSMutableSet *v7;
  NSMutableSet *deliveredRenderedContentURLs;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = type;
  if (!self->_deliveredRenderedContentURLs)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deliveredRenderedContentURLs = self->_deliveredRenderedContentURLs;
    self->_deliveredRenderedContentURLs = v7;

  }
  -[PHContentEditingOutput supportedRenderedContentTypes](self, "supportedRenderedContentTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if (!v10)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2938];
    v22 = *MEMORY[0x1E0CB2938];
    v23[0] = CFSTR("Unsupported UTType");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSMutableSet count](self->_deliveredRenderedContentURLs, "count") != 1)
    {
LABEL_8:

      v18 = 0;
      goto LABEL_9;
    }
LABEL_7:
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v20 = v12;
    v21 = CFSTR("Cannot request another rendered content URL for UTType");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v17;
    goto LABEL_8;
  }
  if (-[NSMutableSet count](self->_deliveredRenderedContentURLs, "count") == 1)
  {
    v11 = 0;
    v12 = *MEMORY[0x1E0CB2938];
    goto LABEL_7;
  }
  objc_msgSend((id)objc_opt_class(), "_renderURLWithExtensionForUniformTypeIdentifierType:appropriateForURL:", v6, self->_appropriateURLForDerivingRenderedContentURLs);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](self->_deliveredRenderedContentURLs, "addObject:", v18);
  objc_storeStrong((id *)&self->_renderedContentURL, v18);
  if (error)
    *error = 0;
LABEL_9:

  return (NSURL *)v18;
}

- (id)renderURLWithExtensionForMediaType:(int64_t)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "_renderURLWithExtensionForMediaType:useHEICImage:appropriateForURL:", a3, -[PHContentEditingOutput shouldPreferHEICForRenderedImages](self, "shouldPreferHEICForRenderedImages"), self->_appropriateURLForDerivingRenderedContentURLs);
}

- (void)clearRenderedContentURL
{
  NSURL *renderedContentURL;

  renderedContentURL = self->_renderedContentURL;
  self->_renderedContentURL = 0;

}

- (PHAdjustmentData)adjustmentData
{
  PHContentEditingOutput *v2;
  PHAdjustmentData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_adjustmentData;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAdjustmentData:(PHAdjustmentData *)adjustmentData
{
  PHAdjustmentData *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  PHAdjustmentData *v10;
  id v11;
  PHContentEditingOutput *obj;

  v4 = adjustmentData;
  -[PHAdjustmentData setBaseVersion:](v4, "setBaseVersion:", self->_baseVersion);
  -[PHAdjustmentData formatIdentifier](v4, "formatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PHAdjustmentData setFormatIdentifier:](v4, "setFormatIdentifier:", &stru_1E35DFFF8);
  -[PHAdjustmentData formatVersion](v4, "formatVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[PHAdjustmentData setFormatVersion:](v4, "setFormatVersion:", &stru_1E35DFFF8);
  -[PHAdjustmentData data](v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v9 = +[PHContentEditingOutput maximumAdjustmentDataLength](PHContentEditingOutput, "maximumAdjustmentDataLength");

  if (v8 > v9 && (PLIsAssetsd() & 1) == 0 && (PLIsProcessWithAppleBundleIdentifier() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Adjustment data is too large"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  obj = self;
  objc_sync_enter(obj);
  v10 = obj->_adjustmentData;
  obj->_adjustmentData = v4;

  objc_sync_exit(obj);
}

- (int64_t)baseVersion
{
  PHContentEditingOutput *v2;
  int64_t baseVersion;

  v2 = self;
  objc_sync_enter(v2);
  baseVersion = v2->_baseVersion;
  objc_sync_exit(v2);

  return baseVersion;
}

- (void)setBaseVersion:(int64_t)a3
{
  PHContentEditingOutput *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_baseVersion = a3;
  -[PHAdjustmentData setBaseVersion:](obj->_adjustmentData, "setBaseVersion:", a3);
  objc_sync_exit(obj);

}

- (void)setRenderedJPEGData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHContentEditingOutput renderedContentURL](self, "renderedContentURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeToURL:options:error:", v5, 1073741825, 0);

}

- (id)assetAdjustmentsWithEditorBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  -[PHContentEditingOutput adjustmentData](self, "adjustmentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHContentEditingOutput adjustmentData](self, "adjustmentData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formatVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHContentEditingOutput adjustmentData](self, "adjustmentData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "baseVersion");

  -[PHContentEditingOutput adjustmentData](self, "adjustmentData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHContentEditingOutput adjustmentData](self, "adjustmentData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "adjustmentRenderTypes");

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750B0]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v6, v8, v12, v10, v4, v14);
  return v15;
}

- (BOOL)isOnlyChangingOriginalChoice
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PHContentEditingOutput adjustmentData](self, "adjustmentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[PHContentEditingOutput originalResourceChoice](self, "originalResourceChoice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)_setupRequiredRenderedContentURLsWithEditingInput:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  BOOL v14;
  _BOOL4 v15;
  NSObject *v16;
  const __CFString *v17;
  NSURL *v18;
  NSURL *renderedContentURL;
  NSURL *v20;
  __CFString *v21;
  NSURL *v22;
  NSURL *renderedPreviewContentURL;
  NSURL *renderedVideoPosterURL;
  NSObject *v25;
  void *v26;
  const __CFString *v27;
  NSURL *v28;
  NSURL *v29;
  void *v30;
  NSURL *v31;
  int v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isAsyncAdjustment"))
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(v6, "mediaType");
      if ((unint64_t)(v9 - 1) > 2)
        v10 = CFSTR("unknown");
      else
        v10 = off_1E35DA708[v9 - 1];
      v21 = v10;
      v32 = 138543362;
      v33 = v21;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "Preparing async content editing output URLs for %{public}@", (uint8_t *)&v32, 0xCu);

    }
    -[PHContentEditingOutput renderURLWithExtensionForMediaType:](self, "renderURLWithExtensionForMediaType:", 1);
    v22 = (NSURL *)objc_claimAutoreleasedReturnValue();
    renderedPreviewContentURL = self->_renderedPreviewContentURL;
    self->_renderedPreviewContentURL = v22;

    if (objc_msgSend(v6, "mediaType") == 2)
    {
      -[PHContentEditingOutput renderURLWithExtensionForMediaType:](self, "renderURLWithExtensionForMediaType:", 1);
      v20 = (NSURL *)objc_claimAutoreleasedReturnValue();
LABEL_25:
      renderedVideoPosterURL = self->_renderedVideoPosterURL;
      self->_renderedVideoPosterURL = v20;
LABEL_26:

    }
  }
  else
  {
    if (objc_msgSend(v7, "playbackStyle"))
      v11 = v7;
    else
      v11 = v6;
    v12 = objc_msgSend(v11, "playbackStyle");
    v13 = -[PHContentEditingOutput shouldPreferHEICForRenderedImages](self, "shouldPreferHEICForRenderedImages");
    v14 = objc_msgSend(v6, "mediaType") == 1 && v12 == 5;
    v15 = v14;
    if (v14 || objc_msgSend(v6, "mediaType") == 2)
    {
      PLPhotoEditGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = CFSTR("normal video");
        if (v15)
          v17 = CFSTR("looping live photo");
        v32 = 138543362;
        v33 = v17;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "Preparing video-based content editing output URLs for %{public}@", (uint8_t *)&v32, 0xCu);
      }

      self->_loopingLivePhoto = v15;
      -[PHContentEditingOutput renderURLWithExtensionForMediaType:](self, "renderURLWithExtensionForMediaType:", 2);
      v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
      renderedContentURL = self->_renderedContentURL;
      self->_renderedContentURL = v18;

      objc_msgSend((id)objc_opt_class(), "imageRenderURLUsingHEICFormat:appropriateForURL:", v13, self->_appropriateURLForDerivingRenderedContentURLs);
      v20 = (NSURL *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    PLPhotoEditGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "livePhoto");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("live photo");
      if (!v26)
        v27 = CFSTR("still photo");
      v32 = 138543362;
      v33 = v27;
      _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEBUG, "Preparing photo-based content editing output URLs for %{public}@", (uint8_t *)&v32, 0xCu);

    }
    objc_msgSend((id)objc_opt_class(), "_renderURLWithExtensionForMediaType:useHEICImage:appropriateForURL:", self->_mediaType, v13, self->_appropriateURLForDerivingRenderedContentURLs);
    v28 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v29 = self->_renderedContentURL;
    self->_renderedContentURL = v28;

    objc_msgSend(v6, "livePhoto");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[PHContentEditingOutput renderURLWithExtensionForMediaType:](self, "renderURLWithExtensionForMediaType:", 2);
      v31 = (NSURL *)objc_claimAutoreleasedReturnValue();
      renderedVideoPosterURL = self->_renderedVideoComplementContentURL;
      self->_renderedVideoComplementContentURL = v31;
      goto LABEL_26;
    }
  }

}

- (BOOL)shouldPreferHEICForRenderedImages
{
  PHContentEditingOutputRequestOptions *requestOptions;

  requestOptions = self->_requestOptions;
  if (requestOptions
    && -[PHContentEditingOutputRequestOptions preferHEICForRenderedImages](requestOptions, "preferHEICForRenderedImages"))
  {
    return objc_msgSend((id)objc_opt_class(), "_currentDeviceSupportsHEICEncoding");
  }
  else
  {
    return 0;
  }
}

- (PHContentEditingOutput)initWithCoder:(id)a3
{
  id v4;
  PHContentEditingOutput *v5;
  uint64_t v6;
  PHAdjustmentData *adjustmentData;
  uint64_t v8;
  uint64_t v9;
  NSURL *renderedContentURL;
  uint64_t v11;
  NSURL *renderedVideoComplementContentURL;
  uint64_t v13;
  NSURL *renderedPreviewContentURL;
  uint64_t v15;
  NSURL *adjustmentSecondaryDataURL;
  uint64_t v17;
  NSData *penultimateRenderedJPEGData;
  uint64_t v19;
  NSURL *penultimateRenderedVideoContentURL;
  uint64_t v21;
  NSURL *penultimateRenderedVideoComplementContentURL;
  double v23;
  uint64_t v24;
  NSURL *editorBundleURL;
  uint64_t v26;
  NSNumber *originalResourceChoice;
  uint64_t v28;
  NSURL *renderedVideoPosterURL;
  uint64_t v30;
  NSNumber *playbackVariation;
  uint64_t v32;
  NSNumber *videoDuration;
  uint64_t v34;
  NSString *accessibilityDescription;
  uint64_t v36;
  PHContentEditingOutputRequestOptions *requestOptions;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PHContentEditingOutput;
  v5 = -[PHContentEditingOutput init](&v39, sel_init);
  if (v5)
  {
    v5->_mediaType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mediaType"));
    v5->_loopingLivePhoto = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("loopingLivePhoto"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adjustmentData"));
    v6 = objc_claimAutoreleasedReturnValue();
    adjustmentData = v5->_adjustmentData;
    v5->_adjustmentData = (PHAdjustmentData *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("renderedContentURL"));
    v9 = objc_claimAutoreleasedReturnValue();
    renderedContentURL = v5->_renderedContentURL;
    v5->_renderedContentURL = (NSURL *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("renderedVideoComplementContentURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    renderedVideoComplementContentURL = v5->_renderedVideoComplementContentURL;
    v5->_renderedVideoComplementContentURL = (NSURL *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("renderedPreviewContentURL"));
    v13 = objc_claimAutoreleasedReturnValue();
    renderedPreviewContentURL = v5->_renderedPreviewContentURL;
    v5->_renderedPreviewContentURL = (NSURL *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("adjustmentSecondaryDataURL"));
    v15 = objc_claimAutoreleasedReturnValue();
    adjustmentSecondaryDataURL = v5->_adjustmentSecondaryDataURL;
    v5->_adjustmentSecondaryDataURL = (NSURL *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("penultimateRenderedJPEGData"));
    v17 = objc_claimAutoreleasedReturnValue();
    penultimateRenderedJPEGData = v5->_penultimateRenderedJPEGData;
    v5->_penultimateRenderedJPEGData = (NSData *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("penultimateRenderedVideoContentURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    penultimateRenderedVideoContentURL = v5->_penultimateRenderedVideoContentURL;
    v5->_penultimateRenderedVideoContentURL = (NSURL *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("penultimateRenderedVideoComplementContentURL"));
    v21 = objc_claimAutoreleasedReturnValue();
    penultimateRenderedVideoComplementContentURL = v5->_penultimateRenderedVideoComplementContentURL;
    v5->_penultimateRenderedVideoComplementContentURL = (NSURL *)v21;

    v5->_isSubstandardRender = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSubstandardRender"));
    v5->_fullSizeRenderWidth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fullSizeRenderWidth"));
    v5->_fullSizeRenderHeight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fullSizeRenderHeight"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fullSizeRenderDuration"));
    v5->_fullSizeRenderDuration = v23;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("editorBundleURL"));
    v24 = objc_claimAutoreleasedReturnValue();
    editorBundleURL = v5->_editorBundleURL;
    v5->_editorBundleURL = (NSURL *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalResourceChoice"));
    v26 = objc_claimAutoreleasedReturnValue();
    originalResourceChoice = v5->_originalResourceChoice;
    v5->_originalResourceChoice = (NSNumber *)v26;

    v5->_isAsyncAdjustment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAsyncAdjustment"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("renderedVideoPosterURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    renderedVideoPosterURL = v5->_renderedVideoPosterURL;
    v5->_renderedVideoPosterURL = (NSURL *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playbackVariation"));
    v30 = objc_claimAutoreleasedReturnValue();
    playbackVariation = v5->_playbackVariation;
    v5->_playbackVariation = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoDuration"));
    v32 = objc_claimAutoreleasedReturnValue();
    videoDuration = v5->_videoDuration;
    v5->_videoDuration = (NSNumber *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityDescription"));
    v34 = objc_claimAutoreleasedReturnValue();
    accessibilityDescription = v5->_accessibilityDescription;
    v5->_accessibilityDescription = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestOptions"));
    v36 = objc_claimAutoreleasedReturnValue();
    requestOptions = v5->_requestOptions;
    v5->_requestOptions = (PHContentEditingOutputRequestOptions *)v36;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t mediaType;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  mediaType = self->_mediaType;
  v13 = a3;
  objc_msgSend(v13, "encodeInteger:forKey:", mediaType, CFSTR("mediaType"));
  objc_msgSend(v13, "encodeBool:forKey:", self->_loopingLivePhoto, CFSTR("loopingLivePhoto"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_adjustmentData, CFSTR("adjustmentData"));
  OutboundURLForURL(self->_renderedContentURL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("renderedContentURL"));

  OutboundURLForURL(self->_renderedVideoComplementContentURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("renderedVideoComplementContentURL"));

  OutboundURLForURL(self->_renderedPreviewContentURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("renderedPreviewContentURL"));

  OutboundURLForURL(self->_adjustmentSecondaryDataURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("adjustmentSecondaryDataURL"));

  objc_msgSend(v13, "encodeObject:forKey:", self->_penultimateRenderedJPEGData, CFSTR("penultimateRenderedJPEGData"));
  OutboundURLForURL(self->_penultimateRenderedVideoContentURL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("penultimateRenderedVideoContentURL"));

  OutboundURLForURL(self->_penultimateRenderedVideoComplementContentURL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("penultimateRenderedVideoComplementContentURL"));

  objc_msgSend(v13, "encodeBool:forKey:", self->_isSubstandardRender, CFSTR("isSubstandardRender"));
  objc_msgSend(v13, "encodeInteger:forKey:", self->_fullSizeRenderWidth, CFSTR("fullSizeRenderWidth"));
  objc_msgSend(v13, "encodeInteger:forKey:", self->_fullSizeRenderHeight, CFSTR("fullSizeRenderHeight"));
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("fullSizeRenderDuration"), self->_fullSizeRenderDuration);
  OutboundURLForURL(self->_editorBundleURL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("editorBundleURL"));

  objc_msgSend(v13, "encodeObject:forKey:", self->_originalResourceChoice, CFSTR("originalResourceChoice"));
  objc_msgSend(v13, "encodeBool:forKey:", self->_isAsyncAdjustment, CFSTR("isAsyncAdjustment"));
  OutboundURLForURL(self->_renderedVideoPosterURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("renderedVideoPosterURL"));

  objc_msgSend(v13, "encodeObject:forKey:", self->_playbackVariation, CFSTR("playbackVariation"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_videoDuration, CFSTR("videoDuration"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_accessibilityDescription, CFSTR("accessibilityDescription"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_requestOptions, CFSTR("requestOptions"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHContentEditingOutput;
  -[PHContentEditingOutput description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHContentEditingOutput adjustmentData](self, "adjustmentData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHContentEditingOutput renderedContentURL](self, "renderedContentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHContentEditingOutput renderedPreviewContentURL](self, "renderedPreviewContentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" adjustmentData=%@, renderedContentURL=%@, renderedPreviewContentURL=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  id v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  NSNumber *originalResourceChoice;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_isAsyncAdjustment)
    v7 = CFSTR(" (async)");
  else
    v7 = &stru_1E35DFFF8;
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p>%@\n"), v5, self, v7);

  v8 = self->_mediaType - 1;
  if (v8 > 2)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E35DA708[v8];
  v10 = v9;
  v11 = v10;
  if (self->_loopingLivePhoto)
    v12 = CFSTR(" (looping)");
  else
    v12 = &stru_1E35DFFF8;
  objc_msgSend(v3, "appendFormat:", CFSTR("  mediaType: %@%@\n"), v10, v12);

  objc_msgSend(v3, "appendFormat:", CFSTR("  adjustmentData: %@\n"), self->_adjustmentData);
  originalResourceChoice = self->_originalResourceChoice;
  if (originalResourceChoice)
  {
    v14 = -[NSNumber integerValue](originalResourceChoice, "integerValue");
    if (v14 > 3)
      v15 = 0;
    else
      v15 = off_1E35DA698[v14];
    v16 = v15;
    objc_msgSend(v3, "appendFormat:", CFSTR("  originalChoice: %@\n"), v16);

  }
  if (self->_isAsyncAdjustment)
    objc_msgSend(v3, "appendFormat:", CFSTR("  renderedPreviewContentURL: %@\n"), self->_renderedPreviewContentURL);
  return v3;
}

- (id)setAdjustmentsOptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D718F8]);
  objc_msgSend(v3, "setFullSizeRenderSize:", (double)-[PHContentEditingOutput fullSizeRenderWidth](self, "fullSizeRenderWidth"), (double)-[PHContentEditingOutput fullSizeRenderHeight](self, "fullSizeRenderHeight"));
  -[PHContentEditingOutput fullSizeRenderDuration](self, "fullSizeRenderDuration");
  objc_msgSend(v3, "setFullSizeRenderDuration:");
  objc_msgSend(v3, "setShouldGenerateThumbnails:", 1);
  -[PHContentEditingOutput adjustmentSecondaryDataURL](self, "adjustmentSecondaryDataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdjustmentSecondaryDataURL:", v4);

  if (-[PHContentEditingOutput isAsyncAdjustment](self, "isAsyncAdjustment"))
  {
    -[PHContentEditingOutput renderedPreviewContentURL](self, "renderedPreviewContentURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRenderedContentURL:", v5);

    objc_msgSend(v3, "setSubstandardRender:", 1);
    objc_msgSend(v3, "setDeferred:", 1);
    -[PHContentEditingOutput renderedVideoPosterURL](self, "renderedVideoPosterURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRenderedVideoPosterContentURL:", v6);

  }
  else
  {
    -[PHContentEditingOutput renderedContentURL](self, "renderedContentURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRenderedContentURL:", v7);

    -[PHContentEditingOutput penultimateRenderedJPEGData](self, "penultimateRenderedJPEGData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPenultimateRenderedJPEGData:", v8);

    -[PHContentEditingOutput penultimateRenderedVideoContentURL](self, "penultimateRenderedVideoContentURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPenultimateRenderedVideoContentURL:", v9);

    objc_msgSend(v3, "setSubstandardRender:", -[PHContentEditingOutput isSubstandardRender](self, "isSubstandardRender"));
    -[PHContentEditingOutput renderedVideoComplementContentURL](self, "renderedVideoComplementContentURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRenderedVideoComplementContentURL:", v10);

    -[PHContentEditingOutput penultimateRenderedVideoComplementContentURL](self, "penultimateRenderedVideoComplementContentURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPenultimateRenderedVideoComplementContentURL:", v11);

    -[PHContentEditingOutput renderedVideoPosterURL](self, "renderedVideoPosterURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRenderedVideoPosterContentURL:", v12);

    objc_msgSend(v3, "setShouldUpdateAttributes:", 1);
  }
  return v3;
}

- (NSURL)renderedContentURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRenderedContentURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (PHContentEditingOutputRequestOptions)requestOptions
{
  return self->_requestOptions;
}

- (NSNumber)originalResourceChoice
{
  return self->_originalResourceChoice;
}

- (void)setOriginalResourceChoice:(id)a3
{
  objc_storeStrong((id *)&self->_originalResourceChoice, a3);
}

- (BOOL)isSubstandardRender
{
  return self->_isSubstandardRender;
}

- (void)setIsSubstandardRender:(BOOL)a3
{
  self->_isSubstandardRender = a3;
}

- (int64_t)fullSizeRenderWidth
{
  return self->_fullSizeRenderWidth;
}

- (void)setFullSizeRenderWidth:(int64_t)a3
{
  self->_fullSizeRenderWidth = a3;
}

- (int64_t)fullSizeRenderHeight
{
  return self->_fullSizeRenderHeight;
}

- (void)setFullSizeRenderHeight:(int64_t)a3
{
  self->_fullSizeRenderHeight = a3;
}

- (double)fullSizeRenderDuration
{
  return self->_fullSizeRenderDuration;
}

- (void)setFullSizeRenderDuration:(double)a3
{
  self->_fullSizeRenderDuration = a3;
}

- (NSURL)adjustmentSecondaryDataURL
{
  return self->_adjustmentSecondaryDataURL;
}

- (void)setAdjustmentSecondaryDataURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)penultimateRenderedJPEGData
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPenultimateRenderedJPEGData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSURL)penultimateRenderedVideoContentURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPenultimateRenderedVideoContentURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSURL)renderedVideoPosterURL
{
  return (NSURL *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRenderedVideoPosterURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSURL)renderedVideoComplementContentURL
{
  return (NSURL *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRenderedVideoComplementContentURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSURL)penultimateRenderedVideoComplementContentURL
{
  return (NSURL *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPenultimateRenderedVideoComplementContentURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSURL)editorBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (void)setEditorBundleURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (BOOL)isLoopingLivePhoto
{
  return self->_loopingLivePhoto;
}

- (NSURL)renderedPreviewContentURL
{
  return self->_renderedPreviewContentURL;
}

- (void)setRenderedPreviewContentURL:(id)a3
{
  objc_storeStrong((id *)&self->_renderedPreviewContentURL, a3);
}

- (BOOL)isAsyncAdjustment
{
  return self->_isAsyncAdjustment;
}

- (void)setIsAsyncAdjustment:(BOOL)a3
{
  self->_isAsyncAdjustment = a3;
}

- (NSNumber)playbackVariation
{
  return self->_playbackVariation;
}

- (void)setPlaybackVariation:(id)a3
{
  objc_storeStrong((id *)&self->_playbackVariation, a3);
}

- (NSNumber)videoDuration
{
  return self->_videoDuration;
}

- (void)setVideoDuration:(id)a3
{
  objc_storeStrong((id *)&self->_videoDuration, a3);
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_videoDuration, 0);
  objc_storeStrong((id *)&self->_playbackVariation, 0);
  objc_storeStrong((id *)&self->_renderedPreviewContentURL, 0);
  objc_storeStrong((id *)&self->_editorBundleURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedVideoComplementContentURL, 0);
  objc_storeStrong((id *)&self->_renderedVideoComplementContentURL, 0);
  objc_storeStrong((id *)&self->_renderedVideoPosterURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedVideoContentURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedJPEGData, 0);
  objc_storeStrong((id *)&self->_adjustmentSecondaryDataURL, 0);
  objc_storeStrong((id *)&self->_originalResourceChoice, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_renderedContentURL, 0);
  objc_storeStrong((id *)&self->_appropriateURLForDerivingRenderedContentURLs, 0);
  objc_storeStrong((id *)&self->_deliveredRenderedContentURLs, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
}

+ (BOOL)_currentDeviceSupportsHEICEncoding
{
  return objc_msgSend(MEMORY[0x1E0D75128], "currentDeviceHEVCCapabilities") & 1;
}

+ (id)imageRenderURLUsingHEICFormat:(BOOL)a3 appropriateForURL:(id)a4
{
  return (id)objc_msgSend(a1, "_renderURLWithExtensionForMediaType:useHEICImage:appropriateForURL:", 1, a3, a4);
}

+ (id)_renderURLWithExtensionForMediaType:(int64_t)a3 useHEICImage:(BOOL)a4 appropriateForURL:(id)a5
{
  id *v7;
  id v8;
  void *v9;

  switch(a3)
  {
    case 3:
      v7 = (id *)MEMORY[0x1E0CEC650];
      break;
    case 2:
      v7 = (id *)MEMORY[0x1E0CEC5B0];
      break;
    case 1:
      v7 = (id *)MEMORY[0x1E0CEC508];
      if (!a4)
        v7 = (id *)MEMORY[0x1E0CEC530];
      break;
    default:
      v8 = 0;
      goto LABEL_11;
  }
  v8 = *v7;
LABEL_11:
  objc_msgSend(a1, "_renderURLWithExtensionForUniformTypeIdentifierType:appropriateForURL:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)defaultExtensionForUniformTypeIdentifierType:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = *MEMORY[0x1E0CEC508];
  v10[0] = *MEMORY[0x1E0CEC530];
  v10[1] = v3;
  v11[0] = CFSTR("JPG");
  v11[1] = CFSTR("HEIC");
  v4 = *MEMORY[0x1E0CEC650];
  v10[2] = *MEMORY[0x1E0CEC5B0];
  v10[3] = v4;
  v11[2] = CFSTR("MOV");
  v11[3] = CFSTR("WAV");
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_renderURLWithExtensionForUniformTypeIdentifierType:(id)a3 appropriateForURL:(id)a4
{
  id v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "defaultExtensionForUniformTypeIdentifierType:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (__CFString *)v7;
  else
    v8 = &stru_1E35DFFF8;
  objc_msgSend(MEMORY[0x1E0D73280], "temporaryRenderContentURLForInternalRendersWithExtension:appropriateForURL:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unint64_t)maximumAdjustmentDataLength
{
  return 0x200000;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

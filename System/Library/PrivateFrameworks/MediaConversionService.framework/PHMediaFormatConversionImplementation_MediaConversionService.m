@implementation PHMediaFormatConversionImplementation_MediaConversionService

- (int64_t)transferBehaviorUserPreference
{
  void *v2;
  void *v3;
  unint64_t v4;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.camera"));
  objc_msgSend(v2, "valueForKey:", CFSTR("CAMUserPreferenceMediaTransferBehavior"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = objc_msgSend(v3, "integerValue");
  if (v4 >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = 134217984;
      v7 = v4;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown transfer behavior user preference value %ld, using automatic", (uint8_t *)&v6, 0xCu);
    }
    goto LABEL_6;
  }
LABEL_7:

  return v4;
}

- (PHMediaFormatConversionImplementation_MediaConversionService)init
{
  PHMediaFormatConversionImplementation_MediaConversionService *v2;
  uint64_t v3;
  PAVideoConversionServiceClient *videoConversionServiceClient;
  uint64_t v5;
  PAImageConversionServiceClient *imageConversionServiceClient;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHMediaFormatConversionImplementation_MediaConversionService;
  v2 = -[PHMediaFormatConversionImplementation_MediaConversionService init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    videoConversionServiceClient = v2->_videoConversionServiceClient;
    v2->_videoConversionServiceClient = (PAVideoConversionServiceClient *)v3;

    v5 = objc_opt_new();
    imageConversionServiceClient = v2->_imageConversionServiceClient;
    v2->_imageConversionServiceClient = (PAImageConversionServiceClient *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PAVideoConversionServiceClient invalidateAfterPendingRequestCompletion](self->_videoConversionServiceClient, "invalidateAfterPendingRequestCompletion");
  v3.receiver = self;
  v3.super_class = (Class)PHMediaFormatConversionImplementation_MediaConversionService;
  -[PHMediaFormatConversionImplementation_MediaConversionService dealloc](&v3, sel_dealloc);
}

- (NSSet)ut_objectsToBeDeallocatedWithReceiver
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", self->_videoConversionServiceClient, self->_imageConversionServiceClient, 0);
}

- (void)performConversionRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversionImplementation_MediaConversionService.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    v8 = 0;
  }
  if (objc_msgSend(v8, "isCompositeRequest"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversionImplementation_MediaConversionService.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!request.isCompositeRequest"));

    if (v7)
      goto LABEL_5;
  }
  else if (v7)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversionImplementation_MediaConversionService.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_5:
  objc_msgSend(v14, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "mediaType");

  if (v10 == 1)
    -[PHMediaFormatConversionImplementation_MediaConversionService performVideoConversionRequest:completionHandler:](self, "performVideoConversionRequest:completionHandler:", v14, v7);
  else
    -[PHMediaFormatConversionImplementation_MediaConversionService performImageConversionRequest:completionHandler:](self, "performImageConversionRequest:completionHandler:", v14, v7);

}

- (void)performVideoConversionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setMediaType:", 1);
    objc_msgSend(v8, "generateTemporaryOutputFileURLForRequest:", v6);
  }
  v13 = 0;
  v9 = objc_msgSend(v8, "createTemporaryOutputFileWithErrorError:", &v13);
  v10 = v13;
  if ((v9 & 1) != 0)
  {
    if (objc_msgSend(v6, "requiresSinglePassVideoConversion"))
      -[PHMediaFormatConversionImplementation_MediaConversionService submitSinglePassVideoConversionRequest:destination:completionHandler:](self, "submitSinglePassVideoConversionRequest:destination:completionHandler:", v6, v8, v7);
    else
      -[PHMediaFormatConversionImplementation_MediaConversionService submitNonSinglePassVideoConversionRequest:destination:completionHandler:](self, "submitNonSinglePassVideoConversionRequest:destination:completionHandler:", v6, v8, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "progress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addChild:withPendingUnitCount:", v11, 1);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected nil progress for conversion request %@", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create format conversion output temporary file: %@", buf, 0xCu);
    }
    objc_msgSend(v6, "setError:", v10);
    objc_msgSend(v6, "setStatus:", 5);
    v7[2](v7);
  }

}

- (id)submitNonSinglePassVideoConversionRequest:(id)a3 destination:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id location;
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = *MEMORY[0x1E0C8A2E8];
  v28[0] = CFSTR("PAMediaConversionServiceOptionOutputFileTypeKey");
  v28[1] = CFSTR("PAMediaConversionServiceOptionAVIncludeMetadataKey");
  v29[0] = v12;
  v29[1] = MEMORY[0x1E0C9AAB0];
  v28[2] = CFSTR("PAMediaConversionServiceOptionAudioTrackGroupHandlingKey");
  v29[2] = &unk_1E995B7A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHMediaFormatConversionImplementation_MediaConversionService applyCommonOptionsFromRequest:toOptions:](self, "applyCommonOptionsFromRequest:toOptions:", v8, v14);
  -[PHMediaFormatConversionImplementation_MediaConversionService applyCommonOptionsFromVideoRequest:toOptions:](self, "applyCommonOptionsFromVideoRequest:toOptions:", v8, v14);
  objc_initWeak(&location, v8);
  -[PHMediaFormatConversionImplementation_MediaConversionService videoConversionServiceClient](self, "videoConversionServiceClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fileURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __136__PHMediaFormatConversionImplementation_MediaConversionService_submitNonSinglePassVideoConversionRequest_destination_completionHandler___block_invoke;
  v23[3] = &unk_1E9953A30;
  objc_copyWeak(&v26, &location);
  v19 = v9;
  v24 = v19;
  v20 = v10;
  v25 = v20;
  objc_msgSend(v15, "convertVideoAtSourceURL:toDestinationURL:options:completionHandler:", v17, v18, v14, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v21;
}

- (id)submitSinglePassVideoConversionRequest:(id)a3 destination:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id location;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v23 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v11 = (void *)MEMORY[0x1E0C99E08];
  v30 = CFSTR("PAMediaConversionServiceOptionTargetFileSizeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "estimatedOutputFileLength"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHMediaFormatConversionImplementation_MediaConversionService applyCommonOptionsFromRequest:toOptions:](self, "applyCommonOptionsFromRequest:toOptions:", v8, v14);
  -[PHMediaFormatConversionImplementation_MediaConversionService applyCommonOptionsFromVideoRequest:toOptions:](self, "applyCommonOptionsFromVideoRequest:toOptions:", v8, v14);
  objc_initWeak(&location, v8);
  -[PHMediaFormatConversionImplementation_MediaConversionService videoConversionServiceClient](self, "videoConversionServiceClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fileURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fileURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __133__PHMediaFormatConversionImplementation_MediaConversionService_submitSinglePassVideoConversionRequest_destination_completionHandler___block_invoke;
  v25[3] = &unk_1E9953A30;
  v20 = v10;
  v26 = v20;
  objc_copyWeak(&v28, &location);
  v21 = v9;
  v27 = v21;
  objc_msgSend(v15, "convertVideoAtSourceURL:toDestinationURL:options:completionHandler:", v17, v19, v14, v25);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "startObservingProgress:forRequest:", v24, v8);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
  return v24;
}

- (void)applyCommonOptionsFromVideoRequest:(id)a3 toOptions:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;

  v45 = a3;
  v7 = a4;
  objc_msgSend(v45, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderOriginatingSignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("PAMediaConversionServiceOptionAVMetadataRenderOriginatingSignatureKey"));
  }
  else if (objc_msgSend(v45, "requiresFormatConversion"))
  {
    objc_msgSend(v45, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileSignature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "source");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversionImplementation_MediaConversionService.m"), 194, CFSTR("Unexpected nil file signature for source %@"), v44);

    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("PAMediaConversionServiceOptionAVMetadataOriginatingSignatureKey"));

  }
  objc_msgSend(v45, "livePhotoPairingIdentifier");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v45, "livePhotoPairingIdentifierBehavior"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversionImplementation_MediaConversionService.m"), 226, CFSTR("Unexpected uninitialized live photo pairing identifier behavior"));

      goto LABEL_17;
    case 2:
      objc_msgSend(v45, "source");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "livePhotoPairingIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_15;
      goto LABEL_17;
    case 3:
      goto LABEL_12;
    case 4:
      objc_msgSend(v45, "source");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "livePhotoPairingIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_17;
LABEL_12:
      v18 = v7;
      v19 = v12;
      goto LABEL_16;
    case 5:
      objc_msgSend(v45, "source");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "livePhotoPairingIdentifier");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        v23 = objc_msgSend(v45, "requiresFormatConversion");

        if (v23)
        {
LABEL_15:
          v19 = &stru_1E9955DB0;
          v18 = v7;
LABEL_16:
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("PAMediaConversionServiceOptionLivePhotoPairingIdentifierKey"));
        }
      }
      else
      {

      }
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v45, "locationMetadataBehavior") != 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("PAMediaConversionServiceOptionAVMetadataIncludeLocationKey"));

      if (objc_msgSend(v45, "locationMetadataBehavior") == 2)
      {
        objc_msgSend(v45, "location");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v45, "location");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("PAMediaConversionServiceOptionAVMetadataLocationKey"));

        }
      }
      if (objc_msgSend(v45, "creationDateMetadataBehavior") == 2)
      {
        objc_msgSend(v45, "creationDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v45, "creationDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("PAMediaConversionServiceOptionAVMetadataContentCreationDateKey"));

          objc_msgSend(v45, "creationDateTimeZone");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v45, "creationDateTimeZone");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "creationDate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v30, "secondsFromGMTForDate:", v31);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("PAMediaConversionServiceOptionAVMetadataContentCreationDateTimeZoneOffsetKey"));

          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v45, "captionMetadataBehavior") != 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, CFSTR("PAMediaConversionServiceOptionAVMetadataIncludeDescriptionKey"));

      if (objc_msgSend(v45, "captionMetadataBehavior") == 2)
      {
        objc_msgSend(v45, "caption");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v45, "caption");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("PAMediaConversionServiceOptionAVMetadataDescriptionKey"));

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v45, "accessibilityDescriptionMetadataBehavior") != 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v37, CFSTR("PAMediaConversionServiceOptionAVMetadataIncludeAccessibilityDescriptionKey"));

      if (objc_msgSend(v45, "accessibilityDescriptionMetadataBehavior") == 2)
      {
        objc_msgSend(v45, "accessibilityDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend(v45, "accessibilityDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, CFSTR("PAMediaConversionServiceOptionAVMetadataAccessibilityDescriptionKey"));

        }
      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E995B7B8, CFSTR("PAMediaConversionServiceOptionPowerEfficiencyKey"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E995B7D0, CFSTR("PAMediaConversionServiceOptionPowerEfficiencyMinimumDurationKey"));
      v40 = (id)*MEMORY[0x1E0C89E28];
      objc_msgSend(v45, "videoExportPreset");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend(v45, "videoExportPreset");
        v42 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("PAMediaConversionServiceOptionIsPassthroughConversionKey"));
      }
      else
      {
        if (!objc_msgSend(v45, "shouldExportAsHDR"))
          goto LABEL_35;
        v42 = (id)*MEMORY[0x1E0C89E20];

      }
      v40 = v42;
LABEL_35:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v40, CFSTR("PAMediaConversionServiceOptionExportPresetNameKey"));

      return;
    default:
      goto LABEL_17;
  }
}

- (void)performImageConversionRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  PHMediaFormatConversionImplementation_MediaConversionService *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  void (**v61)(_QWORD);
  id v62;
  uint8_t buf[4];
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setMediaType:", 2);
  objc_msgSend(v7, "outputPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOutputPathExtension:", v10);

  objc_msgSend(v9, "generateTemporaryOutputFileURLForRequest:", v7);
  v62 = 0;
  v11 = objc_msgSend(v9, "createTemporaryOutputFileWithErrorError:", &v62);
  v12 = v62;
  if ((v11 & 1) != 0)
  {
    v56 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PAMediaConversionServiceDefaultImageMetadataPolicy standardPolicy](PAMediaConversionServiceDefaultImageMetadataPolicy, "standardPolicy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    objc_msgSend(v7, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "renderOriginatingSignature");
    v16 = objc_claimAutoreleasedReturnValue();

    v55 = (void *)v16;
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D75140], "renderOriginatingAssetIdentifierMetadataKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PAMediaConversionServiceAddPFMetadataPolicy policyWithKey:value:](PAMediaConversionServiceAddPFMetadataPolicy, "policyWithKey:value:", v17, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v18);
    }
    else
    {
      if (!objc_msgSend(v7, "requiresFormatConversion"))
      {
LABEL_11:
        objc_msgSend(v7, "livePhotoPairingIdentifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        switch(objc_msgSend(v7, "livePhotoPairingIdentifierBehavior"))
        {
          case 0:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v56, CFSTR("PHMediaFormatConversionImplementation_MediaConversionService.m"), 328, CFSTR("Unexpected uninitialized live photo pairing identifier behavior"));
            goto LABEL_21;
          case 2:
            objc_msgSend(v7, "source");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "livePhotoPairingIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23)
              goto LABEL_22;
            goto LABEL_19;
          case 3:
            goto LABEL_16;
          case 4:
            objc_msgSend(v7, "source");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "livePhotoPairingIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v25)
              goto LABEL_22;
LABEL_16:
            objc_msgSend(MEMORY[0x1E0D75140], "livePhotoPairingIdentifierMetadataKey");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v21;
            v27 = v57;
            goto LABEL_20;
          case 5:
            objc_msgSend(v7, "source");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "livePhotoPairingIdentifier");
            v28 = objc_claimAutoreleasedReturnValue();
            if (!v28)
              goto LABEL_21;
            v29 = (void *)v28;
            v30 = objc_msgSend(v7, "requiresFormatConversion");

            if (!v30)
              goto LABEL_22;
LABEL_19:
            objc_msgSend(MEMORY[0x1E0D75140], "livePhotoPairingIdentifierMetadataKey");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v21;
            v27 = 0;
LABEL_20:
            +[PAMediaConversionServiceAddPFMetadataPolicy policyWithKey:value:](PAMediaConversionServiceAddPFMetadataPolicy, "policyWithKey:value:", v26, v27);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v31);

LABEL_21:
LABEL_22:
            if (objc_msgSend(v7, "locationMetadataBehavior") == 1)
            {
              +[PAMediaConversionServiceSetLocationImageMetadataPolicy policyWithLocation:](PAMediaConversionServiceSetLocationImageMetadataPolicy, "policyWithLocation:", 0);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v32);
LABEL_27:

              goto LABEL_28;
            }
            if (objc_msgSend(v7, "locationMetadataBehavior") == 2)
            {
              objc_msgSend(v7, "location");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                objc_msgSend(v7, "location");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                +[PAMediaConversionServiceSetLocationImageMetadataPolicy policyWithLocation:](PAMediaConversionServiceSetLocationImageMetadataPolicy, "policyWithLocation:", v32);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v34);

                goto LABEL_27;
              }
            }
LABEL_28:
            if (objc_msgSend(v7, "creationDateMetadataBehavior") == 2)
            {
              objc_msgSend(v7, "creationDate");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
              {
                objc_msgSend(v7, "creationDate");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "creationDateTimeZone");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                +[PAMediaConversionServiceSetCreationDateImageMetadataPolicy policyWithCreationDate:inTimeZone:](PAMediaConversionServiceSetCreationDateImageMetadataPolicy, "policyWithCreationDate:inTimeZone:", v36, v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v38);

              }
            }
            if (objc_msgSend(v7, "captionMetadataBehavior") == 1)
            {
              +[PAMediaConversionServiceSetCaptionImageMetadataPolicy policyWithCaption:](PAMediaConversionServiceSetCaptionImageMetadataPolicy, "policyWithCaption:", 0);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v39);
LABEL_36:

              goto LABEL_37;
            }
            if (objc_msgSend(v7, "captionMetadataBehavior") == 2)
            {
              objc_msgSend(v7, "caption");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (v40)
              {
                objc_msgSend(v7, "caption");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                +[PAMediaConversionServiceSetCaptionImageMetadataPolicy policyWithCaption:](PAMediaConversionServiceSetCaptionImageMetadataPolicy, "policyWithCaption:", v39);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v41);

                goto LABEL_36;
              }
            }
LABEL_37:
            if (objc_msgSend(v7, "accessibilityDescriptionMetadataBehavior") == 1)
            {
              +[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy policyWithAccessibilityDescription:](PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy, "policyWithAccessibilityDescription:", 0);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v42);
LABEL_42:

              goto LABEL_43;
            }
            if (objc_msgSend(v7, "accessibilityDescriptionMetadataBehavior") == 2)
            {
              objc_msgSend(v7, "accessibilityDescription");
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              if (v43)
              {
                objc_msgSend(v7, "accessibilityDescription");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                +[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy policyWithAccessibilityDescription:](PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy, "policyWithAccessibilityDescription:", v42);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v44);

                goto LABEL_42;
              }
            }
LABEL_43:
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            +[PAMediaConversionServiceCompositeImageMetadataPolicy policyWithPolicies:](PAMediaConversionServiceCompositeImageMetadataPolicy, "policyWithPolicies:", v13);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v46, CFSTR("PAMediaConversionServiceOptionMetadataPolicyKey"));

            objc_msgSend(v45, "setObject:forKeyedSubscript:", &unk_1E995BE80, CFSTR("PAMediaConversionServiceOptionScaleFactorKey"));
            objc_msgSend(v45, "setObject:forKeyedSubscript:", &unk_1E995B7E8, CFSTR("PAMediaConversionServiceOptionColorSpaceKey"));
            objc_msgSend(v45, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PAMediaConversionServiceOptionFormatConversionOnlyKey"));
            objc_msgSend(v45, "setObject:forKeyedSubscript:", CFSTR("PHMediaFormatConversion"), CFSTR("PAMediaConversionServiceOptionRequestReasonKey"));
            -[PHMediaFormatConversionImplementation_MediaConversionService applyCommonOptionsFromRequest:toOptions:](v56, "applyCommonOptionsFromRequest:toOptions:", v7, v45);
            objc_msgSend(v7, "source");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "fileURL");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:](PAMediaConversionServiceResourceURLCollection, "collectionWithMainResourceURL:", v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "fileURL");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:](PAMediaConversionServiceResourceURLCollection, "collectionWithMainResourceURL:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            -[PHMediaFormatConversionImplementation_MediaConversionService imageConversionServiceClient](v56, "imageConversionServiceClient");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v58[0] = MEMORY[0x1E0C809B0];
            v58[1] = 3221225472;
            v58[2] = __112__PHMediaFormatConversionImplementation_MediaConversionService_performImageConversionRequest_completionHandler___block_invoke;
            v58[3] = &unk_1E9953AE8;
            v59 = v7;
            v61 = v8;
            v60 = v9;
            objc_msgSend(v52, "convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v49, v51, v45, v58);

            break;
          default:
            goto LABEL_22;
        }
        goto LABEL_44;
      }
      objc_msgSend(v7, "source");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fileSignature");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "source");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v64 = v54;
          _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected nil file signature for source %@", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 5, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setError:", v53);

        objc_msgSend(v7, "setStatus:", 5);
        v8[2](v8);
LABEL_44:

        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x1E0D75140], "originatingAssetIdentifierMetadataKey");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PAMediaConversionServiceAddPFMetadataPolicy policyWithKey:value:](PAMediaConversionServiceAddPFMetadataPolicy, "policyWithKey:value:", v18, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v20);

    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v12;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create format conversion output temporary file: %@", buf, 0xCu);
  }
  objc_msgSend(v7, "setError:", v12);
  objc_msgSend(v7, "setStatus:", 5);
  v8[2](v8);
LABEL_45:

}

- (void)applyCommonOptionsFromRequest:(id)a3 toOptions:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(a3, "requiresPassthroughConversion"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PAMediaConversionServiceOptionIsPassthroughConversionKey"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E995B800, CFSTR("PAMediaConversionServiceOptionJobPriorityKey"));

}

- (PAVideoConversionServiceClient)videoConversionServiceClient
{
  return (PAVideoConversionServiceClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)setVideoConversionServiceClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PAImageConversionServiceClient)imageConversionServiceClient
{
  return (PAImageConversionServiceClient *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImageConversionServiceClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
}

@end

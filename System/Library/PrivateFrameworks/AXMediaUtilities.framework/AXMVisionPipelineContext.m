@implementation AXMVisionPipelineContext

+ (AXMVisionPipelineContext)contextWithSourceParameters:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  AXMVisionPipelineContext *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AXMVisionPipelineContext initWithSourceParameters:options:]([AXMVisionPipelineContext alloc], "initWithSourceParameters:options:", v6, v5);

  return v7;
}

- (AXMVisionPipelineContext)initWithSourceParameters:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  AXMVisionPipelineContext *v9;
  AXMVisionPipelineContext *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AXMVisionPipelineContext;
  v9 = -[AXMVisionPipelineContext init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = _SequenceIDCounter++;
    v9->_sequenceID = v11;
    objc_storeStrong((id *)&v9->_sourceParameters, a3);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sourceProvidesResults"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_sourceProvidesOwnResults = objc_msgSend(v12, "BOOLValue");

    -[AXMVisionPipelineContext setAnalysisOptions:](v10, "setAnalysisOptions:", v8);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("diagnosticsEnabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    -[AXMVisionPipelineContext _commonInitWithDiagnosticsEnabled:](v10, "_commonInitWithDiagnosticsEnabled:", v14);
  }

  return v10;
}

- (void)_commonInitWithDiagnosticsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  NSMutableArray *resultHandlers;
  NSMutableArray *v7;
  NSMutableArray *detectedSceneClassifications;
  NSMutableArray *v9;
  NSMutableArray *features;
  NSMutableSet *v11;
  NSMutableSet *evaluatedFeatureTypes;
  NSArray *v13;
  NSArray *effectiveTextDetectionLocales;
  id v15;
  void *v16;
  double v17;
  void *v18;
  AXMetricSession *v19;
  AXMetricSession *metricSession;
  NSObject *v21;
  OS_dispatch_queue *v22;
  OS_dispatch_queue *sceneObservationQueue;
  NSMutableArray *v24;
  NSMutableArray *mediaAnalysisDetectedSceneClassifications;

  v3 = a3;
  self->_shouldCallCompletionHandlersForEmptyResultSet = 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  resultHandlers = self->_resultHandlers;
  self->_resultHandlers = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  detectedSceneClassifications = self->_detectedSceneClassifications;
  self->_detectedSceneClassifications = v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  features = self->_features;
  self->_features = v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  evaluatedFeatureTypes = self->_evaluatedFeatureTypes;
  self->_evaluatedFeatureTypes = v11;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  effectiveTextDetectionLocales = self->_effectiveTextDetectionLocales;
  self->_effectiveTextDetectionLocales = v13;

  v15 = objc_alloc(MEMORY[0x1E0CF3990]);
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Pipeline-%ld"), (uint64_t)v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (AXMetricSession *)objc_msgSend(v15, "initWithName:measurementsEnabled:orEnabledByEnvironmentVariables:", v18, v3, &unk_1E6289440);
  metricSession = self->_metricSession;
  self->_metricSession = v19;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.accessibility.sceneobservation", v21);
  sceneObservationQueue = self->_sceneObservationQueue;
  self->_sceneObservationQueue = v22;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  mediaAnalysisDetectedSceneClassifications = self->_mediaAnalysisDetectedSceneClassifications;
  self->_mediaAnalysisDetectedSceneClassifications = v24;

}

- (id)description
{
  void *v3;
  unint64_t sequenceID;
  NSDictionary *sourceParameters;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  sequenceID = self->_sequenceID;
  sourceParameters = self->_sourceParameters;
  -[AXMVisionPipelineContext error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXMVisionPipelineContext<%p>: seqID:%lu source params: %@. error: %@"), self, sequenceID, sourceParameters, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionPipelineContext)initWithCoder:(id)a3
{
  id v4;
  AXMVisionPipelineContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSError *error;
  void *v19;
  uint64_t v20;
  NSSecureCoding *userContext;
  void *v22;
  uint64_t v23;
  NSArray *effectiveTextDetectionLocales;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AXMVisionPipelineContext;
  v5 = -[AXMVisionPipelineContext init](&v26, sel_init);
  if (v5)
  {
    -[AXMVisionPipelineContext _commonInitWithDiagnosticsEnabled:](v5, "_commonInitWithDiagnosticsEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("diagnosticsEnabled")));
    AXMSecureCodingClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("sourceparams"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_storeStrong((id *)&v5->_sourceParameters, v7);
    AXMSecureCodingClasses();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("features"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_storeStrong((id *)&v5->_features, v9);
    AXMSecureCodingClasses();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("evaluatedFeatureTypes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_storeStrong((id *)&v5->_evaluatedFeatureTypes, v11);
    AXMSecureCodingClasses();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("analysisOptions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionPipelineContext setAnalysisOptions:](v5, "setAnalysisOptions:", v13);

    AXMSecureCodingClasses();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("appliedImageOrientation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionPipelineContext setAppliedImageOrientation:](v5, "setAppliedImageOrientation:", v15);

    AXMSecureCodingClasses();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("error"));
    v17 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v17;

    v5->_sequenceID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sequenceID"));
    AXMSecureCodingClasses();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("userContext"));
    v20 = objc_claimAutoreleasedReturnValue();
    userContext = v5->_userContext;
    v5->_userContext = (NSSecureCoding *)v20;

    AXMSecureCodingClasses();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("EffectiveTextDetectionLocales"));
    v23 = objc_claimAutoreleasedReturnValue();
    effectiveTextDetectionLocales = v5->_effectiveTextDetectionLocales;
    v5->_effectiveTextDetectionLocales = (NSArray *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[AXMVisionPipelineContext metricSession](self, "metricSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "measurementsEnabled"), CFSTR("diagnosticsEnabled"));

  -[AXMVisionPipelineContext analysisOptions](self, "analysisOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("analysisOptions"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceParameters, CFSTR("sourceparams"));
  -[AXMVisionPipelineContext features](self, "features");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("features"));

  -[AXMVisionPipelineContext evaluatedFeatureTypes](self, "evaluatedFeatureTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("evaluatedFeatureTypes"));

  -[AXMVisionPipelineContext error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("error"));

  -[AXMVisionPipelineContext appliedImageOrientation](self, "appliedImageOrientation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("appliedImageOrientation"));

  objc_msgSend(v4, "encodeInteger:forKey:", self->_sequenceID, CFSTR("sequenceID"));
  -[AXMVisionPipelineContext userContext](self, "userContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("userContext"));

  -[AXMVisionPipelineContext effectiveTextDetectionLocales](self, "effectiveTextDetectionLocales");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("EffectiveTextDetectionLocales"));

}

- (BOOL)sourceProvidesResults
{
  return self->_sourceProvidesOwnResults;
}

- (CGSize)size
{
  AXMPipelineContextInput *sourceInput;
  double v3;
  double v4;
  CGSize result;

  sourceInput = self->_sourceInput;
  if (sourceInput)
  {
    -[AXMPipelineContextInput size](sourceInput, "size");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_makeRequestHandlerForInput:(id)a3 options:(id)a4
{
  void *v4;
  id v6;
  id v7;
  id v8;
  id v9;
  AXMPhotoAssetData *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  AXMPhotoAssetData *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;

  v6 = a3;
  v7 = (id)MEMORY[0x1E0C9AA70];
  if (a4)
    v7 = a4;
  v8 = v7;
  switch(objc_msgSend(v6, "inputType"))
  {
    case 0:
      v9 = objc_alloc((Class)getVNImageRequestHandlerClass());
      objc_msgSend(v6, "ciImage");
      v10 = (AXMPhotoAssetData *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "initWithCIImage:options:", v10, v8);
      goto LABEL_7;
    case 1:
      v12 = objc_alloc((Class)getVNImageRequestHandlerClass());
      objc_msgSend(v6, "pixelBuffer");
      v10 = (AXMPhotoAssetData *)objc_claimAutoreleasedReturnValue();
      v13 = -[AXMPhotoAssetData pixelBuffer](v10, "pixelBuffer");
      objc_msgSend(v6, "pixelBuffer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "initWithCVPixelBuffer:orientation:options:", v13, objc_msgSend(v14, "orientation"), v8);
      goto LABEL_9;
    case 2:
      v16 = objc_alloc((Class)getVNImageRequestHandlerClass());
      objc_msgSend(v6, "URL");
      v10 = (AXMPhotoAssetData *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v16, "initWithURL:options:", v10, v8);
LABEL_7:
      v4 = (void *)v11;
      goto LABEL_10;
    case 3:
      v17 = [AXMPhotoAssetData alloc];
      objc_msgSend(v6, "phAssetLocalIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "photoLibraryURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[AXMPhotoAssetData initWithImageAssetLocalIdentifier:photoLibraryURL:allowsNetworkAccess:needsImageData:](v17, "initWithImageAssetLocalIdentifier:photoLibraryURL:allowsNetworkAccess:needsImageData:", v18, v19, 1, 1);

      v20 = objc_alloc(MEMORY[0x1E0C9DDC8]);
      -[AXMPhotoAssetData imageData](v10, "imageData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v20, "initWithData:", v21);

      v15 = objc_msgSend(objc_alloc((Class)getVNImageRequestHandlerClass()), "initWithCIImage:options:", v14, v8);
LABEL_9:
      v4 = (void *)v15;

LABEL_10:
      break;
    default:
      break;
  }

  return v4;
}

- (VNImageRequestHandler)visionImageRequestHandler
{
  VNImageRequestHandler *visionImageRequestHandler;
  VNImageRequestHandler *v4;
  VNImageRequestHandler *v5;

  visionImageRequestHandler = self->_visionImageRequestHandler;
  if (!visionImageRequestHandler)
  {
    -[AXMVisionPipelineContext _makeRequestHandlerForInput:options:](self, "_makeRequestHandlerForInput:options:", self->_sourceInput, 0);
    v4 = (VNImageRequestHandler *)objc_claimAutoreleasedReturnValue();
    v5 = self->_visionImageRequestHandler;
    self->_visionImageRequestHandler = v4;

    visionImageRequestHandler = self->_visionImageRequestHandler;
  }
  return visionImageRequestHandler;
}

- (id)visionImageRequestHandlerWithOptions:(id)a3
{
  AXMPipelineContextInput *sourceInput;
  void *v5;

  sourceInput = self->_sourceInput;
  if (sourceInput)
  {
    -[AXMVisionPipelineContext _makeRequestHandlerForInput:options:](self, "_makeRequestHandlerForInput:options:", sourceInput, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)visionImageRequestHandlerIsLoaded
{
  return self->_visionImageRequestHandler != 0;
}

- (void)createSceneObservationIfNilWithBlock:(id)a3
{
  id v4;
  NSObject *sceneObservationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sceneObservationQueue = self->_sceneObservationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AXMVisionPipelineContext_createSceneObservationIfNilWithBlock___block_invoke;
  block[3] = &unk_1E625C480;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sceneObservationQueue, block);

}

void __65__AXMVisionPipelineContext_createSceneObservationIfNilWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

  }
}

- (id)sceneObservation
{
  NSObject *sceneObservationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  sceneObservationQueue = self->_sceneObservationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AXMVisionPipelineContext_sceneObservation__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sceneObservationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__AXMVisionPipelineContext_sceneObservation__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)setUserContext:(id)a3
{
  NSSecureCoding *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSSecureCoding **p_userContext;
  NSSecureCoding *userContext;

  v5 = (NSSecureCoding *)a3;
  if (v5)
  {
    AXMSecureCodingClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", objc_opt_class());

    if ((v7 & 1) == 0)
    {
      AXMediaLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[AXMVisionPipelineContext setUserContext:].cold.1((uint64_t)v5, v8);

    }
  }
  userContext = self->_userContext;
  p_userContext = &self->_userContext;
  if (userContext != v5)
    objc_storeStrong((id *)p_userContext, a3);

}

- (NSArray)resultHandlers
{
  return (NSArray *)self->_resultHandlers;
}

- (void)addResultHandler:(id)a3
{
  NSMutableArray *resultHandlers;
  id v4;

  if (a3)
  {
    resultHandlers = self->_resultHandlers;
    v4 = (id)MEMORY[0x1B5E12AE8](a3, a2);
    -[NSMutableArray addObject:](resultHandlers, "addObject:", v4);

  }
}

- (void)addResultHandlers:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_resultHandlers, "addObjectsFromArray:", a3);
}

- (NSArray)sceneLabelsForOCRDocumentTypeDetection
{
  return (NSArray *)self->_detectedSceneClassifications;
}

- (void)addSceneLabelForOCRDocumentTypeDetection:(id)a3
{
  -[NSMutableArray addObject:](self->_detectedSceneClassifications, "addObject:", a3);
}

- (NSArray)mediaAnalysisSceneLabelsForOCRDocumentTypeDetection
{
  return (NSArray *)self->_mediaAnalysisDetectedSceneClassifications;
}

- (void)addMediaAnalysisSceneLabelForOCRDocumentTypeDetection:(id)a3
{
  -[NSMutableArray addObject:](self->_mediaAnalysisDetectedSceneClassifications, "addObject:", a3);
}

- (void)produceImage:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSDictionary *sourceParameters;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *v15;
  uint64_t v16;
  id v17;

  v4 = a3;
  v11 = v4;
  if (v4)
  {
    sourceParameters = self->_sourceParameters;
    v17 = 0;
    (*((void (**)(id, NSDictionary *, id *))v4 + 2))(v4, sourceParameters, &v17);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (uint64_t)v17;
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  if (!(v14 | v13))
  {
    _AXMMakeError(0, CFSTR("A creation node must return a valid image"), v5, v6, v7, v8, v9, v10, v16);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  if (v14)
  {
    -[AXMVisionPipelineContext errorOccurred:](self, "errorOccurred:", v14);
  }
  else if (v13)
  {
    objc_storeStrong((id *)&self->_sourceInput, (id)v13);
  }
  v15 = self->_sourceParameters;
  self->_sourceParameters = 0;

}

- (void)appendFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[AXMVisionPipelineContext userContext](self, "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserContext:", v5);

  -[AXMVisionPipelineContext features](self, "features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  v7 = objc_msgSend(v4, "featureType");
  -[AXMVisionPipelineContext addEvaluatedFeatureType:](self, "addEvaluatedFeatureType:", v7);
}

- (void)addEvaluatedFeatureType:(unint64_t)a3
{
  void *v4;
  id v5;

  -[AXMVisionPipelineContext evaluatedFeatureTypes](self, "evaluatedFeatureTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (BOOL)_addSignificantEventFeatureGateIfNeededToFeature:(id)a3 category:(id)a4 minimumConfidence:(double)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "classificationLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", v8))
  {

    goto LABEL_5;
  }
  objc_msgSend(v7, "confidence");
  v11 = v10;

  if (v11 <= a5)
  {
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  v16[0] = CFSTR("MinimumConfidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("ClassifierLabel");
  v17[0] = v12;
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addFeatureGate:userInfo:", CFSTR("Taboo Filter"), v13);

  v14 = 1;
LABEL_6:

  return v14;
}

- (void)setEquivalenceToken:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXMVisionPipelineContext result](self, "result");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEquivalenceToken:", v4);

}

- (AXMVisionResult)result
{
  AXMVisionResult *v3;
  AXMVisionResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  if (!self->_result)
  {
    v3 = -[AXMVisionResult _init]([AXMVisionResult alloc], "_init");
    v4 = self->_result;
    self->_result = v3;

    -[AXMVisionPipelineContext features](self, "features");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setFeatures:](self->_result, "setFeatures:", v5);

    -[AXMVisionPipelineContext effectiveTextDetectionLocales](self, "effectiveTextDetectionLocales");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setEffectiveTextDetectionLocales:](self->_result, "setEffectiveTextDetectionLocales:", v6);

    -[AXMVisionPipelineContext evaluatedFeatureTypes](self, "evaluatedFeatureTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setEvaluatedFeatureTypes:](self->_result, "setEvaluatedFeatureTypes:", v7);

    -[AXMVisionPipelineContext appliedImageOrientation](self, "appliedImageOrientation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setAppliedImageOrientation:](self->_result, "setAppliedImageOrientation:", v8);

    -[AXMVisionPipelineContext metricSession](self, "metricSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setMetricSession:](self->_result, "setMetricSession:", v9);

    -[AXMVisionResult setImageRegistrationState:](self->_result, "setImageRegistrationState:", -[AXMVisionPipelineContext imageRegistrationState](self, "imageRegistrationState"));
    -[AXMVisionPipelineContext userContext](self, "userContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setUserContext:](self->_result, "setUserContext:", v10);

    -[AXMVisionPipelineContext analysisOptions](self, "analysisOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "includeImageInResult");

    if (v12)
    {
      -[AXMVisionPipelineContext generateImageRepresentation](self, "generateImageRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionResult setImage:](self->_result, "setImage:", v13);

    }
  }
  return self->_result;
}

- (id)generateFileNameForImageWithPrefix:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[AXMVisionPipelineContext size](self, "size");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld-%ldx%ld.%@"), v7, self->_sequenceID, (uint64_t)v9, (uint64_t)v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)generateImageRepresentation
{
  AXMPipelineContextInput *sourceInput;
  id result;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AXMPhotoAssetData *v18;
  void *v19;
  void *v20;
  AXMPhotoAssetData *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  sourceInput = self->_sourceInput;
  if (!sourceInput)
    return 0;
  switch(-[AXMPipelineContextInput inputType](sourceInput, "inputType"))
  {
    case 0:
      -[AXMPipelineContextInput ciImage](self->_sourceInput, "ciImage");
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      v5 = *MEMORY[0x1E0C9E0B0];
      v28[0] = MEMORY[0x1E0C9AAB0];
      v6 = *MEMORY[0x1E0C9E140];
      v27[0] = v5;
      v27[1] = v6;
      v25 = *MEMORY[0x1E0CBCFF0];
      v7 = (void *)MEMORY[0x1E0CB37E8];
      -[AXMPipelineContextInput pixelBuffer](self->_sourceInput, "pixelBuffer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberWithUnsignedInt:", objc_msgSend(v8, "orientation"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0C9DDC8];
      -[AXMPipelineContextInput pixelBuffer](self->_sourceInput, "pixelBuffer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageWithCVPixelBuffer:options:", objc_msgSend(v13, "pixelBuffer"), v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      result = v14;
      break;
    case 2:
      v15 = (void *)MEMORY[0x1E0C9DDC8];
      -[AXMPipelineContextInput URL](self->_sourceInput, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageWithContentsOfURL:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      result = v17;
      break;
    case 3:
      v18 = [AXMPhotoAssetData alloc];
      -[AXMPipelineContextInput phAssetLocalIdentifier](self->_sourceInput, "phAssetLocalIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMPipelineContextInput photoLibraryURL](self->_sourceInput, "photoLibraryURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[AXMPhotoAssetData initWithImageAssetLocalIdentifier:photoLibraryURL:allowsNetworkAccess:needsImageData:](v18, "initWithImageAssetLocalIdentifier:photoLibraryURL:allowsNetworkAccess:needsImageData:", v19, v20, 1, 1);

      v22 = objc_alloc(MEMORY[0x1E0C9DDC8]);
      -[AXMPhotoAssetData imageData](v21, "imageData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithData:", v23);

      result = v24;
      break;
    default:
      return 0;
  }
  return result;
}

- (AXMPipelineContextInput)sourceInput
{
  return self->_sourceInput;
}

- (void)addAuxiliaryDetector:(id)a3
{
  id v4;
  NSMutableOrderedSet *auxiliaryDetectors;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  id v8;

  v4 = a3;
  auxiliaryDetectors = self->_auxiliaryDetectors;
  v8 = v4;
  if (!auxiliaryDetectors)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v6 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_auxiliaryDetectors;
    self->_auxiliaryDetectors = v6;

    v4 = v8;
    auxiliaryDetectors = self->_auxiliaryDetectors;
  }
  -[NSMutableOrderedSet addObject:](auxiliaryDetectors, "addObject:", v4);

}

- (id)auxiliaryDetectors
{
  return self->_auxiliaryDetectors;
}

- (void)removeAllAuxiliaryDetectors
{
  -[NSMutableOrderedSet removeAllObjects](self->_auxiliaryDetectors, "removeAllObjects");
}

- (AXMetricContainer)pipelineMetric
{
  AXBookendMetric *piplelineMetric;
  NSObject *v4;

  piplelineMetric = self->_piplelineMetric;
  if (!piplelineMetric)
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[AXMVisionPipelineContext pipelineMetric].cold.1(v4);

    piplelineMetric = self->_piplelineMetric;
  }
  return piplelineMetric;
}

- (void)willBeginProcessingContext
{
  AXBookendMetric *v3;
  AXBookendMetric *piplelineMetric;
  id v5;

  -[AXMVisionPipelineContext metricSession](self, "metricSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startMeasure:", CFSTR("Pipeline"));
  v3 = (AXBookendMetric *)objc_claimAutoreleasedReturnValue();
  piplelineMetric = self->_piplelineMetric;
  self->_piplelineMetric = v3;

}

- (void)didFinishProcessingContext
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "metricSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateReport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);

}

- (BOOL)shouldProcessRemotely
{
  return self->_shouldProcessRemotely;
}

- (void)setShouldProcessRemotely:(BOOL)a3
{
  self->_shouldProcessRemotely = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (AXMVisionAnalysisOptions)analysisOptions
{
  return self->_analysisOptions;
}

- (void)setAnalysisOptions:(id)a3
{
  objc_storeStrong((id *)&self->_analysisOptions, a3);
}

- (NSArray)effectiveTextDetectionLocales
{
  return self->_effectiveTextDetectionLocales;
}

- (void)setEffectiveTextDetectionLocales:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveTextDetectionLocales, a3);
}

- (void)setVisionImageRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_visionImageRequestHandler, a3);
}

- (int64_t)imageRegistrationState
{
  return self->_imageRegistrationState;
}

- (void)setImageRegistrationState:(int64_t)a3
{
  self->_imageRegistrationState = a3;
}

- (NSSecureCoding)userContext
{
  return self->_userContext;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSCopying)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (BOOL)shouldCallCompletionHandlersForEngineBusyError
{
  return self->_shouldCallCompletionHandlersForEngineBusyError;
}

- (void)setShouldCallCompletionHandlersForEngineBusyError:(BOOL)a3
{
  self->_shouldCallCompletionHandlersForEngineBusyError = a3;
}

- (BOOL)shouldCallCompletionHandlersForEmptyResultSet
{
  return self->_shouldCallCompletionHandlersForEmptyResultSet;
}

- (void)setShouldCallCompletionHandlersForEmptyResultSet:(BOOL)a3
{
  self->_shouldCallCompletionHandlersForEmptyResultSet = a3;
}

- (BOOL)evaluationExclusivelyUsesVisionFramework
{
  return self->_evaluationExclusivelyUsesVisionFramework;
}

- (void)setEvaluationExclusivelyUsesVisionFramework:(BOOL)a3
{
  self->_evaluationExclusivelyUsesVisionFramework = a3;
}

- (unint64_t)sequenceID
{
  return self->_sequenceID;
}

- (void)setSequenceID:(unint64_t)a3
{
  self->_sequenceID = a3;
}

- (AXMetricSession)metricSession
{
  return self->_metricSession;
}

- (void)setMetricSession:(id)a3
{
  objc_storeStrong((id *)&self->_metricSession, a3);
}

- (NSMutableArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (NSMutableSet)evaluatedFeatureTypes
{
  return self->_evaluatedFeatureTypes;
}

- (void)setEvaluatedFeatureTypes:(id)a3
{
  objc_storeStrong((id *)&self->_evaluatedFeatureTypes, a3);
}

- (NSNumber)appliedImageOrientation
{
  return self->_appliedImageOrientation;
}

- (void)setAppliedImageOrientation:(id)a3
{
  objc_storeStrong((id *)&self->_appliedImageOrientation, a3);
}

- (AXMSequenceRequestManager)sequenceRequestManager
{
  return self->_sequenceRequestManager;
}

- (void)setSequenceRequestManager:(id)a3
{
  objc_storeStrong((id *)&self->_sequenceRequestManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceRequestManager, 0);
  objc_storeStrong((id *)&self->_appliedImageOrientation, 0);
  objc_storeStrong((id *)&self->_evaluatedFeatureTypes, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_metricSession, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_visionImageRequestHandler, 0);
  objc_storeStrong((id *)&self->_effectiveTextDetectionLocales, 0);
  objc_storeStrong((id *)&self->_analysisOptions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_auxiliaryDetectors, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisDetectedSceneClassifications, 0);
  objc_storeStrong((id *)&self->_detectedSceneClassifications, 0);
  objc_storeStrong((id *)&self->_sceneObservationQueue, 0);
  objc_storeStrong((id *)&self->_sceneObservation, 0);
  objc_storeStrong((id *)&self->_piplelineMetric, 0);
  objc_storeStrong((id *)&self->_resultHandlers, 0);
  objc_storeStrong((id *)&self->_sourceParameters, 0);
  objc_storeStrong((id *)&self->_sourceInput, 0);
}

- (void)setUserContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_fault_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_FAULT, "userContext class %@ not in AXMSecureCodingClasses()", (uint8_t *)&v4, 0xCu);

}

- (void)pipelineMetric
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_FAULT, "pipelineMetric accessed before being created. This will certainly lead to unexpected behavior", v1, 2u);
}

@end

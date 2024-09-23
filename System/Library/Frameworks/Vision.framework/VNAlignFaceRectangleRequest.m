@implementation VNAlignFaceRectangleRequest

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(3000, self);
}

- (VNAlignFaceRectangleRequest)initWithFaceObservations:(id)a3
{
  return -[VNAlignFaceRectangleRequest initWithFaceObservations:completionHandler:](self, "initWithFaceObservations:completionHandler:", a3, 0);
}

- (VNAlignFaceRectangleRequest)initWithFaceObservations:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  VNAlignFaceRectangleRequest *v8;
  uint64_t v9;
  NSArray *inputFaceObservations;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (+[VNValidationUtilities validateRequiredFaceObservations:error:](VNValidationUtilities, "validateRequiredFaceObservations:error:", v6, 0))
  {
    v12.receiver = self;
    v12.super_class = (Class)VNAlignFaceRectangleRequest;
    v8 = -[VNRequest initWithCompletionHandler:](&v12, sel_initWithCompletionHandler_, v7);
    if (v8)
    {
      v9 = objc_msgSend(v6, "copy");
      inputFaceObservations = v8->_inputFaceObservations;
      v8->_inputFaceObservations = (NSArray *)v9;

      self = v8;
      v8 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)newDuplicateInstance
{
  id v3;
  NSArray *inputFaceObservations;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  inputFaceObservations = self->_inputFaceObservations;
  -[VNRequest completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFaceObservations:completionHandler:", inputFaceObservations, v5);

  return v6;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  uint64_t v22;

  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing Align Face Rectangle request\n"), v9, v10, v11, v12, v13, v14, v22);
  -[VNAlignFaceRectangleRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", a3, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_9;
  if (!self->_inputFaceObservations)
  {
    if (a5)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 7, CFSTR("Input faces not provided to face rectangle aligner"));
      v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_9:
    v20 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v8, "session");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a3, v16);
    -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", self->_inputFaceObservations, a3, v15, v18, &__block_literal_global_27848, &__block_literal_global_37_27849, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), v8, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 != 0;
    if (v19)
      -[VNRequest setResults:](self, "setResults:", v19);

  }
  else
  {
    v20 = 0;
  }

LABEL_12:
  return v20;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNFaceBoxAlignerType");
  return CFSTR("VNFaceBoxAlignerType");
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char IsSubsetOfFaceObservationsCollection;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  -[VNAlignFaceRectangleRequest inputFaceObservations](self, "inputFaceObservations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputFaceObservations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IsSubsetOfFaceObservationsCollection = VNFaceObservationsCollectionIsSubsetOfFaceObservationsCollection(v5, v6);

  if ((IsSubsetOfFaceObservationsCollection & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)VNAlignFaceRectangleRequest;
    v8 = -[VNRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v10, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)inputFaceObservations
{
  return self->_inputFaceObservations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFaceObservations, 0);
}

uint64_t __71__VNAlignFaceRectangleRequest_internalPerformRevision_inContext_error___block_invoke_2()
{
  return 0;
}

uint64_t __71__VNAlignFaceRectangleRequest_internalPerformRevision_inContext_error___block_invoke()
{
  return 1;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end

@implementation VNGenerateImageSegmentationRequest

- (VNGenerateImageSegmentationRequest)init
{
  VNGenerateImageSegmentationRequest *v2;
  VNFgBgE5MLInstanceSegmenterThresholds *v3;
  float v4;
  VNGenerateImageSegmentationRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNGenerateImageSegmentationRequest;
  v2 = -[VNRequest init](&v7, sel_init);
  if (v2)
  {
    v3 = -[VNFgBgE5MLInstanceSegmenterThresholds initWithRevision:error:]([VNFgBgE5MLInstanceSegmenterThresholds alloc], "initWithRevision:error:", 1, 0);
    -[VNFgBgE5MLInstanceSegmenterThresholds defaultValidMinimumMaskPixelCount](v3, "defaultValidMinimumMaskPixelCount");
    v2->_minimumMaskPixelCount = (unint64_t)v4;
    v5 = v2;

  }
  return v2;
}

- (void)setTargetPoints:(id)a3
{
  NSArray *v4;
  NSArray *targetPoints;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  targetPoints = self->_targetPoints;
  self->_targetPoints = v4;

}

- (NSArray)targetPoints
{
  return self->_targetPoints;
}

- (int64_t)maximumTargetPoints
{
  objc_class *v2;
  id v3;
  id v5;

  v5 = 0;
  v2 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", &v5, -[VNRequest resolvedRevision](self, "resolvedRevision"), 0);
  v3 = v5;
  if (v2)
  {
    if (-[objc_class isSubclassOfClass:](v2, "isSubclassOfClass:", objc_opt_class()))
      v2 = (objc_class *)-[objc_class maximumTargetPoints](v2, "maximumTargetPoints");
    else
      v2 = 0;
  }

  return (int64_t)v2;
}

- (id)supportedFeaturesAndReturnError:(id *)a3
{
  unint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v10;

  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  v10 = 0;
  v6 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", &v10, v5, a3);
  v7 = v10;
  if (!v6)
    goto LABEL_6;
  if (!-[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()))
  {
    if (a3)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v5, self);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  -[objc_class supportedFeaturesForOptions:error:](v6, "supportedFeaturesForOptions:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNGenerateImageSegmentationRequest;
  return -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v5, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v7;
  __CFString *v8;
  void *v9;

  if (!+[VNImageSegmenter supportsExecution](VNImageSegmenter, "supportsExecution"))
  {
    if (a4)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 22, CFSTR("Requires newer ANE device"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v7 = 0;
      *a4 = v9;
      return v7;
    }
LABEL_9:
    v7 = 0;
    return v7;
  }
  if (a3 != 1)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v7 = CFSTR("VNImageSegmenterType");
  v8 = CFSTR("VNImageSegmenterType");
  return v7;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v21, a3, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  if (v10)
  {
    objc_msgSend(v8, "imageBufferAndReturnError:", a5);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      v22[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[VNGenerateImageSegmentationRequest disableConnectedComponentRefinement](self, "disableConnectedComponentRefinement"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("disableCCRefinement"));

      objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_targetPoints, CFSTR("targetPts"));
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[VNGenerateImageSegmentationRequest minimumMaskPixelCount](self, "minimumMaskPixelCount"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("minMask"));

      v17 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v10, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v17, v11, self, a5, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 != 0;
      if (v18)
        -[VNRequest setResults:](self, "setResults:", v18);

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)disableConnectedComponentRefinement
{
  return self->_disableConnectedComponentRefinement;
}

- (void)setDisableConnectedComponentRefinement:(BOOL)a3
{
  self->_disableConnectedComponentRefinement = a3;
}

- (unint64_t)minimumMaskPixelCount
{
  return self->_minimumMaskPixelCount;
}

- (void)setMinimumMaskPixelCount:(unint64_t)a3
{
  self->_minimumMaskPixelCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPoints, 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (void)downloadModelForTests:(id)a3
{
  VNModelCatalogBridgingInterface *v3;
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  v3 = objc_alloc_init(VNModelCatalogBridgingInterface);
  -[VNModelCatalogBridgingInterface foregroundBackgroundSegmentationModelBundleURLWithError:](v3, "foregroundBackgroundSegmentationModelBundleURLWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5[2](v5, 0);
  else
    -[VNModelCatalogBridgingInterface downloadForegroundBackgroundSegmentationModelBundleWithCompletionHandler:](v3, "downloadForegroundBackgroundSegmentationModelBundleWithCompletionHandler:", v5);

}

@end

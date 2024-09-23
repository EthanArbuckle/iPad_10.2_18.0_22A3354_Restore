@implementation VNDetectFaceRectanglesRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v5;
  __CFString *v6;

  if ((uint64_t)a3 <= 3737841664)
  {
    if (a3 - 1 >= 2)
    {
      if (a3 != 3 && a3 != 3737841664)
        goto LABEL_12;
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  if (a3 - 3737841666u < 5)
  {
LABEL_7:
    v5 = CFSTR("VNANFDMultiDetectorType");
LABEL_10:
    v6 = v5;
    return v5;
  }
  if (a3 == 3737841665)
  {
LABEL_9:
    v5 = CFSTR("VNFaceDetectorType");
    goto LABEL_10;
  }
LABEL_12:
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNDetectFaceRectanglesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectFaceRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNDetectFaceRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_116);
  return (id)+[VNDetectFaceRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(2000, self);
}

void __65__VNDetectFaceRectanglesRequest_Revisioning__privateRevisionsSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 3737841665);
  objc_msgSend(v2, "addIndex:", 3737841664);
  objc_msgSend(v2, "addIndex:", 3737841666);
  objc_msgSend(v2, "addIndex:", 3737841668);
  objc_msgSend(v2, "addIndex:", 3737841669);
  if (+[VNANFDMultiDetectorANSTv1 supportsExecution](VNANFDMultiDetectorANSTv1, "supportsExecution"))
    objc_msgSend(v2, "addIndex:", 3737841667);
  objc_msgSend(v2, "addIndex:", 3737841670);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)+[VNDetectFaceRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
  +[VNDetectFaceRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = v0;

}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNDetectFaceRectanglesRequest;
  if (-[VNRequest warmUpSession:error:](&v11, sel_warmUpSession_error_, v6, a4))
  {
    -[VNDetectFaceRectanglesRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", -[VNRequest resolvedRevision](self, "resolvedRevision"), a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = (objc_msgSend(v7, "isEqualToString:", CFSTR("VNANFDMultiDetectorType")) & 1) != 0
        || -[VNRequest warmUpApplicableDetectorInSession:error:](self, "warmUpApplicableDetectorInSession:error:", v6, a4);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  objc_class *v30;
  id v31;
  objc_class *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing DetectFaceRectangles1 request\n"), v9, v10, v11, v12, v13, v14, v36);
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    && -[VNRequest validateImageBuffer:ofNonZeroWidth:andHeight:error:](self, "validateImageBuffer:ofNonZeroWidth:andHeight:error:", v15, 0, 0, a5))
  {
    objc_msgSend(v8, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v37, a3, v16, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v37;
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

        if (a3 == 3737841665)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNDetectFaceRectanglesRequest faceCoreType](self, "faceCoreType"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_Type"));

          -[VNDetectFaceRectanglesRequest faceCoreInitialAngle](self, "faceCoreInitialAngle");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_InitialAngle"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNDetectFaceRectanglesRequest faceCoreEnhanceEyesAndMouthLocalization](self, "faceCoreEnhanceEyesAndMouthLocalization"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_EnhanceEyesAndMouthLocalization"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNDetectFaceRectanglesRequest faceCoreExtractBlink](self, "faceCoreExtractBlink"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_ExtractBlink"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNDetectFaceRectanglesRequest faceCoreExtractSmile](self, "faceCoreExtractSmile"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_ExtractSmile"));

          -[VNDetectFaceRectanglesRequest faceCoreMinFaceSize](self, "faceCoreMinFaceSize");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_MinFaceSize"));

          -[VNDetectFaceRectanglesRequest faceCoreNumberOfDetectionAngles](self, "faceCoreNumberOfDetectionAngles");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, CFSTR("VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_NumberOfDetectionAngles"));

        }
        v27 = objc_msgSend(v8, "qosClass");
        -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
        objc_msgSend(v17, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v27, v18, self, a5, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          -[VNRequest setResults:](self, "setResults:", v28);
          v29 = 1;
        }
        else
        {
          v29 = 0;
        }
        goto LABEL_14;
      }
      if (a5)
      {
        v30 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", 0, a3, 0);
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v32 = (objc_class *)objc_opt_class();
        VNRequestRevisionString(v32, a3);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("%@ is handled by %@"), v33, v34);

        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v28);
        v29 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
    }
    v29 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v29 = 0;
LABEL_16:

  return v29;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNDetectFaceRectanglesRequest *v4;
  VNDetectFaceRectanglesRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = (VNDetectFaceRectanglesRequest *)a3;
  if (self != v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)VNDetectFaceRectanglesRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v9, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNDetectFaceRectanglesRequest setFaceCoreType:](self, "setFaceCoreType:", -[VNDetectFaceRectanglesRequest faceCoreType](v5, "faceCoreType"));
      -[VNDetectFaceRectanglesRequest faceCoreMinFaceSize](v5, "faceCoreMinFaceSize");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectFaceRectanglesRequest setFaceCoreMinFaceSize:](self, "setFaceCoreMinFaceSize:", v6);

      -[VNDetectFaceRectanglesRequest faceCoreNumberOfDetectionAngles](v5, "faceCoreNumberOfDetectionAngles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectFaceRectanglesRequest setFaceCoreNumberOfDetectionAngles:](self, "setFaceCoreNumberOfDetectionAngles:", v7);

      -[VNDetectFaceRectanglesRequest faceCoreInitialAngle](v5, "faceCoreInitialAngle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectFaceRectanglesRequest setFaceCoreInitialAngle:](self, "setFaceCoreInitialAngle:", v8);

      -[VNDetectFaceRectanglesRequest setFaceCoreEnhanceEyesAndMouthLocalization:](self, "setFaceCoreEnhanceEyesAndMouthLocalization:", -[VNDetectFaceRectanglesRequest faceCoreEnhanceEyesAndMouthLocalization](v5, "faceCoreEnhanceEyesAndMouthLocalization"));
      -[VNDetectFaceRectanglesRequest setFaceCoreExtractBlink:](self, "setFaceCoreExtractBlink:", -[VNDetectFaceRectanglesRequest faceCoreExtractBlink](v5, "faceCoreExtractBlink"));
      -[VNDetectFaceRectanglesRequest setFaceCoreExtractSmile:](self, "setFaceCoreExtractSmile:", -[VNDetectFaceRectanglesRequest faceCoreExtractSmile](v5, "faceCoreExtractSmile"));

    }
  }

}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v17;
  int v18;
  objc_super v19;

  v4 = a3;
  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  v6 = objc_msgSend(v4, "resolvedRevision");
  v7 = v6;
  if (v5 != 3737841665 && v6 != 3737841665)
  {
LABEL_3:
    if (((v7 - 3737841667) | (v5 - 3737841667u)) < 4)
    {
      v8 = 1;
      goto LABEL_17;
    }
    if (v5 - 3737841667u > 3 != (unint64_t)(v7 - 3737841667) < 4)
    {
      v19.receiver = self;
      v19.super_class = (Class)VNDetectFaceRectanglesRequest;
      v8 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v19, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
      goto LABEL_17;
    }
LABEL_15:
    v8 = 0;
    goto LABEL_17;
  }
  v8 = 0;
  if (v5 == 3737841665 && v6 == 3737841665)
  {
    v9 = -[VNDetectFaceRectanglesRequest faceCoreType](self, "faceCoreType");
    if (v9 != objc_msgSend(v4, "faceCoreType"))
      goto LABEL_15;
    -[VNDetectFaceRectanglesRequest faceCoreMinFaceSize](self, "faceCoreMinFaceSize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "faceCoreMinFaceSize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {
      -[VNDetectFaceRectanglesRequest faceCoreNumberOfDetectionAngles](self, "faceCoreNumberOfDetectionAngles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "faceCoreNumberOfDetectionAngles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {
        v14 = -[VNDetectFaceRectanglesRequest faceCoreEnhanceEyesAndMouthLocalization](self, "faceCoreEnhanceEyesAndMouthLocalization");
        if (v14 == objc_msgSend(v4, "faceCoreEnhanceEyesAndMouthLocalization"))
        {
          v15 = -[VNDetectFaceRectanglesRequest faceCoreExtractBlink](self, "faceCoreExtractBlink");
          if (v15 == objc_msgSend(v4, "faceCoreExtractBlink"))
          {
            v17 = -[VNDetectFaceRectanglesRequest faceCoreExtractSmile](self, "faceCoreExtractSmile");
            v18 = objc_msgSend(v4, "faceCoreExtractSmile");

            if (v17 != v18)
              goto LABEL_15;
            goto LABEL_3;
          }
        }
      }

      v11 = v10;
    }

    goto LABEL_15;
  }
LABEL_17:

  return v8;
}

- (void)setProcessedResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (-[VNRequest resolvedRevision](self, "resolvedRevision") == 1)
  {
    objc_msgSend(v4, "indexesOfObjectsPassingTest:", &__block_literal_global_22518);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v6, "removeObjectsAtIndexes:", v5);

      v4 = v6;
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)VNDetectFaceRectanglesRequest;
  -[VNRequest setProcessedResults:](&v7, sel_setProcessedResults_, v4);

}

- (unint64_t)faceCoreType
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "faceCoreType");

  return v3;
}

- (void)setFaceCoreType:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFaceCoreType:", a3);

}

- (NSNumber)faceCoreMinFaceSize
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceCoreMinFaceSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setFaceCoreMinFaceSize:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFaceCoreMinFaceSize:", v5);

}

- (NSNumber)faceCoreNumberOfDetectionAngles
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceCoreNumberOfDetectionAngles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setFaceCoreNumberOfDetectionAngles:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFaceCoreNumberOfDetectionAngles:", v5);

}

- (NSNumber)faceCoreInitialAngle
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceCoreInitialAngle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setFaceCoreInitialAngle:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFaceCoreInitialAngle:", v5);

}

- (BOOL)faceCoreEnhanceEyesAndMouthLocalization
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "faceCoreEnhanceEyesAndMouthLocalization");

  return v3;
}

- (void)setFaceCoreEnhanceEyesAndMouthLocalization:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFaceCoreEnhanceEyesAndMouthLocalization:", v3);

}

- (BOOL)faceCoreExtractBlink
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "faceCoreExtractBlink");

  return v3;
}

- (void)setFaceCoreExtractBlink:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFaceCoreExtractBlink:", v3);

}

- (BOOL)faceCoreExtractSmile
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "faceCoreExtractSmile");

  return v3;
}

- (void)setFaceCoreExtractSmile:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFaceCoreExtractSmile:", v3);

}

- (float)precisionRecallThreshold
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "precisionRecallThreshold");
  v4 = v3;

  return v4;
}

- (void)setPrecisionRecallThreshold:(float)a3
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setPrecisionRecallThreshold:", v4);

}

uint64_t __53__VNDetectFaceRectanglesRequest_setProcessedResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRevision1DetectedRectanglesCompatible") ^ 1;
}

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  return objc_msgSend(a3, "registerRequestClass:revision:equivalencyToRevision:error:", a1, 1, 2, a4);
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  return objc_msgSend(a1, "supportsAnyRevision:", a4);
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841664u < 7)
    return off_1E4546D00[a3 - 3737841664u];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VNDetectFaceRectanglesRequest;
  objc_msgSendSuper2(&v4, sel_descriptionForPrivateRevision_);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

@implementation VNGenerateAnimalSegmentationRequest

- (void)applyConfigurationOfRequest:(id)a3
{
  VNGenerateAnimalSegmentationRequest *v4;
  VNGenerateAnimalSegmentationRequest *v5;
  objc_super v6;

  v4 = (VNGenerateAnimalSegmentationRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNGenerateAnimalSegmentationRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNGenerateAnimalSegmentationRequest setQualityLevel:](self, "setQualityLevel:", -[VNGenerateAnimalSegmentationRequest qualityLevel](v5, "qualityLevel"));
      -[VNGenerateAnimalSegmentationRequest setOutputPixelFormat:](self, "setOutputPixelFormat:", -[VNGenerateAnimalSegmentationRequest outputPixelFormat](v5, "outputPixelFormat"));

    }
  }

}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  int64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  if (a3 == 1)
  {
    v6 = -[VNGenerateAnimalSegmentationRequest qualityLevel](self, "qualityLevel");
    if (v6 == 1)
    {
      v7 = CFSTR("VNE5RTSemanticSegmentationMultiGeneratorType");
      goto LABEL_8;
    }
    if (!v6)
    {
      v7 = CFSTR("VNGuidedUpsamplingGeneratorType");
LABEL_8:
      v8 = v7;
      return v7;
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VNGenerateAnimalSegmentationRequest qualityLevel](self, "qualityLevel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidOption:named:](VNError, "errorForInvalidOption:named:", v9, CFSTR("qualityLevel"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_11:
    v7 = 0;
    return v7;
  }
  if (!a4)
    goto LABEL_11;
  +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
  v7 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNGenerateAnimalSegmentationRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v8, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E459CFA0, CFSTR("VNSegmentationGeneratorProcessOption_ObjectClassIDs"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VNGenerateAnimalSegmentationRequest outputPixelFormat](self, "outputPixelFormat"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("VNSegmentationGeneratorProcessOption_OutputPixelFormat"));

  return v5;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  v5 = -[VNGenerateAnimalSegmentationRequest qualityLevel](self, "qualityLevel");
  if (v4)
    v6 = v4[19];
  else
    v6 = 0;
  if (v5 == v6
    && ((v7 = -[VNGenerateAnimalSegmentationRequest outputPixelFormat](self, "outputPixelFormat"), !v4)
      ? (v8 = 0)
      : (v8 = *((_DWORD *)v4 + 36)),
        v7 == v8))
  {
    v11.receiver = self;
    v11.super_class = (Class)VNGenerateAnimalSegmentationRequest;
    v9 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v11, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(1000, self);
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  void *v17;
  id v18;
  VNGenerateAnimalSegmentationRequest *v19;
  void *v20;
  id v21;
  __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  VNPixelBufferObservation *v35;
  void *v36;
  void *v37;
  void *v38;
  VNPixelBufferObservation *v39;
  void *v40;
  void *v41;
  id v42;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  VNGenerateAnimalSegmentationRequest *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  VNGenerateAnimalSegmentationRequest *v54;
  void *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend(v8, "session");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "qosClass");
    v52 = -[VNGenerateAnimalSegmentationRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a3, v50);
    v55 = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKeyedSubscript:", v10, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VNGenerateAnimalSegmentationRequest outputPixelFormat](self, "outputPixelFormat"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKeyedSubscript:", v11, CFSTR("VNSegmentationGeneratorProcessOption_OutputPixelFormat"));

    v12 = -[VNGenerateAnimalSegmentationRequest qualityLevel](self, "qualityLevel");
    if (v12)
    {
      if (v12 == 1)
      {
        if (a5)
        {
          v13 = 0;
          v14 = +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Balanced quality level is handled by compound request"));
LABEL_35:
          v15 = 0;
          goto LABEL_36;
        }
      }
      else if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VNGenerateAnimalSegmentationRequest qualityLevel](self, "qualityLevel"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = +[VNError errorForInvalidOption:named:](VNError, "errorForInvalidOption:named:", v26, CFSTR("qualityLevel"));

      }
      v15 = 0;
      v13 = 0;
LABEL_36:

      goto LABEL_37;
    }
    v45 = v50;
    v16 = v8;
    v46 = v52;
    v44 = v16;
    if (!self)
    {
      v13 = 0;
      goto LABEL_33;
    }
    v49 = objc_alloc_init(VNGenerateAnimalSegmentationRequest);
    -[VNGenerateAnimalSegmentationRequest applyConfigurationOfRequest:](v49, "applyConfigurationOfRequest:", self);
    -[VNGenerateAnimalSegmentationRequest setQualityLevel:](v49, "setQualityLevel:", 1);
    -[VNGenerateAnimalSegmentationRequest setOutputPixelFormat:](v49, "setOutputPixelFormat:", 1278226534);
    objc_msgSend(v16, "cachedObservationsAcceptedByRequest:", v49);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      -[VNGenerateAnimalSegmentationRequest setOutputPixelFormat:](v49, "setOutputPixelFormat:", 1278226534);
      objc_msgSend(v16, "requestPerformerAndReturnError:", a5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28
        || (v56[0] = v49,
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            v30 = objc_msgSend(v28, "performDependentRequests:onBehalfOfRequest:inContext:error:", v29, self, v16, a5),
            v29,
            (v30 & 1) == 0))
      {
        v48 = 0;
        v13 = 0;
LABEL_31:

        goto LABEL_32;
      }
      -[VNRequest results](v49, "results");
      v31 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v31;
    }
    v48 = v17;
    if (!objc_msgSend(v17, "count"))
    {
      v13 = (id)MEMORY[0x1E0C9AA60];
LABEL_32:

LABEL_33:
      if (!v13)
        goto LABEL_35;
      -[VNRequest setResults:](self, "setResults:", v13);
      v15 = 1;
      goto LABEL_36;
    }

    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __113__VNGenerateAnimalSegmentationRequest__internalPerformAccurateSession_inContext_qosClass_generatorOptions_error___block_invoke;
    v53[3] = &unk_1E45480C0;
    v19 = (VNGenerateAnimalSegmentationRequest *)v18;
    v54 = v19;
    v49 = v19;
    objc_msgSend(v48, "enumerateObjectsUsingBlock:", v53);
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v19, CFSTR("VNGuidedUpsamplingGeneratorOption_LowResImages"));
    objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_1E459CFB8, CFSTR("VNGuidedUpsamplingGeneratorOption_InputPixelFormat"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VNGenerateAnimalSegmentationRequest outputPixelFormat](self, "outputPixelFormat"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v20, CFSTR("VNGuidedUpsamplingGeneratorOption_OutputPixelFormat"));

    v21 = v45;
    v22 = CFSTR("VNGuidedUpsamplingGeneratorType");
    v23 = v46;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v23);
    objc_msgSend(v24, "removeObjectForKey:", CFSTR("VNSegmentationGeneratorProcessOption_OutputPixelFormat"));
    objc_msgSend(v21, "detectorOfType:configuredWithOptions:error:", CFSTR("VNGuidedUpsamplingGeneratorType"), v24, a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v25, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v9, v23, self, a5, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = 0;
    }

    if (v47)
    {
      v32 = objc_msgSend(v48, "count");
      if (objc_msgSend(v47, "count") == v32)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (v32)
        {
          for (i = 0; i != v32; ++i)
          {
            -[VNGenerateAnimalSegmentationRequest objectAtIndexedSubscript:](v49, "objectAtIndexedSubscript:", i);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = [VNPixelBufferObservation alloc];
            objc_msgSend(v34, "originatingRequestSpecifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "featureName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectAtIndexedSubscript:", i);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:](v35, "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v36, v37, objc_msgSend(v38, "pixelBuffer"));

            objc_msgSend(v48, "objectAtIndexedSubscript:", i);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "vn_cloneObject");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            -[VNDetectedObjectObservation setInstanceSegmentationMask:]((uint64_t)v41, v39);
            objc_msgSend(v13, "addObject:", v41);

          }
        }
        goto LABEL_30;
      }
      if (a5)
        v42 = +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Accurate observations count mismatch"));
    }
    v13 = 0;
LABEL_30:

    v28 = v54;
    goto LABEL_31;
  }
  v15 = 0;
LABEL_37:

  return v15;
}

- (int64_t)qualityLevel
{
  _QWORD *v2;
  int64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[19];
  else
    v3 = 0;

  return v3;
}

- (void)setQualityLevel:(int64_t)a3
{
  _QWORD *v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[19] = a3;

}

- (unsigned)outputPixelFormat
{
  _DWORD *v2;
  unsigned int v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[36];
  else
    v3 = 0;

  return v3;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  _DWORD *v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[36] = a3;

}

void __113__VNGenerateAnimalSegmentationRequest__internalPerformAccurateSession_inContext_qosClass_generatorOptions_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "instanceSegmentationMask");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNGenerateAnimalSegmentationRequest revisionAvailability]::revisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end

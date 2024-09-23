@implementation VNRemoveBackgroundRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNRemoveBackgroundProcessorType");
  return CFSTR("VNRemoveBackgroundProcessorType");
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNRemoveBackgroundRequest *v4;
  VNRemoveBackgroundRequest *v5;
  objc_super v6;

  v4 = (VNRemoveBackgroundRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNRemoveBackgroundRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNRemoveBackgroundRequest setPerformInPlace:](self, "setPerformInPlace:", -[VNRemoveBackgroundRequest performInPlace](v5, "performInPlace"));
      -[VNRemoveBackgroundRequest setCropResult:](self, "setCropResult:", -[VNRemoveBackgroundRequest cropResult](v5, "cropResult"));
      -[VNRemoveBackgroundRequest setReturnMask:](self, "setReturnMask:", -[VNRemoveBackgroundRequest returnMask](v5, "returnMask"));

    }
  }

}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v5 = -[VNRemoveBackgroundRequest performInPlace](self, "performInPlace");
  if (v5 == objc_msgSend(v4, "performInPlace")
    && (v6 = -[VNRemoveBackgroundRequest cropResult](self, "cropResult"),
        v6 == objc_msgSend(v4, "cropResult"))
    && (v7 = -[VNRemoveBackgroundRequest returnMask](self, "returnMask"),
        v7 == objc_msgSend(v4, "returnMask")))
  {
    v10.receiver = self;
    v10.super_class = (Class)VNRemoveBackgroundRequest;
    v8 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v10, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNRemoveBackgroundRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v10, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRemoveBackgroundRequest performInPlace](self, "performInPlace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("VNRemoveBackgroundProcessorOption_PerformInPlace"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRemoveBackgroundRequest cropResult](self, "cropResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("VNRemoveBackgroundProcessorOption_CropResult"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRemoveBackgroundRequest returnMask](self, "returnMask"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("VNRemoveBackgroundProcessorOption_ReturnMask"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("VNRemoveBackgroundProcessorOption_AlphaGating"));
  return v5;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  char v13;
  int v14;
  VNRemoveBackgroundRequest *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v26 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v26, a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v26;
    if (v23)
    {
      v27[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v10, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v11 = 0;
      v12 = 0;
      v25 = 1;
      while (1)
      {
        v13 = v11;
        v14 = *((unsigned __int8 *)&v25 + v12);
        v15 = objc_alloc_init(VNRemoveBackgroundRequest);
        -[VNRemoveBackgroundRequest applyConfigurationOfRequest:](v15, "applyConfigurationOfRequest:", self);
        -[VNRemoveBackgroundRequest setPerformInPlace:](v15, "setPerformInPlace:", 0);
        -[VNRemoveBackgroundRequest setCropResult:](v15, "setCropResult:", v14 != 0);
        -[VNRemoveBackgroundRequest setReturnMask:](v15, "setReturnMask:", 1);
        objc_msgSend(v8, "cachedObservationsAcceptedByRequest:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          break;

        v11 = 1;
        v12 = 1;
        if ((v13 & 1) != 0)
          goto LABEL_10;
      }
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v17, CFSTR("VNRemoveBackgroundProcessorOption_MaskObservation"));

LABEL_10:
      v19 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v23, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v19, v24, self, a5, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20 != 0;
      if (v20)
        -[VNRequest setResults:](self, "setResults:", v20);

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)performInPlace
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "performInPlace");

  return v3;
}

- (void)setPerformInPlace:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPerformInPlace:", v3);

}

- (BOOL)cropResult
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cropResult");

  return v3;
}

- (void)setCropResult:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCropResult:", v3);

}

- (BOOL)returnMask
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "returnMask");

  return v3;
}

- (void)setReturnMask:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnMask:", v3);

}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNRemoveBackgroundRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end

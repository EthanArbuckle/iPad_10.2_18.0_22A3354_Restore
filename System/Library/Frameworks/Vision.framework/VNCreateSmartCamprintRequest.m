@implementation VNCreateSmartCamprintRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNSmartCamClassifierType");
  return CFSTR("VNSmartCamClassifierType");
}

- (BOOL)returnAllResults
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "returnAllResults");

  return v3;
}

- (void)setReturnAllResults:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnAllResults:", v3);

}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = -[VNCreateSmartCamprintRequest returnAllResults](self, "returnAllResults");
  if (v5 == objc_msgSend(v4, "returnAllResults"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNCreateSmartCamprintRequest;
    v6 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNCreateSmartCamprintRequest *v4;
  objc_super v5;

  v4 = (VNCreateSmartCamprintRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNCreateSmartCamprintRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VNCreateSmartCamprintRequest setReturnAllResults:](self, "setReturnAllResults:", -[VNCreateSmartCamprintRequest returnAllResults](v4, "returnAllResults"));
  }

}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v19, a3, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    if (v11)
    {
      v20[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNCreateSmartCamprintRequest returnAllResults](self, "returnAllResults"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("VNSmartCamClassifierProcessOption_ReturnAllResults"));

      v15 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v12, self, a5, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 != 0;
      if (v16)
        -[VNRequest setResults:](self, "setResults:", v16);

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end

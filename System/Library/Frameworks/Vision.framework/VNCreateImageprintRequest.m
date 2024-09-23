@implementation VNCreateImageprintRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNImageprintGeneratorType");
  return CFSTR("VNImageprintGeneratorType");
}

- (NSNumber)timeStamp
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeStamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setTimeStamp:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    -[VNRequest configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeStamp:", v5);

  }
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  -[VNCreateImageprintRequest timeStamp](self, "timeStamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeStamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)VNCreateImageprintRequest;
    v8 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v10, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNCreateImageprintRequest *v4;
  void *v5;
  objc_super v6;

  v4 = (VNCreateImageprintRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNCreateImageprintRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNCreateImageprintRequest timeStamp](v4, "timeStamp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNCreateImageprintRequest setTimeStamp:](self, "setTimeStamp:", v5);

    }
  }

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
  uint64_t v21;
  void *v22;
  id v23;
  BOOL v24;
  id v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing Create imageprint request\n"), v9, v10, v11, v12, v13, v14, (uint64_t)v26);
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v8, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v27, a3, v16, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v27;
    if (v17)
    {
      -[VNCreateImageprintRequest timeStamp](self, "timeStamp");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("VNImageprintGeneratorProcessOption_Timestamp"));

      v28[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v21 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      v26 = 0;
      objc_msgSend(v17, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v21, v18, self, &v26, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v26;
      v24 = v22 != 0;
      if (v22)
      {
        -[VNRequest setResults:](self, "setResults:", v22);
      }
      else if (a5)
      {
        +[VNError errorWithCode:message:underlyingError:](VNError, "errorWithCode:message:underlyingError:", 3, CFSTR("Attempt to create an imageprint failed"), v23);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end

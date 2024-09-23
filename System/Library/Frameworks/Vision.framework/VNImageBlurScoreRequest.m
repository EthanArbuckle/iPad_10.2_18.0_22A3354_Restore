@implementation VNImageBlurScoreRequest

- (unint64_t)blurDeterminationMethod
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "blurDeterminationMethod");

  return v3;
}

- (void)setBlurDeterminationMethod:(unint64_t)a3
{
  id v4;

  if (a3 <= 1)
  {
    -[VNRequest configuration](self, "configuration");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBlurDeterminationMethod:", a3);

  }
}

- (unint64_t)maximumIntermediateSideLength
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumIntermediateSideLength");

  return v3;
}

- (void)setMaximumIntermediateSideLength:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumIntermediateSideLength:", a3);

}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNBlurDetectorType");
    v5 = CFSTR("VNBlurDetectorType");
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v5 = -[VNImageBlurScoreRequest blurDeterminationMethod](self, "blurDeterminationMethod");
  if (v5 == objc_msgSend(v4, "blurDeterminationMethod")
    && (v6 = -[VNImageBlurScoreRequest maximumIntermediateSideLength](self, "maximumIntermediateSideLength"),
        v6 == objc_msgSend(v4, "maximumIntermediateSideLength")))
  {
    v9.receiver = self;
    v9.super_class = (Class)VNImageBlurScoreRequest;
    v7 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v9, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNImageBlurScoreRequest *v4;
  objc_super v5;

  v4 = (VNImageBlurScoreRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNImageBlurScoreRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNImageBlurScoreRequest setMaximumIntermediateSideLength:](self, "setMaximumIntermediateSideLength:", -[VNImageBlurScoreRequest maximumIntermediateSideLength](v4, "maximumIntermediateSideLength"));
      -[VNImageBlurScoreRequest setBlurDeterminationMethod:](self, "setBlurDeterminationMethod:", -[VNImageBlurScoreRequest blurDeterminationMethod](v4, "blurDeterminationMethod"));
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
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  uint64_t v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing VNImageBlurMetric request\n"), v9, v10, v11, v12, v13, v14, v26);
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
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[VNImageBlurScoreRequest maximumIntermediateSideLength](self, "maximumIntermediateSideLength"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("VNBlurDetectorProcessOption_MaximumIntermediateSideLength"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNImageBlurScoreRequest blurDeterminationMethod](self, "blurDeterminationMethod"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("VNBlurDetectorProcessOption_ImageBlurDeterminationMethod"));

      v28[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v22 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v17, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v22, v18, self, a5, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 != 0;
      if (v23)
        -[VNRequest setResults:](self, "setResults:", v23);

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

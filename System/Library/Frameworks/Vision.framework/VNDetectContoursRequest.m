@implementation VNDetectContoursRequest

- (void)applyConfigurationOfRequest:(id)a3
{
  VNDetectContoursRequest *v4;
  VNDetectContoursRequest *v5;
  void *v6;
  objc_super v7;

  v4 = (VNDetectContoursRequest *)a3;
  if (self != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)VNDetectContoursRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v7, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNDetectContoursRequest contrastAdjustment](v5, "contrastAdjustment");
      -[VNDetectContoursRequest setContrastAdjustment:](self, "setContrastAdjustment:");
      -[VNDetectContoursRequest contrastPivot](v5, "contrastPivot");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectContoursRequest setContrastPivot:](self, "setContrastPivot:", v6);

      -[VNDetectContoursRequest setDetectsDarkOnLight:](self, "setDetectsDarkOnLight:", -[VNDetectContoursRequest detectsDarkOnLight](v5, "detectsDarkOnLight"));
      -[VNDetectContoursRequest setMaximumImageDimension:](self, "setMaximumImageDimension:", -[VNDetectContoursRequest maximumImageDimension](v5, "maximumImageDimension"));
      -[VNDetectContoursRequest setInHierarchy:](self, "setInHierarchy:", -[VNDetectContoursRequest inHierarchy](v5, "inHierarchy"));
      -[VNDetectContoursRequest setForceUseInputCVPixelBufferDirectly:](self, "setForceUseInputCVPixelBufferDirectly:", -[VNDetectContoursRequest forceUseInputCVPixelBufferDirectly](v5, "forceUseInputCVPixelBufferDirectly"));

    }
  }

}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNContoursDetectorType");
    v5 = CFSTR("VNContoursDetectorType");
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

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  float v11;
  void *v13;
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
  uint64_t v26;
  void *v27;
  void *v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[VNDetectContoursRequest contrastPivot](self, "contrastPivot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "floatValue");
    if (v11 < 0.0 || v11 > 1.0)
    {
      if (a5)
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("contrastPivot property must be in the range [%f..%f]"), 0, 0x3FF0000000000000);
        +[VNError errorForInvalidOption:named:localizedDescription:](VNError, "errorForInvalidOption:named:localizedDescription:", v10, CFSTR("contrastPivot"), v13);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

        LOBYTE(a5) = 0;
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  else
  {
    v10 = &unk_1E459E5C8;
  }
  v14 = -[VNDetectContoursRequest maximumImageDimension](self, "maximumImageDimension");
  if (v14 > 63)
  {
    objc_msgSend(v8, "imageBufferAndReturnError:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v8, "session");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v30, a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v30;
      if (v17)
      {
        v31[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

        v20 = (void *)MEMORY[0x1E0CB37E8];
        -[VNDetectContoursRequest contrastAdjustment](self, "contrastAdjustment");
        objc_msgSend(v20, "numberWithFloat:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("VNContourDetectorProcessOption_ContrastAdjustment"));

        objc_msgSend(v18, "setObject:forKeyedSubscript:", v10, CFSTR("VNContourDetectorProcessOption_ContrastPivot"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNDetectContoursRequest detectsDarkOnLight](self, "detectsDarkOnLight"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("VNContourDetectorProcessOption_DetectDarkOnLight"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("VNContourDetectorProcessOption_MaximumImageDimension"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNDetectContoursRequest forceUseInputCVPixelBufferDirectly](self, "forceUseInputCVPixelBufferDirectly"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("VNContourDetectorProcessOption_ForceUseInputCVPixelBufferDirectly"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNDetectContoursRequest inHierarchy](self, "inHierarchy"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("VNContourDetectorProcessOption_InHierarchy"));

        v26 = objc_msgSend(v8, "qosClass");
        -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
        objc_msgSend(v17, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v26, v18, self, a5, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(a5) = v27 != 0;
        if (v27)
          -[VNRequest setResults:](self, "setResults:", v27);

      }
      else
      {
        LOBYTE(a5) = 0;
      }

    }
    else
    {
      LOBYTE(a5) = 0;
    }

  }
  else if (a5)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("maximumImageDimension property must be in the range [%lu..%lu]"), 64, 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInvalidOption:named:localizedDescription:](VNError, "errorForInvalidOption:named:localizedDescription:", v15, CFSTR("maximumImageDimension"), v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
LABEL_22:

  return (char)a5;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  NSUInteger v12;
  int v13;
  BOOL v14;
  objc_super v16;

  v4 = a3;
  -[VNDetectContoursRequest contrastAdjustment](self, "contrastAdjustment");
  v6 = v5;
  objc_msgSend(v4, "contrastAdjustment");
  if (v6 != v7)
    goto LABEL_6;
  -[VNDetectContoursRequest contrastPivot](self, "contrastPivot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contrastPivot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = VisionCoreEqualOrNilObjects();

  if ((v10 & 1) == 0)
    goto LABEL_6;
  v11 = -[VNDetectContoursRequest detectsDarkOnLight](self, "detectsDarkOnLight");
  if (v11 == objc_msgSend(v4, "detectsDarkOnLight")
    && (v12 = -[VNDetectContoursRequest maximumImageDimension](self, "maximumImageDimension"),
        v12 == objc_msgSend(v4, "maximumImageDimension"))
    && (v13 = -[VNDetectContoursRequest inHierarchy](self, "inHierarchy"),
        v13 == objc_msgSend(v4, "inHierarchy")))
  {
    v16.receiver = self;
    v16.super_class = (Class)VNDetectContoursRequest;
    v14 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v16, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
LABEL_6:
    v14 = 0;
  }

  return v14;
}

- (float)contrastAdjustment
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contrastAdjustment");
  v4 = v3;

  return v4;
}

- (void)setContrastAdjustment:(float)contrastAdjustment
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = contrastAdjustment;
  objc_msgSend(v5, "setContrastAdjustment:", v4);

}

- (NSNumber)contrastPivot
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contrastPivot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setContrastPivot:(NSNumber *)contrastPivot
{
  void *v4;
  NSNumber *v5;

  v5 = contrastPivot;
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContrastPivot:", v5);

}

- (BOOL)detectsDarkOnLight
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "detectsDarkOnLight");

  return v3;
}

- (void)setDetectsDarkOnLight:(BOOL)detectsDarkOnLight
{
  _BOOL8 v3;
  id v4;

  v3 = detectsDarkOnLight;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetectsDarkOnLight:", v3);

}

- (NSUInteger)maximumImageDimension
{
  void *v2;
  NSUInteger v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumImageDimension");

  return v3;
}

- (void)setMaximumImageDimension:(NSUInteger)maximumImageDimension
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumImageDimension:", maximumImageDimension);

}

- (BOOL)forceUseInputCVPixelBufferDirectly
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceUseInputCVPixelBufferDirectly");

  return v3;
}

- (void)setForceUseInputCVPixelBufferDirectly:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceUseInputCVPixelBufferDirectly:", v3);

}

- (BOOL)inHierarchy
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inHierarchy");

  return v3;
}

- (void)setInHierarchy:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInHierarchy:", v3);

}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end

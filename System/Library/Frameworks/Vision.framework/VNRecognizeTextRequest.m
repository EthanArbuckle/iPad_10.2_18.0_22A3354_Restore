@implementation VNRecognizeTextRequest

- (unint64_t)_CRImageReaderRevisionForRevision:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return qword_1A15F8D70[a3 - 1];
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 - 1 > 2)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
      v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = CFSTR("VNCRImageReaderDetectorType");
    v5 = CFSTR("VNCRImageReaderDetectorType");
  }
  return v4;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNRecognizeTextRequest *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = (VNRecognizeTextRequest *)a3;
  if (self != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)VNRecognizeTextRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v7, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNRecognizeTextRequest recognitionLanguages](v4, "recognitionLanguages");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNRecognizeTextRequest setRecognitionLanguages:](self, "setRecognitionLanguages:", v5);

      -[VNRecognizeTextRequest customWords](v4, "customWords");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNRecognizeTextRequest setCustomWords:](self, "setCustomWords:", v6);

      -[VNRecognizeTextRequest setRecognitionLevel:](self, "setRecognitionLevel:", -[VNRecognizeTextRequest recognitionLevel](v4, "recognitionLevel"));
      -[VNRecognizeTextRequest setUsesLanguageCorrection:](self, "setUsesLanguageCorrection:", -[VNRecognizeTextRequest usesLanguageCorrection](v4, "usesLanguageCorrection"));
      -[VNRecognizeTextRequest setAutomaticallyDetectsLanguage:](self, "setAutomaticallyDetectsLanguage:", -[VNRecognizeTextRequest automaticallyDetectsLanguage](v4, "automaticallyDetectsLanguage"));
      -[VNRecognizeTextRequest minimumTextHeight](v4, "minimumTextHeight");
      -[VNRecognizeTextRequest setMinimumTextHeight:](self, "setMinimumTextHeight:");
    }
  }

}

- (BOOL)hasCancellationHook
{
  return 1;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VNRecognizeTextRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v16, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  if (a3 - 1 <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRecognizeTextRequest recognitionLevel](self, "recognitionLevel") != VNRequestTextRecognitionLevelAccurate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("VNCRImageReaderDetectorCreationOption_FastRecognition"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E459CE38, CFSTR("VNCRImageReaderDetectorCreationOption_MaximumCandidatesCount"));
    -[VNRecognizeTextRequest recognitionLanguages](self, "recognitionLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("VNCRImageReaderDetectorCreationOption_RecognitionLanguages"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNRecognizeTextRequest _CRImageReaderRevisionForRevision:](self, "_CRImageReaderRevisionForRevision:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNCRImageReaderDetectorCreationOption_CRImageReaderRevisionKey"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", self, CFSTR("VNCRImageReaderDetectorProcessOption_OriginatingRequest"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRecognizeTextRequest usesLanguageCorrection](self, "usesLanguageCorrection") ^ 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("VNCRImageReaderDetectorCreationOption_DisableLanguageCorrection"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRecognizeTextRequest automaticallyDetectsLanguage](self, "automaticallyDetectsLanguage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("VNCRImageReaderDetectorCreationOption_UsesLanguageDetection"));

    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[VNRecognizeTextRequest minimumTextHeight](self, "minimumTextHeight");
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("VNCRImageReaderDetectorProcessOption_MinimumTextHeight"));

    -[VNRecognizeTextRequest customWords](self, "customWords");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("VNCRImageReaderDetectorCreationOption_CustomWords"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNCRImageReaderDetectorCreationOption_UsesCoreMode"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNCRImageReaderDetectorCreationOption_SkipVerticalText"));
  }
  return v6;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  VNRequestTextRecognitionLevel v11;
  int v12;
  int v13;
  float v14;
  float v15;
  float v16;
  BOOL v17;
  objc_super v19;

  v4 = a3;
  -[VNRecognizeTextRequest recognitionLanguages](self, "recognitionLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recognitionLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  if ((v7 & 1) == 0)
    goto LABEL_7;
  -[VNRecognizeTextRequest customWords](self, "customWords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customWords");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = VisionCoreEquivalentOrNilUnorderedArrays();

  if ((v10 & 1) == 0)
    goto LABEL_7;
  v11 = -[VNRecognizeTextRequest recognitionLevel](self, "recognitionLevel");
  if (v11 == objc_msgSend(v4, "recognitionLevel")
    && (v12 = -[VNRecognizeTextRequest usesLanguageCorrection](self, "usesLanguageCorrection"),
        v12 == objc_msgSend(v4, "usesLanguageCorrection"))
    && (v13 = -[VNRecognizeTextRequest automaticallyDetectsLanguage](self, "automaticallyDetectsLanguage"),
        v13 == objc_msgSend(v4, "automaticallyDetectsLanguage"))
    && (-[VNRecognizeTextRequest minimumTextHeight](self, "minimumTextHeight"),
        v15 = v14,
        objc_msgSend(v4, "minimumTextHeight"),
        v15 == v16))
  {
    v19.receiver = self;
    v19.super_class = (Class)VNRecognizeTextRequest;
    v17 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v19, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
LABEL_7:
    v17 = 0;
  }

  return v17;
}

- (void)setRecognitionLanguages:(NSArray *)recognitionLanguages
{
  void *v4;
  id v5;

  v5 = (id)-[NSArray copy](recognitionLanguages, "copy");
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecognitionLanguages:", v5);

}

- (NSArray)recognitionLanguages
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recognitionLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setCustomWords:(NSArray *)customWords
{
  void *v4;
  id v5;

  v5 = (id)-[NSArray copy](customWords, "copy");
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomWords:", v5);

}

- (NSArray)customWords
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customWords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setRecognitionLevel:(VNRequestTextRecognitionLevel)recognitionLevel
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecognitionLevel:", recognitionLevel);

}

- (VNRequestTextRecognitionLevel)recognitionLevel
{
  void *v2;
  VNRequestTextRecognitionLevel v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recognitionLevel");

  return v3;
}

- (void)setUsesLanguageCorrection:(BOOL)usesLanguageCorrection
{
  _BOOL8 v3;
  id v4;

  v3 = usesLanguageCorrection;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesLanguageCorrection:", v3);

}

- (BOOL)usesLanguageCorrection
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesLanguageCorrection");

  return v3;
}

- (void)setAutomaticallyDetectsLanguage:(BOOL)automaticallyDetectsLanguage
{
  _BOOL8 v3;
  id v4;

  v3 = automaticallyDetectsLanguage;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutomaticallyDetectsLanguage:", v3);

}

- (BOOL)automaticallyDetectsLanguage
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "automaticallyDetectsLanguage");

  return v3;
}

- (void)setMinimumTextHeight:(float)minimumTextHeight
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = minimumTextHeight;
  objc_msgSend(v5, "setMinimumTextHeight:", v4);

}

- (float)minimumTextHeight
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumTextHeight");
  v4 = v3;

  return v4;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VNRequestTextRecognitionLevel v9;
  _BOOL8 v10;
  _BOOL4 v11;
  float v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15.receiver = self;
  v15.super_class = (Class)VNRecognizeTextRequest;
  -[VNRequest sequencedRequestPreviousObservationsKey](&v15, sel_sequencedRequestPreviousObservationsKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRecognizeTextRequest recognitionLanguages](self, "recognitionLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _sequenceKeyComponentForArray(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRecognizeTextRequest customWords](self, "customWords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _sequenceKeyComponentForArray(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VNRecognizeTextRequest recognitionLevel](self, "recognitionLevel");
  v10 = -[VNRecognizeTextRequest usesLanguageCorrection](self, "usesLanguageCorrection");
  v11 = -[VNRecognizeTextRequest automaticallyDetectsLanguage](self, "automaticallyDetectsLanguage");
  -[VNRecognizeTextRequest minimumTextHeight](self, "minimumTextHeight");
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:%@:%p:%ld:%d:%d:%f"), v4, v6, v8, v9, v10, v11, v12);

  return v13;
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

      -[VNRequest detectorProgressHandler](self, "detectorProgressHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v12, self, a5, v14);
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

- (NSArray)supportedRecognitionLanguagesAndReturnError:(NSError *)error
{
  unint64_t v5;
  id v6;
  void *v7;

  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  v6 = -[VNRecognizeTextRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", v5, 0);
  if (v5 == 1)
  {
    v7 = &unk_1E459E210;
  }
  else
  {
    +[VNCRImageReaderDetector supportedLanguagesForProcessOptions:error:](VNCRImageReaderDetector, "supportedLanguagesForProcessOptions:error:", v6, error);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v7;
}

- (id)progressHandler
{
  return self->progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)indeterminate
{
  return self->indeterminate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->progressHandler, 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (NSArray)supportedRecognitionLanguagesForTextRecognitionLevel:(VNRequestTextRecognitionLevel)recognitionLevel revision:(NSUInteger)requestRevision error:(NSError *)error
{
  id v8;
  void *v9;

  v8 = objc_alloc_init((Class)a1);
  if ((objc_msgSend(v8, "setRevision:error:", requestRevision, error) & 1) != 0)
  {
    objc_msgSend(v8, "setRecognitionLevel:", recognitionLevel);
    objc_msgSend(v8, "supportedRecognitionLanguagesAndReturnError:", error);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return (NSArray *)v9;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNRecognizeTextRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end

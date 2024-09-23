@implementation VNRecognizeDocumentsRequest

- (VNRecognizeDocumentsRequest)initWithFrameAnalysisSpacing:(id *)a3 trackingLevelBlockType:(unint64_t)a4 completionHandler:(id)a5
{
  VNRecognizeDocumentsRequest *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  CRImageReaderTrackingSession *trackingSession;
  objc_super v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  v13 = *a3;
  v12.receiver = self;
  v12.super_class = (Class)VNRecognizeDocumentsRequest;
  v6 = -[VNStatefulRequest initWithFrameAnalysisSpacing:completionHandler:](&v12, sel_initWithFrameAnalysisSpacing_completionHandler_, &v13, a5);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0DBECB0]);
    if (a4 == 8)
      v8 = 2;
    else
      v8 = a4 == 4;
    v9 = objc_msgSend(v7, "initWithTrackingLevel:", v8);
    trackingSession = v6->_trackingSession;
    v6->_trackingSession = (CRImageReaderTrackingSession *)v9;

  }
  return v6;
}

- (BOOL)hasCancellationHook
{
  return 1;
}

- (unint64_t)_CRImageReaderRevisionForRevision:(unint64_t)a3
{
  if (a3 == 1)
    return 3;
  else
    return 0;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VNRecognizeDocumentsRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v24, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v7 = v6;
  if (a3 == 1)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", self, CFSTR("VNCRImageReaderForDocumentsDetectorProcessOption_OriginatingRequest"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRecognizeDocumentsRequest recognitionLevel](self, "recognitionLevel") != 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("VNCRImageReaderDetectorCreationOption_FastRecognition"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNRecognizeDocumentsRequest maximumCandidateCount](self, "maximumCandidateCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("VNCRImageReaderDetectorCreationOption_MaximumCandidatesCount"));

    -[VNRecognizeDocumentsRequest recognitionLanguages](self, "recognitionLanguages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("VNCRImageReaderDetectorCreationOption_RecognitionLanguages"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRecognizeDocumentsRequest usesLanguageDetection](self, "usesLanguageDetection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("VNCRImageReaderDetectorCreationOption_UsesLanguageDetection"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRecognizeDocumentsRequest usesAlternateLineGrouping](self, "usesAlternateLineGrouping"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("VNCRImageReaderDetectorCreationOption_UsesAlternateLineGrouping"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNRecognizeDocumentsRequest _CRImageReaderRevisionForRevision:](self, "_CRImageReaderRevisionForRevision:", 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("VNCRImageReaderDetectorCreationOption_CRImageReaderRevisionKey"));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("VNCRImageReaderDetectorCreationOption_UsesCoreMode"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("VNCRImageReaderDetectorCreationOption_SkipVerticalText"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRecognizeDocumentsRequest usesFormFieldDetection](self, "usesFormFieldDetection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("VNCRImageReaderDetectorProcessOption_UsesFormFieldDetection"));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", self, CFSTR("VNCRImageReaderDetectorProcessOption_OriginatingRequest"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRecognizeDocumentsRequest usesLanguageCorrection](self, "usesLanguageCorrection") ^ 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("VNCRImageReaderDetectorCreationOption_DisableLanguageCorrection"));

    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[VNRecognizeDocumentsRequest minimumTextHeight](self, "minimumTextHeight");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("VNCRImageReaderDetectorProcessOption_MinimumTextHeight"));

    -[VNRecognizeDocumentsRequest customWords](self, "customWords");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("VNCRImageReaderDetectorCreationOption_CustomWords"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNRecognizeDocumentsRequest detectionOnly](self, "detectionOnly"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("VNCRImageReaderForDocumentsDetectorProcessOption_DetectionOnly"));

    -[VNRecognizeDocumentsRequest inputTextBlocks](self, "inputTextBlocks");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[VNRecognizeDocumentsRequest inputTextBlocks](self, "inputTextBlocks");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("VNCRImageReaderForDocumentsDetectorProcessOption_TextObservationsToRecognize"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNRequest maximumProcessingDimensionOnTheLongSide](self, "maximumProcessingDimensionOnTheLongSide"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("VNCRImageReaderForDocumentsDetectorProcessOption_MaximumProcessingDimensionOnTheLongSide"));

  }
  return v7;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNCRImageReaderForDocumentsDetectorType");
    v5 = CFSTR("VNCRImageReaderForDocumentsDetectorType");
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
  int v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  int64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  float v18;
  float v19;
  float v20;
  BOOL v21;
  objc_super v23;

  v4 = a3;
  v5 = -[VNRecognizeDocumentsRequest detectionOnly](self, "detectionOnly");
  if (v5 != objc_msgSend(v4, "detectionOnly"))
    goto LABEL_11;
  v6 = -[VNRecognizeDocumentsRequest maximumCandidateCount](self, "maximumCandidateCount");
  if (v6 != objc_msgSend(v4, "maximumCandidateCount"))
    goto LABEL_11;
  -[VNRecognizeDocumentsRequest recognitionLanguages](self, "recognitionLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recognitionLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToArray:", v8);

  if ((v9 & 1) == 0)
    goto LABEL_11;
  -[VNRecognizeDocumentsRequest customWords](self, "customWords");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customWords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = VisionCoreEquivalentOrNilUnorderedArrays();

  if ((v12 & 1) == 0)
    goto LABEL_11;
  v13 = -[VNRecognizeDocumentsRequest recognitionLevel](self, "recognitionLevel");
  if (v13 != objc_msgSend(v4, "recognitionLevel"))
    goto LABEL_11;
  v14 = -[VNRecognizeDocumentsRequest usesLanguageCorrection](self, "usesLanguageCorrection");
  if (v14 == objc_msgSend(v4, "usesLanguageCorrection")
    && (v15 = -[VNRecognizeDocumentsRequest usesLanguageDetection](self, "usesLanguageDetection"),
        v15 == objc_msgSend(v4, "automaticallyDetectsLanguage"))
    && (v16 = -[VNRecognizeDocumentsRequest usesAlternateLineGrouping](self, "usesAlternateLineGrouping"),
        v16 == objc_msgSend(v4, "usesAlternateLineGrouping"))
    && (v17 = -[VNRecognizeDocumentsRequest usesFormFieldDetection](self, "usesFormFieldDetection"),
        v17 == objc_msgSend(v4, "usesFormFieldDetection"))
    && (-[VNRecognizeDocumentsRequest minimumTextHeight](self, "minimumTextHeight"),
        v19 = v18,
        objc_msgSend(v4, "minimumTextHeight"),
        v19 == v20))
  {
    v23.receiver = self;
    v23.super_class = (Class)VNRecognizeDocumentsRequest;
    v21 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v23, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
LABEL_11:
    v21 = 0;
  }

  return v21;
}

- (void)setRecognitionLanguages:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "copy");
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

- (void)setCustomWords:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "copy");
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

- (void)setRecognitionLevel:(int64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecognitionLevel:", a3);

}

- (int64_t)recognitionLevel
{
  void *v2;
  int64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recognitionLevel");

  return v3;
}

- (void)setUsesLanguageCorrection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
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

- (void)setUsesLanguageDetection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutomaticallyDetectsLanguage:", v3);

}

- (BOOL)usesLanguageDetection
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "automaticallyDetectsLanguage");

  return v3;
}

- (void)setUsesAlternateLineGrouping:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesAlternateLineGrouping:", v3);

}

- (BOOL)usesAlternateLineGrouping
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesAlternateLineGrouping");

  return v3;
}

- (void)setUsesFormFieldDetection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesFormFieldDetection:", v3);

}

- (BOOL)usesFormFieldDetection
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesFormFieldDetection");

  return v3;
}

- (void)setMinimumTextHeight:(float)a3
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
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

- (void)setDetectionOnly:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetectionOnly:", v3);

}

- (BOOL)detectionOnly
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "detectionOnly");

  return v3;
}

- (void)setMaximumCandidateCount:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumCandidateCount:", a3);

}

- (unint64_t)maximumCandidateCount
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumCandidateCount");

  return v3;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3;
  void *v4;
  NSArray *v5;
  void *v6;
  int64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL4 v11;
  float v12;
  void *v13;
  NSArray *v15;
  void *v16;
  objc_super v17;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v17.receiver = self;
  v17.super_class = (Class)VNRecognizeDocumentsRequest;
  -[VNRequest sequencedRequestPreviousObservationsKey](&v17, sel_sequencedRequestPreviousObservationsKey);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRecognizeDocumentsRequest recognitionLanguages](self, "recognitionLanguages");
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  _sequenceKeyComponentForArray(v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRecognizeDocumentsRequest customWords](self, "customWords");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  _sequenceKeyComponentForArray(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VNRecognizeDocumentsRequest recognitionLevel](self, "recognitionLevel");
  v8 = -[VNRecognizeDocumentsRequest usesLanguageCorrection](self, "usesLanguageCorrection");
  v9 = -[VNRecognizeDocumentsRequest usesLanguageDetection](self, "usesLanguageDetection");
  v10 = -[VNRecognizeDocumentsRequest usesAlternateLineGrouping](self, "usesAlternateLineGrouping");
  v11 = -[VNRecognizeDocumentsRequest usesFormFieldDetection](self, "usesFormFieldDetection");
  -[VNRecognizeDocumentsRequest minimumTextHeight](self, "minimumTextHeight");
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:%@:%p:%ld:%d:%d:%d:%d:%f"), v16, v4, v6, v7, v8, v9, v10, v11, v12);

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
  CRImageReaderTrackingSession *trackingSession;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v20, a3, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;
    if (v11)
    {
      v21[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      trackingSession = self->_trackingSession;
      if (trackingSession)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", trackingSession, CFSTR("VNCRImageReaderForDocumentsDetectorProcessOption_CRImageReaderTrackingSession"));
      -[VNRequest detectorProgressHandler](self, "detectorProgressHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v16, v12, self, a5, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 != 0;
      if (v17)
        -[VNRequest setResults:](self, "setResults:", v17);

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

- (id)supportedRecognitionLanguagesAndReturnError:(id *)a3
{
  id v4;
  void *v5;

  v4 = -[VNRecognizeDocumentsRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", -[VNRequest resolvedRevision](self, "resolvedRevision"), 0);
  +[VNCRImageReaderDetector supportedLanguagesForProcessOptions:error:](VNCRImageReaderDetector, "supportedLanguagesForProcessOptions:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)indeterminate
{
  return self->indeterminate;
}

- (id)progressHandler
{
  return self->progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)inputTextBlocks
{
  return self->inputTextBlocks;
}

- (void)setInputTextBlocks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (VNDetectBarcodesRequest)barcodeRequest
{
  return self->_barcodeRequest;
}

- (void)setBarcodeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_barcodeRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodeRequest, 0);
  objc_storeStrong((id *)&self->inputTextBlocks, 0);
  objc_storeStrong(&self->progressHandler, 0);
  objc_storeStrong((id *)&self->_trackingSession, 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)supportedRecognitionLanguagesForTextRecognitionLevel:(int64_t)a3 revision:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = objc_alloc_init((Class)a1);
  if ((objc_msgSend(v8, "setRevision:error:", a4, a5) & 1) != 0)
  {
    objc_msgSend(v8, "setRecognitionLevel:", a3);
    objc_msgSend(v8, "supportedRecognitionLanguagesAndReturnError:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end

@implementation AXMVisionAnalysisOptions

+ (id)defaultOptions
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v2, "setClientID:", 0);
  objc_msgSend(v2, "setIncludeImageInResult:", 0);
  +[AXMTextDetectionOptions defaultOptions](AXMTextDetectionOptions, "defaultOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextDetectionOptions:", v3);

  v4 = AXRuntimeCheck_MediaAnalysisSupport();
  if (v4)
  {
    objc_msgSend(v2, "setDetectMADCaptions:", 1);
    objc_msgSend(v2, "setDetectMADScenes:", 1);
    objc_msgSend(v2, "setDetectMADScenesNSFW:", 1);
    objc_msgSend(v2, "setDetectMADScenesSignificantEvents:", 1);
  }
  else
  {
    objc_msgSend(v2, "setDetectMADCaptions:", 0);
    objc_msgSend(v2, "setDetectMADScenes:", 0);
  }
  v5 = v4 ^ 1u;
  objc_msgSend(v2, "setDetectMADFace:", 0);
  objc_msgSend(v2, "setDetectCaptions:", v5);
  objc_msgSend(v2, "setDetectScenes:", v5);
  objc_msgSend(v2, "setDetectObjects:", v5);
  objc_msgSend(v2, "setDetectNSFW:", v5);
  objc_msgSend(v2, "setDetectSignificantEvents:", v5);
  objc_msgSend(v2, "setDetectProminentObjects:", 0);
  objc_msgSend(v2, "setDetectMADText:", 0);
  objc_msgSend(v2, "setDetectText:", 1);
  objc_msgSend(v2, "setDetectTraits:", 1);
  objc_msgSend(v2, "setDetectFaceRectangles:", 0);
  objc_msgSend(v2, "setDetectFaceNames:", 0);
  objc_msgSend(v2, "setDetectFaceAttributes:", 0);
  objc_msgSend(v2, "setDetectFaceExpressions:", 0);
  objc_msgSend(v2, "setDetectFaceLandmarks:", 0);
  objc_msgSend(v2, "setDetectFacePose:", 0);
  objc_msgSend(v2, "setDetectProminentObjects:", 1);
  objc_msgSend(v2, "setDetectHorizon:", 1);
  objc_msgSend(v2, "setDetectRectangles:", 1);
  objc_msgSend(v2, "setDetectIconClass:", 0);
  objc_msgSend(v2, "setDetectAXElements:", 0);
  return v2;
}

+ (id)voiceOverOptions
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v2, "setClientID:", 1);
  objc_msgSend(v2, "setIncludeImageInResult:", 0);
  +[AXMTextDetectionOptions defaultOptions](AXMTextDetectionOptions, "defaultOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextDetectionOptions:", v3);

  v4 = AXRuntimeCheck_MediaAnalysisSupport();
  objc_msgSend(v2, "setDetectMADCaptions:", 0);
  objc_msgSend(v2, "setDetectMADScenes:", v4);
  objc_msgSend(v2, "setDetectMADFace:", v4);
  objc_msgSend(v2, "setDetectCaptions:", 0);
  objc_msgSend(v2, "setDetectScenes:", v4 ^ 1);
  objc_msgSend(v2, "setDetectObjects:", v4 ^ 1);
  objc_msgSend(v2, "setDetectFaceRectangles:", v4 ^ 1);
  objc_msgSend(v2, "setDetectFaceNames:", v4 ^ 1);
  objc_msgSend(v2, "setDetectFaceAttributes:", v4 ^ 1);
  objc_msgSend(v2, "setDetectMADText:", 0);
  objc_msgSend(v2, "setDetectMADScenesNSFW:", 0);
  objc_msgSend(v2, "setDetectMADScenesSignificantEvents:", 0);
  objc_msgSend(v2, "setDetectText:", 1);
  objc_msgSend(v2, "setDetectModelClassifications:", 0);
  objc_msgSend(v2, "setDetectTraits:", 0);
  objc_msgSend(v2, "setDetectFaceExpressions:", 0);
  objc_msgSend(v2, "setDetectFaceLandmarks:", 0);
  objc_msgSend(v2, "setDetectFacePose:", 0);
  objc_msgSend(v2, "setDetectProminentObjects:", 0);
  objc_msgSend(v2, "setDetectHorizon:", 0);
  objc_msgSend(v2, "setDetectRectangles:", 0);
  objc_msgSend(v2, "setDetectIconClass:", 1);
  return v2;
}

- (BOOL)detectFaces
{
  return -[AXMVisionAnalysisOptions detectFaceRectangles](self, "detectFaceRectangles")
      || -[AXMVisionAnalysisOptions detectFaceNames](self, "detectFaceNames")
      || -[AXMVisionAnalysisOptions detectFaceAttributes](self, "detectFaceAttributes")
      || -[AXMVisionAnalysisOptions detectFaceExpressions](self, "detectFaceExpressions")
      || -[AXMVisionAnalysisOptions detectFaceLandmarks](self, "detectFaceLandmarks")
      || -[AXMVisionAnalysisOptions detectFacePose](self, "detectFacePose");
}

- (BOOL)hasDetectionsEnabled
{
  return -[AXMVisionAnalysisOptions detectText](self, "detectText")
      || -[AXMVisionAnalysisOptions detectFaceRectangles](self, "detectFaceRectangles")
      || -[AXMVisionAnalysisOptions detectFaceNames](self, "detectFaceNames")
      || -[AXMVisionAnalysisOptions detectFaceAttributes](self, "detectFaceAttributes")
      || -[AXMVisionAnalysisOptions detectFaceExpressions](self, "detectFaceExpressions")
      || -[AXMVisionAnalysisOptions detectFaceLandmarks](self, "detectFaceLandmarks")
      || -[AXMVisionAnalysisOptions detectFacePose](self, "detectFacePose")
      || -[AXMVisionAnalysisOptions detectScenes](self, "detectScenes")
      || -[AXMVisionAnalysisOptions detectObjects](self, "detectObjects")
      || -[AXMVisionAnalysisOptions detectModelClassifications](self, "detectModelClassifications")
      || -[AXMVisionAnalysisOptions detectCaptions](self, "detectCaptions")
      || -[AXMVisionAnalysisOptions detectTraits](self, "detectTraits")
      || -[AXMVisionAnalysisOptions detectRectangles](self, "detectRectangles")
      || -[AXMVisionAnalysisOptions detectHorizon](self, "detectHorizon")
      || -[AXMVisionAnalysisOptions detectProminentObjects](self, "detectProminentObjects")
      || -[AXMVisionAnalysisOptions detectAesthetics](self, "detectAesthetics")
      || -[AXMVisionAnalysisOptions detectIconClass](self, "detectIconClass")
      || -[AXMVisionAnalysisOptions detectBrailleEdges](self, "detectBrailleEdges")
      || -[AXMVisionAnalysisOptions detectAXElements](self, "detectAXElements")
      || -[AXMVisionAnalysisOptions detectMADCaptions](self, "detectMADCaptions")
      || -[AXMVisionAnalysisOptions detectMADScenes](self, "detectMADScenes")
      || -[AXMVisionAnalysisOptions detectMADFace](self, "detectMADFace")
      || -[AXMVisionAnalysisOptions detectMADText](self, "detectMADText");
}

- (void)disableAllDetectors
{
  -[AXMVisionAnalysisOptions setDetectText:](self, "setDetectText:", 0);
  -[AXMVisionAnalysisOptions setDetectFaceRectangles:](self, "setDetectFaceRectangles:", 0);
  -[AXMVisionAnalysisOptions setDetectFaceNames:](self, "setDetectFaceNames:", 0);
  -[AXMVisionAnalysisOptions setDetectFaceAttributes:](self, "setDetectFaceAttributes:", 0);
  -[AXMVisionAnalysisOptions setDetectFaceExpressions:](self, "setDetectFaceExpressions:", 0);
  -[AXMVisionAnalysisOptions setDetectFaceLandmarks:](self, "setDetectFaceLandmarks:", 0);
  -[AXMVisionAnalysisOptions setDetectFacePose:](self, "setDetectFacePose:", 0);
  -[AXMVisionAnalysisOptions setDetectScenes:](self, "setDetectScenes:", 0);
  -[AXMVisionAnalysisOptions setDetectObjects:](self, "setDetectObjects:", 0);
  -[AXMVisionAnalysisOptions setDetectModelClassifications:](self, "setDetectModelClassifications:", 0);
  -[AXMVisionAnalysisOptions setDetectCaptions:](self, "setDetectCaptions:", 0);
  -[AXMVisionAnalysisOptions setDetectTraits:](self, "setDetectTraits:", 0);
  -[AXMVisionAnalysisOptions setDetectRectangles:](self, "setDetectRectangles:", 0);
  -[AXMVisionAnalysisOptions setDetectHorizon:](self, "setDetectHorizon:", 0);
  -[AXMVisionAnalysisOptions setDetectProminentObjects:](self, "setDetectProminentObjects:", 0);
  -[AXMVisionAnalysisOptions setDetectAesthetics:](self, "setDetectAesthetics:", 0);
  -[AXMVisionAnalysisOptions setDetectIconClass:](self, "setDetectIconClass:", 0);
  -[AXMVisionAnalysisOptions setDetectBrailleEdges:](self, "setDetectBrailleEdges:", 0);
  -[AXMVisionAnalysisOptions setDetectAXElements:](self, "setDetectAXElements:", 0);
  -[AXMVisionAnalysisOptions setPreserveInputImageSize:](self, "setPreserveInputImageSize:", 0);
  -[AXMVisionAnalysisOptions setDetectMADCaptions:](self, "setDetectMADCaptions:", 0);
  -[AXMVisionAnalysisOptions setDetectMADScenes:](self, "setDetectMADScenes:", 0);
  -[AXMVisionAnalysisOptions setDetectMADFace:](self, "setDetectMADFace:", 0);
  -[AXMVisionAnalysisOptions setDetectMADText:](self, "setDetectMADText:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionAnalysisOptions)initWithCoder:(id)a3
{
  id v4;
  AXMVisionAnalysisOptions *v5;
  void *v6;
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
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AXMVisionAnalysisOptions;
  v5 = -[AXMVisionAnalysisOptions init](&v19, sel_init);
  if (v5)
  {
    -[AXMVisionAnalysisOptions setClientID:](v5, "setClientID:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientID")));
    -[AXMVisionAnalysisOptions setIncludeImageInResult:](v5, "setIncludeImageInResult:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeImageInResult")));
    -[AXMVisionAnalysisOptions setDetectText:](v5, "setDetectText:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectText")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textDetectionOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionAnalysisOptions setTextDetectionOptions:](v5, "setTextDetectionOptions:", v6);

    -[AXMVisionAnalysisOptions setDetectScenes:](v5, "setDetectScenes:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectScenes")));
    -[AXMVisionAnalysisOptions setDetectObjects:](v5, "setDetectObjects:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectObjects")));
    -[AXMVisionAnalysisOptions setDetectNSFW:](v5, "setDetectNSFW:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectNSFW")));
    -[AXMVisionAnalysisOptions setDetectSignificantEvents:](v5, "setDetectSignificantEvents:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectSignificantEvents")));
    -[AXMVisionAnalysisOptions setDetectModelClassifications:](v5, "setDetectModelClassifications:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectModelClassifications")));
    -[AXMVisionAnalysisOptions setDetectCaptions:](v5, "setDetectCaptions:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectCaptions")));
    -[AXMVisionAnalysisOptions setDetectTraits:](v5, "setDetectTraits:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectTraits")));
    -[AXMVisionAnalysisOptions setDetectFaceRectangles:](v5, "setDetectFaceRectangles:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectFaceRectangles")));
    -[AXMVisionAnalysisOptions setDetectFaceNames:](v5, "setDetectFaceNames:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectFaceNames")));
    -[AXMVisionAnalysisOptions setDetectFaceAttributes:](v5, "setDetectFaceAttributes:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectFaceAttributes")));
    -[AXMVisionAnalysisOptions setDetectFaceExpressions:](v5, "setDetectFaceExpressions:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectFaceExpressions")));
    -[AXMVisionAnalysisOptions setDetectFaceLandmarks:](v5, "setDetectFaceLandmarks:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectFaceLandmarks")));
    -[AXMVisionAnalysisOptions setDetectFacePose:](v5, "setDetectFacePose:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectFacePose")));
    -[AXMVisionAnalysisOptions setDetectHorizon:](v5, "setDetectHorizon:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectHorizon")));
    -[AXMVisionAnalysisOptions setDetectRectangles:](v5, "setDetectRectangles:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectRectangles")));
    -[AXMVisionAnalysisOptions setDetectProminentObjects:](v5, "setDetectProminentObjects:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectProminentObjects")));
    -[AXMVisionAnalysisOptions setDetectAesthetics:](v5, "setDetectAesthetics:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectAesthetics")));
    -[AXMVisionAnalysisOptions setDetectIconClass:](v5, "setDetectIconClass:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectIconClass")));
    -[AXMVisionAnalysisOptions setDetectBrailleEdges:](v5, "setDetectBrailleEdges:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectBrailleEdges")));
    AXMSecureCodingClasses();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("brailleEdgeOptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionAnalysisOptions setBrailleEdgeOptions:](v5, "setBrailleEdgeOptions:", v8);

    -[AXMVisionAnalysisOptions setDetectAXElements:](v5, "setDetectAXElements:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectAXElements")));
    AXMSecureCodingClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("equivalenceToken"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionAnalysisOptions setEquivalenceToken:](v5, "setEquivalenceToken:", v10);

    AXMSecureCodingClasses();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("ignoredLayerContextIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionAnalysisOptions setIgnoredLayerContextIDs:](v5, "setIgnoredLayerContextIDs:", v12);

    AXMSecureCodingClasses();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("includedLayerContextIDs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionAnalysisOptions setIncludedLayerContextIDs:](v5, "setIncludedLayerContextIDs:", v14);

    -[AXMVisionAnalysisOptions setPreserveInputImageSize:](v5, "setPreserveInputImageSize:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preserveInputImageSize")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredOutputLocale"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionAnalysisOptions setPreferredOutputLocale:](v5, "setPreferredOutputLocale:", v15);

    -[AXMVisionAnalysisOptions setDetectMADCaptions:](v5, "setDetectMADCaptions:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectMADCaptions")));
    -[AXMVisionAnalysisOptions setDetectMADScenes:](v5, "setDetectMADScenes:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectMADScenes")));
    -[AXMVisionAnalysisOptions setDetectMADFace:](v5, "setDetectMADFace:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectMADFace")));
    -[AXMVisionAnalysisOptions setDetectMADText:](v5, "setDetectMADText:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectMADText")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snapshotLayerID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionAnalysisOptions setSnapshotLayerID:](v5, "setSnapshotLayerID:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snapshotContextID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionAnalysisOptions setSnapshotContextID:](v5, "setSnapshotContextID:", v17);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMVisionAnalysisOptions clientID](self, "clientID"), CFSTR("clientID"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions includeImageInResult](self, "includeImageInResult"), CFSTR("includeImageInResult"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectText](self, "detectText"), CFSTR("detectText"));
  -[AXMVisionAnalysisOptions textDetectionOptions](self, "textDetectionOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("textDetectionOptions"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectScenes](self, "detectScenes"), CFSTR("detectScenes"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectObjects](self, "detectObjects"), CFSTR("detectObjects"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectNSFW](self, "detectNSFW"), CFSTR("detectNSFW"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectSignificantEvents](self, "detectSignificantEvents"), CFSTR("detectSignificantEvents"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectModelClassifications](self, "detectModelClassifications"), CFSTR("detectModelClassifications"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectCaptions](self, "detectCaptions"), CFSTR("detectCaptions"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectTraits](self, "detectTraits"), CFSTR("detectTraits"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFaceRectangles](self, "detectFaceRectangles"), CFSTR("detectFaceRectangles"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFaceNames](self, "detectFaceNames"), CFSTR("detectFaceNames"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFaceAttributes](self, "detectFaceAttributes"), CFSTR("detectFaceAttributes"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFaceExpressions](self, "detectFaceExpressions"), CFSTR("detectFaceExpressions"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFaceLandmarks](self, "detectFaceLandmarks"), CFSTR("detectFaceLandmarks"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFacePose](self, "detectFacePose"), CFSTR("detectFacePose"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectHorizon](self, "detectHorizon"), CFSTR("detectHorizon"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectRectangles](self, "detectRectangles"), CFSTR("detectRectangles"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectProminentObjects](self, "detectProminentObjects"), CFSTR("detectProminentObjects"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectAesthetics](self, "detectAesthetics"), CFSTR("detectAesthetics"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectIconClass](self, "detectIconClass"), CFSTR("detectIconClass"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectBrailleEdges](self, "detectBrailleEdges"), CFSTR("detectBrailleEdges"));
  -[AXMVisionAnalysisOptions brailleEdgeOptions](self, "brailleEdgeOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("brailleEdgeOptions"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectAXElements](self, "detectAXElements"), CFSTR("detectAXElements"));
  -[AXMVisionAnalysisOptions equivalenceToken](self, "equivalenceToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("equivalenceToken"));

  -[AXMVisionAnalysisOptions ignoredLayerContextIDs](self, "ignoredLayerContextIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ignoredLayerContextIDs"));

  -[AXMVisionAnalysisOptions includedLayerContextIDs](self, "includedLayerContextIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("includedLayerContextIDs"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions preserveInputImageSize](self, "preserveInputImageSize"), CFSTR("preserveInputImageSize"));
  -[AXMVisionAnalysisOptions preferredOutputLocale](self, "preferredOutputLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("preferredOutputLocale"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectMADCaptions](self, "detectMADCaptions"), CFSTR("detectMADCaptions"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectMADScenes](self, "detectMADScenes"), CFSTR("detectMADScenes"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectMADFace](self, "detectMADFace"), CFSTR("detectMADFace"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectMADText](self, "detectMADText"), CFSTR("detectMADText"));
  -[AXMVisionAnalysisOptions snapshotLayerID](self, "snapshotLayerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("snapshotLayerID"));

  -[AXMVisionAnalysisOptions snapshotContextID](self, "snapshotContextID");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("snapshotContextID"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("AXMVisionAnalysisOptions<%p>. Client: %ld\n"), self, -[AXMVisionAnalysisOptions clientID](self, "clientID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("  Detectors:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Traits: %ld\n"), -[AXMVisionAnalysisOptions detectTraits](self, "detectTraits"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Faces: %ld\n"), -[AXMVisionAnalysisOptions detectFaces](self, "detectFaces"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Text: %ld\n"), -[AXMVisionAnalysisOptions detectText](self, "detectText"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Scenes: %ld\n"), -[AXMVisionAnalysisOptions detectScenes](self, "detectScenes"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Objects: %ld\n"), -[AXMVisionAnalysisOptions detectObjects](self, "detectObjects"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    NSFW: %ld\n"), -[AXMVisionAnalysisOptions detectNSFW](self, "detectNSFW"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Significant Events: %ld\n"), -[AXMVisionAnalysisOptions detectSignificantEvents](self, "detectSignificantEvents"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Model Classifications: %ld\n"), -[AXMVisionAnalysisOptions detectModelClassifications](self, "detectModelClassifications"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Captions: %ld\n"), -[AXMVisionAnalysisOptions detectCaptions](self, "detectCaptions"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Prominent Objects: %ld\n"), -[AXMVisionAnalysisOptions detectProminentObjects](self, "detectProminentObjects"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Aesthetics: %ld\n"), -[AXMVisionAnalysisOptions detectAesthetics](self, "detectAesthetics"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Face names: %ld\n"), -[AXMVisionAnalysisOptions detectFaceNames](self, "detectFaceNames"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Face rectangles : %ld\n"), -[AXMVisionAnalysisOptions detectFaceRectangles](self, "detectFaceRectangles"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Face attributes : %ld\n"), -[AXMVisionAnalysisOptions detectFaceAttributes](self, "detectFaceAttributes"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Icon Classifications: %ld\n"), -[AXMVisionAnalysisOptions detectIconClass](self, "detectIconClass"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Braille Edges: %ld\n"), -[AXMVisionAnalysisOptions detectBrailleEdges](self, "detectBrailleEdges"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    AXElement Detection: %ld\n"), -[AXMVisionAnalysisOptions detectAXElements](self, "detectAXElements"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  Preserve Input Image Size: %ld\n"), -[AXMVisionAnalysisOptions preserveInputImageSize](self, "preserveInputImageSize"));
  -[AXMVisionAnalysisOptions preferredOutputLocale](self, "preferredOutputLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  Preferred Output Locale: %@\n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("  (MAD) Captions: %ld\n"), -[AXMVisionAnalysisOptions detectMADCaptions](self, "detectMADCaptions"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  (MAD) Scenes: %ld\n"), -[AXMVisionAnalysisOptions detectMADScenes](self, "detectMADScenes"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  (MAD) Faces: %ld\n"), -[AXMVisionAnalysisOptions detectMADFace](self, "detectMADFace"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  (MAD) OCR: %ld\n"), -[AXMVisionAnalysisOptions detectMADText](self, "detectMADText"));
  -[AXMVisionAnalysisOptions textDetectionOptions](self, "textDetectionOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v8);

  }
  return v3;
}

- (int64_t)clientID
{
  return self->_clientID;
}

- (void)setClientID:(int64_t)a3
{
  self->_clientID = a3;
}

- (BOOL)detectFaceRectangles
{
  return self->_detectFaceRectangles;
}

- (void)setDetectFaceRectangles:(BOOL)a3
{
  self->_detectFaceRectangles = a3;
}

- (BOOL)detectFaceNames
{
  return self->_detectFaceNames;
}

- (void)setDetectFaceNames:(BOOL)a3
{
  self->_detectFaceNames = a3;
}

- (BOOL)detectFaceAttributes
{
  return self->_detectFaceAttributes;
}

- (void)setDetectFaceAttributes:(BOOL)a3
{
  self->_detectFaceAttributes = a3;
}

- (BOOL)detectFaceExpressions
{
  return self->_detectFaceExpressions;
}

- (void)setDetectFaceExpressions:(BOOL)a3
{
  self->_detectFaceExpressions = a3;
}

- (BOOL)detectFaceLandmarks
{
  return self->_detectFaceLandmarks;
}

- (void)setDetectFaceLandmarks:(BOOL)a3
{
  self->_detectFaceLandmarks = a3;
}

- (BOOL)detectFacePose
{
  return self->_detectFacePose;
}

- (void)setDetectFacePose:(BOOL)a3
{
  self->_detectFacePose = a3;
}

- (BOOL)detectScenes
{
  return self->_detectScenes;
}

- (void)setDetectScenes:(BOOL)a3
{
  self->_detectScenes = a3;
}

- (BOOL)detectObjects
{
  return self->_detectObjects;
}

- (void)setDetectObjects:(BOOL)a3
{
  self->_detectObjects = a3;
}

- (BOOL)detectNSFW
{
  return self->_detectNSFW;
}

- (void)setDetectNSFW:(BOOL)a3
{
  self->_detectNSFW = a3;
}

- (BOOL)detectSignificantEvents
{
  return self->_detectSignificantEvents;
}

- (void)setDetectSignificantEvents:(BOOL)a3
{
  self->_detectSignificantEvents = a3;
}

- (BOOL)detectModelClassifications
{
  return self->_detectModelClassifications;
}

- (void)setDetectModelClassifications:(BOOL)a3
{
  self->_detectModelClassifications = a3;
}

- (BOOL)detectCaptions
{
  return self->_detectCaptions;
}

- (void)setDetectCaptions:(BOOL)a3
{
  self->_detectCaptions = a3;
}

- (BOOL)detectTraits
{
  return self->_detectTraits;
}

- (void)setDetectTraits:(BOOL)a3
{
  self->_detectTraits = a3;
}

- (BOOL)detectRectangles
{
  return self->_detectRectangles;
}

- (void)setDetectRectangles:(BOOL)a3
{
  self->_detectRectangles = a3;
}

- (BOOL)detectHorizon
{
  return self->_detectHorizon;
}

- (void)setDetectHorizon:(BOOL)a3
{
  self->_detectHorizon = a3;
}

- (BOOL)detectProminentObjects
{
  return self->_detectProminentObjects;
}

- (void)setDetectProminentObjects:(BOOL)a3
{
  self->_detectProminentObjects = a3;
}

- (BOOL)detectAesthetics
{
  return self->_detectAesthetics;
}

- (void)setDetectAesthetics:(BOOL)a3
{
  self->_detectAesthetics = a3;
}

- (BOOL)detectIconClass
{
  return self->_detectIconClass;
}

- (void)setDetectIconClass:(BOOL)a3
{
  self->_detectIconClass = a3;
}

- (BOOL)detectBrailleEdges
{
  return self->_detectBrailleEdges;
}

- (void)setDetectBrailleEdges:(BOOL)a3
{
  self->_detectBrailleEdges = a3;
}

- (AXMBrailleEdgeDetectorOptions)brailleEdgeOptions
{
  return self->_brailleEdgeOptions;
}

- (void)setBrailleEdgeOptions:(id)a3
{
  objc_storeStrong((id *)&self->_brailleEdgeOptions, a3);
}

- (BOOL)detectAXElements
{
  return self->_detectAXElements;
}

- (void)setDetectAXElements:(BOOL)a3
{
  self->_detectAXElements = a3;
}

- (NSData)equivalenceToken
{
  return self->_equivalenceToken;
}

- (void)setEquivalenceToken:(id)a3
{
  objc_storeStrong((id *)&self->_equivalenceToken, a3);
}

- (BOOL)detectMADCaptions
{
  return self->_detectMADCaptions;
}

- (void)setDetectMADCaptions:(BOOL)a3
{
  self->_detectMADCaptions = a3;
}

- (BOOL)detectMADScenes
{
  return self->_detectMADScenes;
}

- (void)setDetectMADScenes:(BOOL)a3
{
  self->_detectMADScenes = a3;
}

- (BOOL)detectMADScenesNSFW
{
  return self->_detectMADScenesNSFW;
}

- (void)setDetectMADScenesNSFW:(BOOL)a3
{
  self->_detectMADScenesNSFW = a3;
}

- (BOOL)detectMADScenesSignificantEvents
{
  return self->_detectMADScenesSignificantEvents;
}

- (void)setDetectMADScenesSignificantEvents:(BOOL)a3
{
  self->_detectMADScenesSignificantEvents = a3;
}

- (BOOL)detectMADFace
{
  return self->_detectMADFace;
}

- (void)setDetectMADFace:(BOOL)a3
{
  self->_detectMADFace = a3;
}

- (BOOL)detectMADText
{
  return self->_detectMADText;
}

- (void)setDetectMADText:(BOOL)a3
{
  self->_detectMADText = a3;
}

- (BOOL)detectText
{
  return self->_detectText;
}

- (void)setDetectText:(BOOL)a3
{
  self->_detectText = a3;
}

- (AXMTextDetectionOptions)textDetectionOptions
{
  return self->_textDetectionOptions;
}

- (void)setTextDetectionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_textDetectionOptions, a3);
}

- (BOOL)includeImageInResult
{
  return self->_includeImageInResult;
}

- (void)setIncludeImageInResult:(BOOL)a3
{
  self->_includeImageInResult = a3;
}

- (NSLocale)preferredOutputLocale
{
  return self->_preferredOutputLocale;
}

- (void)setPreferredOutputLocale:(id)a3
{
  objc_storeStrong((id *)&self->_preferredOutputLocale, a3);
}

- (NSArray)ignoredLayerContextIDs
{
  return self->_ignoredLayerContextIDs;
}

- (void)setIgnoredLayerContextIDs:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredLayerContextIDs, a3);
}

- (NSArray)includedLayerContextIDs
{
  return self->_includedLayerContextIDs;
}

- (void)setIncludedLayerContextIDs:(id)a3
{
  objc_storeStrong((id *)&self->_includedLayerContextIDs, a3);
}

- (NSNumber)snapshotLayerID
{
  return self->_snapshotLayerID;
}

- (void)setSnapshotLayerID:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotLayerID, a3);
}

- (NSNumber)snapshotContextID
{
  return self->_snapshotContextID;
}

- (void)setSnapshotContextID:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotContextID, a3);
}

- (BOOL)preserveInputImageSize
{
  return self->_preserveInputImageSize;
}

- (void)setPreserveInputImageSize:(BOOL)a3
{
  self->_preserveInputImageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotContextID, 0);
  objc_storeStrong((id *)&self->_snapshotLayerID, 0);
  objc_storeStrong((id *)&self->_includedLayerContextIDs, 0);
  objc_storeStrong((id *)&self->_ignoredLayerContextIDs, 0);
  objc_storeStrong((id *)&self->_preferredOutputLocale, 0);
  objc_storeStrong((id *)&self->_textDetectionOptions, 0);
  objc_storeStrong((id *)&self->_equivalenceToken, 0);
  objc_storeStrong((id *)&self->_brailleEdgeOptions, 0);
}

@end

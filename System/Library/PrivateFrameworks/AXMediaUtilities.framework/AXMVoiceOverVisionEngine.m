@implementation AXMVoiceOverVisionEngine

- (AXMVoiceOverVisionEngine)init
{
  AXMVoiceOverVisionEngine *v2;
  AXMVoiceOverVisionEngine *v3;
  AXMSceneDetectorNode *v4;
  AXMObjectDetectorNode *v5;
  AXMFaceDetectorNode *v6;
  AXMTraitDetectorNode *v7;
  AXMProminentObjectsDetectorNode *v8;
  AXMNSFWDetectorNode *v9;
  AXMSignificantEventDetectorNode *v10;
  AXMCaptionDetectorNode *v11;
  AXMMediaAnalysisSceneDetectorNode *v12;
  AXMMediaAnalysisFaceDetectorNode *v13;
  AXMMediaAnalysisCaptionDetectorNode *v14;
  AXMMediaAnalysisTextDetectorNode *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AXMVoiceOverVisionEngine;
  v2 = -[AXMAXElementVisionEngine initWithIdentifier:](&v17, sel_initWithIdentifier_, CFSTR("VoiceOver"));
  v3 = v2;
  if (v2)
  {
    -[AXMVisionEngine enableResultCachingWithCacheSize:](v2, "enableResultCachingWithCacheSize:", 10);
    -[AXMVisionEngine setMaximumQueueSize:](v3, "setMaximumQueueSize:", 1);
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v4 = -[AXMVisionEngineNode initWithIdentifier:]([AXMSceneDetectorNode alloc], "initWithIdentifier:", CFSTR("scene"));
      -[AXMSceneDetectorNode setTaxonomyOptions:](v4, "setTaxonomyOptions:", 7);
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v4);
      -[AXMVoiceOverVisionEngine setSceneDetector:](v3, "setSceneDetector:", v4);
    }
    else
    {
      v4 = 0;
    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v5 = -[AXMVisionEngineNode initWithIdentifier:]([AXMObjectDetectorNode alloc], "initWithIdentifier:", CFSTR("object"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v5);
      -[AXMVoiceOverVisionEngine setObjectDetector:](v3, "setObjectDetector:", v5);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v6 = -[AXMVisionEngineNode initWithIdentifier:]([AXMFaceDetectorNode alloc], "initWithIdentifier:", CFSTR("face"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v6);
      -[AXMVoiceOverVisionEngine setFaceDetector:](v3, "setFaceDetector:", v6);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v7 = -[AXMVisionEngineNode initWithIdentifier:]([AXMTraitDetectorNode alloc], "initWithIdentifier:", CFSTR("trait"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v7);
      -[AXMVoiceOverVisionEngine setTraitDetector:](v3, "setTraitDetector:", v7);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v8 = -[AXMVisionEngineNode initWithIdentifier:]([AXMProminentObjectsDetectorNode alloc], "initWithIdentifier:", CFSTR("prominentObjects"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v8);
      -[AXMVoiceOverVisionEngine setProminentObjectsDetector:](v3, "setProminentObjectsDetector:", v8);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v9 = -[AXMVisionEngineNode initWithIdentifier:]([AXMNSFWDetectorNode alloc], "initWithIdentifier:", CFSTR("NSFW"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v9);
      -[AXMVoiceOverVisionEngine setNsfwDetector:](v3, "setNsfwDetector:", v9);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v10 = -[AXMVisionEngineNode initWithIdentifier:]([AXMSignificantEventDetectorNode alloc], "initWithIdentifier:", CFSTR("SignificantEvent"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v10);
      -[AXMVoiceOverVisionEngine setSignificantEventDetector:](v3, "setSignificantEventDetector:", v10);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v11 = -[AXMVisionEngineNode initWithIdentifier:]([AXMCaptionDetectorNode alloc], "initWithIdentifier:", CFSTR("captions"));
      -[AXMCaptionDetectorNode setGenderStrategy:](v11, "setGenderStrategy:", 0);
      -[AXMCaptionDetectorNode setSceneDetector:](v11, "setSceneDetector:", v4);
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v11);
      -[AXMVoiceOverVisionEngine setCaptionDetector:](v3, "setCaptionDetector:", v11);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v12 = -[AXMVisionEngineNode initWithIdentifier:]([AXMMediaAnalysisSceneDetectorNode alloc], "initWithIdentifier:", CFSTR("mad-scene"));
      -[AXMMediaAnalysisSceneDetectorNode setTaxonomyOptions:](v12, "setTaxonomyOptions:", 7);
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v12);
      -[AXMVoiceOverVisionEngine setMadSceneDetector:](v3, "setMadSceneDetector:", v12);
    }
    else
    {
      v12 = 0;
    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v13 = -[AXMVisionEngineNode initWithIdentifier:]([AXMMediaAnalysisFaceDetectorNode alloc], "initWithIdentifier:", CFSTR("mad-face"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v13);
      -[AXMVoiceOverVisionEngine setMadFaceDetector:](v3, "setMadFaceDetector:", v13);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v14 = -[AXMVisionEngineNode initWithIdentifier:]([AXMMediaAnalysisCaptionDetectorNode alloc], "initWithIdentifier:", CFSTR("mad-captions"));
      -[AXMMediaAnalysisCaptionDetectorNode setSceneDetector:](v14, "setSceneDetector:", v12);
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v14);
      -[AXMVoiceOverVisionEngine setMadCaptionDetector:](v3, "setMadCaptionDetector:", v14);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v15 = -[AXMVisionEngineNode initWithIdentifier:]([AXMMediaAnalysisTextDetectorNode alloc], "initWithIdentifier:", CFSTR("mad-text"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v15);
      -[AXMVoiceOverVisionEngine setMadTextDetector:](v3, "setMadTextDetector:", v15);

    }
  }
  return v3;
}

- (AXMVoiceOverVisionEngine)initWithIdentifier:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("use init()"));
  return -[AXMVoiceOverVisionEngine init](self, "init");
}

- (unint64_t)genderStrategy
{
  void *v2;
  unint64_t v3;

  -[AXMVoiceOverVisionEngine captionDetector](self, "captionDetector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "genderStrategy");

  return v3;
}

- (void)setGenderStrategy:(unint64_t)a3
{
  id v4;

  -[AXMVoiceOverVisionEngine captionDetector](self, "captionDetector");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGenderStrategy:", a3);

}

- (id)configuredOptionsDisableAllDetectors:(id)a3 elementOptions:(unsigned int)a4 textRecognitionLevel:(id)a5 textDetectionLocales:(id)a6 preferringFullCaptions:(BOOL)a7
{
  _BOOL4 v7;
  unsigned int (**v11)(_QWORD);
  uint64_t (**v12)(_QWORD);
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;

  v7 = a7;
  v11 = (unsigned int (**)(_QWORD))a3;
  v12 = (uint64_t (**)(_QWORD))a5;
  v13 = (void (**)(_QWORD))a6;
  +[AXMVisionAnalysisOptions voiceOverOptions](AXMVisionAnalysisOptions, "voiceOverOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && v11[2](v11))
  {
    objc_msgSend(v14, "disableAllDetectors");
  }
  else
  {
    objc_msgSend(v14, "setDetectScenes:", 1);
    if (v7)
    {
      objc_msgSend(v14, "setDetectCaptions:", 1);
      if (AXRuntimeCheck_MediaAnalysisSupport())
      {
        objc_msgSend(v14, "setDetectMADScenes:", 1);
        objc_msgSend(v14, "setDetectMADCaptions:", 1);
        objc_msgSend(v14, "setDetectCaptions:", 0);
        objc_msgSend(v14, "setDetectScenes:", 0);
      }
      else
      {
        objc_msgSend(v14, "setDetectMADCaptions:", 0);
        objc_msgSend(v14, "setDetectMADScenes:", 0);
      }
    }
    else
    {
      objc_msgSend(v14, "setDetectCaptions:", 0);
      if (AXRuntimeCheck_MediaAnalysisSupport())
      {
        objc_msgSend(v14, "setDetectMADScenes:", 1);
        objc_msgSend(v14, "setDetectScenes:", 0);
      }
      else
      {
        objc_msgSend(v14, "setDetectMADScenes:", 0);
      }
      objc_msgSend(v14, "setDetectMADCaptions:", 0);
    }
    objc_msgSend(v14, "setDetectFaceRectangles:", objc_msgSend(v14, "detectFaceRectangles") & (a4 >> 1));
    objc_msgSend(v14, "setDetectFaceNames:", objc_msgSend(v14, "detectFaceNames") & (a4 >> 2));
    objc_msgSend(v14, "setDetectFaceAttributes:", objc_msgSend(v14, "detectFaceAttributes") & (a4 >> 3));
    objc_msgSend(v14, "setDetectFaceExpressions:", objc_msgSend(v14, "detectFaceExpressions") & (a4 >> 4));
    objc_msgSend(v14, "setDetectFaceLandmarks:", objc_msgSend(v14, "detectFaceLandmarks") & (a4 >> 5));
    objc_msgSend(v14, "setDetectFacePose:", objc_msgSend(v14, "detectFacePose") & (a4 >> 6));
    objc_msgSend(v14, "setDetectText:", a4 & objc_msgSend(v14, "detectText"));
    objc_msgSend(v14, "setDetectTraits:", objc_msgSend(v14, "detectTraits") & (a4 >> 7));
    objc_msgSend(v14, "setDetectScenes:", objc_msgSend(v14, "detectScenes") & (a4 >> 8));
    objc_msgSend(v14, "setDetectObjects:", objc_msgSend(v14, "detectObjects") & (a4 >> 12));
    objc_msgSend(v14, "setDetectCaptions:", objc_msgSend(v14, "detectCaptions") & (a4 >> 11));
    objc_msgSend(v14, "setDetectProminentObjects:", objc_msgSend(v14, "detectProminentObjects") & (a4 >> 10));
    if (objc_msgSend(v14, "detectText"))
    {
      objc_msgSend(v14, "textDetectionOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v15, "setRecognitionLevel:", v12[2](v12));
      if (v13)
      {
        v13[2](v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTextDetectionLocales:", v16);

      }
    }
  }

  return v14;
}

- (AXMSceneDetectorNode)sceneDetector
{
  return (AXMSceneDetectorNode *)objc_loadWeakRetained((id *)&self->_sceneDetector);
}

- (void)setSceneDetector:(id)a3
{
  objc_storeWeak((id *)&self->_sceneDetector, a3);
}

- (AXMObjectDetectorNode)objectDetector
{
  return (AXMObjectDetectorNode *)objc_loadWeakRetained((id *)&self->_objectDetector);
}

- (void)setObjectDetector:(id)a3
{
  objc_storeWeak((id *)&self->_objectDetector, a3);
}

- (AXMFaceDetectorNode)faceDetector
{
  return (AXMFaceDetectorNode *)objc_loadWeakRetained((id *)&self->_faceDetector);
}

- (void)setFaceDetector:(id)a3
{
  objc_storeWeak((id *)&self->_faceDetector, a3);
}

- (AXMTraitDetectorNode)traitDetector
{
  return (AXMTraitDetectorNode *)objc_loadWeakRetained((id *)&self->_traitDetector);
}

- (void)setTraitDetector:(id)a3
{
  objc_storeWeak((id *)&self->_traitDetector, a3);
}

- (AXMProminentObjectsDetectorNode)prominentObjectsDetector
{
  return (AXMProminentObjectsDetectorNode *)objc_loadWeakRetained((id *)&self->_prominentObjectsDetector);
}

- (void)setProminentObjectsDetector:(id)a3
{
  objc_storeWeak((id *)&self->_prominentObjectsDetector, a3);
}

- (AXMCaptionDetectorNode)captionDetector
{
  return (AXMCaptionDetectorNode *)objc_loadWeakRetained((id *)&self->_captionDetector);
}

- (void)setCaptionDetector:(id)a3
{
  objc_storeWeak((id *)&self->_captionDetector, a3);
}

- (AXMNSFWDetectorNode)nsfwDetector
{
  return (AXMNSFWDetectorNode *)objc_loadWeakRetained((id *)&self->_nsfwDetector);
}

- (void)setNsfwDetector:(id)a3
{
  objc_storeWeak((id *)&self->_nsfwDetector, a3);
}

- (AXMSignificantEventDetectorNode)significantEventDetector
{
  return (AXMSignificantEventDetectorNode *)objc_loadWeakRetained((id *)&self->_significantEventDetector);
}

- (void)setSignificantEventDetector:(id)a3
{
  objc_storeWeak((id *)&self->_significantEventDetector, a3);
}

- (AXMMediaAnalysisSceneDetectorNode)madSceneDetector
{
  return (AXMMediaAnalysisSceneDetectorNode *)objc_loadWeakRetained((id *)&self->_madSceneDetector);
}

- (void)setMadSceneDetector:(id)a3
{
  objc_storeWeak((id *)&self->_madSceneDetector, a3);
}

- (AXMMediaAnalysisFaceDetectorNode)madFaceDetector
{
  return (AXMMediaAnalysisFaceDetectorNode *)objc_loadWeakRetained((id *)&self->_madFaceDetector);
}

- (void)setMadFaceDetector:(id)a3
{
  objc_storeWeak((id *)&self->_madFaceDetector, a3);
}

- (AXMMediaAnalysisTextDetectorNode)madTextDetector
{
  return (AXMMediaAnalysisTextDetectorNode *)objc_loadWeakRetained((id *)&self->_madTextDetector);
}

- (void)setMadTextDetector:(id)a3
{
  objc_storeWeak((id *)&self->_madTextDetector, a3);
}

- (AXMMediaAnalysisCaptionDetectorNode)madCaptionDetector
{
  return (AXMMediaAnalysisCaptionDetectorNode *)objc_loadWeakRetained((id *)&self->_madCaptionDetector);
}

- (void)setMadCaptionDetector:(id)a3
{
  objc_storeWeak((id *)&self->_madCaptionDetector, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_madCaptionDetector);
  objc_destroyWeak((id *)&self->_madTextDetector);
  objc_destroyWeak((id *)&self->_madFaceDetector);
  objc_destroyWeak((id *)&self->_madSceneDetector);
  objc_destroyWeak((id *)&self->_significantEventDetector);
  objc_destroyWeak((id *)&self->_nsfwDetector);
  objc_destroyWeak((id *)&self->_captionDetector);
  objc_destroyWeak((id *)&self->_prominentObjectsDetector);
  objc_destroyWeak((id *)&self->_traitDetector);
  objc_destroyWeak((id *)&self->_faceDetector);
  objc_destroyWeak((id *)&self->_objectDetector);
  objc_destroyWeak((id *)&self->_sceneDetector);
}

@end

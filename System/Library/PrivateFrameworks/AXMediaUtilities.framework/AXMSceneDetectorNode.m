@implementation AXMSceneDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMSceneDetectorNode)initWithCoder:(id)a3
{
  id v4;
  AXMSceneDetectorNode *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXMSceneDetectorNode;
  v5 = -[AXMEvaluationNode initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_taxonomyOptions = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("taxonomyOptions"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXMSceneDetectorNode;
  v4 = a3;
  -[AXMEvaluationNode encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_taxonomyOptions, CFSTR("taxonomyOptions"), v5.receiver, v5.super_class);

}

+ (BOOL)isSupported
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "physicalMemory") > 0x773593FF;

  return v3;
}

+ (id)title
{
  return CFSTR("Scene Detector");
}

+ (NSArray)possibleSceneClassifications
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getVNSceneClassificationRequestClass(), "knownSceneClassifications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "identifier", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  objc_super v5;

  if (getVNSceneClassificationRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMSceneDetectorNode;
    return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v5, sel_validateVisionKitSoftLinkSymbols);
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMSceneDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v4);

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)AXMSceneDetectorNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v58, sel_evaluate_metrics_, v6, v7);
  v9 = (void *)MEMORY[0x1B5E128FC](v8);
  -[AXMSceneDetectorNode _sceneClassificationRequest](self, "_sceneClassificationRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc_init((Class)getVNSceneClassificationRequestClass());
    -[AXMSceneDetectorNode _setSceneClassificationRequest:](self, "_setSceneClassificationRequest:", v11);

    -[AXMSceneDetectorNode _sceneClassificationRequest](self, "_sceneClassificationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMEvaluationNode configureForRunningOnANEIfPossibleWithRequest:](AXMEvaluationNode, "configureForRunningOnANEIfPossibleWithRequest:", v12);

  }
  -[AXMSceneDetectorNode _sceneClassificationRequest](self, "_sceneClassificationRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](self, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v14, v6, 0, v7, 0);

  v45 = v13;
  if (-[AXMSceneDetectorNode taxonomyOptions](self, "taxonomyOptions"))
  {
    v44 = v9;
    objc_msgSend(v13, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMPhotoVisionSupport processSceneClassifications:withOptions:](AXMPhotoVisionSupport, "processSceneClassifications:withOptions:", v15, -[AXMSceneDetectorNode taxonomyOptions](self, "taxonomyOptions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v55 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v6, "size");
          +[AXMVisionFeature featureWithTaxonomyNode:canvasSize:](AXMVisionFeature, "featureWithTaxonomyNode:canvasSize:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFeature:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      }
      while (v19);
    }

  }
  else
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v13, "results");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    if (!v24)
      goto LABEL_20;
    v25 = v24;
    v44 = v9;
    v26 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v51 != v26)
          objc_enumerationMutation(v17);
        v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        +[AXMPhotoVisionSupport localizedLabelForClassificationObservation:](AXMPhotoVisionSupport, "localizedLabelForClassificationObservation:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "confidence");
        v32 = v31;
        objc_msgSend(v6, "size");
        v34 = v33;
        LODWORD(v33) = v32;
        +[AXMVisionFeature sceneClassificationWithLabel:localizedValue:confidence:canvasSize:](AXMVisionFeature, "sceneClassificationWithLabel:localizedValue:confidence:canvasSize:", v30, v29, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFeature:", v36);

      }
      v25 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v25);
  }
  v9 = v44;
  v13 = v45;
LABEL_20:

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v13, "results");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * k);
        if (-[AXMSceneDetectorNode _shouldIncludeSceneLabelForOCRDocumenTypeDetection:](self, "_shouldIncludeSceneLabelForOCRDocumenTypeDetection:", v42))
        {
          objc_msgSend(v42, "identifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addSceneLabelForOCRDocumentTypeDetection:", v43);

        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    }
    while (v39);
  }

  objc_msgSend(v6, "addEvaluatedFeatureType:", 9);
  objc_autoreleasePoolPop(v9);

}

- (BOOL)_shouldIncludeSceneLabelForOCRDocumenTypeDetection:(id)a3
{
  id v3;
  void *v4;
  double v5;
  float v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.35;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("diagram")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("envelope")) & 1) == 0)
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("receipt")))
    {
      v7 = 0;
      goto LABEL_6;
    }
    v5 = 0.65;
  }
  objc_msgSend(v3, "confidence");
  v7 = v5 < v6;
LABEL_6:

  return v7;
}

- (unsigned)taxonomyOptions
{
  return self->_taxonomyOptions;
}

- (void)setTaxonomyOptions:(unsigned int)a3
{
  self->_taxonomyOptions = a3;
}

- (VNSceneClassificationRequest)_sceneClassificationRequest
{
  return self->__sceneClassificationRequest;
}

- (void)_setSceneClassificationRequest:(id)a3
{
  objc_storeStrong((id *)&self->__sceneClassificationRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sceneClassificationRequest, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNSceneClassificationRequestSoft was nil", v1, 2u);
}

@end

@implementation AXMObjectDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMObjectDetectorNode)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXMObjectDetectorNode;
  return -[AXMEvaluationNode initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMObjectDetectorNode;
  -[AXMEvaluationNode encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
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
  return CFSTR("Object Detector");
}

+ (id)possibleObjectClassifications
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v2 = objc_alloc_init((Class)getVNRecognizeObjectsRequestClass());
  v13 = 0;
  objc_msgSend(v2, "supportedIdentifiersAndReturnError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[AXMObjectDetectorNode possibleObjectClassifications].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];

  return v3;
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  if (getVNRecognizeObjectsRequestClass())
  {
    v12.receiver = self;
    v12.super_class = (Class)AXMObjectDetectorNode;
    return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v12, sel_validateVisionKitSoftLinkSymbols);
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMObjectDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  VNRecognizeObjectsRequest *recognizeObjectsRequest;
  VNRecognizeObjectsRequest *v10;
  VNRecognizeObjectsRequest *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _UNKNOWN **v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  float v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int v39;
  int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *context;
  void *contexta;
  void *v51;
  void *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  uint8_t buf[4];
  NSObject *v60;
  _BYTE v61[128];
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)AXMObjectDetectorNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v58, sel_evaluate_metrics_, v6, v7);
  context = (void *)MEMORY[0x1B5E128FC](v8);
  recognizeObjectsRequest = self->_recognizeObjectsRequest;
  if (!recognizeObjectsRequest)
  {
    v10 = (VNRecognizeObjectsRequest *)objc_alloc_init((Class)getVNRecognizeObjectsRequestClass());
    v11 = self->_recognizeObjectsRequest;
    self->_recognizeObjectsRequest = v10;

    +[AXMEvaluationNode configureForRunningOnANEIfPossibleWithRequest:](AXMEvaluationNode, "configureForRunningOnANEIfPossibleWithRequest:", self->_recognizeObjectsRequest, context);
    recognizeObjectsRequest = self->_recognizeObjectsRequest;
  }
  v62[0] = recognizeObjectsRequest;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1, context);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v6;
  v51 = v7;
  -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](self, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v12, v6, 0, v7, 0);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[VNRecognizeObjectsRequest results](self->_recognizeObjectsRequest, "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v53)
  {
    v14 = *(_QWORD *)v55;
    v15 = &off_1E625A000;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v15[188], "axmTaxonomyNodeForObjectObservation:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "label");
          v20 = objc_claimAutoreleasedReturnValue();
          if (!v20)
            goto LABEL_13;
          v21 = (void *)v20;
          objc_msgSend(v15[188], "_deniedVoiceOverObjectClassificationLabels");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "label");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "containsObject:", v23);

          if (v24)
          {
            AXMediaLogCommon();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v19, "label");
              v26 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v60 = v26;
              _os_log_impl(&dword_1B0E3B000, v25, OS_LOG_TYPE_INFO, "Object classifier detected but denied for VoiceOver: %@", buf, 0xCu);

            }
          }
          else
          {
LABEL_13:
            objc_msgSend(v19, "localizedName");
            v25 = objc_claimAutoreleasedReturnValue();
            if (!-[NSObject length](v25, "length"))
            {
              AXMediaLogCommon();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v60 = v25;
                _os_log_impl(&dword_1B0E3B000, v27, OS_LOG_TYPE_DEFAULT, "Could not get localized value for label: %@. Falling back to raw value", buf, 0xCu);
              }

              objc_msgSend(v19, "label");
              v28 = objc_claimAutoreleasedReturnValue();

              v25 = v28;
            }
            objc_msgSend(v17, "confidence");
            if (v29 > 0.4)
            {
              objc_msgSend(v19, "label");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "boundingBox");
              v32 = v31;
              v34 = v33;
              v36 = v35;
              v38 = v37;
              objc_msgSend(v17, "confidence");
              v40 = v39;
              objc_msgSend(v52, "size");
              v42 = v41;
              v44 = v43;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v19, "sceneClassId"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "stringValue");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v47) = v40;
              +[AXMVisionFeature objectClassificationWithLabel:localizedValue:boundingBox:confidence:canvasSize:sceneClassId:](AXMVisionFeature, "objectClassificationWithLabel:localizedValue:boundingBox:confidence:canvasSize:sceneClassId:", v30, v25, v46, v32, v34, v36, v38, v47, v42, v44);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              v15 = &off_1E625A000;
              objc_msgSend(v52, "appendFeature:", v48);

            }
          }
        }
        else
        {
          AXMediaLogCommon();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B0E3B000, v25, OS_LOG_TYPE_DEFAULT, "Recognized object result produced no labels", buf, 2u);
          }
        }

      }
      v53 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v53);
  }

  objc_msgSend(v52, "addEvaluatedFeatureType:", 10);
  objc_autoreleasePoolPop(contexta);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizeObjectsRequest, 0);
}

+ (void)possibleObjectClassifications
{
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, a1, a3, "Could not look up supported identifiers for VNRecognizeObjectsRequest", a5, a6, a7, a8, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, a1, a3, "Could not evaluate. VNRecognizeObjectsRequestSoft was nil", a5, a6, a7, a8, 0);
}

@end

@implementation AXMFaceDetectorNode

- (void)nodeInitialize
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXMFaceDetectorNode;
  -[AXMEvaluationNode nodeInitialize](&v2, sel_nodeInitialize);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMFaceDetectorNode)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXMFaceDetectorNode;
  return -[AXMEvaluationNode initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMFaceDetectorNode;
  -[AXMEvaluationNode encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)isSupported
{
  return 1;
}

- (BOOL)requiresVisionFramework
{
  return 1;
}

+ (id)title
{
  return CFSTR("Face Detector");
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  objc_super v5;

  if (getVNDetectFaceExpressionsRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMFaceDetectorNode;
    return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v5, sel_validateVisionKitSoftLinkSymbols);
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMFaceDetectorNode validateVisionKitSoftLinkSymbols].cold.1();

    return 0;
  }
}

- (id)_createRequestsForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  AXMVisionFaceNameHelper *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  void *v52;
  id v54;
  id v55;
  id v56;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analysisOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "detectFaceNames");

  if (v7)
  {
    objc_msgSend(v4, "sourceInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoLibraryURL");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[AXMFaceDetectorNode _faceNameHelper](self, "_faceNameHelper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = objc_alloc_init(AXMVisionFaceNameHelper);
      -[AXMFaceDetectorNode set_faceNameHelper:](self, "set_faceNameHelper:", v11);

    }
    -[AXMFaceDetectorNode _faceNameHelper](self, "_faceNameHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "prepareForLookupWithPhotoLibraryURL:", v9);

    if (v13)
    {
      if (!getVNCreateFaceprintRequestClass())
      {
        AXMediaLogCommon();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          -[AXMFaceDetectorNode _createRequestsForContext:].cold.1();
        goto LABEL_54;
      }
      -[AXMFaceDetectorNode _faceprintRequest](self, "_faceprintRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v47 = objc_alloc_init((Class)getVNCreateFaceprintRequestClass());
        -[AXMFaceDetectorNode set_faceprintRequest:](self, "set_faceprintRequest:", v47);

        -[AXMFaceDetectorNode _faceprintRequest](self, "_faceprintRequest");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMFaceDetectorNode _faceNameHelper](self, "_faceNameHelper");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0;
        objc_msgSend(v48, "setRevision:error:", objc_msgSend(v49, "faceprintRequestRevisionForPersonsModel"), &v56);
        v46 = v56;

        if (v46)
        {
          AXMediaLogCommon();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            -[AXMFaceDetectorNode _createRequestsForContext:].cold.9(self, (uint64_t)v46, v50);

LABEL_54:
LABEL_59:

          goto LABEL_60;
        }
      }
      -[AXMFaceDetectorNode _faceprintRequest](self, "_faceprintRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v15);

    }
  }
  objc_msgSend(v4, "analysisOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "detectFaceAttributes");

  if (v17)
  {
    if (!getVNClassifyFaceAttributesRequestClass())
    {
      AXMediaLogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[AXMFaceDetectorNode _createRequestsForContext:].cold.2();
      goto LABEL_49;
    }
    -[AXMFaceDetectorNode _faceAttributesRequest](self, "_faceAttributesRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v42 = objc_alloc_init((Class)getVNClassifyFaceAttributesRequestClass());
      -[AXMFaceDetectorNode set_faceAttributesRequest:](self, "set_faceAttributesRequest:", v42);

      -[AXMFaceDetectorNode _faceAttributesRequest](self, "_faceAttributesRequest");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0;
      objc_msgSend(v43, "setRevision:error:", 3737841666, &v55);
      v9 = v55;

      if (v9)
      {
        AXMediaLogCommon();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[AXMFaceDetectorNode _createRequestsForContext:].cold.8((uint64_t)v9, v44, v45);
LABEL_58:

        goto LABEL_59;
      }
    }
    -[AXMFaceDetectorNode _faceAttributesRequest](self, "_faceAttributesRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

  }
  objc_msgSend(v4, "analysisOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "detectFaceExpressions");

  if (v21)
  {
    if (!getVNDetectFaceExpressionsRequestClass())
    {
      AXMediaLogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[AXMFaceDetectorNode validateVisionKitSoftLinkSymbols].cold.1();
      goto LABEL_49;
    }
    -[AXMFaceDetectorNode _faceExpressionsRequest](self, "_faceExpressionsRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v23 = objc_alloc_init((Class)getVNDetectFaceExpressionsRequestClass());
      -[AXMFaceDetectorNode set_faceExpressionsRequest:](self, "set_faceExpressionsRequest:", v23);

    }
    -[AXMFaceDetectorNode _faceExpressionsRequest](self, "_faceExpressionsRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24);

  }
  objc_msgSend(v4, "analysisOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "detectFaceLandmarks");

  if (v26)
  {
    if (!getVNDetectFaceLandmarksRequestClass())
    {
      AXMediaLogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[AXMFaceDetectorNode _createRequestsForContext:].cold.4();
      goto LABEL_49;
    }
    -[AXMFaceDetectorNode _faceLandmarksRequest](self, "_faceLandmarksRequest");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      v28 = objc_alloc_init((Class)getVNDetectFaceLandmarksRequestClass());
      -[AXMFaceDetectorNode set_faceLandmarksRequest:](self, "set_faceLandmarksRequest:", v28);

    }
    -[AXMFaceDetectorNode _faceLandmarksRequest](self, "_faceLandmarksRequest");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v29);

  }
  objc_msgSend(v4, "analysisOptions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "detectFacePose");

  if (v31)
  {
    if (!getVNDetectFacePoseRequestClass())
    {
      AXMediaLogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[AXMFaceDetectorNode _createRequestsForContext:].cold.5();
      goto LABEL_49;
    }
    -[AXMFaceDetectorNode _facePoseRequest](self, "_facePoseRequest");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      v33 = objc_alloc_init((Class)getVNDetectFacePoseRequestClass());
      -[AXMFaceDetectorNode set_facePoseRequest:](self, "set_facePoseRequest:", v33);

    }
    -[AXMFaceDetectorNode _facePoseRequest](self, "_facePoseRequest");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v34);

  }
  v35 = objc_msgSend(v5, "count");
  objc_msgSend(v4, "analysisOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "detectFaceRectangles");

  if ((v37 & 1) == 0 && !v35)
    goto LABEL_33;
  if (!getVNDetectFaceRectanglesRequestClass())
  {
    AXMediaLogCommon();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[AXMFaceDetectorNode _createRequestsForContext:].cold.6();
LABEL_49:

LABEL_60:
    v40 = 0;
    goto LABEL_61;
  }
  -[AXMFaceDetectorNode _faceRectanglesRequest](self, "_faceRectanglesRequest");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    v51 = objc_alloc_init((Class)getVNDetectFaceRectanglesRequestClass());
    -[AXMFaceDetectorNode set_faceRectanglesRequest:](self, "set_faceRectanglesRequest:", v51);

    -[AXMFaceDetectorNode _faceRectanglesRequest](self, "_faceRectanglesRequest");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(v52, "setRevision:error:", 3737841666, &v54);
    v9 = v54;

    if (v9)
    {
      AXMediaLogCommon();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[AXMFaceDetectorNode _createRequestsForContext:].cold.7((uint64_t)v9, v44);
      goto LABEL_58;
    }
  }
  -[AXMFaceDetectorNode _faceRectanglesRequest](self, "_faceRectanglesRequest");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v39);

LABEL_33:
  v40 = v5;
LABEL_61:

  return v40;
}

- (id)_faceDetectionResultsForVisionRequests:(id)a3 canvasSize:(CGSize)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__AXMFaceDetectorNode__faceDetectionResultsForVisionRequests_canvasSize___block_invoke;
  v12[3] = &unk_1E625C918;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __73__AXMFaceDetectorNode__faceDetectionResultsForVisionRequests_canvasSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  AXMVisionFeatureFaceAttributes *v34;
  void *v35;
  AXMVisionFeatureFaceAttributes *v36;
  int64_t v37;
  void *v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t n;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  AXMVisionFeatureFaceLandmarks *v57;
  void *v58;
  AXMVisionFeatureFaceLandmarks *v59;
  AXMVisionFeatureFaceLandmarks *v60;
  void *v61;
  AXMVisionFeatureFaceLandmarks *v62;
  float v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t ii;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  float v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getVNDetectFaceRectanglesRequestClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    objc_msgSend(v3, "results");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v95 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          v10 = *(void **)(a1 + 32);
          objc_msgSend(v9, "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_faceResultForUUID:inFaceDictionary:", v11, *(_QWORD *)(a1 + 40));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "setFaceId:", objc_msgSend(v9, "faceId"));
          objc_msgSend(v9, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setUuid:", v13);

          objc_msgSend(v9, "boundingBox");
          objc_msgSend(v12, "setFrame:");
          objc_msgSend(v9, "confidence");
          objc_msgSend(v12, "setRectanglesConfidence:", v14);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
      }
      while (v6);
    }
    goto LABEL_46;
  }
  getVNCreateFaceprintRequestClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    objc_msgSend(v3, "results");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v91 != v17)
            objc_enumerationMutation(v4);
          v19 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
          v20 = *(void **)(a1 + 32);
          objc_msgSend(v19, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_faceResultForUUID:inFaceDictionary:", v21, *(_QWORD *)(a1 + 40));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "_faceNameHelper");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "nameForFaceObservation:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setName:", v24);

          objc_msgSend(v19, "confidence");
          objc_msgSend(v22, "setNameConfidence:", v25);

        }
        v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
      }
      while (v16);
    }
    goto LABEL_46;
  }
  getVNClassifyFaceAttributesRequestClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    objc_msgSend(v3, "results");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
    if (v26)
    {
      v27 = v26;
      v73 = v3;
      v28 = *(_QWORD *)v87;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v87 != v28)
            objc_enumerationMutation(v4);
          v30 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * k);
          v31 = *(void **)(a1 + 32);
          objc_msgSend(v30, "uuid");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "_faceResultForUUID:inFaceDictionary:", v32, *(_QWORD *)(a1 + 40));
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = [AXMVisionFeatureFaceAttributes alloc];
          objc_msgSend(v30, "faceAttributes");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[AXMVisionFeatureFaceAttributes initWithVisionFaceAttributes:](v34, "initWithVisionFaceAttributes:", v35);
          objc_msgSend(v33, "setAttributes:", v36);

          v37 = +[AXMVisionFeatureFaceAttributes defaultExcludeOptions](AXMVisionFeatureFaceAttributes, "defaultExcludeOptions");
          objc_msgSend(v33, "attributes");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setExcludeOptions:", v37);

          objc_msgSend(v30, "confidence");
          objc_msgSend(v33, "setAttributesConfidence:", v39);

        }
        v27 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
      }
      while (v27);
LABEL_45:
      v3 = v73;
    }
  }
  else
  {
    getVNDetectFaceExpressionsRequestClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      objc_msgSend(v3, "results");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v83;
        do
        {
          for (m = 0; m != v41; ++m)
          {
            if (*(_QWORD *)v83 != v42)
              objc_enumerationMutation(v4);
            v44 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * m);
            v45 = *(void **)(a1 + 32);
            objc_msgSend(v44, "uuid");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "_faceResultForUUID:inFaceDictionary:", v46, *(_QWORD *)(a1 + 40));
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v44, "expressionsAndConfidence");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setExpressionsAndConfidence:", v48);

          }
          v41 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
        }
        while (v41);
      }
      goto LABEL_46;
    }
    getVNDetectFaceLandmarksRequestClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      objc_msgSend(v3, "results");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
      if (v49)
      {
        v50 = v49;
        v73 = v3;
        v51 = *(_QWORD *)v79;
        do
        {
          for (n = 0; n != v50; ++n)
          {
            if (*(_QWORD *)v79 != v51)
              objc_enumerationMutation(v4);
            v53 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * n);
            v54 = *(void **)(a1 + 32);
            objc_msgSend(v53, "uuid");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "_faceResultForUUID:inFaceDictionary:", v55, *(_QWORD *)(a1 + 40));
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v57 = [AXMVisionFeatureFaceLandmarks alloc];
            objc_msgSend(v53, "landmarks");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = -[AXMVisionFeatureFaceLandmarks initWithVisionFaceLandmarks:](v57, "initWithVisionFaceLandmarks:", v58);
            objc_msgSend(v56, "setLandmarks:", v59);

            v60 = [AXMVisionFeatureFaceLandmarks alloc];
            objc_msgSend(v53, "landmarks3d");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = -[AXMVisionFeatureFaceLandmarks initWithVisionFaceLandmarks:](v60, "initWithVisionFaceLandmarks:", v61);
            objc_msgSend(v56, "setLandmarks3d:", v62);

            objc_msgSend(v53, "confidence");
            objc_msgSend(v56, "setLandmarksConfidence:", v63);

          }
          v50 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
        }
        while (v50);
        goto LABEL_45;
      }
    }
    else
    {
      getVNDetectFacePoseRequestClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_47;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      objc_msgSend(v3, "results");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v74, v98, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v75;
        do
        {
          for (ii = 0; ii != v65; ++ii)
          {
            if (*(_QWORD *)v75 != v66)
              objc_enumerationMutation(v4);
            v68 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * ii);
            v69 = *(void **)(a1 + 32);
            objc_msgSend(v68, "uuid");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "_faceResultForUUID:inFaceDictionary:", v70, *(_QWORD *)(a1 + 40));
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v68, "pose");
            objc_msgSend(v71, "setPose:");
            objc_msgSend(v68, "confidence");
            objc_msgSend(v71, "setPoseConfidence:", v72);

          }
          v65 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v74, v98, 16);
        }
        while (v65);
      }
    }
  }
LABEL_46:

LABEL_47:
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AXMFaceDetectorNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v16, sel_evaluate_metrics_, v6, v7);
  v9 = (void *)MEMORY[0x1B5E128FC](v8);
  -[AXMFaceDetectorNode _createRequestsForContext:](self, "_createRequestsForContext:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](self, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v10, v6, 0, v7, 0);
    objc_msgSend(v6, "size");
    -[AXMFaceDetectorNode _faceDetectionResultsForVisionRequests:canvasSize:](self, "_faceDetectionResultsForVisionRequests:canvasSize:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__AXMFaceDetectorNode_evaluate_metrics___block_invoke;
    v13[3] = &unk_1E625C940;
    v12 = v6;
    v14 = v12;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v13);
    objc_msgSend(v12, "addEvaluatedFeatureType:", 5);

  }
  else
  {
    AXMediaLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0E3B000, v11, OS_LOG_TYPE_DEFAULT, "AXMFaceDetectorNode: no requests to evaluate", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v9);
}

void __40__AXMFaceDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "size");
  +[AXMVisionFeature featureWithFaceDetectionResult:canvasSize:](AXMVisionFeature, "featureWithFaceDetectionResult:canvasSize:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendFeature:", v5);
}

- (id)_faceResultForUUID:(id)a3 inFaceDictionary:(id)a4
{
  id v5;
  void *v6;
  AXMVisionFeatureFaceDetectionResult *v7;

  v5 = a4;
  objc_msgSend(a3, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (AXMVisionFeatureFaceDetectionResult *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(AXMVisionFeatureFaceDetectionResult);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);
  }

  return v7;
}

- (AXMVisionFaceNameHelper)_faceNameHelper
{
  return self->__faceNameHelper;
}

- (void)set_faceNameHelper:(id)a3
{
  objc_storeStrong((id *)&self->__faceNameHelper, a3);
}

- (VNDetectFaceRectanglesRequest)_faceRectanglesRequest
{
  return self->__faceRectanglesRequest;
}

- (void)set_faceRectanglesRequest:(id)a3
{
  objc_storeStrong((id *)&self->__faceRectanglesRequest, a3);
}

- (VNCreateFaceprintRequest)_faceprintRequest
{
  return self->__faceprintRequest;
}

- (void)set_faceprintRequest:(id)a3
{
  objc_storeStrong((id *)&self->__faceprintRequest, a3);
}

- (VNClassifyFaceAttributesRequest)_faceAttributesRequest
{
  return self->__faceAttributesRequest;
}

- (void)set_faceAttributesRequest:(id)a3
{
  objc_storeStrong((id *)&self->__faceAttributesRequest, a3);
}

- (VNDetectFaceExpressionsRequest)_faceExpressionsRequest
{
  return self->__faceExpressionsRequest;
}

- (void)set_faceExpressionsRequest:(id)a3
{
  objc_storeStrong((id *)&self->__faceExpressionsRequest, a3);
}

- (VNDetectFaceLandmarksRequest)_faceLandmarksRequest
{
  return self->__faceLandmarksRequest;
}

- (void)set_faceLandmarksRequest:(id)a3
{
  objc_storeStrong((id *)&self->__faceLandmarksRequest, a3);
}

- (VNDetectFacePoseRequest)_facePoseRequest
{
  return self->__facePoseRequest;
}

- (void)set_facePoseRequest:(id)a3
{
  objc_storeStrong((id *)&self->__facePoseRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__facePoseRequest, 0);
  objc_storeStrong((id *)&self->__faceLandmarksRequest, 0);
  objc_storeStrong((id *)&self->__faceExpressionsRequest, 0);
  objc_storeStrong((id *)&self->__faceAttributesRequest, 0);
  objc_storeStrong((id *)&self->__faceprintRequest, 0);
  objc_storeStrong((id *)&self->__faceRectanglesRequest, 0);
  objc_storeStrong((id *)&self->__faceNameHelper, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Could not evaluate. VNDetectFaceExpressionsRequestSoft was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_createRequestsForContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Could not evaluate. VNCreateFaceprintRequestSoft was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_createRequestsForContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Could not evaluate. VNClassifyFaceAttributesRequestSoft was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_createRequestsForContext:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Could not evaluate. VNDetectFaceLandmarksRequestSoft was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_createRequestsForContext:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Could not evaluate. VNDetectFacePoseRequestSoft was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_createRequestsForContext:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Could not evaluate. VNDetectFaceRectanglesRequestSoft was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_createRequestsForContext:(uint64_t)a1 .cold.7(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "Could not set revision VNDetectFaceRectanglesRequestPrivateRevisionANOD3Detector. Error : %@", (uint8_t *)&v2, 0xCu);
}

- (void)_createRequestsForContext:(uint64_t)a3 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = 3737841666;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_3_0(&dword_1B0E3B000, a2, a3, "Could not set face attributes revision %ld. Error : %@", (uint8_t *)&v3);
}

- (void)_createRequestsForContext:(NSObject *)a3 .cold.9(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_faceNameHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = objc_msgSend(v5, "faceprintRequestRevisionForPersonsModel");
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_3_0(&dword_1B0E3B000, a3, v6, "Could not set revision %ld. Error : %@", (uint8_t *)&v7);

}

@end

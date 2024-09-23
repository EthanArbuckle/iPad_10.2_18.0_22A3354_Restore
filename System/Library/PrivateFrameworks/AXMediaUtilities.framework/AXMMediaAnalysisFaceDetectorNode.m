@implementation AXMMediaAnalysisFaceDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMMediaAnalysisFaceDetectorNode)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXMMediaAnalysisFaceDetectorNode;
  return -[AXMEvaluationNode initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMMediaAnalysisFaceDetectorNode;
  -[AXMEvaluationNode encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (BOOL)requiresVisionFramework
{
  return 0;
}

+ (id)title
{
  return CFSTR("AXM Media Analysis - Face Detector Node");
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  void *v7;
  AXMVisionFaceNameHelper *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  dispatch_semaphore_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  dispatch_time_t v26;
  unint64_t v27;
  NSObject *v28;
  dispatch_time_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  objc_super v41;
  id location[5];
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)AXMMediaAnalysisFaceDetectorNode;
  v31 = a4;
  -[AXMEvaluationNode evaluate:metrics:](&v41, sel_evaluate_metrics_, v6);
  -[AXMMediaAnalysisFaceDetectorNode _faceNameHelper](self, "_faceNameHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = v7 == 0;

  if ((_DWORD)a4)
  {
    v8 = objc_alloc_init(AXMVisionFaceNameHelper);
    -[AXMMediaAnalysisFaceDetectorNode set_faceNameHelper:](self, "set_faceNameHelper:", v8);

  }
  objc_msgSend(v6, "sourceInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "phAssetLocalIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibraryURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ciImage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pixelBuffer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  v44 = buf;
  v45 = 0x2050000000;
  v13 = (void *)getMADVIFaceRequestClass_softClass;
  v46 = getMADVIFaceRequestClass_softClass;
  v14 = MEMORY[0x1E0C809B0];
  if (!getMADVIFaceRequestClass_softClass)
  {
    location[0] = (id)MEMORY[0x1E0C809B0];
    location[1] = (id)3221225472;
    location[2] = __getMADVIFaceRequestClass_block_invoke;
    location[3] = &unk_1E625C4E8;
    location[4] = buf;
    __getMADVIFaceRequestClass_block_invoke((uint64_t)location);
    v13 = (void *)*((_QWORD *)v44 + 3);
  }
  v15 = objc_retainAutorelease(v13);
  _Block_object_dispose(buf, 8);
  v16 = objc_alloc_init(v15);
  v17 = dispatch_semaphore_create(0);
  objc_initWeak(location, self);
  v36[0] = v14;
  v36[1] = 3221225472;
  v36[2] = __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke;
  v36[3] = &unk_1E625EBB0;
  objc_copyWeak(&v40, location);
  v18 = v16;
  v37 = v18;
  v30 = v6;
  v38 = v30;
  v19 = v17;
  v39 = v19;
  v20 = (void *)MEMORY[0x1B5E12AE8](v36);
  +[AXMMADSService sharedInstance](AXMMADSService, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "service");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35 && v34)
  {
    v49[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "performRequests:onAssetWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", v23, v34, v35, v20);
LABEL_12:
    v25 = v24;

    goto LABEL_13;
  }
  if (v33)
  {
    v48 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "performRequests:onCIImage:withOrientation:andIdentifier:completionHandler:", v23, v33, 1, &stru_1E6260C18, v20);
    goto LABEL_12;
  }
  if (v32)
  {
    v47 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v23, objc_msgSend(v32, "pixelBuffer"), objc_msgSend(v32, "orientation"), &stru_1E6260C18, v20);
    goto LABEL_12;
  }
  v25 = 0xFFFFFFFFLL;
LABEL_13:
  v26 = dispatch_time(0, 100000000);
  if (dispatch_semaphore_wait(v19, v26))
  {
    v27 = 100000000;
    do
    {
      if (v27 >= 0x2540BE401)
      {
        AXMediaLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[AXMMediaAnalysisFaceDetectorNode evaluate:metrics:].cold.1(buf, &buf[1], v28);

        objc_msgSend(v22, "cancelRequestID:", v25);
      }
      v29 = dispatch_time(0, 100000000);
      v27 += 100000000;
    }
    while (dispatch_semaphore_wait(v19, v29));
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak(location);

}

void __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  AXMediaLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = 67109634;
    v11[1] = a2;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v10;
    _os_log_debug_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Face Detection results: requestID: %d error: %@ results: %@", (uint8_t *)v11, 0x1Cu);

  }
  if (v5)
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke_cold_2((uint64_t)v5, v8);
  }
  else if (a2 == -1)
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke_cold_1(v8);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "results");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_addFaceDetectionFeaturesToContext:fromResults:", v9, v8);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_addFaceDetectionFeaturesToContext:(id)a3 fromResults:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  AXMVisionFeatureFaceAttributes *v38;
  void *v39;
  AXMVisionFeatureFaceAttributes *v40;
  int64_t v41;
  void *v42;
  float v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  void *v55;
  void *v56;
  void *v57;
  AXMVisionFeatureFaceLandmarks *v58;
  void *v59;
  AXMVisionFeatureFaceLandmarks *v60;
  AXMVisionFeatureFaceLandmarks *v61;
  void *v62;
  AXMVisionFeatureFaceLandmarks *v63;
  float v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id obj;
  id obja;
  _QWORD v73[4];
  id v74;
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
  _QWORD v95[5];
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v70 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v70, "count"))
  {
    objc_msgSend(v70, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0;
    v97 = &v96;
    v98 = 0x2050000000;
    v8 = (void *)getMADVIFaceResultClass_softClass;
    v99 = getMADVIFaceResultClass_softClass;
    if (!getMADVIFaceResultClass_softClass)
    {
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __getMADVIFaceResultClass_block_invoke;
      v95[3] = &unk_1E625C4E8;
      v95[4] = &v96;
      __getMADVIFaceResultClass_block_invoke((uint64_t)v95);
      v8 = (void *)v97[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v96, 8);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v70, "firstObject");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      objc_msgSend(v68, "faceRectanglesObservations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v92;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v92 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
            objc_msgSend(v15, "uuid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMMediaAnalysisFaceDetectorNode _faceResultForUUID:inFaceDictionary:](self, "_faceResultForUUID:inFaceDictionary:", v16, v6);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "setFaceId:", objc_msgSend(v15, "faceId"));
            objc_msgSend(v15, "uuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setUuid:", v18);

            objc_msgSend(v15, "boundingBox");
            objc_msgSend(v17, "setFrame:");
            objc_msgSend(v15, "confidence");
            objc_msgSend(v17, "setRectanglesConfidence:", v19);

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
        }
        while (v12);
      }

      objc_msgSend(v69, "sourceInput");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "photoLibraryURL");
      v66 = objc_claimAutoreleasedReturnValue();

      -[AXMMediaAnalysisFaceDetectorNode _faceNameHelper](self, "_faceNameHelper");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = objc_msgSend(v21, "prepareForLookupWithPhotoLibraryURL:", v66);

      if ((_DWORD)v20)
      {
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        objc_msgSend(v68, "faceprintObservations");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v88;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v88 != v24)
                objc_enumerationMutation(v22);
              v26 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
              objc_msgSend(v26, "uuid", v66);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXMMediaAnalysisFaceDetectorNode _faceResultForUUID:inFaceDictionary:](self, "_faceResultForUUID:inFaceDictionary:", v27, v6);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              -[AXMMediaAnalysisFaceDetectorNode _faceNameHelper](self, "_faceNameHelper");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "nameForFaceObservation:", v26);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setName:", v30);

              objc_msgSend(v26, "confidence");
              objc_msgSend(v28, "setNameConfidence:", v31);

            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
          }
          while (v23);
        }

      }
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      objc_msgSend(v68, "faceAttributesObservations", v66);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v84;
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v84 != v33)
              objc_enumerationMutation(obj);
            v35 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * k);
            objc_msgSend(v35, "uuid");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMMediaAnalysisFaceDetectorNode _faceResultForUUID:inFaceDictionary:](self, "_faceResultForUUID:inFaceDictionary:", v36, v6);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            v38 = [AXMVisionFeatureFaceAttributes alloc];
            objc_msgSend(v35, "faceAttributes");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = -[AXMVisionFeatureFaceAttributes initWithVisionFaceAttributes:](v38, "initWithVisionFaceAttributes:", v39);
            objc_msgSend(v37, "setAttributes:", v40);

            v41 = +[AXMVisionFeatureFaceAttributes defaultExcludeOptions](AXMVisionFeatureFaceAttributes, "defaultExcludeOptions");
            objc_msgSend(v37, "attributes");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setExcludeOptions:", v41);

            objc_msgSend(v35, "confidence");
            objc_msgSend(v37, "setAttributesConfidence:", v43);

          }
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
        }
        while (v32);
      }

      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      objc_msgSend(v68, "faceExpressionsObservations");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
      if (v45)
      {
        v46 = *(_QWORD *)v80;
        do
        {
          for (m = 0; m != v45; ++m)
          {
            if (*(_QWORD *)v80 != v46)
              objc_enumerationMutation(v44);
            v48 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * m);
            objc_msgSend(v48, "uuid");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMMediaAnalysisFaceDetectorNode _faceResultForUUID:inFaceDictionary:](self, "_faceResultForUUID:inFaceDictionary:", v49, v6);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v48, "expressionsAndConfidence");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setExpressionsAndConfidence:", v51);

          }
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
        }
        while (v45);
      }

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      objc_msgSend(v68, "faceLandmarksObservations");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v76;
        do
        {
          for (n = 0; n != v52; ++n)
          {
            if (*(_QWORD *)v76 != v53)
              objc_enumerationMutation(obja);
            v55 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * n);
            objc_msgSend(v55, "uuid");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMMediaAnalysisFaceDetectorNode _faceResultForUUID:inFaceDictionary:](self, "_faceResultForUUID:inFaceDictionary:", v56, v6);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            v58 = [AXMVisionFeatureFaceLandmarks alloc];
            objc_msgSend(v55, "landmarks");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = -[AXMVisionFeatureFaceLandmarks initWithVisionFaceLandmarks:](v58, "initWithVisionFaceLandmarks:", v59);
            objc_msgSend(v57, "setLandmarks:", v60);

            v61 = [AXMVisionFeatureFaceLandmarks alloc];
            objc_msgSend(v55, "landmarks3d");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = -[AXMVisionFeatureFaceLandmarks initWithVisionFaceLandmarks:](v61, "initWithVisionFaceLandmarks:", v62);
            objc_msgSend(v57, "setLandmarks3d:", v63);

            objc_msgSend(v55, "confidence");
            objc_msgSend(v57, "setLandmarksConfidence:", v64);

          }
          v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
        }
        while (v52);
      }

    }
  }
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __83__AXMMediaAnalysisFaceDetectorNode__addFaceDetectionFeaturesToContext_fromResults___block_invoke;
  v73[3] = &unk_1E625C940;
  v74 = v69;
  v65 = v69;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v73);
  objc_msgSend(v65, "addEvaluatedFeatureType:", 31);

}

void __83__AXMMediaAnalysisFaceDetectorNode__addFaceDetectionFeaturesToContext_fromResults___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  AXMediaLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __83__AXMMediaAnalysisFaceDetectorNode__addFaceDetectionFeaturesToContext_fromResults___block_invoke_cold_1(v4, v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "size");
  +[AXMVisionFeature featureWithMediaAnalysisFaceDetectionResult:canvasSize:](AXMVisionFeature, "featureWithMediaAnalysisFaceDetectionResult:canvasSize:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFeature:", v7);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__faceNameHelper, 0);
}

- (void)evaluate:(os_log_t)log metrics:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "AXM Media Analysis: Face Detection request timed out", buf, 2u);
}

void __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Invalid request - MADVIFaceRequest", v1, 2u);
}

void __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Error in face analysis: %@", (uint8_t *)&v2, 0xCu);
}

void __83__AXMMediaAnalysisFaceDetectorNode__addFaceDetectionFeaturesToContext_fromResults___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabelForAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_DEBUG, "AXM Media analysis: results : %@ %@", (uint8_t *)&v7, 0x16u);

}

@end

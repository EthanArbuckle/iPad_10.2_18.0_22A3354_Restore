@implementation VCPHandGestureClassifier

+ (float)enableFlip
{
  return 1.0;
}

- (VCPHandGestureClassifier)init
{

  return 0;
}

- (VCPHandGestureClassifier)initWithMinHandSize:(float)a3 options:(id)a4
{
  id v6;
  VCPHandGestureClassifier *v7;
  VCPCoreMLFeatureProviderGestureVideo *v8;
  VCPCoreMLFeatureProviderGestureVideo *featureProvider;
  __CFString *v10;
  VCPCoreMLRequest *v11;
  VCPCoreMLRequest *gestureCoreMLRequest;
  VCPHandGestureMitigator *v13;
  VCPHandGestureMitigator *mitigator;
  double v15;
  VCPHandGestureMitigator *v16;
  void *v17;
  BOOL v18;
  VCPHandGestureClassifier *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  VCPHandGestureClassifier *v25;
  uint64_t v27;
  MLPredictionOptions *MLOptions;
  void *v29;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)VCPHandGestureClassifier;
  v7 = -[VCPHandGestureClassifier init](&v31, sel_init);
  if (!v7)
  {
    v19 = 0;
    goto LABEL_14;
  }
  v8 = objc_alloc_init(VCPCoreMLFeatureProviderGestureVideo);
  featureProvider = v7->_featureProvider;
  v7->_featureProvider = v8;

  v10 = CFSTR("hand_gesture_dynamic_two_hand_5fps");
  v11 = -[VCPCoreMLRequest initWithModelName:]([VCPCoreMLRequest alloc], "initWithModelName:", v10);
  gestureCoreMLRequest = v7->_gestureCoreMLRequest;
  v7->_gestureCoreMLRequest = v11;

  v13 = objc_alloc_init(VCPHandGestureMitigator);
  mitigator = v7->_mitigator;
  v7->_mitigator = v13;

  if (v7->_gestureCoreMLRequest && v7->_featureProvider && (v16 = v7->_mitigator) != 0)
  {
    *(float *)&v15 = a3;
    -[VCPHandGestureMitigator setMinHandSize:](v16, "setMinHandSize:", v15);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MLAneQoS"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    v19 = v7;
    if (!v18)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MLAneQoS"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20 == (void *)*MEMORY[0x1E0C9E840])
      {

      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MLAneQoS"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22 == (void *)*MEMORY[0x1E0C9E848];

        if (!v23)
        {
          v19 = v7;
          if ((int)MediaAnalysisLogLevel() < 4)
            goto LABEL_12;
          v19 = v7;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_12;
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MLAneQoS"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v33 = v24;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Gesture classifier - invalid input CoreML aneExecutionPriority %@", buf, 0xCu);

          goto LABEL_19;
        }
      }
      objc_msgSend(MEMORY[0x1E0C9E9B0], "defaultOptions");
      v27 = objc_claimAutoreleasedReturnValue();
      MLOptions = v7->_MLOptions;
      v7->_MLOptions = (MLPredictionOptions *)v27;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MLAneQoS"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLPredictionOptions setAneExecutionPriority:](v7->_MLOptions, "setAneExecutionPriority:", v29);

      v19 = v7;
      if ((int)MediaAnalysisLogLevel() < 7)
        goto LABEL_12;
      v19 = v7;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        goto LABEL_12;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MLAneQoS"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v30;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Gesture classifier - CoreML aneExecutionPriority is set to %@", buf, 0xCu);

LABEL_19:
      v19 = v7;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_12:

LABEL_14:
  v25 = v19;

  return v25;
}

- (void)reset
{
  -[VCPCoreMLFeatureProviderGestureVideo reset](self->_featureProvider, "reset");
}

- (void)setRotationInDegrees:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[VCPCoreMLFeatureProviderGestureVideo setRotationInDegrees:](self->_featureProvider, "setRotationInDegrees:");
  -[VCPHandGestureMitigator setRotationInDegrees:](self->_mitigator, "setRotationInDegrees:", v3);
}

- (int)rotationInDegrees
{
  return -[VCPCoreMLFeatureProviderGestureVideo rotationInDegrees](self->_featureProvider, "rotationInDegrees");
}

- (id)existingGroupIDs
{
  return -[VCPCoreMLFeatureProviderGestureVideo existingGroupIDs](self->_featureProvider, "existingGroupIDs");
}

- (void)setHandGestureForHand:(id)a3 withResult:(id)a4 andMapping:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7 && v8)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v9;
    v12 = 0;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v24;
      v15 = 0.0;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v17, (_QWORD)v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "floatValue");
          v20 = v19;

          if (v20 > v15)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v21, "intValue");

            v15 = v20;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }
    else
    {
      v15 = 0.0;
    }

    if (objc_msgSend(v7, "gestureType"))
    {
      if (objc_msgSend(v7, "gestureType") != (_DWORD)v12)
        goto LABEL_22;
      objc_msgSend(v7, "gestureConfidence");
      if (v15 <= *(float *)&v22)
        goto LABEL_22;
    }
    else if (v15 <= 0.5)
    {
      v15 = 1.0;
      objc_msgSend(v7, "setGestureType:", 0);
    }
    else
    {
      objc_msgSend(v7, "setGestureType:", v12);
    }
    *(float *)&v22 = v15;
    objc_msgSend(v7, "setGestureConfidence:", v22, (_QWORD)v23);
  }
LABEL_22:

}

+ (id)twoHandGestureTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6B76140);
}

- (int)processLeftHand:(id)a3 rightHand:(id)a4 results:(id)a5 resultsFlip:(id)a6 faceRects:(id)a7 faceYaws:(id)a8
{
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  int v20;
  uint8_t v22[16];

  v14 = (unint64_t)a3;
  v15 = (unint64_t)a4;
  v16 = (unint64_t)a5;
  v17 = (unint64_t)a6;
  v18 = a7;
  v19 = a8;
  if (v14 | v15)
  {
    if (v16 | v17)
    {
      if (v14)
      {
        if (v16)
          -[VCPHandGestureClassifier setHandGestureForHand:withResult:andMapping:](self, "setHandGestureForHand:withResult:andMapping:", v14, v16, &unk_1E6B76AD0);
        if (v17)
          -[VCPHandGestureClassifier setHandGestureForHand:withResult:andMapping:](self, "setHandGestureForHand:withResult:andMapping:", v14, v17, &unk_1E6B76AF8);
      }
      if (v15)
      {
        if (v16)
          -[VCPHandGestureClassifier setHandGestureForHand:withResult:andMapping:](self, "setHandGestureForHand:withResult:andMapping:", v15, v16, &unk_1E6B76AF8);
        if (v17)
          -[VCPHandGestureClassifier setHandGestureForHand:withResult:andMapping:](self, "setHandGestureForHand:withResult:andMapping:", v15, v17, &unk_1E6B76AD0);
      }
      v20 = -[VCPHandGestureMitigator mitigate:rightHand:featureProvider:faceRects:faceYaws:](self->_mitigator, "mitigate:rightHand:featureProvider:faceRects:faceYaws:", v14, v15, self->_featureProvider, v18, v19);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "processLeftHand : missing results", v22, 2u);
      }
      v20 = -50;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (int)processPerson:(int)a3 withObservations:(id)a4 andFaceRects:(id)a5 faceYaws:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  VCPHandObservation *v12;
  VCPHandObservation *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  VCPHandObservation *v17;
  float v18;
  VCPHandObservation *v19;
  float v20;
  VCPHandObservation *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  VCPCoreMLRequest *v25;
  void *v26;
  VCPCoreMLFeatureProviderGestureVideo *v27;
  MLPredictionOptions *v28;
  id *v29;
  uint64_t v30;
  int v31;
  float v32;
  id v33;
  void *v34;
  VCPCoreMLFeatureProviderGestureVideo *v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  void *v40;
  VCPCoreMLRequest *gestureCoreMLRequest;
  void *v42;
  VCPCoreMLFeatureProviderGestureVideo *featureProvider;
  MLPredictionOptions *MLOptions;
  id *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  VCPCoreMLFeatureProviderGestureVideo *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  id v55;
  uint64_t v56;
  void *v58;
  id v59;
  os_signpost_id_t spid;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  uint64_t v72;
  _BYTE v73[128];
  uint64_t v74;

  v8 = *(_QWORD *)&a3;
  v74 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v61 = a5;
  v62 = a6;
  -[VCPCoreMLFeatureProviderGestureVideo setCurrentGroupID:](self->_featureProvider, "setCurrentGroupID:", v8);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v11 = v10;
  v12 = 0;
  v13 = 0;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v68 != v15)
          objc_enumerationMutation(v11);
        v17 = *(VCPHandObservation **)(*((_QWORD *)&v67 + 1) + 8 * i);
        if (-[VCPHandObservation chirality](v17, "chirality") == -1)
        {
          if (!v13 || (v20 = handArea(v13), v20 < handArea(v17)))
          {
            v21 = v17;

            v13 = v21;
            -[VCPHandObservation setGestureType:](v21, "setGestureType:", 0);
          }
        }
        else if (-[VCPHandObservation chirality](v17, "chirality") == 1)
        {
          if (!v12 || (v18 = handArea(v12), v18 < handArea(v17)))
          {
            v19 = v17;

            v12 = v19;
            -[VCPHandObservation setGestureType:](v19, "setGestureType:", 0);
          }
        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    }
    while (v14);
  }

  -[VCPCoreMLFeatureProviderGestureVideo addLeftHand:andRightHand:](self->_featureProvider, "addLeftHand:andRightHand:", v13, v12);
  if (-[VCPCoreMLFeatureProviderGestureVideo ready](self->_featureProvider, "ready")
    && (unint64_t)v13 | (unint64_t)v12)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v72) = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : classify group %d", buf, 8u);
    }
    VCPSignPostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v22);

    VCPSignPostLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPHandGestureVideoRequest_classifier", ", buf, 2u);
    }

    -[VCPCoreMLFeatureProviderGestureVideo setScaleUpSmallHandGroup:](self->_featureProvider, "setScaleUpSmallHandGroup:", 1);
    if (!v12)
    {
      objc_msgSend((id)objc_opt_class(), "enableFlip");
      if (v32 != 0.0)
      {
        v33 = 0;
        v34 = 0;
LABEL_34:
        objc_msgSend((id)objc_opt_class(), "enableFlip");
        v40 = 0;
        if (v13 && v39 != 0.0)
        {
          -[VCPCoreMLFeatureProviderGestureVideo setLrFlip:](self->_featureProvider, "setLrFlip:", 1);
          gestureCoreMLRequest = self->_gestureCoreMLRequest;
          v58 = v34;
          if (self->_MLOptions)
          {
            -[VCPCoreMLRequest model](gestureCoreMLRequest, "model");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            featureProvider = self->_featureProvider;
            MLOptions = self->_MLOptions;
            v45 = &v64;
            v64 = v33;
            objc_msgSend(v42, "predictionFromFeatures:options:error:", featureProvider, MLOptions, &v64);
            v46 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[VCPCoreMLRequest model](gestureCoreMLRequest, "model");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = self->_featureProvider;
            v63 = v33;
            v45 = &v63;
            objc_msgSend(v42, "predictionFromFeatures:error:", v49, &v63);
            v46 = objc_claimAutoreleasedReturnValue();
          }
          v50 = (void *)v46;
          v59 = *v45;

          v34 = v58;
          if (v50)
          {
            objc_msgSend(v50, "featureValueForName:", CFSTR("classLabel_probs"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v51;
            if (v51)
            {
              objc_msgSend(v51, "dictionaryValue");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_51:
              VCPSignPostLog();
              v53 = objc_claimAutoreleasedReturnValue();
              v54 = v53;
              if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v54, OS_SIGNPOST_INTERVAL_END, spid, "VCPHandGestureVideoRequest_classifier", ", buf, 2u);
              }

              v31 = -[VCPHandGestureClassifier processLeftHand:rightHand:results:resultsFlip:faceRects:faceYaws:](self, "processLeftHand:rightHand:results:resultsFlip:faceRects:faceYaws:", v13, v12, v34, v40, v61, v62);
              goto LABEL_63;
            }
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get probs", buf, 2u);
            }

          }
          else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v59, "description");
            v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v56 = objc_msgSend(v55, "UTF8String");
            *(_DWORD *)buf = 136315138;
            v72 = v56;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get output feature %s", buf, 0xCu);

          }
          v40 = 0;
          v31 = -18;
LABEL_63:

          v33 = v59;
          goto LABEL_64;
        }
        v59 = v33;
        goto LABEL_51;
      }
    }
    -[VCPCoreMLFeatureProviderGestureVideo setLrFlip:](self->_featureProvider, "setLrFlip:", 0);
    v25 = self->_gestureCoreMLRequest;
    if (self->_MLOptions)
    {
      -[VCPCoreMLRequest model](v25, "model");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = self->_featureProvider;
      v28 = self->_MLOptions;
      v29 = (id *)&v66;
      v66 = 0;
      objc_msgSend(v26, "predictionFromFeatures:options:error:", v27, v28, &v66);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[VCPCoreMLRequest model](v25, "model");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = self->_featureProvider;
      v65 = 0;
      v29 = (id *)&v65;
      objc_msgSend(v26, "predictionFromFeatures:error:", v35, &v65);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v36 = (void *)v30;
    v33 = *v29;

    if (v36)
    {
      objc_msgSend(v36, "featureValueForName:", CFSTR("classLabel_probs"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        objc_msgSend(v37, "dictionaryValue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_34;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get probs", buf, 2u);
      }

    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v33, "description");
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v48 = objc_msgSend(v47, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v72 = v48;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get output feature %s", buf, 0xCu);

    }
    v31 = -18;
LABEL_64:

    goto LABEL_65;
  }
  v31 = 0;
LABEL_65:

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MLOptions, 0);
  objc_storeStrong((id *)&self->_mitigator, 0);
  objc_storeStrong((id *)&self->_gestureCoreMLRequest, 0);
  objc_storeStrong((id *)&self->_featureProvider, 0);
}

@end

@implementation HMICameraVideoFrameAnalyzerSignificantActivity

- (HMICameraVideoFrameAnalyzerSignificantActivity)initWithMediumConfidenceThresholds:(id)a3 highConfidenceThresholds:(id)a4 analyzerConfiguration:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  HMICameraVideoFrameAnalyzerSignificantActivity *v14;
  HMICameraVideoFrameAnalyzerSignificantActivity *v15;
  void *v16;
  uint64_t i;
  void *v18;
  id v19;
  HMISignificantActivityFcosDetector *v20;
  void *v21;
  uint64_t v22;
  id v23;
  HMISignificantActivityFcosDetector *significantActivityFcosDetector;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *backgroundEvents;
  void *v28;
  int v29;
  HMITorsoClassifier *v30;
  HMITorsoClassifier *torsoClassifier;
  HMIFaceClassifierVIP *v32;
  id v33;
  HMIFaceClassifierVIP *faceClassifier;
  uint64_t v35;
  HMFOSTransaction *transaction;
  HMICameraVideoFrameAnalyzerSignificantActivity *v37;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  objc_super v44;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v44.receiver = self;
  v44.super_class = (Class)HMICameraVideoFrameAnalyzerSignificantActivity;
  v14 = -[HMICameraVideoFrameAnalyzerSignificantActivity init](&v44, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_9;
  objc_storeStrong((id *)&v14->_analyzerConfiguration, a5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 7; ++i)
    objc_msgSend(v16, "setObject:atIndexedSubscript:", &unk_24DC14978, i);
  +[HMICameraVideoFrameAnalyzerSignificantActivity classHierarchyMap](HMICameraVideoFrameAnalyzerSignificantActivity, "classHierarchyMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __138__HMICameraVideoFrameAnalyzerSignificantActivity_initWithMediumConfidenceThresholds_highConfidenceThresholds_analyzerConfiguration_error___block_invoke;
  v41[3] = &unk_24DBEDCF8;
  v42 = v11;
  v19 = v16;
  v43 = v19;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v41);

  objc_storeStrong((id *)&v15->_mediumConfidenceThresholds, a3);
  objc_storeStrong((id *)&v15->_highConfidenceThresholds, a4);
  v20 = [HMISignificantActivityFcosDetector alloc];
  +[HMISignificantActivityFcosDetector defaultNMSConfiguration](HMISignificantActivityFcosDetector, "defaultNMSConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v22 = -[HMISignificantActivityFcosDetector initWithConfidenceThresholds:nmsConfiguration:error:](v20, "initWithConfidenceThresholds:nmsConfiguration:error:", v19, v21, &v40);
  v23 = v40;
  significantActivityFcosDetector = v15->_significantActivityFcosDetector;
  v15->_significantActivityFcosDetector = (HMISignificantActivityFcosDetector *)v22;

  v25 = MEMORY[0x24BDC0D88];
  *(_OWORD *)&v15->_backgroundTimeStamp.value = *MEMORY[0x24BDC0D88];
  v15->_backgroundTimeStamp.epoch = *(_QWORD *)(v25 + 16);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = objc_claimAutoreleasedReturnValue();
  backgroundEvents = v15->_backgroundEvents;
  v15->_backgroundEvents = (NSMutableArray *)v26;

  if (v15->_significantActivityFcosDetector)
  {
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "shouldEnableTorsoRecognition");

    if (!v29
      || (v30 = objc_alloc_init(HMITorsoClassifier),
          torsoClassifier = v15->_torsoClassifier,
          v15->_torsoClassifier = v30,
          torsoClassifier,
          v15->_torsoClassifier))
    {
      v39 = v23;
      v32 = -[HMIFaceClassifierVIP initWithError:]([HMIFaceClassifierVIP alloc], "initWithError:", &v39);
      v33 = v39;

      faceClassifier = v15->_faceClassifier;
      v15->_faceClassifier = v32;

      if (v15->_faceClassifier)
      {
        v35 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("HMICameraVideoFrameAnalyzerSignificantActivity"));
        transaction = v15->_transaction;
        v15->_transaction = (HMFOSTransaction *)v35;

LABEL_9:
        v37 = v15;
        goto LABEL_14;
      }
      v23 = v33;
    }
  }
  if (a6)
  {
    v23 = objc_retainAutorelease(v23);
    *a6 = v23;
  }
  HMIErrorLog(v15, v23);

  v37 = 0;
LABEL_14:

  return v37;
}

void __138__HMICameraVideoFrameAnalyzerSignificantActivity_initWithMediumConfidenceThresholds_highConfidenceThresholds_analyzerConfiguration_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v5, objc_msgSend(v6, "integerValue"));

}

- (CGSize)inputDimensions
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HMICameraVideoFrameAnalyzerSignificantActivity significantActivityFcosDetector](self, "significantActivityFcosDetector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDimensions");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)regionOfInterestForMotionDetections:(id)a3 foregroundEvents:(id)a4 frameSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  double v18;
  double v19;
  double v20;
  double y;
  double x;
  CGRect *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double *p_x;
  double v35;
  double v36;
  double v37;
  double v38;
  _QWORD v39[5];
  uint64_t v40;
  CGRect *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  CGRect result;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  +[HMIMotionDetection firstMotionDetectionInArray:withMode:](HMIMotionDetection, "firstMotionDetectionInArray:withMode:", v9, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v41 = (CGRect *)&v40;
  v42 = 0x4010000000;
  v43 = &unk_219EC7149;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v11, "motionScore");
  if (v12 <= 0.0)
  {
    v17 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
    v44 = *MEMORY[0x24BDBF070];
    v45 = v17;
  }
  else
  {
    objc_msgSend(v11, "boundingBox");
    *(_QWORD *)&v44 = v13;
    *((_QWORD *)&v44 + 1) = v14;
    *(_QWORD *)&v45 = v15;
    *((_QWORD *)&v45 + 1) = v16;
  }
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __113__HMICameraVideoFrameAnalyzerSignificantActivity_regionOfInterestForMotionDetections_foregroundEvents_frameSize___block_invoke;
  v39[3] = &unk_24DBEA4C8;
  v39[4] = &v40;
  objc_msgSend(v10, "na_each:", v39);
  if (CGRectIsNull(v41[1]))
  {
    v20 = v41[1].size.width;
    v19 = v41[1].size.height;
    x = v41[1].origin.x;
    y = v41[1].origin.y;
  }
  else
  {
    LODWORD(v18) = 1.0;
    +[HMIVisionUtilities maintainAspectRatio:originalSize:ratioThreshold:](HMIVisionUtilities, "maintainAspectRatio:originalSize:ratioThreshold:", v41[1].origin.x, v41[1].origin.y, v41[1].size.width, v41[1].size.height, width, height, v18);
    v23 = v41;
    v41[1].origin.x = v24;
    v23[1].origin.y = v25;
    v23[1].size.width = v26;
    v23[1].size.height = v27;
    -[HMICameraVideoFrameAnalyzerSignificantActivity inputDimensions](self, "inputDimensions");
    +[HMIVisionUtilities imposeMinSizeFor:withOriginalSize:minCrop:](HMIVisionUtilities, "imposeMinSizeFor:withOriginalSize:minCrop:", v23[1].origin.x, v23[1].origin.y, v23[1].size.width, v23[1].size.height, width, height, v28, v29);
    x = v30;
    y = v31;
    v20 = v32;
    v19 = v33;
    p_x = &v41->origin.x;
    v41[1].origin.x = v30;
    p_x[5] = v31;
    p_x[6] = v32;
    p_x[7] = v33;
  }
  _Block_object_dispose(&v40, 8);

  v35 = x;
  v36 = y;
  v37 = v20;
  v38 = v19;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

void __113__HMICameraVideoFrameAnalyzerSignificantActivity_regionOfInterestForMotionDetections_foregroundEvents_frameSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v3 = a2;
  objc_msgSend(v3, "boundingBox");
  v20 = v5;
  v21 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(v3, "boundingBox");
  v10 = CGRectGetWidth(v22) * -0.4;
  objc_msgSend(v3, "boundingBox");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v23.origin.x = v12;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v18;
  v19 = CGRectGetHeight(v23) * -0.4;
  v24.origin.y = v20;
  v24.origin.x = v21;
  v24.size.width = v7;
  v24.size.height = v9;
  v25 = CGRectInset(v24, v10, v19);
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v25);
}

- (id)analyzeFrame:(id)a3 regionOfInterest:(CGRect)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  -[HMICameraVideoFrameAnalyzerSignificantActivity analyzePixelBuffer:regionOfInterest:error:](self, "analyzePixelBuffer:regionOfInterest:error:", objc_msgSend(a3, "pixelBuffer"), &v9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (id)getAnalyzerEvents:(id)a3 eventTriggers:(int64_t)a4 enableFaceClassification:(BOOL)a5 enableTorsoRecognition:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char **__ptr32 *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMICameraVideoFrameAnalyzerSignificantActivity *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v36;
  char v37;
  id v38;
  _BOOL4 v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[5];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  _QWORD v47[6];

  v39 = a6;
  v6 = a5;
  v47[4] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  objc_msgSend(v9, "na_filter:", &__block_literal_global_36);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasPreferenceForKey:", CFSTR("personDetected"));
  v13 = MEMORY[0x24BDAC760];
  if ((v12 & 1) != 0)
    goto LABEL_6;
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "hasPreferenceForKey:", CFSTR("petDetected")) & 1) != 0)
  {
LABEL_5:

LABEL_6:
LABEL_7:
    v16 = (void *)MEMORY[0x24BDBCF20];
    v47[0] = objc_opt_class();
    v47[1] = objc_opt_class();
    v47[2] = objc_opt_class();
    v47[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v42[0] = v13;
    v19 = &off_219E9C000;
    v42[1] = 3221225472;
    v42[2] = __130__HMICameraVideoFrameAnalyzerSignificantActivity_getAnalyzerEvents_eventTriggers_enableFaceClassification_enableTorsoRecognition___block_invoke_2;
    v42[3] = &unk_24DBEA4F0;
    v42[4] = self;
    objc_msgSend(v18, "na_map:", v42);
    v20 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v20;
    goto LABEL_8;
  }
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "hasPreferenceForKey:", CFSTR("vehicleDetected")))
  {

    v13 = MEMORY[0x24BDAC760];
    goto LABEL_5;
  }
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v38 = v9;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "hasPreferenceForKey:", CFSTR("packageDetected"));

  v9 = v38;
  v13 = MEMORY[0x24BDAC760];
  if ((v37 & 1) != 0)
    goto LABEL_7;
  v19 = &off_219E9C000;
LABEL_8:
  -[HMICameraVideoFrameAnalyzerSignificantActivity _targetEventsSetFromEventTriggers:enableFaceClassification:enableTorsoRecognition:](self, "_targetEventsSetFromEventTriggers:enableFaceClassification:enableTorsoRecognition:", a4, v6, v39);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v13;
  v40[1] = *((_QWORD *)v19 + 421);
  v40[2] = __130__HMICameraVideoFrameAnalyzerSignificantActivity_getAnalyzerEvents_eventTriggers_enableFaceClassification_enableTorsoRecognition___block_invoke_3;
  v40[3] = &unk_24DBED300;
  v22 = v21;
  v41 = v22;
  objc_msgSend(v10, "na_filter:", v40);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMIFaceUtilities mergedPersonEventsFromEvents:](HMIFaceUtilities, "mergedPersonEventsFromEvents:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hasPreferenceForKey:", CFSTR("syntheticEvents"));

  if (v26)
  {
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringPreferenceForKey:defaultValue:", CFSTR("syntheticEvents"), &stru_24DBF1B40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMIVideoAnalyzerEvent eventsWithContentsOfFile:](HMIVideoAnalyzerEvent, "eventsWithContentsOfFile:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)MEMORY[0x220735570]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v33;
        v45 = 2112;
        v46 = v28;
        _os_log_impl(&dword_219D45000, v32, OS_LOG_TYPE_DEBUG, "%{public}@Reading and injecting synthesized events from path %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      v34 = v29;

      v24 = v34;
    }

  }
  return v24;
}

BOOL __130__HMICameraVideoFrameAnalyzerSignificantActivity_getAnalyzerEvents_eventTriggers_enableFaceClassification_enableTorsoRecognition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "confidenceLevel") == 2;
}

uint64_t __130__HMICameraVideoFrameAnalyzerSignificantActivity_getAnalyzerEvents_eventTriggers_enableFaceClassification_enableTorsoRecognition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_simulatedEventForEventClass:", a2);
}

uint64_t __130__HMICameraVideoFrameAnalyzerSignificantActivity_getAnalyzerEvents_eventTriggers_enableFaceClassification_enableTorsoRecognition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_opt_class());
}

- (id)getPackageEvents:(id)a3 foregroundEvents:(id)a4 newBackgroundEvents:(id)a5 backgroundTimeStamp:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  int64_t var3;
  CMTime time2;
  CMTime time1;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v12, "na_filter:", &__block_literal_global_24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_filter:", &__block_literal_global_25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_3;
  v32[3] = &unk_24DBEDD80;
  v33 = v14;
  v34 = v11;
  v16 = v11;
  v17 = v14;
  objc_msgSend(v13, "na_filter:", v32);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v15;
  v30[1] = 3221225472;
  v30[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_6;
  v30[3] = &unk_24DBED300;
  v31 = v10;
  v19 = v10;
  objc_msgSend(v18, "na_filter:", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMICameraVideoFrameAnalyzerSignificantActivity backgroundTimeStamp](self, "backgroundTimeStamp");
  time2 = *(CMTime *)a6;
  if (CMTimeCompare(&time1, &time2))
  {
    v26 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    -[HMICameraVideoFrameAnalyzerSignificantActivity setBackgroundTimeStamp:](self, "setBackgroundTimeStamp:", &v26);
    -[HMICameraVideoFrameAnalyzerSignificantActivity backgroundEvents](self, "backgroundEvents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeAllObjects");

  }
  -[HMICameraVideoFrameAnalyzerSignificantActivity backgroundEvents](self, "backgroundEvents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  -[HMICameraVideoFrameAnalyzerSignificantActivity _filterPackageEvents:backgroundEvents:](self, "_filterPackageEvents:backgroundEvents:", v20, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v3 == objc_opt_class() && objc_msgSend(v2, "confidenceLevel") == 2;

  return v4;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  double v10;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  if (v4 == v5)
  {
    objc_msgSend(v3, "confidence");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "value");
    if (v6 > 0.41)
    {
      v7 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    objc_msgSend(v3, "confidence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v7 = v10 > 0.44;

  }
  else
  {
    v7 = 0;
  }
  if (v4 == v5)
    goto LABEL_8;
LABEL_9:

  return v7;
}

uint64_t __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  objc_msgSend(v3, "confidence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = MEMORY[0x24BDAC760];
  if (v6 > 0.24)
  {
    v7 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_4;
    v15[3] = &unk_24DBED300;
    v8 = v3;
    v16 = v8;
    LODWORD(v7) = objc_msgSend(v7, "na_any:", v15);

    if ((_DWORD)v7)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    v4 = v16;
  }

  v9 = *(void **)(a1 + 32);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_5;
  v13[3] = &unk_24DBED300;
  v14 = v3;
  v10 = v3;
  v11 = objc_msgSend(v9, "na_any:", v13) ^ 1;

  return v11;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;

  v3 = a2;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    objc_msgSend(*(id *)(a1 + 32), "boundingBox");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v3, "boundingBox");
    v20.origin.x = v14;
    v20.origin.y = v15;
    v20.size.width = v16;
    v20.size.height = v17;
    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.height = v13;
    v5 = CGRectIntersectsRect(v19, v20);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v20;
  CGRect v21;

  v3 = a2;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class() || (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    objc_msgSend(*(id *)(a1 + 32), "boundingBox");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v3, "boundingBox");
    v21.origin.x = v15;
    v21.origin.y = v16;
    v21.size.width = v17;
    v21.size.height = v18;
    v20.origin.x = v8;
    v20.origin.y = v10;
    v20.size.width = v12;
    v20.size.height = v14;
    v6 = CGRectIntersectsRect(v20, v21);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_7;
  v8[3] = &unk_24DBED300;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "boundingBox");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "boundingBox");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  HMICGRectIntersectionOverUnion(v5, v7, v9, v11, v13, v15, v17, v19);
  return v20 > 0.2;
}

- (id)analyzeBackgroundFrame:(id)a3 packageEvents:(id)a4 newBackgroundEvents:(id)a5 regionOfInterest:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a5;
  v14 = a4;
  -[HMICameraVideoFrameAnalyzerSignificantActivity analyzePixelBuffer:regionOfInterest:error:](self, "analyzePixelBuffer:regionOfInterest:error:", objc_msgSend(a3, "pixelBuffer"), 0, x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_filter:", &__block_literal_global_26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "unionSet:", v16);
  -[HMICameraVideoFrameAnalyzerSignificantActivity _filterPackageEvents:backgroundEvents:](self, "_filterPackageEvents:backgroundEvents:", v14, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMICameraVideoFrameAnalyzerSignificantActivity backgroundEvents](self, "backgroundEvents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

  -[HMICameraVideoFrameAnalyzerSignificantActivity backgroundEvents](self, "backgroundEvents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21 >= 0x65)
  {
    do
    {
      -[HMICameraVideoFrameAnalyzerSignificantActivity backgroundEvents](self, "backgroundEvents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hmf_removeFirstObject");

      -[HMICameraVideoFrameAnalyzerSignificantActivity backgroundEvents](self, "backgroundEvents");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

    }
    while (v24 > 0x64);
  }

  return v17;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_analyzeBackgroundFrame_packageEvents_newBackgroundEvents_regionOfInterest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v20;
  void *v21;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  if (v4 == v5)
  {
    objc_msgSend(v3, "confidence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    if (v7 > 0.41)
    {
      v8 = 1;
LABEL_20:

      goto LABEL_21;
    }
    v21 = v6;
  }
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  if (v9 == v10)
  {
    objc_msgSend(v3, "confidence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    if (v12 > 0.44)
    {

      v8 = 1;
      goto LABEL_19;
    }
    v20 = v11;
  }
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  if (v13 == v14
    && (objc_msgSend(v3, "confidence"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "value"),
        v15 > 0.42))
  {

    v8 = 1;
  }
  else
  {
    v16 = objc_opt_class();
    if (v16 == objc_opt_class())
    {
      objc_msgSend(v3, "confidence");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "value");
      v8 = v18 > 0.24;

    }
    else
    {
      v8 = 0;
    }
    if (v13 == v14)

  }
  if (v9 == v10)

LABEL_19:
  v6 = v21;
  if (v4 == v5)
    goto LABEL_20;
LABEL_21:

  return v8;
}

- (id)recognizeEvents:(id)a3 frame:(id)a4 regionOfInterest:(CGRect)a5 homeUUID:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  BOOL IsNull;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];
  CGRect v26;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a4;
  v14 = a6;
  v15 = a3;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  IsNull = CGRectIsNull(v26);
  v17 = 0.0;
  if (IsNull)
    v18 = 1.0;
  else
    v18 = height;
  if (IsNull)
    v19 = 1.0;
  else
    v19 = width;
  if (IsNull)
    v20 = 0.0;
  else
    v20 = y;
  if (!IsNull)
    v17 = x;
  -[HMICameraVideoFrameAnalyzerSignificantActivity _eventsWithClassificationsFromEvents:videoFrame:regionOfInterest:homeUUID:](self, "_eventsWithClassificationsFromEvents:videoFrame:regionOfInterest:homeUUID:", v15, v13, v14, v17, v20, v19, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "presentationTimeStamp");
  else
    memset(v25, 0, sizeof(v25));
  -[HMICameraVideoFrameAnalyzerSignificantActivity _eventsWithSessionEntitiesFromEvents:regionOfInterest:timeStamp:homeUUID:](self, "_eventsWithSessionEntitiesFromEvents:regionOfInterest:timeStamp:homeUUID:", v21, v25, v14, x, y, width, height);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMICameraVideoFrameAnalyzerSignificantActivity eventsWithFaceEventsFromTorsoEventsFromEvents:homeUUID:](self, "eventsWithFaceEventsFromTorsoEventsFromEvents:homeUUID:", v22, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)analyzePixelBuffer:(__CVBuffer *)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v12;
  double Size;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __CVBuffer *v25;
  double v26;
  double v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (CGRectIsNull(a4))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    Size = HMICVPixelBufferGetSize(a3);
    HMICGRectPixelFromNormalized(x, y, width, height, Size, v14);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[HMICameraVideoFrameAnalyzerSignificantActivity inputDimensions](self, "inputDimensions");
    v25 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a3, CVPixelBufferGetPixelFormatType(a3), 0, a5, v16, v18, v20, v22, v23, v24);
    v26 = HMICVPixelBufferGetSize(a3);
    -[HMICameraVideoFrameAnalyzerSignificantActivity _predictEventsFromCropPixelBuffer:cropRect:imageSize:error:](self, "_predictEventsFromCropPixelBuffer:cropRect:imageSize:error:", v25, a5, v16, v18, v20, v22, v26, v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(v25);
  }
  return v12;
}

- (id)_predictEventsFromCropPixelBuffer:(__CVBuffer *)a3 cropRect:(CGRect)a4 imageSize:(CGSize)a5 error:(id *)a6
{
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  height = a5.height;
  width = a5.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMICameraVideoFrameAnalyzerSignificantActivity significantActivityFcosDetector](self, "significantActivityFcosDetector");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v16, "predict:detectedObjects:error:", a3, v15, a6);

  if ((a6 & 1) != 0)
  {
    +[HMIObjectDetectionUtils convertObjectDetections:cropRect:originalImageSize:](HMIObjectDetectionUtils, "convertObjectDetections:cropRect:originalImageSize:", v15, x, y, v10, v9, width, height);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMICameraVideoFrameAnalyzerSignificantActivity _analyzerEventsFromObjectDetections:](self, "_analyzerEventsFromObjectDetections:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)flushAndGetAnalysisStateUpdateForHome:(id)a3 enableFaceClassification:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  HMIAnalysisStateUpdate *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  HMICameraVideoFrameAnalyzerSignificantActivity *v13;
  NSObject *v14;
  void *v15;
  HMIAnalysisStateUpdate *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = 0;
  if (v6 && v4)
  {
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldEnableTorsoRecognition");

    if (!v9)
    {
LABEL_6:
      v7 = 0;
      goto LABEL_10;
    }
    -[HMICameraVideoFrameAnalyzerSignificantActivity sessionEntityManager](self, "sessionEntityManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateTorsoModelAndGetTorsoAnnotationsForHome:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "hmf_isEmpty"))
    {

      goto LABEL_6;
    }
    v12 = (void *)MEMORY[0x220735570]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v15;
      v21 = 2048;
      v22 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_INFO, "%{public}@Creating analysis state update with %lu torso annotations", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v16 = [HMIAnalysisStateUpdate alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMIAnalysisStateUpdate initWithTorsoAnnotations:](v16, "initWithTorsoAnnotations:", v17);

  }
LABEL_10:

  return v7;
}

- (id)eventsWithFaceEventsFromTorsoEventsFromEvents:(id)a3 homeUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  HMICameraVideoFrameAnalyzerSignificantActivity *v12;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __105__HMICameraVideoFrameAnalyzerSignificantActivity_eventsWithFaceEventsFromTorsoEventsFromEvents_homeUUID___block_invoke;
  v10[3] = &unk_24DBEDDF0;
  v11 = v6;
  v12 = self;
  v7 = v6;
  objc_msgSend(a3, "na_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

HMIVideoAnalyzerEventPerson *__105__HMICameraVideoFrameAnalyzerSignificantActivity_eventsWithFaceEventsFromTorsoEventsFromEvents_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMIVideoAnalyzerEventFace *v10;
  void *v11;
  void *v12;
  void *v13;
  HMIVideoAnalyzerEventPerson *v14;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  HMIPersonsModelPrediction *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  HMIVideoAnalyzerEventFace *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  HMIFaceRecognition *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  HMIFaceRecognition *v60;
  void *v61;
  HMIFaceRecognition *v62;
  HMIVideoAnalyzerEventFace *v63;
  void *v64;
  HMIVideoAnalyzerEventFace *v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  HMIVideoAnalyzerEventPerson *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  void *v85;
  HMIVideoAnalyzerEventFace *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  _QWORD v99[4];
  id v100;
  id v101;
  id v102;
  id v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  HMIVideoAnalyzerEventFace *v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  id v111;
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "torso");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "torsoRecognition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v14 = (HMIVideoAnalyzerEventPerson *)v3;
    goto LABEL_12;
  }
  objc_msgSend(v5, "face");
  v10 = (HMIVideoAnalyzerEventFace *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerEventFace faceRecognition](v10, "faceRecognition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_8;
  -[HMIVideoAnalyzerEvent userInfo](v10, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FaceFilteredState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HMIFaceFilteredStateAsString(2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  v98 = a1;
  -[HMIVideoAnalyzerEvent userInfo](v10, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("FaceFilteredState"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HMIFaceFilteredStateAsString(4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v5, "torso");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "torsoRecognition");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "classification");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMIPersonsModelManager sharedInstance](HMIPersonsModelManager, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v98;
    v23 = *(_QWORD *)(v98 + 32);
    objc_msgSend(v20, "personUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sourceUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "faceCropFromTorsoModelForHomeUUID:personUUID:sourceUUID:", v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v95 = (void *)v26;
    if (v26)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMIFaceprint sentinelFaceprintWithUUID:modelUUID:faceCropUUID:](HMIFaceprint, "sentinelFaceprintWithUUID:modelUUID:faceCropUUID:", v27, v28, v29);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = [HMIPersonsModelPrediction alloc];
      objc_msgSend(v20, "sourceUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "personUUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v20, "confidence");
      objc_msgSend(v33, "numberWithDouble:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[HMIPersonsModelPrediction initWithSourceUUID:personUUID:confidence:linkedEntityUUID:](v30, "initWithSourceUUID:personUUID:confidence:linkedEntityUUID:", v31, v32, v34, 0);

      +[HMIPersonsModelManager sharedInstance](HMIPersonsModelManager, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(v98 + 32);
      v103 = 0;
      v92 = (void *)v35;
      objc_msgSend(v36, "linkedPredictionsForPrediction:homeUUID:error:", v35, v37, &v103);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v103;

      if (!v38 || objc_msgSend(v38, "hmf_isEmpty"))
      {
        v93 = v38;
        v39 = (void *)MEMORY[0x220735570]();
        v40 = *(id *)(v98 + 40);
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "personUUID");
          v43 = (HMIVideoAnalyzerEventFace *)objc_claimAutoreleasedReturnValue();
          v44 = *(void **)(v98 + 32);
          *(_DWORD *)buf = 138544130;
          v105 = v42;
          v106 = 2112;
          v107 = v43;
          v108 = 2112;
          v109 = v44;
          v110 = 2112;
          v111 = v91;
          _os_log_impl(&dword_219D45000, v41, OS_LOG_TYPE_ERROR, "%{public}@Couldn't retrieve linked predictions from torsomodel for personUUID: %@ homeUUID: %@ error: %@", buf, 0x2Au);

          v22 = v98;
        }

        objc_autoreleasePoolPop(v39);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v92);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v10)
      {
        v45 = (void *)MEMORY[0x220735570]();
        v46 = *(id *)(v22 + 40);
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v105 = v48;
          v106 = 2112;
          v107 = v10;
          _os_log_impl(&dword_219D45000, v47, OS_LOG_TYPE_INFO, "%{public}@Dropping Face event: %@ due to torso recognition", buf, 0x16u);

          v22 = v98;
        }

        objc_autoreleasePoolPop(v45);
        v49 = *(_QWORD *)(v22 + 32);
        objc_msgSend(*(id *)(v22 + 40), "analyzerConfiguration");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "camera");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMIAnalytics sendEventForFaceEvent:homePersonManagerUUID:camera:](HMIAnalytics, "sendEventForFaceEvent:homePersonManagerUUID:camera:", v10, v49, v51);

      }
      v90 = v20;
      v99[0] = MEMORY[0x24BDAC760];
      v99[1] = 3221225472;
      v99[2] = __105__HMICameraVideoFrameAnalyzerSignificantActivity_eventsWithFaceEventsFromTorsoEventsFromEvents_homeUUID___block_invoke_35;
      v99[3] = &unk_24DBEDDC8;
      v52 = v96;
      v100 = v52;
      v53 = v95;
      v101 = v53;
      v54 = v88;
      v102 = v54;
      v94 = v38;
      objc_msgSend(v38, "na_map:", v99);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = [HMIFaceRecognition alloc];
      objc_msgSend(v52, "predictedLinkedEntityUUIDs");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v52, "sessionEntityAssignment");
      objc_msgSend(v52, "sessionEntityUUID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v56;
      v89 = v54;
      v61 = (void *)v55;
      v62 = -[HMIFaceRecognition initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:](v60, "initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:", v53, v54, v55, v57, v58, v59, 1.0);

      v63 = [HMIVideoAnalyzerEventFace alloc];
      objc_msgSend(v97, "confidence");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "boundingBox");
      v65 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:faceRecognition:](v63, "initWithConfidence:boundingBox:faceRecognition:", v64, v62);

      v66 = (void *)MEMORY[0x220735570]();
      v67 = *(id *)(v98 + 40);
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v105 = v69;
        v106 = 2112;
        v107 = v65;
        v108 = 2112;
        v109 = v97;
        _os_log_impl(&dword_219D45000, v68, OS_LOG_TYPE_INFO, "%{public}@Creating face recognition event: %@ from torso recognition event: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v66);
      v70 = [HMIVideoAnalyzerEventPerson alloc];
      objc_msgSend(v5, "confidence");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "boundingBox");
      v73 = v72;
      v75 = v74;
      v77 = v76;
      v79 = v78;
      objc_msgSend(v5, "torso");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:torso:](v70, "initWithConfidence:boundingBox:face:torso:", v71, v65, v80, v73, v75, v77, v79);

      v81 = v96;
      v20 = v90;
    }
    else
    {
      v82 = (void *)MEMORY[0x220735570]();
      v83 = *(id *)(v98 + 40);
      HMFGetOSLogHandle();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "personUUID");
        v86 = (HMIVideoAnalyzerEventFace *)objc_claimAutoreleasedReturnValue();
        v87 = *(void **)(v98 + 32);
        *(_DWORD *)buf = 138543874;
        v105 = v85;
        v106 = 2112;
        v107 = v86;
        v108 = 2112;
        v109 = v87;
        _os_log_impl(&dword_219D45000, v84, OS_LOG_TYPE_ERROR, "%{public}@Error while retrieving facecrop from torsomodel for personUUID: %@ homeUUID: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v82);
      v14 = (HMIVideoAnalyzerEventPerson *)v5;
      v81 = v96;
    }

    goto LABEL_10;
  }
LABEL_9:
  v14 = (HMIVideoAnalyzerEventPerson *)v5;
LABEL_10:

LABEL_12:
  return v14;
}

HMIFaceClassification *__105__HMICameraVideoFrameAnalyzerSignificantActivity_eventsWithFaceEventsFromTorsoEventsFromEvents_homeUUID___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  HMIFaceClassification *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HMIFaceClassification *v11;

  v3 = a2;
  v4 = [HMIFaceClassification alloc];
  objc_msgSend(v3, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionEntityUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "confidence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v11 = -[HMIFaceClassification initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:fromTorsoClassification:familiarity:](v4, "initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:fromTorsoClassification:familiarity:", v5, v6, v7, v9, v8, 1, 2);

  return v11;
}

- (id)_simulatedEventForEventClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __objc2_class *v23;
  id v24;
  HMIConfidence *v25;
  uint64_t v26;
  HMIVideoAnalyzerEventFace *v27;
  HMIVideoAnalyzerEventTorso *v28;
  _QWORD v30[2];
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v31[0] = objc_opt_class();
  v32[0] = CFSTR("personDetected");
  v31[1] = objc_opt_class();
  v32[1] = CFSTR("petDetected");
  v31[2] = objc_opt_class();
  v32[2] = CFSTR("vehicleDetected");
  v31[3] = objc_opt_class();
  v32[3] = CFSTR("packageDetected");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valuePreferenceForKey:defaultValue:withParser:", v6, CFSTR("none"), &__block_literal_global_45_2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DC152C0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v8);

    if (!v10
      || (objc_msgSend(&unk_24DC15720, "objectForKeyedSubscript:", v8),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "integerValue"),
          v11,
          (Class)objc_opt_class() == a3)
      && v12 == 1)
    {
      v13 = 0;
LABEL_24:

      goto LABEL_25;
    }
    if (v12 == 2)
    {
      v14 = 1.0;
    }
    else
    {
      v14 = 0.0;
      if (v12 == 1)
      {
        -[HMICameraVideoFrameAnalyzerSignificantActivity highConfidenceThresholds](self, "highConfidenceThresholds");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v14 = v17 + -0.01;

      }
    }
    -[HMICameraVideoFrameAnalyzerSignificantActivity mediumConfidenceThresholds](self, "mediumConfidenceThresholds");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v19;
    -[HMICameraVideoFrameAnalyzerSignificantActivity highConfidenceThresholds](self, "highConfidenceThresholds");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((Class)objc_opt_class() == a3)
    {
      v23 = HMIVideoAnalyzerEventPerson;
    }
    else
    {
      if ((Class)objc_opt_class() == a3)
      {
        v27 = [HMIVideoAnalyzerEventFace alloc];
        v25 = -[HMIConfidence initWithValue:levelThresholds:]([HMIConfidence alloc], "initWithValue:levelThresholds:", v22, v14);
        v26 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v27, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v25, &unk_24DC149C0, &unk_24DC149C0, 0, 0, 0.0, 0.0, 1.0, 1.0);
        goto LABEL_22;
      }
      if ((Class)objc_opt_class() == a3)
      {
        v28 = [HMIVideoAnalyzerEventTorso alloc];
        v25 = -[HMIConfidence initWithValue:levelThresholds:]([HMIConfidence alloc], "initWithValue:levelThresholds:", v22, v14);
        v26 = -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](v28, "initWithConfidence:boundingBox:roll:torsoRecognition:", v25, &unk_24DC149C0, 0, 0.0, 0.0, 1.0, 1.0);
        goto LABEL_22;
      }
      if ((Class)objc_opt_class() == a3)
      {
        v23 = HMIVideoAnalyzerEventPet;
      }
      else if ((Class)objc_opt_class() == a3)
      {
        v23 = HMIVideoAnalyzerEventVehicle;
      }
      else
      {
        if ((Class)objc_opt_class() != a3)
        {
          v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        v23 = HMIVideoAnalyzerEventPackage;
      }
    }
    v24 = [v23 alloc];
    v25 = -[HMIConfidence initWithValue:levelThresholds:]([HMIConfidence alloc], "initWithValue:levelThresholds:", v22, v14);
    v26 = objc_msgSend(v24, "initWithConfidence:boundingBox:", v25, 0.0, 0.0, 1.0, 1.0);
LABEL_22:
    v13 = (void *)v26;

    goto LABEL_23;
  }
  v13 = 0;
LABEL_25:

  return v13;
}

__CFString *__79__HMICameraVideoFrameAnalyzerSignificantActivity__simulatedEventForEventClass___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "lowercaseString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_9;
    }
    v4 = objc_msgSend(v2, "BOOLValue");
    v5 = CFSTR("none");
    if (v4)
      v5 = CFSTR("high");
    v3 = v5;
  }
  v6 = v3;
LABEL_9:

  return v6;
}

- (id)_targetEventsSetFromEventTriggers:(int64_t)a3 enableFaceClassification:(BOOL)a4 enableTorsoRecognition:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  char v7;
  void *v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 2) != 0)
  {
    objc_msgSend(v8, "addObject:", objc_opt_class());
    if (v6)
    {
      objc_msgSend(v8, "addObject:", objc_opt_class());
      if (v5)
        objc_msgSend(v8, "addObject:", objc_opt_class());
    }
  }
  if ((v7 & 4) == 0)
  {
    if ((v7 & 8) == 0)
      goto LABEL_7;
LABEL_11:
    objc_msgSend(v8, "addObject:", objc_opt_class());
    if ((v7 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v8, "addObject:", objc_opt_class());
  if ((v7 & 8) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v7 & 0x10) != 0)
LABEL_8:
    objc_msgSend(v8, "addObject:", objc_opt_class());
LABEL_9:
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (id)_analyzerEventsFromObjectDetections:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x24BDBCF20];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __86__HMICameraVideoFrameAnalyzerSignificantActivity__analyzerEventsFromObjectDetections___block_invoke;
  v7[3] = &unk_24DBEDE58;
  v7[4] = self;
  objc_msgSend(a3, "na_map:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

HMIVideoAnalyzerEventFace *__86__HMICameraVideoFrameAnalyzerSignificantActivity__analyzerEventsFromObjectDetections___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMIVideoAnalyzerEventFace *v10;
  __objc2_class *v11;
  id v12;
  HMIConfidence *v13;
  HMIConfidence *v14;
  HMIVideoAnalyzerEventFace *v15;
  HMIConfidence *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  HMIVideoAnalyzerEventTorso *v27;
  HMIConfidence *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "labelIndex");
  objc_opt_class();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediumConfidenceThresholds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v6;
  objc_msgSend(*(id *)(a1 + 32), "highConfidenceThresholds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == (id)objc_opt_class())
  {
    v11 = HMIVideoAnalyzerEventPerson;
LABEL_9:
    v12 = [v11 alloc];
    v13 = [HMIConfidence alloc];
    objc_msgSend(v3, "confidence");
    v14 = -[HMIConfidence initWithValue:levelThresholds:](v13, "initWithValue:levelThresholds:", v9);
    objc_msgSend(v3, "boundingBox");
    v10 = (HMIVideoAnalyzerEventFace *)objc_msgSend(v12, "initWithConfidence:boundingBox:", v14);
LABEL_13:

    goto LABEL_14;
  }
  if (v4 == (id)objc_opt_class())
  {
    v15 = [HMIVideoAnalyzerEventFace alloc];
    v16 = [HMIConfidence alloc];
    objc_msgSend(v3, "confidence");
    v14 = -[HMIConfidence initWithValue:levelThresholds:](v16, "initWithValue:levelThresholds:", v9);
    objc_msgSend(v3, "boundingBox");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v3, "yaw");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "roll");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v15, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v14, v25, v26, 0, 0, v18, v20, v22, v24);

LABEL_12:
    goto LABEL_13;
  }
  if (v4 == (id)objc_opt_class())
  {
    v27 = [HMIVideoAnalyzerEventTorso alloc];
    v28 = [HMIConfidence alloc];
    objc_msgSend(v3, "confidence");
    v14 = -[HMIConfidence initWithValue:levelThresholds:](v28, "initWithValue:levelThresholds:", v9);
    objc_msgSend(v3, "boundingBox");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    objc_msgSend(v3, "roll");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](v27, "initWithConfidence:boundingBox:roll:torsoRecognition:", v14, v25, 0, v30, v32, v34, v36);
    goto LABEL_12;
  }
  if (v4 == (id)objc_opt_class())
  {
    v11 = HMIVideoAnalyzerEventPet;
    goto LABEL_9;
  }
  if (v4 == (id)objc_opt_class())
  {
    v11 = HMIVideoAnalyzerEventVehicle;
    goto LABEL_9;
  }
  if (v4 == (id)objc_opt_class())
  {
    v11 = HMIVideoAnalyzerEventPackage;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (id)_filterPackageEvents:(id)a3 backgroundEvents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __88__HMICameraVideoFrameAnalyzerSignificantActivity__filterPackageEvents_backgroundEvents___block_invoke;
  v9[3] = &unk_24DBED300;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __88__HMICameraVideoFrameAnalyzerSignificantActivity__filterPackageEvents_backgroundEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88__HMICameraVideoFrameAnalyzerSignificantActivity__filterPackageEvents_backgroundEvents___block_invoke_2;
  v8[3] = &unk_24DBED300;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

BOOL __88__HMICameraVideoFrameAnalyzerSignificantActivity__filterPackageEvents_backgroundEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGRect v34;
  CGRect v35;

  v3 = a2;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    objc_msgSend(*(id *)(a1 + 32), "boundingBox");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v3, "boundingBox");
    HMICGRectIntersectionOverUnion(v9, v11, v13, v15, v16, v17, v18, v19);
    v7 = v20 > 0.4;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class()))
    {
      objc_msgSend(*(id *)(a1 + 32), "boundingBox");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      objc_msgSend(v3, "boundingBox");
      v35.origin.x = v29;
      v35.origin.y = v30;
      v35.size.width = v31;
      v35.size.height = v32;
      v34.origin.x = v22;
      v34.origin.y = v24;
      v34.size.width = v26;
      v34.size.height = v28;
      v7 = CGRectIntersectsRect(v34, v35);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_eventsWithClassificationsFromEvents:(id)a3 videoFrame:(id)a4 regionOfInterest:(CGRect)a5 homeUUID:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  BOOL v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  HMICameraVideoFrameAnalyzerSignificantActivity *v27;
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  BOOL v36;
  _QWORD v37[3];
  int v38;
  _QWORD v39[3];
  int v40;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[HMIPreference isProductTypeJ105](HMIPreference, "isProductTypeJ105")
     && (+[HMIThermalMonitor sharedInstance](HMIThermalMonitor, "sharedInstance"),
         v17 = (void *)objc_claimAutoreleasedReturnValue(),
         v18 = objc_msgSend(v17, "thermalLevel"),
         v17,
         v18 > 1)
     || +[HMIPreference isProductTypeB238](HMIPreference, "isProductTypeB238");
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity__eventsWithClassificationsFromEvents_videoFrame_regionOfInterest_homeUUID___block_invoke;
  v25[3] = &unk_24DBEDE80;
  v20 = v16;
  v30 = v39;
  v26 = v20;
  v27 = self;
  v21 = v14;
  v28 = v21;
  v36 = v19;
  v22 = v15;
  v29 = v22;
  v31 = v37;
  v32 = x;
  v33 = y;
  v34 = width;
  v35 = height;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
  v23 = (void *)objc_msgSend(v20, "copy");

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  return v23;
}

void __124__HMICameraVideoFrameAnalyzerSignificantActivity__eventsWithClassificationsFromEvents_videoFrame_regionOfInterest_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  HMISignpost *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  HMISignpost *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *context;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    goto LABEL_30;
  }
  objc_msgSend(v5, "face");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8), v8 = *(_DWORD *)(v7 + 24), v8 > 4))
  {
    v14 = 0;
    goto LABEL_18;
  }
  *(_DWORD *)(v7 + 24) = v8 + 1;
  v9 = -[HMISignpost initWithName:]([HMISignpost alloc], "initWithName:", CFSTR("ClassifyFaceEvent"));
  v10 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v11 = objc_msgSend(*(id *)(a1 + 48), "pixelBuffer");
  v12 = *(unsigned __int8 *)(a1 + 112);
  v13 = *(_QWORD *)(a1 + 56);
  v43 = 0;
  objc_msgSend(v10, "classifyFaceEvent:pixelBuffer:fastMode:homeUUID:error:", v6, v11, v12, v13, &v43);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v43;
  v16 = -[HMISignpost end](v9, "end");
  if (!v14)
  {
    v18 = (void *)MEMORY[0x220735570](v16);
    v19 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = v18;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v21;
      v46 = 2112;
      v47 = v6;
      v48 = 2112;
      v49 = v15;
      v22 = "%{public}@Faceprinting failed for face: %@, error: %@";
      v23 = v20;
      v24 = OS_LOG_TYPE_ERROR;
      v25 = 32;
      goto LABEL_15;
    }
LABEL_16:

    objc_autoreleasePoolPop(v18);
    goto LABEL_17;
  }
  objc_msgSend((id)v14, "faceRecognition");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = (void *)MEMORY[0x220735570]();
    v19 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = v18;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v21;
      v46 = 2112;
      v47 = v6;
      v22 = "%{public}@Face: %@ didn't produce any classifications";
      v23 = v20;
      v24 = OS_LOG_TYPE_INFO;
      v25 = 22;
LABEL_15:
      _os_log_impl(&dword_219D45000, v23, v24, v22, buf, v25);

      v18 = v40;
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_17:

LABEL_18:
  objc_msgSend(v5, "torso");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 && (v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8), v28 = *(_DWORD *)(v27 + 24), v28 <= 4))
  {
    *(_DWORD *)(v27 + 24) = v28 + 1;
    v29 = -[HMISignpost initWithName:]([HMISignpost alloc], "initWithName:", CFSTR("ClassifyTorsoEvent"));
    v30 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v31 = objc_msgSend(*(id *)(a1 + 48), "pixelBuffer");
    v32 = *(_QWORD *)(a1 + 56);
    v42 = 0;
    objc_msgSend(v30, "classifyTorsoEvent:regionOfInterest:pixelBuffer:homeUUID:error:", v26, v31, v32, &v42, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v42;
    v35 = -[HMISignpost end](v29, "end");
    if (!v33)
    {
      context = (void *)MEMORY[0x220735570](v35);
      v41 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v38;
        v46 = 2112;
        v47 = v26;
        v48 = 2112;
        v49 = v34;
        _os_log_impl(&dword_219D45000, v36, OS_LOG_TYPE_ERROR, "%{public}@Torsoprinting failed for torso: %@, error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(context);
    }

  }
  else
  {
    v33 = 0;
  }
  if (v14 | v33)
  {
    v37 = (void *)objc_msgSend(v5, "copyWithFaceEvent:torso:", v14, v33);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v37);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

LABEL_30:
}

- (id)_eventsWithSessionEntitiesFromEvents:(id)a3 regionOfInterest:(CGRect)a4 timeStamp:(id *)a5 homeUUID:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  HMISessionEntityManager *v21;
  HMISessionEntityManager *sessionEntityManager;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  int64_t var3;
  _QWORD v29[4];
  id v30;
  id v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDBCEF0];
  v15 = a3;
  objc_msgSend(v14, "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __123__HMICameraVideoFrameAnalyzerSignificantActivity__eventsWithSessionEntitiesFromEvents_regionOfInterest_timeStamp_homeUUID___block_invoke;
  v29[3] = &unk_24DBEDEA8;
  v18 = v17;
  v30 = v18;
  v19 = v16;
  v31 = v19;
  objc_msgSend(v15, "na_each:", v29);

  -[HMICameraVideoFrameAnalyzerSignificantActivity sessionEntityManager](self, "sessionEntityManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v21 = objc_alloc_init(HMISessionEntityManager);
    sessionEntityManager = self->_sessionEntityManager;
    self->_sessionEntityManager = v21;

  }
  if ((objc_msgSend(v18, "hmf_isEmpty") & 1) == 0)
  {
    -[HMICameraVideoFrameAnalyzerSignificantActivity sessionEntityManager](self, "sessionEntityManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    objc_msgSend(v23, "assignSessionEntitiesToPersonEvents:regionOfInterest:timeStamp:homeUUID:", v18, &v27, v13, x, y, width, height);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "unionSet:", v24);
  }
  v25 = (void *)objc_msgSend(v19, "copy");

  return v25;
}

void __123__HMICameraVideoFrameAnalyzerSignificantActivity__eventsWithSessionEntitiesFromEvents_regionOfInterest_timeStamp_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v7;
  else
    v3 = 0;
  v4 = v3;
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v6 = v7;
  }
  objc_msgSend(v5, "addObject:", v6);

}

+ (NSDictionary)classHierarchyMap
{
  if (classHierarchyMap_onceToken != -1)
    dispatch_once(&classHierarchyMap_onceToken, &__block_literal_global_70);
  return (NSDictionary *)(id)classHierarchyMap_hierarchyMap;
}

void __67__HMICameraVideoFrameAnalyzerSignificantActivity_classHierarchyMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24DC14990;
  v3[0] = objc_opt_class();
  v2[1] = &unk_24DC149D8;
  v3[1] = objc_opt_class();
  v2[2] = &unk_24DC149A8;
  v3[2] = objc_opt_class();
  v2[3] = &unk_24DC149F0;
  v3[3] = objc_opt_class();
  v2[4] = &unk_24DC14A08;
  v3[4] = objc_opt_class();
  v2[5] = &unk_24DC14A20;
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)classHierarchyMap_hierarchyMap;
  classHierarchyMap_hierarchyMap = v0;

}

+ (id)labelIndexForEventClass:(Class)a3
{
  if (labelIndexForEventClass__onceToken != -1)
    dispatch_once(&labelIndexForEventClass__onceToken, &__block_literal_global_75_0);
  return (id)objc_msgSend((id)labelIndexForEventClass__map, "objectForKeyedSubscript:", a3);
}

void __74__HMICameraVideoFrameAnalyzerSignificantActivity_labelIndexForEventClass___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v3[0] = &unk_24DC14990;
  v2[1] = objc_opt_class();
  v3[1] = &unk_24DC149A8;
  v2[2] = objc_opt_class();
  v3[2] = &unk_24DC149D8;
  v2[3] = objc_opt_class();
  v3[3] = &unk_24DC149F0;
  v2[4] = objc_opt_class();
  v3[4] = &unk_24DC14A08;
  v2[5] = objc_opt_class();
  v3[5] = &unk_24DC14A20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)labelIndexForEventClass__map;
  labelIndexForEventClass__map = v0;

}

+ (id)desLabelIndexForEventClass:(Class)a3
{
  if (desLabelIndexForEventClass__onceToken != -1)
    dispatch_once(&desLabelIndexForEventClass__onceToken, &__block_literal_global_76);
  return (id)objc_msgSend((id)desLabelIndexForEventClass__map, "objectForKeyedSubscript:", a3);
}

void __77__HMICameraVideoFrameAnalyzerSignificantActivity_desLabelIndexForEventClass___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v3[0] = &unk_24DC14990;
  v2[1] = objc_opt_class();
  v3[1] = &unk_24DC14A38;
  v2[2] = objc_opt_class();
  v3[2] = &unk_24DC149D8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)desLabelIndexForEventClass__map;
  desLabelIndexForEventClass__map = v0;

}

- (NSDictionary)mediumConfidenceThresholds
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)highConfidenceThresholds
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (HMISignificantActivityFcosDetector)significantActivityFcosDetector
{
  return (HMISignificantActivityFcosDetector *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)backgroundEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundTimeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_backgroundTimeStamp, 24, 1, 0);
  return result;
}

- (void)setBackgroundTimeStamp:(id *)a3
{
  objc_copyStruct(&self->_backgroundTimeStamp, a3, 24, 1, 0);
}

- (HMIFaceClassifierVIP)faceClassifier
{
  return (HMIFaceClassifierVIP *)objc_getProperty(self, a2, 40, 1);
}

- (HMITorsoClassifier)torsoClassifier
{
  return (HMITorsoClassifier *)objc_getProperty(self, a2, 48, 1);
}

- (HMFOSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (HMIVideoAnalyzerConfiguration)analyzerConfiguration
{
  return (HMIVideoAnalyzerConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (HMISessionEntityManager)sessionEntityManager
{
  return (HMISessionEntityManager *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEntityManager, 0);
  objc_storeStrong((id *)&self->_analyzerConfiguration, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_torsoClassifier, 0);
  objc_storeStrong((id *)&self->_faceClassifier, 0);
  objc_storeStrong((id *)&self->_backgroundEvents, 0);
  objc_storeStrong((id *)&self->_significantActivityFcosDetector, 0);
  objc_storeStrong((id *)&self->_highConfidenceThresholds, 0);
  objc_storeStrong((id *)&self->_mediumConfidenceThresholds, 0);
}

@end

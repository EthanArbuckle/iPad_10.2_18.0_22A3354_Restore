@implementation OpticalFlowAnalyzer

- (OpticalFlowAnalyzer)init
{
  OpticalFlowAnalyzer *v2;
  OpticalFlowAnalyzer *v3;
  os_log_t v4;
  OS_os_log *logger;
  OpticalFlowAnalyzer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OpticalFlowAnalyzer;
  v2 = -[FRCMetalBase init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[OpticalFlowAnalyzer setupMetal](v2, "setupMetal");
    v4 = os_log_create("com.apple.FRC", "FlowAnalyzer");
    logger = v3->_logger;
    v3->_logger = (OS_os_log *)v4;

    v3->_handDetectionEnabled = 0;
    v3->_bodyDetectionEnabled = 1;
    v3->_humanDetectionEnabled = 1;
    v3->_animalFaceDetectionEnabled = 1;
    v3->_confidenceScore = 1.0;
    v3->_confidenceScoreOnDemand = 1.0;
    -[OpticalFlowAnalyzer setDetectorsFromDefaults](v3, "setDetectorsFromDefaults");
    v6 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_donwsampledSourceBuffer);
  NSLog(CFSTR("[FlowAnalysis] Detection executed %d times"), self->_timesDidRunDetection);
  v3.receiver = self;
  v3.super_class = (Class)OpticalFlowAnalyzer;
  -[OpticalFlowAnalyzer dealloc](&v3, sel_dealloc);
}

- (void)setDetectorsFromDefaults
{
  int AppBooleanValue;
  int v4;
  int v5;
  int v6;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("HandDetection"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    self->_handDetectionEnabled = AppBooleanValue != 0;
  v4 = CFPreferencesGetAppBooleanValue(CFSTR("BodyDetection"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    self->_bodyDetectionEnabled = v4 != 0;
  v5 = CFPreferencesGetAppBooleanValue(CFSTR("HumanDetection"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    self->_humanDetectionEnabled = v5 != 0;
  v6 = CFPreferencesGetAppBooleanValue(CFSTR("AnimalFaceDetection"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    self->_animalFaceDetectionEnabled = v6 != 0;
}

- (void)setupMetal
{
  MTLComputePipelineState *v3;
  MTLComputePipelineState *flowStatisticsKernel;
  MTLComputePipelineState *v5;
  MTLComputePipelineState *crossFlowStatisticsKernel;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *motionHistogramsKernel;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *backwarpStatisticsKernel;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("calcFlowStatistics"));
  v3 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  flowStatisticsKernel = self->_flowStatisticsKernel;
  self->_flowStatisticsKernel = v3;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("calcCrossFlowStatistics"));
  v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  crossFlowStatisticsKernel = self->_crossFlowStatisticsKernel;
  self->_crossFlowStatisticsKernel = v5;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("calcMotionHistograms"));
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  motionHistogramsKernel = self->_motionHistogramsKernel;
  self->_motionHistogramsKernel = v7;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("calcBackwarpStatistics"));
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  backwarpStatisticsKernel = self->_backwarpStatisticsKernel;
  self->_backwarpStatisticsKernel = v9;

}

- (void)reset
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  float v7;
  void *v8;
  float v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  float v22;
  unint64_t useCase;
  float v24;
  float v25;
  void *v26;
  float v27;
  void *v28;
  float v29;
  void *v30;
  float v31;
  void *v32;
  float v33;
  void *v34;
  float v35;
  void *v36;
  float v37;
  void *v38;
  float v39;
  void *v40;
  float v41;
  void *v42;
  float v43;
  void *v44;
  float v45;
  void *v46;
  float v47;
  void *v48;
  float v49;
  void *v50;
  float v51;
  void *v52;
  float v53;
  void *v54;
  float v55;
  void *v56;
  float v57;
  void *v58;
  float v59;
  void *v60;
  float v61;
  void *v62;
  float v63;
  void *v64;
  float v65;
  void *v66;
  float v67;
  void *v68;
  float v69;
  void *v70;
  uint64_t i;
  void *v72;
  void *v73;
  float v74;
  void *v75;
  void *v76;
  float v77;
  void *v78;
  float v79;
  void *v80;
  float v81;
  void *v82;
  float v83;
  void *v84;
  float v85;
  void *v86;
  float v87;
  void *v88;
  void *v89;
  id v90;

  self->_isSmallDrops = 0;
  self->_isContinuousDrops = 0;
  self->_shouldRunFlowAnalysis = 0;
  self->_shouldRunCrossFlowAnalysis = 0;
  self->_shouldRunDetection = 0;
  self->_shouldRunBackwarpGating = 0;
  self->_timesDidRunDetection = 0;
  self->_consistentFlowRandomness = 0.0;
  self->_signErrFlowRandomness = 0.0;
  self->_signAreaFlowRandomness = 0.0;
  self->_zigzagFlowRandomness = 0.0;
  self->_prevFlowRandomnessErr = -1.0;
  self->_prevFlowRandomnessArea = -1.0;
  self->_flowDeformation = 0.0;
  self->_flowDeformationSum = 0.0;
  self->_safeToInterpolate = ($D54059585259B9431709135F4CA7D32D)16843009;
  self->_isSafeToInterpolateForInteractiveMode = 1;
  self->_isLargeRandomnessErr = 0;
  self->_flowConsistencyFrameScore = 0.0;
  self->_flowConsistencyROIScore = 0.0;
  self->_confidenceScore = 1.0;
  self->_confidenceScoreOnDemand = 1.0;
  self->_deformationBinaryMap = 0;
  self->_deformationBlockRanges = 0;
  self->_consistencyMap = 0;
  self->_backwarpLossMap = 0;
  self->_backwarpBlockRanges = 0;
  self->_visualizationEnabled = 0;
  self->_cleanRectFlow8x8.origin.x = 0.0;
  self->_cleanRectFlow8x8.origin.y = 0.0;
  self->_cleanRectFlow8x8.size = (CGSize)xmmword_1D428E580;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.FRC"));
  v90 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "pathForResource:ofType:", CFSTR("GatingParameters"), CFSTR("json"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("consistencyAreaThreshold"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  self->jsonConsistencyAreaThreshold = v5;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("consistencyROIAreaPercentageThreshold"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  self->jsonConsistencyROIAreaPercentageThreshold = v7;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("consistencyAreaPercentageThreshold"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  self->jsonConsistencyAreaPercentageThreshold = v9;

  v10 = 0;
  self->jsonConsistencyFrameScoreThresholdOnDemand = 27.0;
  self->jsonConsistencyAreaPercentageThresholdOnDemand = 5.0;
  do
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("consistencySafeThresholdsForDownsampled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    self->jsonConsistencySafeThresholdsForDownsampled[v10] = v13;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("consistencySafeThresholdsForNonDownsampled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    self->jsonConsistencySafeThresholdsForNonDownsampled[v10] = v16;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("consistencySafeThresholdsForDownsampledDelta"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    self->jsonConsistencySafeThresholdsForDownsampledDelta[v10] = v19;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("consistencySafeThresholdsForNonDownsampledDelta"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    self->jsonConsistencySafeThresholdsForNonDownsampledDelta[v10] = v22;

    ++v10;
  }
  while (v10 != 8);
  useCase = self->_useCase;
  v24 = 3.0;
  if (!useCase)
    v24 = 5.5;
  v25 = 23.5;
  if (!useCase)
    v25 = 20.5;
  self->jsonConsistencyVerticalStripAreaPercentageThreshold = v24;
  self->jsonConsistencyVerticalStripScoreThreshold = v25;
  self->jsonConsistencyHorizontalStripAreaPercentageThreshold = 9.0;
  self->jsonConsistencyHorizontalStripScoreThreshold = 17.5;
  self->consistencySafeThresholdsScale = 0.0;
  self->consistencySafeThresholdsScaleForLargeRandomnessErr = 0.0;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessScoreThreshold"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  self->jsonRandomnessScoreThreshold = v27;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessScoreThresholdLow"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  self->jsonRandomnessScoreThresholdLow = v29;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessAreaThreshold"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  self->jsonRandomnessAreaThreshold = v31;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessAreaPercentageThresholdHigh"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "floatValue");
  self->jsonRandomnessAreaPercentageThresholdHigh = v33;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessAreaPercentageThresholdLow"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "floatValue");
  self->jsonRandomnessAreaPercentageThresholdLow = v35;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessErrThreshold"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  self->jsonRandomnessErrThreshold = v37;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessAreaScale"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "floatValue");
  self->jsonRandomnessAreaScale = v39;

  self->randomnessAreaScale = 1.0;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessErrorChangeRatioThreshold"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "floatValue");
  self->jsonRandomnessErrorChangeRatioThreshold = v41;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessAreaChangeRatioThreshold"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "floatValue");
  self->jsonRandomnessAreaChangeRatioThreshold = v43;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessErrorChangeRatioThresholdForCameraMotion"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "floatValue");
  self->jsonRandomnessErrorChangeRatioThresholdForCameraMotion = v45;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessAreaChangeRatioThresholdForCameraMotion"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "floatValue");
  self->jsonRandomnessAreaChangeRatioThresholdForCameraMotion = v47;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessErrorChangeRatioThresholdForStatic"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "floatValue");
  self->jsonRandomnessErrorChangeRatioThresholdForStatic = v49;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("randomnessAreaChangeRatioThresholdForStatic"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "floatValue");
  self->jsonRandomnessAreaChangeRatioThresholdForStatic = v51;

  self->randomnessErrorChangeRatioThreshold = self->jsonRandomnessErrorChangeRatioThreshold;
  self->randomnessAreaChangeRatioThreshold = self->jsonRandomnessAreaChangeRatioThreshold;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("consistentRandomFlowThreshold"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "floatValue");
  self->jsonConsistentRandomFlowThreshold = v53;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("consistentRandomFlowResetAreaChangeRatio"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "floatValue");
  self->jsonConsistentRandomFlowResetAreaChangeRatio = v55;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("zigzagRandomFlowThreshold"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "floatValue");
  self->jsonZigzagRandomFlowThreshold = v57;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deformationRatioThreshold"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "floatValue");
  self->jsonDeformationRatioThreshold = v59;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deformationFlowThreshold"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "floatValue");
  self->jsonDeformationFlowThreshold = v61;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deformationFlowSumThreshold"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "floatValue");
  self->jsonDeformationFlowSumThreshold = v63;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("histogramsAnalysisLargeObjectSizeThreshold"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "floatValue");
  self->jsonHistogramsAnalysisLargeObjectSizeThreshold = v65;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("histogramsAnalysisSmallObjectSizeThreshold"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "floatValue");
  self->jsonHistogramsAnalysisSmallObjectSizeThreshold = v67;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sideMotionDominanceThreshold"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "floatValue");
  self->jsonSideMotionDominanceThreshold = v69;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sideMotionPixelCountThreshold"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  self->jsonSideMotionPixelCountThreshold = objc_msgSend(v70, "intValue");

  for (i = 0; i != 12; ++i)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("consistencySafeThresholdsForDownsampledSloMo"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectAtIndexedSubscript:", i);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "floatValue");
    self->jsonConsistencySafeThresholdsForDownsampledSloMo[i] = v74;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("consistencySafeThresholdsForNonDownsampledSloMo"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectAtIndexedSubscript:", i);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "floatValue");
    self->jsonConsistencySafeThresholdsForNonDownsampledSloMo[i] = v77;

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deformationFlowThresholdForSloMo"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "floatValue");
  self->jsonDeformationFlowThresholdForSloMo = v79;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deformationFlowSumThresholdForSloMo"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "floatValue");
  self->jsonDeformationFlowSumThresholdForSloMo = v81;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("backwarpAreaPercentageThreshold"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "floatValue");
  self->jsonBackwarpAreaPercentageThreshold = v83;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("backwarpFrameScoreThreshold"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "floatValue");
  self->jsonBackwarpFrameScoreThreshold = v85;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("backwarpROIScoreThreshold"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "floatValue");
  self->jsonBackwarpROIScoreThreshold = v87;

  self->jsonBackwarpScoreHighThreshold = 40.0;
  self->jsonBackwarpAreaPercentageHighThreshold = 45.0;
  self->jsonBackwarpAreaThreshold = 450.0;
  self->jsonBackwarpFrameScoreThresholdOnDemand = 27.0;
  self->jsonBackwarpAreaPercentageThresholdOnDemand = 5.0;
  CVPixelBufferRelease(self->_donwsampledSourceBuffer);
  self->_donwsampledSourceBuffer = 0;

}

- (BOOL)isSafeToInterpolate
{
  return self->_safeToInterpolate.consistency
      && self->_safeToInterpolate.randomness
      && self->_safeToInterpolate.deformation
      && self->_safeToInterpolate.backwarp;
}

- (unint64_t)gatingCause
{
  if (!self->_safeToInterpolate.consistency)
    return 6;
  if (!self->_safeToInterpolate.randomness)
    return 7;
  if (!self->_safeToInterpolate.deformation)
    return 8;
  if (self->_safeToInterpolate.backwarp)
    return 0;
  return 9;
}

- (void)prepareGatingFrameDropDetector:(id)a3 numberOfFrames:(unint64_t)a4 timeGap:(id *)a5 isContinuousDrops:(BOOL)a6 enableFlowAnalysis:(BOOL)a7 enableCrossFlowAnalysis:(BOOL)a8 cleanRectFirst:(CGRect)a9 cleanRectSecond:(CGRect)a10
{
  _BOOL4 v10;
  _BOOL4 v11;
  double height;
  double width;
  double y;
  double x;
  double v19;
  double v20;
  double v21;
  double v22;
  id v24;
  int64_t var3;
  unint64_t framesToInterpolate;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL isContinuousDrops;
  unint64_t useCase;
  BOOL isSmallDrops;
  uint64_t v33;
  unint64_t v34;
  float v35;
  CGFloat v36;
  float v37;
  CGFloat v38;
  float v39;
  CGFloat v40;
  float v41;
  CGFloat v42;
  CMTime time1;
  CMTime time2;

  v10 = a8;
  v11 = a7;
  height = a10.size.height;
  width = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  v19 = a9.size.height;
  v20 = a9.size.width;
  v21 = a9.origin.y;
  v22 = a9.origin.x;
  v24 = a3;
  self->_framesToInterpolate = a4;
  var3 = a5->var3;
  *(_OWORD *)&self->_timeGap.value = *(_OWORD *)&a5->var0;
  self->_timeGap.epoch = var3;
  self->_isContinuousDrops = a6;
  framesToInterpolate = self->_framesToInterpolate;
  if (framesToInterpolate >= 2)
  {
    CMTimeMake(&time2, 10, 600);
    time1 = (CMTime)self->_timeGap;
    if (CMTimeCompare(&time1, &time2) > 0)
    {
      v27 = 1;
      goto LABEL_6;
    }
    framesToInterpolate = self->_framesToInterpolate;
  }
  v27 = framesToInterpolate > 4;
LABEL_6:
  if (objc_msgSend(v24, "retimingRecipe"))
    v28 = (unint64_t)objc_msgSend(v24, "numberOfInsertionPoints") < 5;
  else
    v28 = 1;
  self->_isSmallDrops = v28;
  if (v11)
  {
    if (objc_msgSend(v24, "numberOfInsertionPoints"))
      v29 = 1;
    else
      v29 = self->_useCase == 1;
  }
  else
  {
    v29 = 0;
  }
  self->_shouldRunFlowAnalysis = v29;
  if (v10)
  {
    isContinuousDrops = self->_isContinuousDrops;
    if (isContinuousDrops)
      isContinuousDrops = self->_useCase == 0;
  }
  else
  {
    isContinuousDrops = 0;
  }
  self->_shouldRunCrossFlowAnalysis = isContinuousDrops;
  if (self->_shouldRunFlowAnalysis)
  {
    useCase = self->_useCase;
    if (useCase == 1)
    {
      v34 = self->_framesToInterpolate;
      self->_shouldRunDetection = v34 > 2;
      isSmallDrops = v34 - 4 < 6;
      v33 = 911;
    }
    else
    {
      if (useCase)
        goto LABEL_28;
      if (v27 || (isSmallDrops = self->_isSmallDrops))
        isSmallDrops = self->_timesDidRunDetection < 2u;
      v33 = 910;
    }
    *((_BYTE *)&self->super.super.isa + v33) = isSmallDrops;
  }
  else
  {
    self->_shouldRunDetection = 0;
    self->_shouldRunBackwarpGating = 0;
  }
LABEL_28:
  if (self->_useCase)
  {
    v35 = fmax(v22, x) * 0.0625;
    v36 = (float)(floorf(v35) + 1.0);
    v37 = fmax(v21, y) * 0.0625;
    v38 = (float)(floorf(v37) + 1.0);
    v39 = fmin(v20 + v22, width + x) * 0.0625;
    v40 = floorf(v39) - v36;
    v41 = fmin(v19 + v21, height + y) * 0.0625;
    self->_cleanRectFlow8x8.origin.x = v36;
    self->_cleanRectFlow8x8.origin.y = v38;
    v42 = floorf(v41) - v38;
    self->_cleanRectFlow8x8.size.width = v40;
    self->_cleanRectFlow8x8.size.height = v42;
    printf("cleanRectFlow8x8: (x, y, width, height) = (%f, %f, %f, %f)\n", v36, v38, v40, v42);
  }

}

- (void)runGatingWithPrevFlowBackward:(__CVBuffer *)a3 flowForward:(__CVBuffer *)a4 flowBackward:(__CVBuffer *)a5 lastFrameDuration:(id *)a6 lastNumberOfFrames:(unint64_t)a7 flowResFrame:(__CVBuffer *)a8 flowResFirst:(__CVBuffer *)a9 flowResSecond:(__CVBuffer *)a10
{
  __int128 v17;
  int64_t var3;

  -[OpticalFlowAnalyzer modulateGatingParametersWithFlowForward:flowResFrame:](self, "modulateGatingParametersWithFlowForward:flowResFrame:", a4, a8);
  if (self->_shouldRunCrossFlowAnalysis)
  {
    kdebug_trace();
    v17 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    -[OpticalFlowAnalyzer isSafeToInterpolateForRandomnessGatingWithPrevFlowBackward:flowForward:lastFrameDuration:lastNumberOfFrames:flowResFrame:](self, "isSafeToInterpolateForRandomnessGatingWithPrevFlowBackward:flowForward:lastFrameDuration:lastNumberOfFrames:flowResFrame:", a3, a4, &v17, a7, a8);
    kdebug_trace();
  }
  if (self->_shouldRunFlowAnalysis)
  {
    kdebug_trace();
    -[OpticalFlowAnalyzer isSafeToInterpolateForConsistencyGatingWithFlowForward:flowBackward:flowResFrame:](self, "isSafeToInterpolateForConsistencyGatingWithFlowForward:flowBackward:flowResFrame:", a4, a5, a8);
    -[OpticalFlowAnalyzer isSafeToInterpolateForBackwarpGatingWithFlowForward:flowBackward:flowResFirst:flowResSecond:](self, "isSafeToInterpolateForBackwarpGatingWithFlowForward:flowBackward:flowResFirst:flowResSecond:", a4, a5, a9, a10);
    -[OpticalFlowAnalyzer isSafeToInterpolateForDeformationGating](self, "isSafeToInterpolateForDeformationGating");
    kdebug_trace();
  }
}

- (void)isSafeToInterpolateForConsistencyGatingWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 flowResFrame:(__CVBuffer *)a5
{
  void *v9;
  float v10;
  float v11;
  $95D729B680665BEAEFA1D6FCA8238556 *p_timeGap;
  _BOOL8 opticalFlowDownsampling;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  unint64_t useCase;
  __CFString *v21;
  int64_t retimingRecipe;
  float v23;
  float v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;
  double v34;
  float v35;
  float v36;
  int *v37;
  float v38;
  CMTime time2;
  CMTime v40;
  CMTime time1;
  _OWORD v42[2];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46[2];
  void *v47[2];
  void *v48[2];
  void *v49[2];
  void *v50[2];
  void *v51[2];
  void *v52[2];
  void *v53[2];
  void *v54[2];
  void *v55;

  v55 = 0;
  *(_OWORD *)v53 = 0u;
  *(_OWORD *)v54 = 0u;
  *(_OWORD *)v51 = 0u;
  *(_OWORD *)v52 = 0u;
  *(_OWORD *)v49 = 0u;
  *(_OWORD *)v50 = 0u;
  *(_OWORD *)v47 = 0u;
  *(_OWORD *)v48 = 0u;
  v45 = 0u;
  *(_OWORD *)v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  memset(v42, 0, sizeof(v42));
  v9 = (void *)MEMORY[0x1D825AFCC](self, a2);
  -[OpticalFlowAnalyzer analyzeOpticalFlowForward:backward:flowResFrame:](self, "analyzeOpticalFlowForward:backward:flowResFrame:", a3, a4, a5);
  objc_autoreleasePoolPop(v9);
  if (!self->_useCase && self->_isLargeRandomnessErr)
  {
    retimingRecipe = self->_retimingRecipe;
    if (retimingRecipe < 3 || retimingRecipe == 1000)
    {
      if (self->consistencySafeThresholdsScale <= 0.0)
        self->consistencySafeThresholdsScaleForLargeRandomnessErr = self->consistencySafeThresholdsScaleForLargeRandomnessErr
                                                                  + 1.0;
      if (self->_prevFlowRandomnessErr >= self->jsonRandomnessErrThreshold)
        self->consistencySafeThresholdsScaleForLargeRandomnessErr = self->consistencySafeThresholdsScaleForLargeRandomnessErr
                                                                  + 0.5;
      if (self->_prevFlowRandomnessArea >= self->jsonRandomnessAreaPercentageThresholdHigh)
        self->consistencySafeThresholdsScaleForLargeRandomnessErr = self->consistencySafeThresholdsScaleForLargeRandomnessErr
                                                                  + 0.5;
    }
  }
  v10 = *((float *)&v43 + 3);
  v11 = *(float *)&v44;
  p_timeGap = &self->_timeGap;
  opticalFlowDownsampling = self->_opticalFlowDownsampling;
  time1 = (CMTime)self->_timeGap;
  -[OpticalFlowAnalyzer safeThresholdWithtimeGap:isDownsampled:](self, "safeThresholdWithtimeGap:isDownsampled:", &time1, opticalFlowDownsampling);
  v18 = *(float *)&v14;
  v19 = *(float *)&v15;
  useCase = self->_useCase;
  if (useCase != 1)
  {
    if (useCase)
      goto LABEL_57;
    if ((v10 > self->jsonConsistencyAreaPercentageThreshold || self->_retimingRecipe == 3) && *(float *)&v14 > 0.0)
    {
      v21 = CFSTR("[FlowAnalysis] Interpolation is gated (consistency) - frame");
    }
    else if (self->_isSmallDrops && (float)((float)(self->consistencySafeThresholdsScale * 4.0) + 35.0) > 0.0)
    {
      v21 = CFSTR("[FlowAnalysis] Interpolation is gated (consistency) - frameForSmallDrops");
    }
    else if (*(float *)&v15 <= 100.0)
    {
      if (100.0 < 25.0 && self->_isSmallDrops)
      {
        v21 = CFSTR("[FlowAnalysis] Interpolation is gated (consistency) - roiForSmallDrops");
      }
      else if (!self->_motionHistogramsAnalysis.hasCameraRotaion
             || (CMTimeMake(&v40, 80, 600),
                 *(_OWORD *)&time1.value = *(_OWORD *)&p_timeGap->value,
                 time1.epoch = self->_timeGap.epoch,
                 CMTimeCompare(&time1, &v40) < 0)
             && self->_retimingRecipe)
      {
        if (-[OpticalFlowAnalyzer checkSafetyByScoreAndArea:](self, "checkSafetyByScoreAndArea:", v42))
        {
          if (-[OpticalFlowAnalyzer checkSafetyByStripConsistency:](self, "checkSafetyByStripConsistency:", v42))
          {
            if (-[OpticalFlowAnalyzer checkSafetyByBlockConsistency:](self, "checkSafetyByBlockConsistency:", v42))
              goto LABEL_57;
            v21 = CFSTR("[FlowAnalysis] Interpolation is gated (consistency) - block");
          }
          else
          {
            v21 = CFSTR("[FlowAnalysis] Interpolation is gated (consistency) - strip");
          }
        }
        else
        {
          v21 = CFSTR("[FlowAnalysis] Interpolation is gated (consistency) - area");
        }
      }
      else
      {
        v21 = CFSTR("[FlowAnalysis] Interpolation is gated (consistency) - rotation");
      }
    }
    else
    {
      v21 = CFSTR("[FlowAnalysis] Interpolation is gated (consistency) - roi");
    }
    goto LABEL_54;
  }
  v23 = *(float *)&v16;
  v38 = v11;
  *(float *)&v17 = self->jsonConsistencyAreaPercentageThreshold;
  LODWORD(v14) = 0;
  *(float *)&v15 = v18;
  *(float *)&v16 = v10;
  -[OpticalFlowAnalyzer computeConsistencyConfidenceFromScore:scoreThreshold:areaRatio:areaRatioThreshold:](self, "computeConsistencyConfidenceFromScore:scoreThreshold:areaRatio:areaRatioThreshold:", v14, v15, v16, v17);
  v25 = v24;
  *(float *)&v26 = self->jsonConsistencyAreaPercentageThresholdOnDemand;
  LODWORD(v27) = 0;
  *(float *)&v28 = v23;
  *(float *)&v29 = v10;
  -[OpticalFlowAnalyzer computeConsistencyConfidenceFromScore:scoreThreshold:areaRatio:areaRatioThreshold:](self, "computeConsistencyConfidenceFromScore:scoreThreshold:areaRatio:areaRatioThreshold:", v27, v28, v29, v26);
  v32 = *(float *)&v34;
  LODWORD(v33) = 1.0;
  LODWORD(v34) = 1.0;
  if (*((float *)&v43 + 1) != *((float *)&v43 + 2))
  {
    *(float *)&v31 = self->jsonConsistencyROIAreaPercentageThreshold;
    LODWORD(v34) = 1120403456;
    *(float *)&v30 = v19;
    *(float *)&v33 = v10;
    -[OpticalFlowAnalyzer computeConsistencyConfidenceFromScore:scoreThreshold:areaRatio:areaRatioThreshold:](self, "computeConsistencyConfidenceFromScore:scoreThreshold:areaRatio:areaRatioThreshold:", v34, v30, v33, v31);
    LODWORD(v33) = 1.0;
  }
  v35 = fmin(fminf(v25, *(float *)&v34), 1.0);
  if (v35 < *(float *)&v33)
    NSLog(CFSTR("[AutobahnFlowAnalysis] consistency gating confidence: %.3f (frame, roi) in recommendation"), v35);
  self->_confidenceScore = fminf(v35, self->_confidenceScore);
  v36 = fmin(v32, 1.0);
  if (v36 < 1.0)
    NSLog(CFSTR("[AutobahnFlowAnalysis] consistency gating confidence: %.3f in on-demand"), v36);
  self->_confidenceScoreOnDemand = fminf(v36, self->_confidenceScoreOnDemand);
  if (v10 > self->jsonConsistencyAreaPercentageThreshold && v18 > 0.0)
  {
    self->_safeToInterpolate.consistency = 0;
    if (self->_framesToInterpolate < 4)
    {
      NSLog(CFSTR("[AutobahnFlowAnalysis] Interpolation is gated (consistency) - frame for recommendation only"));
      goto LABEL_57;
    }
    v21 = CFSTR("[AutobahnFlowAnalysis] Interpolation is gated (consistency) - frame for recommendation only");
    if (v10 <= self->jsonConsistencyAreaPercentageThresholdOnDemand || v23 <= 0.0)
      goto LABEL_56;
    v21 = CFSTR("[AutobahnFlowAnalysis] Interpolation is gated (consistency) - frame for both");
    v37 = &OBJC_IVAR___OpticalFlowAnalyzer__isSafeToInterpolateForInteractiveMode;
LABEL_55:
    *((_BYTE *)&self->super.super.isa + *v37) = 0;
LABEL_56:
    NSLog(&v21->isa);
    goto LABEL_57;
  }
  CMTimeMake(&time2, 40, 600);
  *(_OWORD *)&time1.value = *(_OWORD *)&p_timeGap->value;
  time1.epoch = self->_timeGap.epoch;
  if (CMTimeCompare(&time1, &time2) >= 1
    && !-[OpticalFlowAnalyzer checkSafetyByStripConsistency:](self, "checkSafetyByStripConsistency:", v42))
  {
    v21 = CFSTR("[AutobahnFlowAnalysis] Interpolation is gated (consistency) - strip for recommendation only");
    goto LABEL_54;
  }
  if (v38 > self->jsonConsistencyROIAreaPercentageThreshold && v19 > 100.0)
  {
    v21 = CFSTR("[AutobahnFlowAnalysis] Interpolation is gated (consistency) - roi for recommendation only");
LABEL_54:
    v37 = &OBJC_IVAR___OpticalFlowAnalyzer__safeToInterpolate;
    goto LABEL_55;
  }
LABEL_57:
  self->_flowConsistencyFrameScore = 0.0;
  self->_flowConsistencyROIScore = 100.0;
  if (v46[0])
    free(v46[0]);
  if (v47[0])
    free(v47[0]);
  if (v48[0])
    free(v48[0]);
  if (v49[0])
    free(v49[0]);
  if (v50[0])
    free(v50[0]);
  if (v51[0])
    free(v51[0]);
  if (v52[0])
    free(v52[0]);
  if (v53[0])
    free(v53[0]);
  if (v54[0])
    free(v54[0]);
  if (v55)
    free(v55);
}

- (float)computeConsistencyConfidenceFromScore:(float)a3 scoreThreshold:(float)a4 areaRatio:(float)a5 areaRatioThreshold:(float)a6
{
  double v8;
  float v9;

  v8 = 1.5;
  if (a5 < a6)
    v8 = expf((float)(1.0 - (float)(a5 / a6)) * 15.0) * 1.5;
  v9 = 4.0;
  if (a3 >= a4)
    v9 = 1.0;
  return v8 / (float)(expf((float)((float)(a4 / a3) + -1.0) * v9) + 1.0);
}

- ($C1DB47A8720132E370ACBCD7001E397A)analyzeOpticalFlowForward:(SEL)a3 backward:(__CVBuffer *)a4 flowResFrame:(__CVBuffer *)a5
{
  void *v10;
  void *v11;
  void *v12;
  unint64_t framesToInterpolate;
  $C1DB47A8720132E370ACBCD7001E397A *result;
  id v15;

  createTexturesFromCVPixelBuffer(a4, self->super._device, 1, 2uLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a5, self->super._device, 1, 2uLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  createRGBATextureFromCVPixelBuffer(a6, self->super._device);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray arrayByAddingObjectsFromArray:](self->_firstFaceHandLegRectangles, "arrayByAddingObjectsFromArray:", self->_secondFaceHandLegRectangles);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  retstr->var30 = 0;
  -[OpticalFlowAnalyzer calcFlowStatisticsForwardFlowTexture:backwardFlowTexture:faceHandLegRectangles:frameTexture:](self, "calcFlowStatisticsForwardFlowTexture:backwardFlowTexture:faceHandLegRectangles:frameTexture:", v10, v11, v12, v15);
  framesToInterpolate = self->_framesToInterpolate;
  retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)self->_timeGap;
  retstr->var1 = framesToInterpolate;
  -[OpticalFlowAnalyzer analyzeAggregatedStatistics:](self, "analyzeAggregatedStatistics:", retstr);

  return result;
}

- ($C1DB47A8720132E370ACBCD7001E397A)calcFlowStatisticsForwardFlowTexture:(SEL)a3 backwardFlowTexture:(id)a4 faceHandLegRectangles:(id)a5 frameTexture:(id)a6
{
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  $C1DB47A8720132E370ACBCD7001E397A *result;
  id v24;
  int64x2_t v25;
  uint64_t v26;
  _QWORD v27[3];

  v24 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = (unint64_t)(objc_msgSend(v14, "width") + 7) >> 3;
  v16 = (unint64_t)(objc_msgSend(v14, "height") + 7) >> 3;
  v17 = (void *)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 4 * v15 * v16, 0);
  -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setComputePipelineState:", self->_flowStatisticsKernel);
  objc_msgSend(v19, "setTexture:atIndex:", v14, 0);

  objc_msgSend(v19, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v19, "setTexture:atIndex:", v12, 2);

  objc_msgSend(v19, "setBuffer:offset:atIndex:", v17, 0, 0);
  v27[0] = v15;
  v27[1] = v16;
  v27[2] = 1;
  v25 = vdupq_n_s64(8uLL);
  v26 = 1;
  objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", v27, &v25);
  objc_msgSend(v19, "endEncoding");
  objc_msgSend(v18, "commit");
  objc_msgSend(v18, "waitUntilCompleted");
  v20 = objc_retainAutorelease(v17);
  v21 = objc_msgSend(v20, "contents");
  if (v24)
  {
    -[OpticalFlowAnalyzer findFaceHandLegBlocksFromRectangles:blockWidth:blockHeight:](self, "findFaceHandLegBlocksFromRectangles:blockWidth:blockHeight:", v24, v15, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  retstr->var30 = 0;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  -[OpticalFlowAnalyzer processGPUOutputs:blockWidth:blockHeight:faceHandLegBoundingBoxBlocks:](self, "processGPUOutputs:blockWidth:blockHeight:faceHandLegBoundingBoxBlocks:", v21, v15, v16, v22);

  return result;
}

- (id)findFaceHandLegBlocksFromRectangles:(id)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  int v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    v13 = (double)a5;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v15, "boundingBox", (_QWORD)v24);
        +[FRCFaceHandLegBlock faceHandLegBlockWithRect:numberOfBlocks:category:](FRCFaceHandLegBlock, "faceHandLegBlockWithRect:numberOfBlocks:category:", ((int)(v18 * (double)a4 + 0.5) + 1) * ((int)(v19 * v13 + 0.5) + 1), objc_msgSend(v15, "category"), (double)(int)(v16 * (double)a4), (double)(int)((1.0 - v17 - v19) * v13), (double)v20, (double)v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v22);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  return v8;
}

- ($C1DB47A8720132E370ACBCD7001E397A)processGPUOutputs:(SEL)a3 blockWidth:(id *)a4 blockHeight:(unint64_t)a5 faceHandLegBoundingBoxBlocks:(unint64_t)a6
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  size_t v15;
  size_t v16;
  size_t v17;
  size_t v18;
  unint64_t v19;
  size_t v20;
  size_t v21;
  OpticalFlowAnalyzer *v22;
  size_t v23;
  float *v24;
  uint64_t v25;
  unint64_t v26;
  float v27;
  float v28;
  float v29;
  float v30;
  unint64_t v31;
  CGRect *p_cleanRectFlow8x8;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  float var0;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  BOOL v40;
  void *v41;
  _BOOL4 v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  float v47;
  float *v48;
  float v49;
  float v50;
  uint64_t i;
  float v52;
  void *v53;
  void *v54;
  float v55;
  void *v56;
  uint64_t v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  $C1DB47A8720132E370ACBCD7001E397A *result;
  size_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  float *v79;
  OpticalFlowAnalyzer *v80;
  unint64_t v81;
  unint64_t v83;
  float *v84;
  float *v85;
  float *v86;
  float *v87;
  float *v88;
  float *v89;
  float *v90;
  float *v91;
  float *v92;
  float *v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  float v104;
  id v105;
  CGPoint v106;
  CGPoint v107;
  CGRect v108;

  v105 = a7;
  v10 = (a5 + 1) >> 1;
  v11 = (a6 + 1) >> 1;
  v12 = (a5 + 11) / 0xC;
  v13 = (a5 + 3) >> 2;
  v14 = (a6 + 3) >> 2;
  v15 = v14 * v13;
  v75 = (a5 + 5) / 6;
  v76 = v13;
  v16 = v11 * v75;
  v77 = v10;
  v17 = (a6 + 5) / 6 * v10;
  v18 = v14 * v12;
  v19 = (a6 + 11) / 0xC;
  v20 = v19 * v13;
  v101 = v12;
  v21 = v19 * v12;
  v74 = (a5 + 23) / 0x18;
  v71 = v11 * v10;
  v93 = (float *)malloc_type_calloc(v11 * v10, 4uLL, 0x100004052888210uLL);
  v70 = v15;
  v92 = (float *)malloc_type_calloc(v15, 4uLL, 0x100004052888210uLL);
  v91 = (float *)malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL);
  v69 = v17;
  v90 = (float *)malloc_type_calloc(v17, 4uLL, 0x100004052888210uLL);
  v68 = v18;
  v89 = (float *)malloc_type_calloc(v18, 4uLL, 0x100004052888210uLL);
  v67 = v20;
  v88 = (float *)malloc_type_calloc(v20, 4uLL, 0x100004052888210uLL);
  v66 = v21;
  v87 = (float *)malloc_type_calloc(v21, 4uLL, 0x100004052888210uLL);
  v65 = (a6 + 23) / 0x18 * v74;
  v22 = self;
  v86 = (float *)malloc_type_calloc(v65, 4uLL, 0x100004052888210uLL);
  v85 = (float *)malloc_type_calloc(0xCuLL, 4uLL, 0x100004052888210uLL);
  v84 = (float *)malloc_type_calloc(8uLL, 4uLL, 0x100004052888210uLL);
  v23 = objc_msgSend(v105, "count");
  v24 = (float *)malloc_type_calloc(v23, 4uLL, 0x100004052888210uLL);
  if (self->_visualizationEnabled)
    self->_consistencyMap = (char *)malloc_type_calloc(a6 * a5, 1uLL, 0x100004077774924uLL);
  v83 = (a6 + 7) >> 3;
  v80 = self;
  v81 = a5;
  if (a6)
  {
    v103 = 0;
    v25 = 0;
    v26 = 0;
    v73 = (int)a5;
    v27 = 0.0;
    v28 = 0.0;
    v29 = 0.0;
    v30 = 0.0;
    v78 = a6;
    v79 = v24;
    do
    {
      if (a5)
      {
        v31 = 0;
        p_cleanRectFlow8x8 = &v22->_cleanRectFlow8x8;
        v100 = v103 * v73;
        v33 = v103 >> 1;
        v99 = v77 * v33;
        v34 = v103 >> 2;
        v98 = v76 * v34;
        v97 = v75 * v33;
        v96 = v101 * v34;
        v35 = v103 / 0xCuLL;
        v94 = v101 * v35;
        v95 = v76 * v35;
        do
        {
          v106.x = (double)(int)v31;
          v106.y = (double)(int)v103;
          if (CGRectContainsPoint(*p_cleanRectFlow8x8, v106))
          {
            var0 = a4[v31 + v100].var0;
            if (v22->_visualizationEnabled)
              v22->_consistencyMap[v31 + v100] = (int)var0;
            if ((float)(v22->jsonConsistencyAreaThreshold * 64.0) / 5.0 < var0)
              v29 = v29 + 1.0;
            v37 = v105;
            if (v23)
            {
              v102 = v25;
              v38 = v26;
              v39 = 0;
              v40 = 0;
              while (1)
              {
                objc_msgSend(v37, "objectAtIndexedSubscript:", v39);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "rect");
                v107.x = (double)(int)v31;
                v107.y = (double)(int)v103;
                v42 = CGRectContainsPoint(v108, v107);

                if (v42)
                  break;
                v40 = v23 <= ++v39;
                v37 = v105;
                if (v23 == v39)
                {
                  v40 = 1;
                  v43 = var0;
                  v22 = v80;
                  a5 = v81;
                  goto LABEL_21;
                }
              }
              v22 = v80;
              v79[v39] = var0 + v79[v39];
              if ((float)(v80->jsonConsistencyAreaThreshold * 64.0) / 5.0 < var0)
                v28 = v28 + 1.0;
              v43 = -0.0;
              a5 = v81;
LABEL_21:
              v26 = v38;
              v25 = v102;
            }
            else
            {
              v40 = 1;
              v43 = var0;
            }
            ++v26;
            v30 = v30 + var0;
            v27 = v27 + v43;
            v44 = v31 >> 1;
            v25 += v40;
            v93[v99 + v44] = var0 + v93[v99 + v44];
            v45 = v31 >> 2;
            v92[v98 + v45] = var0 + v92[v98 + v45];
            v91[v97 + v31 / 6uLL] = var0 + v91[v97 + v31 / 6uLL];
            v90[v77 * (v103 / 6uLL) + v44] = var0 + v90[v77 * (v103 / 6uLL) + v44];
            v89[v96 + v31 / 0xCuLL] = var0 + v89[v96 + v31 / 0xCuLL];
            v88[v95 + v45] = var0 + v88[v95 + v45];
            v87[v94 + v31 / 0xCuLL] = var0 + v87[v94 + v31 / 0xCuLL];
            v86[v74 * (v103 / 0x18uLL) + v31 / 0x18uLL] = var0
                                                                                    + v86[v74
                                                                                        * (v103
                                                                                         / 0x18uLL)
                                                                                        + v31 / 0x18uLL];
            v85[v31 / v101] = var0 + v85[v31 / v101];
            v84[v103 / v83] = var0 + v84[v103 / v83];
          }
          ++v31;
        }
        while (v31 != a5);
      }
      a6 = v78;
      ++v103;
      v24 = v79;
    }
    while (v103 != v78);
  }
  else
  {
    v26 = 0;
    v25 = 0;
    v30 = 0.0;
    v29 = 0.0;
    v28 = 0.0;
    v27 = 0.0;
  }
  v46 = v26;
  v47 = (float)v26;
  v48 = (float *)malloc_type_calloc(v23, 4uLL, 0x100004052888210uLL);
  v49 = 0.0;
  v50 = 0.0;
  if (v23)
  {
    for (i = 0; i != v23; ++i)
    {
      v52 = v24[i];
      objc_msgSend(v105, "objectAtIndexedSubscript:", i);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v48[i] = v52 / (float)(int)(objc_msgSend(v53, "numberOfBlocks") << 6);

      objc_msgSend(v105, "objectAtIndexedSubscript:", i);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (float)(unint64_t)objc_msgSend(v54, "numberOfBlocks") / v47;

      objc_msgSend(v105, "objectAtIndexedSubscript:", i);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "category");

      v58 = 64.0;
      if (v57 == 2)
        v58 = 128.0;
      v59 = fmin((float)(v55 * v58), 1.0);
      if ((float)(v48[i] * v59) > v50)
      {
        v50 = v48[i] * v59;
        v49 = v59;
      }
    }
  }
  v104 = v50;
  if (v25)
    v60 = v27 / (float)(unint64_t)(v25 << 6);
  else
    v60 = 0.0;
  v61 = v30 / (float)(v46 << 6);
  v62 = log10(100.0 / v61) * 10.0;
  v63 = log10(100.0 / (float)(v104 + (float)((float)(1.0 - v49) * v60))) * 10.0;
  -[OpticalFlowAnalyzer calcStripConsistency:stripSize:numStrips:](v80, "calcStripConsistency:stripSize:numStrips:", v85, (a6 * v101) << 6, 12);
  -[OpticalFlowAnalyzer calcStripConsistency:stripSize:numStrips:](v80, "calcStripConsistency:stripSize:numStrips:", v84, (v81 * v83) << 6, 8);
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  retstr->var2 = v61;
  retstr->var3 = v62;
  retstr->var4 = v63;
  retstr->var5 = (float)(v29 * 100.0) / v47;
  retstr->var6 = (float)(v28 * 100.0) / v47;
  *(_QWORD *)&retstr->var10 = 0;
  retstr->var11 = v71;
  retstr->var12 = v93;
  retstr->var13 = v70;
  retstr->var16 = v90;
  retstr->var17 = v16;
  retstr->var14 = v92;
  retstr->var15 = v69;
  retstr->var20 = v88;
  retstr->var21 = v68;
  retstr->var18 = v91;
  retstr->var19 = v67;
  retstr->var22 = v89;
  retstr->var23 = v66;
  retstr->var24 = v87;
  retstr->var25 = v65;
  retstr->var26 = v86;
  retstr->var27 = 12;
  retstr->var28 = v85;
  retstr->var29 = 8;
  retstr->var30 = v84;
  free(v48);
  free(v24);

  return result;
}

- (void)calcStripConsistency:(float *)a3 stripSize:(unint64_t)a4 numStrips:(unsigned int)a5
{
  float v6;
  uint64_t v7;
  float v8;
  float v9;

  if (a5)
  {
    v6 = (float)a4;
    v7 = a5;
    do
    {
      v8 = *a3 / v6;
      if (v8 == 0.0)
        v9 = 100.0;
      else
        v9 = log10(100.0 / v8) * 10.0;
      *a3++ = v9;
      --v7;
    }
    while (v7);
  }
}

- (void)analyzeAggregatedStatistics:(id *)a3
{
  double Seconds;
  unint64_t var11;
  float v7;
  float v8;
  float *var12;
  float v10;
  unint64_t var13;
  float *var14;
  float v13;
  unint64_t var17;
  double v15;
  double v16;
  float *var18;
  float v18;
  float v19;
  unint64_t var15;
  float *var16;
  float v22;
  float v23;
  unint64_t var21;
  double v25;
  double v26;
  float *var22;
  float v28;
  float v29;
  unint64_t var19;
  float *var20;
  float v32;
  float v33;
  unint64_t var23;
  float v35;
  float v36;
  float *var24;
  float v38;
  unint64_t var25;
  float *var26;
  float v41;
  float v42;
  CMTime time;

  time = (CMTime)a3->var0;
  Seconds = CMTimeGetSeconds(&time);
  var11 = a3->var11;
  v7 = 0.0;
  v8 = 0.0;
  if (var11)
  {
    var12 = a3->var12;
    do
    {
      v10 = *var12 * 0.0039062;
      *var12++ = v10;
      v8 = fmaxf(v8, v10);
      --var11;
    }
    while (var11);
  }
  var13 = a3->var13;
  if (var13)
  {
    var14 = a3->var14;
    v7 = 0.0;
    do
    {
      v13 = *var14 * 0.00097656;
      *var14++ = v13;
      v7 = fmaxf(v7, v13);
      --var13;
    }
    while (var13);
  }
  var17 = a3->var17;
  v15 = 0.0;
  v16 = 0.0;
  if (var17)
  {
    var18 = a3->var18;
    v18 = 0.0;
    do
    {
      v19 = *var18 / 768.0;
      *var18++ = v19;
      v18 = fmaxf(v18, v19);
      --var17;
    }
    while (var17);
    v16 = v18;
  }
  var15 = a3->var15;
  if (var15)
  {
    var16 = a3->var16;
    v22 = 0.0;
    do
    {
      v23 = *var16 / 768.0;
      *var16++ = v23;
      v22 = fmaxf(v22, v23);
      --var15;
    }
    while (var15);
    v15 = v22;
  }
  var21 = a3->var21;
  v25 = 0.0;
  v26 = 0.0;
  if (var21)
  {
    var22 = a3->var22;
    v28 = 0.0;
    do
    {
      v29 = *var22 / 3072.0;
      *var22++ = v29;
      v28 = fmaxf(v28, v29);
      --var21;
    }
    while (var21);
    v26 = v28;
  }
  var19 = a3->var19;
  if (var19)
  {
    var20 = a3->var20;
    v32 = 0.0;
    do
    {
      v33 = *var20 / 3072.0;
      *var20++ = v33;
      v32 = fmaxf(v32, v33);
      --var19;
    }
    while (var19);
    v25 = v32;
  }
  var23 = a3->var23;
  v35 = 0.0;
  v36 = 0.0;
  if (var23)
  {
    var24 = a3->var24;
    do
    {
      v38 = *var24 / 9216.0;
      *var24++ = v38;
      v36 = fmaxf(v36, v38);
      --var23;
    }
    while (var23);
  }
  var25 = a3->var25;
  if (var25)
  {
    var26 = a3->var26;
    v35 = 0.0;
    do
    {
      v41 = *var26 / 36864.0;
      *var26++ = v41;
      v35 = fmaxf(v35, v41);
      --var25;
    }
    while (var25);
  }
  v42 = Seconds * 1000.0;
  a3->var7 = v8;
  a3->var8 = v7;
  a3->var9 = v36;
  a3->var10 = v35;
  printf("[FlowAnalysis] Insert %ld frames, Duration: %6.2f msec, Error: %.3f, Score: %.3f, ROI_Score: %.3f, Area_Ratio: %.3f, ROI_Area_Ratio: %.3f, 16x16 Max: %.3f, 32x32 Max: %.3f, 48x16 Max: %.3f, 16x48 Max: %.3f, 96x32 Max: %.3f, 32x96 Max: %.3f, 96x96 Max: %.3f, 192x192 Max: %.3f\n", a3->var1, v42, a3->var2, a3->var3, a3->var4, a3->var5, a3->var6, v8, v7, v16, v15, v26, v25, v36, v35);
  -[OpticalFlowAnalyzer printStripScores:](self, "printStripScores:", a3);
  fflush((FILE *)*MEMORY[0x1E0C80C20]);
}

- (void)printStripScores:(id *)a3
{
  uint64_t v4;
  unsigned int v5;
  unint64_t var27;
  BOOL v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t var29;

  printf("[FlowAnalysis] Vertical Strip Score: ");
  if (a3->var27)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      printf("%.3f", a3->var28[v4]);
      var27 = a3->var27;
      if (var27 - 1 != v4)
      {
        printf(", ");
        var27 = a3->var27;
      }
      v4 = v5;
      v7 = var27 > v5++;
    }
    while (v7);
  }
  putchar(10);
  printf("[FlowAnalysis] Horizontal Strip Score: ");
  if (a3->var29)
  {
    v8 = 0;
    v9 = 1;
    do
    {
      printf("%.3f", a3->var30[v8]);
      var29 = a3->var29;
      if (var29 - 1 != v8)
      {
        printf(", ");
        var29 = a3->var29;
      }
      v8 = v9;
      v7 = var29 > v9++;
    }
    while (v7);
  }
  putchar(10);
}

- (void)runDetectionFromFirstBuffer:(__CVBuffer *)a3 secondBuffer:(__CVBuffer *)a4
{
  NSArray *firstFaceHandLegRectangles;
  NSArray *secondFaceHandLegRectangles;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;

  firstFaceHandLegRectangles = self->_firstFaceHandLegRectangles;
  self->_firstFaceHandLegRectangles = 0;

  secondFaceHandLegRectangles = self->_secondFaceHandLegRectangles;
  self->_secondFaceHandLegRectangles = 0;

  if (self->_shouldRunDetection)
  {
    kdebug_trace();
    -[OpticalFlowAnalyzer extractFaceHandLegInfoFromBuffer:](self, "extractFaceHandLegInfoFromBuffer:", a3);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_firstFaceHandLegRectangles;
    self->_firstFaceHandLegRectangles = v9;

    -[OpticalFlowAnalyzer extractFaceHandLegInfoFromBuffer:](self, "extractFaceHandLegInfoFromBuffer:", a4);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_secondFaceHandLegRectangles;
    self->_secondFaceHandLegRectangles = v11;

    ++self->_timesDidRunDetection;
    kdebug_trace();
  }
}

- (id)extractFaceHandLegInfoFromBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  size_t Width;
  size_t Height;
  size_t v7;
  __CVBuffer *donwsampledSourceBuffer;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  int v24;
  void *v25;
  uint64_t v26;
  OpticalFlowAnalyzer *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  uint64_t v54;
  FRCBodyBoundingBoxDetector *v55;
  void *v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t n;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t ii;
  void *v82;
  OpticalFlowAnalyzer *v84;
  id v85;
  void *v86;
  unint64_t v87;
  unint64_t v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v3 = a3;
  v132 = *MEMORY[0x1E0C80C00];
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(v3);
  v7 = Height;
  if (Height < 0x438)
  {
    if (Height < 0x21C)
    {
      if (self->_inputRotation != 3)
      {
        v87 = Height;
        v88 = Width;
        goto LABEL_9;
      }
    }
    else
    {
      Width = ((Width >> 1) + 1) & 0xFFFFFFFFFFFFFFFELL;
      v7 = ((Height >> 1) + 1) & 0x7FFFFFFFFFFFFFFELL;
    }
  }
  else
  {
    Width = (Width + 3) >> 2;
    v7 = (Height + 3) >> 2;
  }
  donwsampledSourceBuffer = self->_donwsampledSourceBuffer;
  if (!donwsampledSourceBuffer)
  {
    donwsampledSourceBuffer = createPixelBuffer(Width, v7, 0x42475241u, 0);
    self->_donwsampledSourceBuffer = donwsampledSourceBuffer;
  }
  v87 = v7;
  v88 = Width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scaler);
  objc_msgSend(WeakRetained, "downScaleFrameSource:destination:rotate:waitForCompletion:", v3, donwsampledSourceBuffer, self->_inputRotation, 0);

  v3 = donwsampledSourceBuffer;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEDF70]), "initWithCVPixelBuffer:options:", v3, v10);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0CEDE90]);
  v125 = 0;
  objc_msgSend(v14, "setRevision:error:", 3737841666, &v125);
  v15 = v125;
  v95 = v14;
  objc_msgSend(v13, "addObject:", v14);
  if (self->_handDetectionEnabled)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0CEDEA0]);
    v124 = v15;
    objc_msgSend(v16, "setRevision:error:", 1, &v124);
    v17 = v124;

    NSLog(CFSTR("[FlowAnalysis] Hand Detection is Enabled.\n"));
    objc_msgSend(v13, "addObject:", v16);
    v15 = v17;
  }
  else
  {
    v16 = 0;
  }
  if (self->_bodyDetectionEnabled)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CEDE98]);
    v123 = v15;
    objc_msgSend(v18, "setRevision:error:", 1, &v123);
    v19 = v123;

    NSLog(CFSTR("[FlowAnalysis] Body Detection is Enabled.\n"));
    v94 = v18;
    objc_msgSend(v13, "addObject:", v18);
    v15 = v19;
  }
  else
  {
    v94 = 0;
  }
  if (self->_humanDetectionEnabled)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0CEDEA8]);
    v122 = v15;
    objc_msgSend(v20, "setRevision:error:", 3737841664, &v122);
    v21 = v122;

    NSLog(CFSTR("[FlowAnalysis] Human Detection is Enabled.\n"));
    v93 = v20;
    objc_msgSend(v13, "addObject:", v20);
    v15 = v21;
  }
  else
  {
    v93 = 0;
  }
  if (self->_animalFaceDetectionEnabled && self->_useCase == 1)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0CEDFC8]);
    v121 = v15;
    objc_msgSend(v22, "setRevision:error:", 1, &v121);
    v23 = v121;

    v92 = v22;
    objc_msgSend(v13, "addObject:", v22);
    v15 = v23;
  }
  else
  {
    v92 = 0;
  }
  v120 = v15;
  v90 = v11;
  v91 = v13;
  v24 = objc_msgSend(v11, "performRequests:error:", v13, &v120);
  v89 = v120;

  if (v24)
  {
    objc_msgSend(v95, "results");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    v85 = v16;
    v86 = v10;
    if (v26)
    {
      v27 = self;
      objc_msgSend(v95, "results");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      v119 = 0u;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v116, v131, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v117;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v117 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
            objc_msgSend(v33, "boundingBox");
            v35 = v34;
            v37 = v36;
            v39 = v38;
            v41 = v40;
            objc_msgSend(v33, "roll");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "yaw");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            +[FRCFaceHandLegRectangle faceRectangleWithBoundingBox:roll:yaw:](FRCFaceHandLegRectangle, "faceRectangleWithBoundingBox:roll:yaw:", v42, v43, v35, v37, v39, v41);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "addObject:", v44);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v116, v131, 16);
        }
        while (v30);
      }

      self = v27;
      v16 = v85;
      v10 = v86;
    }
    objc_msgSend(v16, "results");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");

    if (v46)
    {
      objc_msgSend(v16, "results");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = 0u;
      v113 = 0u;
      v114 = 0u;
      v115 = 0u;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v112, v130, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v113;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v113 != v50)
              objc_enumerationMutation(v47);
            +[FRCFaceHandLegRectangle handRectangleWithObservation:](FRCFaceHandLegRectangle, "handRectangleWithObservation:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * j));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v52);

          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v112, v130, 16);
        }
        while (v49);
      }

    }
    objc_msgSend(v94, "results");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "count");

    if (v54)
    {
      v84 = self;
      v55 = objc_alloc_init(FRCBodyBoundingBoxDetector);
      objc_msgSend(v94, "results");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v108, v129, 16);
      if (v57)
      {
        v59 = v57;
        v60 = *(_QWORD *)v109;
        do
        {
          for (k = 0; k != v59; ++k)
          {
            if (*(_QWORD *)v109 != v60)
              objc_enumerationMutation(v56);
            *(float *)&v58 = (float)v88 / (float)v87;
            -[FRCBodyBoundingBoxDetector createBodyRectanglesWithObservation:frameAspectRatio:](v55, "createBodyRectanglesWithObservation:frameAspectRatio:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * k), v58, v84);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = 0u;
            v105 = 0u;
            v106 = 0u;
            v107 = 0u;
            v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v104, v128, 16);
            if (v63)
            {
              v64 = v63;
              v65 = *(_QWORD *)v105;
              do
              {
                for (m = 0; m != v64; ++m)
                {
                  if (*(_QWORD *)v105 != v65)
                    objc_enumerationMutation(v62);
                  objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * m));
                }
                v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v104, v128, 16);
              }
              while (v64);
            }

          }
          v59 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v108, v129, 16);
        }
        while (v59);
      }

      self = v84;
      v16 = v85;
      v10 = v86;
    }
    objc_msgSend(v93, "results", v84);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "count");

    if (v68)
    {
      objc_msgSend(v93, "results");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v100, v127, 16);
      if (v70)
      {
        v71 = v70;
        v72 = *(_QWORD *)v101;
        do
        {
          for (n = 0; n != v71; ++n)
          {
            if (*(_QWORD *)v101 != v72)
              objc_enumerationMutation(v69);
            objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * n), "boundingBox");
            +[FRCFaceHandLegRectangle humanRectangleWithBoundingBox:](FRCFaceHandLegRectangle, "humanRectangleWithBoundingBox:");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v74);

          }
          v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v100, v127, 16);
        }
        while (v71);
      }

    }
    objc_msgSend(v92, "results");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "count");

    if (v76)
    {
      objc_msgSend(v92, "results");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v96, v126, 16);
      if (v78)
      {
        v79 = v78;
        v80 = *(_QWORD *)v97;
        do
        {
          for (ii = 0; ii != v79; ++ii)
          {
            if (*(_QWORD *)v97 != v80)
              objc_enumerationMutation(v77);
            objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * ii), "boundingBox");
            +[FRCFaceHandLegRectangle animalFaceRectangleWithBoundingBox:](FRCFaceHandLegRectangle, "animalFaceRectangleWithBoundingBox:");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v82);

          }
          v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v96, v126, 16);
        }
        while (v79);
      }

    }
  }

  -[OpticalFlowAnalyzer printFaceHandLegRectangles:](self, "printFaceHandLegRectangles:", v12);
  return v12;
}

- (void)printFaceHandLegRectangles:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  NSLog(CFSTR("[FlowAnalysis] Face Hand Leg Rectangles available. Total = %ld\n"), objc_msgSend(v3, "count"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "boundingBox");
        printf("\tCount %d\tCategory %lu\t(%.3f,%.3f)\t%.3f x %.3f\n", v7 + i, objc_msgSend(v10, "category"), v11, v12, v13, v14);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v7 += i;
    }
    while (v6);
  }

  fflush((FILE *)*MEMORY[0x1E0C80C20]);
}

- ($E2C29196C7A5C696474C6955C5A9CE06)safeThresholdWithtimeGap:(id *)a3 isDownsampled:(BOOL)a4
{
  _BOOL4 v4;
  float v6;
  unint64_t useCase;
  float v8;
  float v9;
  int v10;
  int *v11;
  int *v12;
  float v13;
  float v14;
  float consistencySafeThresholdsScale;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  int *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  int *v29;
  CMTime v30;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v4 = a4;
  v30 = *(CMTime *)a3;
  v6 = CMTimeGetSeconds(&v30) * 1000.0;
  useCase = self->_useCase;
  if (useCase == 1)
  {
    v18 = (float)(v6 + -66.0) / 40.0;
    if (v18 > 11.0)
      v18 = 11.0;
    v19 = fmaxf(v18, 9.0);
    v20 = (float)((float)(v6 + -117.0) * 3.0) / 100.0;
    if (v20 > 8.0)
      v20 = 8.0;
    v21 = fmaxf(v20, 0.0);
    if (v6 < 426.0)
      v22 = v21;
    else
      v22 = v19;
    v23 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForNonDownsampledSloMo;
    if (v4)
      v23 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForDownsampledSloMo;
    v17 = *(float *)((char *)&self->super.super.isa + 4 * (int)v22 + *v23);
    v9 = fminf(self->jsonConsistencyFrameScoreThresholdOnDemand, v17);
    goto LABEL_30;
  }
  if (useCase)
  {
    v24 = (float)(v6 + -66.0) / 40.0;
    if (v24 > 11.0)
      v24 = 11.0;
    v25 = fmaxf(v24, 9.0);
    v26 = 8.0;
    if ((float)((float)((float)(v6 + -117.0) * 3.0) / 100.0) <= 8.0)
      v26 = (float)((float)(v6 + -117.0) * 3.0) / 100.0;
    v9 = 0.0;
    v27 = fmaxf(v26, 0.0);
    if (v6 < 426.0)
      v28 = v27;
    else
      v28 = v25;
    v29 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForNonDownsampledSloMo;
    if (v4)
      v29 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForDownsampledSloMo;
    v17 = *(float *)((char *)&self->super.super.isa + 4 * (int)v28 + *v29);
LABEL_30:
    v16 = v17;
    goto LABEL_31;
  }
  v8 = (float)((float)(v6 + -50.0) * 3.0) / 100.0;
  if (v8 > 7.0)
    v8 = 7.0;
  v9 = 0.0;
  v10 = (int)fmaxf(v8, 0.0);
  v11 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForNonDownsampled;
  if (v4)
    v11 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForDownsampled;
  v12 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForDownsampledDelta;
  if (!v4)
    v12 = &OBJC_IVAR___OpticalFlowAnalyzer_jsonConsistencySafeThresholdsForNonDownsampledDelta;
  v13 = *(float *)((char *)&self->super.super.isa + 4 * v10 + *v11);
  v14 = *(float *)((char *)&self->super.super.isa + 4 * v10 + *v12);
  consistencySafeThresholdsScale = self->consistencySafeThresholdsScale;
  v16 = v13
      + (float)((float)(consistencySafeThresholdsScale + self->consistencySafeThresholdsScaleForLargeRandomnessErr) * v14);
  v17 = v13 + fmax(consistencySafeThresholdsScale, 0.0) * v14;
LABEL_31:
  result.var2 = v9;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void)isSafeToInterpolateForRandomnessGatingWithPrevFlowBackward:(__CVBuffer *)a3 flowForward:(__CVBuffer *)a4 lastFrameDuration:(id *)a5 lastNumberOfFrames:(unint64_t)a6 flowResFrame:(__CVBuffer *)a7
{
  void *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float randomnessAreaScale;
  float jsonRandomnessAreaPercentageThresholdHigh;
  float jsonRandomnessAreaPercentageThresholdLow;
  float *p_consistentFlowRandomness;
  float v24;
  float consistentFlowRandomness;
  int32_t v26;
  float v27;
  BOOL v28;
  const char *v29;
  float prevFlowRandomnessErr;
  float v31;
  float prevFlowRandomnessArea;
  float v33;
  float v34;
  BOOL v35;
  BOOL v36;
  float v37;
  float signErrFlowRandomness;
  float v39;
  _BOOL4 v40;
  float signAreaFlowRandomness;
  BOOL v42;
  float v43;
  char v44;
  float v45;
  float v46;
  __CFString *v47;
  CMTime time2;
  CMTime time1;

  v13 = (void *)MEMORY[0x1D825AFCC](self, a2);
  time1 = *(CMTime *)a5;
  -[OpticalFlowAnalyzer analyzeFlowRandomnessWithPrevFlowBackward:forward:lastFrameDuration:lastNumberOfFrames:flowResFrame:](self, "analyzeFlowRandomnessWithPrevFlowBackward:forward:lastFrameDuration:lastNumberOfFrames:flowResFrame:", a3, a4, &time1, a6, a7);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_autoreleasePoolPop(v13);
  if (v17 >= self->jsonRandomnessScoreThreshold)
    goto LABEL_9;
  randomnessAreaScale = self->randomnessAreaScale;
  jsonRandomnessAreaPercentageThresholdHigh = self->jsonRandomnessAreaPercentageThresholdHigh;
  jsonRandomnessAreaPercentageThresholdLow = self->jsonRandomnessAreaPercentageThresholdLow;
  if ((float)(v19 * randomnessAreaScale) >= jsonRandomnessAreaPercentageThresholdHigh)
  {
    v24 = jsonRandomnessAreaPercentageThresholdHigh - jsonRandomnessAreaPercentageThresholdLow;
LABEL_7:
    p_consistentFlowRandomness = &self->_consistentFlowRandomness;
    consistentFlowRandomness = self->_consistentFlowRandomness;
    goto LABEL_8;
  }
  if ((float)(v19 * randomnessAreaScale) >= jsonRandomnessAreaPercentageThresholdLow)
  {
    v24 = -(float)(jsonRandomnessAreaPercentageThresholdLow - (float)(v19 * randomnessAreaScale));
    goto LABEL_7;
  }
  p_consistentFlowRandomness = &self->_consistentFlowRandomness;
  v24 = self->_consistentFlowRandomness;
  consistentFlowRandomness = 0.0;
LABEL_8:
  *p_consistentFlowRandomness = v24 + consistentFlowRandomness;
LABEL_9:
  if (v15 < self->jsonRandomnessErrThreshold
    || v19 < self->jsonRandomnessAreaPercentageThresholdLow
    || (time1 = (CMTime)*a5, time2 = (CMTime)self->_timeGap, v26 = CMTimeCompare(&time1, &time2), v27 = 3.0, v26)
    && (unint64_t)(self->_motionHistogramsAnalysis.hasSpecialMotion - 3) <= 1)
  {
    v28 = 0;
    v27 = 2.0;
    v29 = "NO";
  }
  else
  {
    v29 = "YES";
    v28 = 1;
  }
  self->_isLargeRandomnessErr = v28;
  prevFlowRandomnessErr = self->_prevFlowRandomnessErr;
  if (prevFlowRandomnessErr != -1.0)
  {
    v31 = fmaxf(prevFlowRandomnessErr, v15);
    prevFlowRandomnessArea = self->_prevFlowRandomnessArea;
    v33 = fmaxf(prevFlowRandomnessArea, v19);
    v34 = fminf(prevFlowRandomnessArea, v19);
    if (v33 >= 10.0 && v33 > (float)(v34 * self->jsonConsistentRandomFlowResetAreaChangeRatio))
      self->_consistentFlowRandomness = 0.0;
    if (v31 > 1.0)
    {
      v35 = v33 >= 5.0;
      if (v33 > (float)(v34 * 20.0))
        v35 = 1;
      if (v34 >= 1.0)
        v35 = 0;
      v36 = v33 >= 0.5 && v34 < 10.0;
      if (v36 && !v35)
      {
        v37 = fminf(prevFlowRandomnessErr, v15);
        if (v31 <= (float)(v37 * self->randomnessErrorChangeRatioThreshold))
        {
          v40 = 0;
          self->_signErrFlowRandomness = 0.0;
          if (v33 <= (float)(v34 * self->randomnessAreaChangeRatioThreshold))
          {
            self->_signAreaFlowRandomness = 0.0;
            goto LABEL_54;
          }
        }
        else
        {
          signErrFlowRandomness = self->_signErrFlowRandomness;
          v42 = v31 == v15;
          v39 = -1.0;
          if (v42)
            v39 = 1.0;
          v40 = signErrFlowRandomness != v39;
          self->_signErrFlowRandomness = v39;
          if (v33 <= (float)(v34 * self->randomnessAreaChangeRatioThreshold))
          {
            self->_signAreaFlowRandomness = 0.0;
            if (signErrFlowRandomness == v39)
              goto LABEL_54;
            goto LABEL_52;
          }
        }
        signAreaFlowRandomness = self->_signAreaFlowRandomness;
        if (v33 == v19)
        {
          v42 = signAreaFlowRandomness == 1.0;
          v43 = 1.0;
        }
        else
        {
          v42 = signAreaFlowRandomness == -1.0;
          v43 = -1.0;
        }
        self->_signAreaFlowRandomness = v43;
        v44 = !v42 || v40;
        if (v42)
          v40 = 0;
        if ((v44 & 1) != 0)
        {
          if (v33 > 10.0 && v40 && v37 > 1.0 && v34 > 2.0)
          {
            v45 = self->_zigzagFlowRandomness + v27;
LABEL_53:
            self->_zigzagFlowRandomness = v45;
            goto LABEL_54;
          }
LABEL_52:
          v45 = self->_zigzagFlowRandomness + 1.0;
          goto LABEL_53;
        }
      }
    }
  }
LABEL_54:
  v46 = self->_consistentFlowRandomness;
  if (v17 < self->jsonRandomnessScoreThresholdLow)
  {
    v46 = v46 + 10.0;
    self->_consistentFlowRandomness = v46;
  }
  printf("[CrossFlowAnalysis] [Optical Flow Downsampling: %d, Consistent: %.3f, Zigzag: %.3f, isLargeRandomnessErr: %s]\n", self->_opticalFlowDownsampling, v46, self->_zigzagFlowRandomness, v29);
  if (self->_consistentFlowRandomness > self->jsonConsistentRandomFlowThreshold)
  {
    v47 = CFSTR("[CrossFlowAnalysis] Interpolation is gated (randomness) - consistent");
LABEL_60:
    self->_safeToInterpolate.randomness = 0;
    NSLog(&v47->isa);
    goto LABEL_61;
  }
  if (self->_zigzagFlowRandomness > self->jsonZigzagRandomFlowThreshold)
  {
    v47 = CFSTR("[CrossFlowAnalysis] Interpolation is gated (randomness) - zigzag");
    goto LABEL_60;
  }
LABEL_61:
  self->_prevFlowRandomnessErr = v15;
  self->_prevFlowRandomnessArea = v19;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)analyzeFlowRandomnessWithPrevFlowBackward:(__CVBuffer *)a3 forward:(__CVBuffer *)a4 lastFrameDuration:(id *)a5 lastNumberOfFrames:(unint64_t)a6 flowResFrame:(__CVBuffer *)a7
{
  void *v12;
  void *v13;
  void *v14;
  id v15;
  float *v16;
  int64_t value;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 2uLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->super._device, 1, 2uLL);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  createRGBATextureFromCVPixelBuffer(a7, self->super._device);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 8, 0));
  v16 = (float *)objc_msgSend(v15, "contents");
  value = self->_timeGap.value;
  v18 = fmin((double)a5->var0, (double)value) / (fmin((double)a6, (double)self->_framesToInterpolate) + 1.0);
  v19 = v18 + v18;
  *v16 = v19 / (float)a5->var0;
  v16[1] = v19 / (float)value;
  -[OpticalFlowAnalyzer calcCrossFlowStatisticsPrevBackwardFlowTexture:forwardFlowTexture:frameTexture:flowScaleBuffer:](self, "calcCrossFlowStatisticsPrevBackwardFlowTexture:forwardFlowTexture:frameTexture:flowScaleBuffer:", v12, v13, v14, v15);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  printf("[CrossFlowAnalysis] lastFrameDuration: %lld, currentFrameDuration: %lld, lastFramesToInterpolate: %ld, framesToInterpolate: %ld, Error: %.3f, Score: %.3f, Area: %.3f\n", a5->var0, self->_timeGap.value, a6, self->_framesToInterpolate, v20, v22, v24);

  v26 = v21;
  v27 = v23;
  v28 = v25;
  result.var2 = v28;
  result.var1 = v27;
  result.var0 = v26;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)calcCrossFlowStatisticsPrevBackwardFlowTexture:(id)a3 forwardFlowTexture:(id)a4 frameTexture:(id)a5 flowScaleBuffer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  int64x2_t v29;
  uint64_t v30;
  _QWORD v31[3];
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (unint64_t)(objc_msgSend(v12, "width") + 7) >> 3;
  v15 = (unint64_t)(objc_msgSend(v12, "height") + 7) >> 3;
  v16 = (void *)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 4 * v14 * v15, 0);
  -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setComputePipelineState:", self->_crossFlowStatisticsKernel);
  objc_msgSend(v18, "setTexture:atIndex:", v13, 0);

  objc_msgSend(v18, "setTexture:atIndex:", v12, 1);
  objc_msgSend(v18, "setTexture:atIndex:", v11, 2);

  objc_msgSend(v18, "setBuffer:offset:atIndex:", v10, 0, 0);
  objc_msgSend(v18, "setBuffer:offset:atIndex:", v16, 0, 1);
  v31[0] = v14;
  v31[1] = v15;
  v31[2] = 1;
  v29 = vdupq_n_s64(8uLL);
  v30 = 1;
  objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", v31, &v29);
  objc_msgSend(v18, "endEncoding");
  objc_msgSend(v17, "commit");
  objc_msgSend(v17, "waitUntilCompleted");
  v19 = objc_retainAutorelease(v16);
  -[OpticalFlowAnalyzer processGPUOutputsRandomness:blockWidth:blockHeight:](self, "processGPUOutputsRandomness:blockWidth:blockHeight:", objc_msgSend(v19, "contents"), v14, v15);
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v21;
  v27 = v23;
  v28 = v25;
  result.var2 = v28;
  result.var1 = v27;
  result.var0 = v26;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)processGPUOutputsRandomness:(id *)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5
{
  uint64_t v9;
  unint64_t v10;
  float v11;
  float v12;
  uint64_t v13;
  float var0;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  CGPoint v19;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  if (a5)
  {
    v9 = 0;
    v10 = 0;
    v18 = 4 * (int)a4;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      if (a4)
      {
        v13 = 0;
        do
        {
          v19.x = (double)(int)v13;
          v19.y = (double)(int)v9;
          if (CGRectContainsPoint(self->_cleanRectFlow8x8, v19))
          {
            ++v10;
            var0 = a3[v13].var0;
            v11 = v11 + var0;
            if (var0 > (float)(self->jsonRandomnessAreaThreshold * 64.0))
              v12 = v12 + 1.0;
          }
          ++v13;
        }
        while (a4 != v13);
      }
      ++v9;
      a3 = ($3BA783FF50B239963188BE194EBFFEBA *)((char *)a3 + v18);
    }
    while (v9 != a5);
  }
  else
  {
    v10 = 0;
    v12 = 0.0;
    v11 = 0.0;
  }
  v15 = log10(100.0 / (float)(v11 / (float)(v10 << 6))) * 10.0;
  v16 = (float)(v12 * 100.0) / (float)v10;
  v17 = v11 / (float)(v10 << 6);
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v17;
  return result;
}

- (void)modulateGatingParametersWithFlowForward:(__CVBuffer *)a3 flowResFrame:(__CVBuffer *)a4
{
  void *v6;
  uint64_t v7;
  id v8;

  createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 2uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  createRGBATextureFromCVPixelBuffer(a4, self->super._device);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[OpticalFlowAnalyzer calcMotionHistogramForwardFlowTexture:frameTexture:](self, "calcMotionHistogramForwardFlowTexture:frameTexture:", v6, v8);
  v7 = objc_msgSend(v6, "width");
  self->_size = objc_msgSend(v6, "height") * v7;
  -[OpticalFlowAnalyzer analyzeMotionHistograms](self, "analyzeMotionHistograms");
  -[OpticalFlowAnalyzer analyzeDeformation](self, "analyzeDeformation");
  -[OpticalFlowAnalyzer modulateGatingParametersFromMotionHistogramsAnalysis](self, "modulateGatingParametersFromMotionHistogramsAnalysis");
  fflush((FILE *)*MEMORY[0x1E0C80C20]);

}

- (void)calcMotionHistogramForwardFlowTexture:(id)a3 frameTexture:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  int64x2_t v18;
  uint64_t v19;
  _QWORD v20[4];

  v6 = a4;
  v7 = a3;
  v8 = (unint64_t)(objc_msgSend(v7, "width") + 7) >> 3;
  v9 = (unint64_t)(objc_msgSend(v7, "height") + 7) >> 3;
  v10 = (void *)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", (v8 * v9) << 6, 0);
  v11 = (void *)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", (v8 * v9) << 6, 0);
  -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComputePipelineState:", self->_motionHistogramsKernel);
  objc_msgSend(v13, "setTexture:atIndex:", v7, 0);

  objc_msgSend(v13, "setTexture:atIndex:", v6, 1);
  objc_msgSend(v13, "setBuffer:offset:atIndex:", v10, 0, 0);
  objc_msgSend(v13, "setBuffer:offset:atIndex:", v11, 0, 1);
  v20[0] = v8;
  v20[1] = v9;
  v20[2] = 1;
  v18 = vdupq_n_s64(8uLL);
  v19 = 1;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v20, &v18);
  objc_msgSend(v13, "endEncoding");
  objc_msgSend(v12, "commit");
  objc_msgSend(v12, "waitUntilCompleted");
  v17 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v17, "contents");
  v15 = objc_retainAutorelease(v11);
  v16 = objc_msgSend(v15, "contents");
  -[OpticalFlowAnalyzer processGPUOutputsHistograms:blockWidth:blockHeight:](self, "processGPUOutputsHistograms:blockWidth:blockHeight:", v14, v8, v9);
  -[OpticalFlowAnalyzer processGPUOutputsHistogramsForDeformation:blockWidth:blockHeight:](self, "processGPUOutputsHistogramsForDeformation:blockWidth:blockHeight:", v16, v8, v9);
  printf("[MotionHistograms] magnitude: [%d, %d, %d, %d, %d, %d, %d, %d] direction: [%d, %d, %d, %d, %d, %d, %d, %d] direction_top_left: [%d, %d, %d, %d] direction_top_right: [%d, %d, %d, %d] direction_bottom_left: [%d, %d, %d, %d] direction_bottom_right: [%d, %d, %d, %d]\n", self->_motionHistograms.frameMagnitude[0], self->_motionHistograms.frameMagnitude[1], self->_motionHistograms.frameMagnitude[2], self->_motionHistograms.frameMagnitude[3], self->_motionHistograms.frameMagnitude[4], self->_motionHistograms.frameMagnitude[5], self->_motionHistograms.frameMagnitude[6], self->_motionHistograms.frameMagnitude[7], self->_motionHistograms.frameDirection[0], self->_motionHistograms.frameDirection[1], self->_motionHistograms.frameDirection[2], self->_motionHistograms.frameDirection[3], self->_motionHistograms.frameDirection[4], self->_motionHistograms.frameDirection[5], self->_motionHistograms.frameDirection[6], self->_motionHistograms.frameDirection[7],
    self->_motionHistograms.topLeftDirection[0],
    self->_motionHistograms.topLeftDirection[1],
    self->_motionHistograms.topLeftDirection[2],
    self->_motionHistograms.topLeftDirection[3],
    self->_motionHistograms.topRightDirection[0],
    self->_motionHistograms.topRightDirection[1],
    self->_motionHistograms.topRightDirection[2],
    self->_motionHistograms.topRightDirection[3],
    self->_motionHistograms.bottomLeftDirection[0],
    self->_motionHistograms.bottomLeftDirection[1],
    self->_motionHistograms.bottomLeftDirection[2],
    self->_motionHistograms.bottomLeftDirection[3],
    self->_motionHistograms.bottomRightDirection[0],
    self->_motionHistograms.bottomRightDirection[1],
    self->_motionHistograms.bottomRightDirection[2],
    self->_motionHistograms.bottomRightDirection[3]);

}

- (unsigned)averageMagnitude:(unsigned int *)a3
{
  unint64_t v3;
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;

  v3 = 0;
  v4 = 0uLL;
  v5 = 0uLL;
  do
  {
    v6 = *(int32x4_t *)&a3[v3 / 4];
    v4 = vmlaq_s32(v4, (int32x4_t)xmmword_1D428E5C8[v3 / 0x10], v6);
    v5 = vaddq_s32(v6, v5);
    v3 += 16;
  }
  while (v3 != 32);
  return vaddvq_s32(v4) / vaddvq_s32(v5);
}

- (void)convertOctantDirectionHistogram:(int *)a3 toPerpendicularQuadrantHistogram:(unsigned int *)a4
{
  uint64_t i;
  int v5;

  for (i = 0; i != 8; *a4++ += a3[i & 6] + v5)
  {
    v5 = a3[i + 1];
    i += 2;
  }
}

- (void)processGPUOutputsHistograms:(id *)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5
{
  unint64_t v5;
  unint64_t v6;
  $D94FD548DE103586A417D0DA94597CA6 *v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  int *v13;
  int *v14;
  char v15;
  int *v16;
  int *var1;
  unint64_t k;
  unint64_t j;
  unint64_t n;
  unint64_t m;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  int32x4_t v26;
  uint64_t v27;
  int32x4_t v29;
  BOOL v30;
  $D94FD548DE103586A417D0DA94597CA6 *v31;
  unint64_t v32;
  unint64_t v33;
  int32x4_t v34;
  unint64_t v35;
  unint64_t v36;
  int32x4_t v37;
  unint64_t v38;
  unint64_t v40;
  unint64_t v42;
  unint64_t v43;
  _OWORD v45[2];
  _OWORD v46[2];
  __int128 v47;
  __int128 v48;
  _OWORD v49[2];
  _OWORD v50[2];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  CGPoint v58;
  float32x4x2_t v59;
  float32x4x2_t v60;
  float32x4x2_t v61;
  float32x4x2_t v62;

  v57 = *MEMORY[0x1E0C80C00];
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v52 = 0uLL;
  v51 = 0uLL;
  memset(v50, 0, sizeof(v50));
  memset(v49, 0, sizeof(v49));
  v48 = 0uLL;
  v47 = 0uLL;
  memset(v46, 0, sizeof(v46));
  v34 = 0u;
  v29 = 0u;
  v26 = 0u;
  memset(v45, 0, sizeof(v45));
  v37 = 0u;
  if (a5)
  {
    v5 = a4;
    v6 = 0;
    v36 = a5 / 5uLL;
    v35 = a4 / 5uLL;
    v40 = a5 >> 1;
    v38 = a4 >> 1;
    v32 = a5 - v36;
    v33 = a4 - v35;
    v25 = (int)a4;
    v27 = (uint64_t)(int)a4 << 6;
    v37 = 0uLL;
    v7 = a3;
    v34 = 0uLL;
    v29 = 0uLL;
    v26 = 0uLL;
    do
    {
      v43 = v6;
      v31 = v7;
      if (v5)
      {
        v8 = 0;
        v9 = (double)(int)v6;
        v42 = v6 * v25;
        v30 = v40 <= v6;
        do
        {
          v58.x = (double)(int)v8;
          v58.y = v9;
          if (CGRectContainsPoint(self->_cleanRectFlow8x8, v58))
          {
            v10 = 0;
            v11 = v8 + v42;
            do
            {
              *(__int128 *)((char *)&v55 + v10 * 4) = (__int128)vaddq_s32(*(int32x4_t *)((char *)&v55 + v10 * 4), *(int32x4_t *)&v7->var0[v10]);
              v10 += 4;
            }
            while (v10 != 8);
            if (a3[v8 + v42].var0[0] <= 57)
            {
              for (i = 0; i != 8; i += 4)
                *(__int128 *)((char *)&v53 + i * 4) = (__int128)vaddq_s32(*(int32x4_t *)((char *)&v53 + i * 4), *(int32x4_t *)&v7->var1[i]);
              if (v40 <= v43 || v38 <= v8)
              {
                if (v40 <= v43 || v38 > v8)
                {
                  v15 = !v30;
                  if (v38 <= v8)
                    v15 = 1;
                  if ((v15 & 1) != 0)
                  {
                    if (v40 <= v43 && v38 <= v8)
                    {
                      var1 = a3[v11].var1;
                      v62 = vld2q_f32((const float *)var1);
                      v26 = vaddq_s32(vaddq_s32((int32x4_t)v62.val[1], (int32x4_t)v62.val[0]), v26);
                    }
                  }
                  else
                  {
                    v16 = a3[v11].var1;
                    v61 = vld2q_f32((const float *)v16);
                    v29 = vaddq_s32(vaddq_s32((int32x4_t)v61.val[1], (int32x4_t)v61.val[0]), v29);
                  }
                }
                else
                {
                  v14 = a3[v11].var1;
                  v60 = vld2q_f32((const float *)v14);
                  v34 = vaddq_s32(vaddq_s32((int32x4_t)v60.val[1], (int32x4_t)v60.val[0]), v34);
                }
              }
              else
              {
                v13 = a3[v11].var1;
                v59 = vld2q_f32((const float *)v13);
                v37 = vaddq_s32(vaddq_s32((int32x4_t)v59.val[1], (int32x4_t)v59.val[0]), v37);
              }
              if (v8 >= v35)
              {
                if (v33 < v8)
                {
                  -[OpticalFlowAnalyzer convertOctantDirectionHistogram:toPerpendicularQuadrantHistogram:](self, "convertOctantDirectionHistogram:toPerpendicularQuadrantHistogram:", a3[v11].var1, &v51);
                  for (j = 0; j != 8; j += 4)
                    v49[j / 4] = vaddq_s32((int32x4_t)v49[j / 4], *(int32x4_t *)&v7->var0[j]);
                }
              }
              else
              {
                -[OpticalFlowAnalyzer convertOctantDirectionHistogram:toPerpendicularQuadrantHistogram:](self, "convertOctantDirectionHistogram:toPerpendicularQuadrantHistogram:", a3[v11].var1, &v52);
                for (k = 0; k != 8; k += 4)
                  v50[k / 4] = vaddq_s32((int32x4_t)v50[k / 4], *(int32x4_t *)&v7->var0[k]);
              }
              if (v43 >= v36)
              {
                if (v32 < v43)
                {
                  -[OpticalFlowAnalyzer convertOctantDirectionHistogram:toPerpendicularQuadrantHistogram:](self, "convertOctantDirectionHistogram:toPerpendicularQuadrantHistogram:", a3[v11].var1, &v47);
                  for (m = 0; m != 8; m += 4)
                    v45[m / 4] = vaddq_s32((int32x4_t)v45[m / 4], *(int32x4_t *)&v7->var0[m]);
                }
              }
              else
              {
                -[OpticalFlowAnalyzer convertOctantDirectionHistogram:toPerpendicularQuadrantHistogram:](self, "convertOctantDirectionHistogram:toPerpendicularQuadrantHistogram:", a3[v11].var1, &v48);
                for (n = 0; n != 8; n += 4)
                  v46[n / 4] = vaddq_s32((int32x4_t)v46[n / 4], *(int32x4_t *)&v7->var0[n]);
              }
            }
            v5 = a4;
          }
          ++v8;
          ++v7;
        }
        while (v8 != v5);
      }
      v6 = v43 + 1;
      v7 = ($D94FD548DE103586A417D0DA94597CA6 *)((char *)v31 + v27);
    }
    while (v43 + 1 != a5);
  }
  *(_QWORD *)&v22 = -1;
  *((_QWORD *)&v22 + 1) = -1;
  *(_OWORD *)self->_motionHistograms.frameDirection = v22;
  *(_OWORD *)&self->_motionHistograms.frameDirection[4] = v22;
  *(_OWORD *)self->_motionHistograms.topLeftDirection = v22;
  *(_OWORD *)self->_motionHistograms.topRightDirection = v22;
  *(_OWORD *)self->_motionHistograms.bottomLeftDirection = v22;
  *(_OWORD *)self->_motionHistograms.bottomRightDirection = v22;
  *(_OWORD *)&self->_motionHistograms.numLowMotionOppositeDirectionBlocks = v22;
  *(_OWORD *)&self->_motionHistograms.leftSideDirection[2] = v22;
  *(_OWORD *)&self->_motionHistograms.rightSideDirection[2] = v22;
  *(_OWORD *)self->_motionHistograms.topSideDirection = v22;
  *(_QWORD *)&self->_motionHistograms.topSideAverageMagnitude = -1;
  v23 = v56;
  *(_OWORD *)self->_motionHistograms.frameMagnitude = v55;
  *(_OWORD *)&self->_motionHistograms.frameMagnitude[4] = v23;
  v24 = v54;
  *(_OWORD *)self->_motionHistograms.frameDirection = v53;
  *(_OWORD *)&self->_motionHistograms.frameDirection[4] = v24;
  *(int32x4_t *)self->_motionHistograms.topLeftDirection = v37;
  *(int32x4_t *)self->_motionHistograms.topRightDirection = v34;
  *(int32x4_t *)self->_motionHistograms.bottomLeftDirection = v29;
  *(int32x4_t *)self->_motionHistograms.bottomRightDirection = v26;
  *(_OWORD *)self->_motionHistograms.leftSideDirection = v52;
  *(_OWORD *)self->_motionHistograms.rightSideDirection = v51;
  *(_OWORD *)self->_motionHistograms.topSideDirection = v48;
  *(_OWORD *)self->_motionHistograms.bottomSideDirection = v22;
  *(_OWORD *)self->_motionHistograms.bottomSideDirection = v47;
  self->_motionHistograms.leftSideAverageMagnitude = -[OpticalFlowAnalyzer averageMagnitude:](self, "averageMagnitude:", v50, a4);
  self->_motionHistograms.rightSideAverageMagnitude = -[OpticalFlowAnalyzer averageMagnitude:](self, "averageMagnitude:", v49);
  self->_motionHistograms.topSideAverageMagnitude = -[OpticalFlowAnalyzer averageMagnitude:](self, "averageMagnitude:", v46);
  self->_motionHistograms.bottomSideAverageMagnitude = -[OpticalFlowAnalyzer averageMagnitude:](self, "averageMagnitude:", v45);
}

- (void)processGPUOutputsHistogramsForDeformation:(id *)a3 blockWidth:(unint64_t)a4 blockHeight:(unint64_t)a5
{
  int *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  int *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  int *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  int *deformationBlockRanges;
  int *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  BOOL v41;
  int v42;
  unsigned int v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unsigned int v50;
  CGPoint v51;
  CGPoint v52;

  v9 = (int *)malloc_type_calloc(4uLL, 4uLL, 0x100004052888210uLL);
  self->_deformationBlockRanges = v9;
  *v9 = a4;
  v9[1] = -1;
  v9[2] = a5;
  v9[3] = -1;
  if (self->_visualizationEnabled)
    self->_deformationBinaryMap = (char *)malloc_type_calloc(a5 * a4, 1uLL, 0x100004077774924uLL);
  v10 = (char *)malloc_type_calloc(a5 * a4, 1uLL, 0x100004077774924uLL);
  v11 = (int)a4;
  v44 = v10;
  if (a5)
  {
    v12 = 0;
    v46 = a5 - 5;
    v13 = &a3->var1[7];
    v14 = v10;
    v49 = a5;
    do
    {
      v15 = v11;
      if (a4)
      {
        v16 = 0;
        v17 = v13;
        do
        {
          v51.x = (double)(int)v16;
          v51.y = (double)(int)v12;
          if (CGRectContainsPoint(self->_cleanRectFlow8x8, v51)
            && *(v17 - 15) >= 58
            && (self->_useCase || v16 >= 5 && v46 > v12 && v12 >= 5 && a4 - 5 > v16))
          {
            v19 = *(v17 - 7);
            v18 = *(v17 - 6);
            v21 = *(v17 - 5);
            v20 = *(v17 - 4);
            v22 = v18 + v19 + v21;
            v23 = *(v17 - 3);
            if (v22 + v20 + v23)
            {
              v24 = *(v17 - 2);
              if (v21 + v18 + v20 + v23 + v24)
              {
                v25 = *(v17 - 1);
                if (v20 + v21 + v23 + v24 + v25)
                {
                  v26 = *v17;
                  if (v23 + v20 + v24 + v25 + *v17)
                  {
                    if (v24 + v23 + v25 + v26 + v19
                      && v24 + v19 + v25 + v26 + v18
                      && v18 + v19 + v25 + v26 + v21
                      && v22 + v26 + v20)
                    {
                      v14[v16] = 1;
                    }
                  }
                }
              }
            }
          }
          ++v16;
          v17 += 16;
        }
        while (a4 != v16);
      }
      ++v12;
      v11 = v15;
      v14 += v15;
      v13 += 16 * (uint64_t)(int)a4;
    }
    while (v12 != v49);
    v48 = v49 - 1;
    if (v49 - 1 < 2)
    {
      v50 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    v48 = -1;
  }
  v50 = 0;
  v45 = a4 - 1;
  v47 = v11;
  v27 = a4 - 2;
  v28 = &v44[v11 - a4];
  v29 = &v44[a4 + (int)a4];
  v30 = 1;
  v31 = v11;
  v32 = &v44[(int)a4];
  do
  {
    if (v45 >= 2)
    {
      v33 = 0;
      do
      {
        v34 = v33 + 1;
        v52.x = (double)((int)v33 + 1);
        v52.y = (double)(int)v30;
        if (CGRectContainsPoint(self->_cleanRectFlow8x8, v52)
          && v32[v33 + 1]
          && v28[v33 + 1]
           + v28[v33]
           + v28[v33 + 2]
           + v32[v33]
           + v32[v33 + 2]
           + v29[v33]
           + v29[v33 + 1]
           + v29[v33 + 2] >= 3)
        {
          deformationBlockRanges = self->_deformationBlockRanges;
          if (v34 < *deformationBlockRanges)
            *deformationBlockRanges = v34;
          if (v34 > deformationBlockRanges[1])
            deformationBlockRanges[1] = v34;
          if (v30 < deformationBlockRanges[2])
            deformationBlockRanges[2] = v30;
          if (v30 > deformationBlockRanges[3])
            deformationBlockRanges[3] = v30;
          ++v50;
          if (self->_visualizationEnabled)
            self->_deformationBinaryMap[v31 + 1 + v33] = -1;
        }
        ++v33;
      }
      while (v27 != v34);
    }
    ++v30;
    v32 += v47;
    v28 += v47;
    v31 += v47;
    v29 += v47;
  }
  while (v30 != v48);
LABEL_46:
  free(v44);
  self->_motionHistograms.numLowMotionOppositeDirectionBlocks = v50;
  v36 = self->_deformationBlockRanges;
  v37 = v36[1];
  v38 = v37 - *v36;
  if (v37 < *v36 || (v40 = v36[2], v39 = v36[3], v41 = __OFSUB__(v39, v40), v42 = v39 - v40, (v42 < 0) ^ v41))
    v43 = 0;
  else
    v43 = v38 + 1 + (v38 + 1) * v42;
  self->_motionHistograms.areaLowMotionOppositeDirectionBlocks = v43;
}

- (void)analyzeMotionHistograms
{
  $45573C9C5B706D0A2D859D636CE7E7B4 *p_motionHistogramsAnalysis;
  __int128 v4;

  p_motionHistogramsAnalysis = &self->_motionHistogramsAnalysis;
  *(_QWORD *)&v4 = -1;
  *((_QWORD *)&v4 + 1) = -1;
  *(_OWORD *)&self->_motionHistogramsAnalysis.hasStaticBackground = v4;
  *(_OWORD *)&self->_motionHistogramsAnalysis.hasSpecialMotion = v4;
  self->_motionHistogramsAnalysis.hasStaticBackground = -[OpticalFlowAnalyzer detectStaticBackground](self, "detectStaticBackground");
  -[OpticalFlowAnalyzer detectDominantDirection](self, "detectDominantDirection");
  p_motionHistogramsAnalysis->hasSpecialMotion = -[OpticalFlowAnalyzer detectSpecialMotion](self, "detectSpecialMotion");
  p_motionHistogramsAnalysis->hasCameraRotaion = -[OpticalFlowAnalyzer detectCameraRotation](self, "detectCameraRotation");
  printf("[MotionHistograms] has_static_background: %d, dominant_direction: %d, relative_dominant_direction: %d, has_special_motion: %ld\n", p_motionHistogramsAnalysis->hasStaticBackground, p_motionHistogramsAnalysis->dominantDirection, p_motionHistogramsAnalysis->relativeDominantDirection, p_motionHistogramsAnalysis->hasSpecialMotion);
}

- (BOOL)detectStaticBackground
{
  return self->_motionHistograms.frameMagnitude[0] > 2
                                                   * (vaddvq_s32(*(int32x4_t *)&self->_motionHistograms.frameMagnitude[1])
                                                    + self->_motionHistograms.frameMagnitude[5]
                                                    + self->_motionHistograms.frameMagnitude[6]
                                                    + self->_motionHistograms.frameMagnitude[7]);
}

- (void)detectDominantDirection
{
  uint64_t v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  float size;
  float v15;
  float v16;
  float v17;
  int v18;
  int v19;
  BOOL v20;
  _BOOL4 v21;
  int v22;
  int v24;
  int v25;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = -1;
  v8 = -1;
  v9 = -1;
  do
  {
    v10 = self->_motionHistograms.frameDirection[v2];
    if (v10 > v6)
      v6 = self->_motionHistograms.frameDirection[v2];
    if (v10 <= v5)
    {
      v11 = v5;
    }
    else
    {
      v7 = v2;
      v6 = v5;
      v11 = self->_motionHistograms.frameDirection[v2];
    }
    if (v10 > v4)
      v12 = v2;
    else
      v12 = v8;
    if (v10 <= v4)
    {
      v13 = v4;
    }
    else
    {
      v7 = v8;
      v6 = v5;
      v11 = v4;
      v13 = self->_motionHistograms.frameDirection[v2];
    }
    if (v10 <= v3)
    {
      v8 = v12;
    }
    else
    {
      v7 = v8;
      v8 = v9;
    }
    if (v10 <= v3)
    {
      v5 = v11;
    }
    else
    {
      v9 = v2;
      v6 = v5;
      v5 = v4;
    }
    if (v10 > v3)
      v4 = v3;
    else
      v4 = v13;
    if (v10 > v3)
      v3 = self->_motionHistograms.frameDirection[v2];
    ++v2;
  }
  while (v2 != 8);
  if ((v9 & 0x80000000) == 0)
  {
    size = (float)self->_size;
    v15 = size / self->jsonHistogramsAnalysisSmallObjectSizeThreshold;
    v16 = size / self->jsonHistogramsAnalysisLargeObjectSizeThreshold;
    if (v3 > (int)(3 * v4))
    {
      v17 = (float)v3;
      if (v15 < (float)v3)
        goto LABEL_61;
    }
    if ((v8 & 0x80000000) == 0)
    {
      v18 = v9 - v8 >= 0 ? v9 - v8 : v8 - v9;
      v19 = v3 + v4;
      v20 = v18 == 1 || v18 == 7;
      v21 = v20;
      if (v3 > (int)(3 * v5) && (v18 == 7 || v18 == 1))
      {
        v17 = (float)v19;
        if (v15 < (float)v19)
          goto LABEL_61;
      }
      if ((v7 & 0x80000000) == 0 && v3 > (int)(3 * v6))
      {
        v22 = v9 - v7;
        if (v9 - v7 < 0)
          v22 = v7 - v9;
        if (v22 == 1 || v22 == 7)
          v24 = v21 + 1;
        else
          v24 = v21;
        v25 = v8 - v7;
        if (v25 < 0)
          v25 = -v25;
        if (v25 == 1 || v25 == 7)
          ++v24;
        if (v24 == 2)
        {
          v17 = (float)(int)(v19 + v5);
          if (v15 < v17)
          {
LABEL_61:
            self->_motionHistogramsAnalysis.relativeDominantDirection = v9;
            if (v16 < v17)
              self->_motionHistogramsAnalysis.dominantDirection = v9;
          }
        }
      }
    }
  }
}

- (int64_t)detectSpecialMotion
{
  $6B8A7B0A5904C8635CA0AE20EFD025D0 *p_motionHistograms;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  _BOOL4 v10;
  int v11;
  int v12;
  _BOOL4 v13;
  int v14;
  _BOOL4 v15;
  int v16;
  int v17;
  _BOOL4 v18;
  unsigned int v19;
  int64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;

  p_motionHistograms = &self->_motionHistograms;
  v4 = -[OpticalFlowAnalyzer detectDominantDirectionInROI:](self, "detectDominantDirectionInROI:", self->_motionHistograms.topLeftDirection);
  v5 = -[OpticalFlowAnalyzer detectDominantDirectionInROI:](self, "detectDominantDirectionInROI:", p_motionHistograms->topRightDirection);
  v6 = -[OpticalFlowAnalyzer detectDominantDirectionInROI:](self, "detectDominantDirectionInROI:", p_motionHistograms->bottomLeftDirection);
  v7 = -[OpticalFlowAnalyzer detectDominantDirectionInROI:](self, "detectDominantDirectionInROI:", p_motionHistograms->bottomRightDirection);
  if (v4 == 2)
    v8 = 3;
  else
    v8 = 0;
  if (v5 == 3)
    v9 = 3;
  else
    v9 = 0;
  v10 = v5 == -1;
  if (v6 == 1)
    v11 = 3;
  else
    v11 = 0;
  if (v7)
    v12 = 0;
  else
    v12 = 3;
  v13 = v4 == -1;
  if (v4 == -1)
    v14 = v10 + 1;
  else
    v14 = v5 == -1;
  v15 = v6 == -1;
  v16 = v14 + v8 + v9 + v11;
  if (v6 == -1)
    v17 = v16 + 1;
  else
    v17 = v16;
  v18 = v7 == -1;
  v19 = v17 + v12;
  if (v7 == -1)
    ++v19;
  if (v19 > 6)
    return 1;
  if (v4)
    v21 = 0;
  else
    v21 = 3;
  v22 = v21 + v13;
  if (v5 == 1)
    v23 = 3;
  else
    v23 = 0;
  v24 = v22 + v23 + v10;
  if (v6 == 3)
    v25 = 3;
  else
    v25 = 0;
  v26 = v25 + v15;
  if (v7 == 2)
    v27 = 3;
  else
    v27 = 0;
  if ((v24 + v26 + v27 + v18) > 6)
    return 2;
  v20 = 3;
  if (v4 == 1)
    v28 = 3;
  else
    v28 = 0;
  v29 = v28 + v13;
  if (v5 == 2)
    v30 = 3;
  else
    v30 = 0;
  v31 = v29 + v30 + v10;
  if (v6)
    v32 = 0;
  else
    v32 = 3;
  v33 = v32 + v15;
  if (v7 == 3)
    v34 = 3;
  else
    v34 = 0;
  if ((v31 + v33 + v34 + v18) <= 9)
  {
    if (v4 == 3)
      v35 = 3;
    else
      v35 = 0;
    v36 = v35 + v13;
    if (v5)
      v37 = 0;
    else
      v37 = 3;
    v38 = v36 + v37 + v10;
    if (v6 == 2)
      v39 = 3;
    else
      v39 = 0;
    v40 = v39 + v15;
    if (v7 == 1)
      v41 = 3;
    else
      v41 = 0;
    return 4 * ((v38 + v40 + v41 + v18) > 9);
  }
  return v20;
}

- (int)detectDominantDirectionInROI:(unsigned int *)a3
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  signed int v6;
  int v7;
  unsigned int v9;

  v3 = a3[1];
  v5 = a3[2];
  v4 = a3[3];
  v6 = v3 + *a3 + v5 + v4;
  if (v6 <= self->_size / 0x14)
    return -1;
  v7 = v6 + (v6 < 0);
  if (*a3 > (int)(v3 + *a3 + v5 + v4) / 2)
    return 0;
  v9 = v7 >> 1;
  if (v3 > v7 >> 1)
    return 1;
  if (v5 > v9)
    return 2;
  if (v4 <= v9)
    return -1;
  return 3;
}

- (void)analyzeDeformation
{
  $6B8A7B0A5904C8635CA0AE20EFD025D0 *p_motionHistograms;
  float v4;
  float areaLowMotionOppositeDirectionBlocks;
  float v6;
  float numLowMotionOppositeDirectionBlocks;

  p_motionHistograms = &self->_motionHistograms;
  v4 = (float)(LODWORD(self->_size) >> 6);
  areaLowMotionOppositeDirectionBlocks = (float)self->_motionHistograms.areaLowMotionOppositeDirectionBlocks;
  v6 = 0.0;
  if ((float)(v4 * 0.06) < areaLowMotionOppositeDirectionBlocks)
  {
    numLowMotionOppositeDirectionBlocks = (float)self->_motionHistograms.numLowMotionOppositeDirectionBlocks;
    if ((float)(v4 * 0.007) <= numLowMotionOppositeDirectionBlocks)
      v6 = numLowMotionOppositeDirectionBlocks / areaLowMotionOppositeDirectionBlocks;
  }
  printf("[FlowAnalysis] deformationRatio: %.3f\n", v6);
  if (v6 > self->jsonDeformationRatioThreshold)
    self->_flowDeformation = self->_flowDeformation + 1.0;
  self->_flowDeformationSum = v6 + self->_flowDeformationSum;
  printf("[MotionHistograms] low motion opposite direction blocks: num: %d, area: %d, total_area: %d\n", p_motionHistograms->numLowMotionOppositeDirectionBlocks, p_motionHistograms->areaLowMotionOppositeDirectionBlocks, SLODWORD(self->_size) / 64);
}

- (void)isSafeToInterpolateForDeformationGating
{
  unint64_t useCase;
  __CFString *v4;
  float v5;
  float v6;

  printf("[FlowAnalysis] [Deformation: %.3f, DeformationSum: %.3f]\n", self->_flowDeformation, self->_flowDeformationSum);
  fflush((FILE *)*MEMORY[0x1E0C80C20]);
  useCase = self->_useCase;
  if (useCase == 1)
  {
    v5 = 1.5 / (exp((float)(self->_flowDeformationSum - self->jsonDeformationFlowSumThresholdForSloMo) * 5.0) + 1.0);
    v6 = fmin(v5, 1.0);
    if (v6 < 1.0)
      NSLog(CFSTR("[AutobahnFlowAnalysis] deformation gating confidence: %.3f in recommendation"), v6);
    self->_confidenceScore = fminf(v6, self->_confidenceScore);
    if (self->_flowDeformation > self->jsonDeformationFlowThresholdForSloMo
      && self->_flowDeformationSum > self->jsonDeformationFlowSumThresholdForSloMo)
    {
      v4 = CFSTR("[AutobahnFlowAnalysis] Interpolation is gated (deformation) for recommendation only");
      goto LABEL_11;
    }
  }
  else if (!useCase
         && self->_flowDeformation > self->jsonDeformationFlowThreshold
         && self->_flowDeformationSum > self->jsonDeformationFlowSumThreshold)
  {
    v4 = CFSTR("[FlowAnalysis] Interpolation is gated (deformation)");
LABEL_11:
    self->_safeToInterpolate.deformation = 0;
    NSLog(&v4->isa);
  }
}

- (void)modulateGatingParametersFromMotionHistogramsAnalysis
{
  _BOOL4 v2;
  int dominantDirection;
  int relativeDominantDirection;
  BOOL v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  int v12;
  BOOL v13;
  int64_t hasSpecialMotion;
  int64_t v15;
  _BOOL4 v17;
  BOOL v18;
  int v19;
  BOOL v21;
  BOOL *p_hasDominantMovingLargeObjects;
  BOOL v23;
  _BOOL4 hasStaticBackground;
  float jsonRandomnessAreaScale;
  _BOOL4 hasCameraMotion;
  _BOOL4 v27;
  uint64_t v28;

  if (self->_isContinuousDrops)
  {
    v2 = !self->_prevMotionHistogramsAnalysis.hasStaticBackground
      && self->_prevMotionHistogramsAnalysis.dominantDirection >= 0;
    dominantDirection = self->_motionHistogramsAnalysis.dominantDirection;
    relativeDominantDirection = self->_motionHistogramsAnalysis.relativeDominantDirection;
    v5 = self->_motionHistogramsAnalysis.hasStaticBackground || dominantDirection < 0;
    v6 = v5;
    v7 = self->_prevMotionHistogramsAnalysis.dominantDirection;
    v8 = self->_prevMotionHistogramsAnalysis.relativeDominantDirection;
    v9 = v8 - relativeDominantDirection;
    if (v8 - relativeDominantDirection < 0)
      v9 = relativeDominantDirection - v8;
    if (!v2
      || (v6 & 1) != 0
      || (v7 - dominantDirection >= 0 ? (v10 = v7 - dominantDirection) : (v10 = dominantDirection - v7),
          (v11 = 1, v5 = v10 > 7, v12 = (1 << v10) & 0x83, !v5) ? (v13 = v12 == 0) : (v13 = 1),
          v13))
    {
      if (v2 && self->_motionHistogramsAnalysis.hasSpecialMotion > 0)
        goto LABEL_37;
      hasSpecialMotion = self->_prevMotionHistogramsAnalysis.hasSpecialMotion;
      if (hasSpecialMotion < 1)
        v6 = 1;
      if (v6 != 1)
      {
LABEL_37:
        v11 = 1;
      }
      else
      {
        v15 = self->_motionHistogramsAnalysis.hasSpecialMotion;
        v11 = hasSpecialMotion == v15 && v15 > 0;
      }
    }
    self->_hasCameraMotion = v11;
    if (v8 < 0)
    {
      v17 = 0;
      v23 = 0;
      p_hasDominantMovingLargeObjects = &self->_hasDominantMovingLargeObjects;
      self->_hasDominantMovingLargeObjects = 0;
      if (relativeDominantDirection < 0)
        goto LABEL_53;
    }
    else if (relativeDominantDirection < 0)
    {
      v17 = 0;
      p_hasDominantMovingLargeObjects = &self->_hasDominantMovingLargeObjects;
      self->_hasDominantMovingLargeObjects = 0;
    }
    else
    {
      v17 = v9 < 2;
      v18 = v9 > 7;
      if (v9 == 7)
        v17 = 1;
      v19 = (1 << v9) & 0x83;
      v21 = !v18 && v19 != 0 && (v7 | dominantDirection) >= 0;
      p_hasDominantMovingLargeObjects = &self->_hasDominantMovingLargeObjects;
      self->_hasDominantMovingLargeObjects = v21;
    }
    v23 = (v7 & dominantDirection) == -1;
LABEL_53:
    self->_hasDominantMovingSmallObjects = v23;
    hasStaticBackground = self->_prevMotionHistogramsAnalysis.hasStaticBackground;
    if (self->_prevMotionHistogramsAnalysis.hasStaticBackground)
      hasStaticBackground = self->_motionHistogramsAnalysis.hasStaticBackground;
    self->_hasStaticBackground = hasStaticBackground;
    jsonRandomnessAreaScale = 1.0;
    if (v17)
      jsonRandomnessAreaScale = self->jsonRandomnessAreaScale;
    self->randomnessAreaScale = jsonRandomnessAreaScale;
    hasCameraMotion = self->_hasCameraMotion;
    v27 = *p_hasDominantMovingLargeObjects;
    if (hasCameraMotion || v27)
    {
      self->consistencySafeThresholdsScale = -1.0;
      self->randomnessErrorChangeRatioThreshold = self->jsonRandomnessErrorChangeRatioThresholdForCameraMotion;
      v28 = 408;
    }
    else if (hasStaticBackground && self->_hasDominantMovingSmallObjects)
    {
      v27 = 0;
      self->consistencySafeThresholdsScale = 1.0;
      self->randomnessErrorChangeRatioThreshold = self->jsonRandomnessErrorChangeRatioThresholdForStatic;
      v28 = 416;
    }
    else
    {
      v27 = 0;
      self->consistencySafeThresholdsScale = 0.0;
      self->randomnessErrorChangeRatioThreshold = self->jsonRandomnessErrorChangeRatioThreshold;
      v28 = 400;
    }
    self->randomnessAreaChangeRatioThreshold = *(float *)((char *)&self->super.super.isa + v28);
    printf("[MotionHistograms] has_camera_motion: %d, has_dominant_moving_large_objects: %d, has_dominant_moving_small_objects: %d, has_static_background: %d\n", hasCameraMotion, v27, self->_hasDominantMovingSmallObjects, hasStaticBackground);
    return;
  }
  if (self->_isSmallDrops && (self->_motionHistogramsAnalysis.dominantDirection & 0x80000000) == 0)
    self->consistencySafeThresholdsScale = -1.0;
}

- (void)printSideHistograms
{
  $6B8A7B0A5904C8635CA0AE20EFD025D0 *p_motionHistograms;

  p_motionHistograms = &self->_motionHistograms;
  printf("[MotionHistograms] left side directions: [%d, %d, %d, %d], average_magnitude:%d\n", self->_motionHistograms.leftSideDirection[0], self->_motionHistograms.leftSideDirection[1], self->_motionHistograms.leftSideDirection[2], self->_motionHistograms.leftSideDirection[3], self->_motionHistograms.leftSideAverageMagnitude);
  printf("[MotionHistograms] right side directions: [%d, %d, %d, %d], average_magnitude:%d\n", p_motionHistograms->rightSideDirection[0], p_motionHistograms->rightSideDirection[1], p_motionHistograms->rightSideDirection[2], p_motionHistograms->rightSideDirection[3], p_motionHistograms->rightSideAverageMagnitude);
  printf("[MotionHistograms] top side directions: [%d, %d, %d, %d], average_magnitude:%d\n", p_motionHistograms->topSideDirection[0], p_motionHistograms->topSideDirection[1], p_motionHistograms->topSideDirection[2], p_motionHistograms->topSideDirection[3], p_motionHistograms->topSideAverageMagnitude);
  printf("[MotionHistograms] bottom side directions: [%d, %d, %d, %d], average_magnitude:%d\n", p_motionHistograms->bottomSideDirection[0], p_motionHistograms->bottomSideDirection[1], p_motionHistograms->bottomSideDirection[2], p_motionHistograms->bottomSideDirection[3], p_motionHistograms->bottomSideAverageMagnitude);
}

- (BOOL)detectCameraRotation
{
  unsigned int v3;
  unsigned int v4;
  unsigned int jsonSideMotionPixelCountThreshold;
  uint64_t v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  float jsonSideMotionDominanceThreshold;

  -[OpticalFlowAnalyzer printSideHistograms](self, "printSideHistograms");
  v3 = vaddvq_s32(*(int32x4_t *)self->_motionHistograms.leftSideDirection);
  v4 = vaddvq_s32(*(int32x4_t *)self->_motionHistograms.rightSideDirection);
  jsonSideMotionPixelCountThreshold = self->jsonSideMotionPixelCountThreshold;
  if (v3 < jsonSideMotionPixelCountThreshold || v4 < jsonSideMotionPixelCountThreshold)
    return 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = self->_motionHistograms.leftSideDirection[0];
  v11 = self->_motionHistograms.rightSideDirection[0];
  do
  {
    v12 = &self->_motionHistograms.frameMagnitude[v7++];
    if (v12[35] > v10)
    {
      v9 = v7;
      v10 = v12[35];
    }
    v13 = v12[39];
    if (v13 > v11)
    {
      v8 = v7;
      v11 = v13;
    }
  }
  while (v7 != 3);
  jsonSideMotionDominanceThreshold = self->jsonSideMotionDominanceThreshold;
  if ((float)((float)v10 / (float)v3) < jsonSideMotionDominanceThreshold
    || (float)((float)v11 / (float)v4) < jsonSideMotionDominanceThreshold)
  {
    return 0;
  }
  if (!v9 && v8 == 2)
    return 1;
  return v9 == 2 && v8 == 0;
}

- (BOOL)checkSafetyByScoreAndArea:(id *)a3
{
  float var3;
  float var5;
  BOOL v7;
  float v9;
  CMTime v13;
  CMTime time1;
  CMTime time2;

  var3 = a3->var3;
  var5 = a3->var5;
  CMTimeMake(&time2, 80, 600);
  time1 = (CMTime)a3->var0;
  if (CMTimeCompare(&time1, &time2) < 0 || !self->_hasDominantMovingLargeObjects)
  {
    CMTimeMake(&v13, 40, 600);
    time1 = (CMTime)a3->var0;
    if (CMTimeCompare(&time1, &v13))
      return 1;
    if (var3 <= 26.0 || var3 >= 30.0)
      return 1;
    v9 = 2.4;
  }
  else
  {
    v7 = var3 > 30.0 && var3 < 32.0;
    if (v7 && var5 > 1.1 && var5 < 1.7)
      return 0;
    if (var3 <= 26.5 || var3 >= 30.0)
      return 1;
    v9 = 1.9;
  }
  return var5 <= v9 || var5 >= 5.0;
}

- (BOOL)checkSafetyByStripConsistency:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  float var5;
  float *var28;
  float v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  BOOL v21;
  float *var30;
  unint64_t var29;
  float v24;
  unsigned int v25;
  uint64_t v26;
  float v27;
  float v28;

  var5 = a3->var5;
  var28 = a3->var28;
  v11 = *var28;
  v12 = a3->var27 - 1;
  if (v12 >= 2)
  {
    v13 = 2;
    v14 = 1;
    do
    {
      if (var28[v14] < v11)
        v11 = var28[v14];
      v14 = v13;
      v15 = v12 > v13++;
    }
    while (v15);
  }
  *(float *)&v4 = self->jsonConsistencyVerticalStripScoreThreshold;
  *(float *)&v6 = self->jsonConsistencyVerticalStripAreaPercentageThreshold;
  *(float *)&v3 = v11;
  *(float *)&v5 = a3->var5;
  -[OpticalFlowAnalyzer computeConsistencyConfidenceFromScore:scoreThreshold:areaRatio:areaRatioThreshold:](self, "computeConsistencyConfidenceFromScore:scoreThreshold:areaRatio:areaRatioThreshold:", v3, v4, v5, v6);
  v20 = *(float *)&v16;
  v21 = var5 <= self->jsonConsistencyVerticalStripAreaPercentageThreshold
     || v11 >= self->jsonConsistencyVerticalStripScoreThreshold;
  var29 = a3->var29;
  var30 = a3->var30;
  v24 = *var30;
  if (var29 >= 2)
  {
    v25 = 2;
    v26 = 1;
    do
    {
      if (var30[v26] < v24)
        v24 = var30[v26];
      v26 = v25;
      v15 = var29 > v25++;
    }
    while (v15);
  }
  *(float *)&v17 = self->jsonConsistencyHorizontalStripScoreThreshold;
  *(float *)&v19 = self->jsonConsistencyHorizontalStripAreaPercentageThreshold;
  *(float *)&v16 = v24;
  *(float *)&v18 = var5;
  -[OpticalFlowAnalyzer computeConsistencyConfidenceFromScore:scoreThreshold:areaRatio:areaRatioThreshold:](self, "computeConsistencyConfidenceFromScore:scoreThreshold:areaRatio:areaRatioThreshold:", v16, v17, v18, v19);
  if (var5 > self->jsonConsistencyHorizontalStripAreaPercentageThreshold
    && v24 < self->jsonConsistencyHorizontalStripScoreThreshold)
  {
    v21 = 0;
  }
  v28 = fmin(fminf(v20, v27), 1.0);
  if (v28 < 1.0)
    NSLog(CFSTR("[FlowAnalysis] consistency gating confidence: %.3f (stripe)"), v28);
  self->_confidenceScore = fminf(v28, self->_confidenceScore);
  return v21;
}

- (BOOL)checkSafetyByBlockConsistency:(id *)a3
{
  float var10;
  float var9;
  CMTime v8;
  CMTime time1;
  CMTime time2;

  if (!self->_hasCameraMotion
    || !self->_hasDominantMovingLargeObjects
    || self->_hasDominantMovingSmallObjects
    || self->_hasStaticBackground)
  {
    return 1;
  }
  var9 = a3->var9;
  var10 = a3->var10;
  CMTimeMake(&time2, 80, 600);
  time1 = (CMTime)a3->var0;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    CMTimeMake(&v8, 40, 600);
    time1 = (CMTime)a3->var0;
    if (CMTimeCompare(&time1, &v8) || var9 <= 1.5 || var9 >= 2.6 || var10 <= 0.4)
      return 1;
  }
  else
  {
    if (var9 <= 1.6)
      return 1;
    if (var9 >= 2.6 || var10 <= 0.5)
      return 1;
  }
  return var10 >= 1.2;
}

- (void)updateGatingStats
{
  __int128 v3;

  v3 = *(_OWORD *)&self->_motionHistogramsAnalysis.hasSpecialMotion;
  *(_OWORD *)&self->_prevMotionHistogramsAnalysis.hasStaticBackground = *(_OWORD *)&self->_motionHistogramsAnalysis.hasStaticBackground;
  *(_OWORD *)&self->_prevMotionHistogramsAnalysis.hasSpecialMotion = v3;
  self->consistencySafeThresholdsScaleForLargeRandomnessErr = 0.0;
  if (self->_visualizationEnabled)
  {
    free(self->_deformationBinaryMap);
    free(self->_consistencyMap);
    free(self->_backwarpLossMap);
  }
  free(self->_deformationBlockRanges);
  if (self->_shouldRunBackwarpGating)
    free(self->_backwarpBlockRanges);
}

- (void)isSafeToInterpolateForBackwarpGatingWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 flowResFirst:(__CVBuffer *)a5 flowResSecond:(__CVBuffer *)a6
{
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;
  float v34;
  float v35;
  BOOL v36;
  float v37;
  float v38;
  float v39;
  float v40;

  if (self->_shouldRunBackwarpGating)
  {
    v11 = (void *)MEMORY[0x1D825AFCC]();
    -[OpticalFlowAnalyzer analyzeBackwarpForward:backward:flowResFirst:flowResSecond:](self, "analyzeBackwarpForward:backward:flowResFirst:flowResSecond:", a3, a4, a5, a6);
    objc_autoreleasePoolPop(v11);
    v18 = v37 == v38 ? 100.0 : v38;
    if (self->_useCase == 1)
    {
      *(float *)&v13 = self->jsonBackwarpFrameScoreThreshold;
      *(float *)&v14 = self->jsonBackwarpScoreHighThreshold;
      *(float *)&v16 = self->jsonBackwarpAreaPercentageThreshold;
      *(float *)&v17 = self->jsonBackwarpAreaPercentageHighThreshold;
      *(float *)&v12 = v37;
      *(float *)&v15 = v39;
      -[OpticalFlowAnalyzer computeBackwarpConfidenceFromScore:scoreThreshold:scoreHighThreshold:areaRatio:areaRatioThreshold:areaRatioHighThreshold:large_area:](self, "computeBackwarpConfidenceFromScore:scoreThreshold:scoreHighThreshold:areaRatio:areaRatioThreshold:areaRatioHighThreshold:large_area:", v40 >= self->jsonBackwarpAreaThreshold, v12, v13, v14, v15, v16, v17);
      v20 = v19;
      *(float *)&v21 = self->jsonBackwarpFrameScoreThresholdOnDemand;
      *(float *)&v22 = self->jsonBackwarpScoreHighThreshold;
      *(float *)&v23 = self->jsonBackwarpAreaPercentageThresholdOnDemand;
      *(float *)&v24 = self->jsonBackwarpAreaPercentageHighThreshold;
      *(float *)&v25 = v37;
      *(float *)&v26 = v39;
      -[OpticalFlowAnalyzer computeBackwarpConfidenceFromScore:scoreThreshold:scoreHighThreshold:areaRatio:areaRatioThreshold:areaRatioHighThreshold:large_area:](self, "computeBackwarpConfidenceFromScore:scoreThreshold:scoreHighThreshold:areaRatio:areaRatioThreshold:areaRatioHighThreshold:large_area:", v40 >= self->jsonBackwarpAreaThreshold, v25, v21, v22, v26, v23, v24);
      v32 = *(float *)&v33;
      LODWORD(v33) = 1.0;
      if (v37 != v38)
      {
        *(float *)&v27 = self->jsonBackwarpROIScoreThreshold;
        *(float *)&v28 = self->jsonBackwarpScoreHighThreshold;
        *(float *)&v30 = self->jsonBackwarpAreaPercentageThreshold;
        *(float *)&v31 = self->jsonBackwarpAreaPercentageHighThreshold;
        *(float *)&v33 = v38;
        *(float *)&v29 = v39;
        -[OpticalFlowAnalyzer computeBackwarpConfidenceFromScore:scoreThreshold:scoreHighThreshold:areaRatio:areaRatioThreshold:areaRatioHighThreshold:large_area:](self, "computeBackwarpConfidenceFromScore:scoreThreshold:scoreHighThreshold:areaRatio:areaRatioThreshold:areaRatioHighThreshold:large_area:", v40 >= self->jsonBackwarpAreaThreshold, v33, v27, v28, v29, v30, v31);
      }
      v34 = fmin(fminf(v20, *(float *)&v33), 1.0);
      if (v34 < 1.0)
        NSLog(CFSTR("[AutobahnFlowAnalysis] backwarp gating confidence: %.3f in recommendation"), v34);
      self->_confidenceScore = fminf(v34, self->_confidenceScore);
      v35 = fmin(v32, 1.0);
      if (v35 < 1.0)
        NSLog(CFSTR("[AutobahnFlowAnalysis] backwarp gating confidence: %.3f in on-demand"), v35);
      self->_confidenceScoreOnDemand = fminf(v35, self->_confidenceScoreOnDemand);
      if (v39 > self->jsonBackwarpAreaPercentageThreshold
        && (v37 < self->jsonBackwarpFrameScoreThreshold || v18 < self->jsonBackwarpROIScoreThreshold))
      {
        self->_safeToInterpolate.backwarp = 0;
        if (v39 <= self->jsonBackwarpAreaPercentageThresholdOnDemand
          || v37 >= self->jsonBackwarpFrameScoreThresholdOnDemand)
        {
          if (v39 <= self->jsonBackwarpAreaPercentageHighThreshold || v37 >= self->jsonBackwarpScoreHighThreshold)
          {
LABEL_24:
            NSLog(CFSTR("[AutobahnFlowAnalysis] Interpolation is gated (backwarp) for recommendation only"));
            return;
          }
          v36 = v40 < self->jsonBackwarpAreaThreshold;
        }
        else
        {
          v36 = 0;
        }
        if (self->_framesToInterpolate >= 4 && !v36)
        {
          self->_isSafeToInterpolateForInteractiveMode = 0;
          NSLog(CFSTR("[AutobahnFlowAnalysis] Interpolation is gated (backwarp) for both"));
          return;
        }
        goto LABEL_24;
      }
    }
  }
}

- (float)computeBackwarpConfidenceFromScore:(float)a3 scoreThreshold:(float)a4 scoreHighThreshold:(float)a5 areaRatio:(float)a6 areaRatioThreshold:(float)a7 areaRatioHighThreshold:(float)a8 large_area:(BOOL)a9
{
  float v11;
  float v13;

  if (a6 >= a7)
  {
    v11 = 1.0;
    if (a6 >= a8 && a9)
      v11 = (exp(((float)(a6 - a8) * 0.1 + 1.0) * (float)((float)(a4 / fmaxf(a3, a5)) + -1.0)) + 1.0) * 0.5;
  }
  else
  {
    v11 = expf((float)(1.0 - (float)(a6 / a7)) * 15.0);
  }
  v13 = 4.0;
  if (a3 >= a4)
    v13 = 1.0;
  return v11 * 1.5 / (float)(expf((float)((float)(a4 / a3) + -1.0) * v13) + 1.0);
}

- ($599F175E452E455E49EC8439362DB023)analyzeBackwarpForward:(SEL)a3 backward:(__CVBuffer *)a4 flowResFirst:(__CVBuffer *)a5 flowResSecond:(__CVBuffer *)a6
{
  size_t Width;
  size_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  $599F175E452E455E49EC8439362DB023 *result;
  Backwarp *v25;

  Width = CVPixelBufferGetWidth(a4);
  v14 = CVPixelBufferGetHeight(a4) >> 1;
  createTexturesFromCVPixelBuffer(a4, self->super._device, 1, 2uLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a5, self->super._device, 1, 2uLL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a6, self->super._device, 1, 3uLL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a7, self->super._device, 1, 3uLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  createTextures(self->super._device, Width, v14, 1, 1uLL);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  createTextures(self->super._device, Width, v14, 1, 1uLL);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[Backwarp initWithDevice:interleaved:]([Backwarp alloc], "initWithDevice:interleaved:", self->super._device, 0);
  LODWORD(v21) = 1.0;
  -[Backwarp calcBackwarpLoss:second:flow:timeScale:destination:](v25, "calcBackwarpLoss:second:flow:timeScale:destination:", v17, v18, v15, v19, v21);
  LODWORD(v22) = 1.0;
  -[Backwarp calcBackwarpLoss:second:flow:timeScale:destination:](v25, "calcBackwarpLoss:second:flow:timeScale:destination:", v18, v17, v16, v20, v22);
  -[NSArray arrayByAddingObjectsFromArray:](self->_firstFaceHandLegRectangles, "arrayByAddingObjectsFromArray:", self->_secondFaceHandLegRectangles);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&retstr->var0 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var4 = 0.0;
  -[OpticalFlowAnalyzer calcBackwarpStatisticsForwardLossTexture:backwardLossTexture:faceHandLegRectangles:](self, "calcBackwarpStatisticsForwardLossTexture:backwardLossTexture:faceHandLegRectangles:", v19, v20, v23);
  printf("[FlowAnalysis] Backwarp Loss Error: %.3f, Score: %.3f, ROI_Score: %.3f, Area_Ratio: %.3f, Area: %.3f\n", retstr->var0, retstr->var1, retstr->var2, retstr->var3, retstr->var4);

  return result;
}

- ($599F175E452E455E49EC8439362DB023)calcBackwarpStatisticsForwardLossTexture:(SEL)a3 backwardLossTexture:(id)a4 faceHandLegRectangles:(id)a5
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  $599F175E452E455E49EC8439362DB023 *result;
  int64x2_t v22;
  uint64_t v23;
  _QWORD v24[3];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (unint64_t)(objc_msgSend(v12, "width") + 7) >> 3;
  v14 = (unint64_t)(objc_msgSend(v12, "height") + 7) >> 3;
  v15 = (void *)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 4 * v13 * v14, 0);
  -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setComputePipelineState:", self->_backwarpStatisticsKernel);
  objc_msgSend(v17, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v17, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v17, "setBuffer:offset:atIndex:", v15, 0, 0);
  v24[0] = v13;
  v24[1] = v14;
  v24[2] = 1;
  v22 = vdupq_n_s64(8uLL);
  v23 = 1;
  objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", v24, &v22);
  objc_msgSend(v17, "endEncoding");
  objc_msgSend(v16, "commit");
  objc_msgSend(v16, "waitUntilCompleted");
  v18 = objc_retainAutorelease(v15);
  v19 = objc_msgSend(v18, "contents");
  if (v10)
  {
    -[OpticalFlowAnalyzer findFaceHandLegBlocksFromRectangles:blockWidth:blockHeight:](self, "findFaceHandLegBlocksFromRectangles:blockWidth:blockHeight:", v10, v13, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  *(_QWORD *)&retstr->var0 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var4 = 0.0;
  -[OpticalFlowAnalyzer processBackwarpStats:blockWidth:blockHeight:faceHandLegBoundingBoxBlocks:](self, "processBackwarpStats:blockWidth:blockHeight:faceHandLegBoundingBoxBlocks:", v19, v13, v14, v20);

  return result;
}

- ($599F175E452E455E49EC8439362DB023)processBackwarpStats:(SEL)a3 blockWidth:(id *)a4 blockHeight:(unint64_t)a5 faceHandLegBoundingBoxBlocks:(unint64_t)a6
{
  size_t v10;
  float *v11;
  int *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  CGRect *p_cleanRectFlow8x8;
  double v22;
  float var0;
  int *backwarpBlockRanges;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  _BOOL4 v31;
  float v32;
  int *v33;
  int v34;
  int v35;
  int v36;
  float v37;
  int v38;
  int v39;
  float *v40;
  float v41;
  float v42;
  uint64_t i;
  float v44;
  void *v45;
  void *v46;
  float v47;
  void *v48;
  uint64_t v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  $599F175E452E455E49EC8439362DB023 *result;
  float v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  OpticalFlowAnalyzer *v62;
  uint64_t v63;
  uint64_t v65;
  float v66;
  id v67;
  CGPoint v68;
  CGPoint v69;
  CGRect v70;

  v67 = a7;
  v10 = objc_msgSend(v67, "count");
  v11 = (float *)malloc_type_calloc(v10, 4uLL, 0x100004052888210uLL);
  v12 = (int *)malloc_type_calloc(4uLL, 4uLL, 0x100004052888210uLL);
  self->_backwarpBlockRanges = v12;
  *v12 = a5;
  v12[1] = -1;
  v12[2] = a6;
  v12[3] = -1;
  v13 = 0x1EFE38000uLL;
  if (self->_visualizationEnabled)
    self->_backwarpLossMap = (char *)malloc_type_calloc(a6 * a5, 1uLL, 0x100004077774924uLL);
  v58 = 0.0;
  if (a6)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v59 = (int)a5;
    v60 = a6;
    v17 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    v61 = a5;
    v62 = self;
    do
    {
      if (a5)
      {
        v20 = 0;
        p_cleanRectFlow8x8 = &self->_cleanRectFlow8x8;
        v22 = (double)(int)v14;
        v65 = v14 * v59;
        v63 = v14;
        do
        {
          v68.x = (double)(int)v20;
          v68.y = v22;
          if (CGRectContainsPoint(*p_cleanRectFlow8x8, v68))
          {
            var0 = a4[v20 + v65].var0;
            if (self->_visualizationEnabled)
              (*(_BYTE **)((char *)&self->super.super.isa + *(int *)(v13 + 4072)))[v20 + v65] = (int)var0;
            if (var0 > 32.0)
            {
              backwarpBlockRanges = self->_backwarpBlockRanges;
              if (v20 < *backwarpBlockRanges)
                *backwarpBlockRanges = v20;
              if (v20 > backwarpBlockRanges[1])
                backwarpBlockRanges[1] = v20;
              if (v14 < backwarpBlockRanges[2])
                backwarpBlockRanges[2] = v14;
              v18 = v18 + 1.0;
              if (v14 > backwarpBlockRanges[3])
                backwarpBlockRanges[3] = v14;
            }
            v25 = v67;
            if (v10)
            {
              v26 = v16;
              v27 = v15;
              v28 = 0;
              v29 = 0;
              do
              {
                objc_msgSend(v25, "objectAtIndexedSubscript:", v28);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "rect");
                v69.x = (double)(int)v20;
                v69.y = v22;
                v31 = CGRectContainsPoint(v70, v69);

                if (v31)
                {
                  v11[v28] = var0 + v11[v28];
                  v29 = 1;
                }
                ++v28;
                v25 = v67;
              }
              while (v10 != v28);
              v16 = v26 + ((v29 & 1) == 0);
              if ((v29 & 1) != 0)
                v32 = -0.0;
              else
                v32 = var0;
              v15 = v27;
              a5 = v61;
              self = v62;
              v13 = 0x1EFE38000;
              v14 = v63;
            }
            else
            {
              ++v16;
              v32 = var0;
            }
            ++v15;
            v17 = v17 + var0;
            v19 = v19 + v32;
          }
          ++v20;
        }
        while (v20 != a5);
      }
      ++v14;
    }
    while (v14 != v60);
  }
  else
  {
    v16 = 0;
    v15 = 0;
    v19 = 0.0;
    v18 = 0.0;
    v17 = 0.0;
  }
  v33 = self->_backwarpBlockRanges;
  v34 = *v33;
  v35 = v33[1];
  v36 = v35 - *v33;
  if (v35 >= *v33)
  {
    v38 = v33[2];
    v39 = v33[3];
    v37 = 0.0;
    if (v39 >= v38)
    {
      v58 = (float)(v36 + 1 + (v36 + 1) * (v39 - v38));
      v37 = (float)(v18 * 100.0) / v58;
      printf("[FlowAnalysis] Backwarp ranges (%d, %d, %d, %d)\n", v34, v35, v38, v39);
    }
  }
  else
  {
    v37 = 0.0;
  }
  v66 = v37;
  v40 = (float *)malloc_type_calloc(v10, 4uLL, 0x100004052888210uLL);
  v41 = 0.0;
  v42 = 0.0;
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      v44 = v11[i];
      objc_msgSend(v67, "objectAtIndexedSubscript:", i);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v40[i] = v44 / (float)(int)(objc_msgSend(v45, "numberOfBlocks") << 6);

      objc_msgSend(v67, "objectAtIndexedSubscript:", i);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (float)(unint64_t)objc_msgSend(v46, "numberOfBlocks") / (float)v15;

      objc_msgSend(v67, "objectAtIndexedSubscript:", i);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "category");

      v50 = 64.0;
      if (v49 == 2)
        v50 = 128.0;
      v51 = fmin((float)(v47 * v50), 1.0);
      if ((float)(v40[i] * v51) > v41)
      {
        v41 = v40[i] * v51;
        v42 = v51;
      }
    }
  }
  if (v16)
    v52 = v19 / (float)(unint64_t)(v16 << 6);
  else
    v52 = 0.0;
  v53 = v17 / (float)(v15 << 6);
  v54 = log10(100.0 / v53) * 10.0;
  v55 = log10(100.0 / (float)(v41 + (float)((float)(1.0 - v42) * v52))) * 10.0;
  retstr->var0 = v53;
  retstr->var1 = v54;
  retstr->var2 = v55;
  retstr->var3 = v66;
  retstr->var4 = v58;
  free(v40);
  free(v11);

  return result;
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (BOOL)inputScaling
{
  return self->_inputScaling;
}

- (void)setInputScaling:(BOOL)a3
{
  self->_inputScaling = a3;
}

- (BOOL)opticalFlowDownsampling
{
  return self->_opticalFlowDownsampling;
}

- (void)setOpticalFlowDownsampling:(BOOL)a3
{
  self->_opticalFlowDownsampling = a3;
}

- (int64_t)inputRotation
{
  return self->_inputRotation;
}

- (void)setInputRotation:(int64_t)a3
{
  self->_inputRotation = a3;
}

- (unint64_t)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unint64_t)a3
{
  self->_useCase = a3;
}

- (BOOL)isSmallDrops
{
  return self->_isSmallDrops;
}

- (void)setIsSmallDrops:(BOOL)a3
{
  self->_isSmallDrops = a3;
}

- (BOOL)isContinuousDrops
{
  return self->_isContinuousDrops;
}

- (void)setIsContinuousDrops:(BOOL)a3
{
  self->_isContinuousDrops = a3;
}

- (BOOL)shouldRunFlowAnalysis
{
  return self->_shouldRunFlowAnalysis;
}

- (void)setShouldRunFlowAnalysis:(BOOL)a3
{
  self->_shouldRunFlowAnalysis = a3;
}

- (BOOL)shouldRunCrossFlowAnalysis
{
  return self->_shouldRunCrossFlowAnalysis;
}

- (void)setShouldRunCrossFlowAnalysis:(BOOL)a3
{
  self->_shouldRunCrossFlowAnalysis = a3;
}

- (BOOL)shouldRunDetection
{
  return self->_shouldRunDetection;
}

- (void)setShouldRunDetection:(BOOL)a3
{
  self->_shouldRunDetection = a3;
}

- (BOOL)shouldRunBackwarpGating
{
  return self->_shouldRunBackwarpGating;
}

- (void)setShouldRunBackwarpGating:(BOOL)a3
{
  self->_shouldRunBackwarpGating = a3;
}

- (unsigned)timesDidRunDetection
{
  return self->_timesDidRunDetection;
}

- (void)setTimesDidRunDetection:(unsigned __int8)a3
{
  self->_timesDidRunDetection = a3;
}

- (FRCScaler)scaler
{
  return (FRCScaler *)objc_loadWeakRetained((id *)&self->_scaler);
}

- (void)setScaler:(id)a3
{
  objc_storeWeak((id *)&self->_scaler, a3);
}

- (BOOL)isSafeToInterpolateForInteractiveMode
{
  return self->_isSafeToInterpolateForInteractiveMode;
}

- (BOOL)handDetectionEnabled
{
  return self->_handDetectionEnabled;
}

- (void)setHandDetectionEnabled:(BOOL)a3
{
  self->_handDetectionEnabled = a3;
}

- (BOOL)bodyDetectionEnabled
{
  return self->_bodyDetectionEnabled;
}

- (void)setBodyDetectionEnabled:(BOOL)a3
{
  self->_bodyDetectionEnabled = a3;
}

- (BOOL)humanDetectionEnabled
{
  return self->_humanDetectionEnabled;
}

- (void)setHumanDetectionEnabled:(BOOL)a3
{
  self->_humanDetectionEnabled = a3;
}

- (BOOL)animalFaceDetectionEnabled
{
  return self->_animalFaceDetectionEnabled;
}

- (void)setAnimalFaceDetectionEnabled:(BOOL)a3
{
  self->_animalFaceDetectionEnabled = a3;
}

- (int64_t)retimingRecipe
{
  return self->_retimingRecipe;
}

- (void)setRetimingRecipe:(int64_t)a3
{
  self->_retimingRecipe = a3;
}

- (float)flowConsistencyFrameScore
{
  return self->_flowConsistencyFrameScore;
}

- (float)flowConsistencyROIScore
{
  return self->_flowConsistencyROIScore;
}

- (float)confidenceScore
{
  return self->_confidenceScore;
}

- (float)confidenceScoreOnDemand
{
  return self->_confidenceScoreOnDemand;
}

- (char)deformationBinaryMap
{
  return self->_deformationBinaryMap;
}

- (void)setDeformationBinaryMap:(char *)a3
{
  self->_deformationBinaryMap = a3;
}

- (int)deformationBlockRanges
{
  return self->_deformationBlockRanges;
}

- (void)setDeformationBlockRanges:(int *)a3
{
  self->_deformationBlockRanges = a3;
}

- (char)consistencyMap
{
  return self->_consistencyMap;
}

- (void)setConsistencyMap:(char *)a3
{
  self->_consistencyMap = a3;
}

- (char)backwarpLossMap
{
  return self->_backwarpLossMap;
}

- (void)setBackwarpLossMap:(char *)a3
{
  self->_backwarpLossMap = a3;
}

- (int)backwarpBlockRanges
{
  return self->_backwarpBlockRanges;
}

- (void)setBackwarpBlockRanges:(int *)a3
{
  self->_backwarpBlockRanges = a3;
}

- (BOOL)visualizationEnabled
{
  return self->_visualizationEnabled;
}

- (void)setVisualizationEnabled:(BOOL)a3
{
  self->_visualizationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scaler);
  objc_storeStrong((id *)&self->_secondFaceHandLegRectangles, 0);
  objc_storeStrong((id *)&self->_firstFaceHandLegRectangles, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_backwarpStatisticsKernel, 0);
  objc_storeStrong((id *)&self->_motionHistogramsKernel, 0);
  objc_storeStrong((id *)&self->_crossFlowStatisticsKernel, 0);
  objc_storeStrong((id *)&self->_flowStatisticsKernel, 0);
}

@end

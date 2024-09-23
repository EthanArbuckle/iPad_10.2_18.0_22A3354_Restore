@implementation ABPKPoseEstimationPipeline

- (ABPKPoseEstimationPipeline)init
{
  ABPKPoseEstimationPipeline *v2;
  ABPKPoseEstimationPipeline *v3;
  ABPK2DDetectionConfiguration *v4;
  ABPK2DDetectionConfiguration *config2D;
  ABPKPoseEstimationPipeline *v6;
  NSObject *v7;
  const char *v8;
  __int16 v10[8];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ABPKPoseEstimationPipeline;
  v2 = -[ABPKPoseEstimationPipeline init](&v11, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_11;
  v2->_exitPoint = 7;
  v4 = -[ABPK2DDetectionConfiguration initWithAlgorithmMode:]([ABPK2DDetectionConfiguration alloc], "initWithAlgorithmMode:", 1);
  config2D = v3->_config2D;
  v3->_config2D = v4;

  if (!v3->_config2D)
  {
    __ABPKLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 0;
      v8 = " Failed to initialize config for 2D Detection module ";
LABEL_9:
      _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v10, 2u);
    }
LABEL_10:

LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  v3->_deviceANEVersionPriorOrEqualToH12 = determineDeviceANEVersionPriorOrEqualToH12();
  v3->_useLSTM3D = 1;
  if (!-[ABPKPoseEstimationPipeline initAlgorithmModules](v3, "initAlgorithmModules"))
  {
    __ABPKLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 0;
      v8 = " Failed to initialize algorithm modules ";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  -[ABPKPoseEstimationPipeline initializeOutput](v3, "initializeOutput");
  v3->_previousValidScale = -1.0;
  v3->_consistent2DSkeletonMissing = 0;
  v6 = v3;
LABEL_12:

  return v6;
}

- (BOOL)initAlgorithmModules
{
  ABPK2DPoseEstimation *v3;
  ABPK2DPoseEstimation *poseEstimation2D;
  ABPK3DLifting *v5;
  ABPK3DLifting *liftingAlgorithm;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  ABPK3DLiftingLSTM *v10;
  ABPK3DLiftingLSTM *liftingAlgorithmLSTM;
  ABPK3DLiftingSequence *v12;
  ABPK3DLiftingSequence *liftingAlgorithmSequence;
  ABPKCameraRegistration *v14;
  ABPKCameraRegistration *bodyRegistration;
  ABPKDepthBasedScaleEstimation *v16;
  ABPKDepthBasedScaleEstimation *scaleEstimation;
  ABPKRetargeting *v18;
  ABPKRetargeting *retargeting;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  uint8_t buf[2];
  __int16 v25;
  __int16 v26;
  __int16 v27;

  -[ABPKPoseEstimationPipeline _startInitABPKSignpost](self, "_startInitABPKSignpost");
  v3 = -[ABPK2DPoseEstimation initWith2DDetectionConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:]([ABPK2DPoseEstimation alloc], "initWith2DDetectionConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:", self->_config2D, 0, 0);
  poseEstimation2D = self->_poseEstimation2D;
  self->_poseEstimation2D = v3;

  if (self->_poseEstimation2D)
  {
    if (self->_deviceANEVersionPriorOrEqualToH12)
    {
      v5 = objc_alloc_init(ABPK3DLifting);
      liftingAlgorithm = self->_liftingAlgorithm;
      self->_liftingAlgorithm = v5;

      if (!self->_liftingAlgorithm)
      {
        __ABPKLogSharedInstance();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v26 = 0;
          v8 = " Failed to initialize the 3D lifting algorithm. ";
          v9 = (uint8_t *)&v26;
LABEL_25:
          _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
    }
    else if (self->_useLSTM3D)
    {
      v10 = objc_alloc_init(ABPK3DLiftingLSTM);
      liftingAlgorithmLSTM = self->_liftingAlgorithmLSTM;
      self->_liftingAlgorithmLSTM = v10;

      if (!self->_liftingAlgorithmLSTM)
      {
        __ABPKLogSharedInstance();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v25 = 0;
          v8 = " Failed to initialize the new 3D lifting LSTM algorithm. ";
          v9 = (uint8_t *)&v25;
          goto LABEL_25;
        }
        goto LABEL_26;
      }
    }
    else
    {
      v12 = objc_alloc_init(ABPK3DLiftingSequence);
      liftingAlgorithmSequence = self->_liftingAlgorithmSequence;
      self->_liftingAlgorithmSequence = v12;

      if (!self->_liftingAlgorithmSequence)
      {
        __ABPKLogSharedInstance();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v8 = " Failed to initialize the new 3D lifting sequence algorithm. ";
          v9 = buf;
          goto LABEL_25;
        }
        goto LABEL_26;
      }
    }
    v14 = objc_alloc_init(ABPKCameraRegistration);
    bodyRegistration = self->_bodyRegistration;
    self->_bodyRegistration = v14;

    if (self->_bodyRegistration)
    {
      v16 = objc_alloc_init(ABPKDepthBasedScaleEstimation);
      scaleEstimation = self->_scaleEstimation;
      self->_scaleEstimation = v16;

      if (self->_scaleEstimation)
      {
        v18 = objc_alloc_init(ABPKRetargeting);
        retargeting = self->_retargeting;
        self->_retargeting = v18;

        if (self->_retargeting)
        {
          -[ABPKPoseEstimationPipeline _endInitABPKSignpost](self, "_endInitABPKSignpost");
          return 1;
        }
        __ABPKLogSharedInstance();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v21 = 0;
          v8 = " Failed to initialize the retargeting module. ";
          v9 = (uint8_t *)&v21;
          goto LABEL_25;
        }
      }
      else
      {
        __ABPKLogSharedInstance();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v22 = 0;
          v8 = " Failed to initialize the Depth-based scale estimation module. ";
          v9 = (uint8_t *)&v22;
          goto LABEL_25;
        }
      }
    }
    else
    {
      __ABPKLogSharedInstance();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v23 = 0;
        v8 = " Failed to initialize the Body-Camera registration module. ";
        v9 = (uint8_t *)&v23;
        goto LABEL_25;
      }
    }
    goto LABEL_26;
  }
  __ABPKLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v27 = 0;
    v8 = " Failed to initialize 2D Pose Estimation Algorithm. ";
    v9 = (uint8_t *)&v27;
    goto LABEL_25;
  }
LABEL_26:

  return 0;
}

- (void)initializeOutput
{
  ABPK2dSkeleton *v3;
  ABPK2dSkeleton *rawDetection2dSkeleton;
  ABPK2dSkeleton *v5;
  ABPK2dSkeleton *detection2dSkeleton;
  NSMutableArray *v7;
  NSMutableArray *rawDetection2dSkeletonArray;
  ABPKSkeleton *v9;
  ABPKSkeleton *liftingSkeleton;
  ABPK2dSkeleton *v11;
  ABPK2dSkeleton *registered2dSkeleton;
  ABPKSkeleton *v13;
  ABPKSkeleton *retargetedSkeleton;

  -[ABPKPoseEstimationPipeline _startInitABPKOutputSignpost](self, "_startInitABPKOutputSignpost");
  v3 = -[ABPK2dSkeleton initWithType:]([ABPK2dSkeleton alloc], "initWithType:", 0);
  rawDetection2dSkeleton = self->_rawDetection2dSkeleton;
  self->_rawDetection2dSkeleton = v3;

  v5 = -[ABPK2dSkeleton initWithType:]([ABPK2dSkeleton alloc], "initWithType:", 0);
  detection2dSkeleton = self->_detection2dSkeleton;
  self->_detection2dSkeleton = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  rawDetection2dSkeletonArray = self->_rawDetection2dSkeletonArray;
  self->_rawDetection2dSkeletonArray = v7;

  v9 = -[ABPKSkeleton initWithType:]([ABPKSkeleton alloc], "initWithType:", 3);
  liftingSkeleton = self->_liftingSkeleton;
  self->_liftingSkeleton = v9;

  v11 = -[ABPK2dSkeleton initWithType:]([ABPK2dSkeleton alloc], "initWithType:", 2);
  registered2dSkeleton = self->_registered2dSkeleton;
  self->_registered2dSkeleton = v11;

  v13 = -[ABPKSkeleton initWithType:]([ABPKSkeleton alloc], "initWithType:", 4);
  retargetedSkeleton = self->_retargetedSkeleton;
  self->_retargetedSkeleton = v13;

  -[ABPKPoseEstimationPipeline _endInitABPKOutputSignpost](self, "_endInitABPKOutputSignpost");
}

- (void)dealloc
{
  __CVBuffer *mlImage;
  objc_super v4;

  mlImage = self->_mlImage;
  if (mlImage)
    CVPixelBufferRelease(mlImage);
  v4.receiver = self;
  v4.super_class = (Class)ABPKPoseEstimationPipeline;
  -[ABPKPoseEstimationPipeline dealloc](&v4, sel_dealloc);
}

- (void)setExitPoint:(int64_t)a3
{
  self->_exitPoint = a3;
}

- (void)runABPKAlgorithmWithInputData:(id)a3 andGetOutput:(id)a4
{
  id v6;
  double v7;
  ABPKAlgorithmState *v8;
  void *v9;
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
  double v20;
  double v21;
  double v22;
  id v23;

  v23 = a3;
  v6 = a4;
  -[ABPKPoseEstimationPipeline _startExecuteAlgorithmSignpost](self, "_startExecuteAlgorithmSignpost");
  +[ABPKTime nowInSeconds](ABPKTime, "nowInSeconds");
  *(float *)&v7 = v7;
  objc_msgSend(v6, "setTimeABPKAlgorithmStart:", v7);
  v8 = objc_alloc_init(ABPKAlgorithmState);
  objc_msgSend(v6, "setAlgState:", v8);

  objc_msgSend(v23, "timestamp");
  objc_msgSend(v6, "setTimestamp:");
  objc_msgSend(v6, "setAlgorithmReturnCode:", -[ABPKPoseEstimationPipeline runABPKPoseEstimationWithInputData:andGetOutput:](self, "runABPKPoseEstimationWithInputData:andGetOutput:", v23, v6));
  objc_msgSend(v6, "setRawDetection2dSkeletonABPK:", self->_rawDetection2dSkeleton);
  objc_msgSend(v6, "setRawDetection2dSkeletonABPKArray:", self->_rawDetection2dSkeletonArray);
  objc_msgSend(v6, "setDetection2dSkeletonABPK:", self->_detection2dSkeleton);
  objc_msgSend(v6, "setLiftingSkeletonABPK:", self->_liftingSkeleton);
  objc_msgSend(v6, "setRegistered2dSkeletonABPK:", self->_registered2dSkeleton);
  objc_msgSend(v6, "setRetargetedSkeletonABPK:", self->_retargetedSkeleton);
  objc_msgSend(v23, "cameraParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extrinsics");
  v21 = v11;
  v22 = v10;
  v19 = v13;
  v20 = v12;
  objc_msgSend(v23, "vioPose");
  -[ABPKPoseEstimationPipeline computeRootTransforms:withCameraExtrinsics:withVioPose:withVioPoseValidity:](self, "computeRootTransforms:withCameraExtrinsics:withVioPose:withVioPoseValidity:", v6, objc_msgSend(v23, "isVioPoseValid"), v22, v21, v20, v19, v14, v15, v16, v17);

  +[ABPKTime nowInSeconds](ABPKTime, "nowInSeconds");
  *(float *)&v18 = v18;
  objc_msgSend(v6, "setTimeABPKAlgorithmFinished:", v18);
  -[ABPKPoseEstimationPipeline _endExecuteAlgorithmSignpost](self, "_endExecuteAlgorithmSignpost");

}

- (int)runABPKPoseEstimationWithInputData:(id)a3 andGetOutput:(id)a4
{
  id v6;
  id v7;
  size_t Width;
  size_t Height;
  NSObject *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  ABPKImagePreProcessingParams *v24;
  ABPKImagePreProcessing *v25;
  ABPKImagePreProcessing *imagePreprocessor;
  NSObject *v27;
  NSObject *v28;
  int v29;
  int v30;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  ABPKMLImageData *v35;
  __CVBuffer *mlImage;
  NSObject *v37;
  void *v38;
  ABPK2dSkeleton *v39;
  NSObject *v40;
  NSObject *v41;
  ABPK2D3DLiftingData *v42;
  uint64_t v43;
  void *v44;
  ABPK2DDetectionResult *v45;
  uint64_t v46;
  const unsigned int *v47;
  void *v48;
  NSObject *v49;
  ABPK3DLifting *liftingAlgorithm;
  NSObject *v51;
  ABPK2D3DLiftingData *v52;
  uint64_t v53;
  void *v54;
  ABPK2DDetectionResult *v55;
  uint64_t v56;
  const unsigned int *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  ABPK3DLiftingLSTM *liftingAlgorithmLSTM;
  double v62;
  NSObject *v63;
  const char *v64;
  NSObject *v65;
  ABPK3DLiftingSequence *liftingAlgorithmSequence;
  double v67;
  NSObject *v68;
  ABPK3DLiftingResult *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  const void *v76;
  uint64_t v77;
  uint64_t v78;
  ABPK2DDetectionResult *v84;
  uint64_t v85;
  const unsigned int *v86;
  void *v87;
  ABPK2DDetectionResult *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  const void *v95;
  uint64_t v96;
  uint64_t v97;
  ABPK2DDetectionResult *v99;
  uint64_t v100;
  const unsigned int *v101;
  void *v102;
  ABPK2DDetectionResult *v103;
  void *v104;
  NSObject *v105;
  NSObject *v106;
  ABPKCameraRegistration *bodyRegistration;
  void *v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  double v114;
  void *v115;
  ABPKSkeleton *liftingSkeleton;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  uint64_t v125;
  ABPK2dSkeleton *registered2dSkeleton;
  uint64_t v127;
  void *v128;
  NSObject *v129;
  ABPKDepthBasedScaleEstimation *scaleEstimation;
  uint64_t v131;
  uint64_t v132;
  double v133;
  double v134;
  void *v135;
  double v136;
  double v137;
  double v138;
  double v139;
  void *v140;
  double v141;
  double v142;
  double v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  float v152;
  float previousValidScale;
  NSObject *v154;
  double v155;
  double v156;
  NSObject *v157;
  void *v158;
  const void *v159;
  uint64_t v160;
  uint64_t v161;
  const void *v162;
  uint64_t v163;
  uint64_t v164;
  ABPKSkeleton *retargetedSkeleton;
  double v166;
  float v167;
  float v168;
  NSObject *v169;
  NSObject *v170;
  double v171;
  double v172;
  double v173;
  __int128 v174;
  double v175;
  __int128 v176;
  double v177;
  double v178;
  __int128 v179;
  double v180;
  ABPK2DDetectionResult *v181;
  double v182;
  __int128 v183;
  double v184;
  ABPK2DDetectionResult *v185;
  double v186;
  ABPK2dSkeleton *v187;
  void *__p[2];
  __int128 v189;
  __int128 v190;
  __int128 v191;
  uint8_t v192[4];
  double v193;
  uint64_t v194;
  uint64_t v195;
  uint8_t buf[32];
  __int128 v197;
  __int128 v198;
  uint64_t v199;

  v199 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v6, "image"));
  Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v6, "image"));
  __ABPKLogSharedInstance();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (double)Width;
  v12 = (double)Height;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)&buf[4] = (double)Height;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (double)Width;
    _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_DEBUG, " Sensor image resolution: (height,width):(%f,%f) ", buf, 0x16u);
  }

  objc_msgSend(v6, "cameraParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "deviceOrientation");

  objc_msgSend(v6, "cameraParams");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCameraParams:", v15);

  if (-[ABPK2DDetectionConfiguration abpkDeviceOrientation](self->_config2D, "abpkDeviceOrientation") != v14)
  {
    __ABPKLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      convertABPKDeviceOrientationEnumToString(-[ABPK2DDetectionConfiguration abpkDeviceOrientation](self->_config2D, "abpkDeviceOrientation"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      convertABPKDeviceOrientationEnumToString(v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_DEBUG, " Device orientation changed from %@ to %@ ", buf, 0x16u);

    }
    -[ABPK2DDetectionConfiguration setAbpkDeviceOrientation:](self->_config2D, "setAbpkDeviceOrientation:", v14);
  }
  +[ABPK2DMLModelConfigSelector inputDimensionsForModelWithABPKNetworkConfig:](ABPK2DMLModelConfigSelector, "inputDimensionsForModelWithABPKNetworkConfig:", self->_config2D);
  v20 = v19;
  v22 = v21;
  if (!self->_imagePreprocessor || self->_inputResolution.width == v11 && self->_inputResolution.height == v12)
  {
    __ABPKLogSharedInstance();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v20;
      _os_log_impl(&dword_210836000, v23, OS_LOG_TYPE_DEBUG, " ML image resolution: (height,width):(%f,%f) ", buf, 0x16u);
    }

    v24 = -[ABPKImagePreProcessingParams initWithType:inputResolution:outputResolution:]([ABPKImagePreProcessingParams alloc], "initWithType:inputResolution:outputResolution:", 2, v11, v12, v20, v22);
    objc_storeStrong((id *)&self->_imagePreProcessingParams, v24);
    -[ABPKImagePreProcessingParams printData](v24, "printData");
    v25 = -[ABPKImagePreProcessing initWithPreProcessingParams:]([ABPKImagePreProcessing alloc], "initWithPreProcessingParams:", v24);
    if (!v25)
    {
      __ABPKLogSharedInstance();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v28, OS_LOG_TYPE_ERROR, " Could not initialize imagePreprocessor ", buf, 2u);
      }

      goto LABEL_27;
    }
    self->_inputResolution.width = v11;
    self->_inputResolution.height = v12;
    imagePreprocessor = self->_imagePreprocessor;
    self->_imagePreprocessor = v25;

  }
  -[ABPKPoseEstimationPipeline _startImagePreprocessingSignpost](self, "_startImagePreprocessingSignpost");
  if (-[ABPK2DDetectionConfiguration abpkDeviceOrientation](self->_config2D, "abpkDeviceOrientation") != v14
    || !self->_mlImage)
  {
    v194 = *MEMORY[0x24BDC5668];
    v195 = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v195, &v194, 1);
    v24 = (ABPKImagePreProcessingParams *)objc_claimAutoreleasedReturnValue();
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (unint64_t)v20, (unint64_t)v22, 0x42475241u, (CFDictionaryRef)v24, &self->_mlImage))
    {
      __ABPKLogSharedInstance();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v27, OS_LOG_TYPE_ERROR, " Could not create mlImage buffer of type kCVPixelFormatType_32BGRA ", buf, 2u);
      }

LABEL_27:
      v30 = -6660;
      goto LABEL_28;
    }

  }
  v29 = -[ABPKImagePreProcessing preprocessData:outputBuffer:](self->_imagePreprocessor, "preprocessData:outputBuffer:", objc_msgSend(v6, "image"), self->_mlImage);
  -[ABPKImagePreProcessing logProfilingDetails](self->_imagePreprocessor, "logProfilingDetails");
  -[ABPKPoseEstimationPipeline _endImagePreprocessingSignpost](self, "_endImagePreprocessingSignpost");
  if (v29)
  {
    __ABPKLogSharedInstance();
    v24 = (ABPKImagePreProcessingParams *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, &v24->super, OS_LOG_TYPE_ERROR, " Could not pre-process image ", buf, 2u);
    }
    goto LABEL_27;
  }
  if (self->_exitPoint)
  {
    objc_msgSend(v7, "algState");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setImage_preprocessing:", 1);

    __ABPKLogSharedInstance();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v33, OS_LOG_TYPE_DEBUG, " Running 2d pose estimation ", buf, 2u);
    }

    __ABPKLogSharedInstance();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v34, OS_LOG_TYPE_DEBUG, " \t Running the ML model ", buf, 2u);
    }

    v35 = [ABPKMLImageData alloc];
    mlImage = self->_mlImage;
    objc_msgSend(v6, "timestamp");
    v24 = -[ABPKMLImageData initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:](v35, "initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:", mlImage, v14, self->_imagePreProcessingParams);
    if (-[ABPK2DPoseEstimation runWithMLImageData:rotationOfResultTensor:](self->_poseEstimation2D, "runWithMLImageData:rotationOfResultTensor:", v24, 0) == -6661)
    {
      __ABPKLogSharedInstance();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v37, OS_LOG_TYPE_ERROR, " 2D Pose estimation failed. ", buf, 2u);
      }

      ++self->_consistent2DSkeletonMissing;
      v30 = -6661;
      goto LABEL_28;
    }
    -[ABPK2DPoseEstimation getRawTrackedHumanSkeleton:](self->_poseEstimation2D, "getRawTrackedHumanSkeleton:", self->_rawDetection2dSkeleton);
    -[ABPK2DPoseEstimation getRawTrackedHumanSkeletonVector:](self->_poseEstimation2D, "getRawTrackedHumanSkeletonVector:", self->_rawDetection2dSkeletonArray);
    -[ABPK2DPoseEstimation getTrackedHumanSkeleton:](self->_poseEstimation2D, "getTrackedHumanSkeleton:", self->_detection2dSkeleton);
    v187 = -[ABPK2dSkeleton initWithType:]([ABPK2dSkeleton alloc], "initWithType:", 1);
    -[ABPK2DPoseEstimation getTrackedHumanForLiftingSkeleton:](self->_poseEstimation2D, "getTrackedHumanForLiftingSkeleton:");
    objc_msgSend(v7, "algState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setDetection2d:", 1);

    if (self->_deviceANEVersionPriorOrEqualToH12)
    {
      if (-[ABPK2dSkeleton hasMissingJoints](v187, "hasMissingJoints"))
      {
        __ABPKLogSharedInstance();
        v39 = (ABPK2dSkeleton *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v39->super, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210836000, &v39->super, OS_LOG_TYPE_DEBUG, " \t\t Extrapolation for missing joints failed. Cannot run lifting network using old 3D lifting model on rOS. New 3D lifting model should still work on iOS. ", buf, 2u);
        }
        v30 = -6667;
        goto LABEL_163;
      }
    }
    else if (!self->_rawDetection2dSkeleton)
    {
      v30 = -6667;
LABEL_164:

      goto LABEL_28;
    }
    if (self->_exitPoint == 2)
    {
      __ABPKLogSharedInstance();
      v39 = (ABPK2dSkeleton *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v39->super, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, &v39->super, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPoint2DDetectionPostProcessing ", buf, 2u);
      }
      v30 = 0;
      goto LABEL_163;
    }
    __ABPKLogSharedInstance();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v40, OS_LOG_TYPE_DEBUG, " Performing 2d-3d lifting ", buf, 2u);
    }

    __ABPKLogSharedInstance();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v41, OS_LOG_TYPE_DEBUG, " \t Pre-processing data ", buf, 2u);
    }

    if (self->_deviceANEVersionPriorOrEqualToH12)
    {
      v42 = [ABPK2D3DLiftingData alloc];
      v43 = -[ABPK2dSkeleton normalizedKeypoints2d](v187, "normalizedKeypoints2d");
      -[ABPK2dSkeleton skeletonDefinition](v187, "skeletonDefinition");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[ABPK2D3DLiftingData initWithJoints:numberOfJoints:](v42, "initWithJoints:numberOfJoints:", v43, objc_msgSend(v44, "jointCount"));

      v45 = [ABPK2DDetectionResult alloc];
      v46 = -[ABPK2dSkeleton normalizedKeypoints2d](self->_detection2dSkeleton, "normalizedKeypoints2d");
      v47 = -[ABPK2dSkeleton visibility](self->_detection2dSkeleton, "visibility");
      -[ABPK2dSkeleton skeletonDefinition](self->_detection2dSkeleton, "skeletonDefinition");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v45, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v46, v47, objc_msgSend(v48, "jointCount"), 0, v39, 0.0, 0.0, 1.0, 1.0);

      if (!v39)
      {
        __ABPKLogSharedInstance();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v64 = " Exiting from point: kABPKAlgorithmExitPoint3DLiftingPreprocessing ";
LABEL_79:
          _os_log_impl(&dword_210836000, v51, OS_LOG_TYPE_DEBUG, v64, buf, 2u);
        }
LABEL_80:
        v30 = 0;
LABEL_81:

LABEL_162:
LABEL_163:

        goto LABEL_164;
      }
      __ABPKLogSharedInstance();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v49, OS_LOG_TYPE_DEBUG, " \t Running the lifting model ", buf, 2u);
      }

      liftingAlgorithm = self->_liftingAlgorithm;
      objc_msgSend(v6, "timestamp");
      if (-[ABPK3DLifting runLiftingModelWithData:atTimestamp:](liftingAlgorithm, "runLiftingModelWithData:atTimestamp:", v185))
      {
        __ABPKLogSharedInstance();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210836000, v51, OS_LOG_TYPE_DEBUG, " \t\t Failed to run Lifting ML model ", buf, 2u);
        }
        v30 = -6662;
        goto LABEL_81;
      }
      if (self->_exitPoint == 4)
      {
        __ABPKLogSharedInstance();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v64 = " Exiting from point: kABPKAlgorithmExitPoint3DLiftingModelOutput ";
          goto LABEL_79;
        }
        goto LABEL_80;
      }
      __ABPKLogSharedInstance();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v68, OS_LOG_TYPE_DEBUG, " \t Post-processing output ", buf, 2u);
      }

      -[ABPK3DLifting getLiftingResults](self->_liftingAlgorithm, "getLiftingResults");
      v69 = (ABPK3DLiftingResult *)objc_claimAutoreleasedReturnValue();
      if (!v69)
      {
        v30 = -6662;
        goto LABEL_162;
      }
      objc_msgSend(v7, "algState");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setLifting3d:", 1);

      -[ABPKSkeleton setModelPoses:andUpdateLocalPoses:](self->_liftingSkeleton, "setModelPoses:andUpdateLocalPoses:", -[ABPK3DLifting get3DLiftingResultsAsModelPoses](self->_liftingAlgorithm, "get3DLiftingResultsAsModelPoses"), 1);
LABEL_129:

      self->_consistent2DSkeletonMissing = 0;
      if (self->_exitPoint == 5)
      {
        __ABPKLogSharedInstance();
        v105 = objc_claimAutoreleasedReturnValue();
        v185 = (ABPK2DDetectionResult *)v105;
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210836000, v105, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPoint3DLiftingPostProcessing ", buf, 2u);
        }
      }
      else
      {
        __ABPKLogSharedInstance();
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210836000, v106, OS_LOG_TYPE_DEBUG, " Performing camera registration ", buf, 2u);
        }

        bodyRegistration = self->_bodyRegistration;
        objc_msgSend(v6, "cameraParams");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "intrinsics");
        v182 = v110;
        v186 = v109;
        v178 = v111;
        objc_msgSend(v6, "cameraParams");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "inputRes");
        -[ABPKCameraRegistration runCameraRegistrationWithImageIntrinsics:imageResolution:liftingResult:](bodyRegistration, "runCameraRegistrationWithImageIntrinsics:imageResolution:liftingResult:", v69, v186, v182, v178, v113, v114);
        v185 = (ABPK2DDetectionResult *)objc_claimAutoreleasedReturnValue();

        if ((-[ABPK2DDetectionResult success](v185, "success") & 1) == 0)
        {
          v30 = -6664;
LABEL_161:
          v39 = (ABPK2dSkeleton *)v69;
          goto LABEL_162;
        }
        objc_msgSend(v7, "algState");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "setRegistration:", 1);

        liftingSkeleton = self->_liftingSkeleton;
        -[ABPK2DDetectionResult cameraFromBodyPose](v185, "cameraFromBodyPose");
        -[ABPKSkeleton setCameraRootTransform:](liftingSkeleton, "setCameraRootTransform:");
        -[ABPK2DDetectionResult cameraFromBodyPose](v185, "cameraFromBodyPose");
        v174 = v118;
        v176 = v117;
        v179 = v120;
        v183 = v119;
        *(double *)v121.i64 = simd_matrix4x4((float32x4_t)_PromotedConst);
        v125 = 0;
        *(_OWORD *)__p = v176;
        v189 = v174;
        v190 = v183;
        v191 = v179;
        do
        {
          *(float32x4_t *)&buf[v125 * 8] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v121, COERCE_FLOAT(*(_OWORD *)&__p[v125])), v122, (float32x2_t)__p[v125], 1), v123, *(float32x4_t *)&__p[v125], 2), v124, *(float32x4_t *)&__p[v125], 3);
          v125 += 2;
        }
        while (v125 != 8);
        v180 = *(double *)&buf[16];
        v184 = *(double *)buf;
        v175 = *(double *)&v198;
        v177 = *(double *)&v197;
        -[ABPKSkeleton setRenderingCameraRootTransform:](self->_liftingSkeleton, "setRenderingCameraRootTransform:");
        registered2dSkeleton = self->_registered2dSkeleton;
        v127 = -[ABPK2DDetectionResult joints2d](v185, "joints2d");
        objc_msgSend(v6, "cameraParams");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "inputRes");
        -[ABPK2dSkeleton setKeypoints2d:withImageRes:](registered2dSkeleton, "setKeypoints2d:withImageRes:", v127);

        if (self->_exitPoint == 6)
        {
          __ABPKLogSharedInstance();
          v129 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_210836000, v129, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPointCameraRegistration ", buf, 2u);
          }
        }
        else
        {
          objc_msgSend(v6, "timestamp");
          -[ABPKPoseEstimationPipeline _startScaleEstimationSignpostWithTimestamp:](self, "_startScaleEstimationSignpostWithTimestamp:");
          if (!objc_msgSend(v6, "isDepthDataValid"))
            goto LABEL_146;
          if (!objc_msgSend(v6, "depthMap"))
            goto LABEL_146;
          if (!objc_msgSend(v6, "depthConfidenceBuffer"))
            goto LABEL_146;
          scaleEstimation = self->_scaleEstimation;
          v131 = objc_msgSend(v6, "depthMap");
          v132 = objc_msgSend(v6, "depthConfidenceBuffer");
          objc_msgSend(v6, "timestamp");
          v134 = v133;
          objc_msgSend(v6, "cameraParams");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "inputRes");
          v137 = v136;
          v139 = v138;
          objc_msgSend(v6, "cameraParams");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v140, "intrinsics");
          v172 = v142;
          v173 = v141;
          v171 = v143;
          -[ABPK2DDetectionResult cameraFromBodyPose](v185, "cameraFromBodyPose");
          -[ABPKDepthBasedScaleEstimation estimateScaleFromDepthData:depthConfidenceData:timestamp:imageResolution:imageIntrinsics:cameraFromBodyPose:liftingResult:](scaleEstimation, "estimateScaleFromDepthData:depthConfidenceData:timestamp:imageResolution:imageIntrinsics:cameraFromBodyPose:liftingResult:", v131, v132, v69, v134, v137, v139, v173, v172, v171, v144, v145, v146, v147, v148, v149, v150, v151);
          previousValidScale = v152;

          if (previousValidScale != -1.0)
            self->_previousValidScale = previousValidScale;
          else
LABEL_146:
            previousValidScale = self->_previousValidScale;
          __ABPKLogSharedInstance();
          v154 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&buf[4] = previousValidScale;
            _os_log_impl(&dword_210836000, v154, OS_LOG_TYPE_DEBUG, " Estimated Scale: %f ", buf, 0xCu);
          }

          *(float *)&v155 = previousValidScale;
          -[ABPK3DLiftingResult setEstimatedScale:](v69, "setEstimatedScale:", v155);
          *(float *)&v156 = previousValidScale;
          -[ABPKSkeleton setEstimatedScale:](self->_liftingSkeleton, "setEstimatedScale:", v156);
          -[ABPKSkeleton updateJointPosesAndRootTransformUsingDepthEstimatedScale](self->_liftingSkeleton, "updateJointPosesAndRootTransformUsingDepthEstimatedScale");
          objc_msgSend(v6, "timestamp");
          -[ABPKPoseEstimationPipeline _endScaleEstimationSignpostWithTimestamp:](self, "_endScaleEstimationSignpostWithTimestamp:");
          __ABPKLogSharedInstance();
          v157 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_210836000, v157, OS_LOG_TYPE_DEBUG, " Performing retargeting ", buf, 2u);
          }

          objc_msgSend(v6, "timestamp");
          -[ABPKPoseEstimationPipeline _startRetargettingSignpostWithTimestamp:](self, "_startRetargettingSignpostWithTimestamp:");
          -[ABPKRetargeting processData:](self->_retargeting, "processData:", v69);
          v129 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "algState");
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "setRetargeting:", 1);

          v159 = (const void *)-[NSObject jointModelTransforms](v129, "jointModelTransforms");
          v160 = -[NSObject jointModelTransforms](v129, "jointModelTransforms");
          v161 = -[NSObject jointTransformCount](v129, "jointTransformCount");
          memset(buf, 0, 24);
          std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(buf, v159, v160 + (v161 << 6), (v160 + (v161 << 6) - (uint64_t)v159) >> 6);
          v162 = (const void *)-[NSObject jointLocalTransforms](v129, "jointLocalTransforms");
          v163 = -[NSObject jointLocalTransforms](v129, "jointLocalTransforms");
          v164 = -[NSObject jointTransformCount](v129, "jointTransformCount");
          __p[0] = 0;
          __p[1] = 0;
          *(_QWORD *)&v189 = 0;
          std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(__p, v162, v163 + (v164 << 6), (v163 + (v164 << 6) - (uint64_t)v162) >> 6);
          -[ABPKSkeleton setModelPoses:andUpdateLocalPoses:](self->_retargetedSkeleton, "setModelPoses:andUpdateLocalPoses:", *(_QWORD *)buf, 0);
          retargetedSkeleton = self->_retargetedSkeleton;
          -[ABPK2DDetectionResult cameraFromBodyPose](v185, "cameraFromBodyPose");
          -[ABPKSkeleton setCameraRootTransform:](retargetedSkeleton, "setCameraRootTransform:");
          -[ABPKSkeleton setRenderingCameraRootTransform:](self->_retargetedSkeleton, "setRenderingCameraRootTransform:", v184, v180, v177, v175);
          *(float *)&v166 = previousValidScale;
          -[ABPKSkeleton setEstimatedScale:](self->_retargetedSkeleton, "setEstimatedScale:", v166);
          objc_msgSend(v6, "timestamp");
          -[ABPKPoseEstimationPipeline _endRetargettingSignpostWithTimestamp:](self, "_endRetargettingSignpostWithTimestamp:");
          -[ABPKSkeleton computeHeight](self->_retargetedSkeleton, "computeHeight");
          v168 = v167;
          __ABPKLogSharedInstance();
          v169 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v192 = 134217984;
            v193 = v168;
            _os_log_impl(&dword_210836000, v169, OS_LOG_TYPE_DEBUG, " skeletonHeight: %f ", v192, 0xCu);
          }

          __ABPKLogSharedInstance();
          v170 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v170, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v192 = 134217984;
            v193 = previousValidScale;
            _os_log_impl(&dword_210836000, v170, OS_LOG_TYPE_DEBUG, " Estimated Scale: %f ", v192, 0xCu);
          }

          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(_QWORD *)buf)
          {
            *(_QWORD *)&buf[8] = *(_QWORD *)buf;
            operator delete(*(void **)buf);
          }
        }

      }
      v30 = 0;
      goto LABEL_161;
    }
    v39 = -[ABPK2dSkeleton initWithType:]([ABPK2dSkeleton alloc], "initWithType:", 1);
    -[ABPK2DPoseEstimation getRawTrackedHumanForLiftingSkeleton:](self->_poseEstimation2D, "getRawTrackedHumanForLiftingSkeleton:", v39);
    v52 = [ABPK2D3DLiftingData alloc];
    v53 = -[ABPK2dSkeleton normalizedKeypoints2d](v39, "normalizedKeypoints2d");
    -[ABPK2dSkeleton skeletonDefinition](v39, "skeletonDefinition");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = -[ABPK2D3DLiftingData initWithJoints:numberOfJoints:](v52, "initWithJoints:numberOfJoints:", v53, objc_msgSend(v54, "jointCount"));

    v55 = [ABPK2DDetectionResult alloc];
    v56 = -[ABPK2dSkeleton normalizedKeypoints2d](self->_rawDetection2dSkeleton, "normalizedKeypoints2d");
    v57 = -[ABPK2dSkeleton visibility](self->_rawDetection2dSkeleton, "visibility");
    -[ABPK2dSkeleton skeletonDefinition](self->_rawDetection2dSkeleton, "skeletonDefinition");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v55, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v56, v57, objc_msgSend(v58, "jointCount"), 0, v185, 0.0, 0.0, 1.0, 1.0);

    if (self->_useLSTM3D)
    {
      if (self->_consistent2DSkeletonMissing >= 6)
      {
        __ABPKLogSharedInstance();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210836000, v59, OS_LOG_TYPE_DEBUG, " \t Last detected person was many frames ago. New 2D person detected. Resetting LSTM for 3D lifting. ", buf, 2u);
        }

        -[ABPK3DLiftingLSTM resetCellStateAndHiddenStateInput](self->_liftingAlgorithmLSTM, "resetCellStateAndHiddenStateInput");
      }
      __ABPKLogSharedInstance();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v60, OS_LOG_TYPE_DEBUG, " \t Running the LSTM lifting model ", buf, 2u);
      }

      liftingAlgorithmLSTM = self->_liftingAlgorithmLSTM;
      objc_msgSend(v6, "timestamp");
      if (-[ABPK3DLiftingLSTM runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:](liftingAlgorithmLSTM, "runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:", v181, v14, v11, v12, v62))
      {
        __ABPKLogSharedInstance();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
LABEL_87:
          _os_log_impl(&dword_210836000, v63, OS_LOG_TYPE_DEBUG, " \t\t Failed to run Lifting ML model ", buf, 2u);
          goto LABEL_88;
        }
        goto LABEL_88;
      }
      if (self->_exitPoint == 4)
      {
        __ABPKLogSharedInstance();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
LABEL_99:
          _os_log_impl(&dword_210836000, v63, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPoint3DLiftingModelOutput ", buf, 2u);
          goto LABEL_100;
        }
        goto LABEL_100;
      }
      __ABPKLogSharedInstance();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v71, OS_LOG_TYPE_DEBUG, " \t Post-processing output ", buf, 2u);
      }

      -[ABPK3DLiftingLSTM getLiftingResults](self->_liftingAlgorithmLSTM, "getLiftingResults");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v72;
      if (v72)
      {
        if (objc_msgSend(v72, "rawNetworkOutputJoints"))
          objc_msgSend(v7, "setRawLiftingNetworkOutputJoints:", objc_msgSend(v73, "rawNetworkOutputJoints"));
        -[ABPK2dSkeleton skeletonDefinition](self->_detection2dSkeleton, "skeletonDefinition");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "jointCount");

        v76 = -[ABPK2dSkeleton normalizedKeypoints2d](self->_detection2dSkeleton, "normalizedKeypoints2d");
        v77 = -[ABPK2dSkeleton normalizedKeypoints2d](self->_detection2dSkeleton, "normalizedKeypoints2d");
        memset(buf, 0, 24);
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(buf, v76, v77 + 8 * v75, (v77 + 8 * v75 - (uint64_t)v76) >> 3);
        if (v75)
        {
          v78 = 0;
          __asm { FMOV            V8.2S, #-1.0 }
          do
          {
            if (!-[ABPK2dSkeleton visibility](self->_rawDetection2dSkeleton, "visibility")[4 * v78])
              *(_QWORD *)(*(_QWORD *)buf + 8 * v78) = _D8;
            ++v78;
          }
          while (v75 != v78);
        }
        v84 = [ABPK2DDetectionResult alloc];
        v85 = *(_QWORD *)buf;
        v86 = -[ABPK2dSkeleton visibility](self->_rawDetection2dSkeleton, "visibility");
        -[ABPK2dSkeleton skeletonDefinition](self->_rawDetection2dSkeleton, "skeletonDefinition");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v84, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v85, v86, objc_msgSend(v87, "jointCount"), 0, v185, 0.0, 0.0, 1.0, 1.0);

        v69 = -[ABPK3DLiftingResult initWithJoints:numberOfJoints:referenceDetectionResult:]([ABPK3DLiftingResult alloc], "initWithJoints:numberOfJoints:referenceDetectionResult:", objc_msgSend(v73, "joints"), 17, v88);
        objc_msgSend(v7, "algState");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "setLifting3d:", 1);

        -[ABPKSkeleton setModelPoses:andUpdateLocalPoses:](self->_liftingSkeleton, "setModelPoses:andUpdateLocalPoses:", -[ABPK3DLiftingLSTM get3DLiftingResultsAsModelPoses](self->_liftingAlgorithmLSTM, "get3DLiftingResultsAsModelPoses"), 1);
LABEL_126:
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }

        goto LABEL_129;
      }
    }
    else
    {
      __ABPKLogSharedInstance();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v65, OS_LOG_TYPE_DEBUG, " \t Running the TCN lifting model ", buf, 2u);
      }

      liftingAlgorithmSequence = self->_liftingAlgorithmSequence;
      objc_msgSend(v6, "timestamp");
      if (-[ABPK3DLiftingSequence runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:](liftingAlgorithmSequence, "runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:", v181, v14, v11, v12, v67))
      {
        __ABPKLogSharedInstance();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_87;
        }
LABEL_88:
        v30 = -6662;
LABEL_101:

LABEL_102:
        goto LABEL_162;
      }
      if (self->_exitPoint == 4)
      {
        __ABPKLogSharedInstance();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_99;
        }
LABEL_100:
        v30 = 0;
        goto LABEL_101;
      }
      __ABPKLogSharedInstance();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v90, OS_LOG_TYPE_DEBUG, " \t Post-processing output ", buf, 2u);
      }

      -[ABPK3DLiftingSequence getLiftingResults](self->_liftingAlgorithmSequence, "getLiftingResults");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v91;
      if (v91)
      {
        if (objc_msgSend(v91, "rawNetworkOutputJoints"))
          objc_msgSend(v7, "setRawLiftingNetworkOutputJoints:", objc_msgSend(v92, "rawNetworkOutputJoints"));
        -[ABPK2dSkeleton skeletonDefinition](self->_detection2dSkeleton, "skeletonDefinition");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v93, "jointCount");

        v95 = -[ABPK2dSkeleton normalizedKeypoints2d](self->_detection2dSkeleton, "normalizedKeypoints2d");
        v96 = -[ABPK2dSkeleton normalizedKeypoints2d](self->_detection2dSkeleton, "normalizedKeypoints2d");
        memset(buf, 0, 24);
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(buf, v95, v96 + 8 * v94, (v96 + 8 * v94 - (uint64_t)v95) >> 3);
        if (v94)
        {
          v97 = 0;
          __asm { FMOV            V8.2S, #-1.0 }
          do
          {
            if (!-[ABPK2dSkeleton visibility](self->_rawDetection2dSkeleton, "visibility")[4 * v97])
              *(_QWORD *)(*(_QWORD *)buf + 8 * v97) = _D8;
            ++v97;
          }
          while (v94 != v97);
        }
        v99 = [ABPK2DDetectionResult alloc];
        v100 = *(_QWORD *)buf;
        v101 = -[ABPK2dSkeleton visibility](self->_rawDetection2dSkeleton, "visibility");
        -[ABPK2dSkeleton skeletonDefinition](self->_rawDetection2dSkeleton, "skeletonDefinition");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v99, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v100, v101, objc_msgSend(v102, "jointCount"), 0, v185, 0.0, 0.0, 1.0, 1.0);

        v69 = -[ABPK3DLiftingResult initWithJoints:numberOfJoints:referenceDetectionResult:]([ABPK3DLiftingResult alloc], "initWithJoints:numberOfJoints:referenceDetectionResult:", objc_msgSend(v92, "joints"), 17, v103);
        objc_msgSend(v7, "algState");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setLifting3d:", 1);

        -[ABPKSkeleton setModelPoses:andUpdateLocalPoses:](self->_liftingSkeleton, "setModelPoses:andUpdateLocalPoses:", -[ABPK3DLiftingSequence get3DLiftingResultsAsModelPoses](self->_liftingAlgorithmSequence, "get3DLiftingResultsAsModelPoses"), 1);
        goto LABEL_126;
      }
    }
    v30 = -6662;
    goto LABEL_102;
  }
  __ABPKLogSharedInstance();
  v24 = (ABPKImagePreProcessingParams *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, &v24->super, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPointImagePreProcessing ", buf, 2u);
  }
  v30 = 0;
LABEL_28:

  return v30;
}

- (void)computeRootTransforms:(float32x4_t)a3 withCameraExtrinsics:(float32x4_t)a4 withVioPose:(uint64_t)a5 withVioPoseValidity:(uint64_t)a6
{
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  double v26;
  double v28;
  double v30;
  double v32;
  id v33;
  _OWORD v34[4];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v33 = a7;
  objc_msgSend(v33, "liftingSkeletonABPK");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraRootTransform");
  v21 = v9;
  v22 = v8;
  v23 = v11;
  v24 = v10;
  objc_msgSend(v33, "liftingSkeletonABPK");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = 0;
  v34[0] = v22;
  v34[1] = v21;
  v34[2] = v24;
  v34[3] = v23;
  do
  {
    *(__int128 *)((char *)&v35 + v14 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, COERCE_FLOAT(v34[v14])), a2, *(float32x2_t *)&v34[v14], 1), a3, (float32x4_t)v34[v14], 2), a4, (float32x4_t)v34[v14], 3);
    ++v14;
  }
  while (v14 != 4);
  objc_msgSend(v12, "setDeviceRootTransform:", *(double *)&v35, *(double *)&v36, *(double *)&v37, *(double *)&v38);

  objc_msgSend(v33, "liftingSkeletonABPK");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceRootTransform");
  v30 = v17;
  v32 = v16;
  v26 = v19;
  v28 = v18;
  objc_msgSend(v33, "retargetedSkeletonABPK");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDeviceRootTransform:", v32, v30, v28, v26);

}

- (void)saveInputData:(id)a3 andOutputData:(id)a4 ToDir:(id)a5 withFileNamePrefix:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  __ABPKLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " \t\t Recording input data ", buf, 2u);
  }

  objc_msgSend(v9, "saveDataToDir:withFileNamePrefix:", v11, v12);
  __ABPKLogSharedInstance();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_210836000, v14, OS_LOG_TYPE_DEBUG, " \t\t Recording output data ", v15, 2u);
  }

  objc_msgSend(v10, "saveDataToDir:withFileNamePrefix:", v11, v12);
}

- (void)_startInitABPKSignpost
{
  kdebug_trace();
}

- (void)_endInitABPKSignpost
{
  kdebug_trace();
}

- (void)_startInitABPKOutputSignpost
{
  kdebug_trace();
}

- (void)_endInitABPKOutputSignpost
{
  kdebug_trace();
}

- (void)_startExecuteAlgorithmSignpost
{
  kdebug_trace();
}

- (void)_endExecuteAlgorithmSignpost
{
  kdebug_trace();
}

- (void)_startImagePreprocessingSignpost
{
  kdebug_trace();
}

- (void)_endImagePreprocessingSignpost
{
  kdebug_trace();
}

- (void)_startScaleEstimationSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endScaleEstimationSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startRetargettingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endRetargettingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePreProcessingParams, 0);
  objc_storeStrong((id *)&self->_imagePreprocessor, 0);
  objc_storeStrong((id *)&self->_retargetedSkeleton, 0);
  objc_storeStrong((id *)&self->_registered2dSkeleton, 0);
  objc_storeStrong((id *)&self->_liftingSkeleton, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeletonArray, 0);
  objc_storeStrong((id *)&self->_detection2dSkeleton, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeleton, 0);
  objc_storeStrong((id *)&self->_retargeting, 0);
  objc_storeStrong((id *)&self->_scaleEstimation, 0);
  objc_storeStrong((id *)&self->_bodyRegistration, 0);
  objc_storeStrong((id *)&self->_liftingAlgorithmLSTM, 0);
  objc_storeStrong((id *)&self->_liftingAlgorithmSequence, 0);
  objc_storeStrong((id *)&self->_liftingAlgorithm, 0);
  objc_storeStrong((id *)&self->_postprocess2d, 0);
  objc_storeStrong((id *)&self->_poseEstimation2D, 0);
  objc_storeStrong((id *)&self->_config2D, 0);
  objc_storeStrong((id *)&self->_saveDirectory, 0);
}

@end

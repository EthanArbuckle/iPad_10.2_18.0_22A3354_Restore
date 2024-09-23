@implementation ABPKAlgorithm

- (ABPKAlgorithm)initWithParams:(id)a3
{
  id v5;
  ABPKAlgorithm *v6;
  ABPKAlgorithm *v7;
  void *v8;
  ABPK2DPoseEstimation *v9;
  ABPK2DPoseEstimation *poseEstimation2D;
  ABPK3DLifting *v11;
  ABPK3DLifting *liftingAlgorithm;
  ABPKCameraRegistration *v13;
  ABPKCameraRegistration *bodyRegistration;
  ABPKDepthBasedScaleEstimation *v15;
  ABPKDepthBasedScaleEstimation *scaleEstimation;
  ABPKRetargeting *v17;
  ABPKRetargeting *retargeting;
  ABPKAlgorithm *v19;
  NSObject *v20;
  const char *v21;
  __int16 v23[8];
  objc_super v24;

  v5 = a3;
  -[ABPKAlgorithm _startInitABPKSignpost](self, "_startInitABPKSignpost");
  v24.receiver = self;
  v24.super_class = (Class)ABPKAlgorithm;
  v6 = -[ABPKAlgorithm init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_algParams, a3);
    objc_msgSend(v5, "config2DDetection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ABPK2DPoseEstimation initWith2DDetectionConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:]([ABPK2DPoseEstimation alloc], "initWith2DDetectionConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:", v8, 0, 0);
    poseEstimation2D = v7->_poseEstimation2D;
    v7->_poseEstimation2D = v9;

    if (v7->_poseEstimation2D)
    {
      v11 = objc_alloc_init(ABPK3DLifting);
      liftingAlgorithm = v7->_liftingAlgorithm;
      v7->_liftingAlgorithm = v11;

      if (v7->_liftingAlgorithm)
      {
        v13 = objc_alloc_init(ABPKCameraRegistration);
        bodyRegistration = v7->_bodyRegistration;
        v7->_bodyRegistration = v13;

        if (v7->_bodyRegistration)
        {
          v15 = objc_alloc_init(ABPKDepthBasedScaleEstimation);
          scaleEstimation = v7->_scaleEstimation;
          v7->_scaleEstimation = v15;

          if (v7->_scaleEstimation)
          {
            v17 = objc_alloc_init(ABPKRetargeting);
            retargeting = v7->_retargeting;
            v7->_retargeting = v17;

            if (v7->_retargeting)
            {
              v7->_previousValidScale = -1.0;
              -[ABPKAlgorithm _endInitABPKSignpost](v7, "_endInitABPKSignpost");
              v19 = v7;
LABEL_21:

              goto LABEL_22;
            }
            __ABPKLogSharedInstance();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v23[0] = 0;
              v21 = " Failed to initialize the retargeting module. ";
              goto LABEL_19;
            }
LABEL_20:

            v19 = 0;
            goto LABEL_21;
          }
          __ABPKLogSharedInstance();
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            goto LABEL_20;
          v23[0] = 0;
          v21 = " Failed to initialize the Depth-based scale estimation module. ";
        }
        else
        {
          __ABPKLogSharedInstance();
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            goto LABEL_20;
          v23[0] = 0;
          v21 = " Failed to initialize the Body-Camera registration module. ";
        }
      }
      else
      {
        __ABPKLogSharedInstance();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_20;
        v23[0] = 0;
        v21 = " Failed to initialize the 3D lifting algorithm. ";
      }
    }
    else
    {
      __ABPKLogSharedInstance();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v23[0] = 0;
      v21 = " Failed to initialize 2D Pose Estimation Algorithm. ";
    }
LABEL_19:
    _os_log_impl(&dword_210836000, v20, OS_LOG_TYPE_ERROR, v21, (uint8_t *)v23, 2u);
    goto LABEL_20;
  }
  v19 = 0;
LABEL_22:

  return v19;
}

- (void)setExitPoint:(int64_t)a3
{
  self->_exitPoint = a3;
}

- (int)runWithInput:(id)a3 andGetOutput:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  ABPKMLImageData *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  ABPK2dSkeleton *v14;
  int v15;
  ABPK2DPoseEstimation *poseEstimation2D;
  void *v17;
  ABPK2DPoseEstimation *v18;
  void *v19;
  ABPK2DPoseEstimation *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  ABPK2D3DLiftingData *v26;
  uint64_t v27;
  void *v28;
  ABPK2DDetectionResult *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  ABPK2DDetectionResult *v36;
  NSObject *v37;
  ABPK3DLifting *liftingAlgorithm;
  NSObject *v39;
  const char *v40;
  NSObject *v42;
  void *v43;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  ABPKCameraRegistration *bodyRegistration;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  ABPKDepthBasedScaleEstimation *scaleEstimation;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  float v79;
  float previousValidScale;
  NSObject *v81;
  double v82;
  void *v83;
  double v84;
  NSObject *v85;
  void *v86;
  const void *v87;
  uint64_t v88;
  uint64_t v89;
  const void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  void *v97;
  float v98;
  float v99;
  NSObject *v100;
  NSObject *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  uint64_t v108;
  ABPKMLImageData *v109;
  id v110;
  void *__p;
  void *v112;
  uint64_t v113;
  uint8_t v114[4];
  double v115;
  __int128 buf;
  uint64_t v117;
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v110 = a4;
  objc_msgSend(v6, "timestamp");
  -[ABPKAlgorithm _startABPKRunWithInputSignpostWithTimestamp:](self, "_startABPKRunWithInputSignpostWithTimestamp:");
  __ABPKLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_DEBUG, " Running 2d pose estimation ", (uint8_t *)&buf, 2u);
  }

  __ABPKLogSharedInstance();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_210836000, v8, OS_LOG_TYPE_DEBUG, " \t Running the ML model ", (uint8_t *)&buf, 2u);
  }

  v9 = [ABPKMLImageData alloc];
  v10 = objc_msgSend(v6, "image");
  objc_msgSend(v6, "timestamp");
  v12 = v11;
  objc_msgSend(v6, "imagePreProcessingParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = -[ABPKMLImageData initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:](v9, "initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:", v10, 3, v13, v12);

  if (-[ABPK2DPoseEstimation runWithMLImageData:rotationOfResultTensor:](self->_poseEstimation2D, "runWithMLImageData:rotationOfResultTensor:", v109, 0) != -6661)
  {
    poseEstimation2D = self->_poseEstimation2D;
    objc_msgSend(v110, "rawDetection2dSkeletonABPK");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABPK2DPoseEstimation getRawTrackedHumanSkeleton:](poseEstimation2D, "getRawTrackedHumanSkeleton:", v17);

    v18 = self->_poseEstimation2D;
    objc_msgSend(v110, "rawDetection2dSkeletonABPKArray");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABPK2DPoseEstimation getRawTrackedHumanSkeletonVector:](v18, "getRawTrackedHumanSkeletonVector:", v19);

    v20 = self->_poseEstimation2D;
    objc_msgSend(v110, "detection2dSkeletonABPK");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABPK2DPoseEstimation getTrackedHumanSkeleton:](v20, "getTrackedHumanSkeleton:", v21);

    v14 = -[ABPK2dSkeleton initWithType:]([ABPK2dSkeleton alloc], "initWithType:", 1);
    -[ABPK2DPoseEstimation getTrackedHumanForLiftingSkeleton:](self->_poseEstimation2D, "getTrackedHumanForLiftingSkeleton:", v14);
    objc_msgSend(v110, "algState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDetection2d:", 1);

    if (-[ABPK2dSkeleton missingJoints](v14, "missingJoints"))
    {
      __ABPKLogSharedInstance();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_210836000, v23, OS_LOG_TYPE_DEBUG, " \t\t Extrapolation for missing joints failed. Cannot run lifting network. ", (uint8_t *)&buf, 2u);
      }
      v15 = -6667;
      goto LABEL_36;
    }
    if (self->_exitPoint == 2)
    {
      __ABPKLogSharedInstance();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_210836000, v23, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPoint2DDetectionPostProcessing ", (uint8_t *)&buf, 2u);
      }
      v15 = 0;
      goto LABEL_36;
    }
    __ABPKLogSharedInstance();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_210836000, v24, OS_LOG_TYPE_DEBUG, " Performing 2d-3d lifting ", (uint8_t *)&buf, 2u);
    }

    __ABPKLogSharedInstance();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_210836000, v25, OS_LOG_TYPE_DEBUG, " \t Pre-processing data ", (uint8_t *)&buf, 2u);
    }

    v26 = [ABPK2D3DLiftingData alloc];
    v27 = -[ABPK2dSkeleton normalizedKeypoints2d](v14, "normalizedKeypoints2d");
    -[ABPK2dSkeleton skeletonDefinition](v14, "skeletonDefinition");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = -[ABPK2D3DLiftingData initWithJoints:numberOfJoints:](v26, "initWithJoints:numberOfJoints:", v27, objc_msgSend(v28, "jointCount"));

    v29 = [ABPK2DDetectionResult alloc];
    objc_msgSend(v110, "detection2dSkeletonABPK");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "normalizedKeypoints2d");
    objc_msgSend(v110, "detection2dSkeletonABPK");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "visibility");
    objc_msgSend(v110, "detection2dSkeletonABPK");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "skeletonDefinition");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v29, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v31, v33, objc_msgSend(v35, "jointCount"), 0, v108, 0.0, 0.0, 1.0, 1.0);

    if (!v108)
    {
      __ABPKLogSharedInstance();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        v40 = " Exiting from point: kABPKAlgorithmExitPoint3DLiftingPreprocessing ";
LABEL_33:
        _os_log_impl(&dword_210836000, v39, OS_LOG_TYPE_DEBUG, v40, (uint8_t *)&buf, 2u);
      }
LABEL_34:
      v15 = 0;
      goto LABEL_35;
    }
    __ABPKLogSharedInstance();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_210836000, v37, OS_LOG_TYPE_DEBUG, " \t Running the lifting model ", (uint8_t *)&buf, 2u);
    }

    liftingAlgorithm = self->_liftingAlgorithm;
    objc_msgSend(v6, "timestamp");
    if (-[ABPK3DLifting runLiftingModelWithData:atTimestamp:](liftingAlgorithm, "runLiftingModelWithData:atTimestamp:", v36))
    {
      __ABPKLogSharedInstance();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_210836000, v39, OS_LOG_TYPE_DEBUG, " \t\t Failed to run Lifting ML model ", (uint8_t *)&buf, 2u);
      }
LABEL_27:
      v15 = -6662;
LABEL_35:

      v23 = v108;
LABEL_36:

      goto LABEL_37;
    }
    if (self->_exitPoint == 4)
    {
      __ABPKLogSharedInstance();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        v40 = " Exiting from point: kABPKAlgorithmExitPoint3DLiftingModelOutput ";
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    __ABPKLogSharedInstance();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_210836000, v42, OS_LOG_TYPE_DEBUG, " \t Post-processing output ", (uint8_t *)&buf, 2u);
    }

    -[ABPK3DLifting getLiftingResults](self->_liftingAlgorithm, "getLiftingResults");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
      goto LABEL_27;
    objc_msgSend(v110, "algState");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setLifting3d:", 1);

    v44 = -[ABPK3DLifting get3DLiftingResultsAsModelPoses](self->_liftingAlgorithm, "get3DLiftingResultsAsModelPoses");
    objc_msgSend(v110, "liftingSkeletonABPK");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setModelPoses:andUpdateLocalPoses:", v44, 1);

    if (self->_exitPoint == 5)
    {
      __ABPKLogSharedInstance();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_210836000, v46, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPoint3DLiftingPostProcessing ", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      __ABPKLogSharedInstance();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_210836000, v47, OS_LOG_TYPE_DEBUG, " Performing camera registration ", (uint8_t *)&buf, 2u);
      }

      bodyRegistration = self->_bodyRegistration;
      objc_msgSend(v6, "imageCameraIntrinsics");
      v104 = v50;
      v106 = v49;
      v102 = v51;
      objc_msgSend(v6, "imageResolution");
      -[ABPKCameraRegistration runCameraRegistrationWithImageIntrinsics:imageResolution:liftingResult:](bodyRegistration, "runCameraRegistrationWithImageIntrinsics:imageResolution:liftingResult:", v39, v106, v104, v102, v52, v53);
      v46 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject success](v46, "success") & 1) == 0)
      {
        v15 = -6664;
LABEL_70:

        goto LABEL_35;
      }
      objc_msgSend(v110, "algState");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setRegistration:", 1);

      objc_msgSend(v110, "liftingSkeletonABPK");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject cameraFromBodyPose](v46, "cameraFromBodyPose");
      objc_msgSend(v55, "setCameraRootTransform:");

      objc_msgSend(v110, "registered2dSkeletonABPK");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[NSObject joints2d](v46, "joints2d");
      -[ABPKAlgorithmParams regImageResolution](self->_algParams, "regImageResolution");
      objc_msgSend(v56, "setKeypoints2d:withImageRes:", v57);

      if (self->_exitPoint == 6)
      {
        __ABPKLogSharedInstance();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_210836000, v58, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPointCameraRegistration ", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        objc_msgSend(v6, "timestamp");
        -[ABPKAlgorithm _startScaleEstimationSignpostWithTimestamp:](self, "_startScaleEstimationSignpostWithTimestamp:");
        if (!objc_msgSend(v6, "isDepthDataValid"))
          goto LABEL_55;
        if (!objc_msgSend(v6, "depthMap"))
          goto LABEL_55;
        if (!objc_msgSend(v6, "depthConfidenceBuffer"))
          goto LABEL_55;
        scaleEstimation = self->_scaleEstimation;
        v60 = objc_msgSend(v6, "depthMap");
        v61 = objc_msgSend(v6, "depthConfidenceBuffer");
        objc_msgSend(v6, "timestamp");
        v63 = v62;
        objc_msgSend(v6, "imageResolution");
        v65 = v64;
        v67 = v66;
        objc_msgSend(v6, "imageCameraIntrinsics");
        v105 = v69;
        v107 = v68;
        v103 = v70;
        -[NSObject cameraFromBodyPose](v46, "cameraFromBodyPose");
        -[ABPKDepthBasedScaleEstimation estimateScaleFromDepthData:depthConfidenceData:timestamp:imageResolution:imageIntrinsics:cameraFromBodyPose:liftingResult:](scaleEstimation, "estimateScaleFromDepthData:depthConfidenceData:timestamp:imageResolution:imageIntrinsics:cameraFromBodyPose:liftingResult:", v60, v61, v39, v63, v65, v67, v107, v105, v103, v71, v72, v73, v74, v75, v76, v77, v78);
        previousValidScale = v79;
        if (v79 != -1.0)
          self->_previousValidScale = v79;
        else
LABEL_55:
          previousValidScale = self->_previousValidScale;
        __ABPKLogSharedInstance();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 134217984;
          *(double *)((char *)&buf + 4) = previousValidScale;
          _os_log_impl(&dword_210836000, v81, OS_LOG_TYPE_DEBUG, " Estimated Scale: %f ", (uint8_t *)&buf, 0xCu);
        }

        *(float *)&v82 = previousValidScale;
        -[NSObject setEstimatedScale:](v39, "setEstimatedScale:", v82);
        objc_msgSend(v110, "liftingSkeletonABPK");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v84 = previousValidScale;
        objc_msgSend(v83, "setEstimatedScale:", v84);

        objc_msgSend(v6, "timestamp");
        -[ABPKAlgorithm _endScaleEstimationSignpostWithTimestamp:](self, "_endScaleEstimationSignpostWithTimestamp:");
        __ABPKLogSharedInstance();
        v85 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_210836000, v85, OS_LOG_TYPE_DEBUG, " Performing retargeting ", (uint8_t *)&buf, 2u);
        }

        objc_msgSend(v6, "timestamp");
        -[ABPKAlgorithm _startRetargettingSignpostWithTimestamp:](self, "_startRetargettingSignpostWithTimestamp:");
        -[ABPKRetargeting processData:](self->_retargeting, "processData:", v39);
        v58 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "algState");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setRetargeting:", 1);

        v87 = (const void *)-[NSObject jointModelTransforms](v58, "jointModelTransforms");
        v88 = -[NSObject jointModelTransforms](v58, "jointModelTransforms");
        v89 = -[NSObject jointTransformCount](v58, "jointTransformCount");
        buf = 0uLL;
        v117 = 0;
        std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(&buf, v87, v88 + (v89 << 6), (v88 + (v89 << 6) - (uint64_t)v87) >> 6);
        v90 = (const void *)-[NSObject jointLocalTransforms](v58, "jointLocalTransforms");
        v91 = -[NSObject jointLocalTransforms](v58, "jointLocalTransforms");
        v92 = -[NSObject jointTransformCount](v58, "jointTransformCount");
        __p = 0;
        v112 = 0;
        v113 = 0;
        std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(&__p, v90, v91 + (v92 << 6), (v91 + (v92 << 6) - (uint64_t)v90) >> 6);
        objc_msgSend(v110, "retargetedSkeletonABPK");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setModelPoses:andUpdateLocalPoses:", (_QWORD)buf, 0);

        objc_msgSend(v110, "retargetedSkeletonABPK");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject cameraFromBodyPose](v46, "cameraFromBodyPose");
        objc_msgSend(v94, "setCameraRootTransform:");

        objc_msgSend(v110, "retargetedSkeletonABPK");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v96 = previousValidScale;
        objc_msgSend(v95, "setEstimatedScale:", v96);

        objc_msgSend(v6, "timestamp");
        -[ABPKAlgorithm _endRetargettingSignpostWithTimestamp:](self, "_endRetargettingSignpostWithTimestamp:");
        objc_msgSend(v110, "retargetedSkeletonABPK");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "computeHeight");
        v99 = v98;

        __ABPKLogSharedInstance();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v114 = 134217984;
          v115 = v99;
          _os_log_impl(&dword_210836000, v100, OS_LOG_TYPE_DEBUG, " skeletonHeight: %f ", v114, 0xCu);
        }

        __ABPKLogSharedInstance();
        v101 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v114 = 134217984;
          v115 = previousValidScale;
          _os_log_impl(&dword_210836000, v101, OS_LOG_TYPE_DEBUG, " Estimated Scale: %f ", v114, 0xCu);
        }

        objc_msgSend(v6, "timestamp");
        -[ABPKAlgorithm _endABPKRunWithInputSignpostWithTimestamp:](self, "_endABPKRunWithInputSignpostWithTimestamp:");
        if (__p)
        {
          v112 = __p;
          operator delete(__p);
        }
        if ((_QWORD)buf)
        {
          *((_QWORD *)&buf + 1) = buf;
          operator delete((void *)buf);
        }
      }

    }
    v15 = 0;
    goto LABEL_70;
  }
  __ABPKLogSharedInstance();
  v14 = (ABPK2dSkeleton *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_210836000, &v14->super, OS_LOG_TYPE_ERROR, " 2D Pose estimation failed. ", (uint8_t *)&buf, 2u);
  }
  v15 = -6661;
LABEL_37:

  return v15;
}

- (void)_startInitABPKSignpost
{
  kdebug_trace();
}

- (void)_endInitABPKSignpost
{
  kdebug_trace();
}

- (void)_startABPKRunWithInputSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endABPKRunWithInputSignpostWithTimestamp:(double)a3
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
  objc_storeStrong((id *)&self->_retargeting, 0);
  objc_storeStrong((id *)&self->_scaleEstimation, 0);
  objc_storeStrong((id *)&self->_bodyRegistration, 0);
  objc_storeStrong((id *)&self->_liftingAlgorithm, 0);
  objc_storeStrong((id *)&self->_postprocess2d, 0);
  objc_storeStrong((id *)&self->_poseEstimation2D, 0);
  objc_storeStrong((id *)&self->_algParams, 0);
}

@end

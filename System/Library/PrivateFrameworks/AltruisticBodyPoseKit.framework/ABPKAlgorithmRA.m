@implementation ABPKAlgorithmRA

- (ABPKAlgorithmRA)initWithCameraParams:(id)a3
{
  return -[ABPKAlgorithmRA initWithCameraParams:andAlgorithmMode:](self, "initWithCameraParams:andAlgorithmMode:", a3, 1);
}

- (ABPKAlgorithmRA)initWithCameraParams:(id)a3 andAlgorithmMode:(int64_t)a4
{
  id v6;
  char *v7;
  ABPKAlgInput *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  ABPK2DDetectionConfiguration *v12;
  ABPKImagePreProcessingParams *v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  ABPKAlgorithmParams *v21;
  void *v22;
  ABPKAlgorithm *v23;
  void *v24;
  ABPKImagePreProcessing *v25;
  void *v26;
  NSObject *v27;
  const __CFDictionary *v28;
  NSObject *v29;
  ABPKAlgorithmRA *v30;
  const char *v31;
  uint8_t v33[8];
  objc_super v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ABPKAlgorithmRA;
  v7 = -[ABPKAlgorithmRA init](&v34, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(ABPKAlgInput);
    v9 = (void *)*((_QWORD *)v7 + 24);
    *((_QWORD *)v7 + 24) = v8;

    objc_storeStrong((id *)v7 + 5, a3);
    *((_QWORD *)v7 + 2) = 7;
    objc_msgSend(*((id *)v7 + 5), "inputRes");
    *((_QWORD *)v7 + 3) = v10;
    *((_QWORD *)v7 + 4) = v11;
    v12 = -[ABPK2DDetectionConfiguration initWithAlgorithmMode:]([ABPK2DDetectionConfiguration alloc], "initWithAlgorithmMode:", 1);
    if (v12)
    {
      v13 = -[ABPKImagePreProcessingParams initWithType:inputResolution:outputResolution:]([ABPKImagePreProcessingParams alloc], "initWithType:inputResolution:outputResolution:", 2, *((double *)v7 + 3), *((double *)v7 + 4), *((double *)v7 + 10), *((double *)v7 + 11));
      v14 = (void *)*((_QWORD *)v7 + 13);
      *((_QWORD *)v7 + 13) = v13;

      if (*((_QWORD *)v7 + 13))
      {
        *((_OWORD *)v7 + 7) = *(_OWORD *)(v7 + 24);
        objc_msgSend(*((id *)v7 + 5), "intrinsics");
        *((_DWORD *)v7 + 34) = v15;
        *((_QWORD *)v7 + 16) = v16;
        *((_DWORD *)v7 + 38) = v17;
        *((_QWORD *)v7 + 18) = v18;
        *((_DWORD *)v7 + 42) = v19;
        *((_QWORD *)v7 + 20) = v20;
        v21 = -[ABPKAlgorithmParams initWithRegIntrinsics:regImageResolution:]([ABPKAlgorithmParams alloc], "initWithRegIntrinsics:regImageResolution:", *((double *)v7 + 16), *((double *)v7 + 18), *((double *)v7 + 20), *((double *)v7 + 14), *((double *)v7 + 15));
        v22 = (void *)*((_QWORD *)v7 + 6);
        *((_QWORD *)v7 + 6) = v21;

        objc_msgSend(*((id *)v7 + 6), "setConfig2DDetection:", v12);
        v23 = -[ABPKAlgorithm initWithParams:]([ABPKAlgorithm alloc], "initWithParams:", *((_QWORD *)v7 + 6));
        v24 = (void *)*((_QWORD *)v7 + 1);
        *((_QWORD *)v7 + 1) = v23;

        if (!*((_QWORD *)v7 + 1))
        {
          v30 = 0;
LABEL_23:

          goto LABEL_24;
        }
        v25 = -[ABPKImagePreProcessing initWithPreProcessingParams:]([ABPKImagePreProcessing alloc], "initWithPreProcessingParams:", *((_QWORD *)v7 + 13));
        v26 = (void *)*((_QWORD *)v7 + 12);
        *((_QWORD *)v7 + 12) = v25;

        if (*((_QWORD *)v7 + 12))
        {
          __ABPKLogSharedInstance();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v33 = 0;
            _os_log_impl(&dword_210836000, v27, OS_LOG_TYPE_DEBUG, " Image Preprocessing ", v33, 2u);
          }

          v35 = *MEMORY[0x24BDC5668];
          v36[0] = MEMORY[0x24BDBD1B8];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
          v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (unint64_t)*((double *)v7 + 10), (unint64_t)*((double *)v7 + 11), 0x42475241u, v28, (CVPixelBufferRef *)v7 + 22))
          {
            v30 = v7;
            goto LABEL_22;
          }
          __ABPKLogSharedInstance();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v33 = 0;
            _os_log_impl(&dword_210836000, v29, OS_LOG_TYPE_ERROR, " Could not create mlImage buffer of type kCVPixelFormatType_32BGRA ", v33, 2u);
          }

LABEL_21:
          v30 = 0;
LABEL_22:

          goto LABEL_23;
        }
        __ABPKLogSharedInstance();
        v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        *(_WORD *)v33 = 0;
        v31 = " Could not initialize imagePreprocessor ";
      }
      else
      {
        __ABPKLogSharedInstance();
        v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        *(_WORD *)v33 = 0;
        v31 = " Failed to initialize Image Preprocessing Parameters ";
      }
    }
    else
    {
      __ABPKLogSharedInstance();
      v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      *(_WORD *)v33 = 0;
      v31 = " Failed to initialize config for 2D Detection module ";
    }
    _os_log_impl(&dword_210836000, (os_log_t)v28, OS_LOG_TYPE_ERROR, v31, v33, 2u);
    goto LABEL_21;
  }
  v30 = 0;
LABEL_24:

  return v30;
}

- (void)dealloc
{
  __CVBuffer *mlImage;
  objc_super v4;

  mlImage = self->_mlImage;
  if (mlImage)
    CVPixelBufferRelease(mlImage);
  v4.receiver = self;
  v4.super_class = (Class)ABPKAlgorithmRA;
  -[ABPKAlgorithmRA dealloc](&v4, sel_dealloc);
}

- (void)setExitPoint:(int64_t)a3
{
  self->_exitPoint = a3;
  -[ABPKAlgorithm setExitPoint:](self->_abpkAlgorithm, "setExitPoint:");
}

- (void)runABPKAlgorithmWithInputData:(id)a3 andGetOutput:(id)a4
{
  id v6;
  id v7;
  double v8;
  ABPKAlgorithmState *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  ABPKAlgOutput *algorithmOutput;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  NSObject *v27;
  double v28;
  uint8_t v29[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[ABPKAlgorithmRA _startExecuteAlgorithmSignpost](self, "_startExecuteAlgorithmSignpost");
  +[ABPKTime nowInSeconds](ABPKTime, "nowInSeconds");
  *(float *)&v8 = v8;
  objc_msgSend(v7, "setTimeABPKAlgorithmStart:", v8);
  objc_msgSend(v7, "setAlgorithmParams:", self->_algParams);
  v9 = objc_alloc_init(ABPKAlgorithmState);
  objc_msgSend(v7, "setAlgState:", v9);

  objc_msgSend(v6, "timestamp");
  objc_msgSend(v7, "setTimestamp:");
  -[ABPKAlgorithmRA _startImagePreprocessingSignpost](self, "_startImagePreprocessingSignpost");
  LODWORD(v9) = -[ABPKAlgorithmRA preprocessInputImage:](self, "preprocessInputImage:", objc_msgSend(v6, "image"));
  -[ABPKAlgorithmRA _endImagePreprocessingSignpost](self, "_endImagePreprocessingSignpost");
  if ((_DWORD)v9)
  {
    __ABPKLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_DEFAULT, " Could not preprocess input data ", buf, 2u);
    }

    objc_msgSend(v7, "setAlgorithmReturnCode:", 4294960636);
  }
  else
  {
    objc_msgSend(v7, "algState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage_preprocessing:", 1);

    objc_msgSend(v7, "setMlImage:", self->_mlImage);
    if (self->_exitPoint)
    {
      -[ABPKAlgorithmRA _startABPKAlgoInitSignpost](self, "_startABPKAlgoInitSignpost");
      -[ABPKAlgInput setImage:](self->_algorithmInput, "setImage:", objc_msgSend(v7, "mlImage"));
      -[ABPKCameraParams inputRes](self->_abpkCameraParams, "inputRes");
      -[ABPKAlgInput setImageResolution:](self->_algorithmInput, "setImageResolution:");
      -[ABPKCameraParams intrinsics](self->_abpkCameraParams, "intrinsics");
      -[ABPKAlgInput setImageCameraIntrinsics:](self->_algorithmInput, "setImageCameraIntrinsics:");
      -[ABPKAlgInput setDepthMap:](self->_algorithmInput, "setDepthMap:", objc_msgSend(v6, "depthMap"));
      -[ABPKAlgInput setImagePreProcessingParams:](self->_algorithmInput, "setImagePreProcessingParams:", self->_imagePreProcessingParams);
      objc_msgSend(v6, "timestamp");
      -[ABPKAlgInput setTimestamp:](self->_algorithmInput, "setTimestamp:");
      -[ABPKAlgInput setDepthConfidenceBuffer:](self->_algorithmInput, "setDepthConfidenceBuffer:", objc_msgSend(v6, "depthConfidenceBuffer"));
      -[ABPKAlgInput setIsDepthDataValid:](self->_algorithmInput, "setIsDepthDataValid:", objc_msgSend(v6, "isDepthDataValid"));
      objc_msgSend(v7, "algState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABPKAlgOutput setAlgState:](self->_algorithmOutput, "setAlgState:", v12);

      -[ABPKAlgorithmRA _endABPKAlgoInitSignpost](self, "_endABPKAlgoInitSignpost");
      v13 = -[ABPKAlgorithm runWithInput:andGetOutput:](self->_abpkAlgorithm, "runWithInput:andGetOutput:", self->_algorithmInput, self->_algorithmOutput);
      algorithmOutput = self->_algorithmOutput;
      objc_msgSend(v6, "vioPose");
      -[ABPKAlgorithmRA computeRootTransforms:withVioPose:withVioPoseValidity:](self, "computeRootTransforms:withVioPose:withVioPoseValidity:", algorithmOutput, objc_msgSend(v6, "isVioPoseValid"), v15, v16, v17, v18);
      -[ABPKAlgOutput rawDetection2dSkeletonABPK](self->_algorithmOutput, "rawDetection2dSkeletonABPK");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRawDetection2dSkeletonABPK:", v19);

      -[ABPKAlgOutput rawDetection2dSkeletonABPKArray](self->_algorithmOutput, "rawDetection2dSkeletonABPKArray");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRawDetection2dSkeletonABPKArray:", v20);

      -[ABPKAlgOutput detection2dSkeletonABPK](self->_algorithmOutput, "detection2dSkeletonABPK");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDetection2dSkeletonABPK:", v21);

      -[ABPKAlgOutput liftingSkeletonABPK](self->_algorithmOutput, "liftingSkeletonABPK");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLiftingSkeletonABPK:", v22);

      -[ABPKAlgOutput registered2dSkeletonABPK](self->_algorithmOutput, "registered2dSkeletonABPK");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRegistered2dSkeletonABPK:", v23);

      -[ABPKAlgOutput retargetedSkeletonABPK](self->_algorithmOutput, "retargetedSkeletonABPK");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRetargetedSkeletonABPK:", v24);

      -[ABPKAlgOutput algState](self->_algorithmOutput, "algState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlgState:", v25);

      objc_msgSend(v7, "setAlgorithmReturnCode:", v13);
      -[ABPKAlgorithmRA _endExecuteAlgorithmSignpost](self, "_endExecuteAlgorithmSignpost");
      +[ABPKTime nowInSeconds](ABPKTime, "nowInSeconds");
      *(float *)&v26 = v26;
      objc_msgSend(v7, "setTimeABPKAlgorithmFinished:", v26);
    }
    else
    {
      __ABPKLogSharedInstance();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_210836000, v27, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPointImagePreProcessing ", v29, 2u);
      }

      +[ABPKTime nowInSeconds](ABPKTime, "nowInSeconds");
      *(float *)&v28 = v28;
      objc_msgSend(v7, "setTimeABPKAlgorithmFinished:", v28);
    }
  }

}

- (void)computeRootTransforms:(uint64_t)a1 withVioPose:(uint64_t)a2 withVioPoseValidity:(void *)a3
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  float32x4_t v26;
  double v27;
  float32x4_t v28;
  double v29;
  float32x4_t v30;
  double v31;
  float32x4_t v32;
  double v33;
  id v34;
  _OWORD v35[4];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v34 = a3;
  objc_msgSend(*(id *)(a1 + 40), "extrinsics");
  v30 = v5;
  v32 = v4;
  v26 = v7;
  v28 = v6;
  objc_msgSend(v34, "liftingSkeletonABPK");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cameraRootTransform");
  v22 = v10;
  v23 = v9;
  v24 = v12;
  v25 = v11;
  objc_msgSend(v34, "liftingSkeletonABPK");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = 0;
  v35[0] = v23;
  v35[1] = v22;
  v35[2] = v25;
  v35[3] = v24;
  do
  {
    *(__int128 *)((char *)&v36 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(v35[v15])), v30, *(float32x2_t *)&v35[v15], 1), v28, (float32x4_t)v35[v15], 2), v26, (float32x4_t)v35[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  objc_msgSend(v13, "setDeviceRootTransform:", *(double *)&v36, *(double *)&v37, *(double *)&v38, *(double *)&v39);

  objc_msgSend(v34, "liftingSkeletonABPK");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deviceRootTransform");
  v31 = v18;
  v33 = v17;
  v27 = v20;
  v29 = v19;
  objc_msgSend(v34, "retargetedSkeletonABPK");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDeviceRootTransform:", v33, v31, v29, v27);

}

- (int)preprocessInputImage:(__CVBuffer *)a3
{
  NSObject *v5;
  uint8_t v7[16];

  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_DEBUG, " Pre-processing image ", v7, 2u);
  }

  return -[ABPKImagePreProcessing preprocessData:outputBuffer:](self->_imagePreprocessor, "preprocessData:outputBuffer:", a3, self->_mlImage);
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

- (void)_startABPKAlgoInitSignpost
{
  kdebug_trace();
}

- (void)_endABPKAlgoInitSignpost
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmOutput, 0);
  objc_storeStrong((id *)&self->_algorithmInput, 0);
  objc_storeStrong((id *)&self->_saveDirectory, 0);
  objc_storeStrong((id *)&self->_imagePreProcessingParams, 0);
  objc_storeStrong((id *)&self->_imagePreprocessor, 0);
  objc_storeStrong((id *)&self->_paddingParameters, 0);
  objc_storeStrong((id *)&self->_cropParameters, 0);
  objc_storeStrong((id *)&self->_imagePreProcessingType, 0);
  objc_storeStrong((id *)&self->_algParams, 0);
  objc_storeStrong((id *)&self->_abpkCameraParams, 0);
  objc_storeStrong((id *)&self->_abpkAlgorithm, 0);
}

@end

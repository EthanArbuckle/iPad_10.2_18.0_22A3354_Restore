@implementation ABPK2DPoseEstimation

- (ABPK2DPoseEstimation)initWith2DDetectionConfig:(id)a3 use3DSkeletonForExtrapolation:(BOOL)a4 shouldPush3DSupportSkeleton:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;
  ABPK2DPoseEstimation *v10;
  ABPK2DPoseEstimation *v11;
  ABPK2DDetection *v12;
  ABPK2DDetection *detection2dAlgorithm;
  uint64_t v14;
  ABPK2DDetectionPostprocess *postprocess2d;
  ABPK2DPoseEstimation *v16;
  NSObject *v17;
  const char *v18;
  __int16 v20[8];
  objc_super v21;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ABPK2DPoseEstimation;
  v10 = -[ABPK2DPoseEstimation init](&v21, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_4;
  objc_storeStrong((id *)&v10->_config2D, a3);
  v12 = -[ABPK2DDetection initWithNetworkConfig:]([ABPK2DDetection alloc], "initWithNetworkConfig:", v11->_config2D);
  detection2dAlgorithm = v11->_detection2dAlgorithm;
  v11->_detection2dAlgorithm = v12;

  if (!v11->_detection2dAlgorithm)
  {
    __ABPKLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 0;
      v18 = " Failed to initialize 2D Detection Algorithm. ";
LABEL_9:
      _os_log_impl(&dword_210836000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)v20, 2u);
    }
LABEL_10:

    v16 = 0;
    goto LABEL_11;
  }
  +[ABPK2DDetectionPostProcessSelector get2DDetectionPostProcessWithNetworkConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:](ABPK2DDetectionPostProcessSelector, "get2DDetectionPostProcessWithNetworkConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:", v9, v6, v5, 0.3);
  v14 = objc_claimAutoreleasedReturnValue();
  postprocess2d = v11->_postprocess2d;
  v11->_postprocess2d = (ABPK2DDetectionPostprocess *)v14;

  if (!v11->_postprocess2d)
  {
    __ABPKLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 0;
      v18 = " Failed to initialize 2D Detection Post-processing. ";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v16 = v11;
LABEL_11:

  return v16;
}

- (int)runWithMLImageData:(id)a3 rotationOfResultTensor:(int64_t)a4
{
  id v6;
  ABPK2DDetection *detection2dAlgorithm;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  ABPK2DDetectionPostprocess *postprocess2d;
  void *v13;
  int v14;
  uint8_t v16[16];

  v6 = a3;
  detection2dAlgorithm = self->_detection2dAlgorithm;
  v8 = objc_msgSend(v6, "pixelBuffer");
  v9 = objc_msgSend(v6, "abpkDeviceOrientation");
  objc_msgSend(v6, "timestamp");
  -[ABPK2DDetection runWithImage:abpkOrientation:atTimestamp:rotationOfResultTensor:](detection2dAlgorithm, "runWithImage:abpkOrientation:atTimestamp:rotationOfResultTensor:", v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    __ABPKLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_DEBUG, " \t Post-processing output ", v16, 2u);
    }

    postprocess2d = self->_postprocess2d;
    objc_msgSend(v6, "preprocessingParams");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timestamp");
    LODWORD(postprocess2d) = -[ABPK2DDetectionPostprocess extract2DSkeletonfromBuffers:withImagePreProcessingParams:atTimestamp:previousSkeleton3D:](postprocess2d, "extract2DSkeletonfromBuffers:withImagePreProcessingParams:atTimestamp:previousSkeleton3D:", v10, v13, 0);

    if ((_DWORD)postprocess2d)
      v14 = -6661;
    else
      v14 = 0;
  }
  else
  {
    v14 = -6661;
  }

  return v14;
}

- (void)getRawTrackedHumanSkeleton:(id)a3
{
  -[ABPK2DDetectionPostprocess getRawTrackedHumanSkeleton:](self->_postprocess2d, "getRawTrackedHumanSkeleton:", a3);
}

- (void)getRawTrackedHumanSkeletonVector:(id)a3
{
  -[ABPK2DDetectionPostprocess getRawTrackedHumanSkeletonVector:](self->_postprocess2d, "getRawTrackedHumanSkeletonVector:", a3);
}

- (void)getTrackedHumanSkeleton:(id)a3
{
  -[ABPK2DDetectionPostprocess getTrackedHumanSkeleton:](self->_postprocess2d, "getTrackedHumanSkeleton:", a3);
}

- (void)getTrackedHumanForLiftingSkeleton:(id)a3
{
  -[ABPK2DDetectionPostprocess getTrackedHumanForLiftingSkeleton:](self->_postprocess2d, "getTrackedHumanForLiftingSkeleton:", a3);
}

- (void)getRawTrackedHumanForLiftingSkeleton:(id)a3
{
  -[ABPK2DDetectionPostprocess getRawTrackedHumanForLiftingSkeleton:](self->_postprocess2d, "getRawTrackedHumanForLiftingSkeleton:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postprocess2d, 0);
  objc_storeStrong((id *)&self->_detection2dAlgorithm, 0);
  objc_storeStrong((id *)&self->_config2D, 0);
}

@end

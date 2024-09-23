@implementation ABPK2DDetectionPostprocessHeatmapAffinitymap

- (ABPK2DDetectionPostprocessHeatmapAffinitymap)initWithInputJoints:(unint64_t)a3 andOutputJoints:(unint64_t)a4 use3DSkeletonForExtrapolation:(BOOL)a5 shouldPush3DSupportSkeleton:(BOOL)a6 withExtrapolationTime:(double)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  ABPK2DDetectionPostprocessHeatmapAffinitymap *v12;
  ABPK2DDetectionPostprocessHeatmapAffinitymap *v13;
  ABPK2DDetectionPostprocessGPU *v14;
  ABPK2DDetectionPostprocessGPU *postprocessorGPU;
  ABPK2DExtrapolationFiltering *v16;
  ABPK2DExtrapolationFiltering *extrapolationFiltering;
  NSObject *v18;
  NSObject *v19;
  unint64_t numberOfInputJoints;
  NSObject *v21;
  unint64_t numberOfOutputJoints;
  objc_super v24;
  uint8_t buf[4];
  unint64_t v26;
  uint64_t v27;

  v8 = a6;
  v9 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)ABPK2DDetectionPostprocessHeatmapAffinitymap;
  v12 = -[ABPK2DDetectionPostprocessHeatmapAffinitymap init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_numberOfInputJoints = a3;
    v12->_numberOfOutputJoints = a4;
    v14 = -[ABPK2DDetectionPostprocessGPU initWithNumberOfChannels:]([ABPK2DDetectionPostprocessGPU alloc], "initWithNumberOfChannels:", v12->_numberOfInputJoints);
    postprocessorGPU = v13->_postprocessorGPU;
    v13->_postprocessorGPU = v14;

    v16 = -[ABPK2DExtrapolationFiltering initWithUse3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:]([ABPK2DExtrapolationFiltering alloc], "initWithUse3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:", v9, v8, a7);
    extrapolationFiltering = v13->_extrapolationFiltering;
    v13->_extrapolationFiltering = v16;

    v13->_humansDetected = 1;
    __ABPKLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v18, OS_LOG_TYPE_DEBUG, " ABPK2DDetectionPostprocessHeatmapAffinitymap: Initializing ", buf, 2u);
    }

    __ABPKLogSharedInstance();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      numberOfInputJoints = v13->_numberOfInputJoints;
      *(_DWORD *)buf = 134217984;
      v26 = numberOfInputJoints;
      _os_log_impl(&dword_210836000, v19, OS_LOG_TYPE_DEBUG, " \t Number of input joints: %zu ", buf, 0xCu);
    }

    __ABPKLogSharedInstance();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      numberOfOutputJoints = v13->_numberOfOutputJoints;
      *(_DWORD *)buf = 134217984;
      v26 = numberOfOutputJoints;
      _os_log_impl(&dword_210836000, v21, OS_LOG_TYPE_DEBUG, " \t Number of output joints: %zu ", buf, 0xCu);
    }

  }
  return v13;
}

- (int)extract2DSkeletonfromBuffers:(id)a3 withImagePreProcessingParams:(id)a4 atTimestamp:(double)a5 previousSkeleton3D:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *BaseAddress;
  int8x8_t v16;
  int8x8_t v17;
  int8x8_t v18;
  __int128 v19;
  int v20;
  int v21;
  int v22;
  IOSurfaceRef IOSurface;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD *v31;
  _QWORD *v32;
  double v33;
  double v34;
  float64x2_t v35;
  _QWORD *v36;
  _QWORD *v37;
  float v38;
  double v40;
  float v41;
  float32x2_t v42;
  NSObject *v43;
  ABPK2DExtrapolationFiltering *extrapolationFiltering;
  int v45;
  NSObject *v46;
  NSObject *v47;
  double v49;
  double v50;
  int8x8_t v51;
  float64x2_t v52;
  __int128 v53;
  uint64_t v54;
  uint8_t v55[16];
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  unsigned int v59;
  _QWORD v60[3];
  uint64_t v61;
  __int128 v62;
  uint8_t buf[8];
  __int128 v64;
  uint8_t *v65;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[ABPK2DDetectionPostprocessHeatmapAffinitymap _startExtract2DSkeletonSignpostWithTimestamp:](self, "_startExtract2DSkeletonSignpostWithTimestamp:", a5);
  __ABPKLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " ABPK2DDetectionPostprocessHeatmapAffinitymap: Extracting 2D skeleton from buffers ", buf, 2u);
  }

  objc_storeStrong((id *)&self->_imagePreProcessingParams, a4);
  v14 = objc_msgSend(v10, "rotationNeeded");
  CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v10, "heatMapBuffer"), 0);
  CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v10, "affinityMapBuffer"), 0);
  BaseAddress = CVPixelBufferGetBaseAddress((CVPixelBufferRef)objc_msgSend(v10, "affinityMapBuffer"));
  objc_msgSend(v10, "affinityMapShape");
  v51 = v16;
  objc_msgSend(v10, "affinityMapShape");
  *(_QWORD *)buf = self->_numberOfInputJoints + 1;
  v18 = vext_s8(v51, v17, 4uLL);
  *(_QWORD *)&v19 = v18.i32[0];
  *((_QWORD *)&v19 + 1) = v18.i32[1];
  v64 = v19;
  v61 = 36;
  v62 = v19;
  objc_msgSend(v10, "affinityMapStrides");
  v60[0] = v20;
  objc_msgSend(v10, "affinityMapStrides");
  v60[1] = v21;
  objc_msgSend(v10, "affinityMapStrides");
  v60[2] = v22;
  v59 = 0;
  IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v10, "heatMapBuffer"));
  -[ABPK2DDetectionPostprocessHeatmapAffinitymap _startMaxFilterSignpostWithTimestamp:](self, "_startMaxFilterSignpostWithTimestamp:", a5);
  v24 = -[ABPK2DDetectionPostprocessGPU process:counter:shape:](self->_postprocessorGPU, "process:counter:shape:", IOSurface, &v59, (double)*((unint64_t *)&v19 + 1), (double)(unint64_t)v19);
  -[ABPK2DDetectionPostprocessHeatmapAffinitymap _endMaxFilterSignpostWithTimestamp:](self, "_endMaxFilterSignpostWithTimestamp:", a5);
  -[ABPK2DDetectionPostprocessHeatmapAffinitymap _startExtractHumanSignpostWithTimestamp:](self, "_startExtractHumanSignpostWithTimestamp:", a5);
  v57 = 0uLL;
  v58 = 0;
  if (self->_numberOfInputJoints == 17)
    abpk::extractHumansLegacy(v24, v24, (uint64_t)BaseAddress, (uint64_t *)buf, (uint64_t)&v61, v60, 0, v59, (uint64_t *)v55);
  else
    abpk::extractHumans(v24, v24, (uint64_t)BaseAddress, (uint64_t *)buf, (uint64_t)&v61, v60, 0, v59, (uint64_t *)v55);
  std::vector<abpk::Human>::__vdeallocate((void **)&v57);
  v57 = *(_OWORD *)v55;
  v58 = v56;
  v56 = 0;
  memset(v55, 0, sizeof(v55));
  v65 = v55;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)&v65);
  -[ABPK2DDetectionPostprocessHeatmapAffinitymap _endExtractHumanSignpostWithTimestamp:](self, "_endExtractHumanSignpostWithTimestamp:", a5);
  CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v10, "heatMapBuffer"), 0);
  CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v10, "affinityMapBuffer"), 0);
  CVPixelBufferRelease((CVPixelBufferRef)objc_msgSend(v10, "heatMapBuffer"));
  CVPixelBufferRelease((CVPixelBufferRef)objc_msgSend(v10, "affinityMapBuffer"));
  if (*((_QWORD *)&v57 + 1) == (_QWORD)v57)
  {
    if (self->_humansDetected)
    {
      __ABPKLogSharedInstance();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_210836000, v47, OS_LOG_TYPE_DEBUG, " No humans detected in the image ", v55, 2u);
      }

      self->_humansDetected = 0;
    }
    v45 = -6661;
  }
  else
  {
    if (!self->_humansDetected)
    {
      __ABPKLogSharedInstance();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_210836000, v25, OS_LOG_TYPE_DEBUG, " Humans detected in the image ", v55, 2u);
      }

      self->_humansDetected = 1;
    }
    __ABPKLogSharedInstance();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_210836000, v26, OS_LOG_TYPE_DEBUG, " \t Converting 2d points from ML space to image space ", v55, 2u);
    }

    objc_msgSend(v11, "inputResolution");
    v49 = v27;
    v50 = v28;
    objc_msgSend(v11, "outputResolution");
    v32 = (_QWORD *)*((_QWORD *)&v57 + 1);
    v31 = (_QWORD *)v57;
    if ((_QWORD)v57 != *((_QWORD *)&v57 + 1))
    {
      v33 = v29;
      v34 = v30;
      v35.f64[0] = v49;
      v35.f64[1] = v50;
      v52 = v35;
      do
      {
        v36 = (_QWORD *)*v31;
        v37 = (_QWORD *)v31[1];
        while (v36 != v37)
        {
          LODWORD(v38) = HIDWORD(*v36);
          if (COERCE_FLOAT(*v36) != -1.0 && v38 != -1.0)
          {
            *(float *)&v40 = v33 * COERCE_FLOAT(*v36);
            v41 = v34 * v38;
            *((float *)&v40 + 1) = v41;
            +[ABPKImagePreProcessingParams convert2DPoint:toInputSpaceWithParams:](ABPKImagePreProcessingParams, "convert2DPoint:toInputSpaceWithParams:", v11, v40);
            *v36 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v42), v52));
          }
          ++v36;
        }
        v31 += 15;
      }
      while (v31 != v32);
    }
    -[ABPK2DDetectionPostprocessHeatmapAffinitymap _startExtrapolationSignpostWithTimestamp:](self, "_startExtrapolationSignpostWithTimestamp:", a5);
    __ABPKLogSharedInstance();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_210836000, v43, OS_LOG_TYPE_DEBUG, " \t Performing extrapolation ", v55, 2u);
    }

    extrapolationFiltering = self->_extrapolationFiltering;
    v53 = v57;
    v54 = v58;
    v58 = 0;
    v57 = 0uLL;
    v45 = -[ABPK2DExtrapolationFiltering performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:](extrapolationFiltering, "performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:", &v53, v14, v12, v49, v50, a5);
    *(_QWORD *)v55 = &v53;
    std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)v55);
    -[ABPK2DDetectionPostprocessHeatmapAffinitymap _endExtrapolationSignpostWithTimestamp:](self, "_endExtrapolationSignpostWithTimestamp:", a5);
    -[ABPK2DDetectionPostprocessHeatmapAffinitymap _endExtract2DSkeletonSignpostWithTimestamp:](self, "_endExtract2DSkeletonSignpostWithTimestamp:", a5);
    if (v45)
    {
      __ABPKLogSharedInstance();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_210836000, v46, OS_LOG_TYPE_ERROR, " 2D Extrapolation failed ", v55, 2u);
      }

    }
  }
  *(_QWORD *)v55 = &v57;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)v55);

  return v45;
}

- (void)getRawTrackedHumanSkeleton:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[ABPK2DDetectionPostprocessHeatmapAffinitymap rawTrackedHuman](self, "rawTrackedHuman");
  v5 = *v4;
  -[ABPKImagePreProcessingParams inputResolution](self->_imagePreProcessingParams, "inputResolution");
  objc_msgSend(v6, "setNormalizedKeypoints2d:withImageRes:", v5);
  objc_msgSend(v6, "setJointVisibility:", v4[3]);
  objc_msgSend(v6, "setJointConfidences:", v4[6]);
  objc_msgSend(v6, "setHasMissingJoints:", v4[13] < (unint64_t)((uint64_t)(v4[1] - *v4) >> 3));

}

- (void)getRawTrackedHumanSkeletonVector:(id)a3
{
  uint64_t **v4;
  uint64_t *v5;
  uint64_t *v6;
  ABPK2dSkeleton *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = -[ABPK2DDetectionPostprocessHeatmapAffinitymap rawTrackedHumanVector](self, "rawTrackedHumanVector");
  v5 = *v4;
  v6 = v4[1];
  if (*v4 != v6)
  {
    do
    {
      v7 = objc_alloc_init(ABPK2dSkeleton);
      v8 = *v5;
      -[ABPKImagePreProcessingParams inputResolution](self->_imagePreProcessingParams, "inputResolution");
      -[ABPK2dSkeleton setNormalizedKeypoints2d:withImageRes:](v7, "setNormalizedKeypoints2d:withImageRes:", v8);
      -[ABPK2dSkeleton setJointVisibility:](v7, "setJointVisibility:", v5[3]);
      -[ABPK2dSkeleton setJointConfidences:](v7, "setJointConfidences:", v5[6]);
      -[ABPK2dSkeleton setHasMissingJoints:](v7, "setHasMissingJoints:", v5[13] < (unint64_t)((v5[1] - *v5) >> 3));
      objc_msgSend(v9, "addObject:", v7);

      v5 += 15;
    }
    while (v5 != v6);
  }

}

- (void)getTrackedHumanSkeleton:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[ABPK2DDetectionPostprocessHeatmapAffinitymap trackedHuman](self, "trackedHuman");
  v5 = *v4;
  -[ABPKImagePreProcessingParams inputResolution](self->_imagePreProcessingParams, "inputResolution");
  objc_msgSend(v6, "setNormalizedKeypoints2d:withImageRes:", v5);
  objc_msgSend(v6, "setJointVisibility:", v4[3]);
  objc_msgSend(v6, "setJointConfidences:", v4[6]);
  objc_msgSend(v6, "setHasMissingJoints:", v4[13] < (unint64_t)((uint64_t)(v4[1] - *v4) >> 3));

}

- (void)getTrackedHumanForLiftingSkeleton:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[ABPK2DDetectionPostprocessHeatmapAffinitymap trackedHumanForLifting](self, "trackedHumanForLifting");
  v5 = *v4;
  -[ABPKImagePreProcessingParams inputResolution](self->_imagePreProcessingParams, "inputResolution");
  objc_msgSend(v6, "setNormalizedKeypoints2d:withImageRes:", v5);
  objc_msgSend(v6, "setJointVisibility:", v4[3]);
  objc_msgSend(v6, "setJointConfidences:", v4[6]);
  objc_msgSend(v6, "setHasMissingJoints:", v4[13] < (unint64_t)((uint64_t)(v4[1] - *v4) >> 3));

}

- (void)getRawTrackedHumanForLiftingSkeleton:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[ABPK2DDetectionPostprocessHeatmapAffinitymap rawTrackedHuman](self, "rawTrackedHuman");
  v5 = *v4;
  -[ABPKImagePreProcessingParams inputResolution](self->_imagePreProcessingParams, "inputResolution");
  objc_msgSend(v6, "setNormalizedKeypoints2d:withImageRes:", v5);
  objc_msgSend(v6, "setJointVisibility:", v4[3]);
  objc_msgSend(v6, "setJointConfidences:", v4[6]);

}

- (id)getAligned3DSkeleton
{
  return -[ABPK2DExtrapolationFiltering aligned3DSkeleton](self->_extrapolationFiltering, "aligned3DSkeleton");
}

- (id)get2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4
{
  uint64_t *v6;
  _QWORD *v7;
  ABPK2D3DLiftingData *v8;
  ABPK2DDetectionResult *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  ABPK2DDetectionResult *v15;

  v6 = -[ABPK2DDetectionPostprocessHeatmapAffinitymap trackedHuman](self, "trackedHuman");
  v7 = -[ABPK2DDetectionPostprocessHeatmapAffinitymap trackedHumanForLifting](self, "trackedHumanForLifting");
  if (v7[13] >= (unint64_t)((uint64_t)(v7[1] - *v7) >> 3))
    v8 = -[ABPK2D3DLiftingData initWithHumanForLifting:imageSize:rotation:croppedRect:]([ABPK2D3DLiftingData alloc], "initWithHumanForLifting:imageSize:rotation:croppedRect:", v7, a3, 1000.0, 1000.0, 0.0, 0.0, 1.0, 1.0);
  else
    v8 = 0;
  v9 = [ABPK2DDetectionResult alloc];
  v10 = *(_QWORD *)abpk::Human::jointVector((abpk::Human *)v6);
  v11 = v6[3];
  v14 = v6;
  v12 = *v6;
  v13 = v14[1];
  -[ABPKImagePreProcessingParams inputResolution](self->_imagePreProcessingParams, "inputResolution");
  v15 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:](v9, "initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:", v10, v11, (v13 - v12) >> 3, a3, v8);

  return v15;
}

- (id)getRaw2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4
{
  uint64_t *v6;
  ABPK2D3DLiftingData *v7;
  ABPK2DDetectionResult *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  ABPK2DDetectionResult *v14;

  v6 = -[ABPK2DDetectionPostprocessHeatmapAffinitymap rawTrackedHuman](self, "rawTrackedHuman");
  v7 = -[ABPK2D3DLiftingData initWithHumanForLifting:imageSize:rotation:croppedRect:]([ABPK2D3DLiftingData alloc], "initWithHumanForLifting:imageSize:rotation:croppedRect:", v6, a3, 1000.0, 1000.0, 0.0, 0.0, 1.0, 1.0);
  v8 = [ABPK2DDetectionResult alloc];
  v9 = *(_QWORD *)abpk::Human::jointVector((abpk::Human *)v6);
  v10 = v6[3];
  v13 = v6;
  v11 = *v6;
  v12 = v13[1];
  -[ABPKImagePreProcessingParams inputResolution](self->_imagePreProcessingParams, "inputResolution");
  v14 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:](v8, "initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:", v9, v10, (v12 - v11) >> 3, a3, v7);

  return v14;
}

- (const)rawTrackedHuman
{
  return -[ABPK2DExtrapolationFiltering rawTrackedHuman](self->_extrapolationFiltering, "rawTrackedHuman");
}

- (const)trackedHuman
{
  return -[ABPK2DExtrapolationFiltering trackedHuman](self->_extrapolationFiltering, "trackedHuman");
}

- (const)rawTrackedHumanVector
{
  return -[ABPK2DExtrapolationFiltering rawTrackedHumanVector](self->_extrapolationFiltering, "rawTrackedHumanVector");
}

- (const)trackedHumanForLifting
{
  return -[ABPK2DExtrapolationFiltering trackedHumanForLifting](self->_extrapolationFiltering, "trackedHumanForLifting");
}

- (void)_startExtract2DSkeletonSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endExtract2DSkeletonSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMaxFilterSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMaxFilterSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startExtractHumanSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endExtractHumanSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startExtrapolationSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endExtrapolationSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extrapolationFiltering, 0);
  objc_storeStrong((id *)&self->_imagePreProcessingParams, 0);
  objc_storeStrong((id *)&self->_postprocessorGPU, 0);
}

@end

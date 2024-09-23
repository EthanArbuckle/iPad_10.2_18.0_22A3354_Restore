@implementation ABPK2DDetectionPostprocessHeatmap

- (ABPK2DDetectionPostprocessHeatmap)initWithInputJoints:(unint64_t)a3 andOutputJoints:(unint64_t)a4 use3DSkeletonForExtrapolation:(BOOL)a5 shouldPush3DSupportSkeleton:(BOOL)a6 withExtrapolationTime:(double)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  ABPK2DDetectionPostprocessHeatmap *v12;
  ABPK2DDetectionPostprocessHeatmap *v13;
  ABPK2DExtrapolationFiltering *v14;
  ABPK2DExtrapolationFiltering *extrapolationFiltering;
  NSObject *v16;
  NSObject *v17;
  double v18;
  NSObject *v19;
  double v20;
  NSMutableArray *v21;
  NSMutableArray *trackedBodies;
  ABPKPersonIDTracker *v23;
  ABPKPersonIDTracker *abpkPersonIDTracker;
  NSObject *v25;
  NSObject *v26;
  int v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  double timeLastABPKTrackerRunThreshold;
  objc_super v33;
  uint8_t buf[4];
  double v35;
  uint64_t v36;

  v8 = a6;
  v9 = a5;
  v36 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)ABPK2DDetectionPostprocessHeatmap;
  v12 = -[ABPK2DDetectionPostprocessHeatmap init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_numberOfInputJoints = a3;
    v12->_numberOfOutputJoints = a4;
    v14 = -[ABPK2DExtrapolationFiltering initWithUse3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:]([ABPK2DExtrapolationFiltering alloc], "initWithUse3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:", v9, v8, a7);
    extrapolationFiltering = v13->_extrapolationFiltering;
    v13->_extrapolationFiltering = v14;

    v13->_saveKeypoints = 1;
    v13->_humansDetected = 1;
    __ABPKLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_DEBUG, " ABPK2DDetectionPostprocessHeatmap: Initializing ", buf, 2u);
    }

    __ABPKLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = *(double *)&v13->_numberOfInputJoints;
      *(_DWORD *)buf = 134217984;
      v35 = v18;
      _os_log_impl(&dword_210836000, v17, OS_LOG_TYPE_DEBUG, " \t Number of input joints: %zu ", buf, 0xCu);
    }

    __ABPKLogSharedInstance();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(double *)&v13->_numberOfOutputJoints;
      *(_DWORD *)buf = 134217984;
      v35 = v20;
      _os_log_impl(&dword_210836000, v19, OS_LOG_TYPE_DEBUG, " \t Number of output joints: %zu ", buf, 0xCu);
    }

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    trackedBodies = v13->_trackedBodies;
    v13->_trackedBodies = v21;

    v13->_abpkPersonTrackerFPS = 1;
    v23 = objc_alloc_init(ABPKPersonIDTracker);
    abpkPersonIDTracker = v13->_abpkPersonIDTracker;
    v13->_abpkPersonIDTracker = v23;

    v13->_abpkPersonIDTrackerSupportedOnDevice = 1;
    if (v13->_abpkPersonIDTracker)
    {
      __ABPKLogSharedInstance();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v25, OS_LOG_TYPE_DEBUG, " ABPKPersonIDTracker initialized in ABPK2DDetectionPostprocessHeatmap ", buf, 2u);
      }

      switch(v13->_abpkPersonTrackerFPS)
      {
        case 0:
          __ABPKLogSharedInstance();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 1015580809;
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            goto LABEL_25;
          *(_WORD *)buf = 0;
          v28 = " ABPKPersonIDTracker being initialized with fps: 60 ";
          break;
        case 1:
          __ABPKLogSharedInstance();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 1023969417;
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            goto LABEL_25;
          *(_WORD *)buf = 0;
          v28 = " ABPKPersonIDTracker being initialized with fps: 30 ";
          break;
        case 2:
          __ABPKLogSharedInstance();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 1045220557;
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            goto LABEL_25;
          *(_WORD *)buf = 0;
          v28 = " ABPKPersonIDTracker being initialized with fps: 5 ";
          break;
        case 3:
          __ABPKLogSharedInstance();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_210836000, v26, OS_LOG_TYPE_DEBUG, " ABPKPersonIDTracker being initialized with fps: 0 ", buf, 2u);
          }
          v27 = 2139095039;
          goto LABEL_25;
        default:
          goto LABEL_26;
      }
      _os_log_impl(&dword_210836000, v26, OS_LOG_TYPE_DEBUG, v28, buf, 2u);
LABEL_25:

      LODWORD(v13->_timeLastABPKTrackerRunThreshold) = v27;
LABEL_26:
      __ABPKLogSharedInstance();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        timeLastABPKTrackerRunThreshold = v13->_timeLastABPKTrackerRunThreshold;
        *(_DWORD *)buf = 134217984;
        v35 = timeLastABPKTrackerRunThreshold;
        _os_log_impl(&dword_210836000, v30, OS_LOG_TYPE_DEBUG, " ABPKPersonIDTracker _timeLastABPKTrackerRunThreshold: %f ", buf, 0xCu);
      }

      v13->_timeLastABPKTrackerRun = 0.0;
    }
    else
    {
      __ABPKLogSharedInstance();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v29, OS_LOG_TYPE_ERROR, " Failed to initialize ABPK Person ID Tracker ", buf, 2u);
      }

      v13->_abpkPersonIDTrackerSupportedOnDevice = 0;
    }
  }
  return v13;
}

- (int)extract2DSkeletonfromBuffers:(id)a3 withImagePreProcessingParams:(id)a4 atTimestamp:(double)a5 previousSkeleton3D:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  __CVBuffer *v14;
  int v15;
  __n128 v16;
  size_t BytesPerRow;
  void *BaseAddress;
  __n128 v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _QWORD *v32;
  _QWORD *v33;
  double v34;
  double v35;
  float64x2_t v36;
  _QWORD *v37;
  _QWORD *v38;
  float v39;
  double v41;
  float v42;
  float32x2_t v43;
  NSObject *v44;
  void *v45;
  size_t Width;
  void *v47;
  size_t Height;
  ABPKPersonIDTracker *abpkPersonIDTracker;
  void *v50;
  _BOOL4 v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  unint64_t numberOfOutputJoints;
  NSObject *v63;
  ABPK2DExtrapolationFiltering *extrapolationFiltering;
  __int128 *v65;
  int v66;
  ABPK2DExtrapolationFiltering *v67;
  int v68;
  NSObject *v69;
  int v70;
  double v72;
  __n128 v73;
  double v74;
  id v75;
  int v76;
  float64x2_t v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  uint8_t buf[8];
  uint64_t v83;
  _BYTE v84[12];
  __int16 v85;
  unint64_t v86;
  uint8_t v87[16];
  uint64_t v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v75 = a6;
  -[ABPK2DDetectionPostprocessHeatmap _startExtract2DSkeletonSignpostWithTimestamp:](self, "_startExtract2DSkeletonSignpostWithTimestamp:", a5);
  __ABPKLogSharedInstance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " ABPK2DDetectionPostprocessHeatmap: Extracting 2D skeleton from buffers ", buf, 2u);
  }

  objc_storeStrong((id *)&self->_imagePreProcessingParams, a4);
  v13 = objc_msgSend(v10, "rotationNeeded");
  v14 = (__CVBuffer *)objc_msgSend(v10, "heatMapBuffer");
  CVPixelBufferLockBaseAddress(v14, 1uLL);
  objc_msgSend(v10, "heatMapShape");
  v76 = v15;
  objc_msgSend(v10, "heatMapShape");
  v73 = v16;
  BytesPerRow = CVPixelBufferGetBytesPerRow(v14);
  -[ABPK2DDetectionPostprocessHeatmap _startMaxFilterSignpostWithTimestamp:](self, "_startMaxFilterSignpostWithTimestamp:", a5);
  -[ABPK2DDetectionPostprocessHeatmap _endMaxFilterSignpostWithTimestamp:](self, "_endMaxFilterSignpostWithTimestamp:", a5);
  -[ABPK2DDetectionPostprocessHeatmap _startExtractHumanSignpostWithTimestamp:](self, "_startExtractHumanSignpostWithTimestamp:", a5);
  BaseAddress = CVPixelBufferGetBaseAddress(v14);
  v19 = v73;
  v19.n128_u16[0] = 11878;
  abpk::parsePersonsfromHeatmapBuffer((uint64_t)BaseAddress, v73.n128_i32[1], BytesPerRow >> 1, (uint64_t *)buf, v19);
  __ABPKLogSharedInstance();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v87 = 134217984;
    *(_QWORD *)&v87[4] = 0x6DB6DB6DB6DB6DB7 * ((v83 - *(_QWORD *)buf) >> 3);
    _os_log_impl(&dword_210836000, v20, OS_LOG_TYPE_DEBUG, " \t Persons detected: %lu ", v87, 0xCu);
  }

  __ABPKLogSharedInstance();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v87 = 0;
    _os_log_impl(&dword_210836000, v21, OS_LOG_TYPE_DEBUG, " \t Converting person to human type ", v87, 2u);
  }

  abpk::filterValidPersons((__n128 **)buf, v76, v73.n128_i32[1], 0.099976);
  __ABPKLogSharedInstance();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v87 = 134217984;
    *(_QWORD *)&v87[4] = 0x6DB6DB6DB6DB6DB7 * ((v83 - *(_QWORD *)buf) >> 3);
    _os_log_impl(&dword_210836000, v22, OS_LOG_TYPE_DEBUG, " \t Valid Persons detected: %lu ", v87, 0xCu);
  }

  abpk::convertPersonsToHuman((uint64_t **)buf, self->_numberOfOutputJoints, (uint64_t *)v87);
  __ABPKLogSharedInstance();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v84 = 134217984;
    *(_QWORD *)&v84[4] = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(*(_QWORD *)&v87[8] - *(_QWORD *)v87) >> 3);
    _os_log_impl(&dword_210836000, v23, OS_LOG_TYPE_DEBUG, " \t Humans detected: %lu ", v84, 0xCu);
  }

  CVPixelBufferUnlockBaseAddress(v14, 1uLL);
  CVPixelBufferRelease(v14);
  -[ABPK2DDetectionPostprocessHeatmap _endExtractHumanSignpostWithTimestamp:](self, "_endExtractHumanSignpostWithTimestamp:", a5);
  v25 = *(_QWORD *)buf;
  v24 = v83;
  if (v83 != *(_QWORD *)buf)
  {
    if (!self->_humansDetected)
    {
      __ABPKLogSharedInstance();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v84 = 0;
        _os_log_impl(&dword_210836000, v26, OS_LOG_TYPE_DEBUG, " Humans detected in the image ", v84, 2u);
      }

      self->_humansDetected = 1;
      v25 = *(_QWORD *)buf;
      v24 = v83;
    }
    if (0x6DB6DB6DB6DB6DB7 * ((v24 - v25) >> 3) != 0xEEEEEEEEEEEEEEEFLL
                                                    * ((uint64_t)(*(_QWORD *)&v87[8] - *(_QWORD *)v87) >> 3))
    {
      __ABPKLogSharedInstance();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v84 = 0;
        _os_log_impl(&dword_210836000, v56, OS_LOG_TYPE_ERROR, " convertPersonsToHuman failed. Count difference. ", v84, 2u);
      }

      __ABPKLogSharedInstance();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v84 = 134217984;
        *(_QWORD *)&v84[4] = 0x6DB6DB6DB6DB6DB7 * ((v83 - *(_QWORD *)buf) >> 3);
        _os_log_impl(&dword_210836000, v57, OS_LOG_TYPE_ERROR, " Persons count: %zu ", v84, 0xCu);
      }

      __ABPKLogSharedInstance();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v84 = 134217984;
        *(_QWORD *)&v84[4] = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(*(_QWORD *)&v87[8] - *(_QWORD *)v87) >> 3);
        _os_log_impl(&dword_210836000, v58, OS_LOG_TYPE_ERROR, " Humans count %zu ", v84, 0xCu);
      }

      goto LABEL_69;
    }
    if (self->_numberOfOutputJoints != (uint64_t)(*(_QWORD *)(*(_QWORD *)v87 + 8) - **(_QWORD **)v87) >> 3)
    {
      __ABPKLogSharedInstance();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v84 = 0;
        _os_log_impl(&dword_210836000, v59, OS_LOG_TYPE_ERROR, " convertPersonsToHuman failed. Invalid number of joints in the converted human type. ", v84, 2u);
      }

      __ABPKLogSharedInstance();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v61 = (uint64_t)(*(_QWORD *)(*(_QWORD *)v87 + 8) - **(_QWORD **)v87) >> 3;
        numberOfOutputJoints = self->_numberOfOutputJoints;
        *(_DWORD *)v84 = 134218240;
        *(_QWORD *)&v84[4] = v61;
        v85 = 2048;
        v86 = numberOfOutputJoints;
        _os_log_impl(&dword_210836000, v60, OS_LOG_TYPE_ERROR, " Actual joints: %zu. Expected: %zu ", v84, 0x16u);
      }

      goto LABEL_69;
    }
    __ABPKLogSharedInstance();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_210836000, v27, OS_LOG_TYPE_DEBUG, " \t Converting 2d points from ML space to image space ", v84, 2u);
    }

    objc_msgSend(v11, "inputResolution");
    v72 = v28;
    v74 = v29;
    objc_msgSend(v11, "outputResolution");
    v32 = *(_QWORD **)v87;
    v33 = *(_QWORD **)&v87[8];
    if (*(_QWORD *)v87 != *(_QWORD *)&v87[8])
    {
      v34 = v30;
      v35 = v31;
      v36.f64[0] = v72;
      v36.f64[1] = v74;
      v77 = v36;
      do
      {
        v37 = (_QWORD *)*v32;
        v38 = (_QWORD *)v32[1];
        while (v37 != v38)
        {
          LODWORD(v39) = HIDWORD(*v37);
          if (COERCE_FLOAT(*v37) != -1.0 && v39 != -1.0)
          {
            *(float *)&v41 = v34 * COERCE_FLOAT(*v37);
            v42 = v35 * v39;
            *((float *)&v41 + 1) = v42;
            +[ABPKImagePreProcessingParams convert2DPoint:toInputSpaceWithParams:](ABPKImagePreProcessingParams, "convert2DPoint:toInputSpaceWithParams:", v11, v41);
            *v37 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v43), v77));
          }
          ++v37;
        }
        v32 += 15;
      }
      while (v32 != v33);
    }
    -[NSMutableArray removeAllObjects](self->_trackedBodies, "removeAllObjects");
    if (self->_abpkPersonIDTrackerSupportedOnDevice)
    {
      __ABPKLogSharedInstance();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "inputImageData");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v45, "pixelBuffer"));
        objc_msgSend(v10, "inputImageData");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v47, "pixelBuffer"));
        *(_DWORD *)v84 = 134218240;
        *(_QWORD *)&v84[4] = Width;
        v85 = 2048;
        v86 = Height;
        _os_log_impl(&dword_210836000, v44, OS_LOG_TYPE_DEBUG, " \t Running ANSTTracker on image with resolution: (w,h)=(%lu,%lu) ", v84, 0x16u);

      }
      abpkPersonIDTracker = self->_abpkPersonIDTracker;
      objc_msgSend(v10, "imageDataForNeuralNetwork");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[ABPKPersonIDTracker runWithInput:atTimeStamp:andOutput:](abpkPersonIDTracker, "runWithInput:atTimeStamp:andOutput:", objc_msgSend(v50, "pixelBuffer"), self->_trackedBodies, a5) == 0;

      if (v51)
      {
        __ABPKLogSharedInstance();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v84 = 0;
          _os_log_impl(&dword_210836000, v52, OS_LOG_TYPE_DEBUG, " \t _abpkPersonIDTracker ran successfully ", v84, 2u);
        }

      }
      __ABPKLogSharedInstance();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        v54 = -[NSMutableArray count](self->_trackedBodies, "count");
        *(_DWORD *)v84 = 134217984;
        *(_QWORD *)&v84[4] = v54;
        _os_log_impl(&dword_210836000, v53, OS_LOG_TYPE_DEBUG, " \t _trackedBodies count: %lu ", v84, 0xCu);
      }

    }
    else
    {
      v51 = 0;
    }
    -[ABPK2DDetectionPostprocessHeatmap _startExtrapolationSignpostWithTimestamp:](self, "_startExtrapolationSignpostWithTimestamp:", a5);
    __ABPKLogSharedInstance();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_210836000, v63, OS_LOG_TYPE_DEBUG, " \t Performing extrapolation ", v84, 2u);
    }

    if (v51 && -[NSMutableArray count](self->_trackedBodies, "count"))
    {
      extrapolationFiltering = self->_extrapolationFiltering;
      v80 = *(_OWORD *)v87;
      v81 = v88;
      v88 = 0;
      memset(v87, 0, sizeof(v87));
      v65 = &v80;
      v66 = -[ABPK2DExtrapolationFiltering performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:personTracker:](extrapolationFiltering, "performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:personTracker:", &v80, v13, v75, self->_trackedBodies, v72, v74, a5);
    }
    else
    {
      v67 = self->_extrapolationFiltering;
      v78 = *(_OWORD *)v87;
      v79 = v88;
      v88 = 0;
      memset(v87, 0, sizeof(v87));
      v65 = &v78;
      v66 = -[ABPK2DExtrapolationFiltering performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:](v67, "performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:", &v78, v13, v75, v72, v74, a5);
    }
    v68 = v66;
    *(_QWORD *)v84 = v65;
    std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)v84);
    -[ABPK2DDetectionPostprocessHeatmap _endExtrapolationSignpostWithTimestamp:](self, "_endExtrapolationSignpostWithTimestamp:", a5);
    -[ABPK2DDetectionPostprocessHeatmap _endExtract2DSkeletonSignpostWithTimestamp:](self, "_endExtract2DSkeletonSignpostWithTimestamp:", a5);
    if (!v68)
    {
      v70 = 0;
      goto LABEL_70;
    }
    __ABPKLogSharedInstance();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_210836000, v69, OS_LOG_TYPE_ERROR, " 2D Extrapolation failed ", v84, 2u);
    }

    goto LABEL_68;
  }
  if (self->_humansDetected)
  {
    __ABPKLogSharedInstance();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_210836000, v55, OS_LOG_TYPE_DEBUG, " No humans detected in the image ", v84, 2u);
    }

LABEL_68:
    self->_humansDetected = 0;
  }
LABEL_69:
  v70 = -6661;
LABEL_70:
  *(_QWORD *)v84 = v87;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)v84);
  *(_QWORD *)v87 = buf;
  std::vector<abpk::HeatmapPersonData>::__destroy_vector::operator()[abi:ne180100]((void ***)v87);

  return v70;
}

- (void)getRawTrackedHumanSkeleton:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[ABPK2DDetectionPostprocessHeatmap rawTrackedHuman](self, "rawTrackedHuman");
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
  v4 = -[ABPK2DDetectionPostprocessHeatmap rawTrackedHumanVector](self, "rawTrackedHumanVector");
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
  v4 = -[ABPK2DDetectionPostprocessHeatmap trackedHuman](self, "trackedHuman");
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
  v4 = -[ABPK2DDetectionPostprocessHeatmap trackedHumanForLifting](self, "trackedHumanForLifting");
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
  v4 = -[ABPK2DDetectionPostprocessHeatmap rawTrackedHuman](self, "rawTrackedHuman");
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

  v6 = -[ABPK2DDetectionPostprocessHeatmap trackedHuman](self, "trackedHuman");
  v7 = -[ABPK2DDetectionPostprocessHeatmap trackedHumanForLifting](self, "trackedHumanForLifting");
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

  v6 = -[ABPK2DDetectionPostprocessHeatmap rawTrackedHuman](self, "rawTrackedHuman");
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
  objc_storeStrong((id *)&self->_trackedBodies, 0);
  objc_storeStrong((id *)&self->_abpkPersonIDTracker, 0);
  objc_storeStrong((id *)&self->_extrapolationFiltering, 0);
  objc_storeStrong((id *)&self->_imagePreProcessingParams, 0);
}

@end

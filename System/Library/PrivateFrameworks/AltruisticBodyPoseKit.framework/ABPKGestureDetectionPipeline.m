@implementation ABPKGestureDetectionPipeline

- (ABPKGestureDetectionPipeline)init
{
  return -[ABPKGestureDetectionPipeline initWithFrequency:](self, "initWithFrequency:", 30);
}

- (ABPKGestureDetectionPipeline)initWithFrequency:(unsigned int)a3
{
  ABPKGestureDetectionPipeline *v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  unsigned int fps;
  NSObject *v9;
  unsigned int maxPreviousPoses;
  NSObject *v11;
  unsigned int raisingMaxPreviousPoses;
  NSObject *v13;
  unsigned int wavingMinPeriodicFrames;
  NSObject *v15;
  unsigned int wavingAngleChangeLastFrames;
  ABPK2DDetectionConfiguration *v17;
  ABPK2DDetectionConfiguration *config2D;
  ABPK2DPoseEstimation *v19;
  ABPK2DPoseEstimation *poseEstimation2D;
  NSMutableDictionary *v21;
  NSMutableDictionary *joints2DBufferDict;
  NSMutableArray *v23;
  NSMutableArray *previousGestureDetectionResult;
  ABPKGestureDetectionPipeline *v25;
  NSObject *v26;
  NSObject *v27;
  objc_super v29;
  uint8_t buf[4];
  unsigned int v31;
  uint64_t v32;

  v4 = self;
  v32 = *MEMORY[0x24BDAC8D0];
  -[ABPKGestureDetectionPipeline _startInitABPKSignpost](self, "_startInitABPKSignpost");
  if (a3 > 0x1E || ((1 << a3) & 0x40000420) == 0)
  {
    __ABPKLogSharedInstance();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v31 = a3;
      _os_log_impl(&dword_210836000, v26, OS_LOG_TYPE_ERROR, " Failed to initialize Gesture Detection Pipeline. Unsupported Frequency: %d ", buf, 8u);
    }

    goto LABEL_29;
  }
  v4->_fps = a3;
  v5 = (unsigned __int16)a3 / 3u + 1;
  v4->_maxPreviousPoses = 2 * (a3 & 0x7FFF);
  v4->_raisingMaxPreviousPoses = v5;
  v4->_wavingMinPeriodicFrames = v5;
  v4->_wavingAngleChangeLastFrames = ((139812 * ((5 * (_WORD)a3) & 0x3FFFu)) >> 20) + 1;
  __ABPKLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v6, OS_LOG_TYPE_DEBUG, " Gesture Detection Config parameters: ", buf, 2u);
  }

  __ABPKLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    fps = v4->_fps;
    *(_DWORD *)buf = 67109120;
    v31 = fps;
    _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_DEBUG, " \t _fps: %d ", buf, 8u);
  }

  __ABPKLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    maxPreviousPoses = v4->_maxPreviousPoses;
    *(_DWORD *)buf = 67109120;
    v31 = maxPreviousPoses;
    _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_DEBUG, " \t maxPreviousPoses: %d ", buf, 8u);
  }

  __ABPKLogSharedInstance();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    raisingMaxPreviousPoses = v4->_raisingMaxPreviousPoses;
    *(_DWORD *)buf = 67109120;
    v31 = raisingMaxPreviousPoses;
    _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_DEBUG, " \t raisingMaxPreviousPoses: %d, ", buf, 8u);
  }

  __ABPKLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    wavingMinPeriodicFrames = v4->_wavingMinPeriodicFrames;
    *(_DWORD *)buf = 67109120;
    v31 = wavingMinPeriodicFrames;
    _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " \t wavingMinPeriodicFrames: %d ", buf, 8u);
  }

  __ABPKLogSharedInstance();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    wavingAngleChangeLastFrames = v4->_wavingAngleChangeLastFrames;
    *(_DWORD *)buf = 67109120;
    v31 = wavingAngleChangeLastFrames;
    _os_log_impl(&dword_210836000, v15, OS_LOG_TYPE_DEBUG, " \t wavingAngleChangeLastFrames: %d ", buf, 8u);
  }

  v29.receiver = v4;
  v29.super_class = (Class)ABPKGestureDetectionPipeline;
  v4 = -[ABPKGestureDetectionPipeline init](&v29, sel_init);
  if (!v4)
    goto LABEL_19;
  v17 = -[ABPK2DDetectionConfiguration initWithAlgorithmMode:]([ABPK2DDetectionConfiguration alloc], "initWithAlgorithmMode:", 0);
  config2D = v4->_config2D;
  v4->_config2D = v17;

  if (!v4->_config2D)
  {
    __ABPKLogSharedInstance();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v27, OS_LOG_TYPE_ERROR, " Failed to initialize config for 2D Detection module ", buf, 2u);
    }
    goto LABEL_28;
  }
  v19 = -[ABPK2DPoseEstimation initWith2DDetectionConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:]([ABPK2DPoseEstimation alloc], "initWith2DDetectionConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:", v4->_config2D, 0, 0);
  poseEstimation2D = v4->_poseEstimation2D;
  v4->_poseEstimation2D = v19;

  if (!v4->_poseEstimation2D)
  {
    __ABPKLogSharedInstance();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v27, OS_LOG_TYPE_ERROR, " Failed to initialize 2D Pose Estimation Algorithm. ", buf, 2u);
    }
LABEL_28:

LABEL_29:
    v25 = 0;
    goto LABEL_30;
  }
  v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  joints2DBufferDict = v4->_joints2DBufferDict;
  v4->_joints2DBufferDict = v21;

  v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  previousGestureDetectionResult = v4->_previousGestureDetectionResult;
  v4->_previousGestureDetectionResult = v23;

  v4->_lastTrackingId = -1;
LABEL_19:
  -[ABPKGestureDetectionPipeline _endInitABPKSignpost](v4, "_endInitABPKSignpost");
  v4 = v4;
  v25 = v4;
LABEL_30:

  return v25;
}

- (int)runWithInput:(__CVBuffer *)a3 abpkDeviceOrientation:(int64_t)a4 atTimeStamp:(double)a5 andOutput:(id)a6
{
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  unint64_t v14;
  float v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  int32x2_t *v29;
  void *v30;
  void *v31;
  float32x2_t *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  float i;
  float32x4_t v37;
  float32x2_t v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  unint64_t v42;
  NSObject *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  uint64_t j;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  uint64_t v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  NSMutableDictionary *joints2DBufferDict;
  ABPKCircularArray *v76;
  void *v77;
  unint64_t k;
  void *v79;
  NSMutableDictionary *v80;
  ABPKCircularArray *v81;
  NSObject *v82;
  NSMutableArray *previousGestureDetectionResult;
  NSObject *v84;
  uint64_t v85;
  void *v86;
  unint64_t m;
  NSMutableDictionary *v88;
  void *v89;
  int v90;
  double Current;
  NSObject *v92;
  unint64_t n;
  ABPKGestureDetectionResult *v94;
  uint64_t v95;
  void *v96;
  NSMutableArray *v97;
  NSMutableArray *v98;
  NSObject *v99;
  uint64_t v100;
  double v101;
  NSObject *v102;
  int v104;
  id v105;
  uint64_t v106;
  double v107;
  id v108;
  double v109;
  id v110;
  void *__p;
  _BYTE *v112;
  uint64_t v113;
  void *v114;
  char *v115;
  unint64_t v116;
  _QWORD v117[2];
  uint8_t v118[4];
  double v119;
  __int16 v120;
  int v121;
  _OWORD buf[2];
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v105 = a6;
  -[ABPKGestureDetectionPipeline _startGestureDetectionRunWithInputSignpostWithTimestamp:](self, "_startGestureDetectionRunWithInputSignpostWithTimestamp:", a5);
  v110 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v104 = -[ABPKGestureDetectionPipeline runPoseEstimationWithInput:abpkDeviceOrientation:atTimeStamp:andOutput:](self, "runPoseEstimationWithInput:abpkDeviceOrientation:atTimeStamp:andOutput:", a3, a4, a5);
  __ABPKLogSharedInstance();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = objc_msgSend(v110, "count");
    _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_DEBUG, " Humans detected: %lu ", (uint8_t *)buf, 0xCu);
  }

  -[ABPKGestureDetectionPipeline _startGestureDetectionPersonTrackingSignpostWithTimestamp:](self, "_startGestureDetectionPersonTrackingSignpostWithTimestamp:", a5);
  __ABPKLogSharedInstance();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_DEBUG, " Computing tracking ids ", (uint8_t *)buf, 2u);
  }

  std::vector<unsigned long>::vector(buf, objc_msgSend(v110, "count"));
  v114 = 0;
  v115 = 0;
  v116 = 0;
  if (-[NSMutableArray count](self->_previousGestureDetectionResult, "count"))
  {
    *(double *)&v12 = 0.0;
    while (1)
    {
      if (v12 >= objc_msgSend(v110, "count"))
        goto LABEL_76;
      __ABPKLogSharedInstance();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v118 = 134217984;
        v119 = *(double *)&v12;
        _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " Finding tracking for current skeleton: %lu ", v118, 0xCu);
      }

      *(double *)&v14 = 0.0;
      v106 = -1000;
      v15 = 10000.0;
      while (v14 < -[NSMutableArray count](self->_previousGestureDetectionResult, "count"))
      {
        __ABPKLogSharedInstance();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_previousGestureDetectionResult, "objectAtIndexedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "trackingId");
          *(_DWORD *)v118 = 134218240;
          v119 = *(double *)&v14;
          v120 = 1024;
          v121 = v18;
          _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_DEBUG, " \t Comparing with previous skeleton %lu with tracking_id: %u ", v118, 0x12u);

        }
        __p = 0;
        v112 = 0;
        v113 = 0;
        std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v114, (uint64_t)v115, (v115 - (_BYTE *)v114) >> 3);
        -[NSMutableArray objectAtIndexedSubscript:](self->_previousGestureDetectionResult, "objectAtIndexedSubscript:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "trackingId");
        if (v112 == __p)
        {
          v23 = 0;
        }
        else
        {
          v21 = (v112 - (_BYTE *)__p) >> 3;
          if (v21 <= 1)
            v22 = 1;
          else
            v22 = (v112 - (_BYTE *)__p) >> 3;
          if (*(_QWORD *)__p == v20)
          {
            v23 = 1;
          }
          else
          {
            v24 = 1;
            do
            {
              v25 = v24;
              if (v22 == v24)
                break;
              v26 = *((_QWORD *)__p + v24++);
            }
            while (v26 != v20);
            v23 = v25 < v21;
          }
        }

        if (__p)
        {
          v112 = __p;
          operator delete(__p);
        }
        if (v23)
        {
          __ABPKLogSharedInstance();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v118 = 0;
            _os_log_impl(&dword_210836000, v27, OS_LOG_TYPE_DEBUG, " \t Skipping. Tracking id already assigned ", v118, 2u);
          }
          goto LABEL_38;
        }
        objc_msgSend(v110, "objectAtIndexedSubscript:", v12);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (int32x2_t *)objc_msgSend(v28, "keypoints2d");
        -[NSMutableArray objectAtIndexedSubscript:](self->_previousGestureDetectionResult, "objectAtIndexedSubscript:", v14);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "skeleton2D");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (float32x2_t *)objc_msgSend(v31, "keypoints2d");
        objc_msgSend(v110, "objectAtIndexedSubscript:", v12);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "skeletonDefinition");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "jointCount");
        for (i = 0.0; v35; --v35)
        {
          *(int32x2_t *)v37.f32 = vrev64_s32(*v29);
          *(float32x2_t *)&v37.u32[2] = *v32;
          if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcltzq_f32(v37))) & 1) == 0)
          {
            v38 = vsub_f32((float32x2_t)*v29, *v32);
            i = i + sqrtf(vaddv_f32(vmul_f32(v38, v38)));
          }
          ++v32;
          ++v29;
        }

        __ABPKLogSharedInstance();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v118 = 134217984;
          v119 = i;
          _os_log_impl(&dword_210836000, v39, OS_LOG_TYPE_DEBUG, " \t\t distance: %f ", v118, 0xCu);
        }

        if (i < v15)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_previousGestureDetectionResult, "objectAtIndexedSubscript:", v14);
          v27 = objc_claimAutoreleasedReturnValue();
          v106 = -[NSObject trackingId](v27, "trackingId");
          v15 = i;
LABEL_38:

        }
        ++v14;
      }
      __ABPKLogSharedInstance();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v118 = 134217984;
        v119 = v15;
        _os_log_impl(&dword_210836000, v40, OS_LOG_TYPE_DEBUG, " \t Minimum Distance: %f ", v118, 0xCu);
      }

      if (v15 <= 1500.0)
      {
        v42 = v106;
        if (v106 == -1000)
          goto LABEL_47;
      }
      else
      {
        __ABPKLogSharedInstance();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v118 = 0;
          _os_log_impl(&dword_210836000, v41, OS_LOG_TYPE_DEBUG, " Distance is higher than threshold. No closest human found from the previous frame. Assigning new tracking id ", v118, 2u);
        }

LABEL_47:
        v42 = self->_lastTrackingId + 1;
        self->_lastTrackingId = v42;
      }
      v107 = *(double *)&v42;
      *(_QWORD *)(*(_QWORD *)&buf[0] + 8 * v12) = v42;
      __ABPKLogSharedInstance();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v118 = 134217984;
        v119 = v107;
        _os_log_impl(&dword_210836000, v43, OS_LOG_TYPE_DEBUG, " \t Tracking id: %lu ", v118, 0xCu);
      }

      v44 = v115;
      if ((unint64_t)v115 >= v116)
      {
        v46 = (char *)v114;
        v47 = (v115 - (_BYTE *)v114) >> 3;
        v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 61)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v49 = v116 - (_QWORD)v114;
        if ((uint64_t)(v116 - (_QWORD)v114) >> 2 > v48)
          v48 = v49 >> 2;
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8)
          v50 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v50 = v48;
        if (v50)
        {
          v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v116, v50);
          v46 = (char *)v114;
          v44 = v115;
        }
        else
        {
          v51 = 0;
        }
        v52 = &v51[8 * v47];
        *(double *)v52 = v107;
        v45 = v52 + 8;
        while (v44 != v46)
        {
          v53 = *((_QWORD *)v44 - 1);
          v44 -= 8;
          *((_QWORD *)v52 - 1) = v53;
          v52 -= 8;
        }
        v114 = v52;
        v115 = v45;
        v116 = (unint64_t)&v51[8 * v50];
        if (v46)
          operator delete(v46);
      }
      else
      {
        *(double *)v115 = v107;
        v45 = v44 + 8;
      }
      v115 = v45;
      objc_msgSend(v110, "objectAtIndexedSubscript:", v12);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "skeletonDefinition");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "jointCount");

      v108 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v57 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v58 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (v56)
      {
        for (j = 0; j != v56; ++j)
        {
          objc_msgSend(v110, "objectAtIndexedSubscript:", v12);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = *(double *)(objc_msgSend(v60, "keypoints2d") + 8 * j);

          objc_msgSend(v110, "objectAtIndexedSubscript:", v12);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = *(_DWORD *)(objc_msgSend(v61, "confidences") + 4 * j);

          objc_msgSend(v110, "objectAtIndexedSubscript:", v12);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = *(unsigned int *)(objc_msgSend(v63, "visibility") + 4 * j);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v109);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v117[0] = v65;
          HIDWORD(v66) = HIDWORD(v109);
          LODWORD(v66) = HIDWORD(v109);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v117[1] = v67;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 2);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "addObject:", v68);

          LODWORD(v69) = v62;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v70);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v64);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v71);

        }
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)&v107);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_joints2DBufferDict, "objectForKeyedSubscript:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73 == 0;

      if (v74)
      {
        joints2DBufferDict = self->_joints2DBufferDict;
        v76 = -[ABPKCircularArray initWithCapacity:]([ABPKCircularArray alloc], "initWithCapacity:", self->_maxPreviousPoses);
        -[NSMutableDictionary setValue:forKey:](joints2DBufferDict, "setValue:forKey:", v76, v72);

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_joints2DBufferDict, "objectForKeyedSubscript:", v72);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "add:", v108);

      ++v12;
    }
  }
  for (k = 0; k < objc_msgSend(v110, "count"); ++k)
  {
    *(_QWORD *)(*(_QWORD *)&buf[0] + 8 * k) = self->_lastTrackingId + 1;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), k);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = self->_joints2DBufferDict;
    v81 = -[ABPKCircularArray initWithCapacity:]([ABPKCircularArray alloc], "initWithCapacity:", self->_maxPreviousPoses);
    -[NSMutableDictionary setValue:forKey:](v80, "setValue:forKey:", v81, v79);

  }
  self->_lastTrackingId += objc_msgSend(v110, "count");
LABEL_76:
  -[ABPKGestureDetectionPipeline _endGestureDetectionPersonTrackingSignpostWithTimestamp:](self, "_endGestureDetectionPersonTrackingSignpostWithTimestamp:", a5);
  -[ABPKGestureDetectionPipeline _startGestureDetectionAlgorithmSignpostWithTimestamp:](self, "_startGestureDetectionAlgorithmSignpostWithTimestamp:", a5);
  if (v104)
  {
    __ABPKLogSharedInstance();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v118 = 0;
      _os_log_impl(&dword_210836000, v82, OS_LOG_TYPE_ERROR, " Pose not valid. Skipping ", v118, 2u);
    }

    previousGestureDetectionResult = self->_previousGestureDetectionResult;
    self->_previousGestureDetectionResult = 0;

    __ABPKLogSharedInstance();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&v85 = COERCE_DOUBLE(-[NSMutableArray count](self->_previousGestureDetectionResult, "count"));
      *(_DWORD *)v118 = 134217984;
      v119 = *(double *)&v85;
      _os_log_impl(&dword_210836000, v84, OS_LOG_TYPE_DEBUG, " _previousGestureDetectionResult count: %lu ", v118, 0xCu);
    }

    -[NSMutableDictionary allKeys](self->_joints2DBufferDict, "allKeys");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    for (m = 0; objc_msgSend(v86, "count") > m; ++m)
    {
      v88 = self->_joints2DBufferDict;
      objc_msgSend(v86, "objectAtIndexedSubscript:", m);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v88, "removeObjectForKey:", v89);

    }
    v90 = -6661;
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    __ABPKLogSharedInstance();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v118 = 0;
      _os_log_impl(&dword_210836000, v92, OS_LOG_TYPE_ERROR, " Pose valid. Running the gesture detection pipeline ", v118, 2u);
    }

    for (n = 0; n < objc_msgSend(v110, "count"); ++n)
    {
      v94 = objc_alloc_init(ABPKGestureDetectionResult);
      v95 = *(_QWORD *)(*(_QWORD *)&buf[0] + 8 * n);
      objc_msgSend(v110, "objectAtIndexedSubscript:", n);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABPKGestureDetectionPipeline runGestureDetection:withTrackingId:andResult:](self, "runGestureDetection:withTrackingId:andResult:", v96, v95, v94);

      objc_msgSend(v105, "addObject:", v94);
    }
    v97 = (NSMutableArray *)objc_msgSend(v105, "mutableCopy");
    v98 = self->_previousGestureDetectionResult;
    self->_previousGestureDetectionResult = v97;

    __ABPKLogSharedInstance();
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&v100 = COERCE_DOUBLE(-[NSMutableArray count](self->_previousGestureDetectionResult, "count"));
      *(_DWORD *)v118 = 134217984;
      v119 = *(double *)&v100;
      _os_log_impl(&dword_210836000, v99, OS_LOG_TYPE_DEBUG, " _previousGestureDetectionResult count: %lu ", v118, 0xCu);
    }

    v101 = CFAbsoluteTimeGetCurrent();
    __ABPKLogSharedInstance();
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v118 = 134217984;
      v119 = v101 - Current;
      _os_log_impl(&dword_210836000, v102, OS_LOG_TYPE_DEBUG, " timeGestureDetection: %f ", v118, 0xCu);
    }

    -[ABPKGestureDetectionPipeline _endGestureDetectionAlgorithmSignpostWithTimestamp:](self, "_endGestureDetectionAlgorithmSignpostWithTimestamp:", a5);
    -[ABPKGestureDetectionPipeline _endGestureDetectionRunWithInputSignpostWithTimestamp:](self, "_endGestureDetectionRunWithInputSignpostWithTimestamp:", a5);
    v90 = 0;
  }
  if (v114)
  {
    v115 = (char *)v114;
    operator delete(v114);
  }
  if (*(_QWORD *)&buf[0])
  {
    *((_QWORD *)&buf[0] + 1) = *(_QWORD *)&buf[0];
    operator delete(*(void **)&buf[0]);
  }

  return v90;
}

- (int)runPoseEstimationWithInput:(__CVBuffer *)a3 abpkDeviceOrientation:(int64_t)a4 atTimeStamp:(double)a5 andOutput:(id)a6
{
  id v10;
  size_t Width;
  size_t Height;
  NSObject *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  ABPKImagePreProcessingParams *v24;
  ABPKImagePreProcessing *v25;
  NSObject *v26;
  const __CFDictionary *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  int v31;
  int v32;
  NSObject *v34;
  NSObject *v35;
  ABPKMLImageData *v36;
  NSObject *v37;
  uint8_t v38[16];
  uint64_t v39;
  uint64_t v40;
  _BYTE buf[12];
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  -[ABPKGestureDetectionPipeline _startGestureDetectionImagePreProcessingSignpostWithTimestamp:](self, "_startGestureDetectionImagePreProcessingSignpostWithTimestamp:", a5);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  __ABPKLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (double)Width;
  v15 = (double)Height;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)&buf[4] = (double)Height;
    v42 = 2048;
    v43 = (double)Width;
    _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " Sensor image resolution: (height,width):(%f,%f) ", buf, 0x16u);
  }

  if (-[ABPK2DDetectionConfiguration abpkDeviceOrientation](self->_config2D, "abpkDeviceOrientation") != a4)
  {
    __ABPKLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      convertABPKDeviceOrientationEnumToString(-[ABPK2DDetectionConfiguration abpkDeviceOrientation](self->_config2D, "abpkDeviceOrientation"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      convertABPKDeviceOrientationEnumToString(a4);
      v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      v42 = 2112;
      v43 = v18;
      _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_DEBUG, " Device orientation changed from %@ to %@ ", buf, 0x16u);

    }
    -[ABPK2DDetectionConfiguration setAbpkDeviceOrientation:](self->_config2D, "setAbpkDeviceOrientation:", a4);
  }
  +[ABPK2DMLModelConfigSelector inputDimensionsForModelWithABPKNetworkConfig:](ABPK2DMLModelConfigSelector, "inputDimensionsForModelWithABPKNetworkConfig:", self->_config2D);
  v20 = v19;
  v22 = v21;
  __ABPKLogSharedInstance();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)&buf[4] = v22;
    v42 = 2048;
    v43 = v20;
    _os_log_impl(&dword_210836000, v23, OS_LOG_TYPE_DEBUG, " ML image resolution: (height,width):(%f,%f) ", buf, 0x16u);
  }

  v24 = -[ABPKImagePreProcessingParams initWithType:inputResolution:outputResolution:]([ABPKImagePreProcessingParams alloc], "initWithType:inputResolution:outputResolution:", 2, v14, v15, v20, v22);
  v25 = -[ABPKImagePreProcessing initWithPreProcessingParams:]([ABPKImagePreProcessing alloc], "initWithPreProcessingParams:", v24);
  if (v25)
  {
    *(_QWORD *)buf = 0;
    __ABPKLogSharedInstance();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_210836000, v26, OS_LOG_TYPE_DEBUG, " Image Preprocessing ", v38, 2u);
    }

    v39 = *MEMORY[0x24BDC5668];
    v40 = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (unint64_t)v20, (unint64_t)v22, 0x42475241u, v27, (CVPixelBufferRef *)buf))
    {
      __ABPKLogSharedInstance();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v38 = 0;
        v29 = " Could not create mlImage buffer of type kCVPixelFormatType_32BGRA ";
LABEL_21:
        _os_log_impl(&dword_210836000, v28, OS_LOG_TYPE_ERROR, v29, v38, 2u);
      }
    }
    else
    {
      v32 = -[ABPKImagePreProcessing preprocessData:outputBuffer:](v25, "preprocessData:outputBuffer:", a3, *(_QWORD *)buf);
      -[ABPKImagePreProcessing logProfilingDetails](v25, "logProfilingDetails");
      if (!v32)
      {
        -[ABPKGestureDetectionPipeline _endGestureDetectionImagePreProcessingSignpostWithTimestamp:](self, "_endGestureDetectionImagePreProcessingSignpostWithTimestamp:", a5);
        -[ABPKGestureDetectionPipeline _startGestureDetection2DDetectionMLSignpostWithTimestamp:](self, "_startGestureDetection2DDetectionMLSignpostWithTimestamp:", a5);
        __ABPKLogSharedInstance();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v38 = 0;
          _os_log_impl(&dword_210836000, v34, OS_LOG_TYPE_DEBUG, " Running 2d pose estimation ", v38, 2u);
        }

        __ABPKLogSharedInstance();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v38 = 0;
          _os_log_impl(&dword_210836000, v35, OS_LOG_TYPE_DEBUG, " \t Running the ML model ", v38, 2u);
        }

        v36 = [ABPKMLImageData alloc];
        v28 = -[ABPKMLImageData initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:](v36, "initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:", *(_QWORD *)buf, a4, v24, a5);
        if (-[ABPK2DPoseEstimation runWithMLImageData:rotationOfResultTensor:](self->_poseEstimation2D, "runWithMLImageData:rotationOfResultTensor:", v28, 0) == -6661)
        {
          __ABPKLogSharedInstance();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v38 = 0;
            _os_log_impl(&dword_210836000, v37, OS_LOG_TYPE_ERROR, " 2D Pose estimation failed. ", v38, 2u);
          }

          v31 = -6661;
        }
        else
        {
          -[ABPK2DPoseEstimation getRawTrackedHumanSkeletonVector:](self->_poseEstimation2D, "getRawTrackedHumanSkeletonVector:", v10);
          CVPixelBufferRelease(*(CVPixelBufferRef *)buf);
          -[ABPKGestureDetectionPipeline _endGestureDetection2DDetectionPostProcessingSignpostWithTimestamp:](self, "_endGestureDetection2DDetectionPostProcessingSignpostWithTimestamp:", a5);
          v31 = 0;
        }
        goto LABEL_23;
      }
      __ABPKLogSharedInstance();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v38 = 0;
        v29 = " Could not pre-process image ";
        goto LABEL_21;
      }
    }
    v31 = -6660;
LABEL_23:

    goto LABEL_24;
  }
  __ABPKLogSharedInstance();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v30, OS_LOG_TYPE_ERROR, " Could not initialize imagePreprocessor ", buf, 2u);
  }

  v31 = -6660;
LABEL_24:

  return v31;
}

- (vector<float)extractDataForJointIdx:()(ext_vector_type(2 fromPoseTimeArray:
{
  _QWORD *v4;
  _QWORD *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  int v17;
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> v18;
  id v19;
  __int128 v20;

  v7 = v4;
  v19 = a4;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(v7, self->_maxPreviousPoses);
  if (self->_maxPreviousPoses)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      *(_QWORD *)&v20 = v12;
      objc_msgSend(v19, "objectAtIndexedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      v16 = v20;
      DWORD1(v16) = v17;
      v20 = v16;

      *(_QWORD *)(*v7 + 8 * v8++) = v20;
    }
    while (v8 < self->_maxPreviousPoses);
  }

  return v18;
}

- (void)runGestureDetection:(id)a3 withTrackingId:(unsigned int)a4 andResult:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  _BOOL4 v18;
  unsigned int maxPreviousPoses;
  unsigned int raisingMaxPreviousPoses;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  int64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  NSObject *v46;
  _BOOL4 v47;
  NSObject *v48;
  _BOOL4 v49;
  id v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  uint8_t v54[8];
  void *__p;
  char *v56;
  void *v57;
  char *v58;
  void *v59;
  char *v60;
  void *v61;
  char *v62;
  void *v63;
  char *v64;
  void *v65;
  char *v66;
  char *v67;
  char *v68;
  _OWORD buf[2];
  uint64_t v70;

  v6 = *(_QWORD *)&a4;
  v70 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v53 = detectFaceVisible(*(_DWORD *)(objc_msgSend(v8, "visibility") + 56), *(_DWORD *)(objc_msgSend(v8, "visibility") + 60), *(_DWORD *)objc_msgSend(v8, "visibility"), *(_DWORD *)(objc_msgSend(v8, "visibility") + 68), *(_DWORD *)(objc_msgSend(v8, "visibility") + 72));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_joints2DBufferDict, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  __ABPKLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = objc_msgSend(v12, "count");
    _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " poseTimeArray size: %lu ", (uint8_t *)buf, 0xCu);
  }

  if (objc_msgSend(v12, "count") >= (unint64_t)self->_maxPreviousPoses)
  {
    v52 = v9;
    -[ABPKGestureDetectionPipeline extractDataForJointIdx:fromPoseTimeArray:](self, "extractDataForJointIdx:fromPoseTimeArray:", 1, v12);
    -[ABPKGestureDetectionPipeline extractDataForJointIdx:fromPoseTimeArray:](self, "extractDataForJointIdx:fromPoseTimeArray:", 0, v12);
    -[ABPKGestureDetectionPipeline extractDataForJointIdx:fromPoseTimeArray:](self, "extractDataForJointIdx:fromPoseTimeArray:", 7, v12);
    -[ABPKGestureDetectionPipeline extractDataForJointIdx:fromPoseTimeArray:](self, "extractDataForJointIdx:fromPoseTimeArray:", 6, v12);
    -[ABPKGestureDetectionPipeline extractDataForJointIdx:fromPoseTimeArray:](self, "extractDataForJointIdx:fromPoseTimeArray:", 5, v12);
    -[ABPKGestureDetectionPipeline extractDataForJointIdx:fromPoseTimeArray:](self, "extractDataForJointIdx:fromPoseTimeArray:", 4, v12);
    -[ABPKGestureDetectionPipeline extractDataForJointIdx:fromPoseTimeArray:](self, "extractDataForJointIdx:fromPoseTimeArray:", 3, v12);
    -[ABPKGestureDetectionPipeline extractDataForJointIdx:fromPoseTimeArray:](self, "extractDataForJointIdx:fromPoseTimeArray:", 2, v12);
    __ABPKLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_210836000, v15, OS_LOG_TYPE_DEBUG, " Starting waving left hand detection ", v54, 2u);
    }

    v16 = detectWavingHand((float32x2_t *)v65, (float32x2_t *)v63, (float32x2_t *)v61, *(uint64_t *)&buf[0], (uint64_t)v67, self->_maxPreviousPoses, self->_wavingAngleChangeLastFrames, self->_wavingMinPeriodicFrames);
    __ABPKLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_210836000, v17, OS_LOG_TYPE_DEBUG, " Starting waving right hand detection ", v54, 2u);
    }

    v18 = detectWavingHand((float32x2_t *)v59, (float32x2_t *)v57, (float32x2_t *)__p, *(uint64_t *)&buf[0], (uint64_t)v67, self->_maxPreviousPoses, self->_wavingAngleChangeLastFrames, self->_wavingMinPeriodicFrames);
    maxPreviousPoses = self->_maxPreviousPoses;
    raisingMaxPreviousPoses = self->_raisingMaxPreviousPoses;
    v21 = maxPreviousPoses - raisingMaxPreviousPoses;
    if (maxPreviousPoses != raisingMaxPreviousPoses)
    {
      v22 = *(_QWORD *)&buf[0];
      v23 = (const void *)(*(_QWORD *)&buf[0] + 8 * v21);
      v24 = *((_QWORD *)&buf[0] + 1) - (_QWORD)v23;
      if (*((const void **)&buf[0] + 1) != v23)
        memmove(*(void **)&buf[0], v23, *((_QWORD *)&buf[0] + 1) - (_QWORD)v23);
      *((_QWORD *)&buf[0] + 1) = v22 + v24;
      v25 = v67;
      v26 = &v67[8 * v21];
      v27 = v68 - v26;
      if (v68 != v26)
        memmove(v67, v26, v68 - v26);
      v68 = &v25[v27];
      v28 = (char *)v65;
      v29 = (char *)v65 + 8 * v21;
      v30 = v66 - v29;
      if (v66 != v29)
        memmove(v65, v29, v66 - v29);
      v66 = &v28[v30];
      v31 = (char *)v63;
      v32 = (char *)v63 + 8 * v21;
      v33 = v64 - v32;
      if (v64 != v32)
        memmove(v63, v32, v64 - v32);
      v64 = &v31[v33];
      v34 = (char *)v61;
      v35 = (char *)v61 + 8 * v21;
      v36 = v62 - v35;
      if (v62 != v35)
        memmove(v61, v35, v62 - v35);
      v62 = &v34[v36];
      v37 = (char *)v59;
      v38 = (char *)v59 + 8 * v21;
      v39 = v60 - v38;
      if (v60 != v38)
        memmove(v59, v38, v60 - v38);
      v60 = &v37[v39];
      v40 = (char *)v57;
      v41 = (char *)v57 + 8 * v21;
      v42 = v58 - v41;
      if (v58 != v41)
        memmove(v57, v41, v58 - v41);
      v58 = &v40[v42];
      v43 = (char *)__p;
      v44 = (char *)__p + 8 * v21;
      v45 = v56 - v44;
      if (v56 != v44)
        memmove(__p, v44, v56 - v44);
      v56 = &v43[v45];
    }
    __ABPKLogSharedInstance();
    v46 = objc_claimAutoreleasedReturnValue();
    v9 = v52;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_210836000, v46, OS_LOG_TYPE_DEBUG, " Starting raising left hand detection ", v54, 2u);
    }

    v47 = detectRaisingHand((uint64_t)v65, (uint64_t)v63, (uint64_t)v61, *(uint64_t *)&buf[0], (uint64_t)v67, self->_raisingMaxPreviousPoses);
    __ABPKLogSharedInstance();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_210836000, v48, OS_LOG_TYPE_DEBUG, " Starting raising right hand detection ", v54, 2u);
    }

    v49 = detectRaisingHand((uint64_t)v59, (uint64_t)v57, (uint64_t)__p, *(uint64_t *)&buf[0], (uint64_t)v67, self->_raisingMaxPreviousPoses);
    v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v51 = v50;
    if (v47 || v49)
      objc_msgSend(v50, "addObject:", &unk_24CA78CD0);
    if (v16 || v18)
      objc_msgSend(v51, "addObject:", &unk_24CA78CE8);
    if (v53)
      objc_msgSend(v51, "addObject:", &unk_24CA78D00);
    objc_msgSend(v52, "set2dSkeleton:isPoseValid:trackingId:gestureTypes:", v8, 1, v6, v51);

    if (__p)
    {
      v56 = (char *)__p;
      operator delete(__p);
    }
    if (v57)
    {
      v58 = (char *)v57;
      operator delete(v57);
    }
    if (v59)
    {
      v60 = (char *)v59;
      operator delete(v59);
    }
    if (v61)
    {
      v62 = (char *)v61;
      operator delete(v61);
    }
    if (v63)
    {
      v64 = (char *)v63;
      operator delete(v63);
    }
    if (v65)
    {
      v66 = (char *)v65;
      operator delete(v65);
    }
    if (v67)
    {
      v68 = v67;
      operator delete(v67);
    }
    if (*(_QWORD *)&buf[0])
    {
      *((_QWORD *)&buf[0] + 1) = *(_QWORD *)&buf[0];
      operator delete(*(void **)&buf[0]);
    }
  }
  else
  {
    __ABPKLogSharedInstance();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_210836000, v14, OS_LOG_TYPE_DEBUG, " Pose history not sufficient for gesture detection ", (uint8_t *)buf, 2u);
    }

    objc_msgSend(v9, "set2dSkeleton:isPoseValid:trackingId:gestureTypes:", v8, 1, v6, MEMORY[0x24BDBD1A8]);
  }

}

- (BOOL)overlayResult:(id)a3 OnImage:(__CVBuffer *)a4 andGenerateOverlayImage:(__CVBuffer *)a5
{
  id v7;
  _OWORD *v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  NSObject *v17;
  __int128 v18;
  __CVBuffer *v19;
  __int128 v21;
  uint8_t buf[4];
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = operator new(0xC0uLL);
  v9 = 0;
  *v8 = xmmword_210881570;
  v8[1] = xmmword_210881580;
  *(_QWORD *)&v10 = 255;
  *((_QWORD *)&v10 + 1) = 255;
  v8[2] = xmmword_210881590;
  v8[3] = v10;
  v8[4] = xmmword_2108815A0;
  v8[5] = xmmword_2108815B0;
  *(_QWORD *)&v11 = 0xFF000000FFLL;
  *((_QWORD *)&v11 + 1) = 0xFF000000FFLL;
  LOBYTE(v10) = 0;
  BYTE8(v10) = 0;
  v8[6] = v11;
  v8[7] = v10;
  v8[8] = xmmword_2108815C0;
  v8[9] = xmmword_2108815D0;
  v8[10] = xmmword_2108815E0;
  v8[11] = xmmword_2108815F0;
  v21 = 0x8000100uLL;
  while (v9 < objc_msgSend(v7, "count", v21))
  {
    __ABPKLogSharedInstance();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v21;
      v23 = v9;
      _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " \x10Overlaying result for Person: %lu ", buf, 0xCu);
    }

    objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "gestureTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    v16 = objc_msgSend(v13, "trackingId");
    if (v15)
    {
      __ABPKLogSharedInstance();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v17, OS_LOG_TYPE_DEBUG, " Gesture detected ", buf, 2u);
      }

      *(_QWORD *)&v18 = 0xFF00000000;
    }
    else
    {
      v18 = v8[v16 % 0xC];
    }
    if (v9)
      v19 = a5;
    else
      v19 = a4;
    objc_msgSend(v13, "overlayResultOnImage:withResult:withColor:", v19, a5, *(double *)&v18);

    ++v9;
  }
  operator delete(v8);

  return 1;
}

- (void)_startInitABPKSignpost
{
  kdebug_trace();
}

- (void)_endInitABPKSignpost
{
  kdebug_trace();
}

- (void)_startGestureDetectionRunWithInputSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endGestureDetectionRunWithInputSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startGestureDetectionImagePreProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endGestureDetectionImagePreProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startGestureDetection2DDetectionMLSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endGestureDetection2DDetectionMLSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startGestureDetection2DDetectionPostProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endGestureDetection2DDetectionPostProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startGestureDetectionPersonTrackingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endGestureDetectionPersonTrackingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startGestureDetectionAlgorithmSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endGestureDetectionAlgorithmSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousGestureDetectionResult, 0);
  objc_storeStrong((id *)&self->_joints2DBufferDict, 0);
  objc_storeStrong((id *)&self->_poseEstimation2D, 0);
  objc_storeStrong((id *)&self->_config2D, 0);
}

@end

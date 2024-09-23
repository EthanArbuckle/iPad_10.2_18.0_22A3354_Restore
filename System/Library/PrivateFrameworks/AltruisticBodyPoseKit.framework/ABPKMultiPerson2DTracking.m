@implementation ABPKMultiPerson2DTracking

- (ABPKMultiPerson2DTracking)init
{
  ABPKMultiPerson2DTracking *v3;
  ABPKPersonIDTracker *v4;
  ABPKPersonIDTracker *abpkPersonIDTracker;
  ABPK2DDetectionConfiguration *v6;
  ABPK2DDetectionConfiguration *config2D;
  ABPK2DPoseEstimation *v8;
  ABPK2DPoseEstimation *poseEstimation2D;
  NSMutableArray *v10;
  NSMutableArray *previousMultiPerson2DResult;
  NSMutableArray *v12;
  NSMutableArray *trackedBodies;
  ABPKMultiPerson2DTracking *v14;
  NSObject *v15;
  const char *v16;
  uint8_t v18[16];
  objc_super v19;

  -[ABPKMultiPerson2DTracking _startInitABPKSignpost](self, "_startInitABPKSignpost");
  v19.receiver = self;
  v19.super_class = (Class)ABPKMultiPerson2DTracking;
  v3 = -[ABPKMultiPerson2DTracking init](&v19, sel_init);
  if (!v3)
    goto LABEL_6;
  v4 = objc_alloc_init(ABPKPersonIDTracker);
  abpkPersonIDTracker = v3->_abpkPersonIDTracker;
  v3->_abpkPersonIDTracker = v4;

  if (!v3->_abpkPersonIDTracker)
  {
    __ABPKLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)v18 = 0;
    v16 = " Failed to initialize ABPK Person ID Tracker ";
LABEL_13:
    _os_log_impl(&dword_210836000, v15, OS_LOG_TYPE_ERROR, v16, v18, 2u);
    goto LABEL_14;
  }
  v6 = -[ABPK2DDetectionConfiguration initWithAlgorithmMode:]([ABPK2DDetectionConfiguration alloc], "initWithAlgorithmMode:", 10);
  config2D = v3->_config2D;
  v3->_config2D = v6;

  if (!v3->_config2D)
  {
    __ABPKLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)v18 = 0;
    v16 = " Failed to initialize config for 2D Detection module ";
    goto LABEL_13;
  }
  v8 = -[ABPK2DPoseEstimation initWith2DDetectionConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:]([ABPK2DPoseEstimation alloc], "initWith2DDetectionConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:", v3->_config2D, 0, 0);
  poseEstimation2D = v3->_poseEstimation2D;
  v3->_poseEstimation2D = v8;

  if (!v3->_poseEstimation2D)
  {
    __ABPKLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      v16 = " Failed to initialize 2D Pose Estimation Algorithm. ";
      goto LABEL_13;
    }
LABEL_14:

    v14 = 0;
    goto LABEL_15;
  }
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  previousMultiPerson2DResult = v3->_previousMultiPerson2DResult;
  v3->_previousMultiPerson2DResult = v10;

  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  trackedBodies = v3->_trackedBodies;
  v3->_trackedBodies = v12;

  v3->_lastTrackingId = -1;
LABEL_6:
  -[ABPKMultiPerson2DTracking _endInitABPKSignpost](v3, "_endInitABPKSignpost");
  v14 = v3;
LABEL_15:

  return v14;
}

- (int)runWithInput:(__CVBuffer *)a3 abpkDeviceOrientation:(int64_t)a4 atTimeStamp:(double)a5 andOutput:(id)a6
{
  NSObject *v10;
  unint64_t i;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  unint64_t j;
  NSObject *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSObject *v37;
  unint64_t k;
  NSObject *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  NSObject *v45;
  unint64_t v46;
  NSObject *v47;
  unint64_t v48;
  uint64_t v49;
  float v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  _BOOL4 v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  float v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  ABPKMultiPerson2DTracking *v81;
  NSObject *v82;
  char *v83;
  char *v84;
  void *v85;
  char *v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  id v97;
  id v98;
  uint64_t m;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  uint64_t v104;
  void *v105;
  double v106;
  void *v107;
  void *v108;
  double v109;
  void *v110;
  void *v111;
  NSObject *v112;
  NSObject *v113;
  NSMutableArray *previousMultiPerson2DResult;
  NSObject *v115;
  uint64_t v116;
  int v117;
  void *v118;
  unint64_t n;
  void *v120;
  uint64_t v121;
  ABPKSinglePerson2DResult *v122;
  uint64_t v123;
  NSMutableArray *v124;
  NSObject *v125;
  uint64_t v126;
  int v128;
  id v129;
  id v130;
  double v131;
  ABPKMultiPerson2DTracking *v132;
  void *__p;
  _BYTE *v134;
  uint64_t v135;
  void *v136;
  char *v137;
  unint64_t v138;
  _QWORD v139[2];
  uint8_t v140[4];
  double v141;
  __int16 v142;
  uint64_t v143;
  _BYTE buf[22];
  __int16 v145;
  uint64_t v146;
  __int16 v147;
  uint64_t v148;
  uint64_t v149;

  v149 = *MEMORY[0x24BDAC8D0];
  v129 = a6;
  -[ABPKMultiPerson2DTracking _startMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:](self, "_startMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:", a5);
  -[NSMutableArray removeAllObjects](self->_trackedBodies, "removeAllObjects");
  -[ABPKPersonIDTracker runWithInput:atTimeStamp:andOutput:](self->_abpkPersonIDTracker, "runWithInput:atTimeStamp:andOutput:", a3, self->_trackedBodies, a5);
  v132 = self;
  if (-[NSMutableArray count](self->_trackedBodies, "count"))
  {
    __ABPKLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_DEBUG, " Found full bodies in the image ", buf, 2u);
    }

    for (i = 0; -[NSMutableArray count](v132->_trackedBodies, "count") > i; ++i)
    {
      __ABPKLogSharedInstance();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        -[NSMutableArray objectAtIndexedSubscript:](v132->_trackedBodies, "objectAtIndexedSubscript:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "objectID");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " Person Tracking Id: %lu ", buf, 0xCu);

      }
      -[NSMutableArray objectAtIndexedSubscript:](v132->_trackedBodies, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "boundingBox");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;

      __ABPKLogSharedInstance();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218752;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v17;
        v145 = 2048;
        v146 = v23;
        v147 = 2048;
        v148 = v21;
        _os_log_impl(&dword_210836000, v24, OS_LOG_TYPE_DEBUG, " Bounding Box: (%f,%f,%f,%f ", buf, 0x2Au);
      }

    }
  }
  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v128 = -[ABPKMultiPerson2DTracking runPoseEstimationWithInput:abpkDeviceOrientation:atTimeStamp:andOutput:](v132, "runPoseEstimationWithInput:abpkDeviceOrientation:atTimeStamp:andOutput:", a3, a4, v25, a5);
  __ABPKLogSharedInstance();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v25;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v28 = objc_msgSend(v25, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v28;
    _os_log_impl(&dword_210836000, v26, OS_LOG_TYPE_DEBUG, " Humans detected: %lu ", buf, 0xCu);
  }

  __ABPKLogSharedInstance();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v29, OS_LOG_TYPE_DEBUG, " ANST Bounding boxes ", buf, 2u);
  }

  for (j = 0; -[NSMutableArray count](v132->_trackedBodies, "count") > j; ++j)
  {
    __ABPKLogSharedInstance();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = j;
      _os_log_impl(&dword_210836000, v31, OS_LOG_TYPE_DEBUG, " Person: %d ", buf, 8u);
    }

    -[NSMutableArray objectAtIndexedSubscript:](v132->_trackedBodies, "objectAtIndexedSubscript:", j);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "boundingBox");
    printCGRect(v33, v34, v35, v36);

  }
  __ABPKLogSharedInstance();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v37, OS_LOG_TYPE_DEBUG, " 2d Skeleton Bounding boxes ", buf, 2u);
  }

  for (k = 0; objc_msgSend(v25, "count") > k; ++k)
  {
    __ABPKLogSharedInstance();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = k;
      _os_log_impl(&dword_210836000, v39, OS_LOG_TYPE_DEBUG, " Person: %d ", buf, 8u);
    }

    objc_msgSend(v25, "objectAtIndexedSubscript:", k);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "boundingBox");
    printCGRect(v41, v42, v43, v44);

  }
  -[ABPKMultiPerson2DTracking _startMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:](v132, "_startMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:", a5);
  __ABPKLogSharedInstance();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v45, OS_LOG_TYPE_DEBUG, " Computing tracking ids ", buf, 2u);
  }

  std::vector<unsigned long>::vector(buf, objc_msgSend(v25, "count"));
  *(double *)&v46 = 0.0;
  v136 = 0;
  v137 = 0;
  v138 = 0;
  while (v46 < objc_msgSend(v25, "count"))
  {
    __ABPKLogSharedInstance();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v140 = 134217984;
      v141 = *(double *)&v46;
      _os_log_impl(&dword_210836000, v47, OS_LOG_TYPE_DEBUG, " Finding tracking id for skeleton: %lu ", v140, 0xCu);
    }

    *(double *)&v48 = 0.0;
    *(double *)&v49 = NAN;
    v50 = -10000.0;
    while (v48 < -[NSMutableArray count](v132->_trackedBodies, "count"))
    {
      __ABPKLogSharedInstance();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        -[NSMutableArray objectAtIndexedSubscript:](v132->_trackedBodies, "objectAtIndexedSubscript:", v48);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "objectID");
        *(_DWORD *)v140 = 134218240;
        v141 = *(double *)&v48;
        v142 = 2048;
        v143 = v53;
        _os_log_impl(&dword_210836000, v51, OS_LOG_TYPE_DEBUG, " \t Comparing with ANST tracked body %lu with objec-id: %lu ", v140, 0x16u);

      }
      __p = 0;
      v134 = 0;
      v135 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v136, (uint64_t)v137, (v137 - (_BYTE *)v136) >> 3);
      -[NSMutableArray objectAtIndexedSubscript:](v132->_trackedBodies, "objectAtIndexedSubscript:", v48);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "objectID");
      if (v134 == __p)
      {
        v58 = 0;
      }
      else
      {
        v56 = (v134 - (_BYTE *)__p) >> 3;
        if (v56 <= 1)
          v57 = 1;
        else
          v57 = (v134 - (_BYTE *)__p) >> 3;
        if (*(_QWORD *)__p == v55)
        {
          v58 = 1;
        }
        else
        {
          v59 = 1;
          do
          {
            v60 = v59;
            if (v57 == v59)
              break;
            v61 = *((_QWORD *)__p + v59++);
          }
          while (v61 != v55);
          v58 = v60 < v56;
        }
      }

      if (__p)
      {
        v134 = __p;
        operator delete(__p);
      }
      if (v58)
      {
        __ABPKLogSharedInstance();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v140 = 0;
          _os_log_impl(&dword_210836000, v62, OS_LOG_TYPE_DEBUG, " \t Skipping. Tracking id already assigned ", v140, 2u);
        }
        goto LABEL_57;
      }
      objc_msgSend(v27, "objectAtIndexedSubscript:", v46);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "boundingBox");
      v65 = v64;
      v67 = v66;
      v69 = v68;
      v71 = v70;
      -[NSMutableArray objectAtIndexedSubscript:](v132->_trackedBodies, "objectAtIndexedSubscript:", v48);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "boundingBox");
      v77 = computeIOUbetweenRects(v65, v67, v69, v71, v73, v74, v75, v76);

      __ABPKLogSharedInstance();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v140 = 134217984;
        v141 = v77;
        _os_log_impl(&dword_210836000, v78, OS_LOG_TYPE_DEBUG, " \t\t iou: %f ", v140, 0xCu);
      }

      if (v77 > v50)
      {
        -[NSMutableArray objectAtIndexedSubscript:](v132->_trackedBodies, "objectAtIndexedSubscript:", v48);
        v62 = objc_claimAutoreleasedReturnValue();
        *(double *)&v49 = COERCE_DOUBLE(-[NSObject objectID](v62, "objectID"));
        v50 = v77;
LABEL_57:

      }
      ++v48;
    }
    __ABPKLogSharedInstance();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v140 = 134217984;
      v141 = v50;
      _os_log_impl(&dword_210836000, v79, OS_LOG_TYPE_DEBUG, " \t Maximum IOU: %f ", v140, 0xCu);
    }

    if (v50 >= 0.0)
    {
      v81 = v132;
      if (*(double *)&v49 == NAN)
        goto LABEL_66;
    }
    else
    {
      __ABPKLogSharedInstance();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v140 = 0;
        _os_log_impl(&dword_210836000, v80, OS_LOG_TYPE_DEBUG, " IOU is lower than threshold. No closest human found from the previous frame. Assigning new tracking id ", v140, 2u);
      }

      v81 = v132;
LABEL_66:
      v49 = v81->_lastTrackingId + 1;
      v81->_lastTrackingId = v49;
    }
    *(double *)(*(_QWORD *)buf + 8 * v46) = *(double *)&v49;
    __ABPKLogSharedInstance();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v140 = 134217984;
      v141 = *(double *)&v49;
      _os_log_impl(&dword_210836000, v82, OS_LOG_TYPE_DEBUG, " \t Tracking id: %lu ", v140, 0xCu);
    }

    v83 = v137;
    if ((unint64_t)v137 >= v138)
    {
      v86 = (char *)v136;
      v87 = (v137 - (_BYTE *)v136) >> 3;
      v88 = v87 + 1;
      if ((unint64_t)(v87 + 1) >> 61)
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      v85 = v27;
      v89 = v138 - (_QWORD)v136;
      if ((uint64_t)(v138 - (_QWORD)v136) >> 2 > v88)
        v88 = v89 >> 2;
      if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF8)
        v90 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v90 = v88;
      if (v90)
      {
        v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v138, v90);
        v86 = (char *)v136;
        v83 = v137;
      }
      else
      {
        v91 = 0;
      }
      v92 = &v91[8 * v87];
      *(double *)v92 = *(double *)&v49;
      v84 = v92 + 8;
      while (v83 != v86)
      {
        v93 = *((_QWORD *)v83 - 1);
        v83 -= 8;
        *((_QWORD *)v92 - 1) = v93;
        v92 -= 8;
      }
      v136 = v92;
      v137 = v84;
      v138 = (unint64_t)&v91[8 * v90];
      if (v86)
        operator delete(v86);
    }
    else
    {
      *(double *)v137 = *(double *)&v49;
      v84 = v83 + 8;
      v85 = v27;
    }
    v137 = v84;
    objc_msgSend(v85, "objectAtIndexedSubscript:", v46);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "skeletonDefinition");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "jointCount");

    v130 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v97 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v98 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v96)
    {
      for (m = 0; m != v96; ++m)
      {
        objc_msgSend(v27, "objectAtIndexedSubscript:", v46);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = *(double *)(objc_msgSend(v100, "keypoints2d") + 8 * m);

        objc_msgSend(v27, "objectAtIndexedSubscript:", v46);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = *(_DWORD *)(objc_msgSend(v101, "confidences") + 4 * m);

        objc_msgSend(v27, "objectAtIndexedSubscript:", v46);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = *(unsigned int *)(objc_msgSend(v103, "visibility") + 4 * m);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v131);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v139[0] = v105;
        HIDWORD(v106) = HIDWORD(v131);
        LODWORD(v106) = HIDWORD(v131);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v139[1] = v107;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v139, 2);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "addObject:", v108);

        LODWORD(v109) = v102;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "addObject:", v110);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v104);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "addObject:", v111);

      }
    }

    ++v46;
    v25 = v27;
  }
  -[ABPKMultiPerson2DTracking _endMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:](v132, "_endMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:", a5);
  __ABPKLogSharedInstance();
  v112 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v140 = 0;
    _os_log_impl(&dword_210836000, v112, OS_LOG_TYPE_DEBUG, " Creating result ", v140, 2u);
  }

  if (v128)
  {
    __ABPKLogSharedInstance();
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v140 = 0;
      _os_log_impl(&dword_210836000, v113, OS_LOG_TYPE_ERROR, " Pose not valid. Skipping ", v140, 2u);
    }

    previousMultiPerson2DResult = v132->_previousMultiPerson2DResult;
    v132->_previousMultiPerson2DResult = 0;

    __ABPKLogSharedInstance();
    v115 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&v116 = COERCE_DOUBLE(-[NSMutableArray count](v132->_previousMultiPerson2DResult, "count"));
      *(_DWORD *)v140 = 134217984;
      v141 = *(double *)&v116;
      _os_log_impl(&dword_210836000, v115, OS_LOG_TYPE_DEBUG, " _previousMultiPerson2DResult count: %lu ", v140, 0xCu);
    }

    v117 = -6661;
    v118 = v27;
  }
  else
  {
    for (n = 0; n < objc_msgSend(v27, "count"); ++n)
    {
      objc_msgSend(v27, "objectAtIndexedSubscript:", n);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = *(_QWORD *)(*(_QWORD *)buf + 8 * n);
      v122 = objc_alloc_init(ABPKSinglePerson2DResult);
      -[ABPKSinglePerson2DResult set2dSkeleton:isPoseValid:trackingId:](v122, "set2dSkeleton:isPoseValid:trackingId:", v120, 1, v121);
      objc_msgSend(v129, "addObject:", v122);

    }
    v123 = objc_msgSend(v129, "mutableCopy");
    v124 = v132->_previousMultiPerson2DResult;
    v132->_previousMultiPerson2DResult = (NSMutableArray *)v123;

    __ABPKLogSharedInstance();
    v125 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&v126 = COERCE_DOUBLE(-[NSMutableArray count](v132->_previousMultiPerson2DResult, "count"));
      *(_DWORD *)v140 = 134217984;
      v141 = *(double *)&v126;
      _os_log_impl(&dword_210836000, v125, OS_LOG_TYPE_DEBUG, " _previousMultiPerson2DResult count: %lu ", v140, 0xCu);
    }

    v118 = v27;
    -[ABPKMultiPerson2DTracking _endMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:](v132, "_endMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:", a5);
    v117 = 0;
  }
  if (v136)
  {
    v137 = (char *)v136;
    operator delete(v136);
  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }

  return v117;
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
  -[ABPKMultiPerson2DTracking _startMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:](self, "_startMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:", a5);
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
        -[ABPKMultiPerson2DTracking _endMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:](self, "_endMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:", a5);
        -[ABPKMultiPerson2DTracking _startMultiPerson2DTracking2DDetectionMLSignpostWithTimestamp:](self, "_startMultiPerson2DTracking2DDetectionMLSignpostWithTimestamp:", a5);
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
          -[ABPKMultiPerson2DTracking _endMultiPerson2DTracking2DDetectionPostProcessingSignpostWithTimestamp:](self, "_endMultiPerson2DTracking2DDetectionPostProcessingSignpostWithTimestamp:", a5);
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

- (CGRect)_rotateBoundingBoxToPortrait:(CGRect)a3 withImageRes:(CGSize)a4
{
  CGFloat width;
  CGFloat v5;
  double v6;
  double v7;
  double height;
  double v9;
  CGRect result;

  width = a3.size.width;
  v5 = a4.width * 0.5 - (a3.origin.y - a4.width * 0.5);
  v6 = a4.height * 0.5 + a3.origin.x - a4.height * 0.5;
  v7 = v5 - a3.size.height;
  height = a3.size.height;
  v9 = width;
  result.size.height = v9;
  result.size.width = height;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (BOOL)overlayTrackedBodiesOnImage:(__CVBuffer *)a3 andGenerateOverlayImage:(__CVBuffer *)a4
{
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  size_t Width;
  size_t Height;
  NSObject *v12;
  unint64_t v13;
  __int128 v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __CVBuffer *v28;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  size_t v33;
  __int16 v34;
  size_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = operator new(0xC0uLL);
  *v7 = xmmword_210881570;
  v7[1] = xmmword_210881580;
  *(_QWORD *)&v8 = 255;
  *((_QWORD *)&v8 + 1) = 255;
  v7[2] = xmmword_210881590;
  v7[3] = v8;
  v7[4] = xmmword_2108815A0;
  v7[5] = xmmword_2108815B0;
  *(_QWORD *)&v9 = 0xFF000000FFLL;
  *((_QWORD *)&v9 + 1) = 0xFF000000FFLL;
  LOBYTE(v8) = 0;
  BYTE8(v8) = 0;
  v7[6] = v9;
  v7[7] = v8;
  v7[8] = xmmword_2108815C0;
  v7[9] = xmmword_2108815D0;
  v7[10] = xmmword_2108815E0;
  v7[11] = xmmword_2108815F0;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  __ABPKLogSharedInstance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v33 = Height;
    v34 = 2048;
    v35 = Width;
    _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " \x10overlayTrackedBodiesOnImage inputimage res: (h,w) = (%lu,%lu) ", buf, 0x16u);
  }

  v13 = 0;
  *(_QWORD *)&v14 = 134217984;
  v30 = v14;
  while (v13 < -[NSMutableArray count](self->_trackedBodies, "count", v30))
  {
    __ABPKLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_trackedBodies, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "objectID");
      *(_DWORD *)buf = v30;
      v33 = v17;
      _os_log_impl(&dword_210836000, v15, OS_LOG_TYPE_DEBUG, " \x10Overlaying result for Tracked Body with iD: %lu ", buf, 0xCu);

    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_trackedBodies, "objectAtIndexedSubscript:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v7[objc_msgSend(v18, "objectID") % 0xCuLL];

    -[NSMutableArray objectAtIndexedSubscript:](self->_trackedBodies, "objectAtIndexedSubscript:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "boundingBox");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    if (v13)
      v28 = a4;
    else
      v28 = a3;
    overlay2dBoundingBox((uint64_t)v28, (uint64_t)a4, v21, v23, v25, v27, *(double *)&v31);
    ++v13;
  }
  operator delete(v7);
  return 1;
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
  __int128 v14;
  __CVBuffer *v15;
  __int128 v17;
  uint8_t buf[4];
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
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
  v17 = 0x8000100uLL;
  while (v9 < objc_msgSend(v7, "count", v17))
  {
    __ABPKLogSharedInstance();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v17;
      v19 = v9;
      _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " \x10Overlaying result for Person: %lu ", buf, 0xCu);
    }

    objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8[objc_msgSend(v13, "trackingId") % 0xC];
    if (v9)
      v15 = a5;
    else
      v15 = a4;
    objc_msgSend(v13, "overlayResultOnImage:withResult:withColor:", v15, a5, *(double *)&v14);

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

- (void)_startMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMultiPerson2DTracking2DDetectionMLSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMultiPerson2DTracking2DDetectionMLSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMultiPerson2DTracking2DDetectionPostProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMultiPerson2DTracking2DDetectionPostProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedBodies, 0);
  objc_storeStrong((id *)&self->_previousMultiPerson2DResult, 0);
  objc_storeStrong((id *)&self->_poseEstimation2D, 0);
  objc_storeStrong((id *)&self->_config2D, 0);
  objc_storeStrong((id *)&self->_abpkPersonIDTracker, 0);
}

@end

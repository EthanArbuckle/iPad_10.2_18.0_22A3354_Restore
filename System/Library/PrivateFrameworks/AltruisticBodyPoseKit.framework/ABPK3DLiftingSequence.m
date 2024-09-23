@implementation ABPK3DLiftingSequence

- (ABPK3DLiftingSequence)init
{
  NSObject *v3;
  ABPK3DLiftingSequence *v4;
  ABPK3DLiftingSequence *v5;
  ABPKMLModelConfiguration3DLiftingSequenceFirstStage *v6;
  ABPKMLModelConfiguration3DLiftingSequenceFirstStage *mlConfigFirstStage;
  float *v8;
  unsigned int v9;
  float v10;
  float v11;
  float *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  float *v18;
  void *v19;
  int v20;
  float *v21;
  unint64_t v22;
  vector<float, std::allocator<float>> *p_gaussianSmoothingFilter;
  float *begin;
  ABPKSkeletonDefinition *v25;
  ABPKSkeletonDefinition *abpkLiftingSkeletonDefinition;
  ABPK3DLiftingSequence *v27;
  void *__p[2];
  float *v30;
  objc_super v31;

  -[ABPK3DLiftingSequence _startLoading3DLiftingSequenceMLModelSignpost](self, "_startLoading3DLiftingSequenceMLModelSignpost");
  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ", (uint8_t *)__p, 2u);
  }

  v31.receiver = self;
  v31.super_class = (Class)ABPK3DLiftingSequence;
  v4 = -[ABPK3DLiftingSequence init](&v31, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_32;
  v6 = objc_alloc_init(ABPKMLModelConfiguration3DLiftingSequenceFirstStage);
  mlConfigFirstStage = v4->_mlConfigFirstStage;
  v4->_mlConfigFirstStage = v6;

  std::vector<simd_float4x4>::resize((uint64_t)&v4->_liftingResultAsModelPoses, 0x11uLL);
  v8 = 0;
  v9 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v30 = 0;
  v10 = 0.0;
  do
  {
    v11 = 0.0;
    if (v9 <= 8)
      v11 = exp((float)(int)(v9 - 8) * (float)(int)(v9 - 8) * -0.125);
    if (v8 >= v30)
    {
      v12 = (float *)__p[0];
      v13 = ((char *)v8 - (char *)__p[0]) >> 2;
      v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 62)
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      v15 = (char *)v30 - (char *)__p[0];
      if (((char *)v30 - (char *)__p[0]) >> 1 > v14)
        v14 = v15 >> 1;
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
        v16 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v16 = v14;
      if (v16)
      {
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v30, v16);
        v12 = (float *)__p[0];
        v8 = (float *)__p[1];
      }
      else
      {
        v17 = 0;
      }
      v18 = (float *)&v17[4 * v13];
      *v18 = v11;
      v19 = v18 + 1;
      while (v8 != v12)
      {
        v20 = *((_DWORD *)v8-- - 1);
        *((_DWORD *)v18-- - 1) = v20;
      }
      __p[0] = v18;
      __p[1] = v19;
      v30 = (float *)&v17[4 * v16];
      if (v12)
        operator delete(v12);
      v8 = (float *)v19;
    }
    else
    {
      *v8++ = v11;
    }
    __p[1] = v8;
    v10 = v10 + v11;
    ++v9;
  }
  while (v9 != 17);
  v21 = (float *)__p[0];
  if (v8 != __p[0])
  {
    v22 = ((char *)v8 - (char *)__p[0]) >> 2;
    if (v22 <= 1)
      v22 = 1;
    do
    {
      *v21 = *v21 / v10;
      ++v21;
      --v22;
    }
    while (v22);
  }
  p_gaussianSmoothingFilter = &v4->_gaussianSmoothingFilter;
  begin = v5->_gaussianSmoothingFilter.__begin_;
  if (begin)
  {
    v5->_gaussianSmoothingFilter.__end_ = begin;
    operator delete(begin);
    p_gaussianSmoothingFilter->__begin_ = 0;
    p_gaussianSmoothingFilter->__end_ = 0;
    p_gaussianSmoothingFilter->__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_gaussianSmoothingFilter->__begin_ = *(_OWORD *)__p;
  v5->_gaussianSmoothingFilter.__end_cap_.__value_ = v30;
  v5->_frameCount = 0;
  v25 = -[ABPKSkeletonDefinition initWithType:]([ABPKSkeletonDefinition alloc], "initWithType:", 3);
  abpkLiftingSkeletonDefinition = v5->_abpkLiftingSkeletonDefinition;
  v5->_abpkLiftingSkeletonDefinition = v25;

  if (!-[ABPK3DLiftingSequence initMLNetwork](v5, "initMLNetwork"))
  {
    v27 = 0;
  }
  else
  {
LABEL_32:
    -[ABPK3DLiftingSequence _endLoading3DLiftingSequenceMLModelSignpost](v5, "_endLoading3DLiftingSequenceMLModelSignpost", __p[0]);
    v27 = v5;
  }

  return v27;
}

- (void)updateInputImageResolution:(CGSize)a3
{
  *(CGSize *)&self->_imageWidth = a3;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ABPK3DLiftingSequence;
  -[ABPK3DLiftingSequence dealloc](&v3, sel_dealloc);
}

- (BOOL)initMLNetwork
{
  NSObject *v3;
  void *v4;
  NSArray *v5;
  NSArray *inputTensorFirstStageNames;
  NSArray *v7;
  NSArray *outputTensorFirstStageNames;
  ABPKMLNetworkV2 *v9;
  ABPKMLNetworkV2 *networkV2;
  NSMutableDictionary *v11;
  NSMutableDictionary *inputBufferDict;
  NSMutableDictionary *v13;
  NSMutableDictionary *outputBufferDict;
  void *context;
  const char *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  BOOL v26;
  NSObject *v27;
  std::__shared_weak_count *v29;
  uint8_t buf[16];
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ML Network - first stage ", buf, 2u);
  }

  -[ABPKMLModelConfiguration3DLiftingSequenceFirstStage compiledMLModelPath](self->_mlConfigFirstStage, "compiledMLModelPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_21;
  -[ABPKMLModelConfiguration3DLiftingSequenceFirstStage inputTensorNames](self->_mlConfigFirstStage, "inputTensorNames");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputTensorFirstStageNames = self->_inputTensorFirstStageNames;
  self->_inputTensorFirstStageNames = v5;

  -[ABPKMLModelConfiguration3DLiftingSequenceFirstStage outputTensorNames](self->_mlConfigFirstStage, "outputTensorNames");
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputTensorFirstStageNames = self->_outputTensorFirstStageNames;
  self->_outputTensorFirstStageNames = v7;

  if (!objc_msgSend(v4, "hasSuffix:", CFSTR(".bundle")))
  {
    context = (void *)espresso_create_context();
    self->_context_first_stage = context;
    if (context)
    {
      v16 = "ANE";
LABEL_10:
      __ABPKLogSharedInstance();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v16;
        _os_log_impl(&dword_210836000, v18, OS_LOG_TYPE_DEFAULT, " \t Deploying 3D lifting model on %s ", buf, 0xCu);
      }

      Espresso::get_internal_context((Espresso *)self->_context_first_stage, v19);
      self->_plan_first_stage = (void *)espresso_create_plan();
      objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v20, "UTF8String");
      espresso_plan_add_network();
      espresso_plan_build();
      -[NSArray objectAtIndexedSubscript:](self->_inputTensorFirstStageNames, "objectAtIndexedSubscript:", 0);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "UTF8String");
      espresso_network_bind_buffer();

      -[NSArray objectAtIndexedSubscript:](self->_outputTensorFirstStageNames, "objectAtIndexedSubscript:", 0);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v22, "UTF8String");
      espresso_network_bind_buffer();

      *(_OWORD *)buf = 0u;
      v31 = 0u;
      -[NSArray objectAtIndexedSubscript:](self->_inputTensorFirstStageNames, "objectAtIndexedSubscript:", 0);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v23, "UTF8String");
      espresso_network_query_blob_dimensions();

      if (v29)
      {
        p_shared_owners = (unint64_t *)&v29->__shared_owners_;
        do
          v25 = __ldaxr(p_shared_owners);
        while (__stlxr(v25 - 1, p_shared_owners));
        if (!v25)
        {
          ((void (*)())v29->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v29);
        }
      }
      goto LABEL_17;
    }
    v17 = (void *)espresso_create_context();
    self->_context_first_stage = v17;
    if (v17)
    {
      v16 = "GPU";
      goto LABEL_10;
    }
    __ABPKLogSharedInstance();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v27, OS_LOG_TYPE_ERROR, " ANE not available. GPU not available. Espresso context creation failed for 3D lifting model. ", buf, 2u);
    }

LABEL_21:
    v26 = 0;
    goto LABEL_22;
  }
  self->_useEspressoV2 = 1;
  v9 = -[ABPKMLNetworkV2 initWithNetworkPath:networkConfig:inputNames:outputNames:useSurface:]([ABPKMLNetworkV2 alloc], "initWithNetworkPath:networkConfig:inputNames:outputNames:useSurface:", v4, CFSTR("main"), self->_inputTensorFirstStageNames, self->_outputTensorFirstStageNames, 0);
  networkV2 = self->_networkV2;
  self->_networkV2 = v9;

  -[ABPKMLNetworkV2 inputBuffers](self->_networkV2, "inputBuffers");
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  inputBufferDict = self->_inputBufferDict;
  self->_inputBufferDict = v11;

  -[ABPKMLNetworkV2 outputBuffers](self->_networkV2, "outputBuffers");
  v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  outputBufferDict = self->_outputBufferDict;
  self->_outputBufferDict = v13;

LABEL_17:
  v26 = 1;
LABEL_22:

  return v26;
}

- (int)runLiftingModelWithData:(id)a3 atTimestamp:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;

  v6 = a3;
  if (objc_msgSend(v6, "rotation") && objc_msgSend(v6, "rotation") != 180)
  {
    objc_msgSend(v6, "imageResolution");
    v9 = v10;
    objc_msgSend(v6, "imageResolution");
    v7 = v11;
  }
  else
  {
    objc_msgSend(v6, "imageResolution");
    v9 = v8;
  }
  v12 = -[ABPK3DLiftingSequence runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:](self, "runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:", v6, 1, v9, v7, a4);

  return v12;
}

- (int)runLiftingModelWithData:(id)a3 imageResolution:(CGSize)a4 deviceOrientation:(int64_t)a5 atTimestamp:(double)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  RingBuffer<std::vector<std::array<float, 3>>, 243UL> *p__3DLiftingInputBuffer;
  unint64_t insertionIndex;
  __int128 v17;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  array<std::vector<std::array<float, 3>>, 243UL> *p_storage;
  vector<std::array<float, 3>, std::allocator<std::array<float, 3>>> *v20;
  void *begin;
  unint64_t v22;
  unint64_t v23;
  NSObject *v24;
  int v25;
  __int128 v27;
  uint8_t v28[16];
  ABPK2DDetectionResult v29;

  height = a4.height;
  width = a4.width;
  *(_QWORD *)v29._anon_28 = *MEMORY[0x24BDAC8D0];
  v29.super.isa = *(Class *)&a4.width;
  v29._rawJoints.var0 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)&a4.height;
  v11 = a3;
  -[ABPK3DLiftingSequence _startPrepareLiftingSequenceInputSignpostWithTimestamp:](self, "_startPrepareLiftingSequenceInputSignpostWithTimestamp:", a6);
  __ABPKLogSharedInstance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v29._anon_10 = 134218240;
    *(CGFloat *)&v29._anon_10[4] = width;
    *(_WORD *)&v29._anon_10[12] = 2048;
    *(CGFloat *)&v29._anon_10[14] = height;
    _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " runLiftingModelWithData resolution: (w,h) = (%f,%f) ", v29._anon_10, 0x16u);
  }

  __ABPKLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_msgSend(v11, "rotation");
    *(_DWORD *)v29._anon_10 = 134217984;
    *(_QWORD *)&v29._anon_10[4] = v14;
    _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " runLiftingModelWithData rotation: %ld ", v29._anon_10, 0xCu);
  }

  abpk::GetRawDetectionXYVisbilityWithRawDetection2D((abpk *)v11, (float64x2_t *)&v29, (uint64_t)v29._anon_10);
  abpk::Normalize2DCoordinatesSquareCrop((float **)v29._anon_10, (double *)&v29, a5);
  p__3DLiftingInputBuffer = &self->_3DLiftingInputBuffer;
  insertionIndex = self->_3DLiftingInputBuffer._insertionIndex;
  if (!self->_3DLiftingInputBuffer._filled && !insertionIndex)
  {
    -[ABPK3DLiftingSequence updateInputImageResolution:](self, "updateInputImageResolution:", *(double *)&v29.super.isa, *(double *)&v29._rawJoints.var0);
    insertionIndex = p__3DLiftingInputBuffer->_insertionIndex;
  }
  v17 = *(_OWORD *)v29._anon_10;
  var0 = v29._rotatedJoints.var0;
  memset(v29._anon_10, 0, 24);
  p_storage = &self->_3DLiftingInputBuffer._storage;
  v20 = &self->_3DLiftingInputBuffer._storage.__elems_[insertionIndex];
  begin = v20->__begin_;
  v22 = insertionIndex;
  if (v20->__begin_)
  {
    p_storage->__elems_[insertionIndex].__end_ = begin;
    v27 = v17;
    operator delete(begin);
    v17 = v27;
    v20->__end_ = 0;
    v20->__end_cap_.__value_ = 0;
    v20->__begin_ = 0;
    v22 = p__3DLiftingInputBuffer->_insertionIndex;
  }
  *(_OWORD *)&v20->__begin_ = v17;
  p_storage->__elems_[insertionIndex].__end_cap_.__value_ = var0;
  v23 = v22 + 1;
  p__3DLiftingInputBuffer->_insertionIndex = v23;
  if (v23 == 243)
  {
    p__3DLiftingInputBuffer->_insertionIndex = 0;
    self->_3DLiftingInputBuffer._filled = 1;
  }
  -[ABPK3DLiftingSequence _endPrepareLiftingSequenceInputSignpostWithTimestamp:](self, "_endPrepareLiftingSequenceInputSignpostWithTimestamp:", a6, v27);
  if (-[ABPK3DLiftingSequence runLiftingModelWithBuffer:with2DReferenceResults:atTimestamp:exportDebuggingData:](self, "runLiftingModelWithBuffer:with2DReferenceResults:atTimestamp:exportDebuggingData:", &self->_3DLiftingInputBuffer, v11, 0, a6))
  {
    __ABPKLogSharedInstance();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_210836000, v24, OS_LOG_TYPE_DEBUG, " \t\t Failed to run Lifting ML model ", v28, 2u);
    }

    v25 = -6662;
  }
  else
  {
    v25 = 0;
  }
  if (*(_QWORD *)v29._anon_10)
  {
    *(_QWORD *)&v29._anon_10[8] = *(_QWORD *)v29._anon_10;
    operator delete(*(void **)v29._anon_10);
  }

  return v25;
}

- (int)runLiftingModelWithBuffer:(const void *)a3 with2DReferenceResults:(id)a4 atTimestamp:(double)a5 exportDebuggingData:(BOOL)a6
{
  id v8;
  NSObject *v9;
  NSMutableDictionary *inputBufferDict;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *outputBufferDict;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  char *v31;
  int *v32;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  int v55;
  char *v56;
  RingBuffer<std::vector<float>, 9UL> *p_smoothingFilterRingBuffer;
  float *v58;
  float *v59;
  array<std::vector<float>, 9UL> *p_storage;
  unint64_t insertionIndex;
  vector<float, std::allocator<float>> *v62;
  float *begin;
  unint64_t v64;
  uint64_t v65;
  char *data;
  unint64_t v67;
  BOOL v68;
  uint64_t v69;
  int v70;
  char v71;
  unint64_t v72;
  unint64_t v73;
  char v74;
  unint64_t v75;
  char *v76;
  _DWORD *v77;
  char *v78;
  int v79;
  vector<float, std::allocator<float>> *v80;
  unint64_t v81;
  float *v82;
  float *v83;
  float32x2_t *v84;
  float32x2_t *v85;
  float32x4_t v86;
  int32x4_t v87;
  float32x2_t v88;
  float32x2_t v89;
  float32x4_t v90;
  float32x4_t v91;
  int32x4_t v92;
  float32x2_t v93;
  float32x2_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  int32x4_t v98;
  float32x2_t v99;
  float32x2_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  int32x4_t v104;
  float32x2_t v105;
  float32x2_t v106;
  int32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  ABPK3DLiftingResult *v111;
  ABPK3DLiftingResult *v112;
  ABPK3DLiftingResult *liftingResult;
  uint64_t frameCount;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  __int128 *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  void *v129;
  uint64_t v131;
  _DWORD *v132;
  char *v133;
  char *v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  unint64_t v138;
  char *v139;
  char *v140;
  int v141;
  BOOL *p_filled;
  _BOOL4 v143;
  void *v145[2];
  uint64_t v146;
  void *v147[2];
  uint64_t v148;
  void *v149[2];
  uint64_t v150;
  void *v151[2];
  uint64_t v152;
  void *__p;
  char *v154;
  char *v155;
  uint8_t buf[16];
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint64_t v168;

  v143 = a6;
  v168 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[ABPK3DLiftingSequence _startRunLiftingSequenceModelSignpostWithTimestamp:](self, "_startRunLiftingSequenceModelSignpostWithTimestamp:", a5);
  __ABPKLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Run Lifting Model With Data Buffer ", buf, 2u);
  }

  __p = 0;
  v154 = 0;
  v155 = 0;
  std::vector<float>::reserve(&__p, 0x30uLL);
  if (self->_useEspressoV2)
  {
    p_filled = &self->_smoothingFilterRingBuffer._filled;
    inputBufferDict = self->_inputBufferDict;
    -[NSArray objectAtIndexedSubscript:](self->_inputTensorFirstStageNames, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](inputBufferDict, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "bytes");
    v14 = objc_msgSend(v12, "strideHeight");
    outputBufferDict = self->_outputBufferDict;
    -[NSArray objectAtIndexedSubscript:](self->_outputTensorFirstStageNames, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](outputBufferDict, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = *(_QWORD *)a3;
    v20 = *(_QWORD *)a3 == 243;
    v21 = v13 + 4 * v14;
    v22 = 6 * v14;
    v23 = v13 + 2 * v14;
    while (1)
    {
      v24 = 0;
      v25 = *((unsigned __int8 *)a3 + 5840);
      v26 = v20;
      v27 = v19;
      do
      {
        v28 = v27 + 1;
        if (v27 + 1 <= 0xF2)
        {
          if (v26)
          {
            if (v28 >= v19)
              v28 = 243;
          }
          else
          {
            v26 = 0;
            v31 = (char *)a3 + 8;
            if (!v25)
              goto LABEL_21;
          }
LABEL_20:
          v31 = (char *)a3 + 24 * v27 + 8;
          goto LABEL_21;
        }
        v29 = v25 | v26;
        if (v26)
          v30 = v27 + 1;
        else
          v30 = v27 - 242;
        if (v30 >= v19)
          v28 = 243;
        else
          v28 = v30;
        v26 = 1;
        v31 = (char *)a3 + 8;
        if (v29)
          goto LABEL_20;
LABEL_21:
        v32 = (int *)(*(_QWORD *)v31 + 12 * v18);
        _S0 = *v32;
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v13 + v24) = _S0;
        _S0 = v32[1];
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v23 + v24) = _S0;
        _S0 = v32[2];
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v21 + v24) = _S0;
        v24 += 2;
        v27 = v28;
      }
      while (v24 != 486);
      ++v18;
      v21 += v22;
      v23 += v22;
      v13 += v22;
      if (v18 == 16)
      {
        -[ABPKMLNetworkV2 execute](self->_networkV2, "execute");
        -[ABPK3DLiftingSequence _endRunLiftingSequenceModelSignpostWithTimestamp:](self, "_endRunLiftingSequenceModelSignpostWithTimestamp:", a5);
        -[ABPK3DLiftingSequence _startPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:](self, "_startPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:", a5);
        v40 = v8;
        v41 = objc_msgSend(v17, "bytes");
        v42 = objc_msgSend(v17, "strideHeight");
        v43 = 0;
        v44 = v154;
        do
        {
          _H0 = *(_WORD *)(v41 + 2 * v42 * v43);
          __asm { FCVT            S9, H0 }
          if (v44 >= v155)
          {
            v48 = (char *)__p;
            v49 = (v44 - (_BYTE *)__p) >> 2;
            v50 = v49 + 1;
            if ((unint64_t)(v49 + 1) >> 62)
              std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
            v51 = v155 - (_BYTE *)__p;
            if ((v155 - (_BYTE *)__p) >> 1 > v50)
              v50 = v51 >> 1;
            if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL)
              v52 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v52 = v50;
            if (v52)
            {
              v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v155, v52);
              v48 = (char *)__p;
              v44 = v154;
            }
            else
            {
              v53 = 0;
            }
            v54 = &v53[4 * v49];
            *(_DWORD *)v54 = _S9;
            v47 = v54 + 4;
            while (v44 != v48)
            {
              v55 = *((_DWORD *)v44 - 1);
              v44 -= 4;
              *((_DWORD *)v54 - 1) = v55;
              v54 -= 4;
            }
            __p = v54;
            v154 = v47;
            v155 = &v53[4 * v52];
            if (v48)
              operator delete(v48);
          }
          else
          {
            *(_DWORD *)v44 = _S9;
            v47 = v44 + 4;
          }
          v154 = v47;
          ++v43;
          v44 = v47;
        }
        while (v43 != 48);

        v8 = v40;
        v56 = v154;
        goto LABEL_42;
      }
    }
  }
  v65 = 0;
  data = (char *)self->_inputTensorFirstStage.data;
  v67 = *(_QWORD *)a3;
  v68 = *(_QWORD *)a3 == 243;
  do
  {
    v69 = 0;
    v70 = *((unsigned __int8 *)a3 + 5840);
    v71 = v68;
    v72 = v67;
    do
    {
      v73 = v72 + 1;
      if (v72 + 1 <= 0xF2)
      {
        if (v71)
        {
          if (v73 >= v67)
            v73 = 243;
        }
        else
        {
          v71 = 0;
          v76 = (char *)a3 + 8;
          if (!v70)
            goto LABEL_61;
        }
LABEL_60:
        v76 = (char *)a3 + 24 * v72 + 8;
        goto LABEL_61;
      }
      v74 = v70 | v71;
      if (v71)
        v75 = v72 + 1;
      else
        v75 = v72 - 242;
      if (v75 >= v67)
        v73 = 243;
      else
        v73 = v75;
      v71 = 1;
      v76 = (char *)a3 + 8;
      if (v74)
        goto LABEL_60;
LABEL_61:
      v77 = (_DWORD *)(*(_QWORD *)v76 + 12 * v65);
      v78 = &data[v69];
      *(_DWORD *)v78 = *v77;
      *((_DWORD *)v78 + 243) = v77[1];
      *((_DWORD *)v78 + 486) = v77[2];
      v69 += 4;
      v72 = v73;
    }
    while (v69 != 972);
    ++v65;
    data += 2916;
  }
  while (v65 != 16);
  if (espresso_plan_execute_sync())
  {
    v79 = -6662;
  }
  else
  {
    -[ABPK3DLiftingSequence _endRunLiftingSequenceModelSignpostWithTimestamp:](self, "_endRunLiftingSequenceModelSignpostWithTimestamp:", a5);
    -[ABPK3DLiftingSequence _startPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:](self, "_startPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:", a5);
    p_filled = &self->_smoothingFilterRingBuffer._filled;
    v131 = 0;
    v132 = self->_outputTensorFirstStage.data;
    v133 = v154;
    do
    {
      if (v133 >= v155)
      {
        v134 = (char *)__p;
        v135 = (v133 - (_BYTE *)__p) >> 2;
        v136 = v135 + 1;
        if ((unint64_t)(v135 + 1) >> 62)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v137 = v155 - (_BYTE *)__p;
        if ((v155 - (_BYTE *)__p) >> 1 > v136)
          v136 = v137 >> 1;
        if ((unint64_t)v137 >= 0x7FFFFFFFFFFFFFFCLL)
          v138 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v138 = v136;
        if (v138)
        {
          v139 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v155, v138);
          v134 = (char *)__p;
          v133 = v154;
        }
        else
        {
          v139 = 0;
        }
        v140 = &v139[4 * v135];
        *(_DWORD *)v140 = v132[v131];
        v56 = v140 + 4;
        while (v133 != v134)
        {
          v141 = *((_DWORD *)v133 - 1);
          v133 -= 4;
          *((_DWORD *)v140 - 1) = v141;
          v140 -= 4;
        }
        __p = v140;
        v154 = v56;
        v155 = &v139[4 * v138];
        if (v134)
          operator delete(v134);
      }
      else
      {
        *(_DWORD *)v133 = v132[v131];
        v56 = v133 + 4;
      }
      v154 = v56;
      ++v131;
      v133 = v56;
    }
    while (v131 != 48);
LABEL_42:
    p_smoothingFilterRingBuffer = &self->_smoothingFilterRingBuffer;
    v58 = (float *)__p;
    v59 = (float *)v155;
    v154 = 0;
    v155 = 0;
    __p = 0;
    p_storage = &self->_smoothingFilterRingBuffer._storage;
    insertionIndex = self->_smoothingFilterRingBuffer._insertionIndex;
    v62 = &self->_smoothingFilterRingBuffer._storage.__elems_[insertionIndex];
    begin = v62->__begin_;
    if (v62->__begin_)
    {
      p_storage->__elems_[insertionIndex].__end_ = begin;
      operator delete(begin);
      v62->__end_ = 0;
      v62->__end_cap_.__value_ = 0;
      v62->__begin_ = 0;
      v64 = p_smoothingFilterRingBuffer->_insertionIndex;
    }
    else
    {
      v64 = self->_smoothingFilterRingBuffer._insertionIndex;
    }
    v62->__begin_ = v58;
    v80 = &p_storage->__elems_[insertionIndex];
    v80->__end_ = (float *)v56;
    v80->__end_cap_.__value_ = v59;
    v81 = v64 + 1;
    p_smoothingFilterRingBuffer->_insertionIndex = v81;
    if (v81 == 9)
    {
      self->_smoothingFilterRingBuffer._insertionIndex = 0;
      *p_filled = 1;
    }
    -[ABPK3DLiftingSequence getGaussianSmoothedOutput:](self, "getGaussianSmoothedOutput:", &self->_smoothingFilterRingBuffer);
    v149[0] = 0;
    v149[1] = 0;
    v150 = 0;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v149, v151[0], (uint64_t)v151[1], ((char *)v151[1] - (char *)v151[0]) >> 4);
    v82 = (float *)v149[0];
    v83 = (float *)v149[1];
    while (v82 != v83)
    {
      *v82 = -*v82;
      v82 += 4;
    }
    -[ABPK3DLiftingSequence _adjustBoneLength:](self, "_adjustBoneLength:", v149);
    v84 = (float32x2_t *)v149[0];
    v85 = (float32x2_t *)v149[1];
    if (v149[0] != v149[1])
    {
      v86 = *((float32x4_t *)v149[0] + 7);
      v87 = (int32x4_t)vmulq_f32(v86, v86);
      v87.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v87, 2), vadd_f32(*(float32x2_t *)v87.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v87.i8, 1))).u32[0];
      v88 = vrsqrte_f32((float32x2_t)v87.u32[0]);
      v89 = vmul_f32(v88, vrsqrts_f32((float32x2_t)v87.u32[0], vmul_f32(v88, v88)));
      v90 = vmulq_n_f32(v86, vmul_f32(v89, vrsqrts_f32((float32x2_t)v87.u32[0], vmul_f32(v89, v89))).f32[0]);
      v91 = *((float32x4_t *)v149[0] + 4);
      v92 = (int32x4_t)vmulq_f32(v91, v91);
      v92.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v92, 2), vadd_f32(*(float32x2_t *)v92.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v92.i8, 1))).u32[0];
      v93 = vrsqrte_f32((float32x2_t)v92.u32[0]);
      v94 = vmul_f32(v93, vrsqrts_f32((float32x2_t)v92.u32[0], vmul_f32(v93, v93)));
      v95 = vmulq_n_f32(v91, vmul_f32(v94, vrsqrts_f32((float32x2_t)v92.u32[0], vmul_f32(v94, v94))).f32[0]);
      v96 = vmulq_f32(v90, v95);
      v97 = vmlsq_lane_f32(v90, v95, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v96, 2), vaddq_f32(v96, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 1))), 0);
      v98 = (int32x4_t)vmulq_f32(v97, v97);
      v98.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v98, 2), vadd_f32(*(float32x2_t *)v98.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v98.i8, 1))).u32[0];
      v99 = vrsqrte_f32((float32x2_t)v98.u32[0]);
      v100 = vmul_f32(v99, vrsqrts_f32((float32x2_t)v98.u32[0], vmul_f32(v99, v99)));
      v101 = vmulq_n_f32(v97, vmul_f32(v100, vrsqrts_f32((float32x2_t)v98.u32[0], vmul_f32(v100, v100))).f32[0]);
      v102 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v101, (int32x4_t)v101), (int8x16_t)v101, 0xCuLL), vnegq_f32(v95)), v101, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v95, (int32x4_t)v95), (int8x16_t)v95, 0xCuLL));
      v103 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v102, (int32x4_t)v102), (int8x16_t)v102, 0xCuLL);
      v104 = (int32x4_t)vmulq_f32(v102, v102);
      v104.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v104.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v104, 2), *(float32x2_t *)v104.i8)).u32[0];
      v105 = vrsqrte_f32((float32x2_t)v104.u32[0]);
      v106 = vmul_f32(v105, vrsqrts_f32((float32x2_t)v104.u32[0], vmul_f32(v105, v105)));
      v107 = (int32x4_t)vmulq_n_f32(v103, vmul_f32(v106, vrsqrts_f32((float32x2_t)v104.u32[0], vmul_f32(v106, v106))).f32[0]);
      v108 = (float32x4_t)vzip1q_s32((int32x4_t)v95, (int32x4_t)v101);
      v108.i32[2] = v107.i32[0];
      v109 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v95, v107), vdupq_lane_s32(*(int32x2_t *)v101.f32, 1));
      v110 = (float32x4_t)vzip2q_s32((int32x4_t)v95, (int32x4_t)v101);
      v110.i32[2] = v107.i32[2];
      do
      {
        *(float32x4_t *)v84->f32 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v108, COERCE_FLOAT(*(_OWORD *)v84->f32)), v109, *v84, 1), v110, *(float32x4_t *)v84->f32, 2);
        v84 += 2;
      }
      while (v84 != v85);
    }
    v111 = [ABPK3DLiftingResult alloc];
    *(_OWORD *)v147 = *(_OWORD *)v149;
    v148 = v150;
    v149[1] = 0;
    v150 = 0;
    v149[0] = 0;
    *(_OWORD *)v145 = *(_OWORD *)v151;
    v146 = v152;
    v151[0] = 0;
    v151[1] = 0;
    v152 = 0;
    v112 = -[ABPK3DLiftingResult initWithJoints:rawNetworkOutputs:referenceDetectionResult:](v111, "initWithJoints:rawNetworkOutputs:referenceDetectionResult:", v147, v145, v8);
    liftingResult = self->_liftingResult;
    self->_liftingResult = v112;

    if (v145[0])
    {
      v145[1] = v145[0];
      operator delete(v145[0]);
    }
    if (v147[0])
    {
      v147[1] = v147[0];
      operator delete(v147[0]);
    }
    -[ABPK3DLiftingSequence _endPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:](self, "_endPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:", a5);
    if (v143)
    {
      frameCount = self->_frameCount;
      if (!(_DWORD)frameCount)
      {
        v115 = objc_alloc_init(MEMORY[0x24BDD1580]);
        objc_msgSend(v115, "removeItemAtPath:error:", CFSTR("/var/mobile/Documents/debug_lifting/"), 0);
        objc_msgSend(v115, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Documents/debug_lifting/"), 1, 0, 0);

        frameCount = self->_frameCount;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), frameCount);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "stringByAppendingString:", CFSTR(".plist"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("current_frame_3D_lifting_debug"), "stringByAppendingString:", v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();

      v119 = (__int128 *)self->_outputTensorFirstStage.data;
      v120 = v119[3];
      v122 = *v119;
      v121 = v119[1];
      v158 = v119[2];
      v159 = v120;
      *(_OWORD *)buf = v122;
      v157 = v121;
      v123 = v119[7];
      v125 = v119[4];
      v124 = v119[5];
      v162 = v119[6];
      v163 = v123;
      v160 = v125;
      v161 = v124;
      v126 = v119[11];
      v128 = v119[8];
      v127 = v119[9];
      v166 = v119[10];
      v167 = v126;
      v164 = v128;
      v165 = v127;
      objc_msgSend(CFSTR("/var/mobile/Documents/debug_lifting/"), "stringByAppendingPathComponent:", v118);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABPK3DLiftingSequence saveDataToFilePath:with2DInputBuffer:withFirstStageOutput:withSmoothedOutput:withPostprocessedLiftingResults:](self, "saveDataToFilePath:with2DInputBuffer:withFirstStageOutput:withSmoothedOutput:withPostprocessedLiftingResults:", v129, a3, buf, -[ABPK3DLiftingResult rawNetworkOutputJoints](self->_liftingResult, "rawNetworkOutputJoints"), -[ABPK3DLiftingResult joints](self->_liftingResult, "joints"));

    }
    ++self->_frameCount;
    if (v149[0])
    {
      v149[1] = v149[0];
      operator delete(v149[0]);
    }
    if (v151[0])
    {
      v151[1] = v151[0];
      operator delete(v151[0]);
    }
    v79 = 0;
  }
  if (__p)
  {
    v154 = (char *)__p;
    operator delete(__p);
  }

  return v79;
}

- (vector<float)getGaussianSmoothedOutput:()(ext_vector_type(3
{
  _QWORD *v3;
  _QWORD *v6;
  float *end;
  float *begin;
  BOOL v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  float v23;
  unint64_t *v24;
  __int128 v25;
  float v26;
  unint64_t *v27;
  float v28;
  uint64_t v29;
  unint64_t *v30;
  float v31;
  _QWORD *v32;
  unint64_t *v33;
  uint64_t v34;
  unsigned __int8 v35;

  v6 = v3;
  end = self->_gaussianSmoothingFilter.__end_;
  begin = self->_gaussianSmoothingFilter.__begin_;
  v9 = *(_QWORD *)a3 != 9 && *((_BYTE *)a3 + 224) == 0;
  v10 = (char *)a3 + 24 * *(_QWORD *)a3 + 8;
  if (v9)
    v10 = (char *)a3 + 8;
  v11 = *((_QWORD *)v10 + 1) - *(_QWORD *)v10;
  v12 = v11 >> 2;
  v32 = v6;
  v13 = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(v6, (v11 >> 2) / 3 + 2);
  if (v11 >= 1)
  {
    v14 = 0;
    v15 = end - begin;
    v16 = v15 + 1;
    v17 = (unint64_t)(v15 + 1) >> 1;
    if (v17 <= 1)
      v18 = 1;
    else
      v18 = (unint64_t)(v15 + 1) >> 1;
    while (1)
    {
      v33 = (unint64_t *)a3;
      v34 = 9;
      v35 = 1;
      v13 = abpk::RingBuffer<std::vector<float>,9ul>::Iterator<true>::operator-=(&v33, v17);
      if (v16 >= 2)
        break;
LABEL_28:
      v14 += 3;
      if (v12 <= v14)
        return (vector<float __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>>)v13;
    }
    v19 = 0;
    v20 = *v32 + 16 * (v14 / 3uLL) + 16;
    v21 = v35;
    v22 = v34;
    while (1)
    {
      v23 = self->_gaussianSmoothingFilter.__begin_[v19];
      v24 = &v33[3 * v22 + 1];
      if (!(*((unsigned __int8 *)v33 + 224) | v21))
        v24 = v33 + 1;
      v25 = *(_OWORD *)v20;
      v26 = COERCE_FLOAT(*(_OWORD *)v20) + (float)(v23 * *(float *)(*v24 + 4 * v14));
      *(float *)v20 = v26;
      v27 = v33 + 1;
      if (*((unsigned __int8 *)v33 + 224) | v35)
        v27 = &v33[3 * v34 + 1];
      v28 = *(float *)(*v27 + 4 * (v14 + 1));
      *(_DWORD *)(v20 + 8) = DWORD2(v25);
      *(float *)&v29 = v26;
      *((float *)&v29 + 1) = *((float *)&v25 + 1) + (float)(v23 * v28);
      *(_QWORD *)v20 = v29;
      v30 = v33 + 1;
      if (*((unsigned __int8 *)v33 + 224) | v35)
        v30 = &v33[3 * v34 + 1];
      v31 = *((float *)&v25 + 2) + (float)(v23 * *(float *)(*v30 + 4 * (v14 + 2)));
      *(_QWORD *)v20 = v29;
      *(float *)(v20 + 8) = v31;
      v22 = v34 + 1;
      if ((unint64_t)(v34 + 1) >= 9)
        break;
      ++v34;
      if (v35)
        goto LABEL_23;
      v21 = 0;
LABEL_27:
      if (v18 == ++v19)
        goto LABEL_28;
    }
    if (!v35)
    {
      v35 = 1;
      v22 = v34 - 8;
    }
    v34 = v22;
LABEL_23:
    if (v22 >= *v33)
    {
      v34 = 9;
      v21 = 1;
      v22 = 9;
    }
    else
    {
      v21 = 1;
    }
    goto LABEL_27;
  }
  return (vector<float __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>>)v13;
}

- (id)getLiftingResults
{
  return self->_liftingResult;
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)get3DLiftingResultsAsModelPoses
{
  uint64_t v3;
  uint64_t v4;
  __int128 *v5;
  float32x4_t v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  float32x4_t v11;
  float32x4_t *v12;
  float32x4_t v14;

  v3 = 0;
  v4 = 0;
  v5 = (__int128 *)MEMORY[0x24BDAEE00];
  v14 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  do
  {
    v6 = *(float32x4_t *)(-[ABPK3DLiftingResult joints](self->_liftingResult, "joints", *(_OWORD *)&v14) + v4);
    v7 = (_OWORD *)((char *)self->_liftingResultAsModelPoses.__begin_ + v3);
    v8 = *v5;
    v9 = v5[1];
    v10 = v5[3];
    v7[2] = v5[2];
    v7[3] = v10;
    *v7 = v8;
    v7[1] = v9;
    v11 = vdivq_f32(v6, v14);
    v12 = (float32x4_t *)((char *)self->_liftingResultAsModelPoses.__begin_ + v3);
    v11.i32[3] = v12[3].i32[3];
    v12[3] = v11;
    v4 += 16;
    v3 += 64;
  }
  while (v4 != 272);
  return self->_liftingResultAsModelPoses.__begin_;
}

- (void)saveDataToFilePath:(ABPK3DLiftingSequence *)self with2DInputBuffer:(SEL)a2 withFirstStageOutput:(id)a3 withSmoothedOutput:(const void *)a4 withPostprocessedLiftingResults:(float *)a5
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v9;
  id v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  int v16;
  int v17;
  id v18;
  char *v19;
  _DWORD *v20;
  _DWORD *v21;
  id v22;
  unint64_t v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  _DWORD *v32;
  id v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  id v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  id v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  float *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v61;
  unint64_t v62;
  id v63;
  int v64;
  id v65;
  uint64_t v66;
  uint64_t v67;

  v67 = v6;
  v66 = v5;
  v55 = a3;
  v9 = 0x24BDBC000uLL;
  v56 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = 0x24BDBC000uLL;
  v59 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_imageWidth);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("image_width"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_imageHeight);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("image_height"));

  objc_msgSend(v56, "setObject:forKeyedSubscript:", v10, CFSTR("image_resolution"));
  v54 = a5;
  v15 = *(_QWORD *)a4;
  v58 = v10;
  if (*(_QWORD *)a4 != 243)
  {
    v16 = 0;
    v57 = v12;
    while (1)
    {
      v17 = *((unsigned __int8 *)a4 + 5840);
      v18 = objc_alloc_init(*(Class *)(v11 + 3768));
      v64 = v16;
      v62 = v15;
      if (v17 | v16)
        v19 = (char *)a4 + 24 * v15 + 8;
      else
        v19 = (char *)a4 + 8;
      v21 = *(_DWORD **)v19;
      v20 = (_DWORD *)*((_QWORD *)v19 + 1);
      if (*(_DWORD **)v19 != v20)
      {
        do
        {
          v22 = objc_alloc_init(*(Class *)(v9 + 3800));
          v23 = v9;
          LODWORD(v24) = *v21;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("normalized_x"));

          LODWORD(v26) = v21[1];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, CFSTR("normalized_y"));

          LODWORD(v28) = v21[2];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, CFSTR("visibility"));

          objc_msgSend(v18, "addObject:", v22);
          v21 += 3;
          v9 = v23;
        }
        while (v21 != v20);
      }
      objc_msgSend(v59, "addObject:", v18);

      v30 = v62 + 1;
      v16 = v64;
      if (v62 + 1 >= 0xF3)
        break;
      v12 = v57;
      v11 = 0x24BDBC000uLL;
      if (v64)
        goto LABEL_13;
LABEL_14:
      v15 = v30;
      if (v30 == 243)
        goto LABEL_15;
    }
    if (!v64)
      v30 = v62 - 242;
    v16 = 1;
    v12 = v57;
    v11 = 0x24BDBC000;
LABEL_13:
    if (v30 >= *(_QWORD *)a4)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v59, CFSTR("input_2D_raw_pose"));
  v61 = objc_alloc_init(*(Class *)(v11 + 3768));
  v63 = objc_alloc_init(*(Class *)(v11 + 3768));
  v65 = objc_alloc_init(*(Class *)(v11 + 3768));
  v31 = 0;
  v32 = v54 + 2;
  do
  {
    if (v31 == 256)
      goto LABEL_18;
    v33 = objc_alloc_init(*(Class *)(v9 + 3800));
    LODWORD(v34) = *(v32 - 2);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("x"));

    LODWORD(v36) = *(v32 - 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, CFSTR("y"));

    LODWORD(v38) = *v32;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v39, CFSTR("z"));

    objc_msgSend(v61, "addObject:", v33);
    if (v31)
    {
LABEL_18:
      v40 = objc_alloc_init(*(Class *)(v9 + 3800));
      LODWORD(v41) = *(_DWORD *)(v66 + v31);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, CFSTR("x"));

      LODWORD(v43) = *(_DWORD *)(v66 + v31 + 4);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v44, CFSTR("y"));

      LODWORD(v45) = *(_DWORD *)(v66 + v31 + 8);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v46, CFSTR("z"));

      objc_msgSend(v63, "addObject:", v40);
    }
    v47 = objc_alloc_init(*(Class *)(v9 + 3800));
    LODWORD(v48) = *(_DWORD *)(v67 + v31);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v49, CFSTR("x"));

    LODWORD(v50) = *(_DWORD *)(v67 + v31 + 4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v51, CFSTR("y"));

    LODWORD(v52) = *(_DWORD *)(v67 + v31 + 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v53, CFSTR("z"));

    objc_msgSend(v65, "addObject:", v47);
    v31 += 16;
    v32 += 3;
  }
  while (v31 != 272);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v61, CFSTR("first_stage_model_output"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v63, CFSTR("lifting_model_output_gaussian_smoothed"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v65, CFSTR("lifting_model_output_postprocessed_final"));
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v12, CFSTR("output"));
  objc_msgSend(v56, "writeToFile:atomically:", v55, 0);

}

- (void)_adjustBoneLength:(void *)a3
{
  NSObject *v5;
  uint64_t v6;
  ABPKSkeletonDefinition *abpkLiftingSkeletonDefinition;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  float32x4_t v15;
  float32x4_t v16;
  ABPKSkeletonDefinition *v17;
  _QWORD v18[6];
  _QWORD v19[5];
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  double (*v23)(_QWORD *, _QWORD *);
  uint64_t (*v24)(uint64_t);
  void *v25;
  _QWORD v26[7];
  float32x4_t *v27;
  float32x4_t *v28;
  uint64_t v29;

  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Adjust bone length ", buf, 2u);
  }

  v27 = 0;
  v28 = 0;
  v29 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v27, *(const void **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x6012000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = &unk_21088F7B2;
  memset(v26, 0, 48);
  v6 = MEMORY[0x24BDAC760];
  abpkLiftingSkeletonDefinition = self->_abpkLiftingSkeletonDefinition;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __43__ABPK3DLiftingSequence__adjustBoneLength___block_invoke;
  v19[3] = &unk_24CA6E918;
  v19[4] = buf;
  -[ABPKSkeletonDefinition enumerateChildrenJointIndicesOfJointAtIndex:withBlock:](abpkLiftingSkeletonDefinition, "enumerateChildrenJointIndicesOfJointAtIndex:withBlock:", 0, v19);
  while (1)
  {
    v8 = v21;
    v9 = *((_QWORD *)v21 + 11);
    if (!v9)
      break;
    v10 = (uint64_t)(v21 + 48);
    v11 = *((_QWORD *)v21 + 10);
    v12 = (uint64_t *)(*(_QWORD *)(*((_QWORD *)v21 + 7) + ((v11 >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * v11);
    v14 = *v12;
    v13 = v12[1];
    *((_QWORD *)v21 + 10) = v11 + 1;
    *((_QWORD *)v8 + 11) = v9 - 1;
    std::deque<std::pair<long,long>>::__maybe_remove_front_spare[abi:ne180100](v10, 1);
    v15 = vsubq_f32(v27[v14], v27[v13]);
    v16 = vmulq_f32(v15, v15);
    v16.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).u64[0];
    v16.f32[0] = sqrtf(v16.f32[0]);
    *(float32x4_t *)(*(_QWORD *)a3 + 16 * v14) = vmlaq_n_f32(*(float32x4_t *)(*(_QWORD *)a3 + 16 * v13), vdivq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 0)), -[ABPK3DLiftingSequence _adjustBoneLength:]::bones[v14] * 1000.0);
    v17 = self->_abpkLiftingSkeletonDefinition;
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __43__ABPK3DLiftingSequence__adjustBoneLength___block_invoke_2;
    v18[3] = &unk_24CA6E940;
    v18[4] = buf;
    v18[5] = v14;
    -[ABPKSkeletonDefinition enumerateChildrenJointIndicesOfJointAtIndex:withBlock:](v17, "enumerateChildrenJointIndicesOfJointAtIndex:withBlock:", v14, v18);
  }
  _Block_object_dispose(buf, 8);
  std::deque<std::pair<long,long>>::~deque[abi:ne180100](v26);
  if (v27)
  {
    v28 = v27;
    operator delete(v27);
  }
}

uint64_t __43__ABPK3DLiftingSequence__adjustBoneLength___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  int v4;
  uint64_t v5;

  v5 = a2;
  v2 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  v4 = 0;
  return std::deque<std::pair<long,long>>::emplace_back<long &,int>(v2, &v5, &v4);
}

uint64_t __43__ABPK3DLiftingSequence__adjustBoneLength___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return std::deque<std::pair<long,long>>::emplace_back<long &,long const&>((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), &v3, (_QWORD *)(a1 + 40));
}

- (void)_startLoading3DLiftingSequenceMLModelSignpost
{
  kdebug_trace();
}

- (void)_endLoading3DLiftingSequenceMLModelSignpost
{
  kdebug_trace();
}

- (void)_startPrepareLiftingSequenceInputSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endPrepareLiftingSequenceInputSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endPostProcessFor3DLiftingSequenceModelDataSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startRunLiftingSequenceModelSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endRunLiftingSequenceModelSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  unint64_t i;
  float *begin;
  float *v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v6;
  void **p_end;
  uint64_t v8;
  void *v9;

  objc_storeStrong((id *)&self->_outputBufferDict, 0);
  objc_storeStrong((id *)&self->_inputBufferDict, 0);
  objc_storeStrong((id *)&self->_networkV2, 0);
  objc_storeStrong((id *)&self->_abpkLiftingSkeletonDefinition, 0);
  objc_storeStrong((id *)&self->_mlConfigFirstStage, 0);
  for (i = 0; i != -216; i -= 24)
  {
    begin = self->_smoothingFilterRingBuffer._storage.__elems_[i / 0x18 + 8].__begin_;
    if (begin)
    {
      self->_smoothingFilterRingBuffer._storage.__elems_[i / 0x18 + 8].__end_ = begin;
      operator delete(begin);
    }
  }
  v5 = self->_gaussianSmoothingFilter.__begin_;
  if (v5)
  {
    self->_gaussianSmoothingFilter.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_liftingResultAsModelPoses.__begin_;
  if (v6)
  {
    self->_liftingResultAsModelPoses.__end_ = v6;
    operator delete(v6);
  }
  objc_storeStrong((id *)&self->_liftingResult, 0);
  objc_storeStrong((id *)&self->_outputTensorFirstStageNames, 0);
  objc_storeStrong((id *)&self->_inputTensorFirstStageNames, 0);
  p_end = &self->_3DLiftingInputBuffer._storage.__elems_[242].__end_;
  v8 = -5832;
  do
  {
    v9 = *(p_end - 1);
    if (v9)
    {
      *p_end = v9;
      operator delete(v9);
    }
    p_end -= 3;
    v8 += 24;
  }
  while (v8);
}

- (id).cxx_construct
{
  bzero(&self->_3DLiftingInputBuffer, 0x16D1uLL);
  self->_smoothingFilterRingBuffer._filled = 0;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[8].__end_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[7].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[7].__begin_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[6].__end_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[5].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[5].__begin_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[4].__end_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[3].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[3].__begin_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[2].__end_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[1].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[1].__begin_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._storage.__elems_[0].__end_ = 0u;
  *(_OWORD *)&self->_smoothingFilterRingBuffer._insertionIndex = 0u;
  *(_OWORD *)&self->_gaussianSmoothingFilter.__end_ = 0u;
  *(_OWORD *)&self->_liftingResultAsModelPoses.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_liftingResultAsModelPoses.__begin_ = 0u;
  return self;
}

@end

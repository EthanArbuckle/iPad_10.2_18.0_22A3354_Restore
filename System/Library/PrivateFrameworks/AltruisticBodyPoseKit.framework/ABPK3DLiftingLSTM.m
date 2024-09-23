@implementation ABPK3DLiftingLSTM

- (ABPK3DLiftingLSTM)init
{
  NSObject *v3;
  ABPK3DLiftingLSTM *v4;
  ABPK3DLiftingLSTM *v5;
  ABPKMLModelConfiguration3DLiftingLSTM *v6;
  ABPKMLModelConfiguration3DLiftingLSTM *mlConfigLSTM;
  ABPKSkeletonDefinition *v8;
  ABPKSkeletonDefinition *abpkLiftingSkeletonDefinition;
  ABPK3DLiftingLSTM *v10;
  objc_super v12;
  uint8_t buf[16];

  -[ABPK3DLiftingLSTM _startLoading3DLiftingLSTMMLModelSignpost](self, "_startLoading3DLiftingLSTMMLModelSignpost");
  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ", buf, 2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)ABPK3DLiftingLSTM;
  v4 = -[ABPK3DLiftingLSTM init](&v12, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  v6 = objc_alloc_init(ABPKMLModelConfiguration3DLiftingLSTM);
  mlConfigLSTM = v4->_mlConfigLSTM;
  v4->_mlConfigLSTM = v6;

  std::vector<simd_float4x4>::resize((uint64_t)&v4->_liftingResultAsModelPoses, 0x11uLL);
  v4->_frameCount = 0;
  v4->_setUpStatus = 0;
  v8 = -[ABPKSkeletonDefinition initWithType:]([ABPKSkeletonDefinition alloc], "initWithType:", 3);
  abpkLiftingSkeletonDefinition = v4->_abpkLiftingSkeletonDefinition;
  v4->_abpkLiftingSkeletonDefinition = v8;

  if (!-[ABPK3DLiftingLSTM initMLNetwork](v4, "initMLNetwork"))
  {
    v10 = 0;
  }
  else
  {
LABEL_5:
    -[ABPK3DLiftingLSTM _endLoading3DLiftingLSTMMLModelSignpost](v4, "_endLoading3DLiftingLSTMMLModelSignpost");
    v10 = v4;
  }

  return v10;
}

- (void)updateInputImageResolution:(CGSize)a3
{
  *(CGSize *)&self->_imageWidth = a3;
}

- (BOOL)initMLNetwork
{
  NSObject *v3;
  void *v4;
  NSArray *v5;
  NSArray *inputTensorLSTMNames;
  NSArray *v7;
  NSArray *outputTensorLSTMNames;
  ABPKMLNetworkV2 *v9;
  ABPKMLNetworkV2 *networkV2;
  NSMutableDictionary *v11;
  NSMutableDictionary *inputBufferDict;
  NSMutableDictionary *v13;
  NSMutableDictionary *outputBufferDict;
  uint8_t v16[16];

  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ML Network - LSTM ", v16, 2u);
  }

  -[ABPKMLModelConfiguration3DLiftingLSTM compiledMLModelPath](self->_mlConfigLSTM, "compiledMLModelPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ABPKMLModelConfiguration3DLiftingLSTM inputTensorNames](self->_mlConfigLSTM, "inputTensorNames");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    inputTensorLSTMNames = self->_inputTensorLSTMNames;
    self->_inputTensorLSTMNames = v5;

    -[ABPKMLModelConfiguration3DLiftingLSTM outputTensorNames](self->_mlConfigLSTM, "outputTensorNames");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    outputTensorLSTMNames = self->_outputTensorLSTMNames;
    self->_outputTensorLSTMNames = v7;

    self->_useEspressoV2 = 1;
    v9 = -[ABPKMLNetworkV2 initWithNetworkPath:networkConfig:inputNames:outputNames:useSurface:]([ABPKMLNetworkV2 alloc], "initWithNetworkPath:networkConfig:inputNames:outputNames:useSurface:", v4, CFSTR("main"), self->_inputTensorLSTMNames, self->_outputTensorLSTMNames, 0);
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

  }
  return v4 != 0;
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
  v12 = -[ABPK3DLiftingLSTM runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:](self, "runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:", v6, 1, v9, v7, a4);

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
  NSObject *v15;
  int v16;
  uint8_t v18[16];
  ABPK2DDetectionResult v19;

  height = a4.height;
  width = a4.width;
  *(_QWORD *)v19._anon_28 = *MEMORY[0x24BDAC8D0];
  v19.super.isa = *(Class *)&a4.width;
  v19._rawJoints.var0 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)&a4.height;
  v11 = a3;
  -[ABPK3DLiftingLSTM _startPrepareLiftingLSTMInputSignpostWithTimestamp:](self, "_startPrepareLiftingLSTMInputSignpostWithTimestamp:", a6);
  __ABPKLogSharedInstance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v19._anon_10 = 134218240;
    *(CGFloat *)&v19._anon_10[4] = width;
    *(_WORD *)&v19._anon_10[12] = 2048;
    *(CGFloat *)&v19._anon_10[14] = height;
    _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " runLiftingModelWithData resolution: (w,h) = (%f,%f) ", v19._anon_10, 0x16u);
  }

  __ABPKLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_msgSend(v11, "rotation");
    *(_DWORD *)v19._anon_10 = 134217984;
    *(_QWORD *)&v19._anon_10[4] = v14;
    _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " runLiftingModelWithData rotation: %ld ", v19._anon_10, 0xCu);
  }

  abpk::GetRawDetectionXYVisbilityWithRawDetection2D((abpk *)v11, (float64x2_t *)&v19, (uint64_t)v19._anon_10);
  abpk::Normalize2DCoordinatesSquareCrop((float **)v19._anon_10, (double *)&v19, a5);
  if (!self->_setUpStatus)
  {
    -[ABPK3DLiftingLSTM updateInputImageResolution:](self, "updateInputImageResolution:", *(double *)&v19.super.isa, *(double *)&v19._rawJoints.var0);
    self->_setUpStatus = 1;
  }
  -[ABPK3DLiftingLSTM _endPrepareLiftingLSTMInputSignpostWithTimestamp:](self, "_endPrepareLiftingLSTMInputSignpostWithTimestamp:", a6);
  if (-[ABPK3DLiftingLSTM runLiftingModelWithRawDetectionXYVisbility:with2DReferenceResults:atTimestamp:exportDebuggingData:](self, "runLiftingModelWithRawDetectionXYVisbility:with2DReferenceResults:atTimestamp:exportDebuggingData:", v19._anon_10, v11, 0, a6))
  {
    __ABPKLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_210836000, v15, OS_LOG_TYPE_DEBUG, " \t\t Failed to run Lifting ML model ", v18, 2u);
    }

    v16 = -6662;
  }
  else
  {
    v16 = 0;
  }
  if (*(_QWORD *)v19._anon_10)
  {
    *(_QWORD *)&v19._anon_10[8] = *(_QWORD *)v19._anon_10;
    operator delete(*(void **)v19._anon_10);
  }

  return v16;
}

- (void)resetInputCellStateBuffer
{
  NSMutableDictionary *inputBufferDict;
  void *v3;
  id v4;

  inputBufferDict = self->_inputBufferDict;
  -[NSArray objectAtIndexedSubscript:](self->_inputTensorLSTMNames, "objectAtIndexedSubscript:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](inputBufferDict, "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  bzero((void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "size"));
}

- (void)resetInputHiddenStateBuffer
{
  NSMutableDictionary *inputBufferDict;
  void *v3;
  id v4;

  inputBufferDict = self->_inputBufferDict;
  -[NSArray objectAtIndexedSubscript:](self->_inputTensorLSTMNames, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](inputBufferDict, "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  bzero((void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "size"));
}

- (void)resetCellStateAndHiddenStateInput
{
  -[ABPK3DLiftingLSTM resetInputCellStateBuffer](self, "resetInputCellStateBuffer");
  -[ABPK3DLiftingLSTM resetInputHiddenStateBuffer](self, "resetInputHiddenStateBuffer");
}

- (int)runLiftingModelWithRawDetectionXYVisbility:(const void *)a3 with2DReferenceResults:(id)a4 atTimestamp:(double)a5 exportDebuggingData:(BOOL)a6
{
  _BOOL4 v6;
  NSObject *v9;
  NSMutableDictionary *inputBufferDict;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *outputBufferDict;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  _WORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  int v53;
  _OWORD *v54;
  uint64_t v55;
  _OWORD *v56;
  __int128 v57;
  _OWORD *v58;
  char *v59;
  char *v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  __int128 v71;
  float *v72;
  float *i;
  float32x2_t *v74;
  float32x2_t *v75;
  float32x4_t v76;
  int32x4_t v77;
  float32x2_t v78;
  float32x2_t v79;
  float32x4_t v80;
  float32x4_t v81;
  int32x4_t v82;
  float32x2_t v83;
  float32x2_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  int32x4_t v88;
  float32x2_t v89;
  float32x2_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  int32x4_t v94;
  float32x2_t v95;
  float32x2_t v96;
  int32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  ABPK3DLiftingResult *v101;
  ABPK3DLiftingResult *v102;
  ABPK3DLiftingResult *liftingResult;
  uint64_t frameCount;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  _BOOL4 v111;
  void *v112;
  void *v113;
  id v114;
  __int128 v116;
  void *__p[2];
  uint64_t v118;
  void *v119[2];
  uint64_t v120;
  void *v121[2];
  uint64_t v122;
  __int128 v123;
  _QWORD v124[2];
  uint8_t buf[8];
  char *v126;
  char *v127;

  v6 = a6;
  v114 = a4;
  __ABPKLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_DEBUG, " ABPK3DLiftingLSTM: Run Lifting Model With Data Buffer ", buf, 2u);
  }
  v111 = v6;

  *(_QWORD *)buf = 0;
  v126 = 0;
  v127 = 0;
  std::vector<float>::reserve((void **)buf, 0x30uLL);
  inputBufferDict = self->_inputBufferDict;
  -[NSArray objectAtIndexedSubscript:](self->_inputTensorLSTMNames, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](inputBufferDict, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self->_inputBufferDict;
  -[NSArray objectAtIndexedSubscript:](self->_inputTensorLSTMNames, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = self->_inputBufferDict;
  -[NSArray objectAtIndexedSubscript:](self->_inputTensorLSTMNames, "objectAtIndexedSubscript:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  outputBufferDict = self->_outputBufferDict;
  v113 = v18;
  -[NSArray objectAtIndexedSubscript:](self->_outputTensorLSTMNames, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](outputBufferDict, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = self->_outputBufferDict;
  v112 = v21;
  -[NSArray objectAtIndexedSubscript:](self->_outputTensorLSTMNames, "objectAtIndexedSubscript:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = self->_outputBufferDict;
  -[NSArray objectAtIndexedSubscript:](self->_outputTensorLSTMNames, "objectAtIndexedSubscript:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (_WORD *)objc_msgSend(v12, "bytes");
  v29 = objc_msgSend(v12, "strideChannels");
  v30 = 0;
  v31 = *(_QWORD *)a3;
  do
  {
    _S0 = *(_DWORD *)(v31 + v30);
    __asm { FCVT            H0, S0 }
    *v28 = _S0;
    _S0 = *(_DWORD *)(v31 + v30 + 4);
    __asm { FCVT            H0, S0 }
    v28[v29] = _S0;
    _S0 = *(_DWORD *)(v31 + v30 + 8);
    __asm { FCVT            H0, S0 }
    v28[2 * v29] = _S0;
    v30 += 12;
    v28 += 3 * v29;
  }
  while (v30 != 192);
  memcpy((void *)objc_msgSend(v15, "bytes"), (const void *)objc_msgSend(v24, "bytes"), objc_msgSend(v24, "size"));
  memcpy((void *)objc_msgSend(v18, "bytes"), (const void *)objc_msgSend(v27, "bytes"), objc_msgSend(v27, "size"));
  -[ABPK3DLiftingLSTM _startRunLiftingLSTMModelSignpostWithTimestamp:](self, "_startRunLiftingLSTMModelSignpostWithTimestamp:", a5);
  -[ABPKMLNetworkV2 execute](self->_networkV2, "execute");
  -[ABPK3DLiftingLSTM _endRunLiftingLSTMModelSignpostWithTimestamp:](self, "_endRunLiftingLSTMModelSignpostWithTimestamp:", a5);
  -[ABPK3DLiftingLSTM _startPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:](self, "_startPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:", a5);
  v39 = objc_msgSend(v21, "bytes");
  v40 = objc_msgSend(v21, "strideChannels");
  v41 = 0;
  v42 = v126;
  do
  {
    _H0 = *(_WORD *)(v39 + 2 * v40 * v41);
    __asm { FCVT            S9, H0 }
    if (v42 >= v127)
    {
      v46 = *(char **)buf;
      v47 = (uint64_t)&v42[-*(_QWORD *)buf] >> 2;
      v48 = v47 + 1;
      if ((unint64_t)(v47 + 1) >> 62)
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      v49 = (uint64_t)&v127[-*(_QWORD *)buf];
      if ((uint64_t)&v127[-*(_QWORD *)buf] >> 1 > v48)
        v48 = v49 >> 1;
      if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL)
        v50 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v50 = v48;
      if (v50)
      {
        v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v127, v50);
        v46 = *(char **)buf;
        v42 = v126;
      }
      else
      {
        v51 = 0;
      }
      v52 = &v51[4 * v47];
      *(_DWORD *)v52 = _S9;
      v45 = v52 + 4;
      while (v42 != v46)
      {
        v53 = *((_DWORD *)v42 - 1);
        v42 -= 4;
        *((_DWORD *)v52 - 1) = v53;
        v52 -= 4;
      }
      *(_QWORD *)buf = v52;
      v126 = v45;
      v127 = &v51[4 * v50];
      if (v46)
        operator delete(v46);
    }
    else
    {
      *(_DWORD *)v42 = _S9;
      v45 = v42 + 4;
    }
    v126 = v45;
    ++v41;
    v42 = v45;
  }
  while (v41 != 48);
  v123 = 0uLL;
  v124[0] = 0;
  v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v124, 1uLL);
  v56 = &v54[v55];
  HIDWORD(v57) = 0;
  *v54 = 0u;
  v58 = v54 + 1;
  v59 = (char *)*((_QWORD *)&v123 + 1);
  v60 = (char *)v123;
  if (*((_QWORD *)&v123 + 1) != (_QWORD)v123)
  {
    do
    {
      v61 = *((_OWORD *)v59 - 1);
      v59 -= 16;
      HIDWORD(v57) = HIDWORD(v61);
      *--v54 = v61;
    }
    while (v59 != v60);
    v59 = (char *)v123;
  }
  *(_QWORD *)&v123 = v54;
  *((_QWORD *)&v123 + 1) = v58;
  v124[0] = v56;
  if (v59)
    operator delete(v59);
  v62 = 0;
  *((_QWORD *)&v123 + 1) = v58;
  do
  {
    v63 = *(_QWORD *)buf + 12 * v62;
    *(_QWORD *)&v57 = *(_QWORD *)v63;
    DWORD2(v57) = *(_DWORD *)(v63 + 8);
    if ((unint64_t)v58 >= v124[0])
    {
      v116 = v57;
      v64 = (uint64_t)((uint64_t)v58 - v123) >> 4;
      if ((unint64_t)(v64 + 1) >> 60)
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      v65 = (uint64_t)(v124[0] - v123) >> 3;
      if (v65 <= v64 + 1)
        v65 = v64 + 1;
      if (v124[0] - (_QWORD)v123 >= 0x7FFFFFFFFFFFFFF0uLL)
        v66 = 0xFFFFFFFFFFFFFFFLL;
      else
        v66 = v65;
      if (v66)
        v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v124, v66);
      else
        v67 = 0;
      v68 = &v67[16 * v64];
      HIDWORD(v57) = HIDWORD(v116);
      *(_OWORD *)v68 = v116;
      v58 = v68 + 16;
      v69 = (char *)*((_QWORD *)&v123 + 1);
      v70 = (char *)v123;
      if (*((_QWORD *)&v123 + 1) != (_QWORD)v123)
      {
        do
        {
          v71 = *((_OWORD *)v69 - 1);
          v69 -= 16;
          HIDWORD(v57) = HIDWORD(v71);
          *((_OWORD *)v68 - 1) = v71;
          v68 -= 16;
        }
        while (v69 != v70);
        v69 = (char *)v123;
      }
      *(_QWORD *)&v123 = v68;
      *((_QWORD *)&v123 + 1) = v58;
      v124[0] = &v67[16 * v66];
      if (v69)
        operator delete(v69);
    }
    else
    {
      *v58++ = v57;
    }
    *((_QWORD *)&v123 + 1) = v58;
    ++v62;
  }
  while (v62 != 16);
  v121[0] = 0;
  v121[1] = 0;
  v122 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v121, (const void *)v123, (uint64_t)v58, (uint64_t)((uint64_t)v58 - v123) >> 4);
  v72 = (float *)v121[0];
  for (i = (float *)v121[1]; v72 != i; v72 += 4)
    *v72 = -*v72;
  -[ABPK3DLiftingLSTM _adjustBoneLength:](self, "_adjustBoneLength:", v121);
  v74 = (float32x2_t *)v121[0];
  v75 = (float32x2_t *)v121[1];
  if (v121[0] != v121[1])
  {
    v76 = *((float32x4_t *)v121[0] + 7);
    v77 = (int32x4_t)vmulq_f32(v76, v76);
    v77.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v77, 2), vadd_f32(*(float32x2_t *)v77.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v77.i8, 1))).u32[0];
    v78 = vrsqrte_f32((float32x2_t)v77.u32[0]);
    v79 = vmul_f32(v78, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(v78, v78)));
    v80 = vmulq_n_f32(v76, vmul_f32(v79, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(v79, v79))).f32[0]);
    v81 = *((float32x4_t *)v121[0] + 4);
    v82 = (int32x4_t)vmulq_f32(v81, v81);
    v82.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v82, 2), vadd_f32(*(float32x2_t *)v82.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v82.i8, 1))).u32[0];
    v83 = vrsqrte_f32((float32x2_t)v82.u32[0]);
    v84 = vmul_f32(v83, vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v83, v83)));
    v85 = vmulq_n_f32(v81, vmul_f32(v84, vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v84, v84))).f32[0]);
    v86 = vmulq_f32(v80, v85);
    v87 = vmlsq_lane_f32(v80, v85, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v86, 2), vaddq_f32(v86, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v86.f32, 1))), 0);
    v88 = (int32x4_t)vmulq_f32(v87, v87);
    v88.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v88, 2), vadd_f32(*(float32x2_t *)v88.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v88.i8, 1))).u32[0];
    v89 = vrsqrte_f32((float32x2_t)v88.u32[0]);
    v90 = vmul_f32(v89, vrsqrts_f32((float32x2_t)v88.u32[0], vmul_f32(v89, v89)));
    v91 = vmulq_n_f32(v87, vmul_f32(v90, vrsqrts_f32((float32x2_t)v88.u32[0], vmul_f32(v90, v90))).f32[0]);
    v92 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v91, (int32x4_t)v91), (int8x16_t)v91, 0xCuLL), vnegq_f32(v85)), v91, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v85, (int32x4_t)v85), (int8x16_t)v85, 0xCuLL));
    v93 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v92, (int32x4_t)v92), (int8x16_t)v92, 0xCuLL);
    v94 = (int32x4_t)vmulq_f32(v92, v92);
    v94.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v94.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v94, 2), *(float32x2_t *)v94.i8)).u32[0];
    v95 = vrsqrte_f32((float32x2_t)v94.u32[0]);
    v96 = vmul_f32(v95, vrsqrts_f32((float32x2_t)v94.u32[0], vmul_f32(v95, v95)));
    v97 = (int32x4_t)vmulq_n_f32(v93, vmul_f32(v96, vrsqrts_f32((float32x2_t)v94.u32[0], vmul_f32(v96, v96))).f32[0]);
    v98 = (float32x4_t)vzip1q_s32((int32x4_t)v85, (int32x4_t)v91);
    v98.i32[2] = v97.i32[0];
    v99 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v85, v97), vdupq_lane_s32(*(int32x2_t *)v91.f32, 1));
    v100 = (float32x4_t)vzip2q_s32((int32x4_t)v85, (int32x4_t)v91);
    v100.i32[2] = v97.i32[2];
    do
    {
      *(float32x4_t *)v74->f32 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v98, COERCE_FLOAT(*(_OWORD *)v74->f32)), v99, *v74, 1), v100, *(float32x4_t *)v74->f32, 2);
      v74 += 2;
    }
    while (v74 != v75);
  }
  v101 = [ABPK3DLiftingResult alloc];
  *(_OWORD *)v119 = *(_OWORD *)v121;
  v120 = v122;
  v121[1] = 0;
  v122 = 0;
  v121[0] = 0;
  *(_OWORD *)__p = v123;
  v118 = v124[0];
  v123 = 0uLL;
  v124[0] = 0;
  v102 = -[ABPK3DLiftingResult initWithJoints:rawNetworkOutputs:referenceDetectionResult:](v101, "initWithJoints:rawNetworkOutputs:referenceDetectionResult:", v119, __p, v114);
  liftingResult = self->_liftingResult;
  self->_liftingResult = v102;

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v119[0])
  {
    v119[1] = v119[0];
    operator delete(v119[0]);
  }
  -[ABPK3DLiftingLSTM _endPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:](self, "_endPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:", a5);
  if (v111)
  {
    frameCount = self->_frameCount;
    if (!(_DWORD)frameCount)
    {
      v105 = objc_alloc_init(MEMORY[0x24BDD1580]);
      objc_msgSend(v105, "removeItemAtPath:error:", CFSTR("/var/mobile/Documents/debug_lifting_lstm/"), 0);
      objc_msgSend(v105, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Documents/debug_lifting_lstm/"), 1, 0, 0);

      frameCount = self->_frameCount;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), frameCount);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "stringByAppendingString:", CFSTR(".plist"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("current_frame_3D_lifting_debug_lstm_"), "stringByAppendingString:", v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("/var/mobile/Documents/debug_lifting_lstm/"), "stringByAppendingPathComponent:", v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABPK3DLiftingLSTM saveDataToFilePath:with2DInput:withLSTMOutput:withPostprocessedLiftingResults:](self, "saveDataToFilePath:with2DInput:withLSTMOutput:withPostprocessedLiftingResults:", v109, a3, -[ABPK3DLiftingResult rawNetworkOutputJoints](self->_liftingResult, "rawNetworkOutputJoints"), -[ABPK3DLiftingResult joints](self->_liftingResult, "joints"));

  }
  ++self->_frameCount;
  if (v121[0])
  {
    v121[1] = v121[0];
    operator delete(v121[0]);
  }
  if ((_QWORD)v123)
  {
    *((_QWORD *)&v123 + 1) = v123;
    operator delete((void *)v123);
  }

  if (*(_QWORD *)buf)
  {
    v126 = *(char **)buf;
    operator delete(*(void **)buf);
  }

  return 0;
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

- (void)saveDataToFilePath:(ABPK3DLiftingLSTM *)self with2DInput:(SEL)a2 withLSTMOutput:(id)a3 withPostprocessedLiftingResults:(const void *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _DWORD *v15;
  _DWORD *v16;
  id v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  id v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;

  v6 = v5;
  v7 = v4;
  v42 = a3;
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_imageWidth);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("image_width"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_imageHeight);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("image_height"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("image_resolution"));
  v40 = v11;
  v41 = v12;
  v43 = v10;
  v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = *(_DWORD **)a4;
  v15 = (_DWORD *)*((_QWORD *)a4 + 1);
  if (*(_DWORD **)a4 != v15)
  {
    do
    {
      v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      LODWORD(v18) = *v16;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("normalized_x"));

      LODWORD(v20) = v16[1];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("normalized_y"));

      LODWORD(v22) = v16[2];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, CFSTR("visibility"));

      objc_msgSend(v44, "addObject:", v17);
      v16 += 3;
    }
    while (v16 != v15);
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v44, CFSTR("input_2D_raw_pose_rawDetectionXYVisbility"));
  v46 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v45 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = 0;
  v25 = 0x24BDBC000uLL;
  do
  {
    v26 = objc_alloc_init(*(Class *)(v25 + 3800));
    LODWORD(v27) = *(_DWORD *)(v7 + v24);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("x"));

    LODWORD(v29) = *(_DWORD *)(v7 + v24 + 4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("y"));

    LODWORD(v31) = *(_DWORD *)(v7 + v24 + 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v32, CFSTR("z"));

    objc_msgSend(v46, "addObject:", v26);
    v33 = objc_alloc_init(*(Class *)(v25 + 3800));
    LODWORD(v34) = *(_DWORD *)(v6 + v24);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("x"));

    LODWORD(v36) = *(_DWORD *)(v6 + v24 + 4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, CFSTR("y"));

    LODWORD(v38) = *(_DWORD *)(v6 + v24 + 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v39, CFSTR("z"));

    objc_msgSend(v45, "addObject:", v33);
    v24 += 16;
    v25 = 0x24BDBC000;
  }
  while (v24 != 272);
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v46, CFSTR("lifting_model_lstm_output_plus_000_hip_at_index_0"));
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v45, CFSTR("lifting_model_output_postprocessed_final"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v41, CFSTR("output"));
  objc_msgSend(v43, "writeToFile:atomically:", v42, 0);

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
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = &unk_21088F7B2;
  memset(v26, 0, 48);
  v6 = MEMORY[0x24BDAC760];
  abpkLiftingSkeletonDefinition = self->_abpkLiftingSkeletonDefinition;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __39__ABPK3DLiftingLSTM__adjustBoneLength___block_invoke;
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
    *(float32x4_t *)(*(_QWORD *)a3 + 16 * v14) = vmlaq_n_f32(*(float32x4_t *)(*(_QWORD *)a3 + 16 * v13), vdivq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 0)), -[ABPK3DLiftingLSTM _adjustBoneLength:]::bones[v14] * 1000.0);
    v17 = self->_abpkLiftingSkeletonDefinition;
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __39__ABPK3DLiftingLSTM__adjustBoneLength___block_invoke_2;
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

uint64_t __39__ABPK3DLiftingLSTM__adjustBoneLength___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  int v4;
  uint64_t v5;

  v5 = a2;
  v2 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  v4 = 0;
  return std::deque<std::pair<long,long>>::emplace_back<long &,int>(v2, &v5, &v4);
}

uint64_t __39__ABPK3DLiftingLSTM__adjustBoneLength___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return std::deque<std::pair<long,long>>::emplace_back<long &,long const&>((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), &v3, (_QWORD *)(a1 + 40));
}

- (void)_startLoading3DLiftingLSTMMLModelSignpost
{
  kdebug_trace();
}

- (void)_endLoading3DLiftingLSTMMLModelSignpost
{
  kdebug_trace();
}

- (void)_startPrepareLiftingLSTMInputSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endPrepareLiftingLSTMInputSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endPostProcessFor3DLiftingLSTMModelDataSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startRunLiftingLSTMModelSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endRunLiftingLSTMModelSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_storeStrong((id *)&self->_outputBufferDict, 0);
  objc_storeStrong((id *)&self->_inputBufferDict, 0);
  objc_storeStrong((id *)&self->_networkV2, 0);
  objc_storeStrong((id *)&self->_abpkLiftingSkeletonDefinition, 0);
  objc_storeStrong((id *)&self->_mlConfigLSTM, 0);
  begin = self->_liftingResultAsModelPoses.__begin_;
  if (begin)
  {
    self->_liftingResultAsModelPoses.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_liftingResult, 0);
  objc_storeStrong((id *)&self->_outputTensorLSTMNames, 0);
  objc_storeStrong((id *)&self->_inputTensorLSTMNames, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end

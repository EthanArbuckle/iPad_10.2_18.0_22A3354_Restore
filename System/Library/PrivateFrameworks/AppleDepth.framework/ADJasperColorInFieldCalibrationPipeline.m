@implementation ADJasperColorInFieldCalibrationPipeline

- (void)updateLastKnownDepthMap:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  vector<std::vector<float>, std::allocator<std::vector<float>>> *p_lastKnownPointsCollectionVec;
  _BYTE *begin;
  _BYTE *end;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  int v21;
  unsigned int v22;
  _OWORD *v23;
  unint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _BYTE *value;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  __int128 v42;
  char *v43;
  char *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  char *v48;
  char **v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  _BYTE *v62;
  uint64_t *v63;
  uint64_t *v64;
  unint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  _OWORD *v68;
  uint64_t v69;
  int v70;
  unint64_t v71;
  uint64_t v72;
  _OWORD *v73;
  char *v74;
  uint64_t v75;
  __int128 v76;
  int v77;
  char *v78;
  unint64_t v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  _QWORD *v83;
  int *v84;
  int v85;
  int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  int *v90;
  id v91;
  unint64_t v92;
  unsigned __int8 *v93;
  uint64_t v94;
  unsigned __int8 *v95;
  vector<std::vector<float>, std::allocator<std::vector<float>>> *v96;
  int v97;
  uint64_t v98;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = objc_msgSend(v4, "euclideanDistances");
  v7 = (unsigned __int8 *)objc_msgSend(v4, "bankIds");
  v8 = (unsigned __int8 *)objc_msgSend(v4, "spotIds");
  p_lastKnownPointsCollectionVec = &self->_lastKnownPointsCollectionVec;
  begin = self->_lastKnownPointsCollectionVec.__begin_;
  end = self->_lastKnownPointsCollectionVec.__end_;
  v12 = end - begin;
  if (end != begin)
  {
    v13 = 0;
    v14 = 0xAAAAAAAAAAAAAAABLL * (v12 >> 3);
    do
    {
      v15 = *(_QWORD *)&begin[24 * v13];
      v16 = *(_QWORD *)&begin[24 * v13 + 8] - v15;
      if (v16)
      {
        v17 = v16 >> 2;
        if (v17 <= 1)
          v18 = 1;
        else
          v18 = v17;
        if (v18 > 0x13 && ((_DWORD)v18 ? (v19 = (v18 - 1) >> 32 == 0) : (v19 = 0), v19))
        {
          v20 = v18 & 0xFFFFFFFFFFFFFFF8;
          v23 = *(_OWORD **)&begin[24 * v13];
          v24 = v18 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            *v23 = 0uLL;
            v23[1] = 0uLL;
            v23 += 2;
            v24 -= 8;
          }
          while (v24);
          v21 = v18 & 0xFFFFFFF8;
          if (v18 == v20)
            goto LABEL_3;
        }
        else
        {
          v20 = 0;
          v21 = 0;
        }
        v22 = v21 + 1;
        do
        {
          *(_DWORD *)(v15 + 4 * v20) = 0;
          v20 = v22++;
        }
        while (v17 > v20);
      }
LABEL_3:
      ++v13;
    }
    while (v14 > v13);
  }
  if (!v5)
    goto LABEL_86;
  v90 = (int *)v6;
  v91 = v4;
  v25 = 0;
  v26 = 0uLL;
  v95 = v8;
  v96 = &self->_lastKnownPointsCollectionVec;
  v93 = v7;
  v94 = v5;
  do
  {
    v28 = v7[v25];
    v29 = (char *)p_lastKnownPointsCollectionVec->__begin_;
    v30 = (char *)p_lastKnownPointsCollectionVec->__end_;
    v31 = 0xAAAAAAAAAAAAAAABLL * ((v30 - (char *)p_lastKnownPointsCollectionVec->__begin_) >> 3);
    if (v31 <= v28)
    {
      v32 = v28 + 1;
      v33 = v28 + 1 - v31;
      value = p_lastKnownPointsCollectionVec->__end_cap_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((value - v30) >> 3) >= v33)
      {
        if (v32 != v31)
        {
          bzero(p_lastKnownPointsCollectionVec->__end_, 24 * ((24 * v33 - 24) / 0x18) + 24);
          v26 = 0uLL;
          v8 = v95;
          v30 += 24 * ((24 * v33 - 24) / 0x18) + 24;
        }
        p_lastKnownPointsCollectionVec->__end_ = v30;
      }
      else
      {
        v35 = 0xAAAAAAAAAAAAAAABLL * ((value - v29) >> 3);
        if (2 * v35 > v32)
          v32 = 2 * v35;
        if (v35 >= 0x555555555555555)
          v36 = 0xAAAAAAAAAAAAAAALL;
        else
          v36 = v32;
        if (v36 > 0xAAAAAAAAAAAAAAALL)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v37 = (char *)operator new(24 * v36);
        v38 = &v37[24 * v31];
        v39 = &v37[24 * v36];
        bzero(v38, 24 * ((24 * v33 - 24) / 0x18) + 24);
        v40 = &v38[24 * ((24 * v33 - 24) / 0x18) + 24];
        if (v30 == v29)
        {
          p_lastKnownPointsCollectionVec = v96;
          v96->__begin_ = v38;
          v96->__end_ = v40;
          v96->__end_cap_.__value_ = v39;
          v26 = 0uLL;
        }
        else
        {
          p_lastKnownPointsCollectionVec = v96;
          v26 = 0uLL;
          do
          {
            v41 = v38;
            *((_QWORD *)v38 - 2) = 0;
            *((_QWORD *)v38 - 1) = 0;
            v42 = *(_OWORD *)(v30 - 24);
            v30 -= 24;
            *(_OWORD *)(v38 - 24) = v42;
            v38 -= 24;
            *((_QWORD *)v41 - 1) = *((_QWORD *)v30 + 2);
            *(_QWORD *)v30 = 0;
            *((_QWORD *)v30 + 1) = 0;
            *((_QWORD *)v30 + 2) = 0;
          }
          while (v30 != v29);
          v30 = (char *)v96->__begin_;
          v43 = (char *)v96->__end_;
          v96->__begin_ = v38;
          v96->__end_ = v40;
          v96->__end_cap_.__value_ = v39;
          if (v43 != v30)
          {
            v44 = v43;
            do
            {
              v46 = (void *)*((_QWORD *)v44 - 3);
              v44 -= 24;
              v45 = v46;
              if (v46)
              {
                *((_QWORD *)v43 - 2) = v45;
                operator delete(v45);
                v26 = 0uLL;
              }
              v43 = v44;
            }
            while (v44 != v30);
          }
        }
        v8 = v95;
        if (v30)
        {
          operator delete(v30);
          v26 = 0uLL;
          v8 = v95;
        }
      }
      v29 = (char *)p_lastKnownPointsCollectionVec->__begin_;
    }
    v47 = v8[v25];
    v48 = &v29[24 * v28];
    v49 = (char **)(v48 + 8);
    v50 = (char *)*((_QWORD *)v48 + 1);
    v51 = *(char **)v48;
    v52 = (uint64_t)&v50[-*(_QWORD *)v48];
    v53 = v52 >> 2;
    if (v52 >> 2 <= v47)
    {
      v97 = 0;
      v54 = v47 + 1;
      v55 = v47 + 1 - v53;
      v56 = &v29[24 * v28];
      v59 = *((_QWORD *)v56 + 2);
      v58 = v56 + 16;
      v57 = v59;
      if (v55 > (v59 - (uint64_t)v50) >> 2)
      {
        v60 = v57 - (_QWORD)v51;
        v61 = v60 >> 1;
        if (v60 >> 1 <= v54)
          v61 = v54;
        if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFFCLL)
          v61 = 0x3FFFFFFFFFFFFFFFLL;
        if (v61 >> 62)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v92 = v61;
        v62 = operator new(4 * v61);
        v63 = (uint64_t *)&v62[4 * v53];
        v64 = (uint64_t *)&v62[4 * v54];
        v65 = (v55 - 1) & 0x3FFFFFFFFFFFFFFFLL;
        v66 = v63;
        v7 = v93;
        v26 = 0uLL;
        if (v65 >= 0x13)
        {
          if (v63 >= &v98 || (v66 = (uint64_t *)&v62[4 * v53], &v62[4 * v55 + v52] <= (_BYTE *)&v97))
          {
            v67 = (v65 + 1) & 0x7FFFFFFFFFFFFFF8;
            v68 = &v62[4 * v53];
            v69 = v67;
            do
            {
              *v68 = 0uLL;
              v68[1] = 0uLL;
              v68 += 2;
              v69 -= 8;
            }
            while (v69);
            if (v65 + 1 == v67)
              goto LABEL_65;
            v66 = (uint64_t *)((char *)v63 + 4 * v67);
          }
        }
        v70 = v97;
        do
        {
          *(_DWORD *)v66 = v70;
          v66 = (uint64_t *)((char *)v66 + 4);
        }
        while (v66 != v64);
LABEL_65:
        if (v50 != v51)
        {
          v71 = v50 - v51 - 4;
          if (v71 < 0x2C)
            goto LABEL_91;
          if ((unint64_t)(v50 - &v62[v52]) < 0x20)
            goto LABEL_91;
          v72 = (v71 >> 2) + 1;
          v73 = &v62[4 * v53 - 16];
          v74 = v50 - 16;
          v75 = v72 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v76 = *(_OWORD *)v74;
            *(v73 - 1) = *((_OWORD *)v74 - 1);
            *v73 = v76;
            v73 -= 2;
            v74 -= 32;
            v75 -= 8;
          }
          while (v75);
          v63 = (uint64_t *)((char *)v63 - 4 * (v72 & 0x7FFFFFFFFFFFFFF8));
          v50 -= 4 * (v72 & 0x7FFFFFFFFFFFFFF8);
          if (v72 != (v72 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_91:
            do
            {
              v77 = *((_DWORD *)v50 - 1);
              v50 -= 4;
              *((_DWORD *)v63 - 1) = v77;
              v63 = (uint64_t *)((char *)v63 - 4);
            }
            while (v50 != v51);
          }
        }
        *(_QWORD *)v48 = v63;
        *((_QWORD *)v48 + 1) = v64;
        *v58 = &v62[4 * v92];
        if (v51)
        {
          operator delete(v51);
          v26 = 0uLL;
        }
        goto LABEL_24;
      }
      if (v54 == v53)
      {
        v7 = v93;
        *v49 = v50;
LABEL_24:
        v8 = v95;
        goto LABEL_25;
      }
      v78 = &v50[4 * v55];
      v79 = (v55 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      v7 = v93;
      if (v79 >= 0xF && (v50 >= (char *)&v98 || &v50[4 * v55] <= (char *)&v97))
      {
        v80 = v79 + 1;
        v81 = v50;
        v82 = v80 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          *(_OWORD *)v81 = v26;
          *((_OWORD *)v81 + 1) = v26;
          v81 += 32;
          v82 -= 8;
        }
        while (v82);
        if (v80 == (v80 & 0x7FFFFFFFFFFFFFF8))
          goto LABEL_83;
        v50 += 4 * (v80 & 0x7FFFFFFFFFFFFFF8);
      }
      do
      {
        *(_DWORD *)v50 = v97;
        v50 += 4;
      }
      while (v50 != v78);
LABEL_83:
      *v49 = v78;
      goto LABEL_24;
    }
LABEL_25:
    ++v25;
    v27 = v94;
    p_lastKnownPointsCollectionVec = v96;
  }
  while (v25 != v94);
  v83 = v96->__begin_;
  v84 = v90;
  v4 = v91;
  do
  {
    v85 = *v84++;
    v86 = v85;
    v88 = *v7++;
    v87 = v88;
    v89 = *v8++;
    *(_DWORD *)(v83[3 * v87] + 4 * v89) = v86;
    --v27;
  }
  while (v27);
LABEL_86:

}

- (ADJasperColorInFieldCalibrationPipeline)init
{
  void *v3;
  ADJasperColorInFieldCalibrationPipeline *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ADJasperColorInFieldCalibrationPipeline initWithParameters:espressoEngine:](self, "initWithParameters:espressoEngine:", v3, 4);

  return v4;
}

- (void)deallocMemory
{
  __CVBuffer **p_colorImageRaw;
  float *zVals;
  __CVBuffer *v5;
  __CVBuffer *v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  PixelBufferUtilsSession *v9;

  p_colorImageRaw = &self->_colorImageRaw;
  zVals = self->_zVals;
  if (zVals)
    MEMORY[0x20BD36480](zVals, 0x1000C8052888210);
  v5 = p_colorImageRaw[4];
  if (v5)
    MEMORY[0x20BD36480](v5, 0x1000C80451B5BE8);
  v6 = p_colorImageRaw[5];
  if (v6)
    MEMORY[0x20BD36480](v6, 0x1000C80451B5BE8);
  v7 = p_colorImageRaw[6];
  if (v7)
    MEMORY[0x20BD36480](v7, 0x1000C80451B5BE8);
  v8 = p_colorImageRaw[7];
  if (v8)
    MEMORY[0x20BD36480](v8, 0x1000C80451B5BE8);
  v9 = (PixelBufferUtilsSession *)p_colorImageRaw[1];
  p_colorImageRaw[1] = 0;
  if (v9)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(v9);
    MEMORY[0x20BD36498]();
  }
  *(_OWORD *)&self->_rectifiedPoints = 0u;
  *(_OWORD *)self->_origWorldPoints = 0u;
  *(_OWORD *)&self->_referenceCameraNumOfPoints = 0u;
  CVPixelBufferRelease(*p_colorImageRaw);
  *p_colorImageRaw = 0;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  char *validDepthPercentage;
  objc_super v6;
  uint8_t buf[16];

  -[ADJasperColorInFieldCalibrationPipeline deallocMemory](self, "deallocMemory");
  v3 = *(_QWORD *)self->_motionRotationAngles;
  if (v3)
    MEMORY[0x20BD36480](v3, 0x1000C80451B5BE8);
  v4 = *(_QWORD *)self->_motionTranslation;
  if (v4)
    MEMORY[0x20BD36480](v4, 0x1000C80451B5BE8);
  validDepthPercentage = self->_validDepthPercentage;
  if (validDepthPercentage)
    MEMORY[0x20BD36480](validDepthPercentage, 0x1000C8077774924);
  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "pipeline terminated", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)ADJasperColorInFieldCalibrationPipeline;
  -[ADJasperColorInFieldCalibrationPipeline dealloc](&v6, sel_dealloc);
}

- (double)getDeviceFrequency
{
  void *v2;
  void *v3;

  -[ADPipelineParameters deviceName](self->_pipelineParameters, "deviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "containsString:", CFSTR("J717")) & 1) == 0
    && (objc_msgSend(v3, "containsString:", CFSTR("J718")) & 1) == 0
    && (objc_msgSend(v3, "containsString:", CFSTR("J720")) & 1) == 0
    && (objc_msgSend(v3, "containsString:", CFSTR("J721")) & 1) == 0
    && (objc_msgSend(v3, "containsString:", CFSTR("D93")) & 1) == 0
    && (objc_msgSend(v3, "containsString:", CFSTR("D94")) & 1) == 0
    && (objc_msgSend(v3, "containsString:", CFSTR("D83")) & 1) == 0
    && (objc_msgSend(v3, "containsString:", CFSTR("D84")) & 1) == 0)
  {
    NSLog(CFSTR("Unknown device frequency (%@). Will use 24MHz..."), v3);
  }

  return 24000000.0;
}

- (ADJasperColorInFieldCalibrationPipeline)initWithParameters:(id)a3 espressoEngine:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  char *v10;
  char *v11;
  _DWORD *v12;
  char *v13;
  void *v14;
  int v15;
  _OWORD *v16;
  __int128 v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor *v24;
  void *v25;
  ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor *v26;
  void *v27;
  ADJasperColorInFieldCalibrationControllerParameters *v28;
  void *v29;
  ADJasperColorInFieldCalibrationPipeline *v30;
  objc_super v32;
  uint8_t buf[8];
  int v34;
  __int128 v35;
  __int128 v36;

  v7 = a3;
  v34 = 335681116;
  v35 = 0u;
  v36 = 0u;
  kdebug_trace();
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v8 = MEMORY[0x24BDACB70];
    v9 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v8 = MEMORY[0x24BDACB70];
    v9 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl(&dword_20B62B000, v8, v9, "Jasper Color In-Field calibration pipeline init for", buf, 2u);
LABEL_7:
  v32.receiver = self;
  v32.super_class = (Class)ADJasperColorInFieldCalibrationPipeline;
  v10 = -[ADJasperColorInFieldCalibrationPipeline init](&v32, sel_init);
  v11 = v10;
  v12 = v10;
  if (v10)
  {
    v13 = v10 + 3920096;
    *(_OWORD *)(v10 + 3920120) = 0u;
    *(_OWORD *)(v10 + 3920136) = 0u;
    *((_DWORD *)v10 + 980064) = 1065353216;
    *(_OWORD *)(v10 + 3920152) = 0u;
    objc_storeStrong((id *)v10 + 490049, a3);
    objc_msgSend(*((id *)v11 + 490049), "deviceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("J7"));
    v16 = &g_streamTrainedCropRect;
    if (v15)
      v16 = &g_streamTrainedCropRectPad;
    v17 = v16[1];
    *(_OWORD *)(v11 + 3920296) = *v16;
    *(_OWORD *)(v11 + 3920312) = v17;

    v12[10] = 0;
    objc_msgSend(*((id *)v11 + 490049), "deviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("N301"));

    if ((v19 & 1) != 0)
    {
      if (v12[10] != 1)
      {
        if (!*((_QWORD *)v12 + 1))
          goto LABEL_19;
LABEL_16:
        if (*((_QWORD *)v12 + 2))
        {
          v24 = -[ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor initWithNetworkProvider:espressoEngine:]([ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor alloc], "initWithNetworkProvider:espressoEngine:", *((_QWORD *)v12 + 1), a4);
          v25 = (void *)*((_QWORD *)v12 + 3);
          *((_QWORD *)v12 + 3) = v24;

          v26 = -[ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor initWithNetworkProvider:espressoEngine:networkFlowType:]([ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor alloc], "initWithNetworkProvider:espressoEngine:networkFlowType:", *((_QWORD *)v12 + 2), a4, v12[10]);
          v27 = (void *)*((_QWORD *)v12 + 4);
          *((_QWORD *)v12 + 4) = v26;

          v28 = -[ADJasperColorInFieldCalibrationControllerParameters initWithFlowType:]([ADJasperColorInFieldCalibrationControllerParameters alloc], "initWithFlowType:", v12[10]);
          v29 = *(void **)v13;
          *(_QWORD *)v13 = v28;

          *((_QWORD *)v13 + 1) = 0;
          objc_msgSend(*((id *)v13 + 37), "featuresVectorAggregationSize");
          *((_QWORD *)v13 + 29) = operator new[]();
          objc_msgSend(*((id *)v13 + 37), "featuresVectorAggregationSize");
          *((_QWORD *)v13 + 30) = operator new[]();
          objc_msgSend(*((id *)v13 + 37), "featuresVectorAggregationSize");
          *((_QWORD *)v13 + 31) = operator new[]();
          v13[256] = 0;
          goto LABEL_18;
        }
LABEL_19:
        v30 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      v12[10] = 1;
    }
    +[ADNetworkProvider providerForNetwork:espressoEngine:](ADNetworkProvider, "providerForNetwork:espressoEngine:", CFSTR("PeCoNetBackend"), a4);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v12 + 1);
    *((_QWORD *)v12 + 1) = v20;

    +[ADNetworkProvider providerForNetwork:espressoEngine:](ADNetworkProvider, "providerForNetwork:espressoEngine:", CFSTR("PeCoNetFrontend"), a4);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v12 + 2);
    *((_QWORD *)v12 + 2) = v22;

    if (!*((_QWORD *)v12 + 1))
      goto LABEL_19;
    goto LABEL_16;
  }
LABEL_18:
  v30 = v12;
LABEL_20:
  kdebug_trace();

  return v30;
}

- (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4
{
  return isColorFrameValidImpl(a3, (NSDictionary *)a4, self->_pipelineParameters, self->_controllerParameters);
}

- (BOOL)isAngularVelocityValid:(id)a3
{
  id v4;
  double v5;
  float v6;
  float v7;
  float v8;
  BOOL v9;
  float v11;
  int v12;
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_networkFlowType == 1
    && (-[ADJasperColorInFieldCalibrationPipeline getDeviceFrequency](self, "getDeviceFrequency"),
        *(float *)&v5 = v5,
        objc_msgSend(MEMORY[0x24BE05FB8], "getAngularVelocityFromMetadataDictionary:deviceClock:", v4, *(float *)&v5),
        v7 = v6,
        -[ADJasperColorInFieldCalibrationControllerParameters thresholdAngularVelocity](self->_controllerParameters, "thresholdAngularVelocity"), v7 >= v8))
  {
    v9 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ADJasperColorInFieldCalibrationControllerParameters thresholdAngularVelocity](self->_controllerParameters, "thresholdAngularVelocity");
      v12 = 134218240;
      v13 = v7;
      v14 = 2048;
      v15 = v11;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "High Angular velocity of %f detected against threshold of %f", (uint8_t *)&v12, 0x16u);
      v9 = 0;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (uint64_t)isJasperFrameValid:(float32x4_t)a3 pose:(float32x4_t)a4 prevPose:(float32x4_t)a5
{
  return isJasperFrameValidImpl(a11, *(void **)(a1 + 3920392), *(void **)(a1 + 3920096), (_OWORD *)(*(_QWORD *)(a1 + 3920328) + 16 * *(unsigned __int8 *)(a1 + 3920352)), (float32x4_t *)(*(_QWORD *)(a1 + 3920336) + 16 * *(unsigned __int8 *)(a1 + 3920352)), (_BYTE *)(*(_QWORD *)(a1 + 3920344) + *(unsigned __int8 *)(a1 + 3920352)), a2, a3, a4, a5, a6, a7, a8, a9);
}

- (void)updateJasperCamera:(id)a3
{
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  objc_storeStrong((id *)&self->_jasperCalib, a3);
  v5 = a3;
  objc_msgSend(v5, "cameraToPlatformTransform");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  *(_DWORD *)&self->_anon_70[8] = DWORD2(v10);
  *(_QWORD *)self->_anon_70 = v10;
  *(_DWORD *)&self->_anon_70[24] = DWORD2(v11);
  *(_DWORD *)&self->_anon_70[40] = DWORD2(v12);
  *(_QWORD *)&self->_anon_70[16] = v11;
  *(_QWORD *)&self->_anon_70[32] = v12;
  *(_DWORD *)&self->_anon_70[56] = DWORD2(v13);
  *(_QWORD *)&self->_anon_70[48] = v13;
}

- (uint64_t)updateWmcamToMcamExtrinsics:(__n128)a3
{
  *(_DWORD *)(result + 184) = a2.n128_u32[2];
  *(_DWORD *)(result + 200) = a3.n128_u32[2];
  *(_QWORD *)(result + 176) = a2.n128_u64[0];
  *(_QWORD *)(result + 192) = a3.n128_u64[0];
  *(_DWORD *)(result + 216) = a4.n128_u32[2];
  *(_QWORD *)(result + 208) = a4.n128_u64[0];
  return result;
}

- (id)createReferenceCameraForColor:(float32x4_t)a3 withExtrinsics:(float32x4_t)a4
{
  id v9;
  void *v10;
  unint64_t *v11;
  int v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  uint32x4_t v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  double *v45;
  uint64_t v46;
  double v47;
  double *v48;
  unsigned int v49;
  _OWORD *v50;
  double *v51;
  int32x4_t v52;
  int32x4_t v59;
  int64x2_t v60;
  double *v61;
  _OWORD *v62;
  unint64_t v63;
  int32x4_t v64;
  int32x4_t v65;
  uint64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  double *v71;
  double *v72;
  double *v73;
  double *v74;
  float64x2_t v75;
  unsigned int v76;
  double *v77;
  uint64_t v78;
  double *v79;
  uint64_t v80;
  _OWORD *v81;
  double *v82;
  int32x4_t v83;
  int32x4_t v86;
  double v87;
  int64x2_t v88;
  double *v89;
  _OWORD *v90;
  unint64_t v91;
  int32x4_t v92;
  int32x4_t v93;
  uint64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  double *v99;
  double *v100;
  double *v101;
  double *v102;
  float64x2_t v103;
  unint64_t v104;
  unsigned int v105;
  unint64_t v106;
  double *v107;
  double v108;
  double v109;
  double v110;
  float64x2x2_t v115;
  float64x2x2_t v116;
  float64x2x2_t v117;
  float64x2x2_t v118;

  v9 = a7;
  v10 = v9;
  if (v9)
  {
    v11 = (unint64_t *)(a1 + 3920120);
    v12 = *(_DWORD *)(a1 + 40);
    if (!v12)
    {
      v14 = objc_alloc(MEMORY[0x24BE05FF8]);
      objc_msgSend(v10, "intrinsicMatrix");
      v109 = v16;
      v110 = v15;
      v108 = v17;
      objc_msgSend(v10, "pixelSize");
      v19 = v18;
      objc_msgSend(v10, "referenceDimensions");
      LODWORD(v20) = v19;
      v13 = (void *)objc_msgSend(v14, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", 0, v110, v109, v108, *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64, v20, v21, v22);
      objc_msgSend(v13, "referenceDimensions");
      if (v23 == 864.0)
      {
        objc_msgSend(v13, "referenceDimensions");
        if (v24 == 704.0)
          objc_msgSend(v13, "crop:", 0.0, -4.0, 872.0, 712.0);
      }
      objc_msgSend(v13, "centerCrop:", 866.0, 710.0);
      objc_msgSend(v13, "scale:", 644.0, 528.0);
      objc_msgSend(v13, "centerCrop:", 464.0, 528.0);
      objc_msgSend(v13, "referenceDimensions");
      v26 = v25;
      objc_msgSend(v13, "referenceDimensions");
      v27 = (unint64_t)v26;
      v29 = (unint64_t)v28;
      v30 = (unint64_t)v28 * (unint64_t)v26;
      if (*v11 != v30)
      {
        objc_msgSend((id)a1, "deallocMemory");
        *(_QWORD *)(a1 + 3920136) = operator new[]();
        *(_QWORD *)(a1 + 3920128) = operator new[]();
        *(_QWORD *)(a1 + 3920144) = operator new[]();
        *(_QWORD *)(a1 + 3920152) = operator new[]();
        *(_QWORD *)(a1 + 3920160) = operator new[]();
        if (v29)
        {
          if (v27)
          {
            v42 = *(_QWORD *)(a1 + 3920128);
            v43 = *(_QWORD *)(a1 + 3920136);
            if (v27 > 7)
            {
              if (!(_DWORD)v27 || (v27 - 1) >> 32)
              {
                v76 = 0;
                v77 = (double *)(v43 + 8);
                do
                {
                  v78 = 0;
                  v79 = v77;
                  do
                  {
                    *(v79 - 1) = (double)v78 + 0.5;
                    *v79 = (double)v76 + 0.5;
                    *(_DWORD *)(v42 + 4 * v78++) = 1065353216;
                    v79 += 2;
                  }
                  while (v27 > v78);
                  ++v76;
                  v42 += 4 * v27;
                  v77 += 2 * v27;
                }
                while (v29 > v76);
              }
              else if ((v27 & 0xFFFFFFFFFFFFFFF8) == v27)
              {
                v49 = 0;
                v50 = (_OWORD *)(v42 + 16);
                v51 = (double *)(v43 + 64);
                v52.i64[0] = 0x400000004;
                v52.i64[1] = 0x400000004;
                __asm
                {
                  FMOV            V3.2D, #0.5
                  FMOV            V4.4S, #1.0
                }
                v59.i64[0] = 0x800000008;
                v59.i64[1] = 0x800000008;
                do
                {
                  v60 = vdupq_lane_s64(COERCE__INT64((double)v49 + 0.5), 0);
                  v61 = v51;
                  v62 = v50;
                  v63 = (unint64_t)v26;
                  v64 = (int32x4_t)xmmword_20B6D2A50;
                  do
                  {
                    v65 = vaddq_s32(v64, v52);
                    v66.i64[0] = v64.u32[0];
                    v66.i64[1] = v64.u32[1];
                    v67 = vcvtq_f64_u64(v66);
                    v66.i64[0] = v64.u32[2];
                    v66.i64[1] = v64.u32[3];
                    v68 = vcvtq_f64_u64(v66);
                    v66.i64[0] = v65.u32[0];
                    v66.i64[1] = v65.u32[1];
                    v69 = vcvtq_f64_u64(v66);
                    v66.i64[0] = v65.u32[2];
                    v66.i64[1] = v65.u32[3];
                    v70 = vaddq_f64(v68, _Q3);
                    v115.val[0] = vaddq_f64(v67, _Q3);
                    v115.val[1] = (float64x2_t)v60;
                    v117.val[0] = vaddq_f64(v69, _Q3);
                    v71 = v61 - 8;
                    vst2q_f64(v71, v115);
                    v117.val[1] = (float64x2_t)v60;
                    v72 = v61 - 4;
                    vst2q_f64(v72, *(float64x2x2_t *)(&v60 - 1));
                    v73 = v61 + 16;
                    vst2q_f64(v61, v117);
                    v74 = v61 + 4;
                    v75 = vaddq_f64(vcvtq_f64_u64(v66), _Q3);
                    v115.val[0] = (float64x2_t)v60;
                    vst2q_f64(v74, v115);
                    *(v62 - 1) = _Q4;
                    *v62 = _Q4;
                    v64 = vaddq_s32(v64, v59);
                    v62 += 2;
                    v61 = v73;
                    v63 -= 8;
                  }
                  while (v63);
                  ++v49;
                  v50 = (_OWORD *)((char *)v50 + 4 * v27);
                  v51 += 2 * v27;
                }
                while (v29 > v49);
              }
              else
              {
                v80 = 0;
                v81 = (_OWORD *)(v42 + 16);
                v82 = (double *)(v43 + 64);
                v83.i64[0] = 0x400000004;
                v83.i64[1] = 0x400000004;
                __asm
                {
                  FMOV            V3.2D, #0.5
                  FMOV            V4.4S, #1.0
                }
                v86.i64[0] = 0x800000008;
                v86.i64[1] = 0x800000008;
                do
                {
                  v87 = (double)v80 + 0.5;
                  v88 = vdupq_lane_s64(*(uint64_t *)&v87, 0);
                  v89 = v82;
                  v90 = v81;
                  v91 = v27 & 0xFFFFFFFFFFFFFFF8;
                  v92 = (int32x4_t)xmmword_20B6D2A50;
                  do
                  {
                    v93 = vaddq_s32(v92, v83);
                    v94.i64[0] = v92.u32[0];
                    v94.i64[1] = v92.u32[1];
                    v95 = vcvtq_f64_u64(v94);
                    v94.i64[0] = v92.u32[2];
                    v94.i64[1] = v92.u32[3];
                    v96 = vcvtq_f64_u64(v94);
                    v94.i64[0] = v93.u32[0];
                    v94.i64[1] = v93.u32[1];
                    v97 = vcvtq_f64_u64(v94);
                    v94.i64[0] = v93.u32[2];
                    v94.i64[1] = v93.u32[3];
                    v98 = vaddq_f64(v96, _Q3);
                    v116.val[0] = vaddq_f64(v95, _Q3);
                    v116.val[1] = (float64x2_t)v88;
                    v118.val[0] = vaddq_f64(v97, _Q3);
                    v99 = v89 - 8;
                    vst2q_f64(v99, v116);
                    v118.val[1] = (float64x2_t)v88;
                    v100 = v89 - 4;
                    vst2q_f64(v100, *(float64x2x2_t *)(&v88 - 1));
                    v101 = v89 + 16;
                    vst2q_f64(v89, v118);
                    v102 = v89 + 4;
                    v103 = vaddq_f64(vcvtq_f64_u64(v94), _Q3);
                    v116.val[0] = (float64x2_t)v88;
                    vst2q_f64(v102, v116);
                    *(v90 - 1) = _Q4;
                    *v90 = _Q4;
                    v92 = vaddq_s32(v92, v86);
                    v90 += 2;
                    v89 = v101;
                    v91 -= 8;
                  }
                  while (v91);
                  v104 = v27 & 0xFFFFFFFFFFFFFFF8;
                  v105 = v27 & 0xFFFFFFF8;
                  do
                  {
                    v106 = v104 + v80 * v27;
                    v107 = (double *)(v43 + 16 * v106);
                    *v107 = (double)v105 + 0.5;
                    v107[1] = v87;
                    *(_DWORD *)(v42 + 4 * v106) = 1065353216;
                    v104 = ++v105;
                  }
                  while (v105 < v27);
                  ++v80;
                  v81 = (_OWORD *)((char *)v81 + 4 * v27);
                  v82 += 2 * v27;
                }
                while (v29 > v80);
              }
            }
            else
            {
              v44 = 0;
              v45 = (double *)(v43 + 8);
              do
              {
                v46 = 0;
                v47 = 0.0;
                v48 = v45;
                do
                {
                  *(v48 - 1) = v47 + 0.5;
                  *v48 = (double)v44 + 0.5;
                  *(_DWORD *)(v42 + 4 * v46) = 1065353216;
                  v47 = v47 + 1.0;
                  ++v46;
                  v48 += 2;
                }
                while (v46 < v27);
                ++v44;
                v42 += 4 * v27;
                v45 += 2 * v27;
              }
              while (v29 > v44);
            }
          }
        }
      }
      if (*v11 != v30
        && (objc_msgSend(v13, "backProject:undistortedPixels:withZ:outPoints:", v30, *(_QWORD *)(a1 + 3920136), *(_QWORD *)(a1 + 3920128), *(_QWORD *)(a1 + 3920144)), *v11 != v30)|| *(void **)(a1 + 3920168) != v10|| (v31 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920208), a3), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920192), a2)), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920224), a4), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920240), a5))), v31.i32[3] = v31.i32[2], (vminvq_u32(v31) & 0x80000000) == 0))
      {
        objc_msgSend(v13, "transform:points:toCamera:outPoints:", v30, *(_QWORD *)(a1 + 3920144), v10, *(_QWORD *)(a1 + 3920152));
        objc_msgSend(v10, "project:points:outUndistortedPixels:", v30, *(_QWORD *)(a1 + 3920152), *(_QWORD *)(a1 + 3920160));
        objc_msgSend(v10, "distort:undistortedPixels:outDistorted:", v30, *(_QWORD *)(a1 + 3920160), a1 + 224);
      }
      *v11 = v30;
      objc_storeStrong((id *)(a1 + 3920168), a7);
      goto LABEL_16;
    }
    if (v12 == 1)
    {
      v13 = (void *)objc_msgSend(v9, "mutableCopy");
LABEL_16:
      *(float32x4_t *)(a1 + 3920192) = a2;
      *(float32x4_t *)(a1 + 3920208) = a3;
      *(float32x4_t *)(a1 + 3920224) = a4;
      *(float32x4_t *)(a1 + 3920240) = a5;
      objc_msgSend(v13, "intrinsicMatrix");
      *(_DWORD *)(a1 + 44) = v32;
      objc_msgSend(v10, "cameraToPlatformTransform");
      *(_DWORD *)(a1 + 56) = v33;
      *(_QWORD *)(a1 + 48) = v34;
      *(_DWORD *)(a1 + 72) = v35;
      *(_DWORD *)(a1 + 88) = v36;
      *(_QWORD *)(a1 + 64) = v37;
      *(_QWORD *)(a1 + 80) = v38;
      *(_DWORD *)(a1 + 104) = v39;
      *(_QWORD *)(a1 + 96) = v40;
      goto LABEL_17;
    }
  }
  v13 = 0;
LABEL_17:

  return v13;
}

- (CGRect)calculateJasperFOVInImageWithJasperCalibration:(id)a3 withCameraCalibration:(id)a4 withOriginalImageWidth:(unint64_t)a5 withOriginalImageHeight:(unint64_t)a6 forOutputImageWidth:(unint64_t)a7 forOutputImageHeight:(unint64_t)a8
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v8 = floor((double)a6 / (double)a8) * (double)a8;
  v9 = floor((double)a5 / (double)a7) * (double)a7;
  v10 = floor(((double)a5 - v9) * 0.5) + 0.0;
  v11 = floor(((double)a6 - v8) * 0.5) + 0.0;
  v12 = (double)a7 / (double)a8;
  v13 = v9 / v8 == v12;
  v14 = v9 / v8 < v12;
  v15 = v11 + floor((v8 - (double)(unint64_t)(v9 / (double)a7 * (double)a8)) * 0.5);
  v16 = (double)(unint64_t)(v8 / (double)a8 * (double)a7);
  v17 = v10 + floor((v9 - v16) * 0.5);
  if (v14 || v13)
  {
    v11 = v15;
    v16 = v9;
  }
  else
  {
    v10 = v17;
  }
  if (v14 || v13)
    v8 = (double)(unint64_t)(v9 / (double)a7 * (double)a8);
  result.size.height = v8;
  result.size.width = v16;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (int64_t)resizeImage:(id)a3 colorImage:(__CVBuffer *)a4 processedColor:(__CVBuffer *)a5 colorMetadata:(id)a6
{
  id v10;
  id v11;
  size_t Width;
  size_t Height;
  int64_t v14;
  size_t v15;
  size_t v16;
  float *p_scale;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  float v26;
  NSObject *v27;
  const char *v28;
  int v30;
  double v31;
  __int16 v32;
  CGFloat v33;
  __int16 v34;
  CGFloat v35;
  __int16 v36;
  CGFloat v37;
  uint64_t v38;
  CGRect v39;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v14 = -22950;
      goto LABEL_13;
    }
    LOWORD(v30) = 0;
    v27 = MEMORY[0x24BDACB70];
    v28 = "missing meta data for resizing";
LABEL_16:
    _os_log_error_impl(&dword_20B62B000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v30, 2u);
    goto LABEL_12;
  }
  Width = CVPixelBufferGetWidth(a5);
  Height = CVPixelBufferGetHeight(a5);
  v14 = -22950;
  if (Width && Height)
  {
    v15 = CVPixelBufferGetWidth(a4);
    v16 = CVPixelBufferGetHeight(a4);
    if (!-[ADJasperColorInFieldCalibrationPipeline isColorFrameValid:withMetadata:](self, "isColorFrameValid:withMetadata:", a4, v11))goto LABEL_12;
    p_scale = &self->_scale;
    objc_msgSend(MEMORY[0x24BE05FB8], "calcSensorCrop:onImageWithDimensions:metadataDictionary:negativeCropHandling:", v11, 2, *((double *)p_scale + 5), *((double *)p_scale + 6), *((double *)p_scale + 7), *((double *)p_scale + 8), (double)v15, (double)v16);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    *((double *)p_scale + 1) = v18;
    *((double *)p_scale + 2) = v20;
    *((double *)p_scale + 3) = v22;
    *((double *)p_scale + 4) = v24;
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v30 = 134218752;
      v31 = v23;
      v32 = 2048;
      v33 = v25;
      v34 = 2048;
      v35 = v19;
      v36 = 2048;
      v37 = v21;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "AD-RGBJ controller final buffer crop    size.width:%.2f, size.height:%.2f, origin.x:%.2f, origin.y:%.2f", (uint8_t *)&v30, 0x2Au);
      v19 = *((double *)p_scale + 1);
      v21 = *((double *)p_scale + 2);
      v23 = *((double *)p_scale + 3);
      v25 = *((double *)p_scale + 4);
    }
    v26 = (double)Width / v23;
    *p_scale = v26;
    v39.origin.x = v19;
    v39.origin.y = v21;
    v39.size.width = v23;
    v39.size.height = v25;
    if (!PixelBufferUtils::cropAndScalePixelBuffer(a4, a5, (__CVBuffer *)1, v39, *MEMORY[0x24BDBF090]))
    {
      v14 = 0;
      goto LABEL_13;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    LOWORD(v30) = 0;
    v27 = MEMORY[0x24BDACB70];
    v28 = "cropAndScalePixelBuffer failed";
    goto LABEL_16;
  }
LABEL_13:

  return v14;
}

- (int64_t)validateInternalMemoryStatus:(__CVBuffer *)a3 processedColor:(__CVBuffer *)a4
{
  __CVBuffer **p_colorImageRaw;
  __CVBuffer *colorImageRaw;
  OSType PixelFormatType;
  size_t Width;
  size_t Height;
  PixelBufferUtilsSession *v11;
  OSType v12;
  size_t v13;
  size_t v14;
  const __CFAllocator *v15;
  const __CFDictionary *BufferAttributes;
  CVReturn v17;
  CVPixelBufferRef v18;
  void *v19;
  uint8_t v21[16];
  uint8_t buf[8];
  CVPixelBufferRef pixelBufferOut;

  if (self->_networkFlowType)
    return 0;
  p_colorImageRaw = &self->_colorImageRaw;
  colorImageRaw = self->_colorImageRaw;
  if (colorImageRaw)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(colorImageRaw);
    if (PixelFormatType == CVPixelBufferGetPixelFormatType(a4))
    {
      Width = CVPixelBufferGetWidth(*p_colorImageRaw);
      if (Width == CVPixelBufferGetWidth(a3))
      {
        Height = CVPixelBufferGetHeight(*p_colorImageRaw);
        if (Height == CVPixelBufferGetWidth(a3))
          return 0;
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "init color image raw buffer and reseting colorInput ProcessingSession", buf, 2u);
  }
  CVPixelBufferRelease(*p_colorImageRaw);
  v11 = (PixelBufferUtilsSession *)p_colorImageRaw[1];
  *p_colorImageRaw = 0;
  p_colorImageRaw[1] = 0;
  if (v11)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(v11);
    MEMORY[0x20BD36498]();
  }
  v12 = CVPixelBufferGetPixelFormatType(a4);
  v13 = CVPixelBufferGetWidth(a3);
  v14 = CVPixelBufferGetHeight(a3);
  pixelBufferOut = 0;
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  BufferAttributes = (const __CFDictionary *)getBufferAttributes();
  v17 = CVPixelBufferCreate(v15, v13, v14, v12, BufferAttributes, &pixelBufferOut);
  v18 = pixelBufferOut;
  if (v17)
    v18 = 0;
  *p_colorImageRaw = v18;
  if (v18)
  {
    +[ADUtils getStandardNameForBufferOfType:moduleName:](ADUtils, "getStandardNameForBufferOfType:moduleName:", CFSTR("colorImageRaw"), CFSTR("RGBJ"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ADUtils updatePixelBufferIOSurfaceLabel:pixelBuffer:](ADUtils, "updatePixelBufferIOSurfaceLabel:pixelBuffer:", v19, *p_colorImageRaw);

    return 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "fail to create colorImageRaw", v21, 2u);
  }
  return -22965;
}

- (int64_t)preProcessColor:(__CVBuffer *)a3 processedColor:(__CVBuffer *)a4 referenceCameraCalibration:(id)a5 colorCameraCalibration:(id)a6 colorMetadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  int64_t v15;
  __CVBuffer **p_colorImageRaw;
  int networkFlowType;
  OSType PixelFormatType;
  PixelBufferUtilsSession *value;
  PixelBufferUtilsSession *v21;
  OSType v22;
  size_t Width;
  size_t Height;
  PixelBufferUtilsSession *v25;
  NSObject *v26;
  const char *v27;
  uint32_t v28;
  uint8_t buf[4];
  int v30;
  uint64_t v31;
  CGSize v32;
  CGSize v33;

  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  kdebug_trace();
  v15 = -[ADJasperColorInFieldCalibrationPipeline validateInternalMemoryStatus:processedColor:](self, "validateInternalMemoryStatus:processedColor:", a3, a4);
  if (!v15)
  {
    p_colorImageRaw = &self->_colorImageRaw;
    networkFlowType = self->_networkFlowType;
    if (networkFlowType)
    {
      if (networkFlowType != 1)
        goto LABEL_5;
    }
    else
    {
      PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
      if (PixelFormatType != CVPixelBufferGetPixelFormatType(a3))
      {
        value = self->_colorInputProcessingSession.__ptr_.__value_;
        if (!value)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "init colorInput ProcessingSession", buf, 2u);
          }
          v21 = (PixelBufferUtilsSession *)CVPixelBufferGetPixelFormatType(a3);
          v22 = CVPixelBufferGetPixelFormatType(*p_colorImageRaw);
          Width = CVPixelBufferGetWidth(a3);
          Height = CVPixelBufferGetHeight(a3);
          v32.width = (double)Width;
          v32.height = (double)Height;
          v33.width = (double)Width;
          v33.height = (double)Height;
          value = (PixelBufferUtilsSession *)PixelBufferUtilsSession::createCropScaleConvertRotateSession(v21, v32, v33, *MEMORY[0x24BDBF070], v22, 0);
          v25 = self->_colorInputProcessingSession.__ptr_.__value_;
          self->_colorInputProcessingSession.__ptr_.__value_ = value;
          if (v25)
          {
            PixelBufferUtilsSession::~PixelBufferUtilsSession(v25);
            MEMORY[0x20BD36498]();
            value = self->_colorInputProcessingSession.__ptr_.__value_;
          }
          if (!value)
          {
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_19;
            *(_WORD *)buf = 0;
            v26 = MEMORY[0x24BDACB70];
            v27 = "JasperColorInfieldCalibration unable to create VT session";
            v28 = 2;
            goto LABEL_24;
          }
        }
        if (!PixelBufferUtilsSession::run(value, a3, *p_colorImageRaw))
        {
          v15 = -22966;
          goto LABEL_2;
        }
        a3 = *p_colorImageRaw;
      }
      networkFlowType = self->_networkFlowType;
      if (networkFlowType != 1)
      {
LABEL_5:
        if (!networkFlowType)
        {
          v15 = -[ADJasperColorInFieldCalibrationPipeline undistortColorImage:undistortedImage:calibration:](self, "undistortColorImage:undistortedImage:calibration:", a3, a4, v13);
          self->_scale = 1.0;
          goto LABEL_2;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
LABEL_19:
          v15 = -22950;
          goto LABEL_2;
        }
        *(_DWORD *)buf = 67109120;
        v30 = networkFlowType;
        v26 = MEMORY[0x24BDACB70];
        v27 = "JasperColorInfieldCalibration unfamiliar network flow type %d";
        v28 = 8;
LABEL_24:
        _os_log_error_impl(&dword_20B62B000, v26, OS_LOG_TYPE_ERROR, v27, buf, v28);
        goto LABEL_19;
      }
    }
    v15 = -[ADJasperColorInFieldCalibrationPipeline resizeImage:colorImage:processedColor:colorMetadata:](self, "resizeImage:colorImage:processedColor:colorMetadata:", v13, a3, a4, v14);
  }
LABEL_2:
  kdebug_trace();

  return v15;
}

- (BOOL)isSDF:(id)a3
{
  ADJasperColorInFieldCalibrationControllerParameters **p_controllerParameters;
  id v4;
  BOOL v5;
  uint64_t v6;
  float *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  ADJasperColorInFieldCalibrationControllerParameters *v13;
  unint64_t v14;
  Class v15;
  Class *v16;
  float v17;
  float v18;
  float v19;
  __int16 v21[8];

  p_controllerParameters = &self->_controllerParameters;
  v4 = a3;
  if (-[ADJasperColorInFieldCalibrationControllerParameters disableSDF](p_controllerParameters[37], "disableSDF"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v21[0] = 0;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration, NOTE: SDF is disabled by user!", (uint8_t *)v21, 2u);
    }
    v5 = 1;
  }
  else
  {
    *((_DWORD *)p_controllerParameters + 72) = 0;
    LODWORD(v6) = objc_msgSend(v4, "length");
    v7 = (float *)objc_msgSend(v4, "euclideanDistances");
    v8 = (unsigned __int8 *)objc_msgSend(v4, "bankIds");
    v9 = (unsigned __int8 *)objc_msgSend(v4, "spotIds");
    v10 = -[ADJasperColorInFieldCalibrationControllerParameters sceneDiversityMinChangedSpots](*p_controllerParameters, "sceneDiversityMinChangedSpots");
    if ((_DWORD)v6)
    {
      v6 = v6;
      do
      {
        v12 = *v8++;
        v11 = v12;
        v13 = p_controllerParameters[33];
        if (0xAAAAAAAAAAAAAAABLL * (((char *)p_controllerParameters[34] - (char *)v13) >> 3) > v12)
        {
          v14 = *v9;
          v16 = &v13->super.isa + 3 * v11;
          v15 = *v16;
          if (v14 < (v16[1] - *v16) >> 2)
          {
            v17 = *((float *)v15 + v14);
            if (v17 > 0.0)
            {
              v18 = *v7;
              -[ADJasperColorInFieldCalibrationControllerParameters sceneDiversityMinDepthDiff](*p_controllerParameters, "sceneDiversityMinDepthDiff");
              if (vabds_f32(v17, v18) > v19)
                ++*((_DWORD *)p_controllerParameters + 72);
            }
          }
        }
        ++v9;
        ++v7;
        --v6;
      }
      while (v6);
    }
    v5 = *((_DWORD *)p_controllerParameters + 72) >= v10;
  }

  return v5;
}

- (uint64_t)preProcessJasper:(__n128)a3 pose:(__n128)a4 prevPose:(__n128)a5 referenceCameraCalibration:(__n128)a6 jasperCameraCalibration:(__n128)a7 reprojectedPointsBuffer:(__n128)a8
{
  id v17;
  id v18;
  uint64_t v19;
  float v20;
  int v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int v35;
  int v37;
  uint8_t buf[4];
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v17 = a11;
  v18 = a12;
  v19 = a1 + 3920096;
  if ((objc_msgSend((id)a1, "isJasperFrameValid:pose:prevPose:", v17, a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0], a8.n128_f64[0], a9.n128_f64[0]) & 1) == 0&& !objc_msgSend(*(id *)(a1 + 3920392), "forceRun"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v25 = MEMORY[0x24BDACB70];
      v26 = "ADJasperColorInFieldCalibration jasper controller fail";
      v27 = 2;
LABEL_15:
      _os_log_impl(&dword_20B62B000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
    }
LABEL_16:
    v28 = -22964;
    goto LABEL_23;
  }
  objc_msgSend(*(id *)v19, "sceneDiversityMinDepthDiff", *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7, *(_OWORD *)&a8, *(_OWORD *)&a9);
  if (v20 > 0.0 && objc_msgSend(*(id *)v19, "sceneDiversityMinChangedSpots"))
  {
    if (*(_QWORD *)(a1 + 3920368) == *(_QWORD *)(a1 + 3920360))
    {
      objc_msgSend((id)a1, "updateLastKnownDepthMap:", v17);
      goto LABEL_18;
    }
    if ((objc_msgSend((id)a1, "isSDF:", v17) & 1) != 0 || (objc_msgSend(*(id *)(a1 + 3920392), "forceRun") & 1) != 0)
    {
      objc_msgSend((id)a1, "updateLastKnownDepthMap:", v17);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_DWORD *)(a1 + 3920384);
        *(_DWORD *)buf = 67109120;
        v47 = v21;
        v22 = MEMORY[0x24BDACB70];
        v23 = "ADJasperColorInFieldCalibration jasper controller pass %d good spots";
        v24 = 8;
LABEL_12:
        _os_log_impl(&dword_20B62B000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v37 = *(_DWORD *)(a1 + 3920384);
      *(_DWORD *)buf = 67109120;
      v47 = v37;
      v25 = MEMORY[0x24BDACB70];
      v26 = "ADJasperColorInFieldCalibration jasper controller fail for only %d good spots";
      v27 = 8;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v22 = MEMORY[0x24BDACB70];
    v23 = "ADJasperColorInFieldCalibration jasper controller pass";
    v24 = 2;
    goto LABEL_12;
  }
LABEL_18:
  objc_msgSend(v18, "referenceDimensions");
  v30 = v29;
  objc_msgSend(v18, "referenceDimensions");
  if (*(_DWORD *)(a1 + 40) == 1)
  {
    v32 = *(double *)(a1 + 3920264);
    v33 = *(double *)(a1 + 3920272);
    v30 = *(double *)(a1 + 3920280);
    v34 = *(double *)(a1 + 3920288);
  }
  else
  {
    v34 = v31;
    v33 = 0.0;
    v32 = 0.0;
  }
  v28 = objc_msgSend(v17, "projectJasperPointsCroppedBy:rotatedBy:andScaledInto:", 0, a14, v32, v33, v30, v34);
  if (!v28)
  {
    v35 = *(unsigned __int8 *)(a1 + 3920352);
    v28 = 0;
    *(_BYTE *)(v19 + 256) = (v35 + 1) % objc_msgSend(*(id *)(v19 + 296), "featuresVectorAggregationSize");
  }
LABEL_23:

  return v28;
}

- (id)backendInferenceDescriptor
{
  return self->_backendInferenceDesc;
}

- (int64_t)processIntermediateResultsWithBackendFeaturesOutputVector:(const void *)a3 frontendEspressoFeaturesInput:(void *)a4 dimensions:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unsigned int v15;
  id v16;
  unsigned int v17;
  unsigned int v18;
  void *v20;
  unsigned int v21;
  id v22;
  unsigned int v23;
  unsigned int v24;
  int32x2_t v25;
  void *v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  float v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  BOOL v41;
  uint64_t v42;
  float16x8_t *v43;
  float16x8_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  unsigned int v49;
  id v50;
  unsigned int v51;
  unsigned int v52;
  void *v54;
  float v55;
  uint64_t v56;
  uint64_t v57;
  float v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  BOOL v64;
  uint64_t v65;
  float16x8_t *v66;
  float16x8_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  int64_t v72;
  unsigned int v73;
  id v74;
  unsigned int v75;
  unsigned int v76;
  int32x2_t v77;
  void *v78;
  float v79;
  uint64_t v80;
  uint64_t v81;
  float v83;
  uint64_t v84;
  uint64_t v85;
  unsigned int v86;
  BOOL v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  float v91;
  uint64_t v92;
  uint64_t v93;
  float v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  unsigned int v100;
  uint64_t v101;
  int16x8_t v102;
  int16x8_t *v103;
  uint64_t v104;
  uint64_t v105;
  _WORD *v106;
  uint64_t v107;
  int32x4_t v108;
  int32x4_t *v109;
  uint64_t v110;
  uint64_t v111;
  _DWORD *v112;
  uint64_t v113;
  int16x8_t v114;
  int16x8_t *v115;
  uint64_t v116;
  uint64_t v117;
  _WORD *v118;
  int32x4_t v119;
  int32x4_t *v120;
  uint64_t v121;
  uint64_t v122;
  _DWORD *v123;

  v8 = a5;
  -[ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor featuresOutput](self->_backendInferenceDesc, "featuresOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v10, "pixelFormat"), 0);

  -[ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor featuresInput](self->_frontendInferenceDesc, "featuresInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v13, "pixelFormat"), 0);

  if (v11 == 2 && v14 == 2)
  {
    v15 = -[ADJasperColorInFieldCalibrationPipelineParameters featuresVectorAggregationSize](self->_pipelineParameters, "featuresVectorAggregationSize");
    v16 = v8;
    v17 = 0;
    v18 = 1;
    while (objc_msgSend(v16, "count") > (unint64_t)v17)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 *= objc_msgSend(v20, "intValue");

      ++v17;
    }
    if (!v18)
      goto LABEL_123;
    v27 = (float)v15;
    if (v15)
    {
      v28 = 0;
      v29 = v15 & 0xFFFFFFF0;
      while (1)
      {
        v35 = 0.0;
        if (v15 >= 0x10)
        {
          v36 = 0;
          v41 = __CFADD__((_DWORD)v28, v15 - 1);
          if (v18 == 1 && !v41)
          {
            v42 = 0;
            do
            {
              v43 = (float16x8_t *)((char *)a3 + 2 * (v28 + v42));
              v44 = v43[1];
              v45 = vcvt_hight_f32_f16(*v43);
              v46 = vcvtq_f32_f16(*(float16x4_t *)v43->i8);
              v47 = vcvt_hight_f32_f16(v44);
              v48 = vcvtq_f32_f16(*(float16x4_t *)v44.i8);
              v35 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v35 + v46.f32[0]) + v46.f32[1]) + v46.f32[2]) + v46.f32[3]) + v45.f32[0])
                                                                                                  + v45.f32[1])
                                                                                          + v45.f32[2])
                                                                                  + v45.f32[3])
                                                                          + v48.f32[0])
                                                                  + v48.f32[1])
                                                          + v48.f32[2])
                                                  + v48.f32[3])
                                          + v47.f32[0])
                                  + v47.f32[1])
                          + v47.f32[2])
                  + v47.f32[3];
              v42 += 16;
            }
            while (v29 != v42);
            v36 = v15 & 0xFFFFFFF0;
            if (v29 == v15)
              goto LABEL_14;
          }
        }
        else
        {
          v36 = 0;
        }
        v37 = v15 - v36;
        v38 = v28 + v18 * v36;
        do
        {
          _H2 = *((_WORD *)a3 + v38);
          __asm { FCVT            S2, H2 }
          v35 = v35 + _S2;
          v38 += v18;
          --v37;
        }
        while (v37);
LABEL_14:
        _S1 = v35 / v27;
        __asm { FCVT            H1, S1 }
        *((_WORD *)a4 + v28++) = LOWORD(_S1);
        if (v28 == v18)
          goto LABEL_123;
      }
    }
    *(float *)_D0.i32 = 0.0 / v27;
    __asm { FCVT            H0, S0 }
    if (v18 > 0xF)
    {
      v90 = v18 & 0xFFFFFFF0;
      v102 = vdupq_lane_s16(_D0, 0);
      v103 = (int16x8_t *)((char *)a4 + 16);
      v104 = v90;
      do
      {
        v103[-1] = v102;
        *v103 = v102;
        v103 += 2;
        v104 -= 16;
      }
      while (v104);
      if (v90 == v18)
        goto LABEL_123;
    }
    else
    {
      v90 = 0;
    }
    v105 = v18 - v90;
    v106 = (char *)a4 + 2 * v90;
    do
    {
      *v106++ = _D0.i16[0];
      --v105;
    }
    while (v105);
LABEL_123:

    v72 = 0;
    goto LABEL_124;
  }
  if (v11 == 2 && v14 == 4)
  {
    v21 = -[ADJasperColorInFieldCalibrationPipelineParameters featuresVectorAggregationSize](self->_pipelineParameters, "featuresVectorAggregationSize");
    v22 = v8;
    v23 = 0;
    v24 = 1;
    while (objc_msgSend(v22, "count") > (unint64_t)v23)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v24 *= objc_msgSend(v26, "intValue");

      ++v23;
    }
    if (!v24)
      goto LABEL_123;
    v55 = (float)v21;
    if (!v21)
    {
      *(float *)v25.i32 = 0.0 / v55;
      if (v24 > 7)
      {
        v101 = v24 & 0xFFFFFFF8;
        v108 = vdupq_lane_s32(v25, 0);
        v109 = (int32x4_t *)((char *)a4 + 16);
        v110 = v101;
        do
        {
          v109[-1] = v108;
          *v109 = v108;
          v109 += 2;
          v110 -= 8;
        }
        while (v110);
        if (v101 == v24)
          goto LABEL_123;
      }
      else
      {
        v101 = 0;
      }
      v111 = v24 - v101;
      v112 = (char *)a4 + 4 * v101;
      do
      {
        *v112++ = v25.i32[0];
        --v111;
      }
      while (v111);
      goto LABEL_123;
    }
    v56 = 0;
    v57 = v21 & 0xFFFFFFF0;
    while (1)
    {
      v58 = 0.0;
      if (v21 >= 0x10)
      {
        v59 = 0;
        v64 = __CFADD__((_DWORD)v56, v21 - 1);
        if (v24 == 1 && !v64)
        {
          v65 = 0;
          do
          {
            v66 = (float16x8_t *)((char *)a3 + 2 * (v56 + v65));
            v67 = v66[1];
            v68 = vcvt_hight_f32_f16(*v66);
            v69 = vcvtq_f32_f16(*(float16x4_t *)v66->i8);
            v70 = vcvt_hight_f32_f16(v67);
            v71 = vcvtq_f32_f16(*(float16x4_t *)v67.i8);
            v58 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v58 + v69.f32[0]) + v69.f32[1]) + v69.f32[2]) + v69.f32[3]) + v68.f32[0])
                                                                                                + v68.f32[1])
                                                                                        + v68.f32[2])
                                                                                + v68.f32[3])
                                                                        + v71.f32[0])
                                                                + v71.f32[1])
                                                        + v71.f32[2])
                                                + v71.f32[3])
                                        + v70.f32[0])
                                + v70.f32[1])
                        + v70.f32[2])
                + v70.f32[3];
            v65 += 16;
          }
          while (v57 != v65);
          v59 = v21 & 0xFFFFFFF0;
          if (v57 == v21)
            goto LABEL_37;
        }
      }
      else
      {
        v59 = 0;
      }
      v60 = v21 - v59;
      v61 = v56 + v24 * v59;
      do
      {
        _H2 = *((_WORD *)a3 + v61);
        __asm { FCVT            S2, H2 }
        v58 = v58 + _S2;
        v61 += v24;
        --v60;
      }
      while (v60);
LABEL_37:
      *((float *)a4 + v56++) = v58 / v55;
      if (v56 == v24)
        goto LABEL_123;
    }
  }
  if (v11 == 4 && v14 == 2)
  {
    v49 = -[ADJasperColorInFieldCalibrationPipelineParameters featuresVectorAggregationSize](self->_pipelineParameters, "featuresVectorAggregationSize");
    v50 = v8;
    v51 = 0;
    v52 = 1;
    while (objc_msgSend(v50, "count") > (unint64_t)v51)
    {
      objc_msgSend(v50, "objectAtIndexedSubscript:", v51);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v52 *= objc_msgSend(v54, "intValue");

      ++v51;
    }
    if (!v52)
      goto LABEL_123;
    v79 = (float)v49;
    if (!v49)
    {
      *(float *)_D0.i32 = 0.0 / v79;
      __asm { FCVT            H0, S0 }
      if (v52 > 0xF)
      {
        v107 = v52 & 0xFFFFFFF0;
        v114 = vdupq_lane_s16(_D0, 0);
        v115 = (int16x8_t *)((char *)a4 + 16);
        v116 = v107;
        do
        {
          v115[-1] = v114;
          *v115 = v114;
          v115 += 2;
          v116 -= 16;
        }
        while (v116);
        if (v107 == v52)
          goto LABEL_123;
      }
      else
      {
        v107 = 0;
      }
      v117 = v52 - v107;
      v118 = (char *)a4 + 2 * v107;
      do
      {
        *v118++ = _D0.i16[0];
        --v117;
      }
      while (v117);
      goto LABEL_123;
    }
    v80 = 0;
    v81 = v49 & 0xFFFFFFF8;
    while (1)
    {
      v83 = 0.0;
      if (v49 >= 0xC)
      {
        v84 = 0;
        v87 = __CFADD__((_DWORD)v80, v49 - 1);
        if (v52 == 1 && !v87)
        {
          v88 = 0;
          do
          {
            v89 = (char *)a3 + 4 * (v80 + v88);
            v83 = (float)((float)((float)((float)((float)((float)((float)(v83 + COERCE_FLOAT(*(_OWORD *)v89))
                                                                + COERCE_FLOAT(HIDWORD(*(_QWORD *)v89)))
                                                        + COERCE_FLOAT(*((_QWORD *)v89 + 1)))
                                                + COERCE_FLOAT(HIDWORD(*(_OWORD *)v89)))
                                        + COERCE_FLOAT(*((_OWORD *)v89 + 1)))
                                + COERCE_FLOAT(HIDWORD(*((_QWORD *)v89 + 2))))
                        + COERCE_FLOAT(*((_QWORD *)v89 + 3)))
                + COERCE_FLOAT(HIDWORD(*((_OWORD *)v89 + 1)));
            v88 += 8;
          }
          while (v81 != v88);
          v84 = v49 & 0xFFFFFFF8;
          if (v81 == v49)
            goto LABEL_60;
        }
      }
      else
      {
        v84 = 0;
      }
      v85 = v49 - v84;
      v86 = v80 + v52 * v84;
      do
      {
        v83 = v83 + *((float *)a3 + v86);
        v86 += v52;
        --v85;
      }
      while (v85);
LABEL_60:
      _S1 = v83 / v79;
      __asm { FCVT            H1, S1 }
      *((_WORD *)a4 + v80++) = LOWORD(_S1);
      if (v80 == v52)
        goto LABEL_123;
    }
  }
  v72 = -22950;
  if (v11 == 4 && v14 == 4)
  {
    v73 = -[ADJasperColorInFieldCalibrationPipelineParameters featuresVectorAggregationSize](self->_pipelineParameters, "featuresVectorAggregationSize");
    v74 = v8;
    v75 = 0;
    v76 = 1;
    while (objc_msgSend(v74, "count") > (unint64_t)v75)
    {
      objc_msgSend(v74, "objectAtIndexedSubscript:", v75);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v76 *= objc_msgSend(v78, "intValue");

      ++v75;
    }
    if (!v76)
      goto LABEL_123;
    v91 = (float)v73;
    if (!v73)
    {
      *(float *)v77.i32 = 0.0 / v91;
      if (v76 > 7)
      {
        v113 = v76 & 0xFFFFFFF8;
        v119 = vdupq_lane_s32(v77, 0);
        v120 = (int32x4_t *)((char *)a4 + 16);
        v121 = v113;
        do
        {
          v120[-1] = v119;
          *v120 = v119;
          v120 += 2;
          v121 -= 8;
        }
        while (v121);
        if (v113 == v76)
          goto LABEL_123;
      }
      else
      {
        v113 = 0;
      }
      v122 = v76 - v113;
      v123 = (char *)a4 + 4 * v113;
      do
      {
        *v123++ = v77.i32[0];
        --v122;
      }
      while (v122);
      goto LABEL_123;
    }
    v92 = 0;
    v93 = v73 & 0xFFFFFFF8;
    while (1)
    {
      v94 = 0.0;
      if (v73 >= 0xC)
      {
        v95 = 0;
        v96 = __CFADD__((_DWORD)v92, v73 - 1);
        if (v76 == 1 && !v96)
        {
          v97 = 0;
          do
          {
            v98 = (char *)a3 + 4 * (v92 + v97);
            v94 = (float)((float)((float)((float)((float)((float)((float)(v94 + COERCE_FLOAT(*(_OWORD *)v98))
                                                                + COERCE_FLOAT(HIDWORD(*(_QWORD *)v98)))
                                                        + COERCE_FLOAT(*((_QWORD *)v98 + 1)))
                                                + COERCE_FLOAT(HIDWORD(*(_OWORD *)v98)))
                                        + COERCE_FLOAT(*((_OWORD *)v98 + 1)))
                                + COERCE_FLOAT(HIDWORD(*((_QWORD *)v98 + 2))))
                        + COERCE_FLOAT(*((_QWORD *)v98 + 3)))
                + COERCE_FLOAT(HIDWORD(*((_OWORD *)v98 + 1)));
            v97 += 8;
          }
          while (v93 != v97);
          v95 = v73 & 0xFFFFFFF8;
          if (v93 == v73)
            goto LABEL_80;
        }
      }
      else
      {
        v95 = 0;
      }
      v99 = v73 - v95;
      v100 = v92 + v76 * v95;
      do
      {
        v94 = v94 + *((float *)a3 + v100);
        v100 += v76;
        --v99;
      }
      while (v99);
LABEL_80:
      *((float *)a4 + v92++) = v94 / v91;
      if (v92 == v76)
        goto LABEL_123;
    }
  }
LABEL_124:

  return v72;
}

- (id)frontendInferenceDescriptor
{
  return self->_frontendInferenceDesc;
}

- (id)createInterSessionDataWithDictionaryRepresentation:(id)a3
{
  id v4;
  ADJasperColorInFieldCalibrationInterSessionData *v5;
  void *v6;
  ADJasperColorInFieldCalibrationInterSessionData *v7;

  v4 = a3;
  v5 = [ADJasperColorInFieldCalibrationInterSessionData alloc];
  -[ADPipelineParameters deviceName](self->_pipelineParameters, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ADJasperColorInFieldCalibrationInterSessionData initWithDictionaryRepresentation:andDeviceName:](v5, "initWithDictionaryRepresentation:andDeviceName:", v4, v6);

  return v7;
}

- (ADJasperColorInFieldCalibrationInterSessionData)createInterSessionDataWithFactoryJasperToColorTransform:(double)a3 currentJasperToColorTransform:(double)a4
{
  return -[ADJasperColorInFieldCalibrationInterSessionData initWithFactoryJasperToColorTransform:currentJasperToColorTransform:andFlowType:]([ADJasperColorInFieldCalibrationInterSessionData alloc], "initWithFactoryJasperToColorTransform:currentJasperToColorTransform:andFlowType:", *(unsigned int *)(a1 + 40), a2, a3, a4, a5, a6, a7, a8, a9);
}

- (int64_t)postProcessFrontendOutputX:(void *)a3 frontendOutputY:(void *)a4 frontendOutputZ:(void *)a5 frontendOutputErrorX:(void *)a6 frontendOutputErrotY:(void *)a7 frontendOutputErrorZ:(void *)a8 interSessionData:(id)a9 jasperColorInFieldCalibrationResult:(id)a10
{
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  __int128 v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x2_t *anon_3bd140;
  float v31;
  float v32;
  double v33;
  double colorCameraEfl;
  double scale;
  float v36;
  NSObject *v37;
  os_log_type_t v38;
  double v39;
  double v40;
  float v41;
  float v48;
  float v51;
  __int128 v54;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  unint64_t v62;
  float32x4_t v65;
  float32x4_t v66;
  int32x4_t v67;
  float32x4_t v68;
  int32x4_t v69;
  int32x4_t v70;
  float v71;
  __int128 v74;
  float32x4_t v75;
  float32x4_t v76;
  int32x4_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  __int128 v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  __int128 v103;
  void *v104;
  float v105;
  float v106;
  double v107;
  float v108;
  uint64_t v109;
  id v110;
  int64_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  __int128 v119;
  float32x4_t v120;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  __int128 v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  float32x4_t v147;
  float32x4_t v149;
  float32x4_t v151;
  int32x4_t v152;
  float32x4_t v153;
  int32x4_t v154;
  float32x4_t v155;
  int32x4_t v156;
  float32x4_t v157;
  float32x4_t v158;
  float32x4_t v159;
  float32x4_t v160;
  float32x4_t v161;
  __int128 v162;
  float32x4_t v163;
  __int128 v164;
  float32x4_t v165;
  float32x4_t v166;
  id v167;
  float32x4_t v168;
  __int128 v169;
  __int128 v171;
  __int128 v172;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  id v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  int32x4_t v184;
  int32x4_t v185;
  int32x4_t v186;
  float32x4_t v187;
  float32x4_t v188;
  float32x4_t v189;
  uint8_t buf[4];
  double v191;
  __int16 v192;
  double v193;
  __int16 v194;
  double v195;
  __int16 v196;
  double v197;
  uint64_t v198;

  v198 = *MEMORY[0x24BDAC8D0];
  v167 = a9;
  v13 = a10;
  -[ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor rotationXOutput](self->_frontendInferenceDesc, "rotationXOutput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v15, "pixelFormat"), 0);

  -[ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor rotationYOutput](self->_frontendInferenceDesc, "rotationYOutput");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v18, "pixelFormat"), 0);

  -[ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor errorXOutput](self->_frontendInferenceDesc, "errorXOutput");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "imageDescriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v21, "pixelFormat"), 0);

  -[ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor errorYOutput](self->_frontendInferenceDesc, "errorYOutput");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "imageDescriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v24, "pixelFormat"), 0);

  objc_msgSend(v13, "setExecuted:", 0);
  v186 = 0u;
  v184 = 0u;
  v185 = 0u;
  objc_msgSend(v167, "jasperToColorRotationAngles");
  v172 = v26;
  +[ADUtils calcRotationMatrix:](ADUtils, "calcRotationMatrix:");
  v160 = v27;
  v161 = v28;
  v163 = v29;
  v182 = 0u;
  v183 = 0u;
  anon_3bd140 = (float32x2_t *)self->_anon_3bd140;
  v180 = 0u;
  v181 = 0u;
  v178 = 0u;
  v179 = 0u;
  v152 = *(int32x4_t *)&self->_anon_3bd140[16];
  v154 = *(int32x4_t *)self->_anon_3bd140;
  v156 = *(int32x4_t *)&self->_anon_3bd140[32];
  v158 = *(float32x4_t *)self->_anon_70;
  v165 = *(float32x4_t *)&self->_anon_70[16];
  v168 = *(float32x4_t *)&self->_anon_70[32];
  v146 = *(float32x4_t *)&self->_anon_70[48];
  v147 = *(float32x4_t *)&self->_anon_3bd140[48];
  -[ADJasperColorInFieldCalibrationPipelineParameters colorCameraNominalEfl](self->_pipelineParameters, "colorCameraNominalEfl");
  v32 = (float)(v31 / self->_scale) / self->_colorCameraEfl;
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    -[ADJasperColorInFieldCalibrationPipelineParameters colorCameraNominalEfl](self->_pipelineParameters, "colorCameraNominalEfl");
    colorCameraEfl = self->_colorCameraEfl;
    scale = self->_scale;
    *(_DWORD *)buf = 134218752;
    v191 = v32;
    v192 = 2048;
    v193 = v36;
    v194 = 2048;
    v195 = colorCameraEfl;
    v196 = 2048;
    v197 = scale;
    v37 = MEMORY[0x24BDACB70];
    v38 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_7;
    -[ADJasperColorInFieldCalibrationPipelineParameters colorCameraNominalEfl](self->_pipelineParameters, "colorCameraNominalEfl");
    v39 = self->_colorCameraEfl;
    v40 = self->_scale;
    *(_DWORD *)buf = 134218752;
    v191 = v32;
    v192 = 2048;
    v193 = v41;
    v194 = 2048;
    v195 = v39;
    v196 = 2048;
    v197 = v40;
    v37 = MEMORY[0x24BDACB70];
    v38 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl(&dword_20B62B000, v37, v38, "postProcessFront: alpha = %f colorCameraNominalEfl = %f colorCameraEfl = %f scale = %f", buf, 0x2Au);
LABEL_7:
  *(float *)&v33 = v32;
  objc_msgSend(v13, "setAlpha:", v33);
  if (v16 == 2)
  {
    _H0 = *(_WORD *)a3;
    __asm { FCVT            S0, H0 }
  }
  else
  {
    _S0 = *(float *)a3;
  }
  v48 = v32 * _S0;
  if (v19 == 2)
  {
    _H1 = *(_WORD *)a4;
    __asm { FCVT            S1, H1 }
  }
  else
  {
    _S1 = *(float *)a4;
  }
  v51 = v32 * _S1;
  if (v22 == 2)
  {
    _H2 = *(_WORD *)a6;
    __asm { FCVT            S2, H2 }
  }
  else
  {
    _S2 = *(_DWORD *)a6;
  }
  v54 = 0u;
  *(float *)&v54 = v48;
  if (v25 == 2)
  {
    _H0 = *(_WORD *)a7;
    __asm { FCVT            S0, H0 }
  }
  else
  {
    _S0 = *(_DWORD *)a7;
  }
  *((float *)&v54 + 1) = v51;
  v174 = __PAIR64__(_S0, _S2);
  v175 = v54;
  if (self->_networkFlowType)
  {
    -[ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor rotationZOutput](self->_frontendInferenceDesc, "rotationZOutput");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "imageDescriptor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v58, "pixelFormat"), 0);

    -[ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor errorZOutput](self->_frontendInferenceDesc, "errorZOutput");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "imageDescriptor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v61, "pixelFormat"), 0);

    if (v59 == 2)
    {
      _H0 = *(_WORD *)a5;
      __asm { FCVT            S0, H0 }
    }
    else
    {
      _S0 = *(float *)a5;
    }
    v71 = v32 * _S0;
    if (v62 == 2)
    {
      _H1 = *(_WORD *)a8;
      __asm { FCVT            S1, H1 }
    }
    else
    {
      _S1 = *(_DWORD *)a8;
    }
    v65 = v168;
    v66 = v165;
    v67 = v156;
    v68 = v158;
    v70 = v152;
    v69 = v154;
    v54 = v175;
    *((float *)&v54 + 2) = v71;
    v74 = v174;
    DWORD2(v74) = _S1;
    v174 = v74;
  }
  else
  {
    v65 = v168;
    v66 = v165;
    v67 = v156;
    v68 = v158;
    v70 = v152;
    v69 = v154;
  }
  v75 = (float32x4_t)vtrn2q_s32(v69, v70);
  v75.i32[2] = v67.i32[1];
  v151 = (float32x4_t)vzip1q_s32(vzip1q_s32(v69, v67), v70);
  v153 = v75;
  v149 = (float32x4_t)vzip1q_s32(vzip2q_s32(v69, v67), vdupq_laneq_s32(v70, 2));
  v76 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v151, v65.f32[0]), v75, *(float32x2_t *)v65.f32, 1), v149, v65, 2);
  v141 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v151, v68.f32[0]), v75, *(float32x2_t *)v68.f32, 1), v149, v68, 2);
  v143 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v151, v66.f32[0]), v75, *(float32x2_t *)v66.f32, 1), v149, v66, 2);
  v176 = v54;
  +[ADUtils addAnglesToRotation:angles:](ADUtils, "addAnglesToRotation:angles:", *(double *)v141.i64, *(double *)v143.i64, *(double *)v76.i64, *(_OWORD *)&v141, *(_OWORD *)&v143, *(_OWORD *)&v76);
  v77 = *(int32x4_t *)self->_anon_30;
  v78 = *(int32x4_t *)&self->_anon_30[16];
  v79 = *(int32x4_t *)&self->_anon_30[32];
  v80 = vzip2q_s32(v77, v79);
  v81 = (float32x4_t)vzip1q_s32(vzip1q_s32(v77, v79), v78);
  v82 = (float32x4_t)vtrn2q_s32(v77, v78);
  v82.i32[2] = HIDWORD(*(_QWORD *)&self->_anon_30[32]);
  v83 = (float32x4_t)vzip1q_s32(v80, vdupq_laneq_s32(v78, 2));
  v84 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(_OWORD *)anon_3bd140->f32)), v82, *anon_3bd140, 1), v83, *(float32x4_t *)anon_3bd140->f32, 2);
  v85 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(_OWORD *)&self->_anon_3bd140[16])), v82, *(float32x2_t *)&self->_anon_3bd140[16], 1), v83, *(float32x4_t *)&self->_anon_3bd140[16], 2);
  v86 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(_OWORD *)&self->_anon_3bd140[32])), v82, *(float32x2_t *)&self->_anon_3bd140[32], 1), v83, *(float32x4_t *)&self->_anon_3bd140[32], 2);
  v87 = *(float32x4_t *)self->_anon_b0;
  v88 = *(float32x4_t *)&self->_anon_b0[16];
  v89 = *(float32x4_t *)&self->_anon_b0[32];
  v90 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, v84.f32[0]), v88, *(float32x2_t *)v84.f32, 1), v89, v84, 2);
  v91 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, v85.f32[0]), v88, *(float32x2_t *)v85.f32, 1), v89, v85, 2);
  v92 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, v86.f32[0]), v88, *(float32x2_t *)v86.f32, 1), v89, v86, 2);
  v94 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v90, v93.f32[0]), v91, *(float32x2_t *)v93.f32, 1), v92, v93, 2);
  v96 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v90, v95.f32[0]), v91, *(float32x2_t *)v95.f32, 1), v92, v95, 2);
  v157 = v91;
  v159 = v90;
  v155 = v92;
  v98 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v90, v97.f32[0]), v91, *(float32x2_t *)v97.f32, 1), v92, v97, 2);
  v187.i32[2] = v94.i32[2];
  v188.i32[2] = v96.i32[2];
  v187.i64[0] = v94.i64[0];
  v188.i64[0] = v96.i64[0];
  v189.i32[2] = v98.i32[2];
  v189.i64[0] = v98.i64[0];
  +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v187);
  v171 = v99;
  v100 = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v187, v160.f32[0]), v188, v161.f32[0]), v189, v163.f32[0]);
  v101 = vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v187, *(float32x2_t *)v160.f32, 1), v188, *(float32x2_t *)v161.f32, 1), v189, *(float32x2_t *)v163.f32, 1);
  v102 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v187, v160, 2), v188, v161, 2), v189, v163, 2);
  DWORD2(v181) = v100.i32[2];
  DWORD2(v182) = v101.i32[2];
  *(_QWORD *)&v181 = v100.i64[0];
  *(_QWORD *)&v182 = v101.i64[0];
  DWORD2(v183) = v102.i32[2];
  *(_QWORD *)&v183 = v102.i64[0];
  +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v181);
  v169 = v103;
  objc_msgSend(v167, "convertExtrinsicsAnglesToDict:");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADJasperColorInFieldCalibrationPipeline claculateWeightedStd:](self, "claculateWeightedStd:", *(double *)&v174);
  v106 = v105;
  objc_msgSend(v13, "setConfidence:");
  -[ADJasperColorInFieldCalibrationPipelineParameters maxStdForValidResult](self->_pipelineParameters, "maxStdForValidResult");
  if (v106 > *(float *)&v107)
  {
    v164 = 0u;
    objc_msgSend(v13, "setExecutionStatus:", -22976);
    v166 = 0u;
    v162 = 0u;
LABEL_35:

    objc_msgSend(v13, "setDeltaRotationX:", *(double *)&v176);
    HIDWORD(v132) = DWORD1(v176);
    LODWORD(v132) = DWORD1(v176);
    objc_msgSend(v13, "setDeltaRotationY:", v132);
    objc_msgSend(v13, "setDeltaRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v176), DWORD2(v176))));
    objc_msgSend(v13, "setStdX:", *(double *)&v174);
    HIDWORD(v133) = DWORD1(v174);
    LODWORD(v133) = DWORD1(v174);
    objc_msgSend(v13, "setStdY:", v133);
    objc_msgSend(v13, "setStdZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v174), DWORD2(v174))));
    objc_msgSend(v13, "setAbsoluteRotationX:", *(double *)&v171);
    HIDWORD(v134) = DWORD1(v171);
    LODWORD(v134) = DWORD1(v171);
    objc_msgSend(v13, "setAbsoluteRotationY:", v134);
    objc_msgSend(v13, "setAbsoluteRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v171), DWORD2(v171))));
    objc_msgSend(v13, "setFactoryRotationX:", *(double *)&v172);
    HIDWORD(v135) = DWORD1(v172);
    LODWORD(v135) = DWORD1(v172);
    objc_msgSend(v13, "setFactoryRotationY:", v135);
    objc_msgSend(v13, "setFactoryRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v172), DWORD2(v172))));
    objc_msgSend(v13, "setAbsoluteRotationPostISFX:", *(double *)&v164);
    HIDWORD(v136) = DWORD1(v164);
    LODWORD(v136) = DWORD1(v164);
    objc_msgSend(v13, "setAbsoluteRotationPostISFY:", v136);
    objc_msgSend(v13, "setAbsoluteRotationPostISFZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v164), DWORD2(v164))));
    objc_msgSend(v13, "setPreRelative2FactoryX:", *(double *)&v169);
    HIDWORD(v137) = DWORD1(v169);
    LODWORD(v137) = DWORD1(v169);
    objc_msgSend(v13, "setPreRelative2FactoryY:", v137);
    objc_msgSend(v13, "setPreRelative2FactoryZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v169), DWORD2(v169))));
    objc_msgSend(v13, "setPostRelative2FactoryX:", *(double *)v166.i64);
    HIDWORD(v138) = v166.i32[1];
    LODWORD(v138) = v166.i32[1];
    objc_msgSend(v13, "setPostRelative2FactoryY:", v138);
    objc_msgSend(v13, "setPostRelative2FactoryZ:", COERCE_DOUBLE(__PAIR64__(v166.u32[1], v166.u32[2])));
    objc_msgSend(v13, "setPostRelative2PrevX:", *(double *)&v162);
    HIDWORD(v139) = DWORD1(v162);
    LODWORD(v139) = DWORD1(v162);
    objc_msgSend(v13, "setPostRelative2PrevY:", v139);
    objc_msgSend(v13, "setPostRelative2PrevZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v162), DWORD2(v162))));
    objc_msgSend(v13, "setMotionRotation:", *(_QWORD *)&anon_3bd140[17]);
    objc_msgSend(v13, "setMotionTranslation:", *(_QWORD *)&anon_3bd140[18]);
    objc_msgSend(v13, "setValidDepthPercentage:", *(_QWORD *)&anon_3bd140[19]);
    v111 = 0;
    goto LABEL_36;
  }
  *(float *)&v107 = v106;
  -[ADJasperColorInFieldCalibrationPipeline convertStdToWeight:](self, "convertStdToWeight:", v107);
  v177 = 0;
  v109 = objc_msgSend(v167, "insertEntryAndCalculate:withWeight:toResult:", v104, &v177, v108);
  v110 = v177;
  if (!v109)
  {
    objc_msgSend(v167, "setSuccessfulResultCount:", objc_msgSend(v167, "successfulResultCount") + 1);
    objc_msgSend(v13, "setExecutionStatus:", 0);
    objc_msgSend(v167, "convertDictToExtrinsicsAngles:", v110);
    v166 = v112;
    +[ADUtils calcRotationMatrix:](ADUtils, "calcRotationMatrix:", *(double *)v112.i64);
    v116 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v113, v160.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v160.f32, 1), v114), (float32x4_t)vdupq_laneq_s32((int32x4_t)v160, 2), v115);
    v117 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v113, v161.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v161.f32, 1), v114), (float32x4_t)vdupq_laneq_s32((int32x4_t)v161, 2), v115);
    v118 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v113, v163.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v163.f32, 1), v114), (float32x4_t)vdupq_laneq_s32((int32x4_t)v163, 2), v115);
    v184.i32[2] = v116.i32[2];
    v185.i32[2] = v117.i32[2];
    v184.i64[0] = v116.i64[0];
    v185.i64[0] = v117.i64[0];
    v186.i32[2] = v118.i32[2];
    v186.i64[0] = v118.i64[0];
    +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v184);
    v164 = v119;
    v120 = vsubq_f32(v146, v147);
    v121 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v151, v120.f32[0]), v153, *(float32x2_t *)v120.f32, 1), v149, v120, 2);
    objc_msgSend(v13, "setJasperToColorExtrinsics:", *(double *)v184.i64, *(double *)v185.i64, *(double *)v186.i64, *(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v159, v121.f32[0]), v157, *(float32x2_t *)v121.f32, 1), v155, v121, 2).i64);
    objc_msgSend(v13, "setExecuted:", 1);
    v122 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v159, v142.f32[0]), v157, *(float32x2_t *)v142.f32, 1), v155, v142, 2);
    v123 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v159, v144.f32[0]), v157, *(float32x2_t *)v144.f32, 1), v155, v144, 2);
    v124 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v159, v145.f32[0]), v157, *(float32x2_t *)v145.f32, 1), v155, v145, 2);
    v125 = (float32x4_t)vzip1q_s32(vzip1q_s32(v184, v186), v185);
    v126 = (float32x4_t)vtrn2q_s32(v184, v185);
    v126.i32[2] = v186.i32[1];
    v127 = (float32x4_t)vzip1q_s32(vzip2q_s32(v184, v186), vdupq_laneq_s32(v185, 2));
    v128 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v125, v122.f32[0]), v126, *(float32x2_t *)v122.f32, 1), v127, v122, 2);
    v129 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v125, v123.f32[0]), v126, *(float32x2_t *)v123.f32, 1), v127, v123, 2);
    v130 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v125, v124.f32[0]), v126, *(float32x2_t *)v124.f32, 1), v127, v124, 2);
    DWORD2(v178) = v128.i32[2];
    DWORD2(v179) = v129.i32[2];
    *(_QWORD *)&v178 = v128.i64[0];
    *(_QWORD *)&v179 = v129.i64[0];
    DWORD2(v180) = v130.i32[2];
    *(_QWORD *)&v180 = v130.i64[0];
    +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v178);
    v162 = v131;

    goto LABEL_35;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "postProcessFront failed to update intersession entry", buf, 2u);
  }

  v111 = -22950;
LABEL_36:

  return v111;
}

- (int64_t)undistortColorImage:(__CVBuffer *)a3 undistortedImage:(__CVBuffer *)a4 calibration:(id)a5
{
  PixelBufferUtils *PixelFormatType;
  unint64_t v9;
  CGRect *v10;
  float32x2_t v11;
  float v12;
  float32x2_t v13;
  float v14;
  float v15;
  vImagePixelCount height;
  vImagePixelCount width;
  vImagePixelCount v18;
  CGPoint *distortedImagePixels;
  size_t rowBytes;
  float v21;
  char *data;
  float v23;
  char *v24;
  size_t v25;
  CGFloat *p_y;
  char *v27;
  vImagePixelCount v28;
  char *v29;
  vImagePixelCount v30;
  _BYTE *v31;
  double *p_x;
  float v33;
  BOOL v34;
  float v35;
  BOOL v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  float32x2_t v42;
  float v43;
  float v44;
  size_t v45;
  size_t v46;
  char *v47;
  char *v48;
  _BYTE *v49;
  unint64_t v50;
  float32x2_t v51;
  float v52;
  float v53;
  BOOL v54;
  double *v55;
  uint64_t i;
  float v57;
  float v58;
  BOOL v59;
  vImage_Buffer v61;
  vImage_Buffer v62;

  PixelFormatType = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
  v9 = PixelBufferUtils::pixelSizeForPixelFormat(PixelFormatType, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  CVPixelBufferLockBaseAddress(a3, 0);
  memset(&v62, 0, sizeof(v62));
  v10 = (CGRect *)MEMORY[0x24BDBF090];
  PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &v62);
  memset(&v61, 0, sizeof(v61));
  PixelBufferUtils::asVImageBuffer(a4, *v10, &v61);
  height = v61.height;
  if (v61.height)
  {
    width = v61.width;
    if (v61.width)
    {
      v18 = 0;
      distortedImagePixels = self->_distortedImagePixels;
      rowBytes = v62.rowBytes;
      v21 = (float)(v62.width - 1);
      data = (char *)v62.data;
      v23 = (float)(v62.height - 1);
      v24 = (char *)v61.data;
      v25 = v61.rowBytes;
      p_y = &self->_distortedImagePixels[1].y;
      v27 = (char *)v61.data;
      v28 = v61.width;
      do
      {
        if (v28)
        {
          v29 = &v24[v25 * v18];
          if (v9)
          {
            v30 = 0;
            v31 = v27;
            do
            {
              p_x = &distortedImagePixels[v30 + v28 * v18].x;
              v33 = *p_x + -0.5;
              v34 = v33 >= 0.0 && v33 < v21;
              if (v34 && ((v35 = p_x[1] + -0.5, v35 >= 0.0) ? (v36 = v35 < v23) : (v36 = 0), v36))
              {
                v37 = vcvtms_u32_f32(v33);
                v38 = vcvtps_u32_f32(v33);
                v39 = vcvtms_u32_f32(v35);
                v40 = vcvtps_u32_f32(v35);
                if (v37 == v38)
                  v41 = v38 + 1;
                else
                  v41 = v38;
                if (v39 == v40)
                  ++v40;
                v42.f32[0] = (float)v41 - v33;
                v42.f32[1] = v33 - (float)v37;
                v43 = (float)v40 - v35;
                v11.f32[0] = v35 - (float)v39;
                if ((v40 - v39) * (v41 - v37) == 1)
                  v44 = 1.0;
                else
                  v44 = 0.0;
                v11 = (float32x2_t)vdup_lane_s32((int32x2_t)v11, 0);
                v45 = rowBytes * v39;
                v46 = rowBytes * v40;
                v47 = &data[v41 * v9];
                v48 = &data[v9 * v37];
                v49 = v31;
                v50 = v9;
                do
                {
                  LOBYTE(v12) = v48[v45];
                  v13.i8[0] = v48[v46];
                  v51.f32[0] = (float)LODWORD(v12);
                  LOBYTE(v14) = v47[v45];
                  v14 = (float)LODWORD(v14);
                  LOBYTE(v15) = v47[v46];
                  v13.f32[0] = (float)v13.u32[0];
                  v15 = (float)LODWORD(v15);
                  v51.f32[1] = v14;
                  v13.f32[1] = v15;
                  v12 = vaddv_f32(vmul_f32(v42, vmla_f32(vmul_n_f32(v51, v43), v11, v13))) * v44;
                  *v49++ = (int)v12;
                  ++v47;
                  ++v48;
                  --v50;
                }
                while (v50);
              }
              else
              {
                *(_DWORD *)&v29[v30 * v9] = 0;
              }
              ++v30;
              v31 += v9;
              v28 = width;
            }
            while (v30 < width);
          }
          else
          {
            v52 = distortedImagePixels[v28 * v18].x + -0.5;
            if (v52 < 0.0
              || v52 >= v21
              || ((v53 = distortedImagePixels[v28 * v18].y + -0.5, v53 >= 0.0) ? (v54 = v53 < v23) : (v54 = 0), !v54))
            {
              *(_DWORD *)v29 = 0;
            }
            v28 = width;
            if (width < 2)
              goto LABEL_5;
            v55 = p_y;
            for (i = 1; i != width; ++i)
            {
              v57 = *(v55 - 1) + -0.5;
              if (v57 < 0.0 || v57 >= v21 || ((v58 = *v55 + -0.5, v58 >= 0.0) ? (v59 = v58 < v23) : (v59 = 0), !v59))
                *(_DWORD *)v29 = 0;
              v55 += 2;
            }
          }
          v28 = width;
        }
LABEL_5:
        ++v18;
        v27 += v25;
        p_y += 2 * width;
      }
      while (v18 < height);
    }
  }
  CVPixelBufferUnlockBaseAddress(a4, 0);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return 0;
}

- (float)claculateWeightedStd:(ADJasperColorInFieldCalibrationPipeline *)self
{
  _BYTE v2[12];
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  int v17;

  v17 = *(_DWORD *)&v2[8];
  -[ADJasperColorInFieldCalibrationPipelineParameters coeffX](self->_pipelineParameters, "coeffX");
  -[ADJasperColorInFieldCalibrationPipelineParameters coeffY](self->_pipelineParameters, "coeffY");
  -[ADJasperColorInFieldCalibrationPipelineParameters coeffZ](self->_pipelineParameters, "coeffZ");
  _V1.S[2] = v17;
  __asm { FMLA            S9, S0, V1.S[2] }
  -[ADJasperColorInFieldCalibrationPipelineParameters coeffX](self->_pipelineParameters, "coeffX");
  v12 = v11;
  -[ADJasperColorInFieldCalibrationPipelineParameters coeffY](self->_pipelineParameters, "coeffY");
  v14 = v12 + v13;
  -[ADJasperColorInFieldCalibrationPipelineParameters coeffZ](self->_pipelineParameters, "coeffZ");
  return _S9 / (float)(v14 + v15);
}

- (float)convertStdToWeight:(float)a3
{
  return 1.0 / (a3 * a3);
}

- (void)reportTelemetry:(id)a3 withInterSessionData:(id)a4
{
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  int v11;
  int v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSMutableArray *v60;
  id v61;
  void *v62;
  uint8_t buf[4];
  const __CFString *v64;
  _QWORD v65[24];
  _QWORD v66[26];

  v66[24] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v61 = a4;
  objc_msgSend(v61, "inFieldCalibrationTelemetryData");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "firedEventTimestampsArray");
  v60 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "executed"))
  {
    objc_msgSend(v5, "postRelative2FactoryX");
    v7 = v6;
    objc_msgSend(v5, "postRelative2FactoryY");
    v9 = v8;
    objc_msgSend(v5, "postRelative2FactoryZ");
    analyzeOneShotExtremeRotation(v7, v9, v10, CFSTR("com.apple.applecamerad.JasperToRGB.LargeToleranceDetected"), v60);
  }
  objc_msgSend(v5, "confidence");
  objc_msgSend(v5, "confidence");
  v12 = v11;
  v66[0] = CFSTR("N/A");
  v65[0] = CFSTR("JasperPreset");
  v65[1] = CFSTR("MaxBackBoneRunTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v62, "maxBackEndRunTime") / 1000.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v59;
  v65[2] = CFSTR("MinBackBoneRunTime");
  v13 = (void *)MEMORY[0x24BDD16E0];
  v14 = (double)(unint64_t)objc_msgSend(v62, "minBackEndRunTime") / 1000.0;
  *(float *)&v14 = v14;
  objc_msgSend(v13, "numberWithFloat:", v14);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v58;
  v65[3] = CFSTR("TimeSincePrevRun");
  v15 = (void *)MEMORY[0x24BDD16E0];
  v16 = (double)(unint64_t)objc_msgSend(v62, "timeSincePrevRun") / 1000.0;
  *(float *)&v16 = v16;
  objc_msgSend(v15, "numberWithFloat:", v16);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v57;
  v65[4] = CFSTR("TotalBackBoneTime");
  v17 = (void *)MEMORY[0x24BDD16E0];
  v18 = (double)(unint64_t)objc_msgSend(v62, "totalBackEndTime") / 1000.0;
  *(float *)&v18 = v18;
  objc_msgSend(v17, "numberWithFloat:", v18);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v56;
  v65[5] = CFSTR("TotalFrontEndTime");
  v19 = (void *)MEMORY[0x24BDD16E0];
  v20 = (double)(unint64_t)objc_msgSend(v62, "frontEndTime") / 1000.0;
  *(float *)&v20 = v20;
  objc_msgSend(v19, "numberWithFloat:", v20);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v66[5] = v55;
  v65[6] = CFSTR("TotalNumRuns");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v62, "totalNumRuns"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v66[6] = v54;
  v65[7] = CFSTR("WideAverageNumValidPoints");
  v21 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v62, "getAverageNumValidPoints");
  objc_msgSend(v21, "numberWithFloat:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v66[7] = v52;
  v65[8] = CFSTR("WideConfidence");
  LODWORD(v22) = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v66[8] = v53;
  v65[9] = CFSTR("WideFilteredRotXComparedToFactory");
  v23 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2FactoryX");
  objc_msgSend(v23, "numberWithFloat:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v66[9] = v51;
  v65[10] = CFSTR("WideFilteredRotXComparedToPrev");
  v24 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2PrevX");
  objc_msgSend(v24, "numberWithFloat:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v66[10] = v50;
  v65[11] = CFSTR("WideFilteredRotYComparedToFactory");
  v25 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2FactoryY");
  objc_msgSend(v25, "numberWithFloat:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v66[11] = v49;
  v65[12] = CFSTR("WideFilteredRotYComparedToPrev");
  v26 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2PrevY");
  objc_msgSend(v26, "numberWithFloat:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v66[12] = v48;
  v65[13] = CFSTR("WideFilteredRotZComparedToFactory");
  v27 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2FactoryZ");
  objc_msgSend(v27, "numberWithFloat:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v66[13] = v47;
  v65[14] = CFSTR("WideFilteredRotZComparedToPrev");
  v28 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2PrevZ");
  objc_msgSend(v28, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v66[14] = v46;
  v65[15] = CFSTR("WideNumberOfFrames");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v62, "validPointsSumEventsCount"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66[15] = v45;
  v65[16] = CFSTR("WideRotXComparedToFactory");
  v29 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "preRelative2FactoryX");
  objc_msgSend(v29, "numberWithFloat:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v66[16] = v30;
  v65[17] = CFSTR("WideRotXComparedToPrev");
  v31 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "deltaRotationX");
  objc_msgSend(v31, "numberWithFloat:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v66[17] = v32;
  v65[18] = CFSTR("WideRotYComparedToFactory");
  v33 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "preRelative2FactoryY");
  objc_msgSend(v33, "numberWithFloat:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v66[18] = v34;
  v65[19] = CFSTR("WideRotYComparedToPrev");
  v35 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "deltaRotationY");
  objc_msgSend(v35, "numberWithFloat:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v66[19] = v36;
  v65[20] = CFSTR("WideRotZComparedToFactory");
  v37 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "preRelative2FactoryZ");
  objc_msgSend(v37, "numberWithFloat:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v66[20] = v38;
  v65[21] = CFSTR("WideRotZComparedToPrev");
  v39 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "deltaRotationZ");
  objc_msgSend(v39, "numberWithFloat:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v66[21] = v40;
  v65[22] = CFSTR("WideSucceeded");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "executed"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v66[22] = v41;
  v65[23] = CFSTR("IsFirstTimeForDevice");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v61, "isfCapacity") == objc_msgSend(v61, "successfulResultCount"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v66[23] = v42;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 24);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v43;
  if (AnalyticsSendEventLazy())
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v64 = CFSTR("com.apple.applecamerad.JasperToRGB");
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Jasper Color In-Field calibration pipeline Telemetry event %@ fired", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v64 = CFSTR("com.apple.applecamerad.JasperToRGB");
      _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Jasper Color In-Field calibration pipeline Telemetry event %@ fired", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v64 = CFSTR("com.apple.applecamerad.JasperToRGB");
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Jasper Color In-Field calibration pipeline Telemetry event %{public}@ failed to fire", buf, 0xCu);
  }

}

- (ADJasperColorInFieldCalibrationPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void)setPipelineParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 3920392);
}

- (void).cxx_destruct
{
  unique_ptr<PixelBufferUtilsSession, std::default_delete<PixelBufferUtilsSession>> *p_colorInputProcessingSession;
  PixelBufferUtilsSession *value;
  PixelBufferUtilsSession *v5;
  PixelBufferUtilsSession *v6;
  PixelBufferUtilsSession *v7;
  CGFloat v8;
  CGFloat width;
  PixelBufferUtilsSession *v10;

  p_colorInputProcessingSession = &self->_colorInputProcessingSession;
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  value = p_colorInputProcessingSession[31].__ptr_.__value_;
  if (value)
  {
    v5 = p_colorInputProcessingSession[32].__ptr_.__value_;
    v6 = p_colorInputProcessingSession[31].__ptr_.__value_;
    if (v5 != value)
    {
      v7 = p_colorInputProcessingSession[32].__ptr_.__value_;
      do
      {
        width = v7[-1].var7.size.width;
        v7 = (PixelBufferUtilsSession *)((char *)v7 - 24);
        v8 = width;
        if (width != 0.0)
        {
          v5[-1].var7.size.height = v8;
          operator delete(*(void **)&v8);
        }
        v5 = v7;
      }
      while (v7 != value);
      v6 = p_colorInputProcessingSession[31].__ptr_.__value_;
    }
    p_colorInputProcessingSession[32].__ptr_.__value_ = value;
    operator delete(v6);
  }
  objc_storeStrong((id *)&self->_jasperCalib, 0);
  objc_storeStrong((id *)&self->_colorCalib, 0);
  v10 = p_colorInputProcessingSession->__ptr_.__value_;
  p_colorInputProcessingSession->__ptr_.__value_ = 0;
  if (v10)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(v10);
    MEMORY[0x20BD36498]();
  }
  objc_storeStrong((id *)&self->_controllerParameters, 0);
  objc_storeStrong((id *)&self->_frontendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_backendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_frontendNetworkProvider, 0);
  objc_storeStrong((id *)&self->_backendNetworkProvider, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 490014) = 0;
  *((_QWORD *)self + 490046) = 0;
  *((_QWORD *)self + 490047) = 0;
  *((_QWORD *)self + 490045) = 0;
  return self;
}

id __80__ADJasperColorInFieldCalibrationPipeline_reportTelemetry_withInterSessionData___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)isInSupportedFormat:(__CVBuffer *)a3
{
  signed int PixelFormatType;
  id v4;
  BOOL result;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AD-RGBJ controller CVPixelBufferGetPixelFormatType:%c%c%c%c \n"), HIBYTE(PixelFormatType), BYTE2(PixelFormatType), BYTE1(PixelFormatType), PixelFormatType);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v7 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);

  }
  result = 1;
  if (PixelFormatType > 875704437)
  {
    if (PixelFormatType > 2084070959)
    {
      if (PixelFormatType != 2084070960 && PixelFormatType != 2084075056 && PixelFormatType != 2088269360)
        return 0;
    }
    else if (PixelFormatType != 875704438 && PixelFormatType != 1882468912 && PixelFormatType != 2016686640)
    {
      return 0;
    }
  }
  else if (PixelFormatType > 758674991)
  {
    if (PixelFormatType != 758674992 && PixelFormatType != 762869296 && PixelFormatType != 875704422)
      return 0;
  }
  else if (PixelFormatType != 641234480 && PixelFormatType != 645428784 && PixelFormatType != 758670896)
  {
    return 0;
  }
  return result;
}

+ (BOOL)isCroppingPointInThresholdRange:(double)a3 distanceFromSymmetricCroppingPoint:(double)a4 normalizedBySensorDimention:(double)a5 andAllowedDriftFromSymmetricCrop:(float)a6
{
  return vabdd_f64(a4, a3) / a5 < a6;
}

+ (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4 andPipelineParameters:(id)a5
{
  NSDictionary *v7;
  ADJasperColorInFieldCalibrationPipelineParameters *v8;
  void *v9;
  int v10;
  ADJasperColorInFieldCalibrationControllerParameters *v11;

  v7 = (NSDictionary *)a4;
  v8 = (ADJasperColorInFieldCalibrationPipelineParameters *)a5;
  -[ADPipelineParameters deviceName](v8, "deviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("N301"));

  v11 = -[ADJasperColorInFieldCalibrationControllerParameters initWithFlowType:]([ADJasperColorInFieldCalibrationControllerParameters alloc], "initWithFlowType:", v10 ^ 1u);
  LOBYTE(a3) = isColorFrameValidImpl(a3, v7, v8, v11);

  return (char)a3;
}

+ (BOOL)isJasperFrameValid:(id)a3 andPipelineParameters:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  ADJasperColorInFieldCalibrationControllerParameters *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "deviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("N301"));

  v9 = -[ADJasperColorInFieldCalibrationControllerParameters initWithFlowType:]([ADJasperColorInFieldCalibrationControllerParameters alloc], "initWithFlowType:", v8 ^ 1u);
  LOBYTE(v8) = isJasperFrameValidImpl(v5, v6, v9, 0, 0, 0, *MEMORY[0x24BDAEE00], *(float32x4_t *)(MEMORY[0x24BDAEE00] + 16), *(float32x4_t *)(MEMORY[0x24BDAEE00] + 32), *(float32x4_t *)(MEMORY[0x24BDAEE00] + 48), *MEMORY[0x24BDAEE00], *(int32x4_t *)(MEMORY[0x24BDAEE00] + 16), *(int32x4_t *)(MEMORY[0x24BDAEE00] + 32), *(int32x4_t *)(MEMORY[0x24BDAEE00] + 48));

  return v8;
}

@end

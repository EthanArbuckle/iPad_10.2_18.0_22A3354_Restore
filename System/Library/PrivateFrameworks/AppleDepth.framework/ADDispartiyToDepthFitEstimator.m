@implementation ADDispartiyToDepthFitEstimator

- (ADDispartiyToDepthFitEstimator)init
{
  ADDisparityToDepthFitEstimatorParameters *v3;
  ADDispartiyToDepthFitEstimator *v4;

  v3 = objc_alloc_init(ADDisparityToDepthFitEstimatorParameters);
  v4 = -[ADDispartiyToDepthFitEstimator initWithParameters:](self, "initWithParameters:", v3);

  return v4;
}

- (ADDispartiyToDepthFitEstimator)initWithParameters:(id)a3
{
  id v4;
  ADDispartiyToDepthFitEstimator *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  ADDispartiyToDepthFitEstimator *v11;
  void *v12;
  uint64_t v13;
  ADLogManager *logger;
  uint64_t v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  char v21;
  int v22;
  char v23;
  float v24;
  float v25;
  int v26;
  int v27;
  float v28;
  float v29;
  uint64_t v30;
  float v31;
  DisparityToDepthFitEstimator *value;
  uint64_t v33;
  void *v34;
  void *v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  float v43;
  float v44;
  float v45;
  float v46;
  int v47;
  float v48;
  float v49;
  uint64_t v50;
  float v51;
  objc_super v53;
  uint8_t buf[4];
  float v55;
  _BYTE v56[12];
  uint64_t v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  __int16 v62;
  double v63;
  __int16 v64;
  double v65;
  __int16 v66;
  int v67;
  __int16 v68;
  double v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  double v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  *(_QWORD *)&self->_updateWorldPointsCounter = 0;
  if (v4)
  {
    v53.receiver = self;
    v53.super_class = (Class)ADDispartiyToDepthFitEstimator;
    v5 = -[ADDispartiyToDepthFitEstimator init](&v53, sel_init);
    if (v5)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "hasPrefix:", CFSTR("ad")))
      {
        objc_msgSend(v8, "substringFromIndex:", 2);
        v9 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v9;
      }
      else
      {
        v10 = v8;
      }
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("parameters"), &stru_24C421AD8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[ADLogManager defaultLoggerWithName:](ADLogManager, "defaultLoggerWithName:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      logger = v5->_logger;
      v5->_logger = (ADLogManager *)v13;

      v15 = operator new();
      v16 = objc_msgSend(v4, "iterations");
      objc_msgSend(v4, "threshold");
      v18 = v17;
      objc_msgSend(v4, "minInlinersRatio");
      v20 = v19;
      v21 = objc_msgSend(v4, "constantSlope");
      v22 = objc_msgSend(v4, "seed");
      v23 = objc_msgSend(v4, "errorCalculationOnDisparity");
      v24 = v18;
      *(_DWORD *)buf = v16;
      v25 = v20;
      v55 = v24;
      *(float *)v56 = v25;
      v56[4] = v21;
      *(_DWORD *)&v56[8] = v22;
      LOBYTE(v57) = v23;
      objc_msgSend(v4, "minDepth");
      LODWORD(v18) = v26;
      objc_msgSend(v4, "maxDepth");
      LODWORD(v20) = v27;
      LOBYTE(v16) = objc_msgSend(v4, "smoothing");
      objc_msgSend(v4, "smoothingWeight");
      v29 = v28;
      v30 = objc_msgSend(v4, "retainedWorldPointsCapacity");
      objc_msgSend(v4, "retainedWorldPointsConfidenceThreshold");
      DisparityToDepth::DisparityToDepthFitEstimator::DisparityToDepthFitEstimator(v15, (int *)buf, v16, v30, *(float *)&v18, *(float *)&v20, v29, v31);
      value = v5->_impl.__ptr_.__value_;
      v5->_impl.__ptr_.__value_ = (DisparityToDepthFitEstimator *)v15;
      if (value)
      {
        v33 = *((_QWORD *)value + 8);
        *((_QWORD *)value + 8) = 0;
        if (v33)
          (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
        v34 = (void *)*((_QWORD *)value + 4);
        if (v34)
        {
          *((_QWORD *)value + 5) = v34;
          operator delete(v34);
        }
        v35 = *(void **)value;
        if (*(_QWORD *)value)
        {
          *((_QWORD *)value + 1) = v35;
          operator delete(v35);
        }
        MEMORY[0x20BD36498](value, 0x1020C40BCF4D35DLL);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v36) = objc_msgSend(v4, "iterations");
        objc_msgSend(v4, "threshold");
        v38 = v37;
        objc_msgSend(v4, "minInlinersRatio");
        v40 = v39;
        v41 = objc_msgSend(v4, "constantSlope");
        v42 = objc_msgSend(v4, "seed");
        objc_msgSend(v4, "minDepth");
        v44 = v43;
        objc_msgSend(v4, "maxDepth");
        v46 = v45;
        v47 = objc_msgSend(v4, "smoothing");
        objc_msgSend(v4, "smoothingWeight");
        v49 = v48;
        v50 = objc_msgSend(v4, "retainedWorldPointsCapacity");
        objc_msgSend(v4, "retainedWorldPointsConfidenceThreshold");
        *(_DWORD *)buf = 67111680;
        v55 = v36;
        *(_WORD *)v56 = 2048;
        *(_QWORD *)&v56[2] = v38;
        *(_WORD *)&v56[10] = 2048;
        v57 = v40;
        v58 = 1024;
        v59 = v41;
        v60 = 1024;
        v61 = v42;
        v62 = 2048;
        v63 = v44;
        v64 = 2048;
        v65 = v46;
        v66 = 1024;
        v67 = v47;
        v68 = 2048;
        v69 = v49;
        v70 = 2048;
        v71 = v50;
        v72 = 2048;
        v73 = v51;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DisparityToDepth [Always ] Constructed with iterations: %d threshold: %f minInlinersRatio: %f constantSlope: %d seed: %d minDepth: %f maxDepth: %f smoothing: %d smoothingWeight: %f retainedWorldPointsCapacity: %zu retainedWorldPointsConfidenceThreshold: %f", buf, 0x60u);
      }

    }
    self = v5;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updateWorldPoints:(ADDisparityToDepthFitWorldPoint *)a3 pointCount:(unsigned int)a4 pointsTimestamp:(double)a5
{
  unsigned int v5;
  unsigned int updateWorldPointsCounter;
  ADLogManager *v11;
  std::string *v12;
  __int128 v13;
  uint8_t *v14;
  std::string v15;
  uint8_t buf[16];
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = self->_updateWorldPointsCounter + 1;
  self->_updateWorldPointsCounter = v5;
  if (self->_impl.__ptr_.__value_)
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = v5;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = a4;
        *(_WORD *)&buf[14] = 2048;
        v17 = a5;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DisparityToDepth [Debug  ] updateWorldPoints %u with pointCount: %d pointsTimestamp: %f", buf, 0x18u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = a4;
      *(_WORD *)&buf[14] = 2048;
      v17 = a5;
      _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "DisparityToDepth [Debug  ] updateWorldPoints %u with pointCount: %d pointsTimestamp: %f", buf, 0x18u);
    }
    updateWorldPointsCounter = self->_updateWorldPointsCounter;
    v11 = self->_logger;
    std::to_string(&v15, updateWorldPointsCounter);
    v12 = std::string::insert(&v15, 0, "world_points_frame_");
    v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    v17 = *(double *)&v12->__r_.__value_.__r.__words[2];
    *(_OWORD *)buf = v13;
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v15.__r_.__value_.__l.__data_);
    if (v17 >= 0.0)
      v14 = buf;
    else
      v14 = *(uint8_t **)buf;
    -[ADLogManager logRawBuffer:size:name:priority:](v11, "logRawBuffer:size:name:priority:", a3, 32 * a4, v14, 0);
    if (SHIBYTE(v17) < 0)
      operator delete(*(void **)buf);

    DisparityToDepth::WorldPointsContainer::push((DisparityToDepth::WorldPointsContainer *)self->_impl.__ptr_.__value_, a3, a4);
  }
}

- (ADDisparityToDepthFitResult)estimateWithDisparity:(__n128)a3 calibration:(__n128)a4 pose:(__n128)a5 disparityTimestamp:(double)a6
{
  id v12;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  int v16;
  int v17;
  ADDisparityToDepthFitResult *v18;
  void *BaseAddress;
  std::string *v20;
  __int128 v21;
  void **v22;
  std::string *v23;
  __int128 v24;
  std::string *v25;
  __int128 v26;
  std::string *v27;
  __int128 v28;
  std::string *v29;
  std::string::size_type size;
  std::string *v31;
  __int128 v32;
  std::string *v33;
  __int128 v34;
  std::string *v35;
  std::string::size_type v36;
  std::string *v37;
  __int128 v38;
  std::string *v39;
  __int128 v40;
  void **v41;
  std::string *v42;
  __int128 v43;
  std::string *v44;
  __int128 v45;
  double v46;
  double v47;
  double v48;
  double v49;
  std::string *v50;
  id v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  _QWORD *v57;
  uint64_t v58;
  int v59;
  std::string::size_type v60;
  void *v61;
  void *v62;
  void *v63;
  ADDisparityToDepthFitResult *v64;
  double v65;
  double v66;
  void *v67;
  int v69;
  id v70;
  void *v75;
  _BYTE v76[32];
  __n128 v77;
  std::string v78;
  std::string v79;
  std::string v80;
  std::string v81;
  std::string v82;
  std::string v83;
  std::string v84;
  void *__p[2];
  int64_t v86;
  void *v87[2];
  int64_t v88;
  _QWORD v89[2];
  uint64_t (*v90)(uint64_t);
  void *v91;
  __CVBuffer *v92;
  _BYTE buf[56];
  uint64_t v94;
  __int128 v95;
  uint64_t v96;
  _QWORD v97[3];
  _QWORD *v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v12 = a9;
  ++*(_DWORD *)(a1 + 20);
  if (*(_QWORD *)(a1 + 8))
  {
    Width = CVPixelBufferGetWidth(a8);
    Height = CVPixelBufferGetHeight(a8);
    PixelFormatType = CVPixelBufferGetPixelFormatType(a8);
    if (PixelFormatType == 1751411059)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(_DWORD *)(a1 + 20);
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&buf[4] = v16;
          *(_WORD *)&buf[8] = 2048;
          *(_QWORD *)&buf[10] = Width;
          *(_WORD *)&buf[18] = 2048;
          *(_QWORD *)&buf[20] = Height;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = a6;
          _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DisparityToDepth [Debug  ] estimateWithDisparity %u with width: %lu height: %lu disparityTimestamp: %f", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v69 = *(_DWORD *)(a1 + 20);
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = v69;
        *(_WORD *)&buf[8] = 2048;
        *(_QWORD *)&buf[10] = Width;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = Height;
        *(_WORD *)&buf[28] = 2048;
        *(double *)&buf[30] = a6;
        _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "DisparityToDepth [Debug  ] estimateWithDisparity %u with width: %lu height: %lu disparityTimestamp: %f", buf, 0x26u);
      }
      CVPixelBufferLockBaseAddress(a8, 1uLL);
      v89[0] = MEMORY[0x24BDAC760];
      v89[1] = 3221225472;
      v90 = __92__ADDispartiyToDepthFitEstimator_estimateWithDisparity_calibration_pose_disparityTimestamp___block_invoke;
      v91 = &__block_descriptor_40_e5_v8__0l;
      v92 = a8;
      BaseAddress = CVPixelBufferGetBaseAddress(a8);
      if (!BaseAddress)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v59 = *(_DWORD *)(a1 + 20);
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&buf[4] = v59;
          *(_WORD *)&buf[8] = 2048;
          *(_QWORD *)&buf[10] = Width;
          *(_WORD *)&buf[18] = 2048;
          *(_QWORD *)&buf[20] = Height;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = a6;
          _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DisparityToDepth [Always ] estimateWithDisparity %u failed to get the base address of the disparity buffer width: %lu height: %lu disparityTimestamp: %f", buf, 0x26u);
        }
        v18 = 0;
        goto LABEL_81;
      }
      v70 = v12;
      std::to_string((std::string *)buf, *(_DWORD *)(a1 + 20));
      v20 = std::string::append((std::string *)buf, "_ad_calibration");
      v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
      v88 = v20->__r_.__value_.__r.__words[2];
      *(_OWORD *)v87 = v21;
      v20->__r_.__value_.__l.__size_ = 0;
      v20->__r_.__value_.__r.__words[2] = 0;
      v20->__r_.__value_.__r.__words[0] = 0;
      if ((buf[23] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      if (v88 >= 0)
        v22 = v87;
      else
        v22 = (void **)v87[0];
      objc_msgSend(*(id *)(a1 + 96), "logCalibration:name:priority:", v12, v22, 0);
      std::to_string(&v80, *(_DWORD *)(a1 + 20));
      v23 = std::string::insert(&v80, 0, "frame_");
      v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      v81.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v81.__r_.__value_.__l.__data_ = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      v25 = std::string::append(&v81, "_disparity_");
      v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
      v82.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v82.__r_.__value_.__l.__data_ = v26;
      v25->__r_.__value_.__l.__size_ = 0;
      v25->__r_.__value_.__r.__words[2] = 0;
      v25->__r_.__value_.__r.__words[0] = 0;
      v27 = std::string::append(&v82, "_width_");
      v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
      v83.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v83.__r_.__value_.__l.__data_ = v28;
      v27->__r_.__value_.__l.__size_ = 0;
      v27->__r_.__value_.__r.__words[2] = 0;
      v27->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v79, Width);
      if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v29 = &v79;
      else
        v29 = (std::string *)v79.__r_.__value_.__r.__words[0];
      if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v79.__r_.__value_.__r.__words[2]);
      else
        size = v79.__r_.__value_.__l.__size_;
      v31 = std::string::append(&v83, (const std::string::value_type *)v29, size);
      v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
      v84.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v84.__r_.__value_.__l.__data_ = v32;
      v31->__r_.__value_.__l.__size_ = 0;
      v31->__r_.__value_.__r.__words[2] = 0;
      v31->__r_.__value_.__r.__words[0] = 0;
      v33 = std::string::append(&v84, "_height_");
      v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
      *(_QWORD *)&v76[16] = *((_QWORD *)&v33->__r_.__value_.__l + 2);
      *(_OWORD *)v76 = v34;
      v33->__r_.__value_.__l.__size_ = 0;
      v33->__r_.__value_.__r.__words[2] = 0;
      v33->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v78, Height);
      if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v35 = &v78;
      else
        v35 = (std::string *)v78.__r_.__value_.__r.__words[0];
      if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v36 = HIBYTE(v78.__r_.__value_.__r.__words[2]);
      else
        v36 = v78.__r_.__value_.__l.__size_;
      v37 = std::string::append((std::string *)v76, (const std::string::value_type *)v35, v36);
      v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
      *(_QWORD *)&buf[16] = *((_QWORD *)&v37->__r_.__value_.__l + 2);
      *(_OWORD *)buf = v38;
      v37->__r_.__value_.__l.__size_ = 0;
      v37->__r_.__value_.__r.__words[2] = 0;
      v37->__r_.__value_.__r.__words[0] = 0;
      v39 = std::string::append((std::string *)buf, ".bin");
      v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
      v86 = v39->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v40;
      v39->__r_.__value_.__l.__size_ = 0;
      v39->__r_.__value_.__r.__words[2] = 0;
      v39->__r_.__value_.__r.__words[0] = 0;
      if ((buf[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)buf);
        if ((SHIBYTE(v78.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_31:
          if ((v76[23] & 0x80000000) == 0)
            goto LABEL_32;
          goto LABEL_54;
        }
      }
      else if ((SHIBYTE(v78.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_31;
      }
      operator delete(v78.__r_.__value_.__l.__data_);
      if ((v76[23] & 0x80000000) == 0)
      {
LABEL_32:
        if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_33;
        goto LABEL_55;
      }
LABEL_54:
      operator delete(*(void **)v76);
      if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_33:
        if ((SHIBYTE(v79.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_34;
        goto LABEL_56;
      }
LABEL_55:
      operator delete(v84.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v79.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_34:
        if ((SHIBYTE(v83.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_35;
        goto LABEL_57;
      }
LABEL_56:
      operator delete(v79.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v83.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_35:
        if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_36;
        goto LABEL_58;
      }
LABEL_57:
      operator delete(v83.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_36:
        if ((SHIBYTE(v81.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_37;
        goto LABEL_59;
      }
LABEL_58:
      operator delete(v82.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v81.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_37:
        if ((SHIBYTE(v80.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_38;
LABEL_60:
        operator delete(v80.__r_.__value_.__l.__data_);
LABEL_38:
        if (v86 >= 0)
          v41 = __p;
        else
          v41 = (void **)__p[0];
        objc_msgSend(*(id *)(a1 + 96), "logPixelBuffer:name:priority:", a8, v41, 0);
        std::to_string((std::string *)v76, *(_DWORD *)(a1 + 20));
        v42 = std::string::insert((std::string *)v76, 0, "frame_");
        v43 = *(_OWORD *)&v42->__r_.__value_.__l.__data_;
        *(_QWORD *)&buf[16] = *((_QWORD *)&v42->__r_.__value_.__l + 2);
        *(_OWORD *)buf = v43;
        v42->__r_.__value_.__l.__size_ = 0;
        v42->__r_.__value_.__r.__words[2] = 0;
        v42->__r_.__value_.__r.__words[0] = 0;
        v44 = std::string::append((std::string *)buf, "_pose");
        v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
        v84.__r_.__value_.__r.__words[2] = v44->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v84.__r_.__value_.__l.__data_ = v45;
        v44->__r_.__value_.__l.__size_ = 0;
        v44->__r_.__value_.__r.__words[2] = 0;
        v44->__r_.__value_.__r.__words[0] = 0;
        v46 = a4.n128_f64[0];
        v47 = a5.n128_f64[0];
        v48 = a2.n128_f64[0];
        v49 = a3.n128_f64[0];
        if ((buf[23] & 0x80000000) != 0)
        {
          operator delete(*(void **)buf);
          v48 = a2.n128_f64[0];
          v49 = a3.n128_f64[0];
          v46 = a4.n128_f64[0];
          v47 = a5.n128_f64[0];
          if ((v76[23] & 0x80000000) == 0)
            goto LABEL_43;
        }
        else if ((v76[23] & 0x80000000) == 0)
        {
          goto LABEL_43;
        }
        operator delete(*(void **)v76);
        v48 = a2.n128_f64[0];
        v49 = a3.n128_f64[0];
        v46 = a4.n128_f64[0];
        v47 = a5.n128_f64[0];
LABEL_43:
        if ((v84.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v50 = &v84;
        else
          v50 = (std::string *)v84.__r_.__value_.__r.__words[0];
        objc_msgSend(*(id *)(a1 + 96), "logMatrix4x4:name:priority:", v50, 0, v48, v49, v46, v47);
        v51 = v12;
        *(__n128 *)v76 = a2;
        *(__n128 *)&v76[16] = a3;
        v77 = a4;
        *(__n128 *)&v83.__r_.__value_.__l.__data_ = a5;
        objc_msgSend(v51, "referenceDimensions");
        v53 = v52;
        objc_msgSend(v51, "referenceDimensions");
        v55 = v54;
        v56 = v51;
        v97[0] = &off_24C421548;
        v97[1] = v56;
        v98 = v97;
        DisparityToDepth::VioProjectionFactory::create(v76, (__int128 *)&v83, v97, (uint64_t *)&v82);
        v57 = v98;
        if (v98 == v97)
        {
          v58 = 4;
          v57 = v97;
        }
        else
        {
          if (!v98)
            goto LABEL_65;
          v58 = 5;
        }
        (*(void (**)(void))(*v57 + 8 * v58))();
LABEL_65:
        v75 = v56;
        v60 = v82.__r_.__value_.__r.__words[0];
        DisparityToDepth::DisparityToDepthFitEstimator::estimate(*(DisparityToDepth::WorldPointsContainer **)(a1 + 8), (uint64_t)BaseAddress, (Height * Width), Width, *(double *)&Height, (unint64_t)v53, (unint64_t)v55, (uint64_t)v82.__r_.__value_.__l.__data_, (uint64_t)buf);
        v61 = *(void **)(a1 + 24);
        if (v61)
        {
          *(_QWORD *)(a1 + 32) = v61;
          operator delete(v61);
          *(_QWORD *)(a1 + 24) = 0;
          *(_QWORD *)(a1 + 32) = 0;
          *(_QWORD *)(a1 + 40) = 0;
        }
        v62 = *(void **)(a1 + 48);
        *(_OWORD *)(a1 + 24) = *(_OWORD *)&buf[16];
        *(_QWORD *)(a1 + 40) = *(_QWORD *)&buf[32];
        memset(&buf[16], 0, 24);
        if (v62)
        {
          *(_QWORD *)(a1 + 56) = v62;
          operator delete(v62);
          *(_QWORD *)(a1 + 48) = 0;
          *(_QWORD *)(a1 + 56) = 0;
          *(_QWORD *)(a1 + 64) = 0;
        }
        v63 = *(void **)(a1 + 72);
        *(_OWORD *)(a1 + 48) = *(_OWORD *)&buf[40];
        *(_QWORD *)(a1 + 64) = v94;
        *(_QWORD *)&buf[48] = 0;
        v94 = 0;
        *(_QWORD *)&buf[40] = 0;
        if (v63)
        {
          *(_QWORD *)(a1 + 80) = v63;
          operator delete(v63);
          *(_QWORD *)(a1 + 72) = 0;
          *(_QWORD *)(a1 + 80) = 0;
          *(_QWORD *)(a1 + 88) = 0;
        }
        *(_OWORD *)(a1 + 72) = v95;
        *(_QWORD *)(a1 + 88) = v96;
        v96 = 0;
        v95 = 0uLL;
        if (buf[0])
        {
          v64 = [ADDisparityToDepthFitResult alloc];
          LODWORD(v65) = *(_DWORD *)&buf[4];
          LODWORD(v66) = *(_DWORD *)&buf[8];
          v18 = -[ADDisparityToDepthFitResult initWithDisparityToDepthMultiplier:disparityToDepthOffset:](v64, "initWithDisparityToDepthMultiplier:disparityToDepthOffset:", v65, v66);
          if ((_QWORD)v95)
          {
            *((_QWORD *)&v95 + 1) = v95;
            operator delete((void *)v95);
          }
          v67 = *(void **)&buf[40];
          if (*(_QWORD *)&buf[40])
            goto LABEL_75;
        }
        else
        {
          v18 = 0;
          v67 = *(void **)&buf[40];
          if (*(_QWORD *)&buf[40])
          {
LABEL_75:
            *(_QWORD *)&buf[48] = v67;
            operator delete(v67);
          }
        }
        if (*(_QWORD *)&buf[16])
        {
          *(_QWORD *)&buf[24] = *(_QWORD *)&buf[16];
          operator delete(*(void **)&buf[16]);
        }
        (*(void (**)(std::string::size_type))(*(_QWORD *)v60 + 8))(v60);

        v12 = v70;
        if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v84.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v86) & 0x80000000) == 0)
          {
LABEL_80:
            if ((SHIBYTE(v88) & 0x80000000) == 0)
            {
LABEL_81:
              v90((uint64_t)v89);
              goto LABEL_82;
            }
LABEL_87:
            operator delete(v87[0]);
            goto LABEL_81;
          }
        }
        else if ((SHIBYTE(v86) & 0x80000000) == 0)
        {
          goto LABEL_80;
        }
        operator delete(__p[0]);
        if ((SHIBYTE(v88) & 0x80000000) == 0)
          goto LABEL_81;
        goto LABEL_87;
      }
LABEL_59:
      operator delete(v81.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v80.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_38;
      goto LABEL_60;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_DWORD *)(a1 + 20);
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)&buf[4] = v17;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = PixelFormatType;
      *(_WORD *)&buf[14] = 2048;
      *(_QWORD *)&buf[16] = Width;
      *(_WORD *)&buf[24] = 2048;
      *(_QWORD *)&buf[26] = Height;
      *(_WORD *)&buf[34] = 2048;
      *(double *)&buf[36] = a6;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DisparityToDepth [Always ] estimateWithDisparity %u is only supported with hdis format (DisparityFloat16). obtained buffer type: %u buffer width: %lu height: %lu disparityTimestamp: %f", buf, 0x2Cu);
    }
  }
  v18 = 0;
LABEL_82:

  return v18;
}

- (void)updateWorldPointsArray:(id)a3 pointsTimestamp:(double)a4
{
  id v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  __int128 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  __int128 v32;
  char *v33;
  ADDispartiyToDepthFitEstimator *v34;
  int v35;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  v34 = self;
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v6);
        v13 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        *(_QWORD *)&v37 = v15;

        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v36 = v17;

        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        v35 = v19;

        objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "floatValue");
        v22 = v21;

        objc_msgSend(v13, "objectAtIndexedSubscript:", 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "intValue");

        v25 = v37;
        DWORD1(v25) = v36;
        DWORD2(v25) = v35;
        if (v10 >= v9)
        {
          v37 = v25;
          v26 = (v10 - v8) >> 5;
          v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 59)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          if ((v9 - v8) >> 4 > v27)
            v27 = (v9 - v8) >> 4;
          if ((unint64_t)(v9 - v8) >= 0x7FFFFFFFFFFFFFE0)
            v28 = 0x7FFFFFFFFFFFFFFLL;
          else
            v28 = v27;
          if (v28)
          {
            if (v28 >> 59)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v29 = (char *)operator new(32 * v28);
          }
          else
          {
            v29 = 0;
          }
          v30 = &v29[32 * v26];
          *(_OWORD *)v30 = v37;
          *((_DWORD *)v30 + 4) = v22;
          *((_DWORD *)v30 + 5) = v24;
          if (v10 == v8)
          {
            v33 = &v29[32 * v26];
          }
          else
          {
            v31 = &v29[32 * v26];
            do
            {
              v32 = *((_OWORD *)v10 - 1);
              v33 = v31 - 32;
              *((_OWORD *)v31 - 2) = *((_OWORD *)v10 - 2);
              *((_OWORD *)v31 - 1) = v32;
              v10 -= 32;
              v31 -= 32;
            }
            while (v10 != v8);
          }
          v9 = &v29[32 * v28];
          v10 = v30 + 32;
          if (v8)
            operator delete(v8);
          v8 = v33;
        }
        else
        {
          *(_OWORD *)v10 = v25;
          *((_DWORD *)v10 + 4) = v22;
          *((_DWORD *)v10 + 5) = v24;
          v10 += 32;
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v7);
  }
  else
  {
    v10 = 0;
    v8 = 0;
  }

  -[ADDispartiyToDepthFitEstimator updateWorldPoints:pointCount:pointsTimestamp:](v34, "updateWorldPoints:pointCount:pointsTimestamp:", v8, (unint64_t)(v10 - v8) >> 5, a4);
  if (v8)
    operator delete(v8);

}

- (id)estimateWithDisparityFile:(id)a3 disparityWidth:(unsigned int)a4 disparityHeight:(unsigned int)a5 calibration:(id)a6 poseArray:(id)a7 disparityTimestamp:(double)a8
{
  id v14;
  __CVBuffer *v15;
  uint64_t v16;
  double *v17;
  double *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t i;
  int v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _BYTE *v28;
  char *v29;
  unint64_t v30;
  char *v31;
  int v32;
  uint64_t v33;
  _OWORD *v34;
  char *v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  void *v39;
  __CVBuffer *v41;
  ADDispartiyToDepthFitEstimator *v42;
  id v43;
  id v44;
  id v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[2];
  void (*v52)(uint64_t);
  void *v53;
  __CVBuffer *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v44 = a6;
  v43 = a7;
  v45 = objc_retainAutorelease(v14);
  v15 = PixelBufferUtils::pixelBufferFromRawFile((PixelBufferUtils *)objc_msgSend(v45, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding")), a4, a5, 0x68646973u);
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v52 = __132__ADDispartiyToDepthFitEstimator_estimateWithDisparityFile_disparityWidth_disparityHeight_calibration_poseArray_disparityTimestamp___block_invoke;
  v53 = &__block_descriptor_40_e5_v8__0l;
  v54 = v15;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v43;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (!v16)
  {

    v39 = 0;
    goto LABEL_42;
  }
  v41 = v15;
  v42 = self;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = *(_QWORD *)v48;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v48 != v21)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "floatValue", v41);
      v24 = v23;
      if (v20 < v19)
      {
        *(_DWORD *)v20 = v23;
        v20 += 4;
        continue;
      }
      v25 = (v20 - (char *)v18) >> 2;
      v26 = v25 + 1;
      if ((unint64_t)(v25 + 1) >> 62)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      if ((v19 - (char *)v18) >> 1 > v26)
        v26 = (v19 - (char *)v18) >> 1;
      if ((unint64_t)(v19 - (char *)v18) >= 0x7FFFFFFFFFFFFFFCLL)
        v27 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v27 = v26;
      if (v27)
      {
        if (v27 >> 62)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v28 = operator new(4 * v27);
      }
      else
      {
        v28 = 0;
      }
      v17 = (double *)&v28[4 * v25];
      *(_DWORD *)v17 = v24;
      v29 = (char *)v17 + 4;
      if (v20 != (char *)v18)
      {
        v30 = v20 - 4 - (char *)v18;
        if (v30 >= 0xBC)
        {
          if (&v28[v20 - (char *)v18 - 4 - (v30 & 0xFFFFFFFFFFFFFFFCLL)] > &v28[v20 - (char *)v18 - 4])
          {
            v31 = v20;
          }
          else if (&v20[-(v30 & 0xFFFFFFFFFFFFFFFCLL) - 4] > v20 - 4)
          {
            v31 = v20;
          }
          else if ((unint64_t)((char *)v18 - v28) >= 0x20)
          {
            v33 = (v30 >> 2) + 1;
            v31 = &v20[-4 * (v33 & 0x7FFFFFFFFFFFFFF8)];
            v34 = &v28[4 * v25 - 16];
            v35 = v20 - 16;
            v36 = v33 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              v37 = *(_OWORD *)v35;
              *(v34 - 1) = *((_OWORD *)v35 - 1);
              *v34 = v37;
              v34 -= 2;
              v35 -= 32;
              v36 -= 8;
            }
            while (v36);
            v17 = (double *)((char *)v17 - 4 * (v33 & 0x7FFFFFFFFFFFFFF8));
            if (v33 == (v33 & 0x7FFFFFFFFFFFFFF8))
              goto LABEL_23;
          }
          else
          {
            v31 = v20;
          }
        }
        else
        {
          v31 = v20;
        }
        do
        {
          v32 = *((_DWORD *)v31 - 1);
          v31 -= 4;
          *((_DWORD *)v17 - 1) = v32;
          v17 = (double *)((char *)v17 - 4);
        }
        while (v31 != (char *)v18);
      }
LABEL_23:
      v19 = &v28[4 * v27];
      if (v18)
        operator delete(v18);
      v18 = v17;
      v20 = v29;
    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  }
  while (v16);

  if (v20 - (char *)v17 == 64)
  {
    -[ADDispartiyToDepthFitEstimator estimateWithDisparity:calibration:pose:disparityTimestamp:](v42, "estimateWithDisparity:calibration:pose:disparityTimestamp:", v41, v44, *v17, v17[2], v17[4], v17[6], a8);
    v38 = objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  v38 = 0;
  v39 = 0;
  if (v17)
  {
LABEL_41:
    operator delete(v17);
    v39 = (void *)v38;
  }
LABEL_42:
  v52((uint64_t)v51);

  return v39;
}

- (id)queryIntermediateResults
{
  void *v3;
  double v4;
  float *begin;
  float *i;
  void *v7;
  void *v8;
  double v9;
  float *v10;
  float *j;
  void *v12;
  void *v13;
  ADDisparityToDepthFitWorldPoint *v14;
  ADDisparityToDepthFitWorldPoint *k;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_x.__end_ - self->_x.__begin_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  begin = self->_x.__begin_;
  for (i = self->_x.__end_; begin != i; ++begin)
  {
    *(float *)&v4 = *begin;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_y.__end_ - self->_y.__begin_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_y.__begin_;
  for (j = self->_y.__end_; v10 != j; ++v10)
  {
    *(float *)&v9 = *v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", ((char *)self->_worldPoints.__end_ - (char *)self->_worldPoints.__begin_) >> 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_worldPoints.__begin_;
  for (k = self->_worldPoints.__end_; v14 != k; v14 += 4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14[2].var1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
  objc_msgSend(v17, "setValue:forKey:", v3, CFSTR("ransacX"));
  objc_msgSend(v17, "setValue:forKey:", v8, CFSTR("ransacY"));
  objc_msgSend(v17, "setValue:forKey:", v13, CFSTR("estimateWorldPointsIds"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_updateWorldPointsCounter);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v18, CFSTR("updateWorldPointsCounter"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_estimateWithDisparityCounter);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v19, CFSTR("estimateWithDisparityCounter"));

  return v17;
}

- (ADLogManager)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  ADDisparityToDepthFitWorldPoint *begin;
  float *v4;
  float *v5;
  DisparityToDepthFitEstimator *value;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_storeStrong((id *)&self->_logger, 0);
  begin = self->_worldPoints.__begin_;
  if (begin)
  {
    self->_worldPoints.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_y.__begin_;
  if (v4)
  {
    self->_y.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_x.__begin_;
  if (v5)
  {
    self->_x.__end_ = v5;
    operator delete(v5);
  }
  value = self->_impl.__ptr_.__value_;
  self->_impl.__ptr_.__value_ = 0;
  if (value)
  {
    v7 = *((_QWORD *)value + 8);
    *((_QWORD *)value + 8) = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
    v8 = (void *)*((_QWORD *)value + 4);
    if (v8)
    {
      *((_QWORD *)value + 5) = v8;
      operator delete(v8);
    }
    v9 = *(void **)value;
    if (*(_QWORD *)value)
    {
      *((_QWORD *)value + 1) = v9;
      operator delete(v9);
    }
    JUMPOUT(0x20BD36498);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_QWORD *)self + 11) = 0;
  return self;
}

void __132__ADDispartiyToDepthFitEstimator_estimateWithDisparityFile_disparityWidth_disparityHeight_calibration_poseArray_disparityTimestamp___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

uint64_t __92__ADDispartiyToDepthFitEstimator_estimateWithDisparity_calibration_pose_disparityTimestamp___block_invoke(uint64_t a1)
{
  return CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
}

@end

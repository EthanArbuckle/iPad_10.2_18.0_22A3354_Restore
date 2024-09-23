@implementation VNShotflowNetworkANODv3

- (VNShotflowNetworkANODv3)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6 threshold:(float)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  double v13;
  VNShotflowNetworkANODv3 *v14;
  VNShotflowNetworkANODv3 *v15;
  VNShotflowNetworkANODv3 *v16;
  objc_super v18;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNShotflowNetworkANODv3;
  *(float *)&v13 = a7;
  v14 = -[VNShotflowNetworkANODBase initWithModelPath:espressoEngineID:espressoDeviceID:espressoStorageType:threshold:](&v18, sel_initWithModelPath_espressoEngineID_espressoDeviceID_espressoStorageType_threshold_, v12, v10, v9, v8, v13);
  v15 = v14;
  if (v14)
  {
    -[VNShotflowNetworkANODv3 initializeBuffers](v14, "initializeBuffers");
    v16 = v15;
  }

  return v15;
}

- (void)initializeBuffers
{
  void *v3;
  id v4;
  int blob_dimensions;
  uint64_t i;
  void *begin;
  char *v8;
  char *v9;
  std::__shared_weak_count *v10;
  char *v11;
  char *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD *exception;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45[3];

  v3 = (void *)objc_opt_class();
  *(_QWORD *)&v44 = 0;
  std::vector<unsigned long>::vector(v45, 4uLL, &v44);
  objc_msgSend(v3, "inputLayerName");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  blob_dimensions = espresso_network_query_blob_dimensions();

  if (blob_dimensions)
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  begin = self->super.super._logitsPosOutputs.__begin_;
  for (i = (uint64_t)self->super.super._logitsPosOutputs.__end_;
        (void *)i != begin;
  self->super.super._logitsPosOutputs.__end_ = begin;
  v8 = (char *)operator new(0xC0uLL);
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *(_QWORD *)v8 = &off_1E453B338;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 120) = 0u;
  *(_OWORD *)(v8 + 136) = 0u;
  *(_OWORD *)(v8 + 152) = 0u;
  *(_OWORD *)(v8 + 168) = 0u;
  *((_QWORD *)v8 + 23) = 0;
  *(_QWORD *)&v44 = v8 + 24;
  *((_QWORD *)&v44 + 1) = v8;
  objc_msgSend(CFSTR("rcnn_output"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v33 = __cxa_allocate_exception(8uLL);
    *v33 = 6014;
    __cxa_throw(v33, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v44);
  v9 = (char *)operator new(0xC0uLL);
  *((_QWORD *)v9 + 1) = 0;
  *((_QWORD *)v9 + 2) = 0;
  *(_QWORD *)v9 = &off_1E453B338;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_OWORD *)(v9 + 56) = 0u;
  *(_OWORD *)(v9 + 72) = 0u;
  *(_OWORD *)(v9 + 88) = 0u;
  *(_OWORD *)(v9 + 104) = 0u;
  *(_OWORD *)(v9 + 120) = 0u;
  *(_OWORD *)(v9 + 136) = 0u;
  *(_OWORD *)(v9 + 152) = 0u;
  *(_OWORD *)(v9 + 168) = 0u;
  *((_QWORD *)v9 + 23) = 0;
  *(_QWORD *)&v43 = v9 + 24;
  *((_QWORD *)&v43 + 1) = v9;
  objc_msgSend(CFSTR("rcnn_output_scores"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v34 = __cxa_allocate_exception(8uLL);
    *v34 = 6014;
    __cxa_throw(v34, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v43);
  v10 = (std::__shared_weak_count *)operator new(0xC0uLL);
  v10->__shared_owners_ = 0;
  v10->__shared_weak_owners_ = 0;
  v10->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B338;
  v10[1].std::__shared_count = 0u;
  *(_OWORD *)&v10[1].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v10[2].__shared_owners_ = 0u;
  v10[3].std::__shared_count = 0u;
  *(_OWORD *)&v10[3].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v10[4].__shared_owners_ = 0u;
  v10[5].std::__shared_count = 0u;
  *(_OWORD *)&v10[5].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v10[6].__shared_owners_ = 0u;
  v10[7].std::__shared_count = 0u;
  v10[7].__shared_weak_owners_ = 0;
  *(_QWORD *)&v42 = v10 + 1;
  *((_QWORD *)&v42 + 1) = v10;
  objc_msgSend(CFSTR("rcnn_output_cls"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v35 = __cxa_allocate_exception(8uLL);
    *v35 = 6014;
    __cxa_throw(v35, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v42);
  if ((objc_msgSend(v3, "hasPose") & 1) == 0)
  {
    v23 = v45[0];
    self->super.super._currentNetworkWidth = *(_QWORD *)v45[0];
    self->super.super._currentNetworkHeight = v23[1];
LABEL_29:
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    goto LABEL_33;
  }
  v11 = (char *)operator new(0xC0uLL);
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  *(_QWORD *)v11 = &off_1E453B338;
  *(_OWORD *)(v11 + 24) = 0u;
  *(_OWORD *)(v11 + 40) = 0u;
  *(_OWORD *)(v11 + 56) = 0u;
  *(_OWORD *)(v11 + 72) = 0u;
  *(_OWORD *)(v11 + 88) = 0u;
  *(_OWORD *)(v11 + 104) = 0u;
  *(_OWORD *)(v11 + 120) = 0u;
  *(_OWORD *)(v11 + 136) = 0u;
  *(_OWORD *)(v11 + 152) = 0u;
  *(_OWORD *)(v11 + 168) = 0u;
  *((_QWORD *)v11 + 23) = 0;
  *(_QWORD *)&v41 = v11 + 24;
  *((_QWORD *)&v41 + 1) = v11;
  objc_msgSend(CFSTR("rcnn_output_selected_indices"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v36 = __cxa_allocate_exception(8uLL);
    *v36 = 6014;
    __cxa_throw(v36, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v41);
  v12 = (char *)operator new(0xC0uLL);
  *((_QWORD *)v12 + 1) = 0;
  *((_QWORD *)v12 + 2) = 0;
  *(_QWORD *)v12 = &off_1E453B338;
  *(_OWORD *)(v12 + 24) = 0u;
  *(_OWORD *)(v12 + 40) = 0u;
  *(_OWORD *)(v12 + 56) = 0u;
  *(_OWORD *)(v12 + 72) = 0u;
  *(_OWORD *)(v12 + 88) = 0u;
  *(_OWORD *)(v12 + 104) = 0u;
  *(_OWORD *)(v12 + 120) = 0u;
  *(_OWORD *)(v12 + 136) = 0u;
  *(_OWORD *)(v12 + 152) = 0u;
  *(_OWORD *)(v12 + 168) = 0u;
  *((_QWORD *)v12 + 23) = 0;
  *(_QWORD *)&v40 = v12 + 24;
  *((_QWORD *)&v40 + 1) = v12;
  objc_msgSend(CFSTR("roll_output"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v37 = __cxa_allocate_exception(8uLL);
    *v37 = 6014;
    __cxa_throw(v37, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v40);
  v13 = (std::__shared_weak_count *)operator new(0xC0uLL);
  v13->__shared_owners_ = 0;
  v14 = (unint64_t *)&v13->__shared_owners_;
  v13->__shared_weak_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B338;
  v13[1].std::__shared_count = 0u;
  *(_OWORD *)&v13[1].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v13[2].__shared_owners_ = 0u;
  v13[3].std::__shared_count = 0u;
  *(_OWORD *)&v13[3].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v13[4].__shared_owners_ = 0u;
  v13[5].std::__shared_count = 0u;
  *(_OWORD *)&v13[5].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v13[6].__shared_owners_ = 0u;
  v13[7].std::__shared_count = 0u;
  v13[7].__shared_weak_owners_ = 0;
  *(_QWORD *)&v39 = v13 + 1;
  *((_QWORD *)&v39 + 1) = v13;
  objc_msgSend(CFSTR("yaw_output"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v38 = __cxa_allocate_exception(8uLL);
    *v38 = 6014;
    __cxa_throw(v38, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v39);
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  v16 = (std::__shared_weak_count *)*((_QWORD *)&v40 + 1);
  if (*((_QWORD *)&v40 + 1))
  {
    v17 = (unint64_t *)(*((_QWORD *)&v40 + 1) + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
  if (*((_QWORD *)&v41 + 1))
  {
    v20 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v42 + 1);
  v22 = v45[0];
  self->super.super._currentNetworkWidth = *(_QWORD *)v45[0];
  self->super.super._currentNetworkHeight = v22[1];
  if (v10)
    goto LABEL_29;
LABEL_33:
  v26 = (std::__shared_weak_count *)*((_QWORD *)&v43 + 1);
  if (*((_QWORD *)&v43 + 1))
  {
    v27 = (unint64_t *)(*((_QWORD *)&v43 + 1) + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = (std::__shared_weak_count *)*((_QWORD *)&v44 + 1);
  if (*((_QWORD *)&v44 + 1))
  {
    v30 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  if (v45[0])
  {
    v45[1] = v45[0];
    operator delete(v45[0]);
  }
}

- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4
{
  int v4;
  int v5;
  int result;
  id v8;
  double v9;
  double v10;
  _QWORD *exception;

  v4 = a4;
  v5 = a3;
  if (*(_OWORD *)&self->super.super._currentNetworkWidth == __PAIR128__(a4, a3))
    return 0;
  objc_msgSend((id)objc_opt_class(), "inputLayerName");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "UTF8String");

  objc_msgSend((id)objc_opt_class(), "inputImageSize");
  if ((unint64_t)v10 != v4 || (unint64_t)v9 != v5)
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 6005;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  result = espresso_plan_build_clean();
  if (!result)
  {
    result = espresso_network_change_input_blob_shapes();
    if (!result)
    {
      result = espresso_plan_build();
      if (!result)
      {
        -[VNShotflowNetworkANODv3 initializeBuffers](self, "initializeBuffers");
        return 0;
      }
    }
  }
  return result;
}

- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  _BOOL8 v4;
  vImagePixelCount width;
  vImagePixelCount height;
  __int128 v9;
  id v10;
  float v11;
  void *v12;
  uint64_t **begin;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD **v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  unsigned int v29;
  int v30;
  float v31;
  float v32;
  float v33;
  float v34;
  VNShotflowDetection *v35;
  _QWORD *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  VNShotflowDetection *v42;
  _QWORD *exception;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  float v50;
  _OWORD v51[2];

  v4 = a4;
  height = a3->height;
  width = a3->width;
  if (-[VNShotflowNetworkANODv3 setInputShape:height:](self, "setInputShape:height:", width, height))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  v9 = *(_OWORD *)&a3->width;
  v51[0] = *(_OWORD *)&a3->data;
  v51[1] = v9;
  -[VNShotflowNetwork runNetwork:inputIsBGR:](self, "runNetwork:inputIsBGR:", v51, v4);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VNShotflowNetwork threshold](self, "threshold");
  if (v11 == 1.0)
  {
    v45 = __cxa_allocate_exception(8uLL);
    *v45 = 6012;
    __cxa_throw(v45, MEMORY[0x1E0DE4F28], 0);
  }
  v12 = (void *)objc_opt_class();
  begin = (uint64_t **)self->super.super._logitsPosOutputs.__begin_;
  v14 = *begin[2];
  v15 = *begin[4];
  v16 = **begin;
  v17 = (*begin)[3];
  if (objc_msgSend(v12, "hasPose"))
  {
    v18 = (_QWORD **)self->super.super._logitsPosOutputs.__begin_;
    v48 = *v18[8];
    v49 = *v18[6];
    v47 = *v18[10];
  }
  else
  {
    v47 = 0;
    v48 = 0;
    v49 = 0;
  }
  if ((int)v17 >= 1)
  {
    v19 = 0;
    v50 = (float)width;
    v20 = (float)height;
    v21 = 4 * v17;
    v22 = 0.5;
    do
    {
      v23 = *(float *)(v14 + v19);
      if (v23 >= v22)
      {
        v24 = *(float *)(v15 + v19);
        v25 = objc_msgSend(v12, "hasPose");
        v26 = (int)(float)(v24 + 1.0);
        if ((_DWORD)v26 == 1)
          v27 = v25;
        else
          v27 = 0;
        v28 = 0;
        v29 = 0;
        if (v27 == 1)
        {
          v30 = (int)*(float *)(v49 + v19);
          v29 = dword_1A15FA128[*(float *)(v48 + 4 * v30)];
          v28 = dword_1A15FA158[*(float *)(v47 + 4 * v30)];
        }
        v31 = *(float *)(v16 + 4 * v19);
        v32 = *(float *)(v16 + 4 * (v19 + 1));
        v33 = *(float *)(v16 + 4 * (v19 + 2));
        v34 = *(float *)(v16 + 4 * (v19 + 3));
        v35 = [VNShotflowDetection alloc];
        v36 = (_QWORD *)objc_msgSend(v12, "importantClasses");
        v37 = (float)(v31 / v50);
        v38 = (float)(v32 / v20);
        v39 = (float)(v33 / v50) - v37;
        v40 = (float)(v34 / v20) - v38;
        v41 = 1.0 - (v40 * 0.5 + v38) - v40 * 0.5;
        LODWORD(v46) = v28;
        v42 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:hasLabel:label:](v35, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:hasLabel:label:", 0, v36[1] - *v36 > 8uLL, v26, v39 * 0.5 + v37 - v39 * 0.5, v41, v39, v40, v39 * 0.5 + v37 - v39 * 0.5, v41, v39, v40, __PAIR64__(v29, LODWORD(v23)), v46);
        objc_msgSend(v10, "addObject:", v42);

        v22 = 0.5;
      }
      v19 += 4;
    }
    while (v21 != v19);
  }
  return v10;
}

+ (id)modelName
{
  return CFSTR("model_opt.espresso");
}

+ (id)inputLayerName
{
  return CFSTR("data");
}

+ (unint64_t)mumberPosClasses
{
  return 8;
}

+ (const)importantClasses
{
  if (+[VNShotflowNetworkANODv3 importantClasses]::onceToken != -1)
    dispatch_once(&+[VNShotflowNetworkANODv3 importantClasses]::onceToken, &__block_literal_global_168);
  return (const void *)+[VNShotflowNetworkANODv3 importantClasses]::importantClasses;
}

+ (BOOL)hasPose
{
  return 1;
}

+ (float)inputScale
{
  return 0.017429;
}

+ (tuple<float,)inputBiasRGB
{
  float v2;
  float v3;
  float v4;
  tuple<float, float, float> result;

  v2 = -2.1398;
  v3 = -2.0209;
  v4 = -1.7949;
  result.var0.var2 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

+ (BOOL)inputBGR
{
  return 0;
}

double __43__VNShotflowNetworkANODv3_importantClasses__block_invoke()
{
  _QWORD *v0;
  _QWORD *v1;
  double result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  v0[2] = 0;
  *v0 = 0;
  v1 = operator new(0x38uLL);
  v0[1] = v1 + 7;
  v0[2] = v1 + 7;
  v1[6] = 8;
  *(_OWORD *)v1 = xmmword_1A15FA0F0;
  *((_OWORD *)v1 + 1) = unk_1A15FA100;
  *(_QWORD *)&result = 5;
  *((_OWORD *)v1 + 2) = xmmword_1A15FA110;
  *v0 = v1;
  +[VNShotflowNetworkANODv3 importantClasses]::importantClasses = (uint64_t)v0;
  return result;
}

@end

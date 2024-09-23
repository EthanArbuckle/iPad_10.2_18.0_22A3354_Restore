@implementation VNShotflowNetworkANODBase

- (VNShotflowNetworkANODBase)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6 threshold:(float)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  double v13;
  VNShotflowNetworkANODBase *v14;
  VNShotflowNetworkANODBase *v15;
  VNShotflowNetworkANODBase *v16;
  objc_super v18;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNShotflowNetworkANODBase;
  *(float *)&v13 = a7;
  v14 = -[VNShotflowNetwork initWithModelPath:espressoEngineID:espressoDeviceID:espressoStorageType:threshold:](&v18, sel_initWithModelPath_espressoEngineID_espressoDeviceID_espressoStorageType_threshold_, v12, v10, v9, v8, v13);
  v15 = v14;
  if (v14)
  {
    -[VNShotflowNetworkANODBase initializeBuffers](v14, "initializeBuffers");
    v16 = v15;
  }

  return v15;
}

- (void)initializeBuffers
{
  uint64_t v3;
  unint64_t v4;
  char *v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *exception;
  char **p_yawOutputs;
  char **p_rollOutputs;
  __int128 v20;
  __int128 v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)VNShotflowNetworkANODBase;
  -[VNShotflowNetwork initializeBuffers](&v22, sel_initializeBuffers);
  v3 = 0;
  p_rollOutputs = (char **)&self->super._rollOutputs;
  p_yawOutputs = (char **)&self->super._yawOutputs;
  v4 = 0x1E0CB3000uLL;
  do
  {
    v5 = (char *)operator new(0xC0uLL);
    *((_QWORD *)v5 + 1) = 0;
    *((_QWORD *)v5 + 2) = 0;
    *(_QWORD *)v5 = &off_1E453B338;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 88) = 0u;
    *(_OWORD *)(v5 + 104) = 0u;
    *(_OWORD *)(v5 + 120) = 0u;
    *(_OWORD *)(v5 + 136) = 0u;
    *(_OWORD *)(v5 + 152) = 0u;
    *(_OWORD *)(v5 + 168) = 0u;
    *((_QWORD *)v5 + 23) = 0;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_QWORD *)&v21 = v5 + 24;
    *((_QWORD *)&v21 + 1) = v5;
    objc_msgSend(*(id *)(v4 + 2368), "stringWithFormat:", CFSTR("logits_roll_%ld"), v3);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "UTF8String");
    if (espresso_network_bind_buffer())
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = 6014;
      __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100](p_rollOutputs, &v21);
    v7 = (std::__shared_weak_count *)operator new(0xC0uLL);
    v7->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    v7->__shared_weak_owners_ = 0;
    v7->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B338;
    v7[1].std::__shared_count = 0u;
    *(_OWORD *)&v7[1].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v7[2].__shared_owners_ = 0u;
    v7[3].std::__shared_count = 0u;
    *(_OWORD *)&v7[3].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v7[4].__shared_owners_ = 0u;
    v7[5].std::__shared_count = 0u;
    *(_OWORD *)&v7[5].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v7[6].__shared_owners_ = 0u;
    v7[7].std::__shared_count = 0u;
    v7[7].__shared_weak_owners_ = 0;
    *(_QWORD *)&v20 = v7 + 1;
    *((_QWORD *)&v20 + 1) = v7;
    v9 = v4;
    objc_msgSend(*(id *)(v4 + 2368), "stringWithFormat:", CFSTR("logits_yaw_%ld"), v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v10);
    objc_msgSend(v11, "UTF8String");
    if (espresso_network_bind_buffer())
    {
      v16 = __cxa_allocate_exception(8uLL);
      *v16 = 6014;
      __cxa_throw(v16, MEMORY[0x1E0DE4F28], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100](p_yawOutputs, &v20);
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    v4 = v9;
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
    if (*((_QWORD *)&v21 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }

    ++v3;
  }
  while (v3 != 6);
}

+ (CGSize)inputImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 608.0;
  v3 = 448.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (unint64_t)numberMaxoutLayers
{
  return 0;
}

+ (const)ratios
{
  if (+[VNShotflowNetworkANODBase ratios]::onceToken != -1)
    dispatch_once(&+[VNShotflowNetworkANODBase ratios]::onceToken, &__block_literal_global_151);
  return (const void *)+[VNShotflowNetworkANODBase ratios]::ratios;
}

+ (const)cellStartsX
{
  if (+[VNShotflowNetworkANODBase cellStartsX]::onceToken != -1)
    dispatch_once(&+[VNShotflowNetworkANODBase cellStartsX]::onceToken, &__block_literal_global_153);
  return (const void *)+[VNShotflowNetworkANODBase cellStartsX]::cellStartsX;
}

+ (const)cellStartsY
{
  if (+[VNShotflowNetworkANODBase cellStartsY]::onceToken != -1)
    dispatch_once(&+[VNShotflowNetworkANODBase cellStartsY]::onceToken, &__block_literal_global_155);
  return (const void *)+[VNShotflowNetworkANODBase cellStartsY]::cellStartsY;
}

+ (unint64_t)mumberBinsNegativeMaxout
{
  return 1;
}

+ (float)nonSquareRollDefault
{
  return 1000000.0;
}

+ (float)nonSquareYawDefault
{
  return 1000000.0;
}

+ (BOOL)poseSquare
{
  return 1;
}

double __40__VNShotflowNetworkANODBase_cellStartsY__block_invoke()
{
  _QWORD *v0;
  _QWORD *v1;
  double result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  v0[2] = 0;
  *v0 = 0;
  v1 = operator new(0x18uLL);
  v0[1] = v1 + 3;
  v0[2] = v1 + 3;
  result = 25165828.1;
  *(_OWORD *)v1 = xmmword_1A15FA0AC;
  v1[2] = 0x433F800042FF0000;
  *v0 = v1;
  +[VNShotflowNetworkANODBase cellStartsY]::cellStartsY = (uint64_t)v0;
  return result;
}

double __40__VNShotflowNetworkANODBase_cellStartsX__block_invoke()
{
  _QWORD *v0;
  _QWORD *v1;
  double result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  v0[2] = 0;
  *v0 = 0;
  v1 = operator new(0x18uLL);
  v0[1] = v1 + 3;
  v0[2] = v1 + 3;
  result = 25165828.1;
  *(_OWORD *)v1 = xmmword_1A15FA094;
  v1[2] = 0x431F800042BF0000;
  *v0 = v1;
  +[VNShotflowNetworkANODBase cellStartsX]::cellStartsX = (uint64_t)v0;
  return result;
}

double __35__VNShotflowNetworkANODBase_ratios__block_invoke()
{
  _QWORD *v0;
  _DWORD *v1;
  double result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  v0[2] = 0;
  *v0 = 0;
  v1 = operator new(0x14uLL);
  v0[1] = v1 + 5;
  v0[2] = v1 + 5;
  v1[4] = 1051372203;
  result = 0.0000305175853;
  *(_OWORD *)v1 = xmmword_1A15FA080;
  *v0 = v1;
  +[VNShotflowNetworkANODBase ratios]::ratios = (uint64_t)v0;
  return result;
}

@end

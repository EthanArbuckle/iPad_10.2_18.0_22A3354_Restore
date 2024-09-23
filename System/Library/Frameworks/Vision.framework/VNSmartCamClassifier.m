@implementation VNSmartCamClassifier

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNSmartCamClassifier;
  return -[VNEspressoModelClassifier completeInitializationForSession:error:](&v5, sel_completeInitializationForSession_error_, a3, a4);
}

+ (shared_ptr<vision::mod::ImageClassifierAbstract>)createClassifierWithDescriptor:(shared_ptr<vision:(const char *)a4 :(int)a5 mod:(int)a6 :(const char *)a7 ImageDescriptorProcessorAbstract>)a3 classifierAbsolutePath:(Options *)a8 computePlatform:computePath:labelsFilename:options:
{
  _OWORD *v8;
  const char *v10;
  int v12;
  _OWORD *v13;
  void **var0;
  unint64_t *v15;
  unint64_t v16;
  id v17;
  char *v18;
  id v19;
  id v20;
  _QWORD **v21;
  char *v22;
  __int128 v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  double v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  unint64_t *v37;
  unint64_t v38;
  ImageClassifierAbstract *v39;
  __shared_weak_count *v40;
  void *exception;
  _QWORD *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  __shared_weak_count *cntrl;
  int v48;
  uint64_t v49;
  id v50;
  const char *v51;
  id v52;
  void **v53;
  std::__shared_weak_count *v54;
  void *__p[2];
  unsigned __int8 v56;
  shared_ptr<vision::mod::ImageClassifierAbstract> result;

  v10 = *(const char **)&a6;
  v12 = (int)a4;
  cntrl = a3.__cntrl_;
  v13 = v8;
  var0 = a3.__ptr_[1].var0;
  v53 = a3.__ptr_->var0;
  v54 = (std::__shared_weak_count *)var0;
  if (var0)
  {
    v15 = (unint64_t *)(var0 + 1);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  v48 = *(unsigned __int8 *)a7;
  v49 = *((_QWORD *)a7 + 1);
  v17 = *((id *)a7 + 2);
  v51 = a7;
  v45 = *((id *)a7 + 3);
  v46 = v17;
  v18 = (char *)operator new(0xA0uLL);
  *(_OWORD *)(v18 + 8) = 0u;
  *(_QWORD *)v18 = &off_1E453B760;
  v19 = v17;
  v20 = v45;
  *((_QWORD *)v18 + 3) = &off_1E453A6B8;
  *((_OWORD *)v18 + 2) = 0u;
  *((_OWORD *)v18 + 3) = 0u;
  *((_OWORD *)v18 + 4) = 0u;
  *((_QWORD *)v18 + 10) = 0;
  *((_DWORD *)v18 + 22) = 1065353216;
  *((_QWORD *)v18 + 12) = 0;
  *(_OWORD *)(v18 + 104) = 0u;
  *((_DWORD *)v18 + 30) = 1;
  *(int32x2_t *)(v18 + 124) = vdup_n_s32(0x3DCCCCCDu);
  *(_QWORD *)(v18 + 132) = 5;
  *((_OWORD *)v18 + 9) = 0u;
  v21 = (_QWORD **)(v18 + 144);
  v43 = v20;
  v44 = v19;
  vision::mod::ImageClassifierAbstract::initLabels((vision::mod::ImageClassifierAbstract *)(v18 + 24), v10);
  v22 = (char *)operator new(0x48uLL);
  *((_QWORD *)v22 + 1) = 0;
  *((_QWORD *)v22 + 2) = 0;
  *(_QWORD *)v22 = &off_1E453B728;
  *(_OWORD *)(v22 + 40) = 0u;
  *(_OWORD *)(v22 + 24) = 0u;
  *(_OWORD *)(v22 + 56) = 0u;
  *(_QWORD *)&v23 = v22 + 24;
  *((_QWORD *)&v23 + 1) = v22;
  v24 = (std::__shared_weak_count *)*((_QWORD *)v18 + 19);
  *((_OWORD *)v18 + 9) = v23;
  if (v24)
  {
    p_shared_owners = (unint64_t *)&v24->__shared_owners_;
    do
      v26 = __ldaxr(p_shared_owners);
    while (__stlxr(v26 - 1, p_shared_owners));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  std::shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>::operator=[abi:ne180100](*v21, (uint64_t)v53, (uint64_t)v54);
  v27 = (uint64_t)*v21;
  v52 = v19;
  v50 = v20;
  if (v12 == 1)
    v28 = 20000;
  else
    v28 = 0;
  if (a5 == 3)
    v29 = 2;
  else
    v29 = a5 == 2;
  std::string::basic_string[abi:ne180100]<0>(__p, "smartcam_onlyfc");
  if ((v56 & 0x80u) == 0)
    v30 = v56;
  else
    v30 = (unint64_t)__p[1];
  if ((char)v56 < 0)
    operator delete(__p[0]);
  v31 = v52;
  v32 = v31;
  if (!v31)
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F4E8]), "initWithPlatform:", v28, v43, v44, v45, v46);
  if (objc_msgSend(v32, "platform", v43, v44) != (_DWORD)v28)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1B0A5BC](exception, "Inconsistent platform");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  LODWORD(v33) = 4.0;
  objc_msgSend(v32, "set_priority:low_priority_max_ms_per_command_buffer:gpu_priority:", v48 != 0, v49, v33);
  if (v30)
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F4F8]), "initWithJSFile:binSerializerId:context:computePath:", cntrl, "smartcam_onlyfc", v32, v29);
  else
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F4F8]), "initWithJSFile:context:computePath:", cntrl, v32, v29);
  v35 = *(void **)(v27 + 16);
  *(_QWORD *)(v27 + 16) = v34;

  if (!*(_QWORD *)(v27 + 16))
  {
    v42 = __cxa_allocate_exception(8uLL);
    *v42 = 3964;
    __cxa_throw(v42, MEMORY[0x1E0DE4F28], 0);
  }

  *(_QWORD *)&v36 = v18 + 24;
  *((_QWORD *)&v36 + 1) = v18;
  *v13 = v36;

  if (v54)
  {
    v37 = (unint64_t *)&v54->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }

  result.__cntrl_ = v40;
  result.__ptr_ = v39;
  return result;
}

+ (shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>)createDescriprorProcessorWithModelPath:(const char *)a3 nBatch:(int)a4 computePlatform:(int)a5 computePath:(int)a6 options:(Options *)a7
{
  _QWORD *v7;
  _QWORD *v13;
  id v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ImageDescriptorProcessorAbstract *v20;
  __shared_weak_count *v21;
  _QWORD *exception;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  id v27;
  id v28;
  shared_ptr<vision::mod::ImageDescriptorProcessorAbstract> result;

  v13 = v7;
  v25 = *(_OWORD *)&a7->var0;
  v14 = a7->var2;
  v23 = a7->var3;
  v24 = v14;
  v15 = (char *)operator new(0x58uLL);
  *((_QWORD *)v15 + 1) = 0;
  *((_QWORD *)v15 + 2) = 0;
  *(_QWORD *)v15 = &off_1E453BAA8;
  v26 = v25;
  v16 = v14;
  v17 = v23;
  v18 = v16;
  v27 = v18;
  v19 = v17;
  v28 = v19;
  vision::mod::ImageDescriptorProcessorEspresso::ImageDescriptorProcessorEspresso((uint64_t)(v15 + 24), (id *)&v26, a3, "smartcam", a5, a6);
  *((_QWORD *)v15 + 3) = &off_1E453AD48;

  if (a5)
  {
    if (a4 <= 0)
    {
      syslog(5, "ERROR: ImageDescriptorProcessorEspresso::setNetworkBatchNumber nBatch>0", v23, v24);
      exception = __cxa_allocate_exception(8uLL);
      *exception = 3708;
      __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
    }
    espresso_vision_first_layer_first_source_blob_shape();
    espresso_vision_shape_network();
    *(_DWORD *)(*((_QWORD *)v15 + 9) + 8) = a4;
  }
  *((_DWORD *)v15 + 9) = 1065353216;
  *(_QWORD *)(v15 + 52) = 0;
  *(_QWORD *)(v15 + 44) = 0;
  *(_DWORD *)(v15 + 59) = 0;
  *v13 = v15 + 24;
  v13[1] = v15;

  result.__cntrl_ = v21;
  result.__ptr_ = v20;
  return result;
}

+ (id)classifierResourceTypesToNamesForOriginatingRequestSpecifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (+[VNSmartCamClassifier classifierResourceTypesToNamesForOriginatingRequestSpecifier:]::onceToken != -1)
    dispatch_once(&+[VNSmartCamClassifier classifierResourceTypesToNamesForOriginatingRequestSpecifier:]::onceToken, &__block_literal_global_7532);
  objc_msgSend((id)+[VNSmartCamClassifier classifierResourceTypesToNamesForOriginatingRequestSpecifier:]::classifierResourceTypesToNames, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (Class)espressoModelImageprintClass
{
  return (Class)objc_opt_class();
}

+ (NSString)returnAllResultsOptionKey
{
  return (NSString *)CFSTR("VNSmartCamClassifierProcessOption_ReturnAllResults");
}

+ (id)createObservationWithDescriptors:(id)a3 forOriginatingRequestSpecifier:(id)a4
{
  id v5;
  id v6;
  VNSmartCamObservation *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[VNSmartCamObservation initWithOriginatingRequestSpecifier:smartCamprints:]([VNSmartCamObservation alloc], "initWithOriginatingRequestSpecifier:smartCamprints:", v6, v5);

  return v7;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allGPUComputeDevices](VNComputeDeviceUtilities, "allGPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)initDumpDebugIntermediates:(id *)a3 debugInfo:(id *)a4
{
  char v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "BOOLForKey:", CFSTR("VN_DEBUG_DUMP_SMARTCAM_INTERMEDIATES"));
  if (a3)
    v7 = v6;
  else
    v7 = 0;

  if (a4 && (v7 & 1) != 0)
  {
    NSTemporaryDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("VN_smartcam_classifier_debug_intermediates/"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

    if (v11)
      *a3 = objc_retainAutorelease(v13);
    *a4 = objc_alloc_init(MEMORY[0x1E0C99E08]);

  }
}

void __85__VNSmartCamClassifier_classifierResourceTypesToNamesForOriginatingRequestSpecifier___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("espresso-descriptor");
  v6[1] = CFSTR("espresso-classifier");
  v7[0] = CFSTR("smartcam-descriptor");
  v7[1] = CFSTR("smartcam-classifier");
  v6[2] = CFSTR("espresso-classifier-labels");
  v6[3] = CFSTR("espresso-classifier-relationships");
  v7[2] = CFSTR("smartcam-classifier-labels");
  v7[3] = CFSTR("smartcam-classifier-relationships");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), 1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v1;
  v5 = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[VNSmartCamClassifier classifierResourceTypesToNamesForOriginatingRequestSpecifier:]::classifierResourceTypesToNames;
  +[VNSmartCamClassifier classifierResourceTypesToNamesForOriginatingRequestSpecifier:]::classifierResourceTypesToNames = v2;

}

@end

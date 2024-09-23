@implementation VNShotflowNetworkANODv5

+ (id)modelName
{
  return CFSTR("anodv5_drop1_fp16.espresso");
}

+ (id)inputLayerName
{
  return CFSTR("image");
}

+ (CGSize)inputImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 608.0;
  v3 = 384.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (unint64_t)mumberPosClasses
{
  return 12;
}

+ (const)importantClasses
{
  if (+[VNShotflowNetworkANODv5 importantClasses]::onceToken != -1)
    dispatch_once(&+[VNShotflowNetworkANODv5 importantClasses]::onceToken, &__block_literal_global_200_29980);
  return (const void *)+[VNShotflowNetworkANODv5 importantClasses]::importantClasses;
}

+ (BOOL)hasPose
{
  return 1;
}

+ (BOOL)hasPetFaces
{
  return 1;
}

+ (BOOL)hasFaceBodyAssociation
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
  float v5;
  tuple<float, float, float> result;

  objc_msgSend((id)objc_opt_class(), "inputScale");
  v3 = v2 * -116.28;
  v4 = v2 * -123.68;
  v5 = v2 * -103.53;
  result.var0.var2 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v5;
  return result;
}

+ (BOOL)inputBGR
{
  return 1;
}

double __43__VNShotflowNetworkANODv5_importantClasses__block_invoke()
{
  _QWORD *v0;
  _QWORD *v1;
  double result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  v0[2] = 0;
  *v0 = 0;
  v1 = operator new(0x68uLL);
  v0[1] = v1 + 13;
  v0[2] = v1 + 13;
  v1[12] = 14;
  *((_OWORD *)v1 + 2) = xmmword_1A15FA1E8;
  *((_OWORD *)v1 + 3) = unk_1A15FA1F8;
  *((_OWORD *)v1 + 4) = xmmword_1A15FA208;
  *((_OWORD *)v1 + 5) = unk_1A15FA218;
  *(_QWORD *)&result = 1;
  *(_OWORD *)v1 = xmmword_1A15FA1C8;
  *((_OWORD *)v1 + 1) = unk_1A15FA1D8;
  *v0 = v1;
  +[VNShotflowNetworkANODv5 importantClasses]::importantClasses = (uint64_t)v0;
  return result;
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
  char *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  _QWORD *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  _QWORD *exception;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *__p[3];

  v3 = (void *)objc_opt_class();
  *(_QWORD *)&v44 = 0;
  std::vector<unsigned long>::vector(__p, 4uLL, &v44);
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
    v34 = __cxa_allocate_exception(8uLL);
    *v34 = 6014;
    __cxa_throw(v34, MEMORY[0x1E0DE4F28], 0);
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
    v35 = __cxa_allocate_exception(8uLL);
    *v35 = 6014;
    __cxa_throw(v35, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v43);
  v10 = (char *)operator new(0xC0uLL);
  *((_QWORD *)v10 + 1) = 0;
  *((_QWORD *)v10 + 2) = 0;
  *(_QWORD *)v10 = &off_1E453B338;
  *(_OWORD *)(v10 + 24) = 0u;
  *(_OWORD *)(v10 + 40) = 0u;
  *(_OWORD *)(v10 + 56) = 0u;
  *(_OWORD *)(v10 + 72) = 0u;
  *(_OWORD *)(v10 + 88) = 0u;
  *(_OWORD *)(v10 + 104) = 0u;
  *(_OWORD *)(v10 + 120) = 0u;
  *(_OWORD *)(v10 + 136) = 0u;
  *(_OWORD *)(v10 + 152) = 0u;
  *(_OWORD *)(v10 + 168) = 0u;
  *((_QWORD *)v10 + 23) = 0;
  *(_QWORD *)&v42 = v10 + 24;
  *((_QWORD *)&v42 + 1) = v10;
  objc_msgSend(CFSTR("rcnn_output_cls"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v36 = __cxa_allocate_exception(8uLL);
    *v36 = 6014;
    __cxa_throw(v36, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v42);
  if ((objc_msgSend(v3, "hasPose") & 1) != 0
    || (objc_msgSend(v3, "hasPetFaces") & 1) != 0
    || objc_msgSend(v3, "hasFaceBodyAssociation"))
  {
    v11 = (std::__shared_weak_count *)operator new(0xC0uLL);
    v11->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    v11->__shared_weak_owners_ = 0;
    v11->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B338;
    v11[1].std::__shared_count = 0u;
    *(_OWORD *)&v11[1].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v11[2].__shared_owners_ = 0u;
    v11[3].std::__shared_count = 0u;
    *(_OWORD *)&v11[3].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v11[4].__shared_owners_ = 0u;
    v11[5].std::__shared_count = 0u;
    *(_OWORD *)&v11[5].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v11[6].__shared_owners_ = 0u;
    v11[7].std::__shared_count = 0u;
    v11[7].__shared_weak_owners_ = 0;
    *(_QWORD *)&v41 = v11 + 1;
    *((_QWORD *)&v41 + 1) = v11;
    objc_msgSend(CFSTR("rcnn_output_selected_indices"), "UTF8String");
    if (espresso_network_bind_buffer())
    {
      v37 = __cxa_allocate_exception(8uLL);
      *v37 = 6014;
      __cxa_throw(v37, MEMORY[0x1E0DE4F28], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v41);
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (objc_msgSend(v3, "hasPose"))
  {
    v14 = (std::__shared_weak_count *)operator new(0xC0uLL);
    v14->__shared_owners_ = 0;
    v15 = (unint64_t *)&v14->__shared_owners_;
    v14->__shared_weak_owners_ = 0;
    v14->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B338;
    v14[1].std::__shared_count = 0u;
    *(_OWORD *)&v14[1].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v14[2].__shared_owners_ = 0u;
    v14[3].std::__shared_count = 0u;
    *(_OWORD *)&v14[3].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v14[4].__shared_owners_ = 0u;
    v14[5].std::__shared_count = 0u;
    *(_OWORD *)&v14[5].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v14[6].__shared_owners_ = 0u;
    v14[7].std::__shared_count = 0u;
    v14[7].__shared_weak_owners_ = 0;
    *(_QWORD *)&v41 = v14 + 1;
    *((_QWORD *)&v41 + 1) = v14;
    objc_msgSend(CFSTR("fcos/human_pose"), "UTF8String");
    if (espresso_network_bind_buffer())
    {
      v38 = __cxa_allocate_exception(8uLL);
      *v38 = 6014;
      __cxa_throw(v38, MEMORY[0x1E0DE4F28], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v41);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (objc_msgSend(v3, "hasPetFaces"))
  {
    v17 = (std::__shared_weak_count *)operator new(0xC0uLL);
    v17->__shared_owners_ = 0;
    v18 = (unint64_t *)&v17->__shared_owners_;
    v17->__shared_weak_owners_ = 0;
    v17->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B338;
    v17[1].std::__shared_count = 0u;
    *(_OWORD *)&v17[1].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v17[2].__shared_owners_ = 0u;
    v17[3].std::__shared_count = 0u;
    *(_OWORD *)&v17[3].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v17[4].__shared_owners_ = 0u;
    v17[5].std::__shared_count = 0u;
    *(_OWORD *)&v17[5].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v17[6].__shared_owners_ = 0u;
    v17[7].std::__shared_count = 0u;
    v17[7].__shared_weak_owners_ = 0;
    *(_QWORD *)&v41 = v17 + 1;
    *((_QWORD *)&v41 + 1) = v17;
    objc_msgSend(CFSTR("fcos/pet_face_scores"), "UTF8String");
    if (espresso_network_bind_buffer())
    {
      v39 = __cxa_allocate_exception(8uLL);
      *v39 = 6014;
      __cxa_throw(v39, MEMORY[0x1E0DE4F28], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v41);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (objc_msgSend(v3, "hasFaceBodyAssociation"))
  {
    v20 = (std::__shared_weak_count *)operator new(0xC0uLL);
    v20->__shared_owners_ = 0;
    v21 = (unint64_t *)&v20->__shared_owners_;
    v20->__shared_weak_owners_ = 0;
    v20->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B338;
    v20[1].std::__shared_count = 0u;
    *(_OWORD *)&v20[1].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v20[2].__shared_owners_ = 0u;
    v20[3].std::__shared_count = 0u;
    *(_OWORD *)&v20[3].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v20[4].__shared_owners_ = 0u;
    v20[5].std::__shared_count = 0u;
    *(_OWORD *)&v20[5].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v20[6].__shared_owners_ = 0u;
    v20[7].std::__shared_count = 0u;
    v20[7].__shared_weak_owners_ = 0;
    *(_QWORD *)&v41 = v20 + 1;
    *((_QWORD *)&v41 + 1) = v20;
    objc_msgSend(CFSTR("fcos/association_preds"), "UTF8String");
    if (espresso_network_bind_buffer())
    {
      v40 = __cxa_allocate_exception(8uLL);
      *v40 = 6014;
      __cxa_throw(v40, MEMORY[0x1E0DE4F28], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v41);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = __p[0];
  self->super.super._currentNetworkWidth = *(_QWORD *)__p[0];
  self->super.super._currentNetworkHeight = v23[1];
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v42 + 1);
  if (*((_QWORD *)&v42 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v42 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = (std::__shared_weak_count *)*((_QWORD *)&v43 + 1);
  if (*((_QWORD *)&v43 + 1))
  {
    v28 = (unint64_t *)(*((_QWORD *)&v43 + 1) + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v30 = (std::__shared_weak_count *)*((_QWORD *)&v44 + 1);
  if (*((_QWORD *)&v44 + 1))
  {
    v31 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
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
        -[VNShotflowNetworkANODv5 initializeBuffers](self, "initializeBuffers");
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
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  float v24;
  int v25;
  uint64_t v26;
  int v27;
  float v28;
  float v29;
  float v30;
  uint64_t v31;
  float *v32;
  float v33;
  int v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  BOOL v38;
  int v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  VNShotflowDetection *v45;
  _QWORD *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  VNShotflowDetection *v52;
  _QWORD *exception;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  float v60;
  float v61;
  uint64_t v62;
  float v63;
  float v64;
  unint64_t v65;
  float v66;
  _OWORD v67[3];

  v4 = a4;
  height = a3->height;
  width = a3->width;
  if (-[VNShotflowNetworkANODv5 setInputShape:height:](self, "setInputShape:height:", width, height))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  v9 = *(_OWORD *)&a3->width;
  v67[0] = *(_OWORD *)&a3->data;
  v67[1] = v9;
  -[VNShotflowNetwork runNetwork:inputIsBGR:](self, "runNetwork:inputIsBGR:", v67, v4);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VNShotflowNetwork threshold](self, "threshold");
  v59 = v10;
  if (v11 == 1.0)
  {
    v55 = __cxa_allocate_exception(8uLL);
    *v55 = 6012;
    __cxa_throw(v55, MEMORY[0x1E0DE4F28], 0);
  }
  v12 = (void *)objc_opt_class();
  begin = (uint64_t **)self->super.super._logitsPosOutputs.__begin_;
  v14 = *begin[2];
  v62 = *begin[4];
  v15 = **begin;
  v16 = (*begin)[3];
  v65 = height;
  if ((objc_msgSend(v12, "hasPose") & 1) != 0
    || (objc_msgSend(v12, "hasPetFaces") & 1) != 0
    || objc_msgSend(v12, "hasFaceBodyAssociation"))
  {
    v17 = width;
    v18 = **((_QWORD **)self->super.super._logitsPosOutputs.__begin_ + 6);
  }
  else
  {
    v17 = width;
    v18 = 0;
  }
  if (objc_msgSend(v12, "hasPose"))
  {
    v19 = **((_QWORD **)self->super.super._logitsPosOutputs.__begin_ + 8);
    v20 = 5;
  }
  else
  {
    v19 = 0;
    v20 = 4;
  }
  if (objc_msgSend(v12, "hasPetFaces"))
    v58 = **((_QWORD **)self->super.super._logitsPosOutputs.__begin_ + 2 * v20++);
  else
    v58 = 0;
  if (objc_msgSend(v12, "hasFaceBodyAssociation"))
    v57 = **((_QWORD **)self->super.super._logitsPosOutputs.__begin_ + 2 * v20);
  else
    v57 = 0;
  if ((int)v16 >= 1)
  {
    v21 = 0;
    v60 = (float)v65;
    v61 = (float)v17;
    v22 = 4 * v16;
    do
    {
      v23 = sqrtf(*(float *)(v14 + v21));
      if (v23 >= 0.3)
      {
        v24 = *(float *)(v62 + v21);
        v25 = objc_msgSend(v12, "hasPose");
        v26 = (int)(float)(v24 + 1.0);
        if ((_DWORD)v26 == 1)
          v27 = v25;
        else
          v27 = 0;
        v28 = 0.0;
        v29 = 0.0;
        v30 = 0.0;
        if (v27 == 1)
        {
          v31 = 3 * (int)*(float *)(v18 + v21);
          v32 = (float *)(v19 + 4 * (int)v31);
          v30 = (float)((float)(1.0 / (float)(expf(-*v32) + 1.0)) * 360.0) + -180.0;
          v28 = (float)(*(float *)(v19 + 4 * v31 + 4) * 180.0) + -90.0;
          v33 = v32[2];
          v10 = v59;
          v29 = (float)(v33 * 180.0) + -90.0;
        }
        v34 = objc_msgSend(v12, "hasPetFaces");
        if ((v26 - 9) < 2)
          v35 = v34;
        else
          v35 = 0;
        v36 = 0;
        if (v35 == 1)
          v36 = *(_DWORD *)(v58 + 4 * (int)*(float *)(v18 + v21));
        v64 = v28;
        v66 = v30;
        v37 = 0;
        v63 = v29;
        if (objc_msgSend(v12, "hasFaceBodyAssociation"))
        {
          v38 = (_DWORD)v26 != 12 && (v26 & 0xFFFFFFF7) - 1 > 1;
          v39 = 0;
          if (!v38)
          {
            v40 = *(float *)(v18 + v21);
            v37 = *(_DWORD *)(v57 + 8 * (int)v40);
            v39 = *(_DWORD *)(v57 + 8 * (int)v40 + 4);
          }
        }
        else
        {
          v39 = 0;
        }
        v41 = *(float *)(v15 + 4 * v21);
        v42 = *(float *)(v15 + 4 * (v21 + 1));
        v43 = *(float *)(v15 + 4 * (v21 + 2));
        v44 = *(float *)(v15 + 4 * (v21 + 3));
        v45 = [VNShotflowDetection alloc];
        v46 = (_QWORD *)objc_msgSend(v12, "importantClasses");
        v47 = (float)(v41 / v61);
        v48 = (float)(v42 / v60);
        v49 = (float)(v43 / v61) - v47;
        v50 = (float)(v44 / v60) - v48;
        v51 = 1.0 - (v50 * 0.5 + v48) - v50 * 0.5;
        LODWORD(v56) = v39;
        v52 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:hasLabel:label:petFaceScore:associatedX:associatedY:](v45, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:hasLabel:label:petFaceScore:associatedX:associatedY:", 0, v46[1] - *v46 > 8uLL, v26, v49 * 0.5 + v47 - v49 * 0.5, v51, v49, v50, v49 * 0.5 + v47 - v49 * 0.5, v51, v49, v50, __PAIR64__(LODWORD(v66), LODWORD(v23)), __PAIR64__(LODWORD(v63), LODWORD(v64)), __PAIR64__(v37, v36), v56);
        objc_msgSend(v10, "addObject:", v52);

      }
      v21 += 4;
    }
    while (v22 != v21);
  }
  return v10;
}

@end

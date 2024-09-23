@implementation VNShotflowNetworkANODv4

+ (id)modelName
{
  return CFSTR("anodv4_drop6_fp16.espresso");
}

+ (id)inputLayerName
{
  return CFSTR("input_image");
}

+ (unint64_t)mumberPosClasses
{
  return 12;
}

+ (const)importantClasses
{
  if (+[VNShotflowNetworkANODv4 importantClasses]::onceToken != -1)
    dispatch_once(&+[VNShotflowNetworkANODv4 importantClasses]::onceToken, &__block_literal_global_188);
  return (const void *)+[VNShotflowNetworkANODv4 importantClasses]::importantClasses;
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

double __43__VNShotflowNetworkANODv4_importantClasses__block_invoke()
{
  _QWORD *v0;
  _QWORD *v1;
  double result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  v0[2] = 0;
  *v0 = 0;
  v1 = operator new(0x58uLL);
  v0[1] = v1 + 11;
  v0[2] = v1 + 11;
  v1[10] = 12;
  *((_OWORD *)v1 + 2) = xmmword_1A15FA190;
  *((_OWORD *)v1 + 3) = unk_1A15FA1A0;
  *((_OWORD *)v1 + 4) = xmmword_1A15FA1B0;
  result = dbl_1A15FA180[0];
  *(_OWORD *)v1 = xmmword_1A15FA170;
  *((_OWORD *)v1 + 1) = *(_OWORD *)dbl_1A15FA180;
  *v0 = v1;
  +[VNShotflowNetworkANODv4 importantClasses]::importantClasses = (uint64_t)v0;
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
  std::__shared_weak_count *v10;
  char *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  _QWORD *exception;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *__p[3];

  v3 = (void *)objc_opt_class();
  *(_QWORD *)&v38 = 0;
  std::vector<unsigned long>::vector(__p, 4uLL, &v38);
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
  *(_QWORD *)&v38 = v8 + 24;
  *((_QWORD *)&v38 + 1) = v8;
  objc_msgSend(CFSTR("rcnn_output"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v29 = __cxa_allocate_exception(8uLL);
    *v29 = 6014;
    __cxa_throw(v29, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v38);
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
  *(_QWORD *)&v37 = v9 + 24;
  *((_QWORD *)&v37 + 1) = v9;
  objc_msgSend(CFSTR("rcnn_output_scores"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v30 = __cxa_allocate_exception(8uLL);
    *v30 = 6014;
    __cxa_throw(v30, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v37);
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
  *(_QWORD *)&v36 = v10 + 1;
  *((_QWORD *)&v36 + 1) = v10;
  objc_msgSend(CFSTR("rcnn_output_cls"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v31 = __cxa_allocate_exception(8uLL);
    *v31 = 6014;
    __cxa_throw(v31, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v36);
  if ((objc_msgSend(v3, "hasPose") & 1) == 0)
  {
    v19 = __p[0];
    self->super.super._currentNetworkWidth = *(_QWORD *)__p[0];
    self->super.super._currentNetworkHeight = v19[1];
LABEL_23:
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    goto LABEL_27;
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
  *(_QWORD *)&v35 = v11 + 24;
  *((_QWORD *)&v35 + 1) = v11;
  objc_msgSend(CFSTR("rcnn_output_selected_indices"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v32 = __cxa_allocate_exception(8uLL);
    *v32 = 6014;
    __cxa_throw(v32, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v35);
  v12 = (std::__shared_weak_count *)operator new(0xC0uLL);
  v12->__shared_owners_ = 0;
  v13 = (unint64_t *)&v12->__shared_owners_;
  v12->__shared_weak_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B338;
  v12[1].std::__shared_count = 0u;
  *(_OWORD *)&v12[1].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v12[2].__shared_owners_ = 0u;
  v12[3].std::__shared_count = 0u;
  *(_OWORD *)&v12[3].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v12[4].__shared_owners_ = 0u;
  v12[5].std::__shared_count = 0u;
  *(_OWORD *)&v12[5].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v12[6].__shared_owners_ = 0u;
  v12[7].std::__shared_count = 0u;
  v12[7].__shared_weak_owners_ = 0;
  *(_QWORD *)&v34 = v12 + 1;
  *((_QWORD *)&v34 + 1) = v12;
  objc_msgSend(CFSTR("face_pose_topk"), "UTF8String");
  if (espresso_network_bind_buffer())
  {
    v33 = __cxa_allocate_exception(8uLL);
    *v33 = 6014;
    __cxa_throw(v33, MEMORY[0x1E0DE4F28], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((char **)&self->super.super._logitsPosOutputs, &v34);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  v15 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
  if (*((_QWORD *)&v35 + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v36 + 1);
  v18 = __p[0];
  self->super.super._currentNetworkWidth = *(_QWORD *)__p[0];
  self->super.super._currentNetworkHeight = v18[1];
  if (v10)
    goto LABEL_23;
LABEL_27:
  v22 = (std::__shared_weak_count *)*((_QWORD *)&v37 + 1);
  if (*((_QWORD *)&v37 + 1))
  {
    v23 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
  if (*((_QWORD *)&v38 + 1))
  {
    v26 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
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
        -[VNShotflowNetworkANODv4 initializeBuffers](self, "initializeBuffers");
        return 0;
      }
    }
  }
  return result;
}

- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  _BOOL8 v4;
  vImagePixelCount height;
  vImagePixelCount width;
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
  unint64_t v20;
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
  float *v31;
  float v32;
  float v33;
  float v34;
  float v35;
  VNShotflowDetection *v36;
  _QWORD *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  VNShotflowDetection *v43;
  _QWORD *exception;
  _QWORD *v46;
  uint64_t v47;
  float v48;
  float v49;
  _OWORD v50[2];

  v4 = a4;
  height = a3->height;
  width = a3->width;
  if (-[VNShotflowNetworkANODv4 setInputShape:height:](self, "setInputShape:height:", width, height))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  v9 = *(_OWORD *)&a3->width;
  v50[0] = *(_OWORD *)&a3->data;
  v50[1] = v9;
  -[VNShotflowNetwork runNetwork:inputIsBGR:](self, "runNetwork:inputIsBGR:", v50, v4);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VNShotflowNetwork threshold](self, "threshold");
  if (v11 == 1.0)
  {
    v46 = __cxa_allocate_exception(8uLL);
    *v46 = 6012;
    __cxa_throw(v46, MEMORY[0x1E0DE4F28], 0);
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
    v47 = *v18[6];
    v19 = *v18[8];
  }
  else
  {
    v19 = 0;
    v47 = 0;
  }
  if ((int)v17 >= 1)
  {
    v20 = width;
    v21 = 0;
    v48 = (float)height;
    v49 = (float)v20;
    v22 = 4 * v17;
    do
    {
      v23 = sqrtf(*(float *)(v14 + v21));
      if (v23 >= 0.3)
      {
        v24 = *(float *)(v15 + v21);
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
          v31 = (float *)(v19 + 12 * (int)*(float *)(v47 + v21));
          v29 = (float)(*v31 * 180.0) + -90.0;
          v30 = (float)(*(float *)(v19 + 12 * (int)*(float *)(v47 + v21) + 4) * 360.0) + -180.0;
          v28 = (float)(v31[2] * 180.0) + -90.0;
        }
        v32 = *(float *)(v16 + 4 * v21);
        v33 = *(float *)(v16 + 4 * (v21 + 1));
        v34 = *(float *)(v16 + 4 * (v21 + 2));
        v35 = *(float *)(v16 + 4 * (v21 + 3));
        v36 = [VNShotflowDetection alloc];
        v37 = (_QWORD *)objc_msgSend(v12, "importantClasses");
        v38 = (float)(v32 / v49);
        v39 = (float)(v33 / v48);
        v40 = (float)(v34 / v49) - v38;
        v41 = (float)(v35 / v48) - v39;
        v42 = 1.0 - (v41 * 0.5 + v39) - v41 * 0.5;
        v43 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:hasLabel:label:](v36, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:hasLabel:label:", 0, v37[1] - *v37 > 8uLL, v26, v40 * 0.5 + v38 - v40 * 0.5, v42, v40, v41, v40 * 0.5 + v38 - v40 * 0.5, v42, v40, v41, __PAIR64__(LODWORD(v30), LODWORD(v23)), __PAIR64__(LODWORD(v29), LODWORD(v28)));
        objc_msgSend(v10, "addObject:", v43);

      }
      v21 += 4;
    }
    while (v22 != v21);
  }
  return v10;
}

@end

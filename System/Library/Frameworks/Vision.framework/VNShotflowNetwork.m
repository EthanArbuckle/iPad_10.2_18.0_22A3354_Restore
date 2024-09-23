@implementation VNShotflowNetwork

- (VNShotflowNetwork)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6 threshold:(float)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  VNShotflowNetwork *v13;
  VNShotflowNetwork *v14;
  VNShotflowNetwork *v16;
  objc_super v18;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNShotflowNetwork;
  v13 = -[VNShotflowNetwork init](&v18, sel_init);
  v14 = v13;
  if (a7 == 1.0 || v13 == 0)
  {
    v16 = 0;
  }
  else
  {
    v13->_threshold = a7;
    -[VNShotflowNetwork initializeEspressoResourcesWithModelPath:espressoEngineID:espressoDeviceID:espressoStorageType:](v13, "initializeEspressoResourcesWithModelPath:espressoEngineID:espressoDeviceID:espressoStorageType:", v12, v10, v9, v8);
    -[VNShotflowNetwork initializeBuffers](v14, "initializeBuffers");
    v16 = v14;
  }

  return v16;
}

- (VNShotflowNetwork)initWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4 threshold:(float)a5
{
  uint64_t v7;
  void *var0;
  VNShotflowNetwork *v9;
  VNShotflowNetwork *v10;
  VNShotflowNetwork *v12;
  objc_super v14;

  v7 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  v14.receiver = self;
  v14.super_class = (Class)VNShotflowNetwork;
  v9 = -[VNShotflowNetwork init](&v14, sel_init);
  v10 = v9;
  if (a5 == 1.0 || v9 == 0)
  {
    v12 = 0;
  }
  else
  {
    v9->_espressoNetwork.plan = var0;
    *(_QWORD *)&v9->_espressoNetwork.network_index = v7;
    v9->_espressoPlan = a4;
    *(_WORD *)&v9->_releaseEspressoContext = 0;
    v9->_threshold = a5;
    -[VNShotflowNetwork initializeBuffers](v9, "initializeBuffers");
    v12 = v10;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_releaseEspressoPlan)
    espresso_plan_destroy();
  if (self->_releaseEspressoContext)
    espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)VNShotflowNetwork;
  -[VNShotflowNetwork dealloc](&v3, sel_dealloc);
}

- (void)initializeEspressoResourcesWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6
{
  id v7;
  void *context;
  void *plan;
  _QWORD *exception;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;

  v7 = a3;
  context = (void *)espresso_create_context();
  self->_espressoContext = context;
  if (!context)
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 6013;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  self->_releaseEspressoContext = 1;
  plan = (void *)espresso_create_plan();
  self->_espressoPlan = plan;
  if (!plan)
  {
    v11 = __cxa_allocate_exception(8uLL);
    *v11 = 6013;
    __cxa_throw(v11, MEMORY[0x1E0DE4F28], 0);
  }
  self->_releaseEspressoPlan = 1;
  v14 = objc_retainAutorelease(v7);
  objc_msgSend(v14, "UTF8String");
  if (espresso_plan_add_network())
  {
    v12 = __cxa_allocate_exception(8uLL);
    *v12 = 6014;
    __cxa_throw(v12, MEMORY[0x1E0DE4F28], 0);
  }
  if (espresso_plan_build())
  {
    v13 = __cxa_allocate_exception(8uLL);
    *v13 = 6014;
    __cxa_throw(v13, MEMORY[0x1E0DE4F28], 0);
  }

}

- (void)initializeBuffers
{
  void *v3;
  id v4;
  int blob_dimensions;
  unint64_t v6;
  float (*defaultBoxSizes)[10][2];
  float *v8;
  char *v9;
  id v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  void *v13;
  id v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  char *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  unint64_t v30;
  BOOL *v31;
  void *v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  float *v36;
  float v37;
  float v38;
  uint64_t v39;
  float *v40;
  float v41;
  float v42;
  unint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *exception;
  BOOL *v50;
  char **p_logitsNegOutputs;
  BOOL *v52;
  char **p_offsetsOutputs;
  char **p_logitsPosOutputs;
  unint64_t v55;
  void *v56;
  VNShotflowNetwork *v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  _QWORD v63[4];

  v3 = (void *)objc_opt_class();
  *(_QWORD *)&v60 = 0;
  std::vector<unsigned long>::vector(v63, 4uLL, &v60);
  v56 = v3;
  v57 = self;
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
  v55 = objc_msgSend(v56, "numberMaxoutLayers");
  v6 = 0;
  p_offsetsOutputs = (char **)&self->_offsetsOutputs;
  p_logitsPosOutputs = (char **)&self->_logitsPosOutputs;
  v50 = &self->isAnchorSquare[5];
  p_logitsNegOutputs = (char **)&self->_logitsNegOutputs;
  v52 = &self->isAnchorSquare[1];
  defaultBoxSizes = self->_defaultBoxSizes;
  v8 = &self->_defaultBoxSizes[0][0][1];
  do
  {
    if (v6 >= v55)
    {
      v20 = (char *)operator new(0xC0uLL);
      *((_QWORD *)v20 + 1) = 0;
      v21 = (unint64_t *)(v20 + 8);
      *((_QWORD *)v20 + 2) = 0;
      *(_QWORD *)v20 = &off_1E453B338;
      *(_OWORD *)(v20 + 24) = 0u;
      *(_OWORD *)(v20 + 40) = 0u;
      *(_OWORD *)(v20 + 56) = 0u;
      *(_OWORD *)(v20 + 72) = 0u;
      *(_OWORD *)(v20 + 88) = 0u;
      *(_OWORD *)(v20 + 104) = 0u;
      *(_OWORD *)(v20 + 120) = 0u;
      *(_OWORD *)(v20 + 136) = 0u;
      *(_OWORD *)(v20 + 152) = 0u;
      *(_OWORD *)(v20 + 168) = 0u;
      *((_QWORD *)v20 + 23) = 0;
      *(_QWORD *)&v60 = v20 + 24;
      *((_QWORD *)&v60 + 1) = v20;
      v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("logits_%ld"), v6));
      objc_msgSend(v14, "UTF8String");
      if (espresso_network_bind_buffer())
      {
        v47 = __cxa_allocate_exception(8uLL);
        *v47 = 6014;
        __cxa_throw(v47, MEMORY[0x1E0DE4F28], 0);
      }
      std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100](p_logitsPosOutputs, &v60);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        (*(void (**)(char *))(*(_QWORD *)v20 + 16))(v20);
        v19 = (std::__shared_weak_count *)v20;
        goto LABEL_20;
      }
    }
    else
    {
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
      *(_QWORD *)&v60 = v9 + 24;
      *((_QWORD *)&v60 + 1) = v9;
      v10 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("logits_pos_%ld"), v6));
      objc_msgSend(v10, "UTF8String");
      if (espresso_network_bind_buffer())
      {
        v48 = __cxa_allocate_exception(8uLL);
        *v48 = 6014;
        __cxa_throw(v48, MEMORY[0x1E0DE4F28], 0);
      }
      std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100](p_logitsPosOutputs, &v60);
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
      *(_QWORD *)&v58 = v11 + 1;
      *((_QWORD *)&v58 + 1) = v11;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("logits_neg_%ld"), v6);

      v14 = objc_retainAutorelease(v13);
      objc_msgSend(v14, "UTF8String");
      if (espresso_network_bind_buffer())
      {
        v46 = __cxa_allocate_exception(8uLL);
        *v46 = 6014;
        __cxa_throw(v46, MEMORY[0x1E0DE4F28], 0);
      }
      std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100](p_logitsNegOutputs, &v58);
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
      v16 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
      if (*((_QWORD *)&v60 + 1))
      {
        v17 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          v19 = v16;
LABEL_20:
          std::__shared_weak_count::__release_weak(v19);
        }
      }
    }
    v23 = (std::__shared_weak_count *)operator new(0xC0uLL);
    v23->__shared_owners_ = 0;
    v24 = (unint64_t *)&v23->__shared_owners_;
    v23->__shared_weak_owners_ = 0;
    v23->__vftable = (std::__shared_weak_count_vtbl *)&off_1E453B338;
    v23[1].std::__shared_count = 0u;
    *(_OWORD *)&v23[1].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v23[2].__shared_owners_ = 0u;
    v23[3].std::__shared_count = 0u;
    *(_OWORD *)&v23[3].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v23[4].__shared_owners_ = 0u;
    v23[5].std::__shared_count = 0u;
    *(_OWORD *)&v23[5].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v23[6].__shared_owners_ = 0u;
    v23[7].std::__shared_count = 0u;
    v23[7].__shared_weak_owners_ = 0;
    *(_QWORD *)&v62 = v23 + 1;
    *((_QWORD *)&v62 + 1) = v23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("offsets_%ld"), v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_retainAutorelease(v25);
    objc_msgSend(v26, "UTF8String");
    if (espresso_network_bind_buffer())
    {
      v45 = __cxa_allocate_exception(8uLL);
      *v45 = 6014;
      __cxa_throw(v45, MEMORY[0x1E0DE4F28], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100](p_offsetsOutputs, &v62);
    v27 = objc_msgSend(v56, "defaultBoxesSides");
    v60 = 0uLL;
    v61 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v60, *(const void **)v27, *(_QWORD *)(v27 + 8), (uint64_t)(*(_QWORD *)(v27 + 8) - *(_QWORD *)v27) >> 2);
    v28 = objc_msgSend(v56, "ratios");
    v58 = 0uLL;
    v59 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v58, *(const void **)v28, *(_QWORD *)(v28 + 8), (uint64_t)(*(_QWORD *)(v28 + 8) - *(_QWORD *)v28) >> 2);
    v29 = v58;
    v30 = (uint64_t)(*((_QWORD *)&v58 + 1) - v58) >> 2;
    v31 = v52;
    if (v30 != 1)
    {
      if (v30 != 5)
        goto LABEL_26;
      v31 = v50;
    }
    v57->isAnchorSquare[0] = 1;
    *v31 = 1;
LABEL_26:
    v32 = (void *)v60;
    if (*((_QWORD *)&v29 + 1) == (_QWORD)v29)
    {
      if (*((_QWORD *)&v29 + 1))
        operator delete((void *)v29);
LABEL_39:
      operator delete(v32);
      goto LABEL_40;
    }
    v33 = 0;
    v34 = *(float *)(v60 + 4 * v6);
    if (v30 <= 1)
      v35 = 1;
    else
      v35 = v30;
    v36 = v8;
    do
    {
      v37 = sqrtf(*(float *)(v29 + 4 * v33));
      *(v36 - 1) = v34 * v37;
      *v36 = v34 / v37;
      ++v33;
      v36 += 2;
    }
    while (*((_QWORD *)&v29 + 1) != v33);
    if (v6 < 5)
    {
      v38 = sqrtf(v34 * *((float *)v32 + v6 + 1));
      v39 = 2 * v30;
      v40 = (float *)v29;
      do
      {
        v41 = *v40++;
        v42 = sqrtf(v41);
        (*defaultBoxSizes)[(unint64_t)v39 / 2][0] = v38 * v42;
        v8[v39] = v38 / v42;
        v39 += 2;
        --v35;
      }
      while (v35);
    }
    operator delete((void *)v29);
    if (v32)
      goto LABEL_39;
    do
LABEL_40:
      v43 = __ldaxr(v24);
    while (__stlxr(v43 - 1, v24));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }

    ++v6;
    v8 += 20;
    ++defaultBoxSizes;
  }
  while (v6 != 6);
  v44 = (_QWORD *)v63[0];
  v57->_currentNetworkWidth = *(_QWORD *)v63[0];
  v57->_currentNetworkHeight = v44[1];
  v63[1] = v44;
  operator delete(v44);
}

- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4
{
  int v4;
  int v5;
  int v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  _QWORD *exception;
  unint64_t v21;

  v4 = a4;
  v5 = a3;
  if (*(_OWORD *)&self->_currentNetworkWidth == __PAIR128__(a4, a3))
    return 0;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v8, "inputLayerName");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "UTF8String");

  objc_msgSend((id)objc_opt_class(), "inputImageSize");
  if (v4 != (unint64_t)v11 || v5 != (unint64_t)v10)
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 6005;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  v7 = espresso_plan_build_clean();
  if (!v7)
  {
    v7 = espresso_network_change_input_blob_shapes();
    if (!v7)
    {
      v7 = espresso_plan_build();
      if (!v7)
      {
        v21 = objc_msgSend(v8, "numberMaxoutLayers");
        v12 = 0;
        v13 = 0;
        while (1)
        {
          if (v13 >= v21)
          {
            v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("logits_%ld"), v13));
            objc_msgSend(v14, "UTF8String");
            v16 = espresso_network_bind_buffer();
          }
          else
          {
            v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("logits_pos_%ld"), v13));
            objc_msgSend(v14, "UTF8String");
            v7 = espresso_network_bind_buffer();
            if (v7)
              break;
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("logits_neg_%ld"), v13);

            v14 = objc_retainAutorelease(v15);
            objc_msgSend(v14, "UTF8String");
            v16 = espresso_network_bind_buffer();
          }
          v7 = v16;
          if (v16)
            break;
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("offsets_%ld"), v13);

          v18 = objc_retainAutorelease(v17);
          objc_msgSend(v18, "UTF8String");
          v7 = espresso_network_bind_buffer();

          if (v7)
            return v7;
          ++v13;
          v12 += 16;
          if (v13 == 6)
          {
            v7 = 0;
            self->_currentNetworkWidth = v5;
            self->_currentNetworkHeight = v4;
            return v7;
          }
        }

      }
    }
  }
  return v7;
}

- (void)runNetwork:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  void *v4;
  id v5;
  int v6;
  _QWORD *exception;

  v4 = (void *)objc_opt_class();
  objc_msgSend(v4, "inputBiasRGB");
  objc_msgSend(v4, "inputScale");
  objc_msgSend(v4, "inputBGR");
  objc_msgSend(v4, "inputLayerName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  v6 = espresso_network_bind_input_vimagebuffer_bgra8();

  if (v6 || espresso_plan_execute_sync())
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
}

- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  _BOOL8 v4;
  VNShotflowNetwork *v6;
  vImagePixelCount width;
  vImagePixelCount height;
  __int128 v9;
  float v10;
  unint64_t v11;
  uint64_t v12;
  char *begin;
  _QWORD *v14;
  char *v15;
  uint64_t *v16;
  float **v17;
  float *v18;
  float **v19;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float *v24;
  uint64_t v25;
  uint64_t *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  float *v36;
  uint64_t v37;
  float *v38;
  _DWORD *v39;
  float *v40;
  uint64_t v41;
  float v42;
  unint64_t v43;
  float v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  void *v54;
  void *v55;
  float v56;
  float v57;
  float v58;
  void *v59;
  void *v60;
  float v61;
  float v62;
  float v63;
  VNShotflowDetection *v64;
  _QWORD *v65;
  VNShotflowDetection *v66;
  float *v67;
  _BOOL4 v68;
  BOOL v69;
  char v70;
  _BOOL4 v71;
  char v72;
  _QWORD *exception;
  _QWORD *v75;
  uint64_t v76;
  VNShotflowNetwork *v77;
  float (*defaultBoxSizes)[10][2];
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  float v82;
  float *v83;
  unint64_t v84;
  uint64_t v85;
  float v86;
  float v87;
  unint64_t v88;
  uint64_t v89;
  float *v90;
  float *v91;
  float *v92;
  unint64_t v93;
  BOOL *isAnchorSquare;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  float *v103;
  float v104;
  float *v105;
  float v106;
  unint64_t v107;
  void *v108;
  int v109;
  float *v110;
  float v111;
  _QWORD *v112;
  float v113;
  float v114;
  _QWORD v115[7];
  _QWORD aBlock[7];
  void *v117[3];
  _QWORD v118[3];
  _OWORD v119[3];

  v4 = a4;
  v6 = self;
  height = a3->height;
  width = a3->width;
  if (-[VNShotflowNetwork setInputShape:height:](self, "setInputShape:height:", width, height))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  v9 = *(_OWORD *)&a3->width;
  v119[0] = *(_OWORD *)&a3->data;
  v119[1] = v9;
  -[VNShotflowNetwork runNetwork:inputIsBGR:](v6, "runNetwork:inputIsBGR:", v119, v4);
  v96 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VNShotflowNetwork threshold](v6, "threshold");
  v114 = v10;
  if (v10 == 1.0)
  {
    v75 = __cxa_allocate_exception(8uLL);
    *v75 = 6012;
    __cxa_throw(v75, MEMORY[0x1E0DE4F28], 0);
  }
  v108 = (void *)objc_opt_class();
  v88 = objc_msgSend(v108, "numberMaxoutLayers");
  v11 = 0;
  v106 = (float)width;
  v104 = (float)height;
  defaultBoxSizes = v6->_defaultBoxSizes;
  isAnchorSquare = v6->isAnchorSquare;
  v77 = v6;
  do
  {
    v107 = v11;
    v12 = 16 * v11;
    begin = (char *)v6->_rollOutputs.__begin_;
    if (v6->_rollOutputs.__end_ == begin)
      v14 = 0;
    else
      v14 = *(_QWORD **)&begin[v12];
    v15 = (char *)v6->_yawOutputs.__begin_;
    if (v6->_yawOutputs.__end_ == v15)
      v16 = 0;
    else
      v16 = *(uint64_t **)&v15[v12];
    v17 = *(float ***)((char *)v6->_logitsPosOutputs.__begin_ + v12);
    v18 = *v17;
    if (v107 >= v88)
    {
      v20 = *v17;
      v18 += (uint64_t)v17[17];
      v105 = v17[17];
      v110 = v105;
      if (v14)
      {
LABEL_12:
        v21 = *v14;
        goto LABEL_15;
      }
    }
    else
    {
      v110 = 0;
      v19 = *(float ***)((char *)v6->_logitsNegOutputs.__begin_ + v12);
      v20 = *v19;
      v105 = v19[17];
      if (v14)
        goto LABEL_12;
    }
    v21 = 0;
LABEL_15:
    v112 = v14;
    if (v16)
      v22 = *v16;
    else
      v22 = 0;
    v23 = *(_QWORD *)((char *)v6->_offsetsOutputs.__begin_ + v12);
    v24 = *(float **)v23;
    v90 = v17[10];
    v83 = v17[11];
    v25 = objc_msgSend(v108, "strides");
    memset(v118, 0, sizeof(v118));
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v118, *(const void **)v25, *(_QWORD *)(v25 + 8), (uint64_t)(*(_QWORD *)(v25 + 8) - *(_QWORD *)v25) >> 2);
    v102 = (void *)v118[0];
    v87 = *(float *)(v118[0] + 4 * v107);
    v82 = *(float *)(*(_QWORD *)objc_msgSend(v108, "cellStartsY") + 4 * v107);
    v86 = *(float *)(*(_QWORD *)objc_msgSend(v108, "cellStartsX") + 4 * v107);
    v26 = (uint64_t *)objc_msgSend(v108, "ratios");
    v27 = v102;
    if (v112)
    {
      v101 = v112[17];
      if (v16)
        goto LABEL_20;
    }
    else
    {
      v101 = 0;
      if (v16)
      {
LABEL_20:
        v98 = v16[17];
        goto LABEL_23;
      }
    }
    v98 = 0;
LABEL_23:
    v29 = *v26;
    v28 = v26[1];
    v100 = *(_QWORD *)(v23 + 136);
    v99 = objc_msgSend(v108, "numberBinsRoll");
    v97 = objc_msgSend(v108, "numberBinsYaw");
    v89 = objc_msgSend(v108, "mumberBinsNegativeMaxout");
    v85 = objc_msgSend(v108, "mumberPosClasses");
    v109 = objc_msgSend(v108, "poseSquare");
    v30 = v85 + 1;
    std::vector<float>::vector(v117, v85 + 1);
    if (v28 != v29)
    {
      v95 = 0;
      v31 = (v28 - v29) >> 2 << (v107 != 5);
      v32 = v89 - 1;
      if (v107 >= v88)
        v32 = v85;
      v81 = v32 * (_QWORD)v105;
      v80 = ((__PAIR128__(v85, v107) - v88) >> 64) * (_QWORD)v110;
      if (v31 <= 1)
        v31 = 1;
      v79 = v31;
      v33 = 4 * (_QWORD)v110;
      while (1)
      {
        if (v83)
        {
          v84 = 0;
          v103 = defaultBoxSizes[v107][v95];
          v34 = v89;
          while (!v90)
          {
LABEL_77:
            if ((float *)++v84 == v83)
              goto LABEL_78;
          }
          v93 = 0;
          while (2)
          {
            if (v107 >= v88)
            {
              v35 = *v20;
            }
            else
            {
              v35 = 1.1755e-38;
              if (v34)
              {
                v36 = v20;
                v37 = v34;
                do
                {
                  v35 = fmaxf(v35, *v36);
                  v36 += (uint64_t)v105;
                  --v37;
                }
                while (v37);
              }
            }
            v38 = (float *)v117[0];
            *(float *)v117[0] = v35;
            if (v30 >= 2)
            {
              v39 = v38 + 1;
              v40 = v18;
              v41 = v85;
              do
              {
                v35 = fmaxf(v35, *v40);
                *v39++ = *(_DWORD *)v40;
                v40 = (float *)((char *)v40 + v33);
                --v41;
              }
              while (v41);
            }
            v92 = v20;
            v42 = 0.0;
            if (v30)
            {
              v43 = v30;
              do
              {
                v44 = expf(*v38 - v35);
                *v38++ = v44;
                v42 = v42 + v44;
                --v43;
              }
              while (v43);
            }
            v45 = objc_msgSend(v108, "importantClasses");
            v91 = v18;
            v47 = *(uint64_t **)v45;
            v46 = *(uint64_t **)(v45 + 8);
            if (*(uint64_t **)v45 != v46)
            {
              do
              {
                v48 = *v47;
                v49 = *(float *)((char *)v117[0] + (*v47 << 32 >> 30)) / v42;
                if (v49 > v114)
                {
                  v50 = *v103;
                  v111 = v103[1];
                  v113 = v24[v100];
                  v51 = *v24;
                  v52 = v24[2 * v100];
                  v53 = v24[3 * v100];
                  aBlock[0] = MEMORY[0x1E0C809B0];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __46__VNShotflowNetwork_processVImage_inputIsBGR___block_invoke;
                  aBlock[3] = &__block_descriptor_56_e5_f8__0l;
                  aBlock[4] = v99;
                  aBlock[5] = v21;
                  aBlock[6] = v101;
                  v54 = _Block_copy(aBlock);
                  v55 = v54;
                  v56 = 0.0;
                  v57 = 0.0;
                  if (v21)
                  {
                    if (v109 && !isAnchorSquare[v95])
                      objc_msgSend(v108, "nonSquareRollDefault");
                    else
                      v58 = (*((float (**)(void *))v54 + 2))(v54);
                    v57 = v58;
                  }
                  v115[0] = MEMORY[0x1E0C809B0];
                  v115[1] = 3221225472;
                  v115[2] = __46__VNShotflowNetwork_processVImage_inputIsBGR___block_invoke_2;
                  v115[3] = &__block_descriptor_56_e5_f8__0l;
                  v115[4] = v97;
                  v115[5] = v22;
                  v115[6] = v98;
                  v59 = _Block_copy(v115);
                  v60 = v59;
                  if (v22)
                  {
                    if (v109 && !isAnchorSquare[v95])
                      objc_msgSend(v108, "nonSquareYawDefault");
                    else
                      v61 = (*((float (**)(void *))v59 + 2))(v59);
                    v56 = v61;
                  }
                  v62 = expf(v52);
                  v63 = expf(v53);
                  v64 = [VNShotflowDetection alloc];
                  v65 = (_QWORD *)objc_msgSend(v108, "importantClasses");
                  *(float *)&v76 = v56;
                  v66 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:hasLabel:label:](v64, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:hasLabel:label:", v107, v65[1] - *v65 > 8uLL, v48, (float)((float)((float)(v86 + (float)((float)v93 * v87)) / v106)+ (float)(v51 * (float)(v50 / v106)))- (float)((float)(v50 / v106) * v62) * 0.5, 1.0- (float)((float)((float)(v82 + (float)((float)v84 * v87)) / v104)+ (float)(v113 * (float)(v111 / v104)))- (float)((float)(v111 / v104) * v63) * 0.5, __PAIR64__(LODWORD(v57), LODWORD(v49)), v76);
                  objc_msgSend(v96, "addObject:", v66);

                  v27 = v102;
                }
                ++v47;
              }
              while (v47 != v46);
            }
            if (!v21)
            {
              v67 = v92;
              v34 = v89;
              v30 = v85 + 1;
              if (!v22)
                goto LABEL_76;
              goto LABEL_68;
            }
            v67 = v92;
            v34 = v89;
            v30 = v85 + 1;
            if (!v109 || isAnchorSquare[v95])
            {
              v21 += 4;
              if (!v22)
                goto LABEL_76;
LABEL_68:
              if (v109)
              {
                v68 = isAnchorSquare[v95];
LABEL_72:
                v69 = !v68;
                v70 = v109;
                if (!v69)
                  v70 = 0;
                if ((v70 & 1) != 0)
                {
LABEL_76:
                  v18 = v91 + 1;
                  v20 = v67 + 1;
                  ++v24;
                  if ((float *)++v93 == v90)
                    goto LABEL_77;
                  continue;
                }
              }
              v22 += 4;
              goto LABEL_76;
            }
            break;
          }
          if (!v22)
            goto LABEL_76;
          v68 = 0;
          goto LABEL_72;
        }
LABEL_78:
        if (!v21)
          goto LABEL_82;
        if (!v109 || isAnchorSquare[v95])
          break;
        if (v22)
        {
          v71 = 0;
          goto LABEL_87;
        }
LABEL_91:
        v20 += v81;
        v18 += v80;
        v24 += 3 * v100;
        if (++v95 == v79)
          goto LABEL_92;
      }
      v21 += 4 * (v99 - 1) * v101;
LABEL_82:
      if (v22)
      {
        if (v109)
        {
          v71 = isAnchorSquare[v95];
LABEL_87:
          v69 = !v71;
          v72 = v109;
          if (!v69)
            v72 = 0;
          if ((v72 & 1) != 0)
            goto LABEL_91;
        }
        v22 += 4 * (v97 - 1) * v98;
        goto LABEL_91;
      }
      goto LABEL_91;
    }
LABEL_92:
    if (v117[0])
    {
      v117[1] = v117[0];
      operator delete(v117[0]);
    }
    v6 = v77;
    if (v27)
      operator delete(v27);
    v11 = v107 + 1;
  }
  while (v107 != 5);
  return v96;
}

- (id)resizeAndProcessVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  vImagePixelCount width;
  vImagePixelCount height;
  BOOL v6;
  _BOOL8 v7;
  float v10;
  float v11;
  float v12;
  float v13;
  __int128 v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  vImagePixelCount v21;
  vImagePixelCount v22;
  vImagePixelCount v23;
  vImagePixelCount v24;
  double v25;
  float v26;
  double v27;
  float v28;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  float v58;
  double v59;
  vImagePixelCount v60;
  float v61;
  double v62;
  float v63;
  double v64;
  float v65;
  float v66;
  double v67;
  _QWORD *exception;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;
  int v74;
  int v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  vImage_Buffer v80;
  uint8_t color[4];
  vImage_Buffer dest;
  vImage_Buffer backColor;
  vImage_Buffer buf;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  height = a3->height;
  width = a3->width;
  if (width)
    v6 = height == 0;
  else
    v6 = 1;
  if (v6)
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 6012;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  v7 = a4;
  v10 = (float)width;
  v11 = (float)height;
  if ((float)height <= (float)width)
  {
    v14 = *(_OWORD *)&a3->width;
    *(_OWORD *)&buf.data = *(_OWORD *)&a3->data;
    *(_OWORD *)&buf.width = v14;
    v13 = (float)height;
    v12 = (float)width;
  }
  else
  {
    LODWORD(backColor.data) = 0;
    if (vImageBuffer_Init(&buf, v10, v11, 0x20u, 0))
    {
      v73 = __cxa_allocate_exception(8uLL);
      *v73 = 6010;
      __cxa_throw(v73, MEMORY[0x1E0DE4F28], 0);
    }
    vImageRotate90_ARGB8888(a3, &buf, 1u, (const uint8_t *)&backColor, 0);
    v12 = (float)buf.width;
    v13 = (float)buf.height;
  }
  v15 = (void *)objc_opt_class();
  objc_msgSend(v15, "inputImageMaxDimension");
  v17 = v16;
  objc_msgSend(v15, "inputImageMinDimension");
  v19 = v18;
  objc_msgSend(v15, "inputImageAspectRatio");
  v21 = (unint64_t)v17;
  v22 = (unint64_t)v19;
  if ((float)(v12 / v13) < v20)
    v23 = (unint64_t)(float)((float)(v12 / v13) * (float)(unint64_t)v19);
  else
    v23 = (unint64_t)v17;
  if ((float)(v12 / v13) < v20)
    v24 = (unint64_t)v19;
  else
    v24 = (unint64_t)(float)((float)(v13 / v12) * (float)(unint64_t)v17);
  objc_msgSend((id)objc_opt_class(), "inputImageSize");
  memset(&backColor, 0, sizeof(backColor));
  v26 = (float)(unint64_t)v25;
  v28 = (float)(unint64_t)v27;
  if (v12 == v26 && v13 == v28)
  {
    v75 = 0;
    backColor = buf;
    memset(&dest, 0, sizeof(dest));
  }
  else
  {
    if (vImageBuffer_Init(&backColor, v24, v23, 0x20u, 0))
    {
      v70 = __cxa_allocate_exception(8uLL);
      *v70 = 6010;
      __cxa_throw(v70, MEMORY[0x1E0DE4F28], 0);
    }
    vImageScale_ARGB8888(&buf, &backColor, 0, 0x20u);
    memset(&dest, 0, sizeof(dest));
    if (v12 != v26)
    {
      v75 = 1;
      goto LABEL_25;
    }
    v75 = 1;
  }
  if (v13 == v28)
  {
    v74 = 0;
    dest = backColor;
    goto LABEL_31;
  }
LABEL_25:
  if (vImageBuffer_Init(&dest, v22, v21, 0x20u, 0))
  {
    v71 = __cxa_allocate_exception(8uLL);
    *v71 = 6010;
    __cxa_throw(v71, MEMORY[0x1E0DE4F28], 0);
  }
  *(_DWORD *)color = -16777216;
  if (vImageBufferFill_ARGB8888(&dest, color, 0))
  {
    v72 = __cxa_allocate_exception(8uLL);
    *v72 = 6010;
    __cxa_throw(v72, MEMORY[0x1E0DE4F28], 0);
  }
  if (SLODWORD(backColor.height) >= 1)
  {
    v30 = 0;
    do
    {
      memcpy((char *)dest.data + dest.rowBytes * v30, (char *)backColor.data + backColor.rowBytes * v30, 4 * backColor.width);
      ++v30;
    }
    while (v30 < SLODWORD(backColor.height));
  }
  v74 = 1;
LABEL_31:
  v31 = (id)MEMORY[0x1E0C9AA60];
  if (v21 <= 0x4000 && v22 <= 0x4000)
  {
    v80 = dest;
    -[VNShotflowNetwork processVImage:inputIsBGR:](self, "processVImage:inputIsBGR:", &v80, v7);
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v77 != v33)
            objc_enumerationMutation(v31);
          v35 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          objc_msgSend(v35, "box");
          v36 = (double)dest.width / (double)backColor.width;
          v38 = v37 * v36;
          v40 = 1.0 - (1.0 - v39) * (double)dest.height / (double)backColor.height;
          v42 = v41 * v36;
          v44 = v43 * ((double)dest.height / (double)backColor.height);
          v45 = 1.0 - (v38 + v42);
          if (v11 <= v10)
          {
            v46 = v42;
          }
          else
          {
            v38 = v40;
            v40 = v45;
            v46 = v44;
          }
          if (v11 > v10)
            v44 = v42;
          objc_msgSend(v35, "setBox:", v38, v40, v46, v44);
          objc_msgSend(v35, "defaultBox");
          v47 = (double)dest.width / (double)backColor.width;
          v49 = v48 * v47;
          v51 = 1.0 - (1.0 - v50) * (double)dest.height / (double)backColor.height;
          v53 = v52 * v47;
          v55 = v54 * ((double)dest.height / (double)backColor.height);
          v56 = 1.0 - (v49 + v53);
          if (v11 <= v10)
          {
            v57 = v53;
          }
          else
          {
            v49 = v51;
            v51 = v56;
            v57 = v55;
          }
          if (v11 > v10)
            v55 = v53;
          objc_msgSend(v35, "setDefaultBox:", v49, v51, v57, v55);
          if (v11 > v10 && objc_msgSend(v15, "hasPose"))
          {
            objc_msgSend(v35, "rotationAngle");
            *(float *)&v59 = fmodf((float)((float)(v58 + -90.0) + 180.0) + 360.0, 360.0) + -180.0;
            objc_msgSend(v35, "setRotationAngle:", v59);
          }
          if (objc_msgSend(v15, "hasFaceBodyAssociation"))
          {
            v60 = backColor.width;
            objc_msgSend(v35, "associatedX");
            v62 = v61 / (double)v60;
            *(float *)&v62 = v62;
            objc_msgSend(v35, "setAssociatedX:", v62);
            objc_msgSend(v35, "associatedY");
            v64 = 1.0 - v63 / (double)backColor.height;
            *(float *)&v64 = v64;
            objc_msgSend(v35, "setAssociatedY:", v64);
            if (v11 > v10)
            {
              objc_msgSend(v35, "associatedX");
              v66 = v65;
              objc_msgSend(v35, "associatedY");
              objc_msgSend(v35, "setAssociatedX:");
              *(float *)&v67 = 1.0 - v66;
              objc_msgSend(v35, "setAssociatedY:", v67);
            }
          }
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
      }
      while (v32);
    }

    if (v74)
      free(dest.data);
    dest.data = 0;
    if (v75)
      free(backColor.data);
    backColor.data = 0;
    if (v11 > v10)
      free(buf.data);
    buf.data = 0;
  }
  return v31;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (unint64_t)preferredSmallSide
{
  return self->_preferredSmallSide;
}

- (void).cxx_destruct
{
  vector<std::shared_ptr<espresso_buffer_t>, std::allocator<std::shared_ptr<espresso_buffer_t>>> *p_yawOutputs;

  p_yawOutputs = &self->_yawOutputs;
  std::vector<std::shared_ptr<rtcv::Logger::Target>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_yawOutputs);
  p_yawOutputs = &self->_rollOutputs;
  std::vector<std::shared_ptr<rtcv::Logger::Target>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_yawOutputs);
  p_yawOutputs = &self->_offsetsOutputs;
  std::vector<std::shared_ptr<rtcv::Logger::Target>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_yawOutputs);
  p_yawOutputs = &self->_logitsNegOutputs;
  std::vector<std::shared_ptr<rtcv::Logger::Target>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_yawOutputs);
  p_yawOutputs = &self->_logitsPosOutputs;
  std::vector<std::shared_ptr<rtcv::Logger::Target>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_yawOutputs);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 19) = 0;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

float __46__VNShotflowNetwork_processVImage_inputIsBGR___block_invoke(_QWORD *a1)
{
  unint64_t v1;
  unint64_t v2;
  float *v3;
  unint64_t v4;
  float v5;
  float v6;

  v1 = a1[4];
  if (v1)
  {
    v2 = 0;
    v3 = (float *)a1[5];
    v4 = -1;
    v5 = 1.1755e-38;
    do
    {
      if (*v3 > v5)
      {
        v5 = *v3;
        v4 = v2;
      }
      ++v2;
      v3 += a1[6];
    }
    while (v1 != v2);
    v6 = (float)v4;
  }
  else
  {
    v6 = 1.8447e19;
  }
  return (float)((float)(360.0 / (float)v1) * v6) + -180.0;
}

float __46__VNShotflowNetwork_processVImage_inputIsBGR___block_invoke_2(_QWORD *a1)
{
  unint64_t v1;
  unint64_t v2;
  float *v3;
  unint64_t v4;
  float v5;
  float v6;

  v1 = a1[4];
  if (v1)
  {
    v2 = 0;
    v3 = (float *)a1[5];
    v4 = -1;
    v5 = 1.1755e-38;
    do
    {
      if (*v3 > v5)
      {
        v5 = *v3;
        v4 = v2;
      }
      ++v2;
      v3 += a1[6];
    }
    while (v1 != v2);
    v6 = (float)v4;
  }
  else
  {
    v6 = 1.8447e19;
  }
  return (float)((float)(225.0 / (float)v1) * v6) + -90.0;
}

+ (NSString)inputLayerName
{
  return (NSString *)CFSTR("image");
}

+ (float)inputImageMinDimension
{
  double v2;
  double v3;

  objc_msgSend(a1, "inputImageSize");
  if (v3 < v2)
    return v3;
  return v2;
}

+ (float)inputImageMaxDimension
{
  double v2;
  double v3;

  objc_msgSend(a1, "inputImageSize");
  if (v2 < v3)
    return v3;
  return v2;
}

+ (float)inputImageAspectRatio
{
  float v3;
  float v4;
  float v5;

  objc_msgSend(a1, "inputImageMaxDimension");
  v4 = v3;
  objc_msgSend(a1, "inputImageMinDimension");
  return v4 / v5;
}

+ (float)nonSquareRollDefault
{
  return 0.0;
}

+ (float)nonSquareYawDefault
{
  return 0.0;
}

+ (const)strides
{
  if (+[VNShotflowNetwork strides]::onceToken != -1)
    dispatch_once(&+[VNShotflowNetwork strides]::onceToken, &__block_literal_global_29915);
  return (const void *)+[VNShotflowNetwork strides]::strides;
}

+ (const)defaultBoxesSides
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VNShotflowNetwork_defaultBoxesSides__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowNetwork defaultBoxesSides]::onceToken != -1)
    dispatch_once(&+[VNShotflowNetwork defaultBoxesSides]::onceToken, block);
  return (const void *)+[VNShotflowNetwork defaultBoxesSides]::defaultBoxesSides;
}

+ (float)inputScale
{
  return 0.0039216;
}

+ (tuple<float,)inputBiasRGB
{
  float v2;
  float v3;
  float v4;
  tuple<float, float, float> result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  result.var0.var2 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

+ (BOOL)inputBGR
{
  return 0;
}

+ (BOOL)hasPose
{
  return 1;
}

+ (BOOL)hasPetFaces
{
  return 0;
}

+ (BOOL)hasFaceBodyAssociation
{
  return 0;
}

+ (unint64_t)numberBinsRoll
{
  return 12;
}

+ (unint64_t)numberBinsYaw
{
  return 5;
}

+ (id)processingDeviceNetworkWithModelPath:(id)a3 threshold:(float)a4 preferredDeviceID:(int)a5 engineID:(int)a6 storageType:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  double v14;
  void *v15;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = objc_alloc((Class)a1);
  *(float *)&v14 = a4;
  v15 = (void *)objc_msgSend(v13, "initWithModelPath:espressoEngineID:espressoDeviceID:espressoStorageType:threshold:", v12, v8, v9, v7, v14);

  return v15;
}

+ (id)processingDeviceDetectorWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4 threshold:(float)a5
{
  uint64_t v7;
  void *var0;
  id v9;
  double v10;

  v7 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  v9 = objc_alloc((Class)a1);
  *(float *)&v10 = a5;
  return (id)objc_msgSend(v9, "initWithEspressoNetwork:espressoPlan:threshold:", var0, v7, a4, v10);
}

float32x2_t __38__VNShotflowNetwork_defaultBoxesSides__block_invoke(uint64_t a1)
{
  int32x2_t v1;
  _QWORD *v2;
  float32x2_t *v3;
  float32x2_t result;
  int32x2_t v5;

  objc_msgSend(*(id *)(a1 + 32), "inputImageMinDimension");
  v5 = v1;
  v2 = (_QWORD *)operator new();
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  v3 = (float32x2_t *)operator new(0x18uLL);
  result = vmul_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(v5, 0), (float32x2_t)0x3F6666663F19999ALL);
  v2[1] = v3 + 3;
  v2[2] = v3 + 3;
  *(float32x4_t *)v3->f32 = vmulq_n_f32((float32x4_t)xmmword_1A15FB760, *(float *)v5.i32);
  v3[2] = result;
  *v2 = v3;
  +[VNShotflowNetwork defaultBoxesSides]::defaultBoxesSides = (uint64_t)v2;
  return result;
}

double __28__VNShotflowNetwork_strides__block_invoke()
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
  result = 33554440.1;
  *(_OWORD *)v1 = xmmword_1A15FA038;
  v1[2] = 0x4280000042800000;
  *v0 = v1;
  +[VNShotflowNetwork strides]::strides = (uint64_t)v0;
  return result;
}

@end

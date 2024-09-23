@implementation EspressoImage2Image

- ($C4732ECC957FA13B9B3DF4A51A95735B)getEspressoNetwork
{
  uint64_t v2;
  void *plan;
  $C4732ECC957FA13B9B3DF4A51A95735B result;

  v2 = *(_QWORD *)&self->net.network_index;
  plan = self->net.plan;
  result.var1 = v2;
  result.var0 = plan;
  return result;
}

- (id)getInternalDataForKey:(id)a3
{
  _DWORD *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v9;
  unint64_t v10;
  _DWORD *v11;
  int v12;
  double v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *lpsrc;
  std::__shared_weak_count *v19;
  _DWORD *v20;
  std::__shared_weak_count *v21;

  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("averagegputime")))
    return 0;
  Espresso::get_internal_context((uint64_t **)self->ctx, &lpsrc);
  if (lpsrc
  {
    v5 = v19;
    v20 = v4;
    v21 = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
LABEL_10:
      v9 = (unint64_t *)&v5->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  else
  {
    v20 = 0;
    v21 = 0;
    v5 = v19;
    if (v19)
      goto LABEL_10;
  }
  v11 = v20;
  v12 = v20[54];
  if (v12)
    v13 = *((double *)v20 + 25) / (double)v12;
  else
    v13 = 0.0;
  *((_QWORD *)v20 + 25) = 0;
  *((_QWORD *)v11 + 26) = 0;
  v11[54] = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v21;
  if (v21)
  {
    v16 = (unint64_t *)&v21->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v14;
}

- (id)styleName
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> *p_pair1;

  p_pair1 = &self->tweaks.__tree_.__pair1_;
  if (self->current_postprocessing_settings.name.__r_.__value_.var0.__s.__data_[7] < 0)
    p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> *)p_pair1->__value_.__left_;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), p_pair1);
}

- (id)setupWithQueue:(id)a3
{
  id v5;
  _opaque_pthread_mutex_t *v6;
  float v7;
  MTLCommandQueue *v8;
  MTLCommandQueue *queue;
  int64_t v10;
  void *var0;
  void *context_with_args;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  EspressoLight *v17;
  EspressoLight *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  int v25;
  char v26;
  int16x8_t v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  _QWORD *ctx;
  uint64_t v37;
  const void *v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  _DWORD *v42;
  unint64_t *v43;
  unint64_t v44;
  EspressoImage2Image *v45;
  unint64_t *v46;
  unint64_t v47;
  _DWORD *v48;
  Espresso::wisdom_trainer2 *v49;
  uint64_t v50;
  uint64_t v51;
  size_t v52;
  std::string *v53;
  const void *v54;
  int v55;
  const std::string::value_type *v56;
  std::string::size_type v57;
  std::string *v58;
  __int128 v59;
  void **v60;
  int v61;
  void **v62;
  uint64_t v63;
  void *v64;
  void **v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  std::string v70;
  void *lpsrc[2];
  int64_t v72;
  _DWORD *v73;
  std::__shared_weak_count *v74;
  pthread_mutex_t *v75;

  v5 = a3;
  HIDWORD(self->dim_small[4]) = 2;
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v75, v6);
  if (Espresso::time_seconds(void)::onceToken != -1)
    dispatch_once(&Espresso::time_seconds(void)::onceToken, &__block_literal_global_349);
  v7 = (double)(std::chrono::steady_clock::now().__d_.__rep_ - Espresso::time_seconds(void)::t0) * 0.000000001;
  *(float *)&self->dim_small[4] = v7;
  v8 = (MTLCommandQueue *)dispatch_queue_create("com.apple.EspressoImage2ImageQ", 0);
  queue = self->queue;
  self->queue = v8;

  if (v5)
  {
    objc_storeStrong((id *)&self->output_layer_name.__r_.var0, a3);
    objc_msgSend(v5, "device");
    v10 = objc_claimAutoreleasedReturnValue();
    var0 = (void *)self->output_layer_name.var0;
    self->output_layer_name.var0 = v10;

    context_with_args = (void *)espresso_create_context_with_args(default_engine, 0xFFFFFFFF, *(id *)&self->output_layer_name.__r_.var0, 0);
  }
  else
  {
    v13 = MTLCreateSystemDefaultDevice();
    v14 = (void *)self->output_layer_name.var0;
    self->output_layer_name.var0 = (int64_t)v13;

    v15 = objc_msgSend((id)self->output_layer_name.var0, "newCommandQueue");
    v16 = *(void **)&self->output_layer_name.__r_.var0;
    *(_QWORD *)&self->output_layer_name.__r_.var0 = v15;

    context_with_args = (void *)espresso_create_context(default_engine, 0xFFFFFFFF);
  }
  self->ctx = context_with_args;
  Espresso::get_internal_context((uint64_t **)context_with_args, lpsrc);
  v17 = (EspressoLight *)lpsrc[0];
  if (!lpsrc[0])
  {
    v18 = 0;
    goto LABEL_13;
  }
  v18 = v17;
  if (!v17)
  {
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  v19 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1])
  {
    v20 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
LABEL_14:
  v22 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1])
  {
    v23 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (v18)
  {
    v25 = v9_force_instancenorm_subsampling;
    *((_DWORD *)v18 + 57) = 1;
    *((_DWORD *)v18 + 58) = v25;
    v26 = v9_optimizations_disabled_bitfield;
    if (v9_optimizations_disabled_bitfield)
    {
      v27 = (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(v9_optimizations_disabled_bitfield), (int8x16_t)xmmword_191A93380));
      *(int8x8_t *)v27.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v27), (int8x8_t)0x1000100010001);
      *((_DWORD *)v18 + 55) = vmovn_s16(v27).u32[0];
      *((_BYTE *)v18 + 224) = (v26 & 0x10) == 0;
    }
  }
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v29 = __ldaxr(p_shared_owners);
    while (__stlxr(v29 - 1, p_shared_owners));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (experimental_mode)
  {
    Espresso::get_internal_context((uint64_t **)self->ctx, lpsrc);
    v30 = (std::__shared_weak_count *)lpsrc[1];
    *((_BYTE *)lpsrc[0] + 53) = 1;
    if (v30)
    {
      v31 = (unint64_t *)&v30->__shared_owners_;
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    Espresso::get_internal_context((uint64_t **)self->ctx, lpsrc);
    v33 = (std::__shared_weak_count *)lpsrc[1];
    *((_BYTE *)lpsrc[0] + 44) = 0;
    if (v33)
    {
      v34 = (unint64_t *)&v33->__shared_owners_;
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
  }
  ctx = self->ctx;
  if (!ctx)
  {
    v45 = 0;
    goto LABEL_97;
  }
  if (*ctx == 0x50FBC8A8A6F7B03CLL)
  {
    v37 = ctx[2];
    v38 = *(const void **)v37;
    v39 = *(std::__shared_weak_count **)(v37 + 8);
    if (v39)
    {
      v40 = (unint64_t *)&v39->__shared_owners_;
      do
        v41 = __ldxr(v40);
      while (__stxr(v41 + 1, v40));
    }
    if (v38
    {
      v73 = v42;
      v74 = v39;
      if (v39)
      {
        v43 = (unint64_t *)&v39->__shared_owners_;
        do
          v44 = __ldxr(v43);
        while (__stxr(v44 + 1, v43));
LABEL_52:
        v46 = (unint64_t *)&v39->__shared_owners_;
        do
          v47 = __ldaxr(v46);
        while (__stlxr(v47 - 1, v46));
        if (!v47)
        {
          ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
          std::__shared_weak_count::__release_weak(v39);
        }
      }
    }
    else
    {
      v73 = 0;
      v74 = 0;
      if (v39)
        goto LABEL_52;
    }
  }
  else
  {
    EspressoLight::very_bad_client(v17);
    v73 = 0;
    v74 = 0;
  }
  v48 = v73;
  v73[17] = 1;
  v49 = (Espresso::wisdom_trainer2 *)*((_QWORD *)v48 + 3);
  if (objc_msgSend((id)self->output_layer_name.var0, "supportsFeatureSet:", 11))
  {
    *((_BYTE *)v49 + 12) = 1;
    if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1)
      dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_12627);
    v50 = *(_QWORD *)(Espresso::Image2Image::settings_t::shared(void)::global + 32);
    if (*(char *)(Espresso::Image2Image::settings_t::shared(void)::global + 47) >= 0)
      v50 = *(unsigned __int8 *)(Espresso::Image2Image::settings_t::shared(void)::global + 47);
    if (v50)
    {
      v51 = Espresso::Image2Image::settings_t::shared(void)::global;
      if (*(char *)(Espresso::Image2Image::settings_t::shared(void)::global + 71) >= 0)
        v52 = *(unsigned __int8 *)(Espresso::Image2Image::settings_t::shared(void)::global + 71);
      else
        v52 = *(_QWORD *)(Espresso::Image2Image::settings_t::shared(void)::global + 56);
      v53 = &v70;
      std::string::basic_string[abi:ne180100]((uint64_t)&v70, v52 + 1);
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v53 = (std::string *)v70.__r_.__value_.__r.__words[0];
      if (v52)
      {
        if (*(char *)(v51 + 71) >= 0)
          v54 = (const void *)(v51 + 48);
        else
          v54 = *(const void **)(v51 + 48);
        memmove(v53, v54, v52);
      }
      *(_WORD *)((char *)&v53->__r_.__value_.__l.__data_ + v52) = 47;
      if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1)
        dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_12627);
      v55 = *(char *)(Espresso::Image2Image::settings_t::shared(void)::global + 47);
      if (v55 >= 0)
        v56 = (const std::string::value_type *)(Espresso::Image2Image::settings_t::shared(void)::global + 24);
      else
        v56 = *(const std::string::value_type **)(Espresso::Image2Image::settings_t::shared(void)::global + 24);
      if (v55 >= 0)
        v57 = *(unsigned __int8 *)(Espresso::Image2Image::settings_t::shared(void)::global + 47);
      else
        v57 = *(_QWORD *)(Espresso::Image2Image::settings_t::shared(void)::global + 32);
      v58 = std::string::append(&v70, v56, v57);
      v59 = *(_OWORD *)&v58->__r_.__value_.__l.__data_;
      v72 = v58->__r_.__value_.__r.__words[2];
      *(_OWORD *)lpsrc = v59;
      v58->__r_.__value_.__l.__size_ = 0;
      v58->__r_.__value_.__r.__words[2] = 0;
      v58->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v70.__r_.__value_.__l.__data_);
      if (v72 >= 0)
        v60 = lpsrc;
      else
        v60 = (void **)lpsrc[0];
      Espresso::wisdom_trainer2::load(v49, (const char *)v60);
      if (experimental_mode)
      {
        v61 = SHIBYTE(v72);
        v62 = (void **)lpsrc[0];
        Espresso::wisdom_trainer2::to_dict(v49);
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = (void *)v63;
        v65 = lpsrc;
        if (v61 < 0)
          v65 = v62;
        NSLog(CFSTR("loaded wisdom: %s %@"), v65, v63);

      }
      if (SHIBYTE(v72) < 0)
        operator delete(lpsrc[0]);
    }
    else
    {
      Espresso::wisdom_trainer2::from_dict(v49, (NSDictionary *)&unk_1E2DEE160);
    }
  }
  v45 = self;
  v66 = v74;
  if (v74)
  {
    v67 = (unint64_t *)&v74->__shared_owners_;
    do
      v68 = __ldaxr(v67);
    while (__stlxr(v68 - 1, v67));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
      std::__shared_weak_count::__release_weak(v66);
    }
  }
LABEL_97:
  pthread_mutex_locker::~pthread_mutex_locker(&v75);

  return v45;
}

- (EspressoImage2Image)initWithQueue:(id)a3
{
  id v4;
  EspressoImage2Image *v5;
  EspressoImage2Image *v6;
  EspressoImage2Image *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EspressoImage2Image;
  v5 = -[EspressoImage2Image init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[EspressoImage2Image setupWithQueue:](v5, "setupWithQueue:", v4);
    v7 = (EspressoImage2Image *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (EspressoImage2Image)init
{
  EspressoImage2Image *v2;
  EspressoImage2Image *v3;
  EspressoImage2Image *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EspressoImage2Image;
  v2 = -[EspressoImage2Image init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[EspressoImage2Image setupWithQueue:](v2, "setupWithQueue:", 0);
    v4 = (EspressoImage2Image *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  void *plan;
  objc_super v4;
  pthread_mutex_t *v5;

  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v5, (_opaque_pthread_mutex_t *)a2);
  plan = self->plan;
  if (plan)
    espresso_plan_destroy((std::string::size_type)plan);
  espresso_context_destroy((_QWORD *)self->ctx);
  pthread_mutex_locker::~pthread_mutex_locker(&v5);
  v4.receiver = self;
  v4.super_class = (Class)EspressoImage2Image;
  -[EspressoImage2Image dealloc](&v4, sel_dealloc);
}

- (int)width
{
  return (int)self->dispatch_queue;
}

- (int)height
{
  return *(_DWORD *)&self->is_temporal_model;
}

- (void)addNoiseLayer
{
  uint64_t *v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unsigned __int8 *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  shared_ptr<Espresso::V9Engine::v9_noise_kernel> *p_noise_k;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *size;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *p_shared_owners;
  unint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  v9_noise_kernel *ptr;
  __int128 *v62;
  _QWORD *v63;
  int v64;
  void *v65;
  unint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  char *v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  void *v80;
  unint64_t *v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t i;
  unint64_t *v90;
  unint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  _QWORD *v101;
  uint64_t v102;
  __int128 v103;
  NSString *currentNetworkPath;
  unint64_t v105;
  uint64_t v106;
  __int128 v107;
  int v108;
  unint64_t v109;
  float v110;
  std::__shared_weak_count *v111;
  unint64_t *v112;
  unint64_t v113;
  uint64_t v114;
  int v115;
  float v116;
  float *v117;
  unsigned int v118;
  float v119;
  unsigned int v120;
  unsigned int v121;
  BOOL v122;
  unsigned int v123;
  int v124;
  unsigned int v125;
  float v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  int v130;
  float v131;
  float v132;
  float v133;
  float v134;
  std::__shared_weak_count *v135;
  unint64_t *v136;
  std::__shared_weak_count_vtbl *v137;
  v9_noise_kernel *v138;
  unint64_t v139;
  unint64_t v140;
  std::__shared_weak_count *v141;
  unint64_t *v142;
  unint64_t v143;
  _QWORD *v144;
  unsigned __int8 *v145;
  unsigned __int8 *v146;
  char v147;
  uint64_t v148;
  char v149;
  char *v150;
  uint64_t **v151;
  _OWORD *v152;
  __int128 v153;
  int v154;
  void *v155;
  std::__shared_weak_count *v156;
  unint64_t *v157;
  unint64_t v158;
  uint64_t v159;
  unint64_t v160;
  __int128 v161;
  unint64_t *v162;
  unint64_t v163;
  _QWORD *v164;
  _QWORD *v165;
  unsigned __int8 *v166;
  unsigned __int8 *v167;
  uint64_t v168;
  char *v169;
  char *v170;
  _QWORD *v171;
  unint64_t v172;
  uint64_t v173;
  unint64_t *v174;
  unint64_t v175;
  _QWORD *v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  uint64_t v180;
  unint64_t v181;
  char *v182;
  uint64_t v183;
  char *v184;
  __int128 v185;
  unint64_t *v186;
  unint64_t v187;
  _QWORD *v188;
  _QWORD *v189;
  char *v190;
  __int128 v191;
  int64x2_t v192;
  uint64_t v193;
  _QWORD *v194;
  _QWORD *v195;
  unsigned __int8 *v196;
  unsigned __int8 *v197;
  uint64_t v198;
  char *v199;
  char *v200;
  _QWORD *v201;
  unint64_t v202;
  uint64_t v203;
  unint64_t *v204;
  unint64_t v205;
  _QWORD *v206;
  uint64_t v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t v210;
  unint64_t v211;
  char *v212;
  uint64_t v213;
  char *v214;
  __int128 v215;
  unint64_t *v216;
  unint64_t v217;
  _QWORD *v218;
  _QWORD *v219;
  char *v220;
  __int128 v221;
  int64x2_t v222;
  uint64_t v223;
  std::__shared_weak_count *v224;
  unint64_t *v225;
  unint64_t v226;
  uint64_t v227;
  std::__shared_weak_count *v228;
  unint64_t *v229;
  unint64_t v230;
  _QWORD *v231;
  uint64_t v232;
  std::__shared_weak_count *v233;
  unint64_t *v234;
  unint64_t v235;
  std::__shared_weak_count *v236;
  unint64_t *v237;
  unint64_t v238;
  uint64_t v239;
  _QWORD *v240;
  void *v241;
  unint64_t *v242;
  unint64_t v243;
  std::__shared_weak_count *v244;
  unint64_t *v245;
  unint64_t v246;
  std::__shared_weak_count *v247;
  unint64_t *v248;
  unint64_t v249;
  std::__shared_weak_count *v250;
  unint64_t *v251;
  unint64_t v252;
  char *v253;
  uint64_t v254;
  int v255;
  uint64_t v256;
  unint64_t *v257;
  unint64_t v258;
  std::__shared_weak_count *v259;
  unint64_t *v260;
  unint64_t v261;
  std::__shared_weak_count *v262;
  unint64_t *v263;
  unint64_t v264;
  std::runtime_error *exception;
  uint64_t v266;
  std::__shared_weak_count *v267;
  uint64_t v268;
  std::__shared_weak_count *v269;
  _QWORD v270[2];
  __int128 v271;
  uint64_t v272;
  int v273;
  int v274;
  void *v275;
  std::__shared_weak_count *v276;
  _BYTE __p[40];
  __int128 v278;
  __int128 v279;
  __int128 v280;
  unint64_t v281;
  _QWORD *v282;
  std::__shared_weak_count *v283;
  __int128 *p_str;
  std::__shared_weak_count *v285;
  void *lpsrc[2];
  uint64_t v287;
  char v288;
  uint64_t v289;
  std::string __str;
  __int128 v291;
  uint64_t v292;
  __int128 v293;
  uint64_t v294;
  _QWORD v295[3];

  v295[0] = *MEMORY[0x1E0C80C00];
  Espresso::get_internal_network((uint64_t)self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)&v282);
  v3 = (uint64_t *)v282[4];
  v4 = *v3;
  v5 = *(const void **)(*v3 + 64);
  if (v5
  {
    v7 = *(_QWORD *)(v4 + 72);
    *(_QWORD *)__p = v6;
    *(_QWORD *)&__p[8] = v7;
    if (v7)
    {
      v8 = (unint64_t *)(v7 + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
  }
  else
  {
    *(_QWORD *)__p = 0;
    *(_QWORD *)&__p[8] = 0;
  }
  v10 = &self->_anon_108[120];
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->_anon_108[120], (__int128 *)__p);
  v11 = *(std::__shared_weak_count **)&__p[8];
  if (*(_QWORD *)&__p[8])
  {
    v12 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = (uint64_t *)v282[4];
  v15 = *v14;
  v16 = *(const void **)(*v14 + 64);
  if (v16
  {
    v18 = *(_QWORD *)(v15 + 72);
    *(_QWORD *)__p = v17;
    *(_QWORD *)&__p[8] = v18;
    if (v18)
    {
      v19 = (unint64_t *)(v18 + 8);
      do
        v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
    }
  }
  else
  {
    *(_QWORD *)__p = 0;
    *(_QWORD *)&__p[8] = 0;
  }
  p_noise_k = &self->noise_k;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->noise_k, (__int128 *)__p);
  v22 = *(std::__shared_weak_count **)&__p[8];
  if (*(_QWORD *)&__p[8])
  {
    v23 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v280 = xmmword_191A8AA80;
  v281 = 0xFFFFFFFF00000001;
  LODWORD(v280) = -[EspressoImage2Image width](self, "width") / SHIDWORD(self->dim_small[4]);
  v25 = -[EspressoImage2Image height](self, "height") / SHIDWORD(self->dim_small[4]);
  DWORD1(v280) = v25;
  *((_QWORD *)&v280 + 1) = 0x100000003;
  if (!(_DWORD)v280 || !v25)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Inconsistent state: 0 blob");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (*(_QWORD *)v10)
  {
    v26 = 0;
  }
  else
  {
    v26 = *(_DWORD *)&self->_anon_108[88];
    if (v26)
    {
      Espresso::abstract_engine_factory::shared(&v271);
      v27 = v271;
      v28 = v282;
      std::string::basic_string[abi:ne180100]<0>(__p, "noise");
      LODWORD(p_str) = (***(uint64_t (****)(_QWORD))(v28[2] + 8))(*(_QWORD *)(v28[2] + 8));
      LODWORD(v275) = 1;
      Espresso::abstract_engine_factory::make_kernel_priv(v27, (uint64_t)(v28 + 2), (uint64_t)__p, (uint64_t)&v280, (int *)&p_str);
      if (lpsrc[0]
      {
        __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
        __str.__r_.__value_.__l.__size_ = (std::string::size_type)lpsrc[1];
        if (lpsrc[1])
        {
          v30 = (unint64_t *)((char *)lpsrc[1] + 8);
          do
            v31 = __ldxr(v30);
          while (__stxr(v31 + 1, v30));
        }
      }
      else
      {
        *(_OWORD *)&__str.__r_.__value_.__l.__data_ = 0uLL;
      }
      std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->_anon_108[120], (__int128 *)&__str);
      size = (std::__shared_weak_count *)__str.__r_.__value_.__l.__size_;
      if (__str.__r_.__value_.__l.__size_)
      {
        v33 = (unint64_t *)(__str.__r_.__value_.__l.__size_ + 8);
        do
          v34 = __ldaxr(v33);
        while (__stlxr(v34 - 1, v33));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
          std::__shared_weak_count::__release_weak(size);
        }
      }
      v35 = (std::__shared_weak_count *)lpsrc[1];
      if (lpsrc[1])
      {
        v36 = (unint64_t *)((char *)lpsrc[1] + 8);
        do
          v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
      }
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      v38 = (std::__shared_weak_count *)*((_QWORD *)&v271 + 1);
      if (*((_QWORD *)&v271 + 1))
      {
        v39 = (unint64_t *)(*((_QWORD *)&v271 + 1) + 8);
        do
          v40 = __ldaxr(v39);
        while (__stlxr(v40 - 1, v39));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
      }
      *(_DWORD *)__p = 0;
      memset(&__p[8], 0, 32);
      v278 = 0u;
      v279 = 0u;
      *(_BYTE *)(*(_QWORD *)v10 + 376) = 0;
      v41 = (char *)operator new(0xF8uLL);
      *((_QWORD *)v41 + 1) = 0;
      *((_QWORD *)v41 + 2) = 0;
      *(_QWORD *)v41 = &off_1E2DBF0D0;
      *((_QWORD *)v41 + 3) = &off_1E2DA1A38;
      *(_OWORD *)(v41 + 56) = 0u;
      *(_OWORD *)(v41 + 72) = 0u;
      *(_OWORD *)(v41 + 88) = 0u;
      *(_OWORD *)(v41 + 104) = 0u;
      *(_OWORD *)(v41 + 120) = 0u;
      *(_OWORD *)(v41 + 136) = 0u;
      *(_OWORD *)(v41 + 152) = 0u;
      *(_OWORD *)(v41 + 40) = 0u;
      *(_OWORD *)(v41 + 161) = 0u;
      *((_OWORD *)v41 + 13) = 0u;
      *((_OWORD *)v41 + 14) = 0u;
      *((_QWORD *)v41 + 30) = 0;
      *(_QWORD *)&__p[8] = v41 + 24;
      *(_QWORD *)&__p[16] = v41;
      MEMORY[0x19401C808](v41 + 40, "noise_const");
      MEMORY[0x19401C808](*(_QWORD *)&__p[8] + 40, "noise");
      v42 = *(_QWORD *)&__p[8];
      v44 = *(_QWORD *)&self->_anon_108[120];
      v43 = *(_QWORD *)&self->_anon_108[128];
      if (v43)
      {
        v45 = (unint64_t *)(v43 + 8);
        do
          v46 = __ldxr(v45);
        while (__stxr(v46 + 1, v45));
      }
      v47 = *(std::__shared_weak_count **)(v42 + 72);
      *(_QWORD *)(v42 + 64) = v44;
      *(_QWORD *)(v42 + 72) = v43;
      if (v47)
      {
        p_shared_owners = (unint64_t *)&v47->__shared_owners_;
        do
          v49 = __ldaxr(p_shared_owners);
        while (__stlxr(v49 - 1, p_shared_owners));
        if (!v49)
        {
          ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
          std::__shared_weak_count::__release_weak(v47);
        }
      }
      v50 = (uint64_t)v282;
      v51 = (***(uint64_t (****)(_QWORD))(v282[2] + 8))(*(_QWORD *)(v282[2] + 8));
      v52 = *(_QWORD *)&__p[8];
      *(_DWORD *)(*(_QWORD *)&__p[8] + 8) = v51;
      *(_DWORD *)(v52 + 12) = 1;
      std::string::basic_string[abi:ne180100]<0>(&__str, "noise");
      std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)((char *)&v278 + 8), &__str, &v291, 1uLL);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)&__p[24], 0, 0, 0);
      *(_DWORD *)__p = -1;
      LODWORD(__str.__r_.__value_.__l.__data_) = -1;
      *(_OWORD *)&__str.__r_.__value_.__r.__words[1] = *(_OWORD *)&__p[8];
      if (*(_QWORD *)&__p[16])
      {
        v53 = (unint64_t *)(*(_QWORD *)&__p[16] + 8);
        do
          v54 = __ldxr(v53);
        while (__stxr(v54 + 1, v53));
      }
      v291 = 0uLL;
      v292 = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v291, *(uint64_t *)&__p[24], *(uint64_t *)&__p[32], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&__p[32] - *(_QWORD *)&__p[24]) >> 3));
      v293 = 0uLL;
      v294 = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v293, *((uint64_t *)&v278 + 1), v279, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v279 - *((_QWORD *)&v278 + 1)) >> 3));
      lpsrc[0] = 0;
      lpsrc[1] = 0;
      v287 = 0;
      *(_QWORD *)&v271 = lpsrc;
      BYTE8(v271) = 0;
      lpsrc[0] = operator new(0x48uLL);
      lpsrc[1] = lpsrc[0];
      v287 = (uint64_t)lpsrc[0] + 72;
      lpsrc[1] = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Espresso::net::new_layer_info>,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info*>((uint64_t)&v287, (uint64_t)&__str, (uint64_t)v295, (uint64_t)lpsrc[0]);
      Espresso::net::insert_layers(v50, (uint64_t *)lpsrc);
      *(_QWORD *)&v271 = lpsrc;
      std::vector<Espresso::net::new_layer_info>::__destroy_vector::operator()[abi:ne180100]((void ***)&v271);
      *(_QWORD *)&v271 = &v293;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v271);
      *(_QWORD *)&v271 = &v291;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v271);
      v55 = (std::__shared_weak_count *)__str.__r_.__value_.__r.__words[2];
      if (__str.__r_.__value_.__r.__words[2])
      {
        v56 = (unint64_t *)(__str.__r_.__value_.__r.__words[2] + 8);
        do
          v57 = __ldaxr(v56);
        while (__stlxr(v57 - 1, v56));
        if (!v57)
        {
          ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
          std::__shared_weak_count::__release_weak(v55);
        }
      }
      __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&v278 + 8;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
      __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[24];
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
      v58 = *(std::__shared_weak_count **)&__p[16];
      if (*(_QWORD *)&__p[16])
      {
        v59 = (unint64_t *)(*(_QWORD *)&__p[16] + 8);
        do
          v60 = __ldaxr(v59);
        while (__stlxr(v60 - 1, v59));
        if (!v60)
        {
          ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
          std::__shared_weak_count::__release_weak(v58);
        }
      }
      v26 = 1;
    }
  }
  ptr = p_noise_k->__ptr_;
  if (p_noise_k->__ptr_ || *(_DWORD *)&self->_anon_108[88])
  {
    if (!v26)
      goto LABEL_138;
  }
  else
  {
    Espresso::abstract_engine_factory::shared(&v271);
    v239 = v271;
    v240 = v282;
    std::string::basic_string[abi:ne180100]<0>(__p, "load_constant");
    LODWORD(p_str) = (***(uint64_t (****)(_QWORD))(v240[2] + 8))(*(_QWORD *)(v240[2] + 8));
    LODWORD(v275) = 1;
    Espresso::abstract_engine_factory::make_kernel_priv(v239, (uint64_t)(v240 + 2), (uint64_t)__p, (uint64_t)&v280, (int *)&p_str);
    if (lpsrc[0]
    {
      __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v241;
      __str.__r_.__value_.__l.__size_ = (std::string::size_type)lpsrc[1];
      if (lpsrc[1])
      {
        v242 = (unint64_t *)((char *)lpsrc[1] + 8);
        do
          v243 = __ldxr(v242);
        while (__stxr(v243 + 1, v242));
      }
    }
    else
    {
      *(_OWORD *)&__str.__r_.__value_.__l.__data_ = 0uLL;
    }
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->noise_k, (__int128 *)&__str);
    v244 = (std::__shared_weak_count *)__str.__r_.__value_.__l.__size_;
    if (__str.__r_.__value_.__l.__size_)
    {
      v245 = (unint64_t *)(__str.__r_.__value_.__l.__size_ + 8);
      do
        v246 = __ldaxr(v245);
      while (__stlxr(v246 - 1, v245));
      if (!v246)
      {
        ((void (*)(std::__shared_weak_count *))v244->__on_zero_shared)(v244);
        std::__shared_weak_count::__release_weak(v244);
      }
    }
    v247 = (std::__shared_weak_count *)lpsrc[1];
    if (lpsrc[1])
    {
      v248 = (unint64_t *)((char *)lpsrc[1] + 8);
      do
        v249 = __ldaxr(v248);
      while (__stlxr(v249 - 1, v248));
      if (!v249)
      {
        ((void (*)(std::__shared_weak_count *))v247->__on_zero_shared)(v247);
        std::__shared_weak_count::__release_weak(v247);
      }
    }
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
    v250 = (std::__shared_weak_count *)*((_QWORD *)&v271 + 1);
    if (*((_QWORD *)&v271 + 1))
    {
      v251 = (unint64_t *)(*((_QWORD *)&v271 + 1) + 8);
      do
        v252 = __ldaxr(v251);
      while (__stlxr(v252 - 1, v251));
      if (!v252)
      {
        ((void (*)(std::__shared_weak_count *))v250->__on_zero_shared)(v250);
        std::__shared_weak_count::__release_weak(v250);
      }
    }
    *(_DWORD *)__p = 0;
    memset(&__p[8], 0, 32);
    v278 = 0u;
    v279 = 0u;
    *((_BYTE *)p_noise_k->__ptr_ + 376) = 0;
    v253 = (char *)operator new(0xF8uLL);
    *((_QWORD *)v253 + 1) = 0;
    *((_QWORD *)v253 + 2) = 0;
    *(_QWORD *)v253 = &off_1E2DBF0D0;
    *((_QWORD *)v253 + 3) = &off_1E2DA1A38;
    *(_OWORD *)(v253 + 56) = 0u;
    *(_OWORD *)(v253 + 72) = 0u;
    *(_OWORD *)(v253 + 88) = 0u;
    *(_OWORD *)(v253 + 104) = 0u;
    *(_OWORD *)(v253 + 120) = 0u;
    *(_OWORD *)(v253 + 136) = 0u;
    *(_OWORD *)(v253 + 152) = 0u;
    *(_OWORD *)(v253 + 40) = 0u;
    *(_OWORD *)(v253 + 161) = 0u;
    *((_OWORD *)v253 + 13) = 0u;
    *((_OWORD *)v253 + 14) = 0u;
    *((_QWORD *)v253 + 30) = 0;
    *(_QWORD *)&__p[8] = v253 + 24;
    *(_QWORD *)&__p[16] = v253;
    MEMORY[0x19401C808](v253 + 40, "noise_const");
    MEMORY[0x19401C808](*(_QWORD *)&__p[8] + 40, "load_constant");
    std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)(*(_QWORD *)&__p[8] + 64), (uint64_t)self->noise_k.__ptr_, (uint64_t)self->noise_k.__cntrl_);
    v254 = (uint64_t)v282;
    v255 = (***(uint64_t (****)(_QWORD))(v282[2] + 8))(*(_QWORD *)(v282[2] + 8));
    v256 = *(_QWORD *)&__p[8];
    *(_DWORD *)(*(_QWORD *)&__p[8] + 8) = v255;
    *(_DWORD *)(v256 + 12) = 1;
    std::string::basic_string[abi:ne180100]<0>(&__str, "noise");
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)((char *)&v278 + 8), &__str, &v291, 1uLL);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)&__p[24], 0, 0, 0);
    *(_DWORD *)__p = -1;
    LODWORD(__str.__r_.__value_.__l.__data_) = -1;
    *(_OWORD *)&__str.__r_.__value_.__r.__words[1] = *(_OWORD *)&__p[8];
    if (*(_QWORD *)&__p[16])
    {
      v257 = (unint64_t *)(*(_QWORD *)&__p[16] + 8);
      do
        v258 = __ldxr(v257);
      while (__stxr(v258 + 1, v257));
    }
    v291 = 0uLL;
    v292 = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v291, *(uint64_t *)&__p[24], *(uint64_t *)&__p[32], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&__p[32] - *(_QWORD *)&__p[24]) >> 3));
    v293 = 0uLL;
    v294 = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v293, *((uint64_t *)&v278 + 1), v279, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v279 - *((_QWORD *)&v278 + 1)) >> 3));
    lpsrc[0] = 0;
    lpsrc[1] = 0;
    v287 = 0;
    *(_QWORD *)&v271 = lpsrc;
    BYTE8(v271) = 0;
    lpsrc[0] = operator new(0x48uLL);
    lpsrc[1] = lpsrc[0];
    v287 = (uint64_t)lpsrc[0] + 72;
    lpsrc[1] = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Espresso::net::new_layer_info>,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info*>((uint64_t)&v287, (uint64_t)&__str, (uint64_t)v295, (uint64_t)lpsrc[0]);
    Espresso::net::insert_layers(v254, (uint64_t *)lpsrc);
    *(_QWORD *)&v271 = lpsrc;
    std::vector<Espresso::net::new_layer_info>::__destroy_vector::operator()[abi:ne180100]((void ***)&v271);
    *(_QWORD *)&v271 = &v293;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v271);
    *(_QWORD *)&v271 = &v291;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v271);
    v259 = (std::__shared_weak_count *)__str.__r_.__value_.__r.__words[2];
    if (__str.__r_.__value_.__r.__words[2])
    {
      v260 = (unint64_t *)(__str.__r_.__value_.__r.__words[2] + 8);
      do
        v261 = __ldaxr(v260);
      while (__stlxr(v261 - 1, v260));
      if (!v261)
      {
        ((void (*)(std::__shared_weak_count *))v259->__on_zero_shared)(v259);
        std::__shared_weak_count::__release_weak(v259);
      }
    }
    __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&v278 + 8;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
    __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[24];
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
    v262 = *(std::__shared_weak_count **)&__p[16];
    if (*(_QWORD *)&__p[16])
    {
      v263 = (unint64_t *)(*(_QWORD *)&__p[16] + 8);
      do
        v264 = __ldaxr(v263);
      while (__stlxr(v264 - 1, v263));
      if (!v264)
      {
        ((void (*)(std::__shared_weak_count *))v262->__on_zero_shared)(v262);
        std::__shared_weak_count::__release_weak(v262);
      }
    }
  }
  *(_DWORD *)__p = 0;
  memset(&__p[8], 0, 32);
  v278 = 0u;
  v279 = 0u;
  lpsrc[0] = 0;
  lpsrc[1] = (void *)1065353216;
  v287 = 897988541;
  v288 = 0;
  v289 = 0;
  Espresso::abstract_engine_factory::shared(&p_str);
  v62 = p_str;
  v63 = v282;
  std::string::basic_string[abi:ne180100]<0>(&__str, "elementwise");
  v64 = (***(uint64_t (****)(_QWORD))(v63[2] + 8))(*(_QWORD *)(v63[2] + 8));
  v273 = 1;
  v274 = v64;
  Espresso::abstract_engine_factory::make_kernel_priv((uint64_t)v62, (uint64_t)(v63 + 2), (uint64_t)&__str, (uint64_t)lpsrc, &v274);
  if ((_QWORD)v271
  {
    v275 = v65;
    v276 = (std::__shared_weak_count *)*((_QWORD *)&v271 + 1);
    if (*((_QWORD *)&v271 + 1))
    {
      v66 = (unint64_t *)(*((_QWORD *)&v271 + 1) + 8);
      do
        v67 = __ldxr(v66);
      while (__stxr(v67 + 1, v66));
    }
  }
  else
  {
    v275 = 0;
    v276 = 0;
  }
  v68 = (std::__shared_weak_count *)*((_QWORD *)&v271 + 1);
  if (*((_QWORD *)&v271 + 1))
  {
    v69 = (unint64_t *)(*((_QWORD *)&v271 + 1) + 8);
    do
      v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v71 = v285;
  if (v285)
  {
    v72 = (unint64_t *)&v285->__shared_owners_;
    do
      v73 = __ldaxr(v72);
    while (__stlxr(v73 - 1, v72));
    if (!v73)
    {
      ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
      std::__shared_weak_count::__release_weak(v71);
    }
  }
  v74 = (char *)operator new(0xF8uLL);
  *((_QWORD *)v74 + 1) = 0;
  *((_QWORD *)v74 + 2) = 0;
  *(_QWORD *)v74 = &off_1E2DBF0D0;
  *((_QWORD *)v74 + 3) = &off_1E2DA1A38;
  *(_OWORD *)(v74 + 40) = 0u;
  *(_OWORD *)(v74 + 56) = 0u;
  *(_OWORD *)(v74 + 72) = 0u;
  *(_OWORD *)(v74 + 88) = 0u;
  *(_OWORD *)(v74 + 104) = 0u;
  *(_OWORD *)(v74 + 120) = 0u;
  *(_OWORD *)(v74 + 136) = 0u;
  *(_OWORD *)(v74 + 152) = 0u;
  *(_OWORD *)(v74 + 161) = 0u;
  *((_OWORD *)v74 + 13) = 0u;
  *((_OWORD *)v74 + 14) = 0u;
  *((_QWORD *)v74 + 30) = 0;
  v75 = *(std::__shared_weak_count **)&__p[16];
  *(_QWORD *)&__p[8] = v74 + 24;
  *(_QWORD *)&__p[16] = v74;
  if (v75)
  {
    v76 = (unint64_t *)&v75->__shared_owners_;
    do
      v77 = __ldaxr(v76);
    while (__stlxr(v77 - 1, v76));
    if (!v77)
    {
      ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
      std::__shared_weak_count::__release_weak(v75);
    }
  }
  v78 = *(_QWORD *)&__p[8];
  v80 = v275;
  v79 = v276;
  if (v276)
  {
    v81 = (unint64_t *)&v276->__shared_owners_;
    do
      v82 = __ldxr(v81);
    while (__stxr(v82 + 1, v81));
  }
  v83 = *(std::__shared_weak_count **)(v78 + 72);
  *(_QWORD *)(v78 + 64) = v80;
  *(_QWORD *)(v78 + 72) = v79;
  if (v83)
  {
    v84 = (unint64_t *)&v83->__shared_owners_;
    do
      v85 = __ldaxr(v84);
    while (__stlxr(v85 - 1, v84));
    if (!v85)
    {
      ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
      std::__shared_weak_count::__release_weak(v83);
    }
  }
  MEMORY[0x19401C808](*(_QWORD *)&__p[8] + 16, "add_noise");
  MEMORY[0x19401C808](*(_QWORD *)&__p[8] + 40, "elementwise");
  v86 = (uint64_t)v282;
  v87 = (***(uint64_t (****)(_QWORD))(v282[2] + 8))(*(_QWORD *)(v282[2] + 8));
  v88 = *(_QWORD *)&__p[8];
  *(_DWORD *)(*(_QWORD *)&__p[8] + 8) = v87;
  *(_DWORD *)(v88 + 12) = 1;
  *(_DWORD *)__p = 0;
  std::string::basic_string[abi:ne180100]<0>(&__str, "data0");
  std::string::basic_string[abi:ne180100]<0>(&v291, "noise");
  std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)&__p[24], &__str, &v293, 2uLL);
  for (i = 0; i != -48; i -= 24)
  {
    if (*((char *)&v292 + i + 7) < 0)
      operator delete(*(void **)((char *)&__str + i + 24));
  }
  std::string::basic_string[abi:ne180100]<0>(&__str, "data0_plus_noise");
  std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)((char *)&v278 + 8), &__str, &v291, 1uLL);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  LODWORD(__str.__r_.__value_.__l.__data_) = *(_DWORD *)__p;
  *(_OWORD *)&__str.__r_.__value_.__r.__words[1] = *(_OWORD *)&__p[8];
  if (*(_QWORD *)&__p[16])
  {
    v90 = (unint64_t *)(*(_QWORD *)&__p[16] + 8);
    do
      v91 = __ldxr(v90);
    while (__stxr(v91 + 1, v90));
  }
  v291 = 0uLL;
  v292 = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v291, *(uint64_t *)&__p[24], *(uint64_t *)&__p[32], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&__p[32] - *(_QWORD *)&__p[24]) >> 3));
  v293 = 0uLL;
  v294 = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v293, *((uint64_t *)&v278 + 1), v279, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v279 - *((_QWORD *)&v278 + 1)) >> 3));
  v271 = 0uLL;
  v272 = 0;
  p_str = &v271;
  LOBYTE(v285) = 0;
  *(_QWORD *)&v271 = operator new(0x48uLL);
  *((_QWORD *)&v271 + 1) = v271;
  v272 = v271 + 72;
  *((_QWORD *)&v271 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Espresso::net::new_layer_info>,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info*>((uint64_t)&v272, (uint64_t)&__str, (uint64_t)v295, v271);
  Espresso::net::insert_layers(v86, (uint64_t *)&v271);
  p_str = &v271;
  std::vector<Espresso::net::new_layer_info>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_str);
  p_str = &v293;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_str);
  p_str = &v291;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_str);
  v92 = (std::__shared_weak_count *)__str.__r_.__value_.__r.__words[2];
  if (__str.__r_.__value_.__r.__words[2])
  {
    v93 = (unint64_t *)(__str.__r_.__value_.__r.__words[2] + 8);
    do
      v94 = __ldaxr(v93);
    while (__stlxr(v94 - 1, v93));
    if (!v94)
    {
      ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
      std::__shared_weak_count::__release_weak(v92);
    }
  }
  v95 = v276;
  if (v276)
  {
    v96 = (unint64_t *)&v276->__shared_owners_;
    do
      v97 = __ldaxr(v96);
    while (__stlxr(v97 - 1, v96));
    if (!v97)
    {
      ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
      std::__shared_weak_count::__release_weak(v95);
    }
  }
  __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&v278 + 8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
  __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[24];
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
  v98 = *(std::__shared_weak_count **)&__p[16];
  if (*(_QWORD *)&__p[16])
  {
    v99 = (unint64_t *)(*(_QWORD *)&__p[16] + 8);
    do
      v100 = __ldaxr(v99);
    while (__stlxr(v100 - 1, v99));
    if (!v100)
    {
      ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
      std::__shared_weak_count::__release_weak(v98);
    }
  }
  *(_QWORD *)__p = 2;
  v101 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>((uint64_t)(v282 + 7), 2uLL, __p);
  MEMORY[0x19401C808](v101[3], "data0_plus_noise");
  ptr = p_noise_k->__ptr_;
LABEL_138:
  if (ptr)
  {
    v102 = (*(uint64_t (**)(v9_noise_kernel *))(*(_QWORD *)ptr + 384))(ptr);
    v103 = v280;
    *(_QWORD *)(v102 + 16) = v281;
    *(_OWORD *)v102 = v103;
    currentNetworkPath = self->currentNetworkPath;
    if (currentNetworkPath)
      v105 = *((int *)currentNetworkPath + 2);
    else
      v105 = 0;
    v108 = DWORD1(v280) * v280 * DWORD2(v280) * HIDWORD(v280);
    if (v108 <= 750000)
      v109 = 750000;
    else
      v109 = v108;
    if (v105 < v109)
    {
      std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,int &,int &,int &,Espresso::blob<float,1>::UnitializedBlobType,void>(__p, v109, 1, 1, 1);
      std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->currentNetworkPath, (__int128 *)__p);
      v111 = *(std::__shared_weak_count **)&__p[8];
      if (*(_QWORD *)&__p[8])
      {
        v112 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
        do
          v113 = __ldaxr(v112);
        while (__stlxr(v113 - 1, v112));
        if (!v113)
        {
          ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
          std::__shared_weak_count::__release_weak(v111);
        }
      }
      currentNetworkPath = self->currentNetworkPath;
      v114 = *((int *)currentNetworkPath + 2);
      if ((_DWORD)v114)
      {
        v115 = 0;
        v116 = *(float *)&self->_anon_108[84];
        v117 = (float *)currentNetworkPath[2];
        v118 = 1993;
        do
        {
          if (v115)
          {
            v115 = 0;
            v119 = v110;
          }
          else
          {
            do
            {
              v120 = 48271 * (v118 % 0xADC8);
              v121 = 3399 * (v118 / 0xADC8);
              v122 = v120 >= v121;
              v123 = v120 - v121;
              if (v122)
                v124 = 0;
              else
                v124 = 0x7FFFFFFF;
              v125 = v124 + v123;
              v126 = (float)(v125 - 1) * 4.6566e-10;
              v127 = v125 / 0xADC8;
              v128 = 48271 * (v125 % 0xADC8);
              v127 *= 3399;
              v122 = v128 >= v127;
              v129 = v128 - v127;
              if (v122)
                v130 = 0;
              else
                v130 = 0x7FFFFFFF;
              v118 = v130 + v129;
              v131 = (float)(v126 * 2.0) + -1.0;
              v132 = (float)((float)((float)(v130 + v129 - 1) * 4.6566e-10) * 2.0) + -1.0;
              v133 = (float)(v132 * v132) + (float)(v131 * v131);
            }
            while (v133 > 1.0 || v133 == 0.0);
            v134 = sqrtf((float)(logf((float)(v132 * v132) + (float)(v131 * v131)) * -2.0) / v133);
            v110 = v132 * v134;
            v119 = v131 * v134;
            v115 = 1;
          }
          *v117++ = (float)(v119 * v116) + 0.0;
          --v114;
        }
        while (v114);
      }
    }
    v135 = (std::__shared_weak_count *)operator new(0x60uLL);
    v135->__shared_owners_ = 0;
    v136 = (unint64_t *)&v135->__shared_owners_;
    v135->__shared_weak_owners_ = 0;
    v135->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2DBECA8;
    v137 = (std::__shared_weak_count_vtbl *)currentNetworkPath[2];
    v135[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E2DA11F0;
    *(_OWORD *)&v135[2].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v135[3].__shared_owners_ = 0u;
    *(_OWORD *)&v135[1].__shared_owners_ = v280;
    v135[2].__vftable = v137;
    LOBYTE(v135[2].__shared_owners_) = 0;
    *(_QWORD *)__p = v135 + 1;
    *(_QWORD *)&__p[8] = v135;
    v138 = p_noise_k->__ptr_;
    v270[0] = v135 + 1;
    v270[1] = v135;
    do
      v139 = __ldxr(v136);
    while (__stxr(v139 + 1, v136));
    Espresso::generic_load_constant_kernel::set_constant_blob(v138, (uint64_t)v270);
    do
      v140 = __ldaxr(v136);
    while (__stlxr(v140 - 1, v136));
    if (!v140)
    {
      ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
      std::__shared_weak_count::__release_weak(v135);
    }
    v141 = *(std::__shared_weak_count **)&__p[8];
    if (*(_QWORD *)&__p[8])
    {
      v142 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
      do
        v143 = __ldaxr(v142);
      while (__stlxr(v143 - 1, v142));
      if (!v143)
      {
        ((void (*)(std::__shared_weak_count *))v141->__on_zero_shared)(v141);
        std::__shared_weak_count::__release_weak(v141);
      }
    }
  }
  else if (*(_QWORD *)v10)
  {
    v106 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)v10 + 384))(*(_QWORD *)v10);
    v107 = v280;
    *(_QWORD *)(v106 + 16) = v281;
    *(_OWORD *)v106 = v107;
  }
  *(_QWORD *)&v279 = 0;
  v278 = 0u;
  *(_OWORD *)&__p[24] = 0u;
  *(_OWORD *)__p = v280;
  *(_QWORD *)&__p[16] = 0xFFFFFFFF00000001;
  v144 = v282;
  std::string::basic_string[abi:ne180100]<0>(&__str, "noise");
  v145 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(v144 + 17, (unsigned __int8 *)&__str);
  v146 = v145;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__str.__r_.__value_.__l.__data_);
    if (v146)
      goto LABEL_254;
  }
  else if (v145)
  {
    goto LABEL_254;
  }
  v147 = 0;
  v148 = 0;
  lpsrc[0] = "noise";
  lpsrc[1] = "data0_plus_noise";
  do
  {
    v149 = v147;
    v150 = (char *)lpsrc[v148];
    v151 = (uint64_t **)v282;
    std::string::basic_string[abi:ne180100]<0>(&__str, v150);
    *(_QWORD *)&v271 = &__str;
    v152 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v151 + 23, &__str, (_OWORD **)&v271);
    v153 = *(_OWORD *)&__p[16];
    *(_OWORD *)((char *)v152 + 56) = *(_OWORD *)__p;
    *(_OWORD *)((char *)v152 + 72) = v153;
    *((_QWORD *)v152 + 11) = *(_QWORD *)&__p[32];
    if ((char *)v152 + 56 != __p)
      std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)v152 + 96, (char *)v278, *((uint64_t *)&v278 + 1), (uint64_t)(*((_QWORD *)&v278 + 1) - v278) >> 2);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
    v154 = (**(uint64_t (***)(uint64_t))v151[2][1])(v151[2][1]);
    v274 = 1;
    LODWORD(v275) = v154;
    Espresso::abstract_blob_container::make((uint64_t)(v151 + 2), (int *)&v275, (unsigned int *)&v274, &v271);
    std::string::basic_string[abi:ne180100]<0>(&__str, v150);
    p_str = (__int128 *)&__str;
    v155 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(v151 + 17), (unsigned __int8 *)&__str, &p_str);
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)v155 + 40, &v271);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
    v156 = (std::__shared_weak_count *)*((_QWORD *)&v271 + 1);
    if (*((_QWORD *)&v271 + 1))
    {
      v157 = (unint64_t *)(*((_QWORD *)&v271 + 1) + 8);
      do
        v158 = __ldaxr(v157);
      while (__stlxr(v158 - 1, v157));
      if (!v158)
      {
        ((void (*)(std::__shared_weak_count *))v156->__on_zero_shared)(v156);
        std::__shared_weak_count::__release_weak(v156);
      }
    }
    v147 = 1;
    v148 = 1;
  }
  while ((v149 & 1) == 0);
  v144 = v282;
  v159 = v282[4];
  if (v282[5] != v159)
  {
    v160 = 0;
    do
    {
      v161 = *(_OWORD *)(v159 + 16 * v160);
      *(_OWORD *)lpsrc = v161;
      if (*((_QWORD *)&v161 + 1))
      {
        v162 = (unint64_t *)(*((_QWORD *)&v161 + 1) + 8);
        do
          v163 = __ldxr(v162);
        while (__stxr(v163 + 1, v162));
      }
      v164 = (_QWORD *)v161;
      if (*(_QWORD *)(v161 + 112) == *(_QWORD *)(v161 + 104))
      {
        __str.__r_.__value_.__r.__words[0] = v160;
        v165 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>((uint64_t)(v144 + 12), v160, &__str);
        v166 = (unsigned __int8 *)v165[3];
        v167 = (unsigned __int8 *)v165[4];
        v164 = lpsrc[0];
        if (v166 != v167)
        {
          v168 = (uint64_t)(v282 + 17);
          do
          {
            __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v166;
            v169 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v168, v166, (__int128 **)&__str);
            v170 = v169;
            v171 = (_QWORD *)v164[14];
            v172 = v164[15];
            if ((unint64_t)v171 >= v172)
            {
              v177 = v164[13];
              v178 = ((uint64_t)v171 - v177) >> 4;
              v179 = v178 + 1;
              if ((unint64_t)(v178 + 1) >> 60)
                std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
              v180 = v172 - v177;
              if (v180 >> 3 > v179)
                v179 = v180 >> 3;
              if ((unint64_t)v180 >= 0x7FFFFFFFFFFFFFF0)
                v181 = 0xFFFFFFFFFFFFFFFLL;
              else
                v181 = v179;
              *((_QWORD *)&v291 + 1) = v164 + 15;
              v182 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v181);
              v184 = &v182[16 * v178];
              v185 = *(_OWORD *)(v170 + 40);
              *(_OWORD *)v184 = v185;
              if (*((_QWORD *)&v185 + 1))
              {
                v186 = (unint64_t *)(*((_QWORD *)&v185 + 1) + 8);
                do
                  v187 = __ldxr(v186);
                while (__stxr(v187 + 1, v186));
              }
              v189 = (_QWORD *)v164[13];
              v188 = (_QWORD *)v164[14];
              if (v188 == v189)
              {
                v192 = vdupq_n_s64((unint64_t)v188);
                v190 = &v182[16 * v178];
              }
              else
              {
                v190 = &v182[16 * v178];
                do
                {
                  v191 = *((_OWORD *)v188 - 1);
                  v188 -= 2;
                  *((_OWORD *)v190 - 1) = v191;
                  v190 -= 16;
                  *v188 = 0;
                  v188[1] = 0;
                }
                while (v188 != v189);
                v192 = *(int64x2_t *)(v164 + 13);
              }
              v176 = v184 + 16;
              v164[13] = v190;
              v164[14] = v184 + 16;
              *(int64x2_t *)&__str.__r_.__value_.__r.__words[1] = v192;
              v193 = v164[15];
              v164[15] = &v182[16 * v183];
              *(_QWORD *)&v291 = v193;
              __str.__r_.__value_.__r.__words[0] = v192.i64[0];
              std::__split_buffer<std::shared_ptr<Espresso::abstract_blob_container>>::~__split_buffer((uint64_t)&__str);
            }
            else
            {
              *v171 = *((_QWORD *)v169 + 5);
              v173 = *((_QWORD *)v169 + 6);
              v171[1] = v173;
              if (v173)
              {
                v174 = (unint64_t *)(v173 + 8);
                do
                  v175 = __ldxr(v174);
                while (__stxr(v175 + 1, v174));
              }
              v176 = v171 + 2;
            }
            v164[14] = v176;
            v166 += 24;
          }
          while (v166 != v167);
        }
      }
      if (v164[11] == v164[10])
      {
        v194 = v282;
        __str.__r_.__value_.__r.__words[0] = v160;
        v195 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>((uint64_t)(v282 + 7), v160, &__str);
        v196 = (unsigned __int8 *)v195[3];
        v197 = (unsigned __int8 *)v195[4];
        if (v196 != v197)
        {
          v198 = (uint64_t)(v194 + 17);
          do
          {
            __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v196;
            v199 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v198, v196, (__int128 **)&__str);
            v200 = v199;
            v201 = (_QWORD *)v164[11];
            v202 = v164[12];
            if ((unint64_t)v201 >= v202)
            {
              v207 = v164[10];
              v208 = ((uint64_t)v201 - v207) >> 4;
              v209 = v208 + 1;
              if ((unint64_t)(v208 + 1) >> 60)
                std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
              v210 = v202 - v207;
              if (v210 >> 3 > v209)
                v209 = v210 >> 3;
              if ((unint64_t)v210 >= 0x7FFFFFFFFFFFFFF0)
                v211 = 0xFFFFFFFFFFFFFFFLL;
              else
                v211 = v209;
              *((_QWORD *)&v291 + 1) = v164 + 12;
              v212 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v211);
              v214 = &v212[16 * v208];
              v215 = *(_OWORD *)(v200 + 40);
              *(_OWORD *)v214 = v215;
              if (*((_QWORD *)&v215 + 1))
              {
                v216 = (unint64_t *)(*((_QWORD *)&v215 + 1) + 8);
                do
                  v217 = __ldxr(v216);
                while (__stxr(v217 + 1, v216));
              }
              v219 = (_QWORD *)v164[10];
              v218 = (_QWORD *)v164[11];
              if (v218 == v219)
              {
                v222 = vdupq_n_s64((unint64_t)v218);
                v220 = &v212[16 * v208];
              }
              else
              {
                v220 = &v212[16 * v208];
                do
                {
                  v221 = *((_OWORD *)v218 - 1);
                  v218 -= 2;
                  *((_OWORD *)v220 - 1) = v221;
                  v220 -= 16;
                  *v218 = 0;
                  v218[1] = 0;
                }
                while (v218 != v219);
                v222 = *((int64x2_t *)v164 + 5);
              }
              v206 = v214 + 16;
              v164[10] = v220;
              v164[11] = v214 + 16;
              *(int64x2_t *)&__str.__r_.__value_.__r.__words[1] = v222;
              v223 = v164[12];
              v164[12] = &v212[16 * v213];
              *(_QWORD *)&v291 = v223;
              __str.__r_.__value_.__r.__words[0] = v222.i64[0];
              std::__split_buffer<std::shared_ptr<Espresso::abstract_blob_container>>::~__split_buffer((uint64_t)&__str);
            }
            else
            {
              *v201 = *((_QWORD *)v199 + 5);
              v203 = *((_QWORD *)v199 + 6);
              v201[1] = v203;
              if (v203)
              {
                v204 = (unint64_t *)(v203 + 8);
                do
                  v205 = __ldxr(v204);
                while (__stxr(v205 + 1, v204));
              }
              v206 = v201 + 2;
            }
            v164[11] = v206;
            v196 += 24;
          }
          while (v196 != v197);
        }
      }
      v224 = (std::__shared_weak_count *)lpsrc[1];
      if (lpsrc[1])
      {
        v225 = (unint64_t *)((char *)lpsrc[1] + 8);
        do
          v226 = __ldaxr(v225);
        while (__stlxr(v226 - 1, v225));
        if (!v226)
        {
          ((void (*)(std::__shared_weak_count *))v224->__on_zero_shared)(v224);
          std::__shared_weak_count::__release_weak(v224);
        }
      }
      ++v160;
      v144 = v282;
      v159 = v282[4];
    }
    while (v160 < (v282[5] - v159) >> 4);
  }
LABEL_254:
  std::string::basic_string[abi:ne180100]<0>(&__str, "noise");
  lpsrc[0] = &__str;
  v227 = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(v144 + 17), (unsigned __int8 *)&__str, (__int128 **)lpsrc)+ 5);
  v268 = 0;
  v269 = 0;
  (*(void (**)(uint64_t, _BYTE *, uint64_t *))(*(_QWORD *)v227 + 16))(v227, __p, &v268);
  v228 = v269;
  if (v269)
  {
    v229 = (unint64_t *)&v269->__shared_owners_;
    do
      v230 = __ldaxr(v229);
    while (__stlxr(v230 - 1, v229));
    if (!v230)
    {
      ((void (*)(std::__shared_weak_count *))v228->__on_zero_shared)(v228);
      std::__shared_weak_count::__release_weak(v228);
    }
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v231 = v282;
  std::string::basic_string[abi:ne180100]<0>(&__str, "data0_plus_noise");
  lpsrc[0] = &__str;
  v232 = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(v231 + 17), (unsigned __int8 *)&__str, (__int128 **)lpsrc)+ 5);
  v266 = 0;
  v267 = 0;
  (*(void (**)(uint64_t, _BYTE *, uint64_t *))(*(_QWORD *)v232 + 16))(v232, __p, &v266);
  v233 = v267;
  if (v267)
  {
    v234 = (unint64_t *)&v267->__shared_owners_;
    do
      v235 = __ldaxr(v234);
    while (__stlxr(v235 - 1, v234));
    if (!v235)
    {
      ((void (*)(std::__shared_weak_count *))v233->__on_zero_shared)(v233);
      std::__shared_weak_count::__release_weak(v233);
    }
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if ((_QWORD)v278)
  {
    *((_QWORD *)&v278 + 1) = v278;
    operator delete((void *)v278);
  }
  v236 = v283;
  if (v283)
  {
    v237 = (unint64_t *)&v283->__shared_owners_;
    do
      v238 = __ldaxr(v237);
    while (__stlxr(v238 - 1, v237));
    if (!v238)
    {
      ((void (*)(std::__shared_weak_count *))v236->__on_zero_shared)(v236);
      std::__shared_weak_count::__release_weak(v236);
    }
  }
}

- (int)wasReshaped
{
  void *v3;
  void *v4;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_output_layer_name;
  int result;
  int32x2_t v7;

  v3 = (void *)MEMORY[0x19401D4A4](self, a2);
  v4 = *(void **)&self->defaultWidth;
  *(_QWORD *)&self->defaultWidth = 0;

  objc_autoreleasePoolPop(v3);
  p_output_layer_name = &self->output_layer_name;
  MEMORY[0x19401C808](&self->output_layer_name, "id4");
  result = espresso_network_query_blob_dimensions(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)"data0", (uint64_t)&self->dim[3]);
  if (!result)
  {
    if (*((char *)&self->output_layer_name.__r_.__value_.var0.__l + 23) < 0)
      p_output_layer_name = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_output_layer_name->__r_.__value_.var0.__l.__data_;
    result = espresso_network_query_blob_dimensions(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)p_output_layer_name, (uint64_t)&self->dispatch_queue);
    if (!result)
    {
      if (!LODWORD(self->dim_small[3]))
      {
        v7 = vmovn_s64(*(int64x2_t *)&self->dispatch_queue);
        self->dim_small[3] = (unint64_t)v7;
        HIDWORD(self->dim_small[4]) = v7.i32[0] / SLODWORD(self->dim[3]);
      }
      -[EspressoImage2Image addNoiseLayer](self, "addNoiseLayer");
      -[EspressoImage2Image _resetTemporalState](self, "_resetTemporalState");
      return 0;
    }
  }
  return result;
}

- (void)_resetTemporalState
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, -[EspressoImage2Image width](self, "width") / SHIDWORD(self->dim_small[4]), -[EspressoImage2Image height](self, "height") / SHIDWORD(self->dim_small[4]), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResourceOptions:", 32);
  objc_msgSend(v5, "setUsage:", 3);
  v3 = objc_msgSend((id)self->output_layer_name.var0, "newTextureWithDescriptor:", v5);
  v4 = *(void **)&self->defaultWidth;
  *(_QWORD *)&self->defaultWidth = v3;

}

- (void)resetTemporalState
{
  pthread_mutex_t *v3;

  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v3, (_opaque_pthread_mutex_t *)a2);
  -[EspressoImage2Image _resetTemporalState](self, "_resetTemporalState");
  pthread_mutex_locker::~pthread_mutex_locker(&v3);
}

- (int)load:(id)a3
{
  return -[EspressoImage2Image load:resolutionPreset:](self, "load:resolutionPreset:", a3, 0);
}

- (int)reload
{
  return -[EspressoImage2Image load:resolutionPreset:](self, "load:resolutionPreset:", self->noise_load_constant_kernel.__ptr_, self->noise_load_constant_kernel.__cntrl_);
}

- (int)load:(id)a3 resolutionPreset:(int64_t)a4
{
  id v7;
  _opaque_pthread_mutex_t *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  void *plan;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> *p_pair1;
  unint64_t *p_size;
  id v18;
  _QWORD *i;
  uint64_t **v20;
  void **v21;
  char *v22;
  uint64_t **v23;
  std::string *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _BYTE *v34;
  int v35;
  __int128 v37;
  __int128 v38;
  void *__p[2];
  uint64_t v40;
  pthread_mutex_t *v41;
  uint64_t v42;
  __int128 v43;
  char v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v41, v8);
  objc_storeStrong((id *)&self->noise_load_constant_kernel.__ptr_, a3);
  self->noise_load_constant_kernel.__cntrl_ = (__shared_weak_count *)a4;
  self->dim_small[3] = 0;
  v43 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->noise_k, &v43);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v43 + 1);
  if (*((_QWORD *)&v43 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v43 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v43 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->_anon_108[120], &v43);
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v43 + 1);
  if (*((_QWORD *)&v43 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v43 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  plan = self->plan;
  if (plan)
    espresso_plan_destroy((std::string::size_type)plan);
  p_pair1 = &self->tweaks.__tree_.__pair1_;
  if (self->current_postprocessing_settings.name.__r_.__value_.var0.__s.__data_[7] < 0)
    operator delete(p_pair1->__value_.__left_);
  p_size = &self->current_postprocessing_settings.name.__r_.__value_.var0.__l.__size_;
  p_pair1->__value_.__left_ = 0;
  self->tweaks.__tree_.__pair3_.__value_ = 0;
  self->current_postprocessing_settings.name.__r_.__value_.var0.__l.__data_ = 0;
  if (*((char *)&self->current_postprocessing_settings.name.__r_.var1 + 3) < 0)
    operator delete((void *)*p_size);
  *p_size = 0;
  *((_QWORD *)&self->current_postprocessing_settings.name.__r_.__value_.var0.__l + 2) = 0;
  LODWORD(self->current_postprocessing_settings.name.var0) = 0;
  *(_QWORD *)&self->current_postprocessing_settings.name.__r_.var0 = 0;
  HIDWORD(self->current_postprocessing_settings.name.var0) = 1050253722;
  *(_QWORD *)self->_anon_108 = 0;
  *(_OWORD *)&self->_anon_108[8] = xmmword_191A93390;
  *(_DWORD *)&self->_anon_108[24] = 0;
  *(_OWORD *)&self->_anon_108[28] = xmmword_191A933A0;
  *(_OWORD *)&self->_anon_108[44] = xmmword_191A933B0;
  *(_OWORD *)&self->_anon_108[60] = xmmword_191A933C0;
  *(_DWORD *)&self->_anon_108[76] = 960;
  *(_QWORD *)&self->_anon_108[80] = 0x3F8000003DA3D70ALL;
  *(_DWORD *)&self->_anon_108[88] = 0;
  *(_OWORD *)&self->_anon_108[92] = xmmword_191A933D0;
  *(_QWORD *)&self->_anon_108[108] = 0x3F8000003F79999ALL;
  self->_anon_108[116] = 0;
  objc_msgSend(v7, "lastPathComponent", 0xC2D000003C23D70ALL, 0xC2F60000C2EA0000, 0xBF8000003F800000, 0xBF800000BF800000);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v18, "UTF8String"));

  if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1)
    dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_12627);
  for (i = *(_QWORD **)(Espresso::Image2Image::settings_t::shared(void)::global + 8); i; i = (_QWORD *)*i)
  {
    if (!std::operator<[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(__p, i + 4))
    {
      if (!std::operator<[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(i + 4, __p))
      {
        v20 = (uint64_t **)Espresso::Image2Image::settings_t::shared(void)::global;
        v21 = (void **)std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__find_equal<std::string>(Espresso::Image2Image::settings_t::shared(void)::global, &v42, __p);
        v22 = (char *)*v21;
        if (!*v21)
        {
          v23 = (uint64_t **)v21;
          v22 = (char *)operator new(0xE8uLL);
          *(_QWORD *)&v43 = v22;
          *((_QWORD *)&v43 + 1) = v20 + 1;
          v44 = 0;
          v24 = (std::string *)(v22 + 32);
          if (SHIBYTE(v40) < 0)
          {
            std::string::__init_copy_ctor_external(v24, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
          }
          else
          {
            *(_OWORD *)&v24->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
            *((_QWORD *)v22 + 6) = v40;
          }
          *(_OWORD *)(v22 + 104) = 0u;
          *(_OWORD *)(v22 + 152) = 0u;
          *(_OWORD *)(v22 + 136) = 0u;
          *(_OWORD *)(v22 + 168) = 0u;
          *(_OWORD *)(v22 + 184) = 0u;
          *(_OWORD *)(v22 + 216) = 0u;
          *(_OWORD *)(v22 + 200) = 0u;
          *(_OWORD *)(v22 + 88) = 0u;
          *(_OWORD *)(v22 + 72) = 0u;
          *(_OWORD *)(v22 + 56) = 0u;
          *((_DWORD *)v22 + 27) = 1050253722;
          *(_OWORD *)(v22 + 120) = v38;
          *((_OWORD *)v22 + 9) = xmmword_191A933E0;
          *((_OWORD *)v22 + 10) = xmmword_191A933F0;
          *((_OWORD *)v22 + 11) = xmmword_191A93400;
          *((_QWORD *)v22 + 24) = 0x3F8000003DA3D70ALL;
          *(_OWORD *)(v22 + 204) = v37;
          *(_QWORD *)(v22 + 220) = 0x3F8000003F79999ALL;
          v44 = 1;
          std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__insert_node_at(v20, v42, v23, (uint64_t *)v22);
          *(_QWORD *)&v43 = 0;
          std::unique_ptr<std::__tree_node<std::__value_type<std::string,Espresso::Image2Image::postprocessing_settings_t>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,Espresso::Image2Image::postprocessing_settings_t>,void *>>>>::reset[abi:ne180100]((uint64_t *)&v43);
        }
        std::string::operator=((std::string *)&self->tweaks.__tree_.__pair1_, (const std::string *)(v22 + 56));
        std::string::operator=((std::string *)&self->current_postprocessing_settings.name.__r_.__value_.var0.__l.__size_, (const std::string *)(v22 + 80));
        v25 = *(_OWORD *)(v22 + 104);
        v26 = *(_OWORD *)(v22 + 120);
        v27 = *(_OWORD *)(v22 + 152);
        *(_OWORD *)&self->_anon_108[24] = *(_OWORD *)(v22 + 136);
        *(_OWORD *)&self->_anon_108[40] = v27;
        *(_OWORD *)&self->current_postprocessing_settings.name.var0 = v25;
        *(_OWORD *)&self->_anon_108[8] = v26;
        v28 = *(_OWORD *)(v22 + 168);
        v29 = *(_OWORD *)(v22 + 184);
        v30 = *(_OWORD *)(v22 + 200);
        *(_OWORD *)&self->_anon_108[101] = *(_OWORD *)(v22 + 213);
        *(_OWORD *)&self->_anon_108[72] = v29;
        *(_OWORD *)&self->_anon_108[88] = v30;
        *(_OWORD *)&self->_anon_108[56] = v28;
        break;
      }
      ++i;
    }
  }
  if (*((char *)&self->current_postprocessing_settings.name.__r_.var1 + 3) < 0)
  {
    if (!*((_QWORD *)&self->current_postprocessing_settings.name.__r_.__value_.var0.__l + 2))
      goto LABEL_38;
  }
  else if (!*((_BYTE *)&self->current_postprocessing_settings.name.__r_.var1 + 3))
  {
    goto LABEL_38;
  }
  objc_msgSend((id)plistPath, "stringByDeletingLastPathComponent");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((char *)&self->current_postprocessing_settings.name.__r_.var1 + 3) < 0)
    p_size = (unint64_t *)*p_size;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_size);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringByAppendingPathComponent:", v32);
  v33 = objc_claimAutoreleasedReturnValue();

  v7 = (id)v33;
LABEL_38:
  v34 = (_BYTE *)espresso_create_plan((EspressoLight::espresso_context *)self->ctx, 0);
  self->plan = v34;
  if (v34)
  {
    v35 = espresso_plan_add_network(v34, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), 65552, (uint64_t)&self->net);
    if (!v35)
    {
      v35 = espresso_plan_build((_QWORD *)self->plan);
      if (!v35)
      {
        v35 = -[EspressoImage2Image wasReshaped](self, "wasReshaped");
        if (!v35)
        {
          LOBYTE(self->device) = espresso_network_query_blob_dimensions(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)"data3", (uint64_t)&v43) == 0;
          v35 = -[EspressoImage2Image _reshapeToResolutionPreset:](self, "_reshapeToResolutionPreset:", a4);
        }
      }
    }
  }
  else
  {
    v35 = -1;
  }
  if (SHIBYTE(v40) < 0)
    operator delete(__p[0]);
  pthread_mutex_locker::~pthread_mutex_locker(&v41);

  return v35;
}

- (int)reshapeToResolutionPreset:(int64_t)a3
{
  pthread_mutex_t *v6;

  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v6, (_opaque_pthread_mutex_t *)a2);
  self->noise_load_constant_kernel.__cntrl_ = (__shared_weak_count *)a3;
  LODWORD(a3) = -[EspressoImage2Image _reshapeToResolutionPreset:](self, "_reshapeToResolutionPreset:", a3);
  pthread_mutex_locker::~pthread_mutex_locker(&v6);
  return a3;
}

- (pair<int,)resolutionForPreset:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return (pair<int, int>)0;
  else
    return (pair<int, int>)(*(unsigned int *)((char *)&self->super.isa + qword_191A97748[a3]) | ((unint64_t)*(unsigned int *)((char *)&self->super.isa + qword_191A97780[a3]) << 32));
}

- (int)reshapeToResolutionPreset:(int64_t)a3 aspectRatio:(float)a4
{
  pair<int, int> v7;
  float v8;
  int v9;
  unsigned int v10;
  float v11;
  int v12;
  unsigned int v13;
  uint64_t var0;
  uint64_t var1;
  int v16;
  pthread_mutex_t *v18;

  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v18, (_opaque_pthread_mutex_t *)a2);
  self->noise_load_constant_kernel.__cntrl_ = (__shared_weak_count *)a3;
  v7 = -[EspressoImage2Image resolutionForPreset:](self, "resolutionForPreset:", a3);
  v8 = (float)v7.var0 / a4;
  v9 = (int)v8 + 2;
  if ((int)v8 >= 1)
    v9 = (int)v8 - 1;
  v10 = (v9 & 0xFFFFFFFC) + 4;
  v11 = (float)v7.var1 * a4;
  v12 = (int)v11 + 2;
  if ((int)v11 >= 1)
    v12 = (int)v11 - 1;
  v13 = (v12 & 0xFFFFFFFC) + 4;
  if (a4 < 1.0)
    var0 = v7.var0;
  else
    var0 = v10;
  if (a4 < 1.0)
    var1 = v13;
  else
    var1 = v7.var1;
  v16 = -[EspressoImage2Image _reshapeToWidth:andHeight:](self, "_reshapeToWidth:andHeight:", var0, var1);
  pthread_mutex_locker::~pthread_mutex_locker(&v18);
  return v16;
}

- (int)_reshapeToResolutionPreset:(int64_t)a3
{
  pair<int, int> v4;

  v4 = -[EspressoImage2Image resolutionForPreset:](self, "resolutionForPreset:", a3);
  if (v4.var0)
    return -[EspressoImage2Image _reshapeToWidth:andHeight:](self, "_reshapeToWidth:andHeight:", v4, HIDWORD(*(unint64_t *)&v4));
  else
    return -6;
}

- (int)reshapeToWidth:(int)a3 andHeight:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  pthread_mutex_t *v8;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v8, (_opaque_pthread_mutex_t *)a2);
  self->noise_load_constant_kernel.__cntrl_ = 0;
  LODWORD(v4) = -[EspressoImage2Image _reshapeToWidth:andHeight:](self, "_reshapeToWidth:andHeight:", v5, v4);
  pthread_mutex_locker::~pthread_mutex_locker(&v8);
  return v4;
}

- (int)_reshapeToWidth:(int)a3 andHeight:(int)a4
{
  v9_noise_kernel *ptr;
  int v8;
  int v9;
  int v10;
  _QWORD *v11;
  int v12;
  _DWORD *v13;
  _DWORD *v14;
  _DWORD *v15;
  _DWORD *v16;
  __int128 v17;
  int v18;
  int v19;
  char v21[4];
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v21[0] = 1;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = 723714080;
  kdebug_trace();
  ptr = self->noise_k.__ptr_;
  if (ptr)
  {
    v8 = HIDWORD(self->dim_small[4]);
    *(_DWORD *)(*(uint64_t (**)(v9_noise_kernel *))(*(_QWORD *)ptr + 384))(ptr) = a3 / v8;
    v9 = HIDWORD(self->dim_small[4]);
    *(_DWORD *)((*(uint64_t (**)(v9_noise_kernel *))(*(_QWORD *)self->noise_k.__ptr_ + 384))(self->noise_k.__ptr_)
              + 4) = a4 / v9;
  }
  v10 = espresso_plan_build_clean(self->plan);
  if (!v10)
  {
    if (LOBYTE(self->device))
    {
      v11 = operator new(0x20uLL);
      *(_OWORD *)v11 = xmmword_1E2DD1F08;
      *((_OWORD *)v11 + 1) = *(_OWORD *)&off_1E2DD1F18;
      v12 = HIDWORD(self->dim_small[4]);
      v13 = operator new(0x10uLL);
      *v13 = a3 / v12;
      v13[1] = a3 / v12;
      v13[2] = a3;
      v13[3] = 1;
      v14 = operator new(0x10uLL);
      *v14 = a4 / v12;
      v14[1] = a4 / v12;
      v14[2] = a4;
      v14[3] = 1;
      v15 = operator new(0x10uLL);
      *(_OWORD *)v15 = xmmword_191A93410;
      v16 = operator new(0x10uLL);
      *(_QWORD *)&v17 = 0x100000001;
      *((_QWORD *)&v17 + 1) = 0x100000001;
      *(_OWORD *)v16 = v17;
      if (espresso_network_change_input_blob_shapes(self->net.plan, *(_QWORD *)&self->net.network_index, 4, (uint64_t)v11, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16))
      {
        v18 = espresso_network_change_input_blob_shapes(self->net.plan, *(_QWORD *)&self->net.network_index, 3, (uint64_t)v11, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16);
LABEL_9:
        v10 = v18;
LABEL_11:
        operator delete(v16);
        operator delete(v15);
        operator delete(v14);
        operator delete(v13);
        operator delete(v11);
        if (!v10)
        {
          v10 = espresso_plan_build((_QWORD *)self->plan);
          if (!v10)
            v10 = -[EspressoImage2Image wasReshaped](self, "wasReshaped");
        }
        goto LABEL_14;
      }
    }
    else
    {
      v11 = operator new(0x18uLL);
      *(_OWORD *)v11 = xmmword_1E2DD1F28;
      v11[2] = "data2";
      v19 = HIDWORD(self->dim_small[4]);
      v13 = operator new(0xCuLL);
      *v13 = a3 / v19;
      v13[1] = a3;
      v13[2] = 1;
      v14 = operator new(0xCuLL);
      *v14 = a4 / v19;
      v14[1] = a4;
      v14[2] = 1;
      v15 = operator new(0xCuLL);
      *(_QWORD *)v15 = 0x300000003;
      v15[2] = 1;
      v16 = operator new(0xCuLL);
      *(_QWORD *)v16 = 0x100000001;
      v16[2] = 1;
      if (espresso_network_change_input_blob_shapes(self->net.plan, *(_QWORD *)&self->net.network_index, 3, (uint64_t)v11, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16))
      {
        v18 = espresso_network_change_input_blob_shapes(self->net.plan, *(_QWORD *)&self->net.network_index, 2, (uint64_t)v11, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16);
        goto LABEL_9;
      }
    }
    v10 = 0;
    goto LABEL_11;
  }
LABEL_14:
  Espresso_scoped_signpost::~Espresso_scoped_signpost((Espresso_scoped_signpost *)v21);
  return v10;
}

- (int)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 cropRect:(id *)a6 destinationRect:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  unint64_t var0;
  _BOOL4 v18;
  unint64_t var1;
  _BOOL4 v20;
  __int128 v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *ptr;
  __int128 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;
  unint64_t var2;
  _QWORD v40[3];
  _QWORD v41[3];
  _OWORD v42[3];
  _OWORD v43[3];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (a7->var0.var0)
    v16 = 0;
  else
    v16 = a7->var0.var1 == 0;
  var0 = a7->var1.var0;
  if (var0)
    v18 = 0;
  else
    v18 = a7->var1.var1 == 0;
  if (var0 == objc_msgSend(v14, "width"))
  {
    var1 = a7->var1.var1;
    v20 = var1 == objc_msgSend(v15, "height");
  }
  else
  {
    v20 = 0;
  }
  if (!v16 || !v18 && !v20)
  {
    v23 = objc_msgSend(self->precomputed_noise.__ptr_, "width");
    v24 = a7->var1.var0;
    if (v23 == v24)
    {
      v25 = objc_msgSend(self->precomputed_noise.__ptr_, "height");
      v26 = a7->var1.var1;
      if (v25 == v26)
      {
LABEL_17:
        ptr = self->precomputed_noise.__ptr_;
        v32 = *(_OWORD *)&a6->var0.var2;
        v42[0] = *(_OWORD *)&a6->var0.var0;
        v42[1] = v32;
        v42[2] = *(_OWORD *)&a6->var1.var1;
        v22 = -[EspressoImage2Image encodeToCommandBuffer:sourceTexture:destinationTexture:cropRect:](self, "encodeToCommandBuffer:sourceTexture:destinationTexture:cropRect:", v12, v13, ptr, v42);
        objc_msgSend(v12, "blitCommandEncoder");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = self->precomputed_noise.__ptr_;
        memset(v41, 0, sizeof(v41));
        v35 = objc_msgSend(v34, "width");
        v36 = objc_msgSend(self->precomputed_noise.__ptr_, "height");
        v40[0] = v35;
        v40[1] = v36;
        v40[2] = 1;
        v38 = *(_OWORD *)&a7->var0.var0;
        var2 = a7->var0.var2;
        objc_msgSend(v33, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v34, 0, 0, v41, v40, v15, 0, 0, &v38);
        objc_msgSend(v33, "endEncoding");

        goto LABEL_18;
      }
      v24 = a7->var1.var0;
    }
    else
    {
      v26 = a7->var1.var1;
    }
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, v24, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setResourceOptions:", 0);
    objc_msgSend(v27, "setStorageMode:", 0);
    v28 = (void *)MEMORY[0x19401D4A4](objc_msgSend(v27, "setUsage:", 3));
    v29 = (void *)objc_msgSend((id)self->output_layer_name.var0, "newTextureWithDescriptor:", v27);
    v30 = self->precomputed_noise.__ptr_;
    self->precomputed_noise.__ptr_ = v29;

    objc_autoreleasePoolPop(v28);
    goto LABEL_17;
  }
  v21 = *(_OWORD *)&a6->var0.var2;
  v43[0] = *(_OWORD *)&a6->var0.var0;
  v43[1] = v21;
  v43[2] = *(_OWORD *)&a6->var1.var1;
  v22 = -[EspressoImage2Image encodeToCommandBuffer:sourceTexture:destinationTexture:cropRect:](self, "encodeToCommandBuffer:sourceTexture:destinationTexture:cropRect:", v12, v13, v15, v43);
LABEL_18:

  return v22;
}

- (int)submitToQueueWithSourceTexture:(id)a3 destinationTexture:(id)a4
{
  _OWORD v5[2];
  uint64_t v6;
  uint64_t v7;

  memset(v5, 0, sizeof(v5));
  v6 = 0;
  v7 = 1;
  return -[EspressoImage2Image submitToQueueWithSourceTexture:destinationTexture:cropRect:](self, "submitToQueueWithSourceTexture:destinationTexture:cropRect:", a3, a4, v5);
}

- (void)tweak:(id)a3 value:(float)a4
{
  id v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  _DWORD *v10;
  void *v11;
  uint64_t v12;
  void *__p[2];
  char v14;

  v6 = a3;
  NSLog(CFSTR("Tweaking %@ = %f"), v6, a4);
  v7 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  *((float *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->t0, __p, (uint64_t)__p)+ 14) = a4;
  if (v14 < 0)
    operator delete(__p[0]);
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("saturation")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("gamma")))
    {
      *(float *)&self->_anon_108[12] = a4;
      goto LABEL_27;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("brightness")))
    {
      *(float *)&self->_anon_108[24] = a4;
      goto LABEL_27;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("contrast")))
    {
      *(float *)&self->_anon_108[20] = a4;
      goto LABEL_27;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("old_frame_scale")))
    {
      *(float *)&self->_anon_108[80] = a4;
      goto LABEL_27;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("hq_scaling")))
    {
      v8 = roundf(a4) != 0.0;
      self->_anon_108[116] = v8;
      NSLog(CFSTR("Tweaking hq: %d"), v8);
      goto LABEL_27;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("instancenorm_subsampling")))
    {
      Espresso::get_internal_context((uint64_t **)self->ctx, &v11);
      std::dynamic_pointer_cast[abi:ne180100]<Espresso::V9Engine::context,Espresso::abstract_context>(__p, v11, v12);
      std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&v11);
      if (__p[0])
      {
        *((_DWORD *)__p[0] + 58) = llroundf(a4);
        NSLog(CFSTR("Tweaking subsample: %d"), self->_anon_108[116]);
      }
      goto LABEL_26;
    }
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("winograd")))
      goto LABEL_27;
    Espresso::get_internal_context((uint64_t **)self->ctx, &v11);
    std::dynamic_pointer_cast[abi:ne180100]<Espresso::V9Engine::context,Espresso::abstract_context>(__p, v11, v12);
    std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&v11);
    v10 = __p[0];
    if (!__p[0])
    {
LABEL_26:
      std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)__p);
      goto LABEL_27;
    }
    LODWORD(v9) = llroundf(a4);
    *((_DWORD *)__p[0] + 57) = v9;
    if ((_DWORD)v9 == 3)
    {
      v9 = 2;
    }
    else
    {
      if ((_DWORD)v9 != 5)
      {
LABEL_25:
        NSLog(CFSTR("Tweaking wg: %d"), v9);
        -[EspressoImage2Image reload](self, "reload");
        goto LABEL_26;
      }
      v9 = 4;
    }
    v10[57] = v9;
    goto LABEL_25;
  }
  *(float *)&self->_anon_108[16] = a4;
LABEL_27:

}

- (int)submitToQueueWithSourceTexture:(id)a3 destinationTexture:(id)a4 cropRect:(id *)a5
{
  __int128 v5;
  _OWORD v7[3];

  v5 = *(_OWORD *)&a5->var0.var2;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  return -[EspressoImage2Image encodeToCommandBuffer:sourceTexture:destinationTexture:cropRect:](self, "encodeToCommandBuffer:sourceTexture:destinationTexture:cropRect:", 0, a3, a4, v7);
}

- (int)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 cropRect:(id *)a6
{
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *dispatch_queue;
  uint64_t v14;
  _opaque_pthread_mutex_t *v15;
  float v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  int v20;
  int8x16_t v21;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_output_layer_name;
  float v23;
  int v24;
  int v25;
  int v26;
  _DWORD v28[2];
  float v29;
  float v30;
  char v31;
  _BYTE v32[4];
  __int128 v33;
  _QWORD v34[21];
  int8x16_t v35;
  char v36;
  _DWORD v37[5];
  int32x4_t v38;
  pthread_mutex_t *v39;
  char v40[4];
  int v41;
  OS_dispatch_queue *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  dispatch_queue = self->dispatch_queue;
  v14 = *(_QWORD *)&self->is_temporal_model;
  v40[0] = 1;
  v48 = 0;
  v49 = 0;
  v42 = dispatch_queue;
  v43 = v14;
  v44 = objc_msgSend(v11, "width");
  v45 = objc_msgSend(v11, "height");
  v46 = objc_msgSend(v12, "width");
  v47 = objc_msgSend(v12, "height");
  v41 = 723714088;
  kdebug_trace();
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v39, v15);
  if (*(_QWORD *)&self->_anon_108[120])
  {
    if (Espresso::time_seconds(void)::onceToken != -1)
      dispatch_once(&Espresso::time_seconds(void)::onceToken, &__block_literal_global_349);
    v16 = ((double)(std::chrono::steady_clock::now().__d_.__rep_ - Espresso::time_seconds(void)::t0) * 0.000000001
         - *(float *)&self->dim_small[4])
        * *(float *)&self->_anon_108[92];
    v17 = *(_QWORD *)&self->_anon_108[120];
    *(float *)(v17 + 400) = v16;
    *(_DWORD *)(v17 + 404) = *(_DWORD *)&self->_anon_108[84];
  }
  v18 = a6->var1.var0 | a6->var1.var1;
  if (*(_OWORD *)&a6->var1.var0 != 0)
  {
    v38 = vuzp1q_s32(*(int32x4_t *)&a6->var0.var0, *(int32x4_t *)&a6->var1.var0);
    LODWORD(v18) = 3;
  }
  v37[0] = v18;
  v37[1] = -[EspressoImage2Image rotation_degrees](self, "rotation_degrees");
  v19 = -[EspressoImage2Image flip_y](self, "flip_y");
  v20 = self->_anon_108[116];
  v37[2] = v19;
  v37[3] = v20;
  v37[4] = 0;
  v21 = (int8x16_t)vrev64q_s32(*(int32x4_t *)&self->_anon_108[96]);
  v35 = vextq_s8(v21, v21, 0xCuLL);
  v36 = 0;
  p_output_layer_name = &self->output_layer_name;
  if (*((char *)&self->output_layer_name.__r_.__value_.var0.__l + 23) < 0)
    p_output_layer_name = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_output_layer_name->__r_.__value_.var0.__l.__data_;
  espresso_network_bind_buffer(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)p_output_layer_name, (uint64_t)v34, 0x20000, 0x10000, 0x80000);
  if (LOBYTE(self->device))
  {
    v33 = xmmword_191A82A80;
    v23 = *(float *)&self->_anon_108[80];
    v29 = *(float *)&self->_anon_108[112] * (float)(v23 * -0.5);
    v30 = v23;
    *(float *)v28 = v29;
    *(float *)&v28[1] = v29;
    v31 = 0;
    v24 = espresso_network_bind_input_metaltexture(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)"data1", 0, *(void **)&self->defaultWidth, (uint64_t)v28, (uint64_t)v32);
    if (v24)
      goto LABEL_21;
    v24 = espresso_network_bind_input_metaltexture(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)"data0", 0, v11, (uint64_t)&v35, (uint64_t)v37);
    if (v24)
      goto LABEL_21;
    v25 = espresso_network_bind_input_metaltexture(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)"data2", 0, v11, (uint64_t)&v35, (uint64_t)v37);
  }
  else
  {
    v24 = espresso_network_bind_input_metaltexture(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)"data0", 0, v11, (uint64_t)&v35, (uint64_t)v37);
    if (v24)
      goto LABEL_21;
    v25 = espresso_network_bind_input_metaltexture(self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)"data1", 0, v11, (uint64_t)&v35, (uint64_t)v37);
  }
  v24 = v25;
  if (!v25)
  {
    if (v10)
      v26 = espresso_plan_submit_with_args(self->plan, self->queue, (uint64_t)v10, 0, &__block_literal_global_986);
    else
      v26 = espresso_plan_submit_with_args(self->plan, self->queue, 0, 0, &__block_literal_global_169);
    v24 = v26;
    if (!v26)
    {
      -[EspressoImage2Image postProcess:cameraSourceTexture:inputTexture:destinationTexture:](self, "postProcess:cameraSourceTexture:inputTexture:destinationTexture:", v10, v11, v34[0], v12);
      v24 = 0;
    }
  }
LABEL_21:
  pthread_mutex_locker::~pthread_mutex_locker(&v39);
  Espresso_scoped_signpost::~Espresso_scoped_signpost((Espresso_scoped_signpost *)v40);

  return v24;
}

- (void)simpleLinearResize:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  int v19;
  MTLTexture *smallOldResultTexture;
  char v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::runtime_error *exception;
  int64x2_t v26;
  uint64_t v27;
  _QWORD v28[3];
  void *lpsrc;
  std::__shared_weak_count *v30;
  char v31;
  id *v32;
  std::__shared_weak_count *v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  Espresso::get_internal_context((uint64_t **)self->ctx, &lpsrc);
  if (lpsrc
  {
    v12 = v30;
    v32 = v11;
    v33 = v30;
    if (!v30)
      goto LABEL_12;
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  else
  {
    v32 = 0;
    v33 = 0;
    v12 = v30;
    if (!v30)
      goto LABEL_12;
  }
  v15 = (unint64_t *)&v12->__shared_owners_;
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 - 1, v15));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
LABEL_12:
  objc_msgSend(v32[20], "kernelForFunction:cacheString:withConstants:", "linear_resize_t2d", 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "shader not found");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  objc_msgSend(v8, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLabel:", CFSTR("linear_resize_t2d"));
  objc_msgSend(v18, "setComputePipelineState:", v17);
  objc_msgSend(v18, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v18, "setTexture:atIndex:", v10, 1);
  v19 = *(_DWORD *)&self->_anon_108[8];
  std::string::basic_string[abi:ne180100]<0>(&lpsrc, "temporal_alpha");
  smallOldResultTexture = self->smallOldResultTexture;
  if (!smallOldResultTexture)
  {
LABEL_18:
    v21 = 1;
    goto LABEL_20;
  }
  while (std::operator<[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&lpsrc, (_QWORD *)smallOldResultTexture + 4))
  {
LABEL_17:
    smallOldResultTexture = *(MTLTexture **)smallOldResultTexture;
    if (!smallOldResultTexture)
      goto LABEL_18;
  }
  if (std::operator<[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((_QWORD *)smallOldResultTexture + 4, &lpsrc))
  {
    smallOldResultTexture = (MTLTexture *)((char *)smallOldResultTexture + 8);
    goto LABEL_17;
  }
  v21 = 0;
LABEL_20:
  if (v31 < 0)
  {
    operator delete(lpsrc);
    if ((v21 & 1) == 0)
      goto LABEL_24;
  }
  else
  {
    if ((v21 & 1) != 0)
      goto LABEL_26;
LABEL_24:
    std::string::basic_string[abi:ne180100]<0>(&lpsrc, "temporal_alpha");
    v19 = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->t0, &lpsrc, (uint64_t)&lpsrc)+ 14);
    if (v31 < 0)
      operator delete(lpsrc);
  }
LABEL_26:
  LODWORD(lpsrc) = objc_msgSend(v10, "width");
  HIDWORD(lpsrc) = objc_msgSend(v10, "height");
  LODWORD(v30) = 1065353216;
  HIDWORD(v30) = v19;
  objc_msgSend(v18, "setBytes:length:atIndex:", &lpsrc, 16, 0);
  v28[0] = (unint64_t)(objc_msgSend(v10, "width") + 15) >> 4;
  v28[1] = (unint64_t)(objc_msgSend(v10, "height") + 15) >> 4;
  v28[2] = 1;
  v26 = vdupq_n_s64(0x10uLL);
  v27 = 1;
  objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", v28, &v26);
  objc_msgSend(v18, "endEncoding");

  v22 = v33;
  if (v33)
  {
    v23 = (unint64_t *)&v33->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

}

- (void)postProcess:(id)a3 cameraSourceTexture:(id)a4 inputTexture:(id)a5 destinationTexture:(id)a6
{
  id v10;
  id v11;
  id v12;
  Espresso::context_metal *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  MTLFunctionConstantValues *v19;
  void *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  __int16 v25;
  unsigned __int16 v26;
  uint64_t var0_low;
  uint64_t v28;
  uint64_t v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  int v40;
  int v41;
  int v42;
  int v43;
  unint64_t src_crop_rect;
  float v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::runtime_error *exception;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  int64x2_t v54;
  uint64_t v55;
  _QWORD v56[3];
  _DWORD lpsrc[8];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  int v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _DWORD v69[4];
  uint64_t v70;
  uint64_t v71;
  int v72;
  float v73;
  int32x2_t v74;
  Espresso::context_metal *v75;
  std::__shared_weak_count *v76;

  v52 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  Espresso::get_internal_context((uint64_t **)self->ctx, lpsrc);
  if (*(_QWORD *)lpsrc
  {
    v14 = *(std::__shared_weak_count **)&lpsrc[2];
    v75 = v13;
    v76 = *(std::__shared_weak_count **)&lpsrc[2];
    if (!*(_QWORD *)&lpsrc[2])
      goto LABEL_12;
    v15 = (unint64_t *)(*(_QWORD *)&lpsrc[2] + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  else
  {
    v75 = 0;
    v76 = 0;
    v14 = *(std::__shared_weak_count **)&lpsrc[2];
    if (!*(_QWORD *)&lpsrc[2])
      goto LABEL_12;
  }
  p_shared_owners = (unint64_t *)&v14->__shared_owners_;
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
LABEL_12:
  v53 = v12;
  v51 = v11;
  v19 = (MTLFunctionConstantValues *)objc_opt_new();
  v20 = (void *)objc_opt_new();
  v21 = *(float *)&self->_anon_108[16];
  LOWORD(lpsrc[0]) = v21 > 0.001;
  objc_msgSend(v20, "appendFormat:", CFSTR("%d:%d_"), 5, v21 > 0.001);
  -[MTLFunctionConstantValues setConstantValue:type:atIndex:](v19, "setConstantValue:type:atIndex:", lpsrc, 41, 5);
  v22 = *(float *)&self->_anon_108[12];
  LOWORD(lpsrc[0]) = v22 > 0.001;
  objc_msgSend(v20, "appendFormat:", CFSTR("%d:%d_"), 6, v22 > 0.001);
  -[MTLFunctionConstantValues setConstantValue:type:atIndex:](v19, "setConstantValue:type:atIndex:", lpsrc, 41, 6);
  v23 = fabsf(*(float *)&self->_anon_108[24]);
  LOWORD(lpsrc[0]) = v23 > 0.001;
  objc_msgSend(v20, "appendFormat:", CFSTR("%d:%d_"), 7, v23 > 0.001);
  -[MTLFunctionConstantValues setConstantValue:type:atIndex:](v19, "setConstantValue:type:atIndex:", lpsrc, 41, 7);
  v24 = *(float *)&self->_anon_108[20];
  LOWORD(lpsrc[0]) = v24 > 0.001;
  objc_msgSend(v20, "appendFormat:", CFSTR("%d:%d_"), 8, v24 > 0.001);
  -[MTLFunctionConstantValues setConstantValue:type:atIndex:](v19, "setConstantValue:type:atIndex:", lpsrc, 41, 8);
  if (LODWORD(self->current_postprocessing_settings.name.var0))
  {
    v25 = -[EspressoImage2Image rotation_degrees](self, "rotation_degrees");
    v26 = -[EspressoImage2Image flip_y](self, "flip_y");
    LOWORD(lpsrc[0]) = v25;
    objc_msgSend(v20, "appendFormat:", CFSTR("%d:%d_"), 0, v25);
    -[MTLFunctionConstantValues setConstantValue:type:atIndex:](v19, "setConstantValue:type:atIndex:", lpsrc, 37, 0);
    var0_low = LODWORD(self->current_postprocessing_settings.name.var0);
    LOWORD(lpsrc[0]) = self->current_postprocessing_settings.name.var0;
    objc_msgSend(v20, "appendFormat:", CFSTR("%d:%d_"), 1, var0_low);
    -[MTLFunctionConstantValues setConstantValue:type:atIndex:](v19, "setConstantValue:type:atIndex:", lpsrc, 41, 1);
    v28 = *(unsigned int *)self->_anon_108;
    LOWORD(lpsrc[0]) = *(_DWORD *)self->_anon_108;
    objc_msgSend(v20, "appendFormat:", CFSTR("%d:%d_"), 2, v28);
    -[MTLFunctionConstantValues setConstantValue:type:atIndex:](v19, "setConstantValue:type:atIndex:", lpsrc, 41, 2);
    v29 = *(unsigned int *)&self->_anon_108[4];
    LOWORD(lpsrc[0]) = *(_DWORD *)&self->_anon_108[4];
    objc_msgSend(v20, "appendFormat:", CFSTR("%d:%d_"), 3, v29);
    -[MTLFunctionConstantValues setConstantValue:type:atIndex:](v19, "setConstantValue:type:atIndex:", lpsrc, 41, 3);
    LOWORD(lpsrc[0]) = v26;
    objc_msgSend(v20, "appendFormat:", CFSTR("%d:%d_"), 4, v26);
    -[MTLFunctionConstantValues setConstantValue:type:atIndex:](v19, "setConstantValue:type:atIndex:", lpsrc, 41, 4);
    if (objc_msgSend(v11, "textureType") == 3)
      v30 = CFSTR("image2image_postprocessing_blend_texarray");
    else
      v30 = CFSTR("image2image_postprocessing_blend");
  }
  else if (objc_msgSend(v11, "textureType") == 3)
  {
    v30 = CFSTR("process_output");
  }
  else
  {
    v30 = CFSTR("process_output_t2d");
  }
  Espresso::context_metal::kernel_for_function(v75, &v30->isa, (NSString *)v20, v19);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "shader not found");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v32 = v52;
  if (!v52)
  {
    objc_msgSend(*(id *)&self->output_layer_name.__r_.var0, "commandBuffer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v32, "computeCommandEncoder");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setLabel:", CFSTR("output_texture_array_to_texture"));
  objc_msgSend(v33, "setComputePipelineState:", v31);
  objc_msgSend(v33, "setTexture:atIndex:", v11, 0);
  objc_msgSend(v33, "setTexture:atIndex:", v53, 1);
  objc_msgSend(v33, "setTexture:atIndex:", v10, 3);
  v69[0] = objc_msgSend(v53, "width");
  v69[1] = objc_msgSend(v53, "height");
  v69[2] = 1056997505;
  v69[3] = HIDWORD(self->current_postprocessing_settings.name.var0);
  v70 = 0;
  v71 = 0;
  v34 = 1.0 / *(float *)&self->_anon_108[12];
  v72 = *(_DWORD *)&self->_anon_108[16];
  v73 = v34;
  v74 = vrev64_s32(*(int32x2_t *)&self->_anon_108[20]);
  if (LODWORD(self->current_postprocessing_settings.name.var0))
  {
    objc_msgSend(v33, "setTexture:atIndex:", v10, 2);
    v50 = v10;
    lpsrc[0] = 1065353216;
    *(_QWORD *)&lpsrc[5] = 0;
    lpsrc[7] = 0;
    *(_OWORD *)&lpsrc[1] = 0x100000000uLL;
    v61 = 0;
    v62 = 0;
    v58 = 0;
    v59 = 0;
    __asm { FMOV            V0.2S, #1.0 }
    v60 = _D0;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v67 = 0;
    v68 = 0;
    v66 = 0;
    v40 = -[EspressoImage2Image rotation_degrees](self, "rotation_degrees");
    LODWORD(v66) = v40;
    v41 = objc_msgSend(v53, "width");
    v42 = objc_msgSend(v53, "height");
    if (v40 == 270 || v40 == 90)
    {
      v43 = v42;
    }
    else
    {
      v43 = v41;
      v41 = v42;
    }
    v10 = v50;
    src_crop_rect = Espresso::abstract_blob_container::get_src_crop_rect(objc_msgSend(v50, "width"), objc_msgSend(v50, "height"), lpsrc, v43, v41);
    v45 = (float)(int)src_crop_rect / (float)(unint64_t)objc_msgSend(v50, "width");
    *(float *)&v70 = v45;
    *((float *)&v70 + 1) = (float)SHIDWORD(src_crop_rect) / (float)(unint64_t)objc_msgSend(v50, "height");
    *(float *)&v71 = (float)(v45 * -2.0) + 1.0;
    *((float *)&v71 + 1) = (float)(*((float *)&v70 + 1) * -2.0) + 1.0;
  }
  objc_msgSend(v33, "setBytes:length:atIndex:", v69, 48, 0);
  v56[0] = (unint64_t)(objc_msgSend(v53, "width") + 15) >> 4;
  v56[1] = (unint64_t)(objc_msgSend(v53, "height") + 15) >> 4;
  v56[2] = 1;
  v54 = vdupq_n_s64(0x10uLL);
  v55 = 1;
  objc_msgSend(v33, "dispatchThreadgroups:threadsPerThreadgroup:", v56, &v54);
  objc_msgSend(v33, "endEncoding");
  if (LOBYTE(self->device))
    -[EspressoImage2Image simpleLinearResize:sourceTexture:destinationTexture:](self, "simpleLinearResize:sourceTexture:destinationTexture:", v32, v53, *(_QWORD *)&self->defaultWidth);
  if (!v52)
    objc_msgSend(v32, "commit");

  v46 = v76;
  if (v76)
  {
    v47 = (unint64_t *)&v76->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }

}

- (id)newOutputTexture
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, -[EspressoImage2Image width](self, "width"), -[EspressoImage2Image height](self, "height"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResourceOptions:", 0);
  objc_msgSend(v3, "setStorageMode:", 0);
  objc_msgSend(v3, "setUsage:", 3);
  v4 = (void *)objc_msgSend((id)self->output_layer_name.var0, "newTextureWithDescriptor:", v3);

  return v4;
}

- (void)tune
{
  pthread_mutex_t *v3;

  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v3, (_opaque_pthread_mutex_t *)a2);
  -[EspressoImage2Image _tune](self, "_tune");
  pthread_mutex_locker::~pthread_mutex_locker(&v3);
}

- (void)_tune
{
  uint64_t v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD v13[2];
  uint64_t v14;
  std::__shared_weak_count *v15;

  Espresso::get_internal_network((uint64_t)self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)&v14);
  v2 = v14;
  v3 = *(_QWORD *)(*(_QWORD *)(v14 + 16) + 24);
  *(_DWORD *)(v3 + 8) = 1;
  std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::destroy(*(_QWORD **)(v3 + 96));
  *(_QWORD *)(v3 + 88) = v3 + 96;
  *(_QWORD *)(v3 + 104) = 0;
  *(_QWORD *)(v3 + 96) = 0;
  v4 = v15;
  v13[0] = v2;
  v13[1] = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  Espresso::wisdom_trainer2::tune_network(v3, (uint64_t)v13);
  if (v4)
  {
    v7 = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  Espresso::wisdom_trainer2::to_dict((Espresso::wisdom_trainer2 *)v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("wisdom count=%d"), objc_msgSend(v9, "count"));

  v10 = v15;
  if (v15)
  {
    v11 = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

- (void)aggregateWisdom:(void *)a3
{
  uint64_t v4;
  __int128 *v5;
  __int128 *v6;
  char *v7;
  __int128 *v8;
  __int128 *v9;
  BOOL v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::string v14;
  void *__p;
  _BYTE *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  std::string *v19;

  Espresso::get_internal_network((uint64_t)self->net.plan, *(_QWORD *)&self->net.network_index, (uint64_t)&v17);
  v4 = *(_QWORD *)(*(_QWORD *)(v17 + 16) + 24);
  v5 = *(__int128 **)(v4 + 88);
  v6 = (__int128 *)(v4 + 96);
  if (v5 != (__int128 *)(v4 + 96))
  {
    do
    {
      std::pair<std::string const,std::vector<int>>::pair[abi:ne180100](&v14, v5 + 2);
      v19 = &v14;
      v7 = (char *)(std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 11, &v14, (__int128 **)&v19)+ 7);
      if (v7 != (char *)&__p)
        std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v7, (char *)__p, (uint64_t)v16, (v16 - (_BYTE *)__p) >> 2);
      if (__p)
      {
        v16 = __p;
        operator delete(__p);
      }
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v14.__r_.__value_.__l.__data_);
      v8 = (__int128 *)*((_QWORD *)v5 + 1);
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = *(__int128 **)v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (__int128 *)*((_QWORD *)v5 + 2);
          v10 = *(_QWORD *)v9 == (_QWORD)v5;
          v5 = v9;
        }
        while (!v10);
      }
      v5 = v9;
    }
    while (v9 != v6);
  }
  Espresso::wisdom_trainer2::save((Espresso::wisdom_trainer2 *)a3, "/tmp/wisdom.plist");
  v11 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (float)benchmark
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  _OWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  uint64_t v18;

  v3 = -[EspressoImage2Image newOutputTexture](self, "newOutputTexture");
  v4 = -[EspressoImage2Image newOutputTexture](self, "newOutputTexture");
  v5 = (id)objc_msgSend((id)self->output_layer_name.var0, "newCommandQueue");
  objc_msgSend(v5, "setBackgroundGPUPriority:", 2);
  objc_msgSend(v5, "setGPUPriority:", 2);
  objc_msgSend(v5, "commandBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v16, 0, sizeof(v16));
  v17 = 0;
  v18 = 1;
  -[EspressoImage2Image encodeToCommandBuffer:sourceTexture:destinationTexture:cropRect:](self, "encodeToCommandBuffer:sourceTexture:destinationTexture:cropRect:", v6, v3, v4, v16);
  objc_msgSend(v6, "commit");
  objc_msgSend(v6, "waitUntilCompleted");

  objc_msgSend(v5, "commandBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 50;
  do
  {
    memset(v13, 0, sizeof(v13));
    v14 = 0;
    v15 = 1;
    -[EspressoImage2Image encodeToCommandBuffer:sourceTexture:destinationTexture:cropRect:](self, "encodeToCommandBuffer:sourceTexture:destinationTexture:cropRect:", v7, v3, v4, v13);
    --v8;
  }
  while (v8);
  objc_msgSend(v7, "commit");
  objc_msgSend(v7, "waitUntilCompleted");
  objc_msgSend(v7, "GPUEndTime");
  v10 = v9;
  objc_msgSend(v7, "GPUStartTime");
  *(float *)&v10 = (v10 - v11) * 1000.0 / 50.0;

  return *(float *)&v10;
}

- (int)rotation_degrees
{
  return (int)self->precomputed_noise.__cntrl_;
}

- (void)setRotation_degrees:(int)a3
{
  LODWORD(self->precomputed_noise.__cntrl_) = a3;
}

- (int)flip_y
{
  return HIDWORD(self->precomputed_noise.__cntrl_);
}

- (void)setFlip_y:(int)a3
{
  HIDWORD(self->precomputed_noise.__cntrl_) = a3;
}

- (void).cxx_destruct
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  objc_storeStrong(&self->precomputed_noise.__ptr_, 0);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->currentNetworkPath);
  objc_storeStrong((id *)&self->noise_load_constant_kernel.__ptr_, 0);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->noise_k);
  v3 = *(std::__shared_weak_count **)&self->_anon_108[128];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  if (*((char *)&self->current_postprocessing_settings.name.__r_.var1 + 3) < 0)
    operator delete((void *)self->current_postprocessing_settings.name.__r_.__value_.var0.__l.__size_);
  if (self->current_postprocessing_settings.name.__r_.__value_.var0.__s.__data_[7] < 0)
    operator delete(self->tweaks.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy((char *)self->smallOldResultTexture);
  objc_storeStrong((id *)&self->defaultWidth, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->output_layer_name.var0, 0);
  objc_storeStrong((id *)&self->output_layer_name.__r_.var0, 0);
  if (*((char *)&self->output_layer_name.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->output_layer_name.__r_.__value_.var0.__l.__data_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0uLL;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 25) = (char *)self + 208;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_QWORD *)self + 34) = 0x3E99999A00000000;
  *((_QWORD *)self + 35) = 0;
  *((_OWORD *)self + 18) = xmmword_191A93390;
  *((_DWORD *)self + 76) = 0;
  *(_OWORD *)((char *)self + 308) = xmmword_191A933A0;
  *(_OWORD *)((char *)self + 324) = xmmword_191A933B0;
  *(_OWORD *)((char *)self + 340) = xmmword_191A933C0;
  *((_DWORD *)self + 89) = 960;
  *((_QWORD *)self + 45) = 0x3F8000003DA3D70ALL;
  *((_DWORD *)self + 92) = 0;
  *(_OWORD *)((char *)self + 372) = xmmword_191A933D0;
  *(_QWORD *)((char *)self + 388) = 0x3F8000003F79999ALL;
  *((_BYTE *)self + 396) = 0;
  *((_QWORD *)self + 56) = 0;
  *((_QWORD *)self + 57) = 0;
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 26) = 0u;
  return self;
}

+ (void)setDefaultOption:(id)a3 toValue:(id)a4
{
  id v6;
  id v7;
  _opaque_pthread_mutex_t *v8;
  void *v9;
  pthread_mutex_t *v10;

  v6 = a3;
  v7 = a4;
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v10, v8);
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("engine")))
  {
    default_engine = objc_msgSend(v7, "intValue");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("experimental_mode")))
  {
    experimental_mode = objc_msgSend(v7, "intValue");
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("settings")) & 1) != 0
         || objc_msgSend(v6, "isEqualToString:", CFSTR("config")))
  {
    objc_msgSend(v7, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "loadStylesConfigAtPath:", v9);

  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("v9_optimizations_disabled_bitfield")))
  {
    v9_optimizations_disabled_bitfield = objc_msgSend(v7, "unsignedIntValue");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("v9_force_instancenorm_subsampling")))
  {
    v9_force_instancenorm_subsampling = objc_msgSend(v7, "intValue");
  }
  pthread_mutex_locker::~pthread_mutex_locker(&v10);

}

+ (BOOL)loadStylesConfigAtPath:(id)a3
{
  id v4;
  NSDictionary *v5;
  id v6;
  uint64_t v7;

  v4 = a3;
  objc_storeStrong((id *)&plistPath, a3);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1)
    dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_12627);
  Espresso::Image2Image::settings_t::load_style_settings_from_dict((uint64_t **)Espresso::Image2Image::settings_t::shared(void)::global, v5);
  objc_msgSend(v4, "stringByDeletingLastPathComponent");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "UTF8String");
  if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1)
    dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_12627);
  MEMORY[0x19401C808](Espresso::Image2Image::settings_t::shared(void)::global + 48, v7);

  return 1;
}

+ (BOOL)loadStylesConfigAtDefaultsKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSDictionary *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentDomainForName:", *MEMORY[0x1E0CB2B58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1)
    dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_12627);
  Espresso::Image2Image::settings_t::load_style_settings_from_dict((uint64_t **)Espresso::Image2Image::settings_t::shared(void)::global, v6);

  return 1;
}

+ (id)getStylesKeys
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  std::string *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  std::string v14;
  std::string v15;
  std::string __p;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];

  v2 = (void *)objc_opt_new();
  if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1)
    dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_12627);
  v3 = Espresso::Image2Image::settings_t::shared(void)::global + 8;
  v4 = *(_QWORD **)Espresso::Image2Image::settings_t::shared(void)::global;
  if (*(_QWORD *)Espresso::Image2Image::settings_t::shared(void)::global != Espresso::Image2Image::settings_t::shared(void)::global
                                                                           + 8)
  {
    do
    {
      if (*((char *)v4 + 55) < 0)
        std::string::__init_copy_ctor_external(&v14, (const std::string::value_type *)v4[4], v4[5]);
      else
        v14 = *(std::string *)(v4 + 4);
      if (*((char *)v4 + 79) < 0)
        std::string::__init_copy_ctor_external(&v15, (const std::string::value_type *)v4[7], v4[8]);
      else
        v15 = *(std::string *)(v4 + 7);
      if (*((char *)v4 + 103) < 0)
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v4[10], v4[11]);
      else
        __p = *(std::string *)(v4 + 10);
      v5 = *(_OWORD *)(v4 + 23);
      v21 = *(_OWORD *)(v4 + 21);
      v22 = v5;
      v23[0] = *(_OWORD *)(v4 + 25);
      *(_OWORD *)((char *)v23 + 13) = *(_OWORD *)((char *)v4 + 213);
      v6 = *(_OWORD *)(v4 + 15);
      v17 = *(_OWORD *)(v4 + 13);
      v18 = v6;
      v7 = *(_OWORD *)(v4 + 19);
      v19 = *(_OWORD *)(v4 + 17);
      v20 = v7;
      if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v8 = &v14;
      else
        v8 = (std::string *)v14.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8, *(_OWORD *)&v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__r.__words[2]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v9);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v15.__r_.__value_.__l.__data_);
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v14.__r_.__value_.__l.__data_);
      v10 = (_QWORD *)v4[1];
      if (v10)
      {
        do
        {
          v11 = v10;
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v11 = (_QWORD *)v4[2];
          v12 = *v11 == (_QWORD)v4;
          v4 = v11;
        }
        while (!v12);
      }
      v4 = v11;
    }
    while (v11 != (_QWORD *)v3);
  }
  return v2;
}

+ (int)featureVersion
{
  return 1;
}

+ (void)gpuSync:(id)a3 tex:(id)a4
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "commit");
  objc_msgSend(v4, "waitUntilCompleted");

}

+ (void)tuneNetworks:(id)a3
{
  uint64_t v3;
  int v4;
  float v5;
  uint64_t i;
  id v7;
  void *v8;
  uint64_t j;
  uint64_t v10;
  void *v11;
  double v12;
  id v13;
  uint64_t v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  std::string __p;
  _BYTE v23[32];
  void *v24;
  char v25;
  void *v26;
  char v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  _BYTE v31[128];
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  Espresso::wisdom_trainer2::wisdom_trainer2((uint64_t)v23, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v3 = 0;
  v32 = xmmword_191A93420;
  do
  {
    v14 = v3;
    v4 = *((_DWORD *)&v32 + v3);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v13;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    if (v17)
    {
      v16 = *(_QWORD *)v19;
      v5 = (float)v4;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(obj);
          v7 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v8 = (void *)MEMORY[0x19401D4A4]();
          for (j = 0; j != 7; ++j)
          {
            v10 = qword_191A97710[j];
            objc_msgSend(v7, "reshapeToResolutionPreset:", v10);
            objc_msgSend(v7, "styleName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("[Tuning] %@ %d (%d x %d)"), v11, v10, objc_msgSend(v7, "width"), objc_msgSend(v7, "height"));

            *(float *)&v12 = v5;
            objc_msgSend(v7, "tweak:value:", CFSTR("winograd"), v12);
            objc_msgSend(v7, "tune");
            objc_msgSend(v7, "aggregateWisdom:", v23);
          }
          objc_autoreleasePoolPop(v8);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
      }
      while (v17);
    }

    v3 = v14 + 1;
  }
  while (v14 != 3);
  if (v29)
  {
    v30 = v29;
    operator delete(v29);
  }
  std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::destroy(v28);
  if (v27 < 0)
    operator delete(v26);
  if (v25 < 0)
    operator delete(v24);

}

+ (void)tuneNetworksWGWindowSize:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  const void *v7;
  void (***v8)(void **__return_ptr, void *);
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  id v12;
  uint64_t v13;
  int v14;
  __int128 v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  const void *v26;
  void *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char *v40;
  uint64_t v41;
  char *v42;
  _BYTE *v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  int v47;
  float v48;
  float v49;
  int v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  void *v64;
  int v65;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  std::__shared_weak_count *v85;
  unint64_t *v86;
  unint64_t v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  unint64_t *v91;
  unint64_t v92;
  std::__shared_weak_count *v93;
  unint64_t *v94;
  unint64_t v95;
  id obj;
  uint64_t v97;
  uint64_t v98;
  int v99;
  void *context;
  std::__shared_weak_count *v101;
  uint64_t v102;
  id v103;
  _OWORD v104[2];
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  std::__shared_weak_count *v110;
  uint64_t v111;
  std::__shared_weak_count *v112;
  std::string *v113;
  std::string *v114;
  std::string *v115;
  std::string *v116;
  std::string *v117;
  std::string *v118;
  void *v119;
  std::__shared_weak_count *v120;
  char v121;
  void *v122;
  std::__shared_weak_count *v123;
  char v124;
  uint64_t v125;
  std::__shared_weak_count *v126;
  uint64_t v127[2];
  uint64_t v128[2];
  __int128 v129;
  _QWORD *v130[7];
  char v131;
  std::__shared_weak_count *v132;
  std::__shared_weak_count *v133;
  std::__shared_weak_count *v134;
  uint64_t v135;
  unint64_t v136;
  int v137;
  void *__p;
  void *v139;
  _OWORD v140[2];
  uint64_t v141;
  void *v142;
  _BYTE *v143;
  _OWORD v144[2];
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  uint64_t v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  std::string **v159;
  char v160;
  void *v161[2];
  char v162;
  void *v163[2];
  char v164;
  __int128 v165;
  _BYTE v166[128];
  uint64_t v167;

  v167 = *MEMORY[0x1E0C80C00];
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v166, 16);
  if (v3)
  {
    v97 = *(_QWORD *)v156;
    do
    {
      v102 = 0;
      v98 = v3;
      do
      {
        if (*(_QWORD *)v156 != v97)
          objc_enumerationMutation(obj);
        v103 = *(id *)(*((_QWORD *)&v155 + 1) + 8 * v102);
        context = (void *)MEMORY[0x19401D4A4]();
        v4 = objc_msgSend(v103, "getEspressoNetwork");
        Espresso::get_internal_network(v4, v5, (uint64_t)&v154);
        v6 = v154;
        v7 = *(const void **)(v154 + 16);
        if (v7)
        {
          if (v8 && (v9 = *(std::__shared_weak_count **)(v6 + 24)) != 0)
          {
            p_shared_owners = (unint64_t *)&v9->__shared_owners_;
            do
              v11 = __ldxr(p_shared_owners);
            while (__stxr(v11 + 1, p_shared_owners));
            v101 = v9;
          }
          else
          {
            v101 = 0;
          }
        }
        else
        {
          v101 = 0;
          v8 = 0;
        }
        v99 = *((_DWORD *)v8 + 57);
        *((_DWORD *)v8 + 57) = -1;
        objc_msgSend(v103, "reload");
        objc_msgSend(v103, "reshapeToResolutionPreset:", 2);
        objc_msgSend(v103, "styleName");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        printf("WG-tuning %s %d %d\n", (const char *)objc_msgSend(v12, "UTF8String"), objc_msgSend(v103, "width"), objc_msgSend(v103, "height"));

        v13 = objc_msgSend(v103, "getEspressoNetwork");
        Espresso::get_internal_network(v13, v14, (uint64_t)&v129);
        v15 = v129;
        v129 = 0uLL;
        v16 = (std::__shared_weak_count *)*((_QWORD *)&v154 + 1);
        v154 = v15;
        if (v16)
        {
          v17 = (unint64_t *)&v16->__shared_owners_;
          do
            v18 = __ldaxr(v17);
          while (__stlxr(v18 - 1, v17));
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
            std::__shared_weak_count::__release_weak(v16);
          }
        }
        v19 = (std::__shared_weak_count *)*((_QWORD *)&v129 + 1);
        if (*((_QWORD *)&v129 + 1))
        {
          v20 = (unint64_t *)(*((_QWORD *)&v129 + 1) + 8);
          do
            v21 = __ldaxr(v20);
          while (__stlxr(v21 - 1, v20));
          if (!v21)
          {
            ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
            std::__shared_weak_count::__release_weak(v19);
          }
        }
        v22 = v154;
        v23 = *(_QWORD *)(v154 + 32);
        if (*(_QWORD *)(v154 + 40) != v23)
        {
          v24 = 0;
          while (1)
          {
            v25 = *(_QWORD *)(v23 + 16 * v24);
            v26 = *(const void **)(v25 + 64);
            if (v26)
            {
              if (v27)
                break;
            }
LABEL_44:
            ++v24;
            v22 = v154;
            v23 = *(_QWORD *)(v154 + 32);
            if (v24 >= (*(_QWORD *)(v154 + 40) - v23) >> 4)
              goto LABEL_132;
          }
          v28 = *(std::__shared_weak_count **)(v25 + 72);
          if (v28)
          {
            v29 = (unint64_t *)&v28->__shared_owners_;
            do
              v30 = __ldxr(v29);
            while (__stxr(v30 + 1, v29));
          }
          v31 = (*(uint64_t (**)(void *))(*(_QWORD *)v27 + 384))(v27);
          v32 = *(_OWORD *)v31;
          v33 = *(_OWORD *)(v31 + 32);
          v144[1] = *(_OWORD *)(v31 + 16);
          v145 = v33;
          v144[0] = v32;
          v34 = *(_OWORD *)(v31 + 48);
          v35 = *(_OWORD *)(v31 + 64);
          v36 = *(_OWORD *)(v31 + 96);
          v148 = *(_OWORD *)(v31 + 80);
          v149 = v36;
          v146 = v34;
          v147 = v35;
          v37 = *(_OWORD *)(v31 + 112);
          v38 = *(_OWORD *)(v31 + 128);
          v39 = *(_OWORD *)(v31 + 144);
          v153 = *(_QWORD *)(v31 + 160);
          v151 = v38;
          v152 = v39;
          v150 = v37;
          v136 = v24;
          *(_QWORD *)&v129 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v22 + 56, v24, &v136)[3];
          v40 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v22 + 136, (unsigned __int8 *)v129, (__int128 **)&v129);
          Espresso::abstract_blob_container::shape((char *)v140, *((_QWORD *)v40 + 5));
          v41 = v154;
          v122 = (void *)v24;
          *(_QWORD *)&v129 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v154 + 96, v24, &v122)[3];
          v42 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v41 + 136, (unsigned __int8 *)v129, (__int128 **)&v129);
          Espresso::abstract_blob_container::shape((char *)&v136, *((_QWORD *)v42 + 5));
          if (WORD6(v148) == 1 && HIWORD(v148) == 1 && (_QWORD)v146 == 0x300000003 && v137 >= 5)
          {
            printf("\tilayer=%d (%d %d %d -> %d %d %d) C=%d\n", v24, LODWORD(v140[0]), DWORD1(v140[0]), DWORD2(v140[0]), v136, HIDWORD(v136), v137, DWORD2(v145));
            v46 = 0;
            v47 = 0;
            v165 = xmmword_191A93420;
            v48 = 0.0;
            v49 = -1.0;
            do
            {
              v50 = *(_DWORD *)&v166[4 * v46 - 16];
              *((_DWORD *)v8 + 57) = v50;
              DWORD1(v152) = v50;
              v51 = *(std::__shared_weak_count **)(v154 + 24);
              v128[0] = *(_QWORD *)(v154 + 16);
              v128[1] = (uint64_t)v51;
              if (v51)
              {
                v52 = (unint64_t *)&v51->__shared_owners_;
                do
                  v53 = __ldxr(v52);
                while (__stxr(v53 + 1, v52));
              }
              v127[0] = 0;
              v127[1] = 0;
              Espresso::sequential_builder::sequential_builder((uint64_t)&v129, v128, 1, v127);
              if (v51)
              {
                v54 = (unint64_t *)&v51->__shared_owners_;
                do
                  v55 = __ldaxr(v54);
                while (__stlxr(v55 - 1, v54));
                if (!v55)
                {
                  ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
                  std::__shared_weak_count::__release_weak(v51);
                }
              }
              std::string::basic_string[abi:ne180100]<0>(&v122, "convolution");
              std::string::basic_string[abi:ne180100]<0>(&v119, "conv");
              std::string::basic_string[abi:ne180100]<0>(v163, "data");
              v116 = 0;
              v117 = 0;
              v118 = 0;
              v161[0] = &v116;
              LOBYTE(v161[1]) = 0;
              v116 = (std::string *)operator new(0x18uLL);
              v117 = v116;
              v118 = v116 + 1;
              v117 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v118, (__int128 *)v163, &v165, v116);
              std::string::basic_string[abi:ne180100]<0>(v161, "conv");
              v113 = 0;
              v114 = 0;
              v115 = 0;
              v159 = &v113;
              v160 = 0;
              v113 = (std::string *)operator new(0x18uLL);
              v114 = v113;
              v115 = v113 + 1;
              v114 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v115, (__int128 *)v161, (__int128 *)v163, v113);
              Espresso::sequential_builder::add_t<Espresso::generic_convolution_kernel,Espresso::convolution_uniforms>(&v125, (uint64_t *)&v129, (uint64_t)&v122, (uint64_t)&v119, (uint64_t)v144, (uint64_t *)&v116, (uint64_t *)&v113);
              v159 = &v113;
              std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v159);
              if (v162 < 0)
                operator delete(v161[0]);
              v161[0] = &v116;
              std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v161);
              if (v164 < 0)
                operator delete(v163[0]);
              if (v121 < 0)
                operator delete(v119);
              if (v124 < 0)
                operator delete(v122);
              v56 = v125;
              (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v125 + 472))(&v111, v125);
              (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v56 + 400))(v56, &v111);
              v57 = v112;
              if (v112)
              {
                v58 = (unint64_t *)&v112->__shared_owners_;
                do
                  v59 = __ldaxr(v58);
                while (__stlxr(v59 - 1, v58));
                if (!v59)
                {
                  ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
                  std::__shared_weak_count::__release_weak(v57);
                }
              }
              v60 = v125;
              (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v125 + 488))(&v109, v125);
              (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v60 + 392))(v60, &v109);
              v61 = v110;
              if (v110)
              {
                v62 = (unint64_t *)&v110->__shared_owners_;
                do
                  v63 = __ldaxr(v62);
                while (__stlxr(v63 - 1, v62));
                if (!v63)
                {
                  ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
                  std::__shared_weak_count::__release_weak(v61);
                }
              }
              v104[0] = v140[0];
              v104[1] = v140[1];
              v105 = v141;
              v107 = 0;
              v108 = 0;
              v106 = 0;
              std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v106, v142, (uint64_t)v143, (v143 - (_BYTE *)v142) >> 2);
              Espresso::sequential_builder::build_from_data_shape((uint64_t)&v129, (char *)v104, &v122);
              if (v106)
              {
                v107 = v106;
                operator delete(v106);
              }
              (**v8)(&v119, v8);
              v64 = v122;
              Espresso::net::__forward((uint64_t)v122, &v119, 0, 0xFFFFFFFFLL);
              (*(void (**)(void *))(*(_QWORD *)v119 + 24))(v119);
              (**v8)(v163, v8);
              v65 = 32;
              do
              {
                Espresso::net::__forward((uint64_t)v64, v163, 0, 0xFFFFFFFFLL);
                --v65;
              }
              while (v65);
              (*(void (**)(void *))(*(_QWORD *)v163[0] + 24))(v163[0]);
              if (v50 == -1)
              {
                v48 = (float)(*((float *)v163[0] + 14) * 0.03125) * 1000.0;
              }
              else if ((float)((float)(*((float *)v163[0] + 14) * 0.03125) * 1000.0) < v49 || v47 == 0)
              {
                v47 = v50;
                v49 = (float)(*((float *)v163[0] + 14) * 0.03125) * 1000.0;
              }
              v67 = (std::__shared_weak_count *)v163[1];
              if (v163[1])
              {
                v68 = (unint64_t *)((char *)v163[1] + 8);
                do
                  v69 = __ldaxr(v68);
                while (__stlxr(v69 - 1, v68));
                if (!v69)
                {
                  ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
                  std::__shared_weak_count::__release_weak(v67);
                }
              }
              v70 = v120;
              if (v120)
              {
                v71 = (unint64_t *)&v120->__shared_owners_;
                do
                  v72 = __ldaxr(v71);
                while (__stlxr(v72 - 1, v71));
                if (!v72)
                {
                  ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
                  std::__shared_weak_count::__release_weak(v70);
                }
              }
              v73 = v123;
              if (v123)
              {
                v74 = (unint64_t *)&v123->__shared_owners_;
                do
                  v75 = __ldaxr(v74);
                while (__stlxr(v75 - 1, v74));
                if (!v75)
                {
                  ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
                  std::__shared_weak_count::__release_weak(v73);
                }
              }
              v76 = v126;
              if (v126)
              {
                v77 = (unint64_t *)&v126->__shared_owners_;
                do
                  v78 = __ldaxr(v77);
                while (__stlxr(v78 - 1, v77));
                if (!v78)
                {
                  ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
                  std::__shared_weak_count::__release_weak(v76);
                }
              }
              std::deque<std::pair<std::shared_ptr<Espresso::abstract_context>,Espresso::compute_path>>::~deque[abi:ne180100]((uint64_t)&v135);
              v79 = v134;
              if (v134)
              {
                v80 = (unint64_t *)&v134->__shared_owners_;
                do
                  v81 = __ldaxr(v80);
                while (__stlxr(v81 - 1, v80));
                if (!v81)
                {
                  ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
                  std::__shared_weak_count::__release_weak(v79);
                }
              }
              v82 = v133;
              if (v133)
              {
                v83 = (unint64_t *)&v133->__shared_owners_;
                do
                  v84 = __ldaxr(v83);
                while (__stlxr(v84 - 1, v83));
                if (!v84)
                {
                  ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
                  std::__shared_weak_count::__release_weak(v82);
                }
              }
              v85 = v132;
              if (v132)
              {
                v86 = (unint64_t *)&v132->__shared_owners_;
                do
                  v87 = __ldaxr(v86);
                while (__stlxr(v87 - 1, v86));
                if (!v87)
                {
                  ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
                  std::__shared_weak_count::__release_weak(v85);
                }
              }
              if (v131 < 0)
                operator delete(v130[5]);
              std::__tree<std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::__map_value_compare<Espresso::AOT::BackendIdentifier,std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::less<Espresso::AOT::BackendIdentifier>,true>,std::allocator<std::__value_type<Espresso::AOT::BackendIdentifier,double>>>::destroy((uint64_t)v130, v130[1]);
              v88 = (std::__shared_weak_count *)*((_QWORD *)&v129 + 1);
              if (*((_QWORD *)&v129 + 1))
              {
                v89 = (unint64_t *)(*((_QWORD *)&v129 + 1) + 8);
                do
                  v90 = __ldaxr(v89);
                while (__stlxr(v90 - 1, v89));
                if (!v90)
                {
                  ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
                  std::__shared_weak_count::__release_weak(v88);
                }
              }
              ++v46;
            }
            while (v46 != 4);
            printf("\tilayer=%d wg=%d dt=%.4f speedup=%.2f (%d %d %d -> %d %d %d)\n", v24, v47, v49, (float)(v48 / v49), LODWORD(v140[0]), DWORD1(v140[0]), DWORD2(v140[0]), v136, HIDWORD(v136), v137);
            if (__p)
            {
              v139 = __p;
              operator delete(__p);
            }
            v43 = v142;
            v3 = v98;
            if (v142)
            {
LABEL_38:
              v143 = v43;
              operator delete(v43);
            }
          }
          else
          {
            if (__p)
            {
              v139 = __p;
              operator delete(__p);
            }
            v43 = v142;
            if (v142)
              goto LABEL_38;
          }
          if (v28)
          {
            v44 = (unint64_t *)&v28->__shared_owners_;
            do
              v45 = __ldaxr(v44);
            while (__stlxr(v45 - 1, v44));
            if (!v45)
            {
              ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
              std::__shared_weak_count::__release_weak(v28);
            }
          }
          goto LABEL_44;
        }
LABEL_132:
        *((_DWORD *)v8 + 57) = v99;
        if (v101)
        {
          v91 = (unint64_t *)&v101->__shared_owners_;
          do
            v92 = __ldaxr(v91);
          while (__stlxr(v92 - 1, v91));
          if (!v92)
          {
            ((void (*)(std::__shared_weak_count *))v101->__on_zero_shared)(v101);
            std::__shared_weak_count::__release_weak(v101);
          }
        }
        v93 = (std::__shared_weak_count *)*((_QWORD *)&v154 + 1);
        if (*((_QWORD *)&v154 + 1))
        {
          v94 = (unint64_t *)(*((_QWORD *)&v154 + 1) + 8);
          do
            v95 = __ldaxr(v94);
          while (__stlxr(v95 - 1, v94));
          if (!v95)
          {
            ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
            std::__shared_weak_count::__release_weak(v93);
          }
        }
        objc_autoreleasePoolPop(context);

        ++v102;
      }
      while (v102 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v166, 16);
    }
    while (v3);
  }

}

@end

@implementation FTCinematicTapToTrack

+ (id)tracker
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEspressoEngine:scalingBackend:commandQueue:", 10007, 0, 0);
}

- (FTCinematicTapToTrack)initWithEspressoEngine:(int)a3 scalingBackend:(int)a4 commandQueue:(id)a5
{
  uint64_t v6;
  id v9;
  FTCinematicTapToTrack *v10;
  FTCinematicTapToTrack *v11;
  FTTapToBox *v12;
  FTTapToBox *tapToBox;
  FTCinematicTapToTrack *v14;
  int v16;
  char v17;
  objc_super v18;

  v6 = *(_QWORD *)&a4;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FTCinematicTapToTrack;
  v10 = -[FTCinematicTapToTrack init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_commandQueue, a5);
    v12 = objc_alloc_init(FTTapToBox);
    tapToBox = v11->_tapToBox;
    v11->_tapToBox = v12;

    -[FTCinematicTapToTrack _setupScalerWithBackend:](v11, "_setupScalerWithBackend:", v6);
    v16 = a3;
    v17 = 1;
    -[FTCinematicTapToTrack _setupNetworksWithEngine:](v11, "_setupNetworksWithEngine:", &v16);
    v14 = v11;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_setupScalerWithBackend:(int)a3
{
  FTVTScaler *v4;
  FTScaling *scaler;
  FTTapToTrackPreprocessor *v6;
  FTTapToTrackPreprocessor *preprocessor;

  if (a3 == 1)
  {
    v4 = -[FTVTScaler initWithCommandQueue:]([FTVTScaler alloc], "initWithCommandQueue:", self->_commandQueue);
    goto LABEL_5;
  }
  if (!a3)
  {
    v4 = objc_alloc_init(FTMSRScaler);
LABEL_5:
    scaler = self->_scaler;
    self->_scaler = (FTScaling *)v4;

  }
  v6 = -[FTTapToTrackPreprocessor initWithScaler:]([FTTapToTrackPreprocessor alloc], "initWithScaler:", self->_scaler);
  preprocessor = self->_preprocessor;
  self->_preprocessor = v6;

}

- (void)_setupNetworksWithEngine:(const void *)a3
{
  FTNetworkDescriptor *v5;
  FTNetworkDescriptor *exemplarNetDesc;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  EspressoNet *value;
  void **v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void **v16;
  ft *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  double v22;
  double v23;
  __shared_weak_count *v24;
  TensorStorage *v25;
  unint64_t *v26;
  unint64_t v27;
  __shared_weak_count *cntrl;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  FTNetworkDescriptor *v34;
  FTNetworkDescriptor *instanceNetDesc;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  EspressoNet *v39;
  void **v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void **v45;
  ft *v46;
  NSObject *v47;
  uint64_t v48;
  _QWORD *v49;
  void *v50;
  double v51;
  double v52;
  __shared_weak_count *v53;
  TensorStorage *v54;
  unint64_t *v55;
  unint64_t v56;
  __shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  __int128 v63;
  int v64;
  char v65;
  char v66;
  char v67;
  char v68;
  __int128 buf;
  void *v70;
  char *v71;
  TensorStorage *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *__p;
  char v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  +[FTCinematicTracker highPriorityExemplarNetworkDescriptor](FTCinematicTracker, "highPriorityExemplarNetworkDescriptor");
  v5 = (FTNetworkDescriptor *)objc_claimAutoreleasedReturnValue();
  exemplarNetDesc = self->_exemplarNetDesc;
  self->_exemplarNetDesc = v5;

  -[FTNetworkDescriptor name](self->_exemplarNetDesc, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTCinematicTapToTrack _resolveNetworkPath:](self, "_resolveNetworkPath:", v7);
  -[FTCinematicTapToTrack _espressoConfigFromDescriptor:engine:](self, "_espressoConfigFromDescriptor:engine:", self->_exemplarNetDesc, a3);
  v8 = operator new();
  *(_QWORD *)v8 = &unk_24C55E8B8;
  v9 = operator new(0x128uLL);
  v9[2] = 0;
  *v9 = &unk_24C55EB60;
  v9[1] = 0;
  *(_QWORD *)(v8 + 8) = ik::core::EspressoNetState::EspressoNetState((uint64_t)(v9 + 3), &v63, (ik::EspressoConfig *)&buf);
  *(_QWORD *)(v8 + 16) = v9;
  value = self->_exemplarNet.__ptr_.__value_;
  self->_exemplarNet.__ptr_.__value_ = (EspressoNet *)v8;
  if (value)
    (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
  if (v77 < 0)
    operator delete(__p);
  v11 = (void **)v75;
  if (v75)
  {
    do
    {
      v16 = (void **)*v11;
      if (*((char *)v11 + 39) < 0)
        operator delete(v11[2]);
      operator delete(v11);
      v11 = v16;
    }
    while (v16);
  }
  v12 = v74;
  v74 = 0;
  if (v12)
    operator delete(v12);
  v13 = buf;
  if ((_QWORD)buf)
  {
    v14 = *((_QWORD *)&buf + 1);
    v15 = (void *)buf;
    if (*((_QWORD *)&buf + 1) != (_QWORD)buf)
    {
      do
      {
        if (*(char *)(v14 - 1) < 0)
          operator delete(*(void **)(v14 - 24));
        v14 -= 24;
      }
      while (v14 != v13);
      v15 = (void *)buf;
    }
    *((_QWORD *)&buf + 1) = v13;
    operator delete(v15);
  }
  if (v66 < 0)
    operator delete((void *)v63);

  ft::GetOsLog(v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = *((_QWORD *)self->_exemplarNet.__ptr_.__value_ + 1);
    v20 = (_QWORD *)(v19 + 32);
    if (*(char *)(v19 + 55) < 0)
      v20 = (_QWORD *)*v20;
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = v20;
    _os_log_impl(&dword_20CC71000, v18, OS_LOG_TYPE_INFO, "SiameseRPN exemplar network loaded: %s", (uint8_t *)&buf, 0xCu);
  }

  -[FTNetworkDescriptor onlyImageInput](self->_exemplarNetDesc, "onlyImageInput");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "size");
  *(_QWORD *)&v63 = (unint64_t)v22;
  objc_msgSend(v21, "size");
  *((_QWORD *)&v63 + 1) = (unint64_t)v23;
  v64 = objc_msgSend(v21, "pixelFormat");
  v65 = 1;
  v67 = 0;
  v68 = 0;
  ik::PixelBufferTensor::PixelBufferTensor((ik::PixelBufferTensor *)&buf, (uint64_t)&v63);
  self->_exemplarCrop.type_ = DWORD2(buf);
  if (&self->_exemplarCrop != (PixelBufferTensor *)&buf)
    std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&self->_exemplarCrop.shape_.sizes_.__begin_, (char *)v70, v71, (v71 - (_BYTE *)v70) >> 3);
  v25 = v72;
  v24 = (__shared_weak_count *)v73;
  if (v73)
  {
    v26 = (unint64_t *)(v73 + 8);
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  cntrl = self->_exemplarCrop.storage_.__cntrl_;
  self->_exemplarCrop.storage_.__ptr_ = v25;
  self->_exemplarCrop.storage_.__cntrl_ = v24;
  if (cntrl)
  {
    v29 = (unint64_t *)((char *)cntrl + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  *(_QWORD *)&buf = &unk_24C55EA38;
  v31 = (std::__shared_weak_count *)v73;
  if (v73)
  {
    v32 = (unint64_t *)(v73 + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  if (v70)
  {
    v71 = (char *)v70;
    operator delete(v70);
  }
  +[FTCinematicTracker highPriorityInstanceNetworkDescriptor](FTCinematicTracker, "highPriorityInstanceNetworkDescriptor");
  v34 = (FTNetworkDescriptor *)objc_claimAutoreleasedReturnValue();
  instanceNetDesc = self->_instanceNetDesc;
  self->_instanceNetDesc = v34;

  -[FTNetworkDescriptor name](self->_instanceNetDesc, "name");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTCinematicTapToTrack _resolveNetworkPath:](self, "_resolveNetworkPath:", v36);
  -[FTCinematicTapToTrack _espressoConfigFromDescriptor:engine:](self, "_espressoConfigFromDescriptor:engine:", self->_instanceNetDesc, a3);
  v37 = operator new();
  *(_QWORD *)v37 = &unk_24C55E8B8;
  v38 = operator new(0x128uLL);
  v38[1] = 0;
  v38[2] = 0;
  *v38 = &unk_24C55EB60;
  *(_QWORD *)(v37 + 8) = ik::core::EspressoNetState::EspressoNetState((uint64_t)(v38 + 3), &v63, (ik::EspressoConfig *)&buf);
  *(_QWORD *)(v37 + 16) = v38;
  v39 = self->_instanceNet.__ptr_.__value_;
  self->_instanceNet.__ptr_.__value_ = (EspressoNet *)v37;
  if (v39)
    (*(void (**)(EspressoNet *))(*(_QWORD *)v39 + 8))(v39);
  if (v77 < 0)
    operator delete(__p);
  v40 = (void **)v75;
  if (v75)
  {
    do
    {
      v45 = (void **)*v40;
      if (*((char *)v40 + 39) < 0)
        operator delete(v40[2]);
      operator delete(v40);
      v40 = v45;
    }
    while (v45);
  }
  v41 = v74;
  v74 = 0;
  if (v41)
    operator delete(v41);
  v42 = buf;
  if ((_QWORD)buf)
  {
    v43 = *((_QWORD *)&buf + 1);
    v44 = (void *)buf;
    if (*((_QWORD *)&buf + 1) != (_QWORD)buf)
    {
      do
      {
        if (*(char *)(v43 - 1) < 0)
          operator delete(*(void **)(v43 - 24));
        v43 -= 24;
      }
      while (v43 != v42);
      v44 = (void *)buf;
    }
    *((_QWORD *)&buf + 1) = v42;
    operator delete(v44);
  }
  if (v66 < 0)
    operator delete((void *)v63);

  ft::GetOsLog(v46);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = *((_QWORD *)self->_instanceNet.__ptr_.__value_ + 1);
    v49 = (_QWORD *)(v48 + 32);
    if (*(char *)(v48 + 55) < 0)
      v49 = (_QWORD *)*v49;
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = v49;
    _os_log_impl(&dword_20CC71000, v47, OS_LOG_TYPE_INFO, "SiameseRPN instance network loaded: %s", (uint8_t *)&buf, 0xCu);
  }

  -[FTNetworkDescriptor onlyImageInput](self->_instanceNetDesc, "onlyImageInput");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "size");
  *(_QWORD *)&v63 = (unint64_t)v51;
  objc_msgSend(v50, "size");
  *((_QWORD *)&v63 + 1) = (unint64_t)v52;
  v64 = objc_msgSend(v50, "pixelFormat");
  v65 = 1;
  v67 = 0;
  v68 = 0;
  ik::PixelBufferTensor::PixelBufferTensor((ik::PixelBufferTensor *)&buf, (uint64_t)&v63);
  self->_instanceCrop.type_ = DWORD2(buf);
  if (&self->_instanceCrop != (PixelBufferTensor *)&buf)
    std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&self->_instanceCrop.shape_.sizes_.__begin_, (char *)v70, v71, (v71 - (_BYTE *)v70) >> 3);
  v54 = v72;
  v53 = (__shared_weak_count *)v73;
  if (v73)
  {
    v55 = (unint64_t *)(v73 + 8);
    do
      v56 = __ldxr(v55);
    while (__stxr(v56 + 1, v55));
  }
  v57 = self->_instanceCrop.storage_.__cntrl_;
  self->_instanceCrop.storage_.__ptr_ = v54;
  self->_instanceCrop.storage_.__cntrl_ = v53;
  if (v57)
  {
    v58 = (unint64_t *)((char *)v57 + 8);
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v57 + 16))(v57);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v57);
    }
  }
  *(_QWORD *)&buf = &unk_24C55EA38;
  v60 = (std::__shared_weak_count *)v73;
  if (v73)
  {
    v61 = (unint64_t *)(v73 + 8);
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  if (v70)
  {
    v71 = (char *)v70;
    operator delete(v70);
  }

}

- (basic_string<char,)_resolveNetworkPath:(std::allocator<char>> *__return_ptr)retstr
{
  void *v1;
  void *v3;
  id v4;
  const char *v5;
  size_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v10;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  std::runtime_error *exception;
  std::string *v13;
  __int128 v14;
  id v15;
  std::string v16;
  std::string v17;

  v15 = v1;
  FTResolveEspressoNetPath(v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v16, "Unable to locate model: ");
    v13 = std::string::append(&v16, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
    v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v17);
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v4 = objc_retainAutorelease(v3);
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v8 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v8 = v6 | 7;
    v9 = v8 + 1;
    v10 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)operator new(v8 + 1);
    retstr->var0.var0.var0.var1.var1 = v7;
    *((_QWORD *)&retstr->var0.var0.var0.var1 + 2) = v9 | 0x8000000000000000;
    retstr->var0.var0.var0.var1.var0 = (char *)v10;
    retstr = v10;
  }
  else
  {
    *((_BYTE *)&retstr->var0.var0.var0.var1 + 23) = v6;
    if (!v6)
      goto LABEL_10;
  }
  memmove(retstr, v5, v7);
LABEL_10:
  retstr->var0.var0.var0.var0.var0[v7] = 0;

  return result;
}

- (EspressoConfig)_espressoConfigFromDescriptor:(EspressoConfig *__return_ptr)retstr engine:
{
  void *v1;
  optional<espresso_engine_t> *v2;
  optional<espresso_engine_t> *v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  const char *v11;
  size_t v12;
  size_t v13;
  __int128 *p_dst;
  _QWORD *var1;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int v19;
  EspressoConfig *result;
  id v21;
  __int128 __dst;
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v3 = v2;
  v29 = *MEMORY[0x24BDAC8D0];
  v5 = v1;
  retstr->var0.var1 = 0;
  retstr->var0.var2.var0 = 0;
  retstr->var0.var0 = 0;
  retstr->var1 = *v3;
  *(_QWORD *)&retstr->var2 = -4294901744;
  retstr->var4 = 0;
  retstr->var5.var0.var0 = 0;
  retstr->var5.var1 = 0;
  retstr->var6.var0.var0 = 0;
  retstr->var6.var1 = 0;
  retstr->var7.var0.var0 = 0u;
  *(_OWORD *)&retstr->var7.var0.var1.var0.var0 = 0u;
  retstr->var7.var0.var3.var0 = 1.0;
  *((_BYTE *)&retstr->var8.var0.var0.var0.var1 + 23) = 0;
  retstr->var8.var0.var0.var0.var0.var0[0] = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v5;
  objc_msgSend(v5, "outputNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v6);
        v11 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i)), "UTF8String");
        v12 = strlen(v11);
        if (v12 >= 0x7FFFFFFFFFFFFFF8)
          std::string::__throw_length_error[abi:ne180100]();
        v13 = v12;
        if (v12 >= 0x17)
        {
          v16 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v12 | 7) != 0x17)
            v16 = v12 | 7;
          v17 = v16 + 1;
          p_dst = (__int128 *)operator new(v16 + 1);
          *((_QWORD *)&__dst + 1) = v13;
          v23 = v17 | 0x8000000000000000;
          *(_QWORD *)&__dst = p_dst;
        }
        else
        {
          HIBYTE(v23) = v12;
          p_dst = &__dst;
          if (!v12)
          {
            LOBYTE(__dst) = 0;
            var1 = retstr->var0.var1;
            if (var1 < retstr->var0.var2.var0)
              goto LABEL_4;
            goto LABEL_17;
          }
        }
        memmove(p_dst, v11, v13);
        *((_BYTE *)p_dst + v13) = 0;
        var1 = retstr->var0.var1;
        if (var1 < retstr->var0.var2.var0)
        {
LABEL_4:
          v10 = __dst;
          var1[2] = v23;
          *(_OWORD *)var1 = v10;
          retstr->var0.var1 = var1 + 3;
          continue;
        }
LABEL_17:
        v18 = std::vector<std::string>::__push_back_slow_path<std::string>(&retstr->var0.var0, (uint64_t)&__dst);
        v19 = SHIBYTE(v23);
        retstr->var0.var1 = v18;
        if (v19 < 0)
          operator delete((void *)__dst);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  return result;
}

- ($E706A39B19176788C9E1ABDE032DDDD0)predictRectForPoint:(SEL)a3 inColorBuffer:(CGPoint)a4
{
  double y;
  double x;
  $E706A39B19176788C9E1ABDE032DDDD0 *result;
  FTTapToBox *tapToBox;
  CGSize v11;

  y = a4.y;
  x = a4.x;
  result = ($E706A39B19176788C9E1ABDE032DDDD0 *)-[FTTapToTrackPreprocessor preprocessBuffer:](self->_preprocessor, "preprocessBuffer:", a5);
  if ((result & 1) != 0)
  {
    tapToBox = self->_tapToBox;
    result = -[FTTapToTrackPreprocessor bgraPixelBuffer](self->_preprocessor, "bgraPixelBuffer");
    if (tapToBox)
    {
      return -[FTTapToBox predictionForTap:inBuffer:scaler:](tapToBox, "predictionForTap:inBuffer:scaler:", result, self->_scaler, x, y);
    }
    else
    {
      retstr->var1 = 0.0;
      retstr->var0.origin = 0u;
      retstr->var0.size = 0u;
    }
  }
  else
  {
    v11 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    retstr->var0.origin = (CGPoint)*MEMORY[0x24BDBF070];
    retstr->var0.size = v11;
    retstr->var1 = 0.0;
  }
  return result;
}

- (id)_maybeFetchTrackByCommittingState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  std::runtime_error *exception;
  std::runtime_error *v12;
  std::string *v13;
  __int128 v14;
  std::string v15;
  std::string v16;

  v3 = a3;
  objc_msgSend(v3, "commit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Tracking result was nil.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  objc_msgSend(v4, "tracks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 2)
  {
    v12 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v15, v7);
    v13 = std::string::insert(&v15, 0, "Unexpected number of tracks detected. Expected at most one. Found: ");
    v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v12, &v16);
    __cxa_throw(v12, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if (v7 == 1)
  {
    objc_msgSend(v5, "tracks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_preprocessBuffer:(__CVBuffer *)a3 andValidateState:(id)a4 isOp:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  std::runtime_error *exception;
  std::runtime_error *v12;
  std::runtime_error *v13;
  char *v14;
  std::string *v15;
  __int128 v16;
  id v17;
  std::string v18;
  std::string v19;

  v8 = a4;
  v17 = v8;
  if (!v8)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Tracking state was nil.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  objc_msgSend(v8, "highPriorityTrackerState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v12 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v12, "High priority tracking state was nil.");
    goto LABEL_10;
  }
  if (objc_msgSend(v9, "op") != a5)
  {
    v13 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    objc_msgSend(v10, "opDescription", v17);
    v14 = (char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    std::string::basic_string[abi:ne180100]<0>(&v18, v14);
    v15 = std::string::insert(&v18, 0, "Invalid high priority tracking op encountered: ");
    v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v19.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v13, &v19);
    __cxa_throw(v13, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if (!-[FTTapToTrackPreprocessor preprocessBuffer:](self->_preprocessor, "preprocessBuffer:", a3))
  {
    v12 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v12, "Color buffer preprocessing failed");
LABEL_10:
    __cxa_throw(v12, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }

}

- (BOOL)_unsafeStartTrackingRect:(CGRect)a3 colorBuffer:(__CVBuffer *)a4
{
  double height;
  double width;
  double y;
  double x;
  FTCinematicConfig *v10;
  FTCinematicTracker *v11;
  FTCinematicTracker *tracker;
  FTCinematicInput *v13;
  FTCinematicTapRequest *v14;
  double MidX;
  void *v16;
  void *v17;
  __CVBuffer *v18;
  uint64_t v19;
  int16x8_t v20;
  EspressoNet *value;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 **v25;
  uint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  void *v31;
  char v32;
  void *v33;
  BOOL v34;
  std::runtime_error *exception;
  std::runtime_error *v37;
  std::runtime_error *v38;
  void *__p[2];
  char v40;
  _OWORD v41[2];
  int v42;
  _BYTE v43[40];
  CMTime v44;
  __int128 v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  CGRect v52;
  CGRect v53;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v51 = *MEMORY[0x24BDAC8D0];
  v10 = objc_alloc_init(FTCinematicConfig);
  v11 = -[FTCinematicTracker initWithConfig:]([FTCinematicTracker alloc], "initWithConfig:", v10);
  tracker = self->_tracker;
  self->_tracker = v11;

  v13 = objc_alloc_init(FTCinematicInput);
  CMTimeMake(&v44, 1, 1);
  -[FTCinematicInput setSourceFrameTimestamp:](v13, "setSourceFrameTimestamp:", &v44);
  v14 = objc_alloc_init(FTCinematicTapRequest);
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  MidX = CGRectGetMidX(v52);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  -[FTCinematicTapRequest setTapPoint:](v14, "setTapPoint:", MidX, CGRectGetMidY(v53));
  -[FTCinematicInput setTapRequest:](v13, "setTapRequest:", v14);
  -[FTCinematicTracker computeTrackingStateForInput:](self->_tracker, "computeTrackingStateForInput:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "highPriorityTrackerState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTCinematicTapToTrack _preprocessBuffer:andValidateState:isOp:](self, "_preprocessBuffer:andValidateState:isOp:", a4, v16, 3);
  v18 = -[FTTapToTrackPreprocessor bgraPixelBuffer](self->_preprocessor, "bgraPixelBuffer");
  v19 = *((_QWORD *)self->_exemplarCrop.storage_.__ptr_ + 1);
  -[FTTapToTrackPreprocessor meanPixel](self->_preprocessor, "meanPixel");
  if ((objc_msgSend(v17, "preProcessExemplarInputFromSourceBuffer:toDestinationBuffer:forTargetRect:meanPixel:scaler:", v18, v19, vmovn_s16(v20).u32[0], self->_scaler, x, y, width, height) & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Exemplar preprocessing failed.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  value = self->_exemplarNet.__ptr_.__value_;
  -[FTNetworkDescriptor onlyImageInput](self->_exemplarNetDesc, "onlyImageInput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  AsString(__p, v23);
  std::pair<std::string const,ik::Tensor>::pair[abi:ne180100]<std::string,ik::PixelBufferTensor &,0>((uint64_t)&v45, (__int128 *)__p, (uint64_t)&self->_exemplarCrop);
  memset(v41, 0, sizeof(v41));
  v42 = 1065353216;
  std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,ik::Tensor> const&>((uint64_t)v41, (uint64_t)&v45, &v45);
  v24 = *((_QWORD *)value + 1);
  v26 = *(_QWORD *)(v24 + 56);
  v27 = *(_QWORD *)(v24 + 64);
  v25 = (__int128 **)(v24 + 56);
  if (v26 == v27)
  {
    v37 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v37, "Model has no pre-declared outputs.");
    v37->__vftable = (std::runtime_error_vtbl *)&unk_24C55E8F8;
  }
  ik::EspressoNet::Predict((uint64_t)value, (uint64_t)v41, v25, (uint64_t)v43);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)v41);
  v47 = &unk_24C55EA38;
  v28 = v50;
  if (v50)
  {
    p_shared_owners = (unint64_t *)&v50->__shared_owners_;
    do
      v30 = __ldaxr(p_shared_owners);
    while (__stlxr(v30 - 1, p_shared_owners));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  if (v48)
  {
    v49 = v48;
    operator delete(v48);
  }
  if (v46 < 0)
  {
    operator delete((void *)v45);
    if ((v40 & 0x80000000) == 0)
      goto LABEL_12;
  }
  else if ((v40 & 0x80000000) == 0)
  {
    goto LABEL_12;
  }
  operator delete(__p[0]);
LABEL_12:

  AsEspressoBufferDictionary((uint64_t)v43);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v17, "postProcessExemplarOutputs:forTargetRect:", v31, x, y, width, height);

  if ((v32 & 1) == 0)
  {
    v38 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v38, "Tracker preprocessing failed.");
    __cxa_throw(v38, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  -[FTCinematicTapToTrack _maybeFetchTrackByCommittingState:](self, "_maybeFetchTrackByCommittingState:", v16);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33 != 0;

  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)v43);
  return v34;
}

- ($E706A39B19176788C9E1ABDE032DDDD0)_unsafeStepTrackingWithFrame:(SEL)a3
{
  __CVBuffer *v5;
  uint64_t v6;
  int16x8_t v7;
  void *v8;
  void *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  __shared_weak_count *cntrl;
  TensorStorage *ptr;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  EspressoNet *value;
  void *v24;
  void *v25;
  unsigned __int8 *v26;
  unsigned __int8 *v27;
  std::__shared_weak_count *v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  EspressoNet *v40;
  uint64_t v41;
  __int128 **v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  float v53;
  FTCinematicTracker *tracker;
  CGSize v55;
  $E706A39B19176788C9E1ABDE032DDDD0 *result;
  std::runtime_error *exception;
  std::runtime_error *v58;
  std::runtime_error *v59;
  std::runtime_error *v60;
  $E706A39B19176788C9E1ABDE032DDDD0 *v61;
  FTCinematicInput *v62;
  void *v63;
  void *v64;
  id obj;
  NSString v67[2];
  char v68;
  NSString v69[2];
  char v70;
  void *__p;
  int v72;
  char *v73;
  char *v74;
  uint64_t v75;
  std::__shared_weak_count *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[32];
  int v82;
  CMTime v83;
  NSString *v84;
  _BYTE v85[128];
  uint64_t v86;

  v61 = retstr;
  v86 = *MEMORY[0x24BDAC8D0];
  if (!self->_tracker)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "No active tracking session present.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v62 = objc_alloc_init(FTCinematicInput);
  CMTimeMake(&v83, 1, 1);
  -[FTCinematicInput setSourceFrameTimestamp:](v62, "setSourceFrameTimestamp:", &v83);
  -[FTCinematicTracker computeTrackingStateForInput:](self->_tracker, "computeTrackingStateForInput:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "highPriorityTrackerState");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTCinematicTapToTrack _preprocessBuffer:andValidateState:isOp:](self, "_preprocessBuffer:andValidateState:isOp:", a4, v63, 2);
  v5 = -[FTTapToTrackPreprocessor bgraPixelBuffer](self->_preprocessor, "bgraPixelBuffer");
  v6 = *((_QWORD *)self->_instanceCrop.storage_.__ptr_ + 1);
  -[FTTapToTrackPreprocessor meanPixel](self->_preprocessor, "meanPixel");
  if ((objc_msgSend(v64, "preProcessInstanceInputFromSourceBuffer:toDestinationBuffer:meanPixel:scaler:", v5, v6, vmovn_s16(v7).u32[0], self->_scaler) & 1) == 0)
  {
    v58 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v58, "Instance preprocessing failed.");
    __cxa_throw(v58, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  memset(v81, 0, sizeof(v81));
  v82 = 1065353216;
  -[FTNetworkDescriptor onlyImageInput](self->_instanceNetDesc, "onlyImageInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AsString(&__p, v9);
  v69[0] = &__p;
  v10 = std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v81, (uint64_t)&__p, (uint64_t)&std::piecewise_construct, (__int128 **)v69);
  v11 = v10;
  *((_DWORD *)v10 + 12) = self->_instanceCrop.type_;
  if (v10 + 40 != (unsigned __int8 *)&self->_instanceCrop)
    std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((_QWORD *)v10 + 7, (char *)self->_instanceCrop.shape_.sizes_.__begin_, (char *)self->_instanceCrop.shape_.sizes_.__end_, self->_instanceCrop.shape_.sizes_.__end_ - self->_instanceCrop.shape_.sizes_.__begin_);
  ptr = self->_instanceCrop.storage_.__ptr_;
  cntrl = self->_instanceCrop.storage_.__cntrl_;
  if (cntrl)
  {
    v14 = (unint64_t *)((char *)cntrl + 8);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  v16 = (std::__shared_weak_count *)*((_QWORD *)v11 + 11);
  *((_QWORD *)v11 + 10) = ptr;
  *((_QWORD *)v11 + 11) = cntrl;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
      if ((SHIBYTE(v73) & 0x80000000) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  if (SHIBYTE(v73) < 0)
LABEL_13:
    operator delete(__p);
LABEL_14:

  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[FTNetworkDescriptor inputReferences](self->_instanceNetDesc, "inputReferences");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
  if (!v19)
    goto LABEL_45;
  v20 = *(_QWORD *)v78;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v78 != v20)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v21);
      value = self->_exemplarNet.__ptr_.__value_;
      objc_msgSend(v22, "sourceOutputName", v61, v62);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      AsString(v69, v24);
      ik::core::GetOutput((uint64_t)&__p, *((_QWORD *)value + 1), (uint64_t)v69);
      objc_msgSend(v22, "destinationInputName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AsString(v67, v25);
      v84 = v67;
      v26 = std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v81, (uint64_t)v67, (uint64_t)&std::piecewise_construct, (__int128 **)&v84);
      v27 = v26;
      *((_DWORD *)v26 + 12) = v72;
      if (v26 + 40 != (unsigned __int8 *)&__p)
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((_QWORD *)v26 + 7, v73, v74, (v74 - v73) >> 3);
      v29 = v75;
      v28 = v76;
      if (v76)
      {
        v30 = (unint64_t *)&v76->__shared_owners_;
        do
          v31 = __ldxr(v30);
        while (__stxr(v31 + 1, v30));
      }
      v32 = (std::__shared_weak_count *)*((_QWORD *)v27 + 11);
      *((_QWORD *)v27 + 10) = v29;
      *((_QWORD *)v27 + 11) = v28;
      if (v32)
      {
        v33 = (unint64_t *)&v32->__shared_owners_;
        do
          v34 = __ldaxr(v33);
        while (__stlxr(v34 - 1, v33));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
          if ((v68 & 0x80000000) == 0)
            goto LABEL_30;
LABEL_29:
          operator delete(v67[0]);
          goto LABEL_30;
        }
      }
      if (v68 < 0)
        goto LABEL_29;
LABEL_30:

      __p = &unk_24C55EA38;
      v35 = v76;
      if (!v76)
        goto LABEL_34;
      v36 = (unint64_t *)&v76->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (v37)
      {
LABEL_34:
        v38 = v73;
        if (!v73)
          goto LABEL_36;
LABEL_35:
        v74 = v38;
        operator delete(v38);
        goto LABEL_36;
      }
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
      v38 = v73;
      if (v73)
        goto LABEL_35;
LABEL_36:
      if (v70 < 0)
        operator delete(v69[0]);

      ++v21;
    }
    while (v21 != v19);
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    v19 = v39;
  }
  while (v39);
LABEL_45:

  v40 = self->_instanceNet.__ptr_.__value_;
  v41 = *((_QWORD *)v40 + 1);
  v43 = *(_QWORD *)(v41 + 56);
  v44 = *(_QWORD *)(v41 + 64);
  v42 = (__int128 **)(v41 + 56);
  if (v43 == v44)
  {
    v59 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v59, "Model has no pre-declared outputs.");
    v59->__vftable = (std::runtime_error_vtbl *)&unk_24C55E8F8;
  }
  ik::EspressoNet::Predict((uint64_t)v40, (uint64_t)v81, v42, (uint64_t)&__p);
  AsEspressoBufferDictionary((uint64_t)&__p);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v64, "postProcessInstanceOutputs:", v45);

  if ((v46 & 1) == 0)
  {
    v60 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v60, "Instance post-processing failed.");
    __cxa_throw(v60, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  -[FTCinematicTapToTrack _maybeFetchTrackByCommittingState:](self, "_maybeFetchTrackByCommittingState:", v63);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    objc_msgSend(v47, "box");
    v61->var0.origin.x = v49;
    v61->var0.origin.y = v50;
    v61->var0.size.width = v51;
    v61->var0.size.height = v52;
    objc_msgSend(v48, "boxConfidence");
    v61->var1 = v53;
  }
  else
  {
    tracker = self->_tracker;
    self->_tracker = 0;

    v55 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v61->var0.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v61->var0.size = v55;
    v61->var1 = 0.0;
  }

  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)&__p);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)v81);

  return result;
}

- (BOOL)startTrackingRect:(CGRect)a3 colorBuffer:(__CVBuffer *)a4
{
  return -[FTCinematicTapToTrack _unsafeStartTrackingRect:colorBuffer:](self, "_unsafeStartTrackingRect:colorBuffer:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- ($E706A39B19176788C9E1ABDE032DDDD0)stepTrackingWithFrame:(SEL)a3
{
  return -[FTCinematicTapToTrack _unsafeStepTrackingWithFrame:](self, "_unsafeStepTrackingWithFrame:", a4);
}

- (BOOL)reset
{
  FTCinematicTracker *tracker;

  tracker = self->_tracker;
  self->_tracker = 0;

  return 1;
}

- (BOOL)isTrackingActive
{
  return self->_tracker != 0;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *begin;
  __shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  EspressoNet *value;
  EspressoNet *v12;

  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_tapToBox, 0);
  self->_instanceCrop._vptr$Tensor = (void **)&unk_24C55EA38;
  cntrl = self->_instanceCrop.storage_.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      begin = self->_instanceCrop.shape_.sizes_.__begin_;
      if (!begin)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  begin = self->_instanceCrop.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_6:
    self->_instanceCrop.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
LABEL_7:
  self->_exemplarCrop._vptr$Tensor = (void **)&unk_24C55EA38;
  v7 = self->_exemplarCrop.storage_.__cntrl_;
  if (!v7)
    goto LABEL_11;
  v8 = (unint64_t *)((char *)v7 + 8);
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 - 1, v8));
  if (v9)
  {
LABEL_11:
    v10 = self->_exemplarCrop.shape_.sizes_.__begin_;
    if (!v10)
      goto LABEL_13;
    goto LABEL_12;
  }
  (*(void (**)(__shared_weak_count *))(*(_QWORD *)v7 + 16))(v7);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
  v10 = self->_exemplarCrop.shape_.sizes_.__begin_;
  if (v10)
  {
LABEL_12:
    self->_exemplarCrop.shape_.sizes_.__end_ = v10;
    operator delete(v10);
  }
LABEL_13:
  value = self->_instanceNet.__ptr_.__value_;
  self->_instanceNet.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
  v12 = self->_exemplarNet.__ptr_.__value_;
  self->_exemplarNet.__ptr_.__value_ = 0;
  if (v12)
    (*(void (**)(EspressoNet *))(*(_QWORD *)v12 + 8))(v12);
  objc_storeStrong((id *)&self->_instanceNetDesc, 0);
  objc_storeStrong((id *)&self->_exemplarNetDesc, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_DWORD *)self + 18) = 1;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_QWORD *)self + 8) = &unk_24C55E920;
  *((_DWORD *)self + 32) = 1;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = &unk_24C55E920;
  return self;
}

- (void)initWithEspressoEngine:(uint64_t)a1 scalingBackend:commandQueue:.cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_1_0(&dword_20CC71000, v1, v2, "FTCinematicTapToTrack error: %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4();
}

@end

@implementation FTTapToBox

- (FTTapToBox)init
{
  FTTapToBox *v2;
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  size_t v7;
  std::string::size_type v8;
  std::string *p_dst;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  EspressoNet *value;
  const char *v15;
  void **v16;
  void *v17;
  std::string::size_type v18;
  std::string::size_type size;
  void *v20;
  void **v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  __shared_weak_count *v27;
  TensorStorage *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  std::__shared_weak_count *cntrl;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  id v39;
  double v40;
  double v41;
  __shared_weak_count *v42;
  TensorStorage *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  id v52;
  id v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  __shared_weak_count *v60;
  TensorStorage *v61;
  unint64_t *v62;
  unint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  FTTapToBox *v70;
  const char *v72;
  const char *v73;
  std::string __dst;
  objc_super v75;
  std::string __str;
  char *v77;
  uint64_t v78;
  void *v79;
  std::__shared_weak_count *v80;
  char v81;
  char v82;
  __int128 v83;
  __int128 v84;
  void *v85;
  void *__p;
  void *v87;
  void *v88;
  std::__shared_weak_count *v89;
  std::string v90;
  char v91;
  char v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v75.receiver = self;
  v75.super_class = (Class)FTTapToBox;
  v2 = -[FTTapToBox init](&v75, sel_init);

  if (!v2)
    goto LABEL_106;
  +[FTTapToBox networkDescriptor](FTTapToBox, "networkDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  v7 = strlen(v6);
  if (v7 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v8 = v7;
  if (v7 >= 0x17)
  {
    v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v10 = v7 | 7;
    v11 = v10 + 1;
    p_dst = (std::string *)operator new(v10 + 1);
    __dst.__r_.__value_.__l.__size_ = v8;
    __dst.__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v7;
    p_dst = &__dst;
    if (!v7)
      goto LABEL_10;
  }
  memmove(p_dst, v6, v8);
LABEL_10:
  p_dst->__r_.__value_.__s.__data_[v8] = 0;

  +[FTTapToBox networkPath](FTTapToBox, "networkPath");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v72 = (const char *)objc_msgSend(v12, "UTF8String");
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v90, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  else
    v90 = __dst;
  std::vector<std::string>::vector[abi:ne180100](&__str, (uint64_t)&v90, 1uLL);
  LOBYTE(v77) = 0;
  BYTE4(v77) = 0;
  v78 = -4294901744;
  LODWORD(v79) = 0;
  BYTE4(v79) = 0;
  LOBYTE(v80) = 0;
  v81 = 0;
  v82 = 0;
  v83 = 0u;
  v84 = 0u;
  LODWORD(v85) = 1065353216;
  HIBYTE(v88) = 0;
  LOBYTE(__p) = 0;
  std::make_unique[abi:ne180100]<ik::EspressoNet,char const*,ik::EspressoConfig>(&v72, (ik::EspressoConfig *)&__str, &v73);
  v13 = v73;
  v73 = 0;
  value = v2->_net.__ptr_.__value_;
  v2->_net.__ptr_.__value_ = (EspressoNet *)v13;
  if (value)
  {
    (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
    v15 = v73;
    v73 = 0;
    if (v15)
      (*(void (**)(const char *))(*(_QWORD *)v15 + 8))(v15);
  }
  if (SHIBYTE(v88) < 0)
    operator delete(__p);
  v16 = (void **)v84;
  if ((_QWORD)v84)
  {
    do
    {
      v21 = (void **)*v16;
      if (*((char *)v16 + 39) < 0)
        operator delete(v16[2]);
      operator delete(v16);
      v16 = v21;
    }
    while (v21);
  }
  v17 = (void *)v83;
  *(_QWORD *)&v83 = 0;
  if (v17)
    operator delete(v17);
  v18 = __str.__r_.__value_.__r.__words[0];
  if (__str.__r_.__value_.__r.__words[0])
  {
    size = __str.__r_.__value_.__l.__size_;
    v20 = (void *)__str.__r_.__value_.__r.__words[0];
    if (__str.__r_.__value_.__l.__size_ != __str.__r_.__value_.__r.__words[0])
    {
      do
      {
        if (*(char *)(size - 1) < 0)
          operator delete(*(void **)(size - 24));
        size -= 24;
      }
      while (size != v18);
      v20 = (void *)__str.__r_.__value_.__r.__words[0];
    }
    __str.__r_.__value_.__l.__size_ = v18;
    operator delete(v20);
  }
  if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v90.__r_.__value_.__l.__data_);

  objc_msgSend(v3, "inputImages");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndex:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v23;
  objc_msgSend(v24, "size");
  v90.__r_.__value_.__r.__words[0] = (unint64_t)v25;
  objc_msgSend(v24, "size");
  v90.__r_.__value_.__l.__size_ = (unint64_t)v26;
  LODWORD(v90.__r_.__value_.__r.__words[2]) = objc_msgSend(v24, "pixelFormat");
  v90.__r_.__value_.__s.__data_[20] = 1;
  v91 = 0;
  v92 = 0;
  ik::PixelBufferTensor::PixelBufferTensor((ik::PixelBufferTensor *)&__str, (uint64_t)&v90);

  v2->_inputImageTensor.type_ = __str.__r_.__value_.__r.__words[1];
  if (&v2->_inputImageTensor != (PixelBufferTensor *)&__str)
    std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v2->_inputImageTensor.shape_.sizes_.__begin_, (char *)__str.__r_.__value_.__r.__words[2], v77, (uint64_t)&v77[-__str.__r_.__value_.__r.__words[2]] >> 3);
  v28 = (TensorStorage *)v79;
  v27 = (__shared_weak_count *)v80;
  if (v80)
  {
    p_shared_owners = (unint64_t *)&v80->__shared_owners_;
    do
      v30 = __ldxr(p_shared_owners);
    while (__stxr(v30 + 1, p_shared_owners));
  }
  cntrl = (std::__shared_weak_count *)v2->_inputImageTensor.storage_.__cntrl_;
  v2->_inputImageTensor.storage_.__ptr_ = v28;
  v2->_inputImageTensor.storage_.__cntrl_ = v27;
  if (cntrl)
  {
    v32 = (unint64_t *)&cntrl->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_24C55EA38;
  v34 = v80;
  if (v80)
  {
    v35 = (unint64_t *)&v80->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  if (__str.__r_.__value_.__r.__words[2])
  {
    v77 = (char *)__str.__r_.__value_.__r.__words[2];
    operator delete((void *)__str.__r_.__value_.__r.__words[2]);
  }
  objc_msgSend(v3, "inputImages");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectAtIndex:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v38;
  objc_msgSend(v39, "size");
  v90.__r_.__value_.__r.__words[0] = (unint64_t)v40;
  objc_msgSend(v39, "size");
  v90.__r_.__value_.__l.__size_ = (unint64_t)v41;
  LODWORD(v90.__r_.__value_.__r.__words[2]) = objc_msgSend(v39, "pixelFormat");
  v90.__r_.__value_.__s.__data_[20] = 1;
  v91 = 0;
  v92 = 0;
  ik::PixelBufferTensor::PixelBufferTensor((ik::PixelBufferTensor *)&__str, (uint64_t)&v90);

  v2->_inputTapTensor.type_ = __str.__r_.__value_.__r.__words[1];
  if (&v2->_inputTapTensor != (PixelBufferTensor *)&__str)
    std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v2->_inputTapTensor.shape_.sizes_.__begin_, (char *)__str.__r_.__value_.__r.__words[2], v77, (uint64_t)&v77[-__str.__r_.__value_.__r.__words[2]] >> 3);
  v43 = (TensorStorage *)v79;
  v42 = (__shared_weak_count *)v80;
  if (v80)
  {
    v44 = (unint64_t *)&v80->__shared_owners_;
    do
      v45 = __ldxr(v44);
    while (__stxr(v45 + 1, v44));
  }
  v46 = (std::__shared_weak_count *)v2->_inputTapTensor.storage_.__cntrl_;
  v2->_inputTapTensor.storage_.__ptr_ = v43;
  v2->_inputTapTensor.storage_.__cntrl_ = v42;
  if (v46)
  {
    v47 = (unint64_t *)&v46->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_24C55EA38;
  v49 = v80;
  if (v80)
  {
    v50 = (unint64_t *)&v80->__shared_owners_;
    do
      v51 = __ldaxr(v50);
    while (__stlxr(v51 - 1, v50));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  if (__str.__r_.__value_.__r.__words[2])
  {
    v77 = (char *)__str.__r_.__value_.__r.__words[2];
    operator delete((void *)__str.__r_.__value_.__r.__words[2]);
  }
  objc_msgSend(v24, "name");
  v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v90.__r_.__value_.__r.__words[0] = objc_msgSend(v52, "UTF8String");
  std::pair<std::string const,ik::Tensor>::pair[abi:ne180100]<char const*,ik::PixelBufferTensor &,0>((uint64_t)&__str, (const char **)&v90.__r_.__value_.__l.__data_, (uint64_t)&v2->_inputImageTensor);
  objc_msgSend(v39, "name");
  v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v73 = (const char *)objc_msgSend(v53, "UTF8String");
  std::pair<std::string const,ik::Tensor>::pair[abi:ne180100]<char const*,ik::PixelBufferTensor &,0>((uint64_t)&v83 + 8, &v73, (uint64_t)&v2->_inputTapTensor);
  std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__assign_unique<std::pair<std::string const,ik::Tensor> const*>(&v2->_inputMap.__table_.__bucket_list_.__ptr_.__value_, &__str, &v90);
  v85 = &unk_24C55EA38;
  v54 = v89;
  if (v89)
  {
    v55 = (unint64_t *)&v89->__shared_owners_;
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }
  if (v87)
  {
    v88 = v87;
    operator delete(v87);
  }
  if (SHIBYTE(v84) < 0)
    operator delete(*((void **)&v83 + 1));
  v77 = (char *)&unk_24C55EA38;
  v57 = (std::__shared_weak_count *)v83;
  if ((_QWORD)v83)
  {
    v58 = (unint64_t *)(v83 + 8);
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  if (v79)
  {
    v80 = (std::__shared_weak_count *)v79;
    operator delete(v79);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);

  ik::core::GetOutput((uint64_t)&__str, *((_QWORD *)v2->_net.__ptr_.__value_ + 1), (uint64_t)&__dst);
  v2->_outputTensor.type_ = __str.__r_.__value_.__r.__words[1];
  if (&v2->_outputTensor != (EspressoTensor *)&__str)
    std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v2->_outputTensor.shape_.sizes_.__begin_, (char *)__str.__r_.__value_.__r.__words[2], v77, (uint64_t)&v77[-__str.__r_.__value_.__r.__words[2]] >> 3);
  v61 = (TensorStorage *)v79;
  v60 = (__shared_weak_count *)v80;
  if (v80)
  {
    v62 = (unint64_t *)&v80->__shared_owners_;
    do
      v63 = __ldxr(v62);
    while (__stxr(v63 + 1, v62));
  }
  v64 = (std::__shared_weak_count *)v2->_outputTensor.storage_.__cntrl_;
  v2->_outputTensor.storage_.__ptr_ = v61;
  v2->_outputTensor.storage_.__cntrl_ = v60;
  if (v64)
  {
    v65 = (unint64_t *)&v64->__shared_owners_;
    do
      v66 = __ldaxr(v65);
    while (__stlxr(v66 - 1, v65));
    if (!v66)
    {
      ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
      std::__shared_weak_count::__release_weak(v64);
    }
  }
  __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_24C55EA38;
  v67 = v80;
  if (v80)
  {
    v68 = (unint64_t *)&v80->__shared_owners_;
    do
      v69 = __ldaxr(v68);
    while (__stlxr(v69 - 1, v68));
    if (!v69)
    {
      ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
      std::__shared_weak_count::__release_weak(v67);
    }
  }
  if (__str.__r_.__value_.__r.__words[2])
  {
    v77 = (char *)__str.__r_.__value_.__r.__words[2];
    operator delete((void *)__str.__r_.__value_.__r.__words[2]);
  }
  v70 = v2;

  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);

LABEL_106:
  return v2;
}

- ($E706A39B19176788C9E1ABDE032DDDD0)predictionForTap:(SEL)a3 inBuffer:(CGPoint)a4 scaler:(__CVBuffer *)a5
{
  double y;
  double x;
  id v11;
  EspressoNet *value;
  uint64_t v13;
  __int128 **v14;
  uint64_t v15;
  uint64_t v16;
  ft *v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  CGSize v21;
  CGSize v22;
  $E706A39B19176788C9E1ABDE032DDDD0 *result;
  std::runtime_error *exception;
  uint8_t v25[16];
  CGPoint v26;
  CGSize v27;
  double v28;
  _BYTE v29[40];

  y = a4.y;
  x = a4.x;
  v11 = a6;
  if (+[FTTapToBox preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:](FTTapToBox, "preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:", a5, *((_QWORD *)self->_inputImageTensor.storage_.__ptr_ + 1), *((_QWORD *)self->_inputTapTensor.storage_.__ptr_ + 1), v11, x, y))
  {
    value = self->_net.__ptr_.__value_;
    v13 = *((_QWORD *)value + 1);
    v15 = *(_QWORD *)(v13 + 56);
    v16 = *(_QWORD *)(v13 + 64);
    v14 = (__int128 **)(v13 + 56);
    if (v15 == v16)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Model has no pre-declared outputs.");
      exception->__vftable = (std::runtime_error_vtbl *)&unk_24C55E8F8;
    }
    ik::EspressoNet::Predict((uint64_t)value, (uint64_t)&self->_inputMap, v14, (uint64_t)v29);
    std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)v29);
    v28 = 0.0;
    v26 = (CGPoint)0;
    v27 = (CGSize)0;
    +[FTTapToBox postProcessNetworkOutput:](FTTapToBox, "postProcessNetworkOutput:", (char *)self->_outputTensor.storage_.__ptr_ + 8);
    v17 = (ft *)+[FTTapToBox defaultConfidenceThreshold](FTTapToBox, "defaultConfidenceThreshold");
    if (v18 <= 0.0)
    {
      v22 = v27;
      retstr->var0.origin = v26;
      retstr->var0.size = v22;
      retstr->var1 = v28;
      goto LABEL_10;
    }
    ft::GetOsLog(v17);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_20CC71000, v19, OS_LOG_TYPE_INFO, "TapToBox prediction below threshold.", v25, 2u);
    }

    v20 = MEMORY[0x24BDBF090];
  }
  else
  {
    v20 = MEMORY[0x24BDBF070];
  }
  v21 = *(CGSize *)(v20 + 16);
  retstr->var0.origin = *(CGPoint *)v20;
  retstr->var0.size = v21;
  retstr->var1 = 0.0;
LABEL_10:

  return result;
}

- (CGRect)predictBoxForTap:(CGPoint)a3 inBuffer:(__CVBuffer *)a4 scaler:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[FTTapToBox predictionForTap:inBuffer:scaler:](self, "predictionForTap:inBuffer:scaler:", a4, a5, a3.x, a3.y);
  v5 = v9;
  v6 = v10;
  v7 = v11;
  v8 = v12;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (id)networkPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  ft *v8;
  NSObject *v9;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "networkDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FTResolveEspressoNetPath(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathForResource:ofType:", v3, CFSTR("espresso.net"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      ft::GetOsLog(v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[FTTapToBox networkPath].cold.1(objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), v11, v9);

      v6 = 0;
    }
  }

  return v6;
}

+ (CGSize)networkInputImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 360.0;
  v3 = 360.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)networkInputTapImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 90.0;
  v3 = 90.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)networkDescriptor
{
  FTNetworkDescriptor *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(FTNetworkDescriptor);
  objc_msgSend(a1, "networkInputImageSize");
  +[FTImageTensorDescriptor bgraImageWithName:size:](FTImageTensorDescriptor, "bgraImageWithName:size:", CFSTR("input_color_image"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(a1, "networkInputTapImageSize");
  +[FTImageTensorDescriptor descriptorWithName:size:pixelFormat:](FTImageTensorDescriptor, "descriptorWithName:size:pixelFormat:", CFSTR("input_tap_image"), 1278226488);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTNetworkDescriptor setInputImages:](v3, "setInputImages:", v6);

  -[FTNetworkDescriptor setOutputNames:](v3, "setOutputNames:", &unk_24C561868);
  -[FTNetworkDescriptor setName:](v3, "setName:", CFSTR("tap_to_box_v2_fp16"));
  return v3;
}

+ (BOOL)renderTap:(CGPoint)a3 inBuffer:(__CVBuffer *)a4
{
  double y;
  double x;
  size_t Width;
  size_t Height;
  ft *v10;
  double v11;
  double v12;
  NSObject *v14;
  char *BaseAddress;
  size_t BytesPerRow;
  ft *v17;
  BOOL v18;
  char *v19;
  std::runtime_error *exception;

  y = a3.y;
  x = a3.x;
  if (CVPixelBufferLockBaseAddress(a4, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to lock pixel buffer.");
    goto LABEL_26;
  }
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  v10 = (ft *)objc_msgSend(a1, "networkInputTapImageSize");
  if (Width != (unint64_t)v12 || Height != (unint64_t)v11)
  {
    ft::GetOsLog(v10);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[FTTapToBox renderTap:inBuffer:].cold.1();
LABEL_21:

    v18 = 0;
    goto LABEL_22;
  }
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
  if (!BaseAddress)
  {
    ft::GetOsLog(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[FTTapToBox renderTap:inBuffer:].cold.2();
    goto LABEL_21;
  }
  BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  bzero(BaseAddress, BytesPerRow * Height);
  if (x > 1.0 || x < 0.0 || y < 0.0 || y > 1.0)
  {
    ft::GetOsLog(v17);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[FTTapToBox renderTap:inBuffer:].cold.3();
    goto LABEL_21;
  }
  v18 = 1;
  memset(&BaseAddress[BytesPerRow * vcvtad_u64_f64(y * (double)(Height - 1))], 1, BytesPerRow);
  if (Height)
  {
    v19 = &BaseAddress[vcvtad_u64_f64(x * (double)(Width - 1))];
    do
    {
      *v19 = 1;
      v19 += BytesPerRow;
      --Height;
    }
    while (Height);
  }
LABEL_22:
  if (CVPixelBufferUnlockBaseAddress(a4, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
LABEL_26:
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return v18;
}

+ (BOOL)preprocessForTap:(CGPoint)a3 inSourceImageBuffer:(__CVBuffer *)a4 destinationImageBuffer:(__CVBuffer *)a5 tapBuffer:(__CVBuffer *)a6 scaler:(id)a7
{
  double y;
  double x;
  id v13;
  ft *v14;
  size_t Width;
  size_t Height;
  size_t v17;
  ft *v18;
  BOOL v19;
  NSObject *v20;

  y = a3.y;
  x = a3.x;
  v13 = a7;
  v14 = (ft *)objc_msgSend(a1, "renderTap:inBuffer:", a6, x, y);
  if ((v14 & 1) == 0)
  {
    ft::GetOsLog(v14);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[FTTapToBox preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:].cold.2();
    goto LABEL_8;
  }
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  v17 = CVPixelBufferGetWidth(a5);
  v18 = (ft *)objc_msgSend(v13, "scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:", a4, a5, 0.0, 0.0, (double)Width, (double)Height, 0.0, 0.0, (double)v17, (double)CVPixelBufferGetHeight(a5));
  if ((v18 & 1) == 0)
  {
    ft::GetOsLog(v18);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[FTTapToBox preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:].cold.1();
LABEL_8:

    v19 = 0;
    goto LABEL_9;
  }
  v19 = 1;
LABEL_9:

  return v19;
}

+ ($E706A39B19176788C9E1ABDE032DDDD0)postProcessNetworkOutput:(SEL)a3
{
  float v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v5 = *(float *)a4->var0;
  v6 = *((float *)a4->var0 + 4);
  v7 = *((float *)a4->var0 + 3);
  v8 = *((float *)a4->var0 + 1) + v7 * -0.5;
  v9 = v6;
  v10 = *((float *)a4->var0 + 2) + v6 * -0.5;
  retstr->var0.origin.x = v8;
  retstr->var0.origin.y = v10;
  retstr->var0.size.width = v7;
  retstr->var0.size.height = v6;
  v11 = v5;
  if (v5 < 0.9 && v11 >= 0.7)
  {
    v13.origin.x = v8;
    v13.origin.y = v10;
    v13.size.width = v7;
    v13.size.height = v6;
    if (CGRectGetMinX(v13) < 0.1)
    {
      v14.origin.x = v8;
      v14.origin.y = v10;
      v14.size.width = v7;
      v14.size.height = v9;
      if (CGRectGetMaxX(v14) > 0.9)
      {
        v15.origin.x = v8;
        v15.origin.y = v10;
        v15.size.width = v7;
        v15.size.height = v9;
        if (CGRectGetMinY(v15) < 0.1)
        {
          v16.origin.x = v8;
          v16.origin.y = v10;
          v16.size.width = v7;
          v16.size.height = v9;
          if (CGRectGetMaxY(v16) > 0.9)
            v11 = 0.35;
        }
      }
    }
  }
  retstr->var1 = v11;
  return result;
}

+ (double)defaultConfidenceThreshold
{
  return 0.7;
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
  __shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  EspressoNet *value;

  self->_outputTensor._vptr$Tensor = (void **)&unk_24C55EA38;
  cntrl = self->_outputTensor.storage_.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      begin = self->_outputTensor.shape_.sizes_.__begin_;
      if (!begin)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  begin = self->_outputTensor.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_6:
    self->_outputTensor.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
LABEL_7:
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)&self->_inputMap);
  self->_inputTapTensor._vptr$Tensor = (void **)&unk_24C55EA38;
  v7 = self->_inputTapTensor.storage_.__cntrl_;
  if (v7)
  {
    v8 = (unint64_t *)((char *)v7 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v7 + 16))(v7);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
      v10 = self->_inputTapTensor.shape_.sizes_.__begin_;
      if (!v10)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  v10 = self->_inputTapTensor.shape_.sizes_.__begin_;
  if (v10)
  {
LABEL_12:
    self->_inputTapTensor.shape_.sizes_.__end_ = v10;
    operator delete(v10);
  }
LABEL_13:
  self->_inputImageTensor._vptr$Tensor = (void **)&unk_24C55EA38;
  v11 = self->_inputImageTensor.storage_.__cntrl_;
  if (!v11)
    goto LABEL_17;
  v12 = (unint64_t *)((char *)v11 + 8);
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (v13)
  {
LABEL_17:
    v14 = self->_inputImageTensor.shape_.sizes_.__begin_;
    if (!v14)
      goto LABEL_19;
    goto LABEL_18;
  }
  (*(void (**)(__shared_weak_count *))(*(_QWORD *)v11 + 16))(v11);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v11);
  v14 = self->_inputImageTensor.shape_.sizes_.__begin_;
  if (v14)
  {
LABEL_18:
    self->_inputImageTensor.shape_.sizes_.__end_ = v14;
    operator delete(v14);
  }
LABEL_19:
  value = self->_net.__ptr_.__value_;
  self->_net.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 6) = 1;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = &unk_24C55E920;
  *((_DWORD *)self + 20) = 1;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = &unk_24C55E920;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_DWORD *)self + 40) = 1065353216;
  *((_DWORD *)self + 44) = 1;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 21) = &unk_24C55E8D8;
  return self;
}

+ (void)networkPath
{
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_20CC71000, log, OS_LOG_TYPE_ERROR, "Network not found: %s", buf, 0xCu);
}

+ (void)renderTap:inBuffer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "Tap buffer size mismatch.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)renderTap:inBuffer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "Failed to get tap buffer base address.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)renderTap:inBuffer:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "Tap coordinates are out of bounds.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "TapToBox preprocessing resample failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "TapToBox tap rendering failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

@implementation HAPPGFrameEnumerator

- (HAPPGFrameEnumerator)initWithBinaryRepresentation:(id)a3
{
  id v4;
  HAPPGFrameEnumerator *v5;
  uint64_t v6;
  NSData *mimosaData;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t value;
  uint64_t v12;
  HAPPGFrameEnumerator *v13;
  uint64_t (***v14)();
  uint64_t v15;
  uint64_t (***v16)();
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  id from;
  id to;
  id location;
  objc_super v25;
  uint64_t (**v26)();
  id v27;
  uint64_t (***v28)();
  uint64_t (**v29)();
  id v30;
  uint64_t (***v31)();
  _QWORD v32[3];
  _QWORD *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HAPPGFrameEnumerator;
  v5 = -[HAPPGFrameEnumerator init](&v25, sel_init);
  v6 = objc_msgSend(v4, "copy");
  mimosaData = v5->_mimosaData;
  v5->_mimosaData = (NSData *)v6;

  v8 = -[NSData bytes](v5->_mimosaData, "bytes");
  v9 = -[NSData length](v5->_mimosaData, "length");
  v5->_undecodedBytes.__data_ = (unsigned __int8 *)v8;
  v5->_undecodedBytes.__size_ = v9;
  objc_initWeak(&location, v5);
  v32[0] = &off_24D60B788;
  v33 = v32;
  objc_copyWeak(&to, &location);
  v31 = 0;
  v29 = &off_24D60B818;
  objc_moveWeak(&v30, &to);
  v31 = &v29;
  objc_destroyWeak(&to);
  objc_copyWeak(&from, &location);
  v28 = 0;
  v26 = &off_24D60B8A8;
  objc_moveWeak(&v27, &from);
  v28 = &v26;
  objc_destroyWeak(&from);
  std::make_unique[abi:ne180100]<mimosa::Decoder,std::function<BOOL ()(mimosa::CodecVersion const&)> &,std::function<BOOL ()(mimosa::Metadata const&)> &,std::function<BOOL ()(std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7> const&,double)> &>((uint64_t)v32, (uint64_t)&v29, (uint64_t)&v26, &v21);
  v10 = v21;
  v21 = 0;
  value = (uint64_t)v5->_decoder.__ptr_.__value_;
  v5->_decoder.__ptr_.__value_ = (Decoder *)v10;
  if (value)
  {
    std::default_delete<mimosa::Decoder>::operator()[abi:ne180100]((uint64_t)&v5->_decoder, value);
    v12 = v21;
    v21 = 0;
    if (v12)
      std::default_delete<mimosa::Decoder>::operator()[abi:ne180100]((uint64_t)&v21, v12);
  }
  v13 = v5;
  v14 = v28;
  if (v28 == &v26)
  {
    v15 = 4;
    v14 = &v26;
  }
  else
  {
    if (!v28)
      goto LABEL_9;
    v15 = 5;
  }
  (*v14)[v15]();
LABEL_9:
  v16 = v31;
  if (v31 == &v29)
  {
    v17 = 4;
    v16 = &v29;
  }
  else
  {
    if (!v31)
      goto LABEL_14;
    v17 = 5;
  }
  (*v16)[v17]();
LABEL_14:
  v18 = v33;
  if (v33 == v32)
  {
    v19 = 4;
    v18 = v32;
    goto LABEL_18;
  }
  if (v33)
  {
    v19 = 5;
LABEL_18:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }
  objc_destroyWeak(&location);

  return v13;
}

- (id)nextObject
{
  mimosa::Decoder **p_decoder;
  shared_ptr<const std::variant<mimosa::PacketV1, mimosa::PacketV2, mimosa::PacketV3, mimosa::PacketV4, mimosa::PacketV5, mimosa::PacketV6, mimosa::PacketV7>> *p_packetToProcess;
  void *ptr;
  span<const std::byte, 18446744073709551615UL> *p_undecodedBytes;
  unint64_t size;
  unsigned __int8 *data;
  uint64_t v9;
  PPGProcessor *value;
  uint64_t v11;
  uint64_t v12;
  __shared_weak_count *cntrl;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  HAPPGFrame *v20;
  __shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  HAPPGFrame *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  mimosa::Decoder *v28;
  void *v30;
  std::__shared_weak_count *v31;
  void *v32;
  std::__shared_weak_count *v33;
  void *__p;
  void *v35;
  uint64_t v36;

  p_decoder = (mimosa::Decoder **)&self->_decoder;
  if (!self->_decoder.__ptr_.__value_)
  {
LABEL_30:
    v24 = 0;
    return v24;
  }
  p_packetToProcess = &self->_packetToProcess;
  ptr = self->_packetToProcess.__ptr_;
  if (!ptr)
  {
    p_undecodedBytes = &self->_undecodedBytes;
    data = self->_undecodedBytes.__data_;
    size = self->_undecodedBytes.__size_;
    while (1)
    {
      v9 = mimosa::Decoder::decode(*p_decoder, data, size);
      if (!v9)
        break;
      size = self->_undecodedBytes.__size_ - v9;
      data = &p_undecodedBytes->__data_[v9];
      p_undecodedBytes->__data_ = data;
      self->_undecodedBytes.__size_ = size;
      ptr = p_packetToProcess->__ptr_;
      if (p_packetToProcess->__ptr_)
        goto LABEL_6;
    }
    v28 = *p_decoder;
    *p_decoder = 0;
    if (v28)
      std::default_delete<mimosa::Decoder>::operator()[abi:ne180100]((uint64_t)p_decoder, (uint64_t)v28);
    goto LABEL_30;
  }
LABEL_6:
  value = self->_ppgProcessor.__ptr_.__value_;
  if (!value)
  {
    v11 = operator new();
    v12 = v11;
    cntrl = self->_metadata.__cntrl_;
    v32 = self->_metadata.__ptr_;
    v33 = (std::__shared_weak_count *)cntrl;
    if (cntrl)
    {
      v14 = (unint64_t *)((char *)cntrl + 8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    health_algorithms::PPGProcessor::PPGProcessor(v11, &v32);
    v36 = v12;
    v16 = v33;
    if (v33)
    {
      p_shared_owners = (unint64_t *)&v33->__shared_owners_;
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    v19 = v36;
    v36 = 0;
    std::unique_ptr<health_algorithms::PPGProcessor>::reset[abi:ne180100]((uint64_t *)&self->_ppgProcessor, v19);
    std::unique_ptr<health_algorithms::PPGProcessor>::reset[abi:ne180100](&v36, 0);
    value = self->_ppgProcessor.__ptr_.__value_;
    ptr = p_packetToProcess->__ptr_;
  }
  health_algorithms::PPGProcessor::process_packet((uint64_t)value, (uint64_t)ptr, &v32);
  v20 = [HAPPGFrame alloc];
  v21 = p_packetToProcess->__cntrl_;
  v30 = p_packetToProcess->__ptr_;
  v31 = (std::__shared_weak_count *)v21;
  if (v21)
  {
    v22 = (unint64_t *)((char *)v21 + 8);
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  v24 = -[HAPPGFrame initWithPPGProcessorOutput:rawPacket:bootDate:](v20, "initWithPPGProcessorOutput:rawPacket:bootDate:", &v32, &v30, self->_bootDate);
  v25 = v31;
  if (v31)
  {
    v26 = (unint64_t *)&v31->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  std::shared_ptr<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7> const>::reset[abi:ne180100](p_packetToProcess);
  if (__p)
  {
    v35 = __p;
    operator delete(__p);
  }
  if (v32)
  {
    v33 = (std::__shared_weak_count *)v32;
    operator delete(v32);
  }
  return v24;
}

- (void)handlePacket:(const void *)a3 bootTime:(double)a4
{
  NSDate *v6;
  NSDate *bootDate;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v11;

  if (!self->_bootDate)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", a4);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    bootDate = self->_bootDate;
    self->_bootDate = v6;

  }
  std::allocate_shared[abi:ne180100]<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7>,std::allocator<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7>>,std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7> const&,void>((uint64_t)a3, &v11);
  std::shared_ptr<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7> const>::operator=[abi:ne180100]<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7>,void>((uint64_t)&self->_packetToProcess, &v11);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

- (void)handleMetadata:(const void *)a3
{
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v7;

  if (!self->_ppgProcessor.__ptr_.__value_)
  {
    std::allocate_shared[abi:ne180100]<mimosa::Metadata const,std::allocator<mimosa::Metadata const>,mimosa::Metadata const&,void>((const mimosa::Metadata *)a3, &v7);
    std::shared_ptr<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7> const>::operator=[abi:ne180100]<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7>,void>((uint64_t)&self->_metadata, &v7);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v7 + 1);
    if (*((_QWORD *)&v7 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
}

- (void).cxx_destruct
{
  Decoder *value;

  std::unique_ptr<health_algorithms::PPGProcessor>::reset[abi:ne180100]((uint64_t *)&self->_ppgProcessor, 0);
  std::shared_ptr<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_metadata);
  objc_storeStrong((id *)&self->_bootDate, 0);
  std::shared_ptr<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_packetToProcess);
  value = self->_decoder.__ptr_.__value_;
  self->_decoder.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<mimosa::Decoder>::operator()[abi:ne180100]((uint64_t)&self->_decoder, (uint64_t)value);
  objc_storeStrong((id *)&self->_mimosaData, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

- (void)initWithBinaryRepresentation:
{
}

- (_QWORD)initWithBinaryRepresentation:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24D60B788;
  return result;
}

- (uint64_t)initWithBinaryRepresentation:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (id)initWithBinaryRepresentation:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_24D60B8A8;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end

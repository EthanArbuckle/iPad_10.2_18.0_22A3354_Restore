@implementation AUParameterTree

- (void)_init2
{
  vector<AddressToParameter, std::allocator<AddressToParameter>> *p_addrToParamIndex;
  id *begin;
  id *end;
  unint64_t v6;
  uint64_t v7;
  AddressToParameter *v8;
  AddressToParameter *v9;
  uint64_t v10;
  uint64_t v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *observationQueue;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *valueAccessQueue;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __25__AUParameterTree__init2__block_invoke;
  v19[3] = &unk_1E2921090;
  v19[4] = self;
  -[AUParameterNode _walkTree:callback:](self, "_walkTree:callback:", 0, v19);
  p_addrToParamIndex = &self->_addrToParamIndex;
  begin = (id *)self->_addrToParamIndex.__begin_;
  end = (id *)self->_addrToParamIndex.__end_;
  v6 = 126 - 2 * __clz(((char *)end - (char *)begin) >> 4);
  if (end == begin)
    v7 = 0;
  else
    v7 = v6;
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,AddressToParameter *,false>(begin, end, v7, 1);
  v8 = p_addrToParamIndex->__begin_;
  v9 = self->_addrToParamIndex.__end_;
  if (p_addrToParamIndex->__begin_ != v9)
  {
    v10 = -1;
    do
    {
      v11 = *(_QWORD *)v8;
      if (*(_QWORD *)v8 == v10)
      {
        v16 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("2 or more parameters share the same address: 0x%llx"), v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "exceptionWithName:reason:userInfo:", CFSTR("AUInvalidNodeInfoException"), v17, 0);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v18);
      }
      v8 = (AddressToParameter *)((char *)v8 + 16);
      v10 = v11;
    }
    while (v8 != v9);
  }
  v12 = (OS_dispatch_queue *)dispatch_queue_create("AUParameterTree.observationQueue", 0);
  observationQueue = self->_observationQueue;
  self->_observationQueue = v12;

  v14 = (OS_dispatch_queue *)dispatch_queue_create("AUParameterTree.valueAccessQueue", 0);
  valueAccessQueue = self->_valueAccessQueue;
  self->_valueAccessQueue = v14;

  dispatch_queue_set_specific((dispatch_queue_t)self->_valueAccessQueue, &current_queue_key, self->_valueAccessQueue, 0);
}

- (AUParameterTree)initWithChildren:(id)a3
{
  id v4;
  AUParameterTree *v5;
  AUParameterTree *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUParameterTree;
  v5 = -[AUParameterGroup initWithID:name:children:](&v8, sel_initWithID_name_children_, &stru_1E2923288, &stru_1E2923288, v4);
  v6 = v5;
  if (v5)
    -[AUParameterTree _init2](v5, "_init2");

  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AUParameterTree;
  -[AUParameterGroup dealloc](&v2, sel_dealloc);
}

- (AUParameter)parameterWithAddress:(AUParameterAddress)address
{
  AddressToParameter *begin;
  AddressToParameter *end;
  unint64_t v5;
  unint64_t v6;
  AUParameterAddress *v7;
  AddressToParameter *v8;
  AUParameterAddress v9;
  id WeakRetained;

  begin = self->_addrToParamIndex.__begin_;
  end = self->_addrToParamIndex.__end_;
  if (end != begin)
  {
    v5 = (end - begin) >> 4;
    do
    {
      v6 = v5 >> 1;
      v7 = (AUParameterAddress *)((char *)begin + 16 * (v5 >> 1));
      v9 = *v7;
      v8 = (AddressToParameter *)(v7 + 2);
      v5 += ~(v5 >> 1);
      if (v9 < address)
        begin = v8;
      else
        v5 = v6;
    }
    while (v5);
  }
  if (begin == end || *(_QWORD *)begin != address)
    WeakRetained = 0;
  else
    WeakRetained = objc_loadWeakRetained((id *)begin + 1);
  return (AUParameter *)WeakRetained;
}

- (AUParameter)parameterWithID:(AudioUnitParameterID)paramID scope:(AudioUnitScope)scope element:(AudioUnitElement)element
{
  void *v5;

  if (self->__autoCreatedForV2AU)
  {
    -[AUParameterTree parameterWithAddress:](self, "parameterWithAddress:", (*(_QWORD *)&scope << 61) | ((unint64_t)(element & 0x1FFFFFFF) << 32) | paramID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (AUParameter *)v5;
}

- (void)_checkInitTreeObservation
{
  shared_ptr<AUObserverController> *p_observerController;
  AUParameterTree *v3;
  uint64_t v4;
  AUParameterTree *v5;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  shared_ptr<AUObserverController> v9;
  std::__shared_weak_count *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t *p_shared_weak_owners;
  unint64_t v16;
  unint64_t v17;
  std::__shared_weak_count *cntrl;
  unint64_t *v19;
  unint64_t v20;
  shared_ptr<AUObserverController> v21;

  p_observerController = &self->_observerController;
  if (self->_observerController.__ptr_)
    return;
  v3 = self;
  v4 = operator new();
  v5 = v3;
  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  objc_initWeak((id *)(v4 + 16), v5);
  -[AUParameterTree observationQueue](v5, "observationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 24) = v6;
  CAEventReceiver::CAEventReceiver((_QWORD *)(v4 + 32), v6);
  *(_QWORD *)(v4 + 64) = 0;
  *(_BYTE *)(v4 + 48) = 0;
  *(_QWORD *)(v4 + 72) = 0;
  *(_QWORD *)(v4 + 80) = 0;
  *(_QWORD *)(v4 + 56) = v4 + 64;
  *(_QWORD *)(v4 + 88) = 0;
  *(_QWORD *)(v4 + 96) = 0;

  v7 = (std::__shared_weak_count *)operator new();
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2917E50;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v4;
  v9.__ptr_ = (AUObserverController *)v4;
  v9.__cntrl_ = (__shared_weak_count *)v7;
  v21 = v9;
  v10 = *(std::__shared_weak_count **)(v4 + 8);
  if (!v10)
  {
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v7->__shared_weak_owners_;
    do
      v16 = __ldxr(p_shared_weak_owners);
    while (__stxr(v16 + 1, p_shared_weak_owners));
    *(_QWORD *)v4 = v4;
    *(_QWORD *)(v4 + 8) = v7;
    do
LABEL_13:
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    goto LABEL_16;
  }
  if (v10->__shared_owners_ == -1)
  {
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    v12 = (unint64_t *)&v7->__shared_weak_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
    *(_QWORD *)v4 = v4;
    *(_QWORD *)(v4 + 8) = v7;
    std::__shared_weak_count::__release_weak(v10);
    goto LABEL_13;
  }
LABEL_16:

  cntrl = (std::__shared_weak_count *)p_observerController->__cntrl_;
  *p_observerController = v21;
  if (cntrl)
  {
    v19 = (unint64_t *)&cntrl->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
}

- (void)observerController
{
  return self->_observerController.__ptr_;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AUParameterTree;
  -[AUParameterGroup encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", -[AUParameterTree _autoCreatedForV2AU](self, "_autoCreatedForV2AU"), CFSTR("autov2"));

}

- (AUParameterTree)initWithCoder:(id)a3
{
  id v4;
  AUParameterTree *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AUParameterTree;
  v5 = -[AUParameterGroup initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    -[AUParameterTree set_autoCreatedForV2AU:](v5, "set_autoCreatedForV2AU:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("autov2")));
    -[AUParameterTree _init2](v5, "_init2");
  }

  return v5;
}

- (void)remoteSyncParameter:(unint64_t)a3 value:(float)a4 extOriginator:(unint64_t)a5 hostTime:(unint64_t)a6 eventType:(unsigned int)a7
{
  uint64_t v7;
  int v9;
  double v11;
  id v12;

  v7 = *(_QWORD *)&a7;
  v9 = a5;
  -[AUParameterTree parameterWithAddress:](self, "parameterWithAddress:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    *(float *)&v11 = a4;
    objc_msgSend(v12, "setValue:extOriginator:atHostTime:eventType:", v9 & 0xFFFFFFFE | 1, a6, v7, v11);
  }

}

- (vector<AddressToParameter,)addrToParamIndex
{
  AddressToParameter *end;
  AddressToParameter *value;
  AddressToParameter *v6;
  id *v7;
  uint64_t v8;
  id *v9;

  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  end = self[7].__end_;
  value = self[7].__end_cap_.__value_;
  if (value != end)
  {
    std::vector<std::shared_ptr<APComponent>>::__vallocate[abi:ne180100](retstr, (value - end) >> 4);
    v6 = retstr->__end_;
    do
    {
      v7 = (id *)((char *)end + 8);
      v8 = *(_QWORD *)end;
      end = (AddressToParameter *)((char *)end + 16);
      v9 = (id *)((char *)v6 + 8);
      *(_QWORD *)v6 = v8;
      v6 = (AddressToParameter *)((char *)v6 + 16);
      objc_copyWeak(v9, v7);
    }
    while (end != value);
    retstr->__end_ = v6;
  }
  return self;
}

- (void)setAddrToParamIndex:()vector<AddressToParameter
{
  vector<AddressToParameter, std::allocator<AddressToParameter>> *p_addrToParamIndex;
  AddressToParameter *end;
  AddressToParameter *begin;
  uint64_t v6;
  unint64_t v7;
  uint64_t value;
  id *v9;
  AddressToParameter *v10;
  id *v11;
  AddressToParameter *v12;
  uint64_t v13;
  unint64_t v14;
  AddressToParameter *v15;
  id *v16;
  uint64_t v17;
  id *v18;
  unint64_t v19;
  void **v20;
  AddressToParameter *v21;
  id *v22;
  void *v23;
  id *v24;
  id *v25;
  id *v26;
  id *v27;

  p_addrToParamIndex = &self->_addrToParamIndex;
  if (&self->_addrToParamIndex != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    v6 = end - a3->__begin_;
    v7 = v6 >> 4;
    value = (uint64_t)self->_addrToParamIndex.__end_cap_.__value_;
    v9 = (id *)p_addrToParamIndex->__begin_;
    if (v6 >> 4 <= (unint64_t)((int64_t)(value - (unint64_t)p_addrToParamIndex->__begin_) >> 4))
    {
      v19 = (self->_addrToParamIndex.__end_ - (AddressToParameter *)v9) >> 4;
      if (v19 >= v7)
      {
        v25 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<AddressToParameter *,AddressToParameter *,AddressToParameter *>((void **)a3->__begin_, (void **)a3->__end_, (id *)p_addrToParamIndex->__begin_);
        v26 = (id *)p_addrToParamIndex->__end_;
        if (v26 != v25)
        {
          do
          {
            v27 = v26 - 2;
            objc_destroyWeak(v26 - 1);
            v26 = v27;
          }
          while (v27 != v25);
        }
        p_addrToParamIndex->__end_ = (AddressToParameter *)v25;
      }
      else
      {
        v20 = (void **)((char *)begin + 16 * v19);
        std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<AddressToParameter *,AddressToParameter *,AddressToParameter *>((void **)a3->__begin_, v20, (id *)p_addrToParamIndex->__begin_);
        v21 = p_addrToParamIndex->__end_;
        while (v20 != (void **)end)
        {
          v22 = v20 + 1;
          v23 = *v20;
          v20 += 2;
          v24 = (id *)((char *)v21 + 8);
          *(_QWORD *)v21 = v23;
          v21 = (AddressToParameter *)((char *)v21 + 16);
          objc_copyWeak(v24, v22);
        }
        p_addrToParamIndex->__end_ = v21;
      }
    }
    else
    {
      if (v9)
      {
        v10 = self->_addrToParamIndex.__end_;
        v11 = (id *)p_addrToParamIndex->__begin_;
        if (v10 != (AddressToParameter *)v9)
        {
          do
          {
            v12 = (AddressToParameter *)((char *)v10 - 16);
            objc_destroyWeak((id *)v10 - 1);
            v10 = v12;
          }
          while (v12 != (AddressToParameter *)v9);
          v11 = (id *)p_addrToParamIndex->__begin_;
        }
        p_addrToParamIndex->__end_ = (AddressToParameter *)v9;
        operator delete(v11);
        value = 0;
        p_addrToParamIndex->__begin_ = 0;
        p_addrToParamIndex->__end_ = 0;
        p_addrToParamIndex->__end_cap_.__value_ = 0;
      }
      if (v6 < 0)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v13 = value >> 3;
      if (value >> 3 <= v7)
        v13 = v6 >> 4;
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFF0)
        v14 = 0xFFFFFFFFFFFFFFFLL;
      else
        v14 = v13;
      std::vector<std::shared_ptr<APComponent>>::__vallocate[abi:ne180100](p_addrToParamIndex, v14);
      v15 = p_addrToParamIndex->__end_;
      while (begin != end)
      {
        v16 = (id *)((char *)begin + 8);
        v17 = *(_QWORD *)begin;
        begin = (AddressToParameter *)((char *)begin + 16);
        v18 = (id *)((char *)v15 + 8);
        *(_QWORD *)v15 = v17;
        v15 = (AddressToParameter *)((char *)v15 + 16);
        objc_copyWeak(v18, v16);
      }
      p_addrToParamIndex->__end_ = v15;
    }
  }
}

- (int)_autoCreatedForV2AU
{
  return self->__autoCreatedForV2AU;
}

- (void)set_autoCreatedForV2AU:(int)a3
{
  self->__autoCreatedForV2AU = a3;
}

- (OS_dispatch_queue)observationQueue
{
  return self->_observationQueue;
}

- (OS_dispatch_queue)valueAccessQueue
{
  return self->_valueAccessQueue;
}

- (AUAudioUnit_XH)_auXH
{
  return (AUAudioUnit_XH *)objc_loadWeakRetained((id *)&self->__auXH);
}

- (void)set_auXH:(id)a3
{
  objc_storeWeak((id *)&self->__auXH, a3);
}

- (int)numRecorders
{
  return self->_numRecorders;
}

- (void)setNumRecorders:(int)a3
{
  self->_numRecorders = a3;
}

- (AURemoteParameterObserver)remoteObserverToken
{
  return self->_remoteObserverToken;
}

- (void)setRemoteObserverToken:(AURemoteParameterObserver *)a3
{
  self->_remoteObserverToken = a3;
}

- (AURemoteParameterObserver)remoteRecorderToken
{
  return self->_remoteRecorderToken;
}

- (void)setRemoteRecorderToken:(AURemoteParameterObserver *)a3
{
  self->_remoteRecorderToken = a3;
}

- (NSXPCConnection)remoteParameterSynchronizerXPCConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_remoteParameterSynchronizerXPCConnection);
}

- (void)setRemoteParameterSynchronizerXPCConnection:(id)a3
{
  objc_storeWeak((id *)&self->_remoteParameterSynchronizerXPCConnection, a3);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  vector<AddressToParameter, std::allocator<AddressToParameter>> *p_addrToParamIndex;

  p_addrToParamIndex = &self->_addrToParamIndex;
  std::vector<AddressToParameter>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_addrToParamIndex);
  objc_destroyWeak((id *)&self->_remoteParameterSynchronizerXPCConnection);
  objc_destroyWeak((id *)&self->__auXH);
  objc_storeStrong((id *)&self->_valueAccessQueue, 0);
  objc_storeStrong((id *)&self->_observationQueue, 0);
  cntrl = self->_observerController.__cntrl_;
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
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 22) = 0;
  return self;
}

void __25__AUParameterTree__init2__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id **v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id *v17;
  id *v18;
  id *v19;
  id *v20;
  id *v21;
  id *v22;
  id *v23;
  id *v24;
  unint64_t v25;
  uint64_t v26;
  id v27;

  v4 = a3;
  if ((objc_msgSend(v4, "isGroup") & 1) == 0)
  {
    v5 = v4;
    v26 = objc_msgSend(v5, "address");
    objc_initWeak(&v27, v5);
    v6 = (id **)(*(_QWORD *)(a1 + 32) + 176);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
    if (v8 >= v7)
    {
      v10 = (uint64_t)(v8 - (_QWORD)*v6) >> 4;
      v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 60)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v12 = v7 - (_QWORD)*v6;
      if (v12 >> 3 > v11)
        v11 = v12 >> 3;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
        v13 = 0xFFFFFFFFFFFFFFFLL;
      else
        v13 = v11;
      if (v13)
        v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<applesauce::CF::StringRef,applesauce::CF::StringRef>>>(v13);
      else
        v14 = 0;
      v15 = v13 + 16 * v10;
      v16 = v13 + 16 * v14;
      *(_QWORD *)v15 = v26;
      v9 = v15 + 16;
      objc_copyWeak((id *)(v15 + 8), &v27);
      v18 = *v6;
      v17 = v6[1];
      if (v17 == *v6)
      {
        *v6 = (id *)v15;
        v6[1] = (id *)v9;
        v6[2] = (id *)v16;
        if (!v17)
          goto LABEL_21;
      }
      else
      {
        v25 = v16;
        v19 = v17 - 1;
        v20 = (id *)(v15 - 8);
        do
        {
          v21 = v19 - 1;
          *(v20 - 1) = *(v19 - 1);
          v22 = v20 - 1;
          objc_moveWeak(v20, v19);
          v19 -= 2;
          v20 -= 2;
        }
        while (v21 != v18);
        v23 = *v6;
        v17 = v6[1];
        *v6 = v22;
        v6[1] = (id *)v9;
        v6[2] = (id *)v25;
        if (v17 != v23)
        {
          do
          {
            v24 = v17 - 2;
            objc_destroyWeak(v17 - 1);
            v17 = v24;
          }
          while (v24 != v23);
          v17 = v23;
        }
        if (!v17)
          goto LABEL_21;
      }
      operator delete(v17);
    }
    else
    {
      *(_QWORD *)v8 = v26;
      v9 = v8 + 16;
      objc_copyWeak((id *)(v8 + 8), &v27);
    }
LABEL_21:
    v6[1] = (id *)v9;
    objc_destroyWeak(&v27);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (AUParameter)createParameterWithIdentifier:(NSString *)identifier name:(NSString *)name address:(AUParameterAddress)address min:(AUValue)min max:(AUValue)max unit:(AudioUnitParameterUnit)unit unitName:(NSString *)unitName flags:(AudioUnitParameterOptions)flags valueStrings:(NSArray *)valueStrings dependentParameters:(NSArray *)dependentParameters
{
  uint64_t v12;
  uint64_t v14;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  NSArray *v22;
  NSArray *v23;
  AUParameter *v24;
  double v25;
  double v26;
  AUParameter *v27;

  v12 = *(_QWORD *)&flags;
  v14 = *(_QWORD *)&unit;
  v19 = identifier;
  v20 = name;
  v21 = unitName;
  v22 = valueStrings;
  v23 = dependentParameters;
  v24 = [AUParameter alloc];
  *(AUValue *)&v25 = min;
  *(AUValue *)&v26 = max;
  v27 = -[AUParameter initWithID:name:address:min:max:unit:unitName:flags:valueStrings:dependentParameters:](v24, "initWithID:name:address:min:max:unit:unitName:flags:valueStrings:dependentParameters:", v19, v20, address, v14, v21, v12, v25, v26, v22, v23);

  return v27;
}

+ (AUParameterGroup)createGroupWithIdentifier:(NSString *)identifier name:(NSString *)name children:(NSArray *)children
{
  NSString *v7;
  NSString *v8;
  NSArray *v9;
  AUParameterGroup *v10;

  v7 = identifier;
  v8 = name;
  v9 = children;
  v10 = -[AUParameterGroup initWithID:name:children:]([AUParameterGroup alloc], "initWithID:name:children:", v7, v8, v9);

  return v10;
}

+ (AUParameterGroup)createGroupTemplate:(NSArray *)children
{
  NSArray *v3;
  AUParameterGroup *v4;

  v3 = children;
  v4 = -[AUParameterGroup initWithChildren:]([AUParameterGroup alloc], "initWithChildren:", v3);

  return v4;
}

+ (AUParameterGroup)createGroupFromTemplate:(AUParameterGroup *)templateGroup identifier:(NSString *)identifier name:(NSString *)name addressOffset:(AUParameterAddress)addressOffset
{
  AUParameterGroup *v9;
  NSString *v10;
  NSString *v11;
  AUParameterGroup *v12;

  v9 = templateGroup;
  v10 = identifier;
  v11 = name;
  v12 = -[AUParameterGroup initWithTemplate:identifier:name:addressOffset:]([AUParameterGroup alloc], "initWithTemplate:identifier:name:addressOffset:", v9, v10, v11, addressOffset);

  return v12;
}

+ (AUParameterTree)createTreeWithChildren:(NSArray *)children
{
  NSArray *v3;
  AUParameterTree *v4;

  v3 = children;
  v4 = -[AUParameterTree initWithChildren:]([AUParameterTree alloc], "initWithChildren:", v3);

  return v4;
}

@end

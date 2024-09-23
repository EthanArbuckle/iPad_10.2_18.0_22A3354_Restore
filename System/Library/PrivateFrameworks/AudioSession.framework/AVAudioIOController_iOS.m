@implementation AVAudioIOController_iOS

- (AVAudioIOController_iOS)initWithSession:(id)a3 xpcConnection:(shared_ptr<as:(shared_ptr<as:(unsigned int)a6 :(BOOL)a7 client::DeviceTimeClient>)a5 :client::XPCConnection>)a4 deviceTimeClient:timingSlot:isDecoupledInput:
{
  char cntrl;
  int ptr;
  uint64_t *var1;
  XPCConnection *var0;
  id v12;
  char *v13;
  char *v14;
  char *v15;
  std::__shared_weak_count *v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t *p_shared_weak_owners;
  unint64_t v22;
  unint64_t v23;
  objc_super v25;
  void **v26;

  cntrl = (char)a5.__cntrl_;
  ptr = (int)a5.__ptr_;
  var1 = (uint64_t *)a4.var1;
  var0 = a4.var0;
  v12 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AVAudioIOController_iOS;
  v13 = -[AVAudioIOController_iOS init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    v15 = v13 + 8;
    if (v13[88])
    {
      v26 = (void **)(v13 + 64);
      std::vector<std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)>>::__destroy_vector::operator()[abi:ne180100](&v26);
      v16 = (std::__shared_weak_count *)*((_QWORD *)v14 + 4);
      if (v16)
        std::__shared_weak_count::__release_weak(v16);
      objc_destroyWeak((id *)v14 + 1);
      v14[88] = 0;
    }
    v18 = *(_QWORD *)var0;
    v17 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
      objc_initWeak((id *)v14 + 1, v12);
      v14[16] = cntrl;
      p_shared_weak_owners = (unint64_t *)&v17->__shared_weak_owners_;
      *((_QWORD *)v14 + 3) = v18;
      *((_QWORD *)v14 + 4) = v17;
      do
        v22 = __ldxr(p_shared_weak_owners);
      while (__stxr(v22 + 1, p_shared_weak_owners));
      *((_DWORD *)v14 + 10) = ptr;
      *((_DWORD *)v14 + 12) = 0;
      *((_QWORD *)v14 + 7) = v15;
      *((_QWORD *)v14 + 8) = 0;
      *((_QWORD *)v14 + 9) = 0;
      *((_QWORD *)v14 + 10) = 0;
      do
        v23 = __ldaxr(p_shared_owners);
      while (__stlxr(v23 - 1, p_shared_owners));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    else
    {
      objc_initWeak((id *)v14 + 1, v12);
      v14[16] = cntrl;
      *((_QWORD *)v14 + 3) = v18;
      *((_QWORD *)v14 + 4) = 0;
      *((_DWORD *)v14 + 10) = ptr;
      *((_DWORD *)v14 + 12) = 0;
      *((_QWORD *)v14 + 7) = v15;
      *((_QWORD *)v14 + 8) = 0;
      *((_QWORD *)v14 + 9) = 0;
      *((_QWORD *)v14 + 10) = 0;
    }
    v14[88] = 1;
    std::shared_ptr<as::client::DeviceTimeClient>::operator=[abi:ne180100]((_QWORD *)v14 + 12, var1);
  }

  return (AVAudioIOController_iOS *)v14;
}

- (void)setTimingSlot:(unsigned int)a3
{
  atomic_store(a3, (unsigned int *)self + 10);
}

- (AudioTimeStamp)currentTime
{
  AudioTimeStamp *result;

  as::client::DeviceTimeClient::currentTime(*((as::client::DeviceTimeClient **)self + 12), (uint64_t)retstr);
  return result;
}

- (BOOL)isRunning
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  BOOL v6;
  AVAudioIOController_iOS *v7;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = self;
  v6 = 0;
  v2 = as::client::DeviceTimeGlobalState::instance((as::client::DeviceTimeGlobalState *)self);
  v8[0] = &off_1E424EC18;
  v8[1] = &v7;
  v8[2] = &v6;
  v9 = v8;
  (*(void (**)(void *, _QWORD *))(*(_QWORD *)v2 + 16))(v2, v8);
  v3 = v9;
  if (v9 == v8)
  {
    v4 = 4;
    v3 = v8;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return v6;
}

- (AVAudioIOPeriod)IOPeriod
{
  id WeakRetained;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  as::client::XPCConnection *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  double v17;
  unint64_t v18;
  double v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  AVAudioIOPeriod *result;
  unint64_t *v25;
  unint64_t v26;
  void *v27;
  _BYTE v28[24];
  _BYTE *v29;
  id v30;
  double v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)self + 1);
  if (!WeakRetained)
    goto LABEL_21;
  v6 = (std::__shared_weak_count *)*((_QWORD *)self + 4);
  if (!v6)
    goto LABEL_21;
  v7 = std::__shared_weak_count::lock(v6);
  if (!v7)
    goto LABEL_21;
  v8 = v7;
  v9 = (as::client::XPCConnection *)*((_QWORD *)self + 3);
  if (!v9)
  {
LABEL_17:
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v23 = __ldaxr(p_shared_owners);
    while (__stlxr(v23 - 1, p_shared_owners));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
LABEL_21:

    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
    return result;
  }
  as::client::XPCConnection::sync_message<double,unsigned long>(v9, &v27);
  v10 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},double,unsigned long>::sync_proxy(&v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(WeakRetained, "opaqueSessionID");
  v13 = *((unsigned __int8 *)self + 16);
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},double,unsigned long>::reply((uint64_t)&v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getIOControllerPeriod:decoupledInput:reply:", v12, v13 != 0, v14);

  objc_autoreleasePoolPop(v10);
  if (v30)
  {

    v15 = v29;
    if (v29 == v28)
    {
      v16 = 4;
      v15 = v28;
    }
    else
    {
      if (!v29)
      {
LABEL_16:

        goto LABEL_17;
      }
      v16 = 5;
    }
    (*(void (**)(void))(*v15 + 8 * v16))();
    goto LABEL_16;
  }
  v17 = v31;
  v18 = v32;
  retstr->var0 = v31;
  v19 = 0.0;
  if (v17 > 0.0)
    v19 = (double)v18 / v17;
  retstr->var1 = v19;
  retstr->var2 = v18;
  retstr->var3 = 1.0;

  v20 = v29;
  if (v29 == v28)
  {
    v21 = 4;
    v20 = v28;
  }
  else
  {
    if (!v29)
      goto LABEL_25;
    v21 = 5;
  }
  (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_25:

  v25 = (unint64_t *)&v8->__shared_owners_;
  do
    v26 = __ldaxr(v25);
  while (__stlxr(v26 - 1, v25));
  if (!v26)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }

  return result;
}

- (int64_t)createIOEventBlock:(id)a3
{
  id v4;
  id WeakRetained;
  unint64_t v6;
  int64_t v7;
  unint64_t v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)self + 1);
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)self + 12);
    v9 = 0;
    v10 = v4;
    do
    v9 = v6;
    std::vector<std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)>>::emplace_back<long const&,void({block_pointer} {__strong}&)(AVAudioIOControllerEvent)>((char **)self + 8, &v9, &v10);
    if (*((_QWORD *)self + 9) - *((_QWORD *)self + 8) == 16)
    v7 = v9;

    os_unfair_lock_unlock((os_unfair_lock_t)self + 12);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)destroyIOEventBlock:(int64_t)a3
{
  os_unfair_lock_s *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (os_unfair_lock_s *)((char *)self + 48);
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  v7 = (_QWORD *)*((_QWORD *)self + 8);
  v6 = (_QWORD *)*((_QWORD *)self + 9);
  if (v7 != v6)
  {
    while (*v7 != a3)
    {
      v7 += 2;
      if (v7 == v6)
        goto LABEL_10;
    }
  }
  if (v7 != v6)
  {
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)> *,std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)> *,std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)> *,0>(v7 + 2, v6, v7);
    v9 = v8;
    v10 = *((_QWORD *)self + 9);
    if (v10 != v8)
    {
      do
      {
        v11 = v10 - 16;

        v10 = v11;
      }
      while (v11 != v9);
    }
    *((_QWORD *)self + 9) = v9;
    if (*((_QWORD *)self + 8) == v9)
  }
LABEL_10:
  os_unfair_lock_unlock(v5);
}

- (void)privateDispatchIOControllerEvent:(unint64_t)a3
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (os_unfair_lock_s *)((char *)self + 48);
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  v6 = *((_QWORD *)self + 8);
  v5 = *((_QWORD *)self + 9);
  while (v6 != v5)
  {
    (*(void (**)(void))(*(_QWORD *)(v6 + 8) + 16))();
    v6 += 16;
  }
  os_unfair_lock_unlock(v4);
}

- (AudioPresentationTimeStamp)presentationTime
{
  AudioPresentationTimeStamp *result;

  as::client::DeviceTimeClient::currentPresentationTime(*((as::client::DeviceTimeClient **)self + 12), (uint64_t)retstr);
  return result;
}

- (BOOL)supportsDynamicLatency
{
  return as::client::DeviceTimeClient::isLatencyDynamic(*((as::client::DeviceTimeClient **)self + 12));
}

- (AVAudioTimeInterval)dynamicLatency
{
  AVAudioTimeInterval *result;

  as::client::DeviceTimeClient::currentLatency(*((as::client::DeviceTimeClient **)self + 12), (uint64_t)retstr);
  return result;
}

- (void).cxx_destruct
{
  std::__shared_weak_count *v3;
  void **v4;

  std::shared_ptr<as::client::XPCConnection>::~shared_ptr[abi:ne180100]((uint64_t)self + 96);
  if (*((_BYTE *)self + 88))
  {
    v4 = (void **)((char *)self + 64);
    std::vector<std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)>>::__destroy_vector::operator()[abi:ne180100](&v4);
    v3 = (std::__shared_weak_count *)*((_QWORD *)self + 4);
    if (v3)
      std::__shared_weak_count::__release_weak(v3);
    objc_destroyWeak((id *)self + 1);
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 88) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

- (void)isRunning
{
  unsigned int v2;
  uint64_t v5;
  unsigned int v6;
  _BYTE v7[56];
  _BYTE v8[16];
  unsigned __int8 v9;
  char v10;

  v2 = atomic_load((unsigned int *)(**(_QWORD **)(a1 + 8) + 40));
  if (v2 >= 0x21F)
    goto LABEL_14;
  caulk::concurrent::atomic_value<as::SessionSharedState,2,3>::load(a2 + 104 * v2 + 8, (uint64_t)v8);
  if (*(_BYTE *)(**(_QWORD **)(a1 + 8) + 16))
  {
    if (v10 && v8[0] != 255)
    {
      if (v8[0] < 0x42u)
      {
        v5 = a2 + 136 * v8[0];
LABEL_12:
        caulk::concurrent::atomic_value<as::MinimalTimeStamp,2,3>::load(v5 + 56480, (uint64_t)v7);
        **(_BYTE **)(a1 + 16) = v7[0];
        return;
      }
      goto LABEL_14;
    }
  }
  else
  {
    v6 = v9;
    if (v9 != 255 || !v10 && (v6 = v8[0], v8[0] != 255))
    {
      if (v6 < 0x42)
      {
        v5 = a2 + 136 * v6;
        goto LABEL_12;
      }
LABEL_14:
      std::__throw_out_of_range[abi:ne180100]("array::at");
    }
  }
}

- (__n128)isRunning
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E424EC18;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

@end

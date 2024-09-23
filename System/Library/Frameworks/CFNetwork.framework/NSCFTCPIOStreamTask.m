@implementation NSCFTCPIOStreamTask

__n128 __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke(__n128 *a1, uint64_t a2)
{
  _OWORD *v4;
  __n128 result;

  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 32, 0);
  *v4 = 0u;
  v4[1] = 0u;
  result = a1[2];
  *(_QWORD *)v4 = &off_1E14EEAA0;
  *((_QWORD *)v4 + 1) = a2;
  v4[1] = result;
  return result;
}

__n128 __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_2(__n128 *a1, uint64_t a2)
{
  _OWORD *v4;
  __n128 result;

  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 32, 0);
  *v4 = 0u;
  v4[1] = 0u;
  result = a1[2];
  *(_QWORD *)v4 = &off_1E14EEDF0;
  *((_QWORD *)v4 + 1) = a2;
  v4[1] = result;
  return result;
}

_OWORD *__82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_3(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12[2];

  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 152, 0);
  v5 = v4;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[6] = 0u;
  v4[7] = 0u;
  v4[8] = 0u;
  *((_QWORD *)v4 + 18) = 0;
  *v4 = 0u;
  v4[1] = 0u;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v12[0] = *(_QWORD *)(a1 + 40);
  v12[1] = (uint64_t)v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  __NSCFTCPIOReadStream::__NSCFTCPIOReadStream((uint64_t)v4, a2, v12, *(void **)(a1 + 32));
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v5;
}

_OWORD *__82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_4(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12[2];

  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 120, 0);
  v5 = v4;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[6] = 0u;
  *((_QWORD *)v4 + 14) = 0;
  *v4 = 0u;
  v4[1] = 0u;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v12[0] = *(_QWORD *)(a1 + 40);
  v12[1] = (uint64_t)v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  __NSCFTCPIOWriteStream::__NSCFTCPIOWriteStream((uint64_t)v4, a2, v12, *(void **)(a1 + 32));
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v5;
}

uint64_t __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_cleanupAndBreakCycles");
}

void __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD block[6];
  __int128 v9;
  uint64_t v10;

  v6 = objc_msgSend(*(id *)(a1 + 32), "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke_2;
  block[3] = &unk_1E14FCE88;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = v7;
  block[5] = a3;
  v9 = *(_OWORD *)(a1 + 40);
  dispatch_async(v6, block);
}

uint64_t __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v2 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_loggableDescription");
    v4 = *(_QWORD *)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ auth completion disp=%d cred=%p", (uint8_t *)&v7, 0x1Cu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_dealWithSessionClientCertAuth:credential:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

void __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD block[6];
  __int128 v9;
  uint64_t v10;

  v6 = objc_msgSend(*(id *)(a1 + 32), "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke_2;
  block[3] = &unk_1E14FCE88;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = v7;
  block[5] = a3;
  v9 = *(_OWORD *)(a1 + 40);
  dispatch_async(v6, block);
}

uint64_t __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v2 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_loggableDescription");
    v4 = *(_QWORD *)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ auth completion disp=%d cred=%p", (uint8_t *)&v7, 0x1Cu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_dealWithSessionTrustAuth:credential:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

uint64_t __31____NSCFTCPIOStreamTask_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancel");
}

uint64_t __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result <= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 852) = 3;
    objc_msgSend(*(id *)(a1 + 32), "setError:", objc_msgSend(MEMORY[0x1E0CB39B8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0));
    return objc_msgSend(*(id *)(a1 + 32), "_onqueue_checkForCompletion");
  }
  return result;
}

uint64_t __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50____NSCFTCPIOStreamTask__onqueue_processReadWork___block_invoke(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  _QWORD *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  v8 = (_QWORD *)MEMORY[0x1E0CB2FE0];
  if (a5)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a5, 0);
    if ((a3 & 1) != 0)
    {
LABEL_3:
      v10 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v9 = 0;
    if ((a3 & 1) != 0)
      goto LABEL_3;
  }
  v10 = objc_msgSend(v9, "domain") == *v8 && objc_msgSend(v9, "code") == 57;
LABEL_8:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 908) = v10;
  v11 = *(_QWORD *)(a1 + 32);
  if (!a2 && *(_BYTE *)(v11 + 908))
    v9 = 0;
  -[CFNetworkTimer setTimer:](*(_QWORD *)(v11 + 920), 0.0);
  v12 = objc_msgSend(*(id *)(a1 + 32), "state");
  v14 = *(_QWORD *)(a1 + 40);
  if (v12 == 1)
  {
    *(_QWORD *)(v14 + 64) = a2;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = v9;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "addObject:", *(_QWORD *)(a1 + 40));
  }
  else if (!*(_BYTE *)(v14 + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(v14 + 56) + 16))();
  }
  objc_setProperty_nonatomic(*(id *)(a1 + 32), v13, 0, 936);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 880) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
}

uint64_t __51____NSCFTCPIOStreamTask__onqueue_processWriteWork___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  if (a3)
    v4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a3, 0);
  else
    v4 = 0;
  -[CFNetworkTimer setTimer:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 912), 0.0);
  v5 = objc_msgSend(*(id *)(a1 + 32), "state");
  v7 = *(_QWORD *)(a1 + 40);
  if (v5 == 1)
  {
    *(_QWORD *)(v7 + 32) = v4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "addObject:", *(_QWORD *)(a1 + 40));
  }
  else if (!*(_BYTE *)(v7 + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(v7 + 64) + 16))();
  }
  objc_setProperty_nonatomic(*(id *)(a1 + 32), v6, 0, 928);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 905) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
}

uint64_t __40____NSCFTCPIOStreamTask__onqueue_ioTick__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
}

uint64_t __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 857) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
}

void __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  std::__shared_weak_count_vtbl *v4;
  std::__shared_weak_count *v5;
  TCPIO_Delegate *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  uint64_t *v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  _QWORD v45[12];
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  __n128 (*v49)(__n128 *, uint64_t);
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _OWORD *(*v55)(uint64_t, uint64_t);
  void *v56;
  uint64_t v57;
  TCPIO_Delegate *v58;
  std::__shared_weak_count *v59;
  uint64_t v60;
  uint64_t v61;
  __n128 (*v62)(__n128 *, uint64_t);
  void *v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;

  v2 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 768) + 64))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 768));
  v67 = 0uLL;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(std::__shared_weak_count_vtbl **)(v3 + 784);
  if (v4)
  {
    std::allocate_shared[abi:nn180100]<TCPIO_Delegate,std::allocator<TCPIO_Delegate>,std::shared_ptr<TransportConnectionObjCPP> &,void>(&v66, v4, *(std::__shared_weak_count **)(v3 + 792));
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v66 + 1);
    v6 = (TCPIO_Delegate *)v66;
    v67 = v66;
    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v7 = objc_msgSend((id)v3, "error");
  v8 = *(_BYTE **)(a1 + 32);
  v9 = MEMORY[0x1E0C809B0];
  if (v7 || v8[881])
  {
    v10 = objc_msgSend(v8, "error");
    v11 = *(_QWORD **)(a1 + 32);
    if (v10)
    {
      v12 = _CFStreamErrorFromCFError((__CFError *)objc_msgSend(v11, "error"));
    }
    else
    {
      v14 = v11 + 108;
      v12 = v11[108];
      v13 = v14[1];
    }
    v60 = v9;
    v61 = 3221225472;
    v62 = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_3;
    v63 = &__block_descriptor_48_e26__v16__0____CFReadStream__8l;
    v64 = v12;
    v65 = v13;
    v15 = (void *)CFReadStreamCreate();
    if (v6)
      TCPIO_Delegate::closeReadSide(v6);
  }
  else
  {
    v53 = MEMORY[0x1E0C809B0];
    v54 = 3321888768;
    v55 = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_4;
    v56 = &unk_1E14F3158;
    v58 = v6;
    v59 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v38 = __ldxr(p_shared_owners);
      while (__stxr(v38 + 1, p_shared_owners));
    }
    v57 = v2;
    v15 = (void *)CFReadStreamCreate();
    if (v59)
    {
      v39 = &v59->__shared_owners_;
      do
        v40 = __ldaxr((unint64_t *)v39);
      while (__stlxr(v40 - 1, (unint64_t *)v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
        std::__shared_weak_count::__release_weak(v59);
      }
    }
  }
  v16 = objc_msgSend(*(id *)(a1 + 32), "error");
  v17 = *(_BYTE **)(a1 + 32);
  if (v16 || v17[906])
  {
    v18 = objc_msgSend(v17, "error");
    v19 = *(_QWORD **)(a1 + 32);
    if (v18)
    {
      v20 = _CFStreamErrorFromCFError((__CFError *)objc_msgSend(v19, "error"));
    }
    else
    {
      v22 = v19 + 111;
      v20 = v19[111];
      v21 = v22[1];
    }
    v47 = v9;
    v48 = 3221225472;
    v49 = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_35;
    v50 = &__block_descriptor_48_e27__v16__0____CFWriteStream__8l;
    v51 = v20;
    v52 = v21;
    v23 = (void *)CFWriteStreamCreate();
    if ((_QWORD)v67)
      TCPIO_Delegate::closeWriteSide((TCPIO_Delegate *)v67);
  }
  else
  {
    v45[7] = v9;
    v45[8] = 3321888768;
    v45[9] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2_38;
    v45[10] = &unk_1E14F3190;
    v46 = v67;
    if (*((_QWORD *)&v67 + 1))
    {
      v41 = (unint64_t *)(*((_QWORD *)&v67 + 1) + 8);
      do
        v42 = __ldxr(v41);
      while (__stxr(v42 + 1, v41));
    }
    v45[11] = v2;
    v23 = (void *)CFWriteStreamCreate();
    if (*((_QWORD *)&v46 + 1))
    {
      v43 = (unint64_t *)(*((_QWORD *)&v46 + 1) + 8);
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v46 + 1) + 16))(*((_QWORD *)&v46 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v46 + 1));
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  v24 = *(_QWORD **)(a1 + 32);
  if (v24)
  {
    v25 = v24[88];
    if (!v25)
      v25 = v24[87];
  }
  else
  {
    v25 = 0;
  }
  v45[0] = v9;
  v45[1] = 3221225472;
  v45[2] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_39;
  v45[3] = &unk_1E14FB048;
  v45[5] = v15;
  v45[6] = v23;
  v45[4] = v24;
  -[__NSCFURLSessionDelegateWrapper streamTask:didBecomeInputStream:outputStream:completionHandler:](v25, v24, v15, v23, v45);
  if (v15)
    CFRelease(v15);
  if (v23)
    CFRelease(v23);
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(_QWORD *)(v26 + 768);
  if (v27)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v27 + 32))(v27);
    v66 = 0uLL;
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](*(_QWORD *)(a1 + 32) + 768, &v66);
    v28 = (std::__shared_weak_count *)*((_QWORD *)&v66 + 1);
    if (*((_QWORD *)&v66 + 1))
    {
      v29 = (unint64_t *)(*((_QWORD *)&v66 + 1) + 8);
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    v26 = *(_QWORD *)(a1 + 32);
  }
  v66 = 0uLL;
  std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](v26 + 784, &v66);
  v31 = (std::__shared_weak_count *)*((_QWORD *)&v66 + 1);
  if (*((_QWORD *)&v66 + 1))
  {
    v32 = (unint64_t *)(*((_QWORD *)&v66 + 1) + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v34 = (std::__shared_weak_count *)*((_QWORD *)&v67 + 1);
  if (*((_QWORD *)&v67 + 1))
  {
    v35 = (unint64_t *)(*((_QWORD *)&v67 + 1) + 8);
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
}

__n128 __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_3(__n128 *a1, uint64_t a2)
{
  _OWORD *v4;
  __n128 result;

  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 32, 0);
  *v4 = 0u;
  v4[1] = 0u;
  result = a1[2];
  *(_QWORD *)v4 = &off_1E14EEAA0;
  *((_QWORD *)v4 + 1) = a2;
  v4[1] = result;
  return result;
}

_OWORD *__48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_4(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12[2];

  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 152, 0);
  v5 = v4;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[6] = 0u;
  v4[7] = 0u;
  v4[8] = 0u;
  *((_QWORD *)v4 + 18) = 0;
  *v4 = 0u;
  v4[1] = 0u;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v12[0] = *(_QWORD *)(a1 + 40);
  v12[1] = (uint64_t)v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  __NSCFTCPIOReadStream::__NSCFTCPIOReadStream((uint64_t)v4, a2, v12, *(void **)(a1 + 32));
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v5;
}

__n128 __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_35(__n128 *a1, uint64_t a2)
{
  _OWORD *v4;
  __n128 result;

  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 32, 0);
  *v4 = 0u;
  v4[1] = 0u;
  result = a1[2];
  *(_QWORD *)v4 = &off_1E14EEDF0;
  *((_QWORD *)v4 + 1) = a2;
  v4[1] = result;
  return result;
}

_OWORD *__48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2_38(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12[2];

  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 120, 0);
  v5 = v4;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[6] = 0u;
  *((_QWORD *)v4 + 14) = 0;
  *v4 = 0u;
  v4[1] = 0u;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v12[0] = *(_QWORD *)(a1 + 40);
  v12[1] = (uint64_t)v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  __NSCFTCPIOWriteStream::__NSCFTCPIOWriteStream((uint64_t)v4, a2, v12, *(void **)(a1 + 32));
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v5;
}

uint64_t __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_39(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_cleanupAndBreakCycles");
}

void __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 906) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 784);
  if (v3)
  {
    (*(void (**)(_QWORD))(**(_QWORD **)(v3 + 24) + 144))(*(_QWORD *)(v3 + 24));
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = v2 + 888;
  *(_QWORD *)v4 = 1;
  *(_DWORD *)(v4 + 8) = 57;
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
  {
    v6 = v5[88];
    if (!v6)
      v6 = v5[87];
  }
  else
  {
    v6 = 0;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_2;
  v7[3] = &unk_1E14FE118;
  v7[4] = v5;
  -[__NSCFURLSessionDelegateWrapper writeClosedForStreamTask:completionHandler:](v6, v5, v7);
}

uint64_t __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

_BYTE *__44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[881])
    return (_BYTE *)objc_msgSend(result, "_onqueue_checkForCompletion");
  return result;
}

void __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD v4[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 881) = 1;
  v1 = *(_QWORD *)(a1 + 32) + 864;
  *(_QWORD *)v1 = 1;
  *(_DWORD *)(v1 + 8) = 57;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v3 = v2[88];
    if (!v3)
      v3 = v2[87];
  }
  else
  {
    v3 = 0;
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_2;
  v4[3] = &unk_1E14FE118;
  v4[4] = v2;
  -[__NSCFURLSessionDelegateWrapper readClosedForStreamTask:completionHandler:](v3, v2, v4);
}

uint64_t __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

_BYTE *__43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[906])
    return (_BYTE *)objc_msgSend(result, "_onqueue_checkForCompletion");
  return result;
}

uint64_t __55____NSCFTCPIOStreamTask__onqueue_startSecureConnection__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 856) && *(int *)(v1 + 852) <= 2)
    return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v1 + 768) + 48))(*(_QWORD *)(v1 + 768));
  return result;
}

uint64_t __54____NSCFTCPIOStreamTask__onqueue_stopSecureConnection__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 768) + 56))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 768));
}

uint64_t __45____NSCFTCPIOStreamTask_stopSecureConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_stopSecureConnection");
}

uint64_t __46____NSCFTCPIOStreamTask_startSecureConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_startSecureConnection");
}

uint64_t __62____NSCFTCPIOStreamTask_copyStreamProperty_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;

  if (a1[4])
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 784) + 24);
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 216))(v2);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __34____NSCFTCPIOStreamTask_closeRead__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_closeRead");
}

uint64_t __35____NSCFTCPIOStreamTask_closeWrite__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_closeWrite");
}

uint64_t __39____NSCFTCPIOStreamTask_captureStreams__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_captureStreams");
}

void __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __NSCFURLLocalStreamTaskWorkWrite *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  _DWORD *v14;
  _QWORD aBlock[5];
  id v16;
  id location;
  _QWORD v18[6];

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2 > 1 || *(int *)(v3 + 852) > 2 || *(_BYTE *)(v3 + 857))
  {
    v4 = objc_msgSend((id)v3, "session");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_2;
    v18[3] = &unk_1E14FDF00;
    v5 = *(_QWORD *)(a1 + 48);
    v18[4] = *(_QWORD *)(a1 + 32);
    v18[5] = v5;
    -[NSURLSession runDelegateBlock:](v4, v18);
  }
  else
  {
    v6 = *(int *)(v3 + 896);
    if ((_DWORD)v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v6, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
    }
    else
    {
      v7 = [__NSCFURLLocalStreamTaskWorkWrite alloc];
      if (v7)
      {
        v8 = -[__NSCFURLLocalStreamTaskWorkWrite init](v7, "init");
        v9 = v8;
        if (v8)
          *(_QWORD *)(v8 + 8) = "writeData";
      }
      else
      {
        v9 = 0;
      }
      *(_QWORD *)(v9 + 48) = *(id *)(a1 + 40);
      *(_QWORD *)(v9 + 16) = *(_QWORD *)(a1 + 56);
      *(_QWORD *)(v9 + 24) = 0;
      v10 = *(uint64_t **)(a1 + 32);
      v11 = v10[114];
      if (!v11 || !*(_DWORD *)(v11 + 48))
      {
        -[CFNetworkTimer setTimer:](v10[114], *(double *)(a1 + 56));
        v13 = *(void **)(a1 + 32);
        if (v13)
          objc_setProperty_nonatomic(v13, v12, (id)v9, 928);
        *(_BYTE *)(v9 + 41) = 1;
        v10 = *(uint64_t **)(a1 + 32);
      }
      objc_initWeak(&location, (id)objc_msgSend(v10, "session"));
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_3;
      aBlock[3] = &unk_1E14FCE38;
      objc_copyWeak(&v16, &location);
      aBlock[4] = *(_QWORD *)(a1 + 48);
      *(_QWORD *)(v9 + 64) = _Block_copy(aBlock);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "addObject:", v9);

      if (objc_msgSend(*(id *)(a1 + 32), "state") != 1)
      {
        v14 = *(_DWORD **)(a1 + 32);
        if (v14[213] == 2)
          objc_msgSend(v14, "_onqueue_ioTick");
      }
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_onqueue_errorOrCancelError"));
}

void __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id Weak;
  uint64_t v5;
  _QWORD v6[6];

  Weak = objc_loadWeak((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_4;
  v6[3] = &unk_1E14FDF00;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v6);
}

uint64_t __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __NSCFURLLocalStreamTaskWorkRead *v6;
  uint64_t *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  _DWORD *v11;
  _QWORD aBlock[5];
  id v13;
  id location;
  _QWORD v15[4];
  __int128 v16;

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2 > 1 || *(int *)(v3 + 852) > 2 || *(_BYTE *)(v3 + 857))
  {
    v4 = objc_msgSend((id)v3, "session");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2;
    v15[3] = &unk_1E14FDF00;
    v16 = *(_OWORD *)(a1 + 32);
    -[NSURLSession runDelegateBlock:](v4, v15);
  }
  else
  {
    v5 = *(int *)(v3 + 872);
    if ((_DWORD)v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v5, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
    }
    else
    {
      v6 = -[__NSCFURLLocalStreamTaskWorkRead init]([__NSCFURLLocalStreamTaskWorkRead alloc], "init");
      v6->super._static_description = "readData";
      *(_DWORD *)(&v6->super._timerStarted + 3) = *(_QWORD *)(a1 + 48);
      v6->_minBytes = *(_QWORD *)(a1 + 56);
      v6->super._timeout = *(double *)(a1 + 64);
      v6->super._timeoutTime = 0.0;
      v7 = *(uint64_t **)(a1 + 32);
      v8 = v7[115];
      if (!v8 || !*(_DWORD *)(v8 + 48))
      {
        -[CFNetworkTimer setTimer:](v7[115], *(double *)(a1 + 64));
        v10 = *(void **)(a1 + 32);
        if (v10)
          objc_setProperty_nonatomic(v10, v9, v6, 936);
        v6->super._timerStarted = 1;
        v7 = *(uint64_t **)(a1 + 32);
      }
      objc_initWeak(&location, (id)objc_msgSend(v7, "session"));
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3;
      aBlock[3] = &unk_1E14FCDE8;
      objc_copyWeak(&v13, &location);
      aBlock[4] = *(_QWORD *)(a1 + 40);
      v6->_completion = _Block_copy(aBlock);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "addObject:", v6);

      if (objc_msgSend(*(id *)(a1 + 32), "state") != 1)
      {
        v11 = *(_DWORD **)(a1 + 32);
        if (v11[213] == 2)
          objc_msgSend(v11, "_onqueue_ioTick");
      }
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, objc_msgSend(*(id *)(a1 + 32), "_onqueue_errorOrCancelError"));
}

void __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  id Weak;
  uint64_t v9;
  _QWORD v10[7];
  char v11;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_4;
  v10[3] = &unk_1E14FCDC0;
  v9 = *(_QWORD *)(a1 + 32);
  v10[5] = a4;
  v10[6] = v9;
  v11 = a3;
  v10[4] = a2;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v10);
}

uint64_t __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __68____NSCFTCPIOStreamTask_initWithTask_connection_extraBytes_disavow___block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_onqueue_timeoutOccured");
}

uint64_t __68____NSCFTCPIOStreamTask_initWithTask_connection_extraBytes_disavow___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_onqueue_timeoutOccured");
}

uint64_t __61____NSCFTCPIOStreamTask_initWithHost_port_taskGroup_disavow___block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_onqueue_timeoutOccured");
}

uint64_t __61____NSCFTCPIOStreamTask_initWithHost_port_taskGroup_disavow___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_onqueue_timeoutOccured");
}

@end

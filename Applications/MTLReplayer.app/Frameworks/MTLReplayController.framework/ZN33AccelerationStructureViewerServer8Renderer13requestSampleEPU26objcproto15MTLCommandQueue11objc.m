@implementation ZN33AccelerationStructureViewerServer8Renderer13requestSampleEPU26objcproto15MTLCommandQueue11objc

_QWORD *___ZN33AccelerationStructureViewerServer8Renderer13requestSampleEPU26objcproto15MTLCommandQueue11objc_object_block_invoke(uint64_t a1)
{
  uint64_t v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  _QWORD v10[4];
  _QWORD v11[72];
  _BYTE v12[24];
  _BYTE *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  v2 = *(_QWORD *)(a1 + 720);
  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3321888768;
  v10[2] = ___ZN33AccelerationStructureViewerServer8Renderer13requestSampleEPU26objcproto15MTLCommandQueue11objc_object_block_invoke_2;
  v10[3] = &unk_7272A0;
  v24 = v2;
  AccelerationStructureViewer::Sample::Sample(v11, a1 + 32);
  v20 = *(id *)(a1 + 688);
  v21 = *(id *)(a1 + 696);
  v27 = *(_BYTE *)(a1 + 744);
  v25 = *(_QWORD *)(a1 + 728);
  v22 = *(id *)(a1 + 704);
  v26 = *(_QWORD *)(a1 + 736);
  v23 = *(_QWORD *)(a1 + 712);
  dispatch_async(v4, v10);

  result = v13;
  if (v13 == v12)
  {
    v9 = 4;
    result = v12;
  }
  else
  {
    if (!v13)
      return result;
    v9 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*result + 8 * v9))(result, v5, v6, v7);
}

_QWORD *___ZN33AccelerationStructureViewerServer8Renderer13requestSampleEPU26objcproto15MTLCommandQueue11objc_object_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t **v9;
  uint64_t v10;
  unsigned int v11;
  BOOL v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *result;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  std::condition_variable *v30;
  std::chrono::steady_clock::time_point v31;
  unint64_t v32;
  std::chrono::steady_clock::time_point v33;
  std::chrono::system_clock::time_point v34;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v35;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v36;
  unint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  unsigned int v41;
  BOOL v42;
  uint64_t **v43;
  uint64_t v44;
  unint64_t v46;
  uint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t numer;
  unint64_t denom;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  unint64_t v69;
  _DWORD *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  std::__shared_weak_count *v82;
  void *v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t *v92;
  unint64_t v93;
  std::__shared_weak_count *v94;
  unint64_t *v95;
  unint64_t v96;
  _QWORD *v97;
  BOOL v98;
  uint64_t v99;
  unint64_t v100;
  std::__shared_weak_count *v101;
  uint64_t v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  int64x2_t v107;
  __int128 v108;
  void (*v109)(uint64_t);
  void *v110;
  uint64_t *v111;
  uint64_t v112;
  id v113;
  int64x2_t v114;
  unint64_t v115;
  int64x2_t v116;
  mach_timebase_info info;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  __n128 (*v121)(__n128 *, __n128 *);
  uint64_t (*v122)(uint64_t);
  void *v123;
  uint64_t v124;
  std::__shared_weak_count *v125;
  std::unique_lock<std::mutex> __lk;
  _QWORD v127[72];
  _BYTE v128[24];
  _BYTE *v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  _QWORD v136[72];
  _BYTE v137[24];
  _BYTE *v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;

  v2 = *(_QWORD *)(a1 + 720);
  AccelerationStructureViewer::Sample::Sample(v136, a1 + 32);
  v3 = *(_QWORD *)(v2 + 17536);
  v4 = *(void **)(a1 + 696);
  v106 = *(unsigned __int8 *)(a1 + 744);
  v105 = *(_QWORD *)(a1 + 728);
  v5 = *(id *)(a1 + 688);
  v6 = v4;
  std::mutex::lock((std::mutex *)(v3 + 320));
  --*(_DWORD *)(v3 + 436);
  std::mutex::unlock((std::mutex *)(v3 + 320));
  v7 = objc_msgSend(v6, "globalTraceObjectID");
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(v3 + 624);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)(v3 + 624));
  v8 = *(_QWORD *)(v3 + 736);
  if (!v8)
    goto LABEL_12;
  v9 = (uint64_t **)(v3 + 736);
  v10 = v3 + 736;
  do
  {
    v11 = *(_DWORD *)(v8 + 32);
    v12 = v11 >= v7;
    if (v11 >= v7)
      v13 = (uint64_t *)v8;
    else
      v13 = (uint64_t *)(v8 + 8);
    if (v12)
      v10 = v8;
    v8 = *v13;
  }
  while (*v13);
  if ((uint64_t **)v10 == v9 || *(_DWORD *)(v10 + 32) > v7)
  {
LABEL_12:
    NSLog(CFSTR("Missing ray collector [pre]"));
    v14 = 0;
    goto LABEL_13;
  }
  v102 = v2;
  v118 = 0;
  v119 = &v118;
  v121 = __Block_byref_object_copy__8959;
  v122 = __Block_byref_object_dispose__8960;
  v120 = 0x4012000000;
  v123 = &unk_4C2897;
  v124 = *(_QWORD *)(v10 + 40);
  v21 = *(std::__shared_weak_count **)(v10 + 48);
  v125 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v23 = __ldxr(p_shared_owners);
    while (__stxr(v23 + 1, p_shared_owners));
  }
  v103 = v6;
  v104 = v5;
  mach_timebase_info(&info);
  v99 = mach_absolute_time();
  v25 = v119[6];
  v24 = (std::__shared_weak_count *)v119[7];
  if (v24)
  {
    v26 = (unint64_t *)&v24->__shared_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  v101 = v24;
  v28 = 0;
  v29 = 0;
LABEL_35:
  v100 = v29;
  v30 = (std::condition_variable *)v119[6];
  v31.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_ + 500000000;
  while (*(_BYTE *)(v3 + 432))
  {
    if (*(_BYTE *)(v25 + 89))
      break;
    v32 = atomic_load((unint64_t *)(v25 + 48));
    if (v32 >= *(_QWORD *)(v25 + 56))
      break;
    if (std::chrono::steady_clock::now().__d_.__rep_ >= v31.__d_.__rep_)
      goto LABEL_54;
    v33.__d_.__rep_ = v31.__d_.__rep_ - std::chrono::steady_clock::now().__d_.__rep_;
    if (v33.__d_.__rep_ >= 1)
    {
      std::chrono::steady_clock::now();
      v34.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (!v34.__d_.__rep_)
      {
        v35 = 0;
        goto LABEL_49;
      }
      if (v34.__d_.__rep_ < 1)
      {
        if ((unint64_t)v34.__d_.__rep_ >= 0xFFDF3B645A1CAC09)
          goto LABEL_48;
        v35 = 0x8000000000000000;
      }
      else
      {
        if ((unint64_t)v34.__d_.__rep_ > 0x20C49BA5E353F7)
        {
          v35 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_49;
        }
LABEL_48:
        v35 = 1000 * v34.__d_.__rep_;
LABEL_49:
        if (v35 > (v33.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
        {
          v36.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
LABEL_52:
          std::condition_variable::__do_timed_wait(v30, &__lk, v36);
          std::chrono::steady_clock::now();
          goto LABEL_53;
        }
      }
      v36.__d_.__rep_ = v35 + v33.__d_.__rep_;
      goto LABEL_52;
    }
LABEL_53:
    if (std::chrono::steady_clock::now().__d_.__rep_ >= v31.__d_.__rep_)
    {
LABEL_54:
      if (*(_BYTE *)(v3 + 432))
      {
        if (!*(_BYTE *)(v25 + 89))
        {
          v37 = atomic_load((unint64_t *)(v25 + 48));
          if (v37 < *(_QWORD *)(v25 + 56))
          {
            v29 = atomic_load((unint64_t *)(v25 + 48));
            if (v100 && v29 == v100)
            {
              if (*(_BYTE *)(v3 + 32))
                NSLog(CFSTR("No new rays %llu"), v100);
              *(_BYTE *)(v119[6] + 89) = 1;
            }
            else
            {
              if (++v28 != 10)
                goto LABEL_35;
              if (*(_BYTE *)(v3 + 32))
                NSLog(CFSTR("Timed out"));
              *(_BYTE *)(v119[6] + 89) = 1;
            }
          }
        }
      }
      break;
    }
  }
  v38 = *v9;
  if (!*v9)
    goto LABEL_79;
  v39 = v3 + 736;
  v40 = *v9;
  do
  {
    v41 = *((_DWORD *)v40 + 8);
    v42 = v41 >= v7;
    if (v41 >= v7)
      v43 = (uint64_t **)v40;
    else
      v43 = (uint64_t **)(v40 + 1);
    if (v42)
      v39 = (uint64_t)v40;
    v40 = *v43;
  }
  while (*v43);
  if ((uint64_t **)v39 != v9 && *(_DWORD *)(v39 + 32) <= v7)
  {
    v66 = *(_QWORD **)(v39 + 8);
    if (v66)
    {
      do
      {
        v67 = v66;
        v66 = (_QWORD *)*v66;
      }
      while (v66);
    }
    else
    {
      v97 = (_QWORD *)v39;
      do
      {
        v67 = (_QWORD *)v97[2];
        v98 = *v67 == (_QWORD)v97;
        v97 = v67;
      }
      while (!v98);
    }
    if (*(_QWORD *)(v3 + 728) == v39)
      *(_QWORD *)(v3 + 728) = v67;
    --*(_QWORD *)(v3 + 744);
    std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v38, (uint64_t *)v39);
    std::shared_ptr<AccelerationStructureViewerServer::APSRayCollector>::~shared_ptr[abi:nn180100](v39 + 40);
    operator delete((void *)v39);
  }
  else
  {
LABEL_79:
    NSLog(CFSTR("Missing ray collector [post]"));
  }
  v44 = mach_absolute_time();
  if (atomic_load((unint64_t *)(v3 + 776)))
  {
    v46 = v44;
    v47 = *(_QWORD *)(v119[6] + 56);
    v48 = (unint64_t *)(v3 + 784);
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 + v47, v48));
    v50 = mach_absolute_time();
    v51 = atomic_load((unint64_t *)(v3 + 784));
    v52 = atomic_load((unint64_t *)(v3 + 776));
    numer = info.numer;
    denom = info.denom;
    v55 = atomic_load((unint64_t *)(v3 + 792));
    v57 = info.numer;
    v56 = info.denom;
    atomic_store(v46, (unint64_t *)(v3 + 792));
    v58 = v119;
    atomic_store(*(_QWORD *)(v119[6] + 56), (unint64_t *)(v3 + 800));
    v6 = v103;
    if (*(_BYTE *)(v3 + 32))
    {
      v59 = (double)((v50 - v52) * numer / denom) / 1000000000.0;
      v60 = (double)((v46 - v99) * numer / denom) / 1000000000.0;
      v61 = (double)((v46 - v55) * v57 / v56) / 1000000000.0;
      if (*(_QWORD *)(v3 + 584) == *(_QWORD *)(v3 + 576))
      {
        v64 = 0;
      }
      else
      {
        v62 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 40;
        do
        {
          std::mutex::lock((std::mutex *)(*(_QWORD *)(v3 + 552) + v62));
          v64 += *(_QWORD *)(*(_QWORD *)(v3 + 576) + v65);
          std::mutex::unlock((std::mutex *)(*(_QWORD *)(v3 + 552) + v62));
          ++v63;
          v62 += 64;
          v65 += 48;
        }
        while (v63 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v3 + 584) - *(_QWORD *)(v3 + 576)) >> 4));
        v58 = v119;
      }
      NSLog(CFSTR("RAYS: %llu, TIME: %f (%f rays/s) | TOTAL RAYS: %llu, TIME: %f (%f rays/s). Latency: %fs. CHUNKS WAITING TO BE PARSED: %lu"), *(_QWORD *)(v58[6] + 56), *(_QWORD *)&v61, (double)*(unint64_t *)(v58[6] + 56) / v61, v51, *(_QWORD *)&v59, (double)v51 / v59, *(_QWORD *)&v60, v64);
      if (*(_QWORD *)(v3 + 584) != *(_QWORD *)(v3 + 576))
      {
        v68 = 0;
        v69 = 0;
        do
        {
          v70 = objc_msgSend(objc_retainAutorelease(*(id *)(v3 + 8 * v106 + 64)), "contents");
          v71 = *(_QWORD *)(*(_QWORD *)(v119[6] + 64) + v68) + 1;
          if (v71 != v70[v69 + 1])
            NSLog(CFSTR("\t\t WARNING: USC %zu: expected %zu rays, parsed %zu"), v69, v70[v69 + 1], v71);
          ++v69;
          v68 += 32;
        }
        while (v69 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v3 + 584) - *(_QWORD *)(v3 + 576)) >> 4));
      }
    }
  }
  else
  {
    atomic_store(mach_absolute_time(), (unint64_t *)(v3 + 776));
    atomic_store(0, (unint64_t *)(v3 + 784));
    v6 = v103;
  }
  v72 = v119[6];
  if (!*(_BYTE *)(v72 + 89))
  {
    std::unique_lock<std::mutex>::unlock(&__lk);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "commandBufferWithDescriptor:", *(_QWORD *)(v3 + 24)));
    objc_msgSend(v14, "setLabel:", CFSTR("AtomicHeatMap"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "computeCommandEncoderWithDispatchType:", 1));
    objc_msgSend(v83, "setLabel:", CFSTR("AtomicHeatMap"));
    objc_msgSend(v83, "setComputePipelineState:", *(_QWORD *)(v3 + 48));
    objc_msgSend(v83, "setTexture:atIndex:", v140, 0);
    v84 = (uint64_t)(*(_QWORD *)(v119[6] + 72) - *(_QWORD *)(v119[6] + 64)) >> 5;
    if (v84 >= 0x64)
      v84 = 100;
    if (v84)
    {
      v85 = 0;
      v86 = 0;
      v87 = (_QWORD *)(v3 + 8 * v106 + 112);
      do
      {
        objc_msgSend(v83, "setBuffer:offset:atIndex:", *v87, v85 * *(unsigned int *)(v105 + 20), 0);
        objc_msgSend(v83, "setBuffer:offset:atIndex:", *(_QWORD *)(*(_QWORD *)(v119[6] + 64) + 8 * v85 + 16), 0, 1);
        *(_QWORD *)&v108 = 0;
        *(_QWORD *)&v108 = *(_QWORD *)(*(_QWORD *)(v119[6] + 64) + 8 * v85) - 1;
        objc_msgSend(v83, "setBytes:length:atIndex:", &v108, 8, 2);
        v88 = v119[6];
        v89 = *(_QWORD *)(v88 + 64);
        v90 = *(_QWORD *)(v89 + 8 * v85);
        if (v90 >= 2 && v90 < *(_QWORD *)(v89 + 8 * v85 + 8))
        {
          v115 = v90 - 1;
          v107 = vdupq_n_s64(1uLL);
          v116 = v107;
          v113 = objc_msgSend(*(id *)(v3 + 48), "maxTotalThreadsPerThreadgroup");
          v114 = v107;
          objc_msgSend(v83, "dispatchThreads:threadsPerThreadgroup:", &v115, &v113);
          v88 = v119[6];
          v89 = *(_QWORD *)(v88 + 64);
        }
        ++v86;
        v91 = (*(_QWORD *)(v88 + 72) - v89) >> 5;
        if (v91 >= 0x64)
          v91 = 100;
        v85 += 4;
      }
      while (v86 < v91);
    }
    objc_msgSend(v83, "endEncoding");
    *(_QWORD *)&v108 = _NSConcreteStackBlock;
    *((_QWORD *)&v108 + 1) = 3221225472;
    v109 = ___ZN33AccelerationStructureViewerServer8Profiler11finishFrameEPU26objcproto15MTLCommandQueue11objc_objectPU35objcproto24MTLComputeCommandEncoder11objc_objectmP18ASVSRenderSettingsPN27AccelerationStructureViewer6SampleE_block_invoke;
    v110 = &unk_727558;
    v111 = &v118;
    v112 = v3;
    objc_msgSend(v14, "addCompletedHandler:", &v108);

    v2 = v102;
    v6 = v103;
    goto LABEL_130;
  }
  v73 = atomic_load((unint64_t *)(v72 + 48));
  v74 = *(_QWORD *)(v119[6] + 56);
  v108 = 0uLL;
  std::shared_ptr<AccelerationStructureViewerServer::APSRayCollector>::operator=[abi:nn180100]((uint64_t)(v119 + 6), &v108);
  v75 = (std::__shared_weak_count *)*((_QWORD *)&v108 + 1);
  if (*((_QWORD *)&v108 + 1))
  {
    v76 = (unint64_t *)(*((_QWORD *)&v108 + 1) + 8);
    do
      v77 = __ldaxr(v76);
    while (__stlxr(v77 - 1, v76));
    if (!v77)
    {
      ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
      std::__shared_weak_count::__release_weak(v75);
    }
  }
  std::unique_lock<std::mutex>::unlock(&__lk);
  v2 = v102;
  if (*(_BYTE *)(v3 + 32))
    NSLog(CFSTR("COLLECTOR IS DAMAGED; WE COLLECTED %llu/%llu rays"), v73, v74);
  if (v73 + 1 > 1)
  {
    v14 = 0;
    goto LABEL_130;
  }
  if (*(_QWORD *)(v3 + 584) == *(_QWORD *)(v3 + 576))
  {
LABEL_111:
    if (*(_BYTE *)(v3 + 32))
      NSLog(CFSTR("COLLECTOR IS VERY DAMAGED"));
    std::mutex::lock((std::mutex *)(v3 + 320));
    v82 = v101;
    v2 = v102;
    if (*(_BYTE *)(v3 + 432) && !*(_DWORD *)(v3 + 436))
      AccelerationStructureViewerServer::Profiler::stopAPSStreaming(v3, *(void **)v3);
    std::mutex::unlock((std::mutex *)(v3 + 320));
    v14 = 0;
  }
  else
  {
    v78 = 0;
    v79 = 0;
    v80 = 40;
    while (1)
    {
      std::mutex::lock((std::mutex *)(*(_QWORD *)(v3 + 552) + v78));
      v81 = *(_QWORD *)(*(_QWORD *)(v3 + 576) + v80);
      std::mutex::unlock((std::mutex *)(*(_QWORD *)(v3 + 552) + v78));
      if (v81)
        break;
      ++v79;
      v78 += 64;
      v80 += 48;
      if (v79 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v3 + 584) - *(_QWORD *)(v3 + 576)) >> 4))
        goto LABEL_111;
    }
    v14 = 0;
    v2 = v102;
LABEL_130:
    v82 = v101;
  }
  if (v82)
  {
    v92 = (unint64_t *)&v82->__shared_owners_;
    do
      v93 = __ldaxr(v92);
    while (__stlxr(v93 - 1, v92));
    if (!v93)
    {
      ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
      std::__shared_weak_count::__release_weak(v82);
    }
  }
  _Block_object_dispose(&v118, 8);
  v94 = v125;
  v5 = v104;
  if (v125)
  {
    v95 = (unint64_t *)&v125->__shared_owners_;
    do
      v96 = __ldaxr(v95);
    while (__stlxr(v96 - 1, v95));
    if (!v96)
    {
      ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
      std::__shared_weak_count::__release_weak(v94);
    }
  }
LABEL_13:
  if (__lk.__owns_)
    std::mutex::unlock(__lk.__m_);

  v15 = *(void **)(a1 + 704);
  if (*(void **)(a1 + 696) != v15)
    AccelerationStructureViewerServer::Profiler::finishSkipFrame(*(_QWORD *)(v2 + 17536), v15);
  v16 = *(_BYTE *)(a1 + 744);
  AccelerationStructureViewer::Sample::Sample(v127, (uint64_t)v136);
  AccelerationStructureViewerServer::Renderer::commitSample(v2, v16, (uint64_t)v127, v14, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 712) + 8) + 40), *(double *)(a1 + 736));

  v17 = v129;
  if (v129 == v128)
  {
    v18 = 4;
    v17 = v128;
LABEL_21:
    (*(void (**)(void))(*v17 + 8 * v18))();
  }
  else if (v129)
  {
    v18 = 5;
    goto LABEL_21;
  }

  result = v138;
  if (v138 == v137)
  {
    v20 = 4;
    result = v137;
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v20))();
  }
  else if (v138)
  {
    v20 = 5;
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v20))();
  }
  return result;
}

@end

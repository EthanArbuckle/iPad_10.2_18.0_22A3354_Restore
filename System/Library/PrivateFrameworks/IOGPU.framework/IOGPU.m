uint64_t IOGPUResourceListAddResource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v3 = *(unsigned int *)(a2 + 16);
  v4 = (0x9E3779B97F4A7C15 * v3) >> -*(_BYTE *)(a1 + 488);
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 456) + 4 * v4);
  do
  {
    if (!v5)
      return _ioGPUResourceListAddResourceEntry(a1, a2, a3, 0);
    v6 = __clz(__rbit32(v5));
    v5 &= ~(1 << v6);
    v7 = (v6 + v4) & (*(_DWORD *)(a1 + 480) - 1);
    v8 = *(_QWORD *)(a1 + 472);
    v9 = *(_QWORD *)(v8 + 8 * v7);
  }
  while ((*(_DWORD *)(v8 + 8 * v7) & 0xFFFFFF) != (_DWORD)v3);
  v10 = (unsigned __int16)(HIWORD(v9) | a3);
  if (v10 != HIWORD(v9))
  {
    *(_QWORD *)(v8 + 8 * v7) = v9 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 48);
    *(_WORD *)(*(_QWORD *)(a1 + 512) + (((v9 >> 27) & 0x1FFFFF) << 6) + 2 * ((v9 >> 24) & 7) + 48) = HIWORD(v9) | a3;
    v9 = v9 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 48);
  }
  return (v9 >> 24) & 0xFFFFFF;
}

uint64_t IOGPUResourceGetProtectionOptions(uint64_t a1)
{
  return *(_QWORD *)(a1 + 104);
}

uint64_t IOGPUMetalCommandBufferStorageEndSegment(uint64_t result)
{
  uint64_t v1;
  int v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(unsigned int *)(result + 688);
  v2 = *(_DWORD *)(result + 48) - *(_DWORD *)(result + 40);
  v4 = *(_QWORD *)(result + 120);
  v3 = *(_DWORD **)(result + 128);
  v3[6] = *(_DWORD *)(result + 684);
  v3[7] = v1;
  v3[3] = v2;
  ++*(_DWORD *)(v4 + 8);
  ++*(_DWORD *)(result + 840);
  v5 = *(_QWORD *)(result + 136);
  v6 = v5 + (v1 << 6);
  *(_QWORD *)(result + 848) = v3;
  *(_QWORD *)(result + 856) = v5;
  *(_QWORD *)(result + 128) = v6;
  *(_QWORD *)(result + 136) = v6 + 32;
  return result;
}

void __ioGPUCommandQueueFinalize_block_invoke_2(uint64_t a1)
{
  IOGPUNotificationQueueSetDispatchQueue(*(dispatch_queue_t **)(a1 + 32), 0, 0);
  IOGPUNotificationQueueRelease(*(const void **)(a1 + 32));
}

dispatch_queue_t *IOGPUNotificationQueueSetDispatchQueue(dispatch_queue_t *result, NSObject *a2, int a3)
{
  dispatch_queue_t *v5;
  const char *label;
  const char *v7;
  dispatch_queue_t v8;
  uint64_t v9;

  if (result)
  {
    v5 = result;
    result = (dispatch_queue_t *)CFGetTypeID(result);
    if (result == (dispatch_queue_t *)kIOGPUNotificationQueueID)
    {
      if (v5[9])
      {
        dispatch_assert_queue_not_V2(v5[6]);
        dispatch_mach_cancel();
        result = (dispatch_queue_t *)dispatch_semaphore_wait(v5[7], 0xFFFFFFFFFFFFFFFFLL);
        if (v5[6])
          IOGPUNotificationQueueSetDispatchQueue_cold_2();
        if (v5[9])
          IOGPUNotificationQueueSetDispatchQueue_cold_1();
      }
      if (a2 && (a3 == 1 || a3 == 2))
      {
        label = dispatch_queue_get_label(a2);
        if (*label)
          v7 = label;
        else
          v7 = "IOGPUNotificationQueueDispatchQueue";
        CFRetain(v5);
        v8 = dispatch_queue_create_with_target_V2(v7, 0, a2);
        v9 = dispatch_mach_create();
        v5[6] = v8;
        v5[9] = (dispatch_queue_t)v9;
        return (dispatch_queue_t *)dispatch_mach_connect();
      }
    }
  }
  return result;
}

dispatch_queue_t *IOGPUCommandQueueSetDispatchQueue(uint64_t a1, NSObject *a2)
{
  return IOGPUNotificationQueueSetDispatchQueue(*(dispatch_queue_t **)(a1 + 40), a2, 1);
}

uint64_t IOGPUCommandQueueGetGlobalTraceObjectID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

mach_port_t *IOGPUCommandQueueCreateWithQoS(mach_port_t *a1, int a2, char a3)
{
  mach_port_t *Instance;
  kern_return_t v7;
  mach_port_t *v8;
  uint64_t v9;
  _QWORD *v10;
  kern_return_t v11;
  int v12;
  int x;
  size_t v15;
  uint64_t outputStruct;
  uint64_t v17;
  uint64_t input[2];
  _OWORD buffer[64];
  int v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 16;
  if (IOGPUCommandQueueGetTypeID_onceToken != -1)
    dispatch_once(&IOGPUCommandQueueGetTypeID_onceToken, &__block_literal_global_5);
  Instance = (mach_port_t *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    memset(buffer, 0, 512);
    outputStruct = 0;
    v17 = 0;
    CFRetain(a1);
    *((_QWORD *)Instance + 2) = a1;
    *((_QWORD *)Instance + 3) = 0;
    *((_QWORD *)Instance + 5) = 0;
    x = 0;
    pid_for_task(*MEMORY[0x24BDAEC58], &x);
    proc_pidpath(x, buffer, 0x400u);
    v20 = a2;
    v21 = a3;
    v7 = IOConnectCallMethod(a1[5], 7u, 0, 0, buffer, 0x408uLL, 0, 0, &outputStruct, &v15);
    if (v7)
    {
      if (v7 == -536379391)
        abort();
      v8 = a1;
      goto LABEL_15;
    }
    if (!outputStruct)
      IOGPUCommandQueueCreateWithQoS_cold_1();
    v9 = v17;
    *((_QWORD *)Instance + 3) = outputStruct;
    *((_QWORD *)Instance + 4) = v9;
    v10 = (_QWORD *)IOGPUNotificationQueueCreate(a1, 0x100u, 0x28u);
    *((_QWORD *)Instance + 5) = v10;
    if (!v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        IOGPUCommandQueueCreateWithQoS_cold_2();
      goto LABEL_14;
    }
    input[0] = *((_QWORD *)Instance + 3);
    input[1] = (uint64_t)IOGPUNotificationQueueGetID(v10);
    v11 = IOConnectCallMethod(a1[5], 0x19u, input, 2u, 0, 0, 0, 0, 0, 0);
    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        IOGPUCommandQueueCreateWithQoS_cold_3(v12);
LABEL_14:
      v8 = Instance;
LABEL_15:
      CFRelease(v8);
      return 0;
    }
  }
  return Instance;
}

_QWORD *IOGPUNotificationQueueGetID(_QWORD *result)
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    if (CFGetTypeID(result) == kIOGPUNotificationQueueID)
      return (_QWORD *)v1[3];
    else
      return 0;
  }
  return result;
}

uint64_t IOGPUNotificationQueueCreate(mach_port_t *a1, unsigned int a2, unsigned int a3)
{
  uint64_t Instance;
  const void *v7;
  uint64_t v8;
  uint64_t NotificationPort;
  size_t v11;
  uint64_t outputStruct;
  uint64_t v13;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v11 = 16;
  if (IOGPUNotificationQueueCreate_once != -1)
    dispatch_once(&IOGPUNotificationQueueCreate_once, &__block_literal_global_2);
  if (IOGPUNotificationQueueGetTypeID_onceToken != -1)
    dispatch_once(&IOGPUNotificationQueueGetTypeID_onceToken, &__block_literal_global_0);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    outputStruct = 0;
    v13 = 0;
    CFRetain(a1);
    *(_QWORD *)(Instance + 24) = 0;
    *(_QWORD *)(Instance + 16) = a1;
    *(_QWORD *)(Instance + 72) = 0;
    *(_QWORD *)(Instance + 32) = 0;
    *(_DWORD *)(Instance + 40) = 0;
    *(_QWORD *)(Instance + 48) = 0;
    *(_QWORD *)(Instance + 56) = 0;
    input[0] = a2;
    input[1] = a3;
    if (IOConnectCallMethod(a1[5], 0xFu, input, 2u, 0, 0, 0, 0, &outputStruct, &v11))
    {
      v7 = a1;
    }
    else
    {
      if (!(_DWORD)v13)
        IOGPUNotificationQueueCreate_cold_1();
      v8 = outputStruct;
      *(_QWORD *)(Instance + 24) = v13;
      *(_QWORD *)(Instance + 32) = v8;
      NotificationPort = IODataQueueAllocateNotificationPort();
      *(_DWORD *)(Instance + 40) = NotificationPort;
      if ((_DWORD)NotificationPort
        && !MEMORY[0x212BDE960](a1[5], 0, NotificationPort, *(_QWORD *)(Instance + 24)))
      {
        *(_QWORD *)(Instance + 56) = dispatch_semaphore_create(0);
        *(_QWORD *)(Instance + 64) = dispatch_semaphore_create(a2);
        return Instance;
      }
      v7 = (const void *)Instance;
    }
    CFRelease(v7);
    return 0;
  }
  return Instance;
}

void ioGPUResourceFinalize(uint64_t a1)
{
  uintptr_t v2;
  uint64_t v3;
  const void *v4;

  v2 = *(unsigned int *)(a1 + 48);
  if ((_DWORD)v2)
  {
    if (*MEMORY[0x24BDAC928])
    {
      v3 = *(_QWORD *)(a1 + 24);
      if (v3)
        ((void (*)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD))*MEMORY[0x24BDAC928])(32, *MEMORY[0x24BDAEC58], v3, *(_QWORD *)(a1 + 40), 0, 0);
    }
    if (IOConnectTrap1(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 1u, v2) == -536870187)
      ioGPUResourceFinalize_cold_1();
    *(_DWORD *)(a1 + 48) = 0;
    *(_QWORD *)(a1 + 72) = 0;
  }
  v4 = *(const void **)(a1 + 16);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 16) = 0;
  }
}

void IOGPUMetalSuballocatorFree(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  unsigned int MaxFreeSize;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t **v23;
  uint64_t *v24;
  unsigned int v25;
  BOOL v26;
  uint64_t *v27;
  int v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  char **v33;
  unint64_t v34;
  char *v35;
  char **v36;
  char *v37;
  void **v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  __int16 v48;
  const char *v49;
  int v50;
  uint64_t **v51;
  unint64_t v52;

  if (!a1 || !a2)
    IOGPUMetalSuballocatorFree_cold_1();
  if ((unint64_t)(*(_QWORD *)a2 - 1) >= 0x20000)
    IOGPUMetalSuballocatorFree_cold_5();
  if (*(_QWORD *)(a2 + 8) + *(_QWORD *)a2 > 0x20000uLL)
    IOGPUMetalSuballocatorFree_cold_2();
  v3 = *(unsigned __int16 *)(a2 + 18);
  if (v3 >= 0x20)
    IOGPUMetalSuballocatorFree_cold_4();
  if (*(unsigned __int16 *)(a2 + 16) >= 0x400u)
    IOGPUMetalSuballocatorFree_cold_3();
  v5 = (os_unfair_lock_s *)(a1 + 88 * *(unsigned __int16 *)(a2 + 18));
  v6 = v5 + 20;
  os_unfair_lock_lock(v5 + 20);
  v7 = *(__int16 *)(a2 + 16);
  v8 = *(_QWORD *)&v5->_os_unfair_lock_opaque;
  v9 = *(_QWORD *)&v5->_os_unfair_lock_opaque + (v7 << 6);
  v10 = (_DWORD *)(v9 + 48);
  if (!*(_DWORD *)(v9 + 48))
    __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 432, "buffer.isAlive() && \"Reference to dead buffer\"");
  objc_msgSend(*(id *)v9, "gpuAddress");
  MTLRangeAllocatorDeallocate();
  --*v10;
  MaxFreeSize = MTLRangeAllocatorGetMaxFreeSize();
  v12 = MaxFreeSize;
  v13 = v8 + (v7 << 6);
  v16 = *(_DWORD *)(v13 + 56);
  v15 = (unsigned int *)(v13 + 56);
  v14 = v16;
  if (v16 > MaxFreeSize)
  {
    v49 = "buffer.freeSize <= newFreeSize && \"Buffer cannot have less space as a result of deallocation\"";
    v50 = 442;
    goto LABEL_68;
  }
  v17 = MaxFreeSize;
  if (MaxFreeSize > 0x20000uLL)
  {
    v49 = "newFreeSize <= kBufferSize && \"Unexpected free size\"";
    v50 = 443;
    goto LABEL_68;
  }
  v18 = v14 != MaxFreeSize || *v10 == 0;
  if (!v18)
    goto LABEL_58;
  v19 = a1 + 88 * v3;
  v22 = *(_QWORD *)(v19 + 56);
  v20 = (uint64_t *)(v19 + 56);
  v21 = v22;
  if (!v22)
    goto LABEL_26;
  v23 = (uint64_t **)(v20 - 1);
  v24 = v20;
  do
  {
    v25 = *(_DWORD *)(v21 + 28);
    v26 = v25 >= v14;
    if (v25 >= v14)
      v27 = (uint64_t *)v21;
    else
      v27 = (uint64_t *)(v21 + 8);
    if (v26)
      v24 = (uint64_t *)v21;
    v21 = *v27;
  }
  while (*v27);
  if (v24 == v20 || v14 < *((_DWORD *)v24 + 7))
LABEL_26:
    __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 449, "it != heap.index.end() && \"Buffer index corrupt: buffer not found at expected size\"");
  v28 = *(unsigned __int16 *)(a2 + 16);
  if (*((unsigned __int16 *)v24 + 16) == v28)
  {
    v29 = v24;
  }
  else
  {
    do
    {
      if (*((_DWORD *)v24 + 7) != v14)
        __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 452, "it->first == buffer.freeSize");
      v30 = (uint64_t *)v24[1];
      if (v30)
      {
        do
        {
          v29 = v30;
          v30 = (uint64_t *)*v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          v29 = (uint64_t *)v24[2];
          v18 = *v29 == (_QWORD)v24;
          v24 = v29;
        }
        while (!v18);
      }
      v24 = v29;
    }
    while (*((unsigned __int16 *)v29 + 16) != v28);
  }
  v51 = v23;
  std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__remove_node_pointer(v23, v29);
  free(v29);
  if (*v10)
  {
    v6 = v5 + 20;
    if (*v15 != v12)
    {
      *v15 = v12;
      v52 = v17 | ((unint64_t)*(unsigned __int16 *)(a2 + 16) << 32);
      std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>(v51, (unsigned int *)&v52);
    }
    goto LABEL_58;
  }
  v6 = v5 + 20;
  if (v12 != 0x20000)
  {
    v49 = "newFreeSize == kBufferSize && \"Allocator state not empty with no allocations left\"";
    v50 = 460;
LABEL_68:
    __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", v50, v49);
  }
  MTLRangeAllocatorDestroy();

  v31 = a1 + 88 * v3;
  v34 = *(_QWORD *)(v31 + 40);
  v33 = (char **)(v31 + 40);
  v32 = v34;
  v36 = v33 - 1;
  v35 = *(v33 - 1);
  if ((unint64_t)v35 >= v34)
  {
    v38 = (void **)(v33 - 2);
    v39 = *(v33 - 2);
    v40 = v35 - v39;
    if (v35 - v39 <= -3)
      std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
    v41 = v40 >> 1;
    v42 = v32 - (_QWORD)v39;
    if (v42 <= (v40 >> 1) + 1)
      v43 = v41 + 1;
    else
      v43 = v42;
    if (v42 >= 0x7FFFFFFFFFFFFFFELL)
      v44 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v44 = v43;
    if (v44)
    {
      v45 = (char *)IOGPUMetalSuballocatorHeap::Allocator<short>::allocate((uint64_t)v33, v44);
      v35 = *v36;
      v39 = (char *)*v38;
    }
    else
    {
      v45 = 0;
    }
    v46 = &v45[2 * v41];
    v47 = &v45[2 * v44];
    *(_WORD *)v46 = *(_WORD *)(a2 + 16);
    v37 = v46 + 2;
    while (v35 != v39)
    {
      v48 = *((_WORD *)v35 - 1);
      v35 -= 2;
      *((_WORD *)v46 - 1) = v48;
      v46 -= 2;
    }
    *v38 = v46;
    *v36 = v37;
    *v33 = v47;
    if (v39)
      free(v39);
  }
  else
  {
    *(_WORD *)v35 = *(_WORD *)(a2 + 16);
    v37 = v35 + 2;
  }
  *v36 = v37;
LABEL_58:
  os_unfair_lock_unlock(v6);
}

void sub_211655E2C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id IOGPUMetalSuballocatorAllocate(uint64_t a1, uint64_t *a2, unint64_t a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  unsigned int v15;
  unsigned int v16;
  id v17;
  uint64_t v18;
  char **v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unsigned __int16 v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  unsigned int v32;
  BOOL v33;
  uint64_t *v34;
  unint64_t v35;
  char *v36;
  char *v37;
  _DWORD *v38;
  unsigned int *v39;
  int v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  _WORD **v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  unsigned int MaxFreeSize;
  char *v57;
  unsigned int v58;
  BOOL v59;
  int v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t **v65;
  uint64_t *v66;
  unsigned int v67;
  BOOL v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t *v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  unsigned int v76;
  unsigned int v77;
  int v78;
  unsigned int v79;
  uint64_t v80;
  unsigned int v81;
  unsigned int v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  __int128 v87;
  __int128 v88;
  char *v89;
  _DWORD *v90;
  void *v91;
  unsigned __int16 v92;
  unsigned int v93;
  unsigned int v94;
  char *v95;
  uint64_t v96;
  void *v97;
  unsigned int v98;
  _WORD **v99;
  _WORD *v100;
  uint64_t v101;
  unint64_t v102;
  char **v103;
  unint64_t v104;
  _WORD *v105;
  _WORD *v106;
  uint64_t v107;
  __int16 v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  char *v113;
  char *v114;
  char *v115;
  __int16 v116;
  unint64_t v117;
  unsigned int v118;
  unsigned int *v119;
  unsigned int v120;
  unsigned int v121;
  int v123;
  const char *v124;
  const char *v125;
  int v126;
  const char *v127;
  int v128;
  uint64_t **v129;
  unint64_t *v130;
  _QWORD *v131;
  uint64_t v132;
  uint64_t v133;
  os_unfair_lock_s *lock;
  unsigned int v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t *v138;
  unint64_t v140;
  unint64_t v141;

  if (!a1 || !a2 || !a4)
    IOGPUMetalSuballocatorAllocate_cold_1();
  v11 = *a4;
  v12 = *a4 >> 4;
  v13 = (*a4 >> 8) & 3;
  if (v13 == 2)
  {
    LODWORD(v13) = 0;
    *a4 = v11 & 0xFFFFFFFFFFFFFDFFLL;
  }
  v14 = v12 <= 2 && ((v13 | v11) & 0xE) == 0;
  v15 = (v11 >> 14) & 0x10 | (4 * (v11 & 0xF)) | (8 * v13) | v12;
  if (v14)
    v16 = v15;
  else
    v16 = 0xFFFF;
  *((_WORD *)a2 + 9) = v16;
  if ((unint64_t)*a2 > 0x20000)
    return 0;
  v17 = 0;
  if (a3 <= 0x20000 && *a2 && (v16 & 0x8000) == 0)
  {
    v18 = 256;
    if (a3 > 0x100)
      v18 = a3;
    v136 = v18;
    v19 = (char **)(a1 + 88 * v16);
    lock = (os_unfair_lock_s *)(v19 + 10);
    os_unfair_lock_lock((os_unfair_lock_t)v19 + 20);
    v20 = v19[9];
    v21 = *a4;
    if (v20 == (char *)-1)
    {
      v19[9] = (char *)v21;
    }
    else if (v20 != (char *)v21)
    {
      __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 191, "false && \"Different MTLResourceOptions used for the same heap index, this is not supported\"");
    }
    v130 = a4;
    v131 = v19 + 9;
    v132 = a1;
    v133 = a6;
    v137 = *a2;
    v138 = a2;
    v22 = a5;
    v135 = v16;
    if (a5)
    {
      v23 = *v19;
      if (v19[1] != *v19)
      {
        v24 = 0;
        v25 = 0;
        while (1)
        {
          v26 = &v23[64 * v24];
          if (objc_msgSend(*(id *)v26, "gpuAddress") == a5)
          {
            objc_msgSend(*(id *)v26, "gpuAddress");
            if (MTLRangeAllocatorAllocateRange())
              break;
          }
          v24 = (__int16)++v25;
          v23 = *v19;
          if ((__int16)v25 >= (unint64_t)((v19[1] - *v19) >> 6))
            goto LABEL_52;
        }
        MaxFreeSize = MTLRangeAllocatorGetMaxFreeSize();
        v57 = &v23[64 * v24];
        v58 = *((_DWORD *)v57 + 14);
        v59 = v58 > MaxFreeSize;
        v60 = v137;
        if (v58 != MaxFreeSize)
        {
          if (!v59)
            __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 215, "newFreeSize < buffer.freeSize && \"Buffer cannot have more space as a result of allocation\"");
          v61 = a1 + 88 * v135;
          v64 = *(_QWORD *)(v61 + 56);
          v62 = (uint64_t *)(v61 + 56);
          v63 = v64;
          v65 = (uint64_t **)(v62 - 1);
          if (v64)
          {
            v66 = v62;
            do
            {
              v67 = *(_DWORD *)(v63 + 28);
              v68 = v67 >= v137;
              if (v67 >= v137)
                v69 = (uint64_t *)v63;
              else
                v69 = (uint64_t *)(v63 + 8);
              if (v68)
                v66 = (uint64_t *)v63;
              v63 = *v69;
            }
            while (*v69);
            if (v66 != v62)
            {
              while (*((unsigned __int16 *)v66 + 16) != v25)
              {
                v70 = (uint64_t *)v66[1];
                if (v70)
                {
                  do
                  {
                    v71 = v70;
                    v70 = (uint64_t *)*v70;
                  }
                  while (v70);
                }
                else
                {
                  do
                  {
                    v71 = (uint64_t *)v66[2];
                    v14 = *v71 == (_QWORD)v66;
                    v66 = v71;
                  }
                  while (!v14);
                }
                v66 = v71;
                if (v71 == v62)
                  goto LABEL_138;
              }
              std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__remove_node_pointer((uint64_t **)v62 - 1, v66);
              free(v66);
            }
          }
LABEL_138:
          *((_DWORD *)v57 + 14) = MaxFreeSize;
          v141 = MaxFreeSize | ((unint64_t)v25 << 32);
          std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>(v65, (unsigned int *)&v141);
          v60 = v137;
        }
        v117 = a2[1];
        v120 = *((_DWORD *)v57 + 13);
        v119 = (unsigned int *)(v57 + 52);
        v118 = v120;
        if (v117 >= v120)
          *v130 |= 0x10000uLL;
        v121 = v117 + v60;
        if (v118 > v121)
          v121 = v118;
        *v119 = v121;
        ++*(_DWORD *)&v23[64 * v24 + 48];
        *((_WORD *)a2 + 8) = v25;
LABEL_144:
        v17 = *(id *)v26;
        goto LABEL_145;
      }
    }
    else
    {
      v27 = a1 + 88 * v16;
      v30 = *(_QWORD *)(v27 + 56);
      v29 = (uint64_t *)(v27 + 56);
      v28 = v30;
      if (v30)
      {
        v129 = (uint64_t **)(v29 - 1);
        v31 = v29;
        do
        {
          v32 = *(_DWORD *)(v28 + 28);
          v33 = v32 >= v137;
          if (v32 >= v137)
            v34 = (uint64_t *)v28;
          else
            v34 = (uint64_t *)(v28 + 8);
          if (v33)
            v31 = (uint64_t *)v28;
          v28 = *v34;
        }
        while (*v34);
        if (v31 != v29)
        {
          while (1)
          {
            v35 = *((__int16 *)v31 + 16);
            v36 = *v19;
            if (v35 >= (v19[1] - *v19) >> 6)
              __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 253, "bufferIndex < heap.buffers.size()");
            v37 = &v36[64 * v35];
            v38 = v37 + 48;
            if (!*((_DWORD *)v37 + 12))
            {
              v123 = 255;
              v124 = "buffer.isAlive() && \"Buffer index corrupt: refers to dead item\"";
              goto LABEL_152;
            }
            v40 = *((_DWORD *)v37 + 14);
            v39 = (unsigned int *)(v37 + 56);
            if (MTLRangeAllocatorGetMaxFreeSize() != v40)
              break;
            if (*v39 < v137)
            {
              v123 = 257;
              v124 = "buffer.freeSize >= bytes && \"Bad primary buffer selected\"";
LABEL_152:
              __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", v123, v124);
            }
            v141 = 0;
            v22 = 0;
            if (MTLRangeAllocatorAllocate())
            {
              v76 = MTLRangeAllocatorGetMaxFreeSize();
              v77 = v76;
              if (*v39 != v76)
              {
                if (*v39 <= v76)
                  __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 271, "newFreeSize < buffer.freeSize && \"Buffer cannot have more space as a result of allocation\"");
                std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__remove_node_pointer(v129, v31);
                free(v31);
                *v39 = v77;
                v140 = v77 | ((unint64_t)(unsigned __int16)v35 << 32);
                std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>(v129, (unsigned int *)&v140);
              }
              v26 = &v36[64 * v35];
              v78 = v141;
              v79 = v78 - objc_msgSend(*(id *)v26, "gpuAddress", v129);
              v80 = v79;
              v81 = *((_DWORD *)v26 + 13);
              if (v79 >= (unint64_t)v81)
                *v130 |= 0x10000uLL;
              v82 = v79 + v137;
              if (v81 > v82)
                v82 = v81;
              *((_DWORD *)v26 + 13) = v82;
              ++*v38;
              *((_WORD *)v138 + 8) = v35;
              v138[1] = v80;
              goto LABEL_144;
            }
            if (a3 <= 0x100)
              __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 301, "align > kMinAlignment && \"Buffer index corrupt: expected index to be suitable\"");
            v41 = (uint64_t *)v31[1];
            if (v41)
            {
              do
              {
                v42 = v41;
                v41 = (uint64_t *)*v41;
              }
              while (v41);
            }
            else
            {
              do
              {
                v42 = (uint64_t *)v31[2];
                v14 = *v42 == (_QWORD)v31;
                v31 = v42;
              }
              while (!v14);
            }
            v31 = v42;
            if (v42 == v29)
              goto LABEL_52;
          }
          v123 = 256;
          v124 = "buffer.freeSize == MTLRangeAllocatorGetMaxFreeSize(&buffer.allocator, kMinAlignment) && \"Buffer index "
                 "corrupt: allocator state doesn't match\"";
          goto LABEL_152;
        }
      }
    }
LABEL_52:
    v43 = v132 + 88 * v135;
    v45 = *(_QWORD *)(v43 + 24);
    v44 = v43 + 24;
    v46 = *(_QWORD *)(v44 + 8);
    if (v45 == v46)
    {
      v52 = *v19;
      v51 = v19[1];
      v53 = v51 - *v19;
      if ((unint64_t)v53 > 0xFFC0)
      {
        v17 = 0;
LABEL_145:
        os_unfair_lock_unlock(lock);
        return v17;
      }
      if (v52 == v51)
      {
        std::vector<IOGPUMetalSuballocatorHeap::Buffer,IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocatorHeap::Buffer>>::reserve((void **)v19, 0x80uLL);
        std::vector<short,IOGPUMetalSuballocatorHeap::Allocator<short>>::reserve((void **)v44, 0x80uLL);
        v52 = *v19;
        v51 = v19[1];
        v53 = v51 - *v19;
      }
      v50 = v53 >> 6;
      v54 = (unint64_t)v19[2];
      if ((unint64_t)v51 >= v54)
      {
        v72 = v50 + 1;
        if ((unint64_t)(v50 + 1) >> 58)
          std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
        v73 = v54 - (_QWORD)v52;
        if (v73 >> 5 > v72)
          v72 = v73 >> 5;
        if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFC0)
          v74 = 0x3FFFFFFFFFFFFFFLL;
        else
          v74 = v72;
        if (v74)
          v75 = (char *)IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocatorHeap::Buffer>::allocate((uint64_t)(v19 + 2), v74);
        else
          v75 = 0;
        v83 = &v75[64 * v50];
        v84 = &v75[64 * v74];
        *((_OWORD *)v83 + 2) = 0u;
        *((_OWORD *)v83 + 3) = 0u;
        *(_OWORD *)v83 = 0u;
        *((_OWORD *)v83 + 1) = 0u;
        v55 = v83 + 64;
        v86 = *v19;
        v85 = v19[1];
        if (v85 != *v19)
        {
          do
          {
            v88 = *((_OWORD *)v85 - 2);
            v87 = *((_OWORD *)v85 - 1);
            *((_OWORD *)v83 - 3) = *((_OWORD *)v85 - 3);
            *((_OWORD *)v83 - 2) = v88;
            *((_OWORD *)v83 - 1) = v87;
            *((_OWORD *)v83 - 4) = *((_OWORD *)v85 - 4);
            v83 -= 64;
            v85 -= 64;
          }
          while (v85 != v86);
          v85 = *v19;
        }
        *v19 = v83;
        v19[1] = v55;
        v19[2] = v84;
        if (v85)
          free(v85);
      }
      else
      {
        *((_OWORD *)v51 + 2) = 0u;
        *((_OWORD *)v51 + 3) = 0u;
        *(_OWORD *)v51 = 0u;
        *((_OWORD *)v51 + 1) = 0u;
        v55 = v51 + 64;
      }
      v49 = (_WORD **)(v44 + 8);
      v19[1] = v55;
      *((_DWORD *)v55 - 4) = 0;
      v48 = *v19;
      v47 = (__int16)v50;
    }
    else
    {
      v47 = *(__int16 *)(v46 - 2);
      *(_QWORD *)(v44 + 8) = v46 - 2;
      if (v47 >= (v19[1] - *v19) >> 6)
        __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 330, "bufferIndex < heap.buffers.size()");
      v48 = *v19;
      v49 = (_WORD **)(v44 + 8);
      LOWORD(v50) = v47;
    }
    v89 = &v48[64 * v47];
    v90 = v89 + 48;
    if (*((_DWORD *)v89 + 12))
      __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 333, "!buffer.isAlive() && \"Alive buffer found in dead slots\"");
    if (v22)
    {
      v91 = (void *)objc_opt_new();
      objc_msgSend(v91, "setPinnedGPUAddress:", v22);
      objc_msgSend(v91, "setLength:", v133);
      objc_msgSend(v91, "setResourceOptions:", *v131);
      *(_QWORD *)v89 = objc_msgSend(*(id *)(v132 + 2816), "newBufferWithDescriptor:", v91);

      if (*(_QWORD *)v89)
      {
        v92 = v50;
        objc_msgSend(*(id *)v89, "gpuAddress");
        MTLRangeAllocatorInitWithStartRange();
        objc_msgSend(*(id *)v89, "gpuAddress");
        if ((MTLRangeAllocatorAllocateRange() & 1) != 0)
        {
          *((_WORD *)v138 + 8) = v50;
          *v90 = 1;
          v93 = *((_DWORD *)v138 + 2);
          v94 = v133 - ((v137 + 255) & 0xFFFFFF00) - v93;
          if (v93 > v94)
            v94 = *((_DWORD *)v138 + 2);
          v95 = &v48[64 * v47];
          *((_DWORD *)v95 + 14) = v94;
          v96 = MTLRangeAllocatorGetMaxFreeSize();
          if (v96 == *((_DWORD *)v95 + 14))
          {
            v141 = v96 | ((unint64_t)v92 << 32);
            std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>((uint64_t **)(v132 + 88 * v135 + 48), (unsigned int *)&v141);
            *v130 |= 0x10000uLL;
            *(_DWORD *)&v48[64 * v47 + 52] = *((_DWORD *)v138 + 2) + v137;
LABEL_118:
            v17 = *(id *)v89;
            goto LABEL_145;
          }
          v125 = "MTLRangeAllocatorGetMaxFreeSize(&buffer.allocator, kMinAlignment) == buffer.freeSize && \"Bad initial f"
                 "ree size computed\"";
          v126 = 363;
        }
        else
        {
          v125 = "false && \"Failed to suballocate from fresh block\"";
          v126 = 356;
        }
        __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", v126, v125);
      }
    }
    else
    {
      v97 = (void *)objc_opt_new();
      objc_msgSend(v97, "setLength:", 0x20000);
      objc_msgSend(v97, "setResourceOptions:", *v131);
      objc_msgSend(v97, "setAlignment:", v136);
      *(_QWORD *)v89 = objc_msgSend(*(id *)(v132 + 2816), "newBufferWithDescriptor:", v97);

      if (*(_QWORD *)v89)
      {
        objc_msgSend(*(id *)v89, "gpuAddress");
        MTLRangeAllocatorInitWithStartRange();
        objc_msgSend(*(id *)v89, "gpuAddress");
        if ((MTLRangeAllocatorAllocateRange() & 1) != 0)
        {
          v138[1] = 0;
          *((_WORD *)v138 + 8) = v50;
          *v90 = 1;
          v98 = MTLRangeAllocatorGetMaxFreeSize();
          *(_DWORD *)&v48[64 * v47 + 56] = v98;
          if (0x20000 - ((v137 + 255) & 0x1FFFFFF00) == v98)
          {
            v141 = v98 | ((unint64_t)(unsigned __int16)v50 << 32);
            std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>((uint64_t **)(v132 + 88 * v135 + 48), (unsigned int *)&v141);
            *v130 |= 0x10000uLL;
            *(_DWORD *)&v48[64 * v47 + 52] = v137;
            goto LABEL_118;
          }
          v127 = "kBufferSize - ((bytes + kMinAlignment - 1) & ~(kMinAlignment - 1)) == buffer.freeSize && \"Bad initial "
                 "free size computed\"";
          v128 = 405;
        }
        else
        {
          v127 = "false && \"Failed to suballocate from fresh block\"";
          v128 = 397;
        }
        __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", v128, v127);
      }
    }
    v99 = v49;
    v100 = *v49;
    v101 = v132 + 88 * v135;
    v104 = *(_QWORD *)(v101 + 40);
    v103 = (char **)(v101 + 40);
    v102 = v104;
    if ((unint64_t)*v49 >= v104)
    {
      v106 = *(_WORD **)v44;
      v107 = (uint64_t)v100 - *(_QWORD *)v44;
      if (v107 <= -3)
        std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
      v108 = v50;
      v109 = v107 >> 1;
      v110 = v102 - (_QWORD)v106;
      if (v110 <= (v107 >> 1) + 1)
        v111 = v109 + 1;
      else
        v111 = v110;
      if (v110 >= 0x7FFFFFFFFFFFFFFELL)
        v112 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v112 = v111;
      if (v112)
      {
        v113 = (char *)IOGPUMetalSuballocatorHeap::Allocator<short>::allocate((uint64_t)v103, v112);
        v100 = *v99;
        v106 = *(_WORD **)v44;
      }
      else
      {
        v113 = 0;
      }
      v114 = &v113[2 * v109];
      v115 = &v113[2 * v112];
      *(_WORD *)v114 = v108;
      v105 = v114 + 2;
      while (v100 != v106)
      {
        v116 = *--v100;
        *((_WORD *)v114 - 1) = v116;
        v114 -= 2;
      }
      *(_QWORD *)v44 = v114;
      *v99 = v105;
      *v103 = v115;
      if (v106)
        free(v106);
    }
    else
    {
      *v100 = v50;
      v105 = v100 + 1;
    }
    v17 = 0;
    *v99 = v105;
    goto LABEL_145;
  }
  return v17;
}

void sub_211656A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

_DWORD *std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>(uint64_t **a1, unsigned int *a2)
{
  uint64_t **v4;
  _DWORD *v5;
  unsigned int v6;
  uint64_t *v7;
  uint64_t **v8;

  v4 = a1 + 1;
  v5 = IOGPUMetalSuballocatorHeap::Allocator<std::__tree_node<std::__value_type<unsigned int,short>,void *>>::allocate((uint64_t)(a1 + 1), 1);
  v6 = *a2;
  v5[7] = *a2;
  *((_WORD *)v5 + 16) = *((_WORD *)a2 + 2);
  v7 = a1[1];
  if (v7)
  {
    do
    {
      while (1)
      {
        v4 = (uint64_t **)v7;
        if (v6 >= *((_DWORD *)v7 + 7))
          break;
        v7 = (uint64_t *)*v7;
        v8 = v4;
        if (!*v4)
          goto LABEL_8;
      }
      v7 = (uint64_t *)v7[1];
    }
    while (v7);
    v8 = v4 + 1;
  }
  else
  {
    v8 = v4;
  }
LABEL_8:
  std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__insert_node_at(a1, (uint64_t)v4, v8, (uint64_t *)v5);
  return v5;
}

void *IOGPUMetalSuballocatorHeap::Allocator<std::__tree_node<std::__value_type<unsigned int,short>,void *>>::allocate(uint64_t a1, uint64_t a2)
{
  void *memptr;

  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 8uLL, 40 * a2, 0x102004081A36325uLL))
    return 0;
  else
    return memptr;
}

uint64_t *std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

void std::vector<short,IOGPUMetalSuballocatorHeap::Allocator<short>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int16 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 1)
  {
    if ((a2 & 0x8000000000000000) != 0)
      std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
    v6 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v7 = (char *)IOGPUMetalSuballocatorHeap::Allocator<short>::allocate(v3, a2);
    v8 = &v7[v6 & 0xFFFFFFFFFFFFFFFELL];
    v9 = &v7[2 * a2];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v8;
    if (v11 != *a1)
    {
      v12 = v8;
      do
      {
        v13 = *((_WORD *)v11 - 1);
        v11 -= 2;
        *((_WORD *)v12 - 1) = v13;
        v12 -= 2;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v8;
    a1[2] = v9;
    if (v10)
      free(v10);
  }
}

void std::vector<IOGPUMetalSuballocatorHeap::Buffer,IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocatorHeap::Buffer>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 6)
  {
    if (a2 >> 58)
      std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
    v6 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v7 = (char *)IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocatorHeap::Buffer>::allocate(v3, a2);
    v8 = &v7[v6 & 0xFFFFFFFFFFFFFFC0];
    v9 = &v7[64 * a2];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v8;
    if (v10 != *a1)
    {
      do
      {
        v14 = *((_OWORD *)v10 - 2);
        v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 3) = *((_OWORD *)v10 - 3);
        *((_OWORD *)v12 - 2) = v14;
        *((_OWORD *)v12 - 1) = v13;
        *((_OWORD *)v12 - 4) = *((_OWORD *)v10 - 4);
        v12 -= 64;
        v10 -= 64;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v8;
    a1[2] = v9;
    if (v10)
      free(v10);
  }
}

void *IOGPUMetalSuballocatorHeap::Allocator<short>::allocate(uint64_t a1, uint64_t a2)
{
  void *memptr;

  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 8uLL, 2 * a2, 0x1000040BDFB0063uLL))
    return 0;
  else
    return memptr;
}

void *IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocatorHeap::Buffer>::allocate(uint64_t a1, uint64_t a2)
{
  void *memptr;

  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 0x40uLL, a2 << 6, 0x10A0040958DC350uLL))
    return 0;
  else
    return memptr;
}

uint64_t _ioGPUResourceListAddResourceEntry(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _WORD *v16;
  _DWORD *v17;
  int v18;
  int v19;

  v7 = (*(_QWORD *)(a2 + 8) & 0xFFFFFFFFFFFFFFLL) + 1023;
  if ((a4 & 1) == 0)
  {
    v8 = *(_QWORD *)(a1 + 520);
    if (v8 < (v7 & 0x1FFFFFFFFFFFC00))
    {
      *(_QWORD *)(a1 + 520) = 0;
      return 0xFFFFFFFFLL;
    }
    *(_QWORD *)(a1 + 520) = v8 - (v7 & 0x1FFFFFFFFFFFC00);
  }
  v10 = *(unsigned int *)(a1 + 500);
  if (*(_DWORD *)(a1 + 544) >= *(_DWORD *)(a1 + 536) && (_DWORD)v10 == 0)
  {
    (*(void (**)(_QWORD))(a1 + 568))(*(_QWORD *)(a1 + 576));
    if (*(_DWORD *)(a1 + 544) >= *(_DWORD *)(a1 + 536))
      __assert_rtn("_ioGPUResourceListAddResourceEntry", "IOGPUResourceList.m", 362, "l->numResourceGroups < l->capacity");
  }
  v12 = *(unsigned int *)(a1 + 504);
  v13 = v10 | (8 * v12);
  v14 = *(_DWORD *)(a2 + 16) & 0xFFFFFFLL | (a3 << 48) | ((*(_QWORD *)&v13 & 0xFFFFFFLL) << 24);
  if ((ioGPUResourceListAddHashValue(a1, v14) & 1) == 0)
  {
    do
      ioGPUResourceListRebuild(a1);
    while (!ioGPUResourceListAddHashValue(a1, v14));
  }
  if (!(_DWORD)v10)
    ++*(_DWORD *)(a1 + 544);
  v15 = *(_QWORD *)(a1 + 512) + (v12 << 6);
  v16 = (_WORD *)(v15 + 62);
  if ((unint64_t)(v15 + 62) >= *(_QWORD *)(*(_QWORD *)(a1 + 576) + 112))
    _ioGPUResourceListAddResourceEntryFault();
  v17 = (_DWORD *)(v15 + 4 * v10);
  *v17 = *(_DWORD *)(a2 + 16);
  v17[6] = v7 >> 10;
  *(_WORD *)(v15 + 2 * v10 + 48) = a3;
  v18 = v10 + 1;
  *v16 = v10 + 1;
  if ((_DWORD)v10 == 5)
  {
    v18 = 0;
    *(_DWORD *)(a1 + 504) = *(_DWORD *)(a1 + 544);
  }
  *(_DWORD *)(a1 + 500) = v18;
  v19 = *(_DWORD *)(a1 + 540) + 1;
  *(_DWORD *)(a1 + 540) = v19;
  *(_DWORD *)(a1 + 548) = v19;
  if (*(_QWORD *)a2)
    IOSurfaceBindAccel();
  return v13 & 0xFFFFFF;
}

uint64_t ioGPUResourceListAddHashValue(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = 0;
  v3 = *(_DWORD *)(a1 + 480) - 1;
  v4 = (0x9E3779B97F4A7C15 * (a2 & 0xFFFFFF)) >> -*(_BYTE *)(a1 + 488);
  v5 = *(_DWORD *)(a1 + 496);
  v6 = *(_QWORD *)(a1 + 464);
  v7 = v4 & 0x3F;
  v8 = *(_QWORD *)(v6 + 8 * (v4 >> 6)) | ~(-1 << v4);
  v9 = v4 >> 6 << 6;
  v10 = (v4 >> 6) + 1;
  while (v8 == -1)
  {
    v2 = v2 - v7 + 64;
    v8 = *(_QWORD *)(v6 + 8 * (v10 & v5));
    v9 += 64;
    ++v10;
    v7 = 0;
    if (v2 >= 0x80)
      return 0;
  }
  v11 = __clz(__rbit64(~v8)) + v9;
  if ((v11 - v4) > 0x7F)
    return 0;
  while ((v11 - v4) >= 0x20)
  {
    v14 = v11 - 31;
    if (v11 < 0x1F)
    {
LABEL_19:
      v20 = v11;
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 456);
      v14 = v11 - 30;
      if (v11 >= (int)v11 - 30)
        v14 = v11;
      v16 = -31;
      while (1)
      {
        v17 = ((_DWORD)v11 + v16) & v3;
        v18 = *(_DWORD *)(v15 + 4 * v17);
        v19 = __clz(__rbit32(v18));
        v20 = (_DWORD)v11 + v16 + v19;
        if (v18 && v20 < v11)
          break;
        if (!__CFADD__((_DWORD)v11, ++v16))
          goto LABEL_19;
      }
      v24 = *(_QWORD *)(a1 + 464);
      v23 = *(_QWORD *)(a1 + 472);
      v25 = *(_QWORD *)(v23 + 8 * (v20 & v3));
      *(_DWORD *)(v15 + 4 * v17) = v18 & ~(1 << v19) | (1 << -(char)v16);
      *(_QWORD *)(v24 + 8 * (v5 & (v11 >> 6))) |= 1 << v11;
      *(_QWORD *)(v23 + 8 * (v11 & v3)) = v25;
      v14 = v11 + v16;
    }
    v22 = v14 == (_DWORD)v11;
    v11 = v20;
    if (v22)
      return 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 472) + 8 * (v11 & v3)) = a2;
  v12 = 1;
  v26 = *(_QWORD *)(a1 + 464);
  *(_DWORD *)(*(_QWORD *)(a1 + 456) + 4 * v4) |= 1 << (v11 - v4);
  *(_QWORD *)(v26 + 8 * (v5 & (v11 >> 6))) |= 1 << v11;
  return v12;
}

void IOGPUNotificationQueueDispatchAvailableCompletionNotifications(uint64_t a1)
{
  const void *v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  uint32_t dataSize;

  v5 = 0;
  v3 = 0u;
  v4 = 0u;
  for (dataSize = 40; !IODataQueueDequeue(*(IODataQueueMemory **)(a1 + 32), &v3, &dataSize); dataSize = 40)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    v2 = (const void *)v3;
    (*(void (**)(_QWORD, unint64_t, unint64_t, _QWORD, uint64_t))(v3 + 16))(v3, *((_QWORD *)&v3 + 1) * (unint64_t)*(unsigned int *)algn_253CFB4B4 / _iogpuTimebaseInfo, (unint64_t)v4 * *(unsigned int *)algn_253CFB4B4 / _iogpuTimebaseInfo, DWORD2(v4), v5);
    _Block_release(v2);
    v5 = 0;
    v3 = 0u;
    v4 = 0u;
  }
  IOGPUDeviceCheckAndLogSoftFaultCount(*(_QWORD *)(a1 + 16));
}

void IOGPUDeviceCheckAndLogSoftFaultCount(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 104);
  if (v1 && *(_QWORD *)(v1 + 8) > *(_QWORD *)(a1 + 64))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    if (v3 > *(_QWORD *)(a1 + 64) && (*(_QWORD *)(a1 + 64) = v3, v4 = mach_absolute_time(), v4 >= *(_QWORD *)(a1 + 72)))
    {
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a1 + 80) + v4;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        IOGPUDeviceCheckAndLogSoftFaultCount_cold_1(v3);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
    }
  }
}

__n128 IOGPUMetalCommandBufferStorageAllocResourceAtIndex(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 **v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  __n128 *PooledResource;
  __n128 *v15;
  uint64_t v16;
  unint64_t v17;
  __n128 result;

  if (*(_DWORD *)(a1 + 792) <= a2)
    IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_3();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 784) + 8 * a2);
  if (!v4)
    IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_1();
  v5 = *(_QWORD *)(a1 + 768);
  v6 = v5 + ((unint64_t)a2 << 6);
  v9 = *(_QWORD *)(v6 + 32);
  v7 = (__n128 **)(v6 + 32);
  v8 = v9;
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 744);
    v11 = *(_QWORD *)(a1 + 752);
    if (v10 >= v11)
    {
      v13 = 2 * v11;
      if (!v11)
        v13 = 32;
      *(_QWORD *)(a1 + 752) = v13;
      v12 = malloc_type_realloc(*(void **)(a1 + 760), 8 * v13, 0x80040B8603338uLL);
      *(_QWORD *)(a1 + 760) = v12;
      v10 = *(_QWORD *)(a1 + 744);
    }
    else
    {
      v12 = *(_QWORD **)(a1 + 760);
    }
    *(_QWORD *)(a1 + 744) = v10 + 1;
    v12[v10] = v8;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 784) + 8 * a2);
  }
  PooledResource = (__n128 *)IOGPUMetalResourcePoolCreatePooledResource(v4);
  if (!PooledResource)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_2(a2);
    abort();
  }
  v15 = PooledResource;
  if (MTLValidationEnabled())
    -[__n128 setLabel:](v15, "setLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IOGPUMetalResourcePool (dbclass: %d)"), a2));
  v16 = v5 + ((unint64_t)a2 << 6);
  *v7 = v15;
  v17 = v15[10].n128_u64[0];
  *(_QWORD *)(v16 + 8) = v17;
  *(_QWORD *)(v16 + 24) = v17;
  *(_QWORD *)(v16 + 16) = (v15[4].n128_u64[1] & 0xFFFFFFFFFFFFFFLL) + v17;
  *(_QWORD *)v16 = v15[6].n128_u64[1];
  result = v15[4];
  *(_QWORD *)(v16 + 56) = v15[5].n128_u64[0];
  *(__n128 *)(v16 + 40) = result;
  return result;
}

_QWORD *IOGPUMetalResourcePoolCreatePooledResource(uint64_t a1)
{
  os_unfair_lock_s *v2;
  int v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  id v13;

  v2 = (os_unfair_lock_s *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  v3 = *(_DWORD *)(a1 + 88);
  v4 = *(_QWORD **)(a1 + 24);
  if (v4)
  {
    v6 = v4[37];
    v5 = (_QWORD *)v4[38];
    if (v6)
    {
      *(_QWORD *)(v6 + 304) = v5;
      v7 = v4[37];
      v5 = (_QWORD *)v4[38];
    }
    else
    {
      v7 = 0;
      *(_QWORD *)(a1 + 32) = v5;
    }
    *v5 = v7;
LABEL_13:
    v12 = v4 + 36;
    --*(_DWORD *)(a1 + 44);
    goto LABEL_14;
  }
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    v9 = v4[37];
    v8 = (_QWORD *)v4[38];
    if (v9)
    {
      *(_QWORD *)(v9 + 304) = v8;
      v10 = v4[37];
      v8 = (_QWORD *)v4[38];
    }
    else
    {
      v10 = 0;
      *(_QWORD *)(a1 + 16) = v8;
    }
    *v8 = v10;
    objc_msgSend(v4, "setPurgeableState:", 2);
    goto LABEL_13;
  }
  v11 = (_QWORD *)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithDevice:options:args:argsSize:", *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 72));
  v4 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setLabel:", CFSTR("IOGPUMetalResourcePool"));
    v12 = v4 + 36;
LABEL_14:
    *v12 = a1;
    *((_DWORD *)v12 + 8) = v3;
    v13 = (id)a1;
  }
  os_unfair_lock_unlock(v2);
  return v4;
}

void IOGPUMetalPooledResourceRelease(_QWORD *a1)
{
  _QWORD *v2;
  char *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  char *v9;

  v2 = a1 + 36;
  v3 = (char *)a1[36];
  if (v3)
  {
    v9 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      IOGPUMetalPooledResourceRelease_cold_1();
    *v2 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)v9 + 10);
    if (*((_DWORD *)v2 + 8) == *((_DWORD *)v9 + 22))
    {
      v5 = *((_QWORD *)v9 + 3);
      v4 = v9 + 24;
      a1[37] = v5;
      v6 = (_QWORD *)(v5 + 304);
      if (v5)
        v7 = v6;
      else
        v7 = v9 + 32;
      *v7 = a1 + 37;
      *v4 = a1;
      a1[38] = v4;
      ++*((_DWORD *)v9 + 11);
      v2[3] = mach_absolute_time();
    }
    else
    {

    }
    os_unfair_lock_unlock((os_unfair_lock_t)v9 + 10);
    v8 = v9;
  }
  else
  {
    v8 = a1;
  }

}

uint64_t IOGPUResourceSetPurgeable(uint64_t a1, uintptr_t p2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  v5 = 0;
  result = IOConnectTrap3(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 3u, *(unsigned int *)(a1 + 48), p2, (uintptr_t)&v5);
  if (a3)
    *a3 = v5;
  return result;
}

_QWORD *IOGPUMetalCommandBufferStorageCreateExt(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t ResourceList;
  uint64_t v12;

  v8 = malloc_type_calloc(0x398uLL, 1uLL, 0xBED2C1E0uLL);
  *v8 = a1;
  v8[100] = a3;
  IOGPUResourceListInit((uint64_t)(v8 + 18), 0, 0, *(_QWORD *)(a1 + 728), *(_DWORD *)(a1 + 720), (uint64_t)IOGPUMetalCommandBufferStorageGrowSegmentList, (uint64_t)v8);
  v9 = *(unsigned int *)(a2 + 32);
  if ((_DWORD)v9)
  {
    v8[98] = *(_QWORD *)(a2 + 24);
    v10 = malloc_type_calloc(1uLL, v9 << 6, 0x10B0040CDE4EDB6uLL);
    LODWORD(v9) = *(_DWORD *)(a2 + 32);
  }
  else
  {
    v10 = 0;
  }
  v8[96] = v10;
  *((_DWORD *)v8 + 198) = v9;
  ResourceList = *(_QWORD *)(a2 + 48);
  if (ResourceList)
    ResourceList = MTLResourceListPoolCreateResourceList();
  v8[92] = ResourceList;
  if (a4)
    v12 = MTLResourceListPoolCreateResourceList();
  else
    v12 = 0;
  v8[91] = v12;
  if ((_iogpuMetalCommandBufferStorageSetupShmems((uint64_t)v8, (uint64_t *)a2) & 1) == 0)
  {
    _iogpuMetalCommandBufferStorageFree((uint64_t)v8);
    return 0;
  }
  return v8;
}

uint64_t iogpumetal_atomic_add(unsigned int *a1, int a2)
{
  unsigned int v2;
  uint64_t v3;

  do
  {
    v2 = __ldxr(a1);
    v3 = v2 + a2;
  }
  while (__stxr(v3, a1));
  return v3;
}

_QWORD *IOGPUMetalCommandBufferStoragePoolCreateStorage(uint64_t a1, uint64_t a2, int a3)
{
  os_unfair_lock_s *v6;
  _QWORD *Ext;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t ResourceList;

  v6 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  Ext = *(_QWORD **)a1;
  if (!*(_QWORD *)a1)
  {
    os_unfair_lock_unlock(v6);
    Ext = IOGPUMetalCommandBufferStorageCreateExt(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32) + 616, a2, a3);
    if (!Ext)
      return Ext;
    goto LABEL_14;
  }
  v8 = Ext[2];
  v9 = (_QWORD *)Ext[3];
  if (v8)
  {
    *(_QWORD *)(v8 + 24) = v9;
    v9 = (_QWORD *)Ext[3];
  }
  else
  {
    *(_QWORD *)(a1 + 8) = v9;
  }
  *v9 = v8;
  --*(_DWORD *)(a1 + 20);
  Ext[2] = 0;
  Ext[3] = 0;
  os_unfair_lock_unlock(v6);
  Ext[100] = a2;
  v10 = Ext[91];
  if (a3)
  {
    if (v10)
      goto LABEL_13;
    ResourceList = MTLResourceListPoolCreateResourceList();
  }
  else
  {
    if (!v10)
      goto LABEL_13;
    MTLResourceListRelease();
    ResourceList = 0;
  }
  Ext[91] = ResourceList;
LABEL_13:
  if ((_iogpuMetalCommandBufferStorageSetupShmems((uint64_t)Ext, (uint64_t *)(*(_QWORD *)(a1 + 32) + 616)) & 1) == 0)
  {
    _iogpuMetalCommandBufferStorageFree((uint64_t)Ext);
    return 0;
  }
LABEL_14:
  Ext[1] = a1;
  return Ext;
}

uint64_t _iogpuMetalCommandBufferStorageSetupShmems(uint64_t a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *Shmem;
  uint64_t v9;
  uint64_t v10;
  unint64_t StatusReg;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  result = (uint64_t)IOGPUMetalDeviceShmemPoolCreateShmem(*a2);
  if (result)
  {
    v5 = *(_QWORD *)(result + 136);
    *(_QWORD *)(a1 + 104) = v5;
    v6 = *(_QWORD *)(result + 136);
    v7 = *(unsigned int *)(result + 132);
    *(_QWORD *)(a1 + 96) = result;
    *(_QWORD *)(a1 + 808) = v5;
    *(_DWORD *)(a1 + 832) = -1;
    *(_DWORD *)(a1 + 840) = 0;
    *(_QWORD *)(a1 + 816) = 0;
    *(_QWORD *)(a1 + 128) = 0;
    *(_QWORD *)(a1 + 136) = 0;
    *(_QWORD *)(a1 + 112) = v6 + v7;
    *(_QWORD *)(a1 + 120) = 0;
    Shmem = IOGPUMetalDeviceShmemPoolCreateShmem(a2[1]);
    if (Shmem)
    {
      v9 = Shmem[17];
      *(_QWORD *)(a1 + 32) = Shmem;
      *(_QWORD *)(a1 + 40) = v9;
      *(_QWORD *)(a1 + 56) = Shmem[17] + *((unsigned int *)Shmem + 33);
      v10 = Shmem[17];
      *(_QWORD *)(a1 + 48) = v10;
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *(_OWORD *)(a1 + 64) = 0u;
      *(_OWORD *)(a1 + 80) = 0u;
      if (*(_QWORD *)(StatusReg + 288) == 11181)
      {
        *(_QWORD *)(a1 + 888) = 0;
      }
      else
      {
        *(_QWORD *)v10 = 0xAC0000000FLL;
        *(_OWORD *)(v10 + 24) = 0uLL;
        *(_OWORD *)(v10 + 40) = 0uLL;
        *(_OWORD *)(v10 + 56) = 0uLL;
        *(_OWORD *)(v10 + 72) = 0uLL;
        *(_OWORD *)(v10 + 88) = 0uLL;
        *(_OWORD *)(v10 + 104) = 0uLL;
        *(_OWORD *)(v10 + 120) = 0uLL;
        *(_OWORD *)(v10 + 136) = 0uLL;
        *(_OWORD *)(v10 + 152) = 0uLL;
        *(_DWORD *)(v10 + 168) = 0;
        *(_OWORD *)(v10 + 8) = 0uLL;
        *(_QWORD *)(a1 + 888) = v10 + 8;
        v12 = v10 + 172;
        *(_QWORD *)(a1 + 48) = v10 + 172;
        IOGPUMetalCommandBufferStorageBeginKernelCommands(a1, v10);
        v13 = *(_QWORD *)(a1 + 816);
        v14 = v12 - *(_DWORD *)(a1 + 40);
        v15 = *(unsigned int *)(a1 + 824);
        *(_DWORD *)(a1 + 828) = v15 + 1;
        *(_DWORD *)(v13 + 8 * v15 + 20) = v14;
      }
      return 1;
    }
    else
    {
      IOGPUMetalDeviceShmemRelease(*(os_unfair_lock_s **)(a1 + 96));
      result = 0;
      *(_QWORD *)(a1 + 96) = 0;
    }
  }
  return result;
}

_QWORD *IOGPUMetalDeviceShmemPoolCreateShmem(uint64_t a1)
{
  os_unfair_lock_s *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v2 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v3 = *(_QWORD **)(a1 + 8);
  if (v3)
  {
    v4 = v3 + 1;
    v5 = v3[2];
    v6 = (_QWORD *)v3[3];
    if (v5)
    {
      *(_QWORD *)(v5 + 24) = v6;
      v7 = v3[2];
      v6 = (_QWORD *)v3[3];
    }
    else
    {
      v7 = 0;
      *(_QWORD *)(a1 + 16) = v6;
    }
    *v6 = v7;
    --*(_DWORD *)(a1 + 28);
    v3[2] = 0;
    v3[3] = 0;
    os_unfair_lock_unlock(v2);
    goto LABEL_8;
  }
  os_unfair_lock_unlock(v2);
  v8 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithDevice:shmemSize:shmemType:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v3 = (_QWORD *)v8;
  if (v8)
  {
    v4 = (_QWORD *)(v8 + 8);
LABEL_8:
    *v4 = a1;
    v9 = (id)a1;
  }
  return v3;
}

void IOGPUMetalCommandBufferStorageFinalizeShmemHeader(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  _QWORD v14[5];
  _QWORD v15[4];

  v2 = *(_QWORD *)(a1 + 808);
  if (*(_QWORD *)(a1 + 888))
  {
    v3 = 0;
    v4 = 1;
    v5 = MEMORY[0x24BDAC760];
    do
    {
      v6 = v4;
      v7 = a1 + 8 * v3;
      v8 = *(void **)(v7 + 896);
      if (v8 && objc_msgSend(v8, "count"))
      {
        v15[0] = 0;
        v15[1] = v15;
        v15[2] = 0x2020000000;
        v15[3] = *(_QWORD *)(a1 + 888);
        v9 = *(void **)(v7 + 896);
        v14[0] = v5;
        v14[1] = 3221225472;
        v14[2] = __IOGPUMetalCommandBufferStorageFinalizeShmemHeader_block_invoke;
        v14[3] = &unk_24CC3F770;
        v14[4] = v15;
        objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);
        _Block_object_dispose(v15, 8);
      }
      v4 = 0;
      v3 = 1;
    }
    while ((v6 & 1) != 0);
  }
  v10 = *(_DWORD *)(a1 + 832);
  if (v10 == 1)
  {
    v12 = *(_QWORD *)(a1 + 816);
    v13 = *(_DWORD *)(a1 + 824) + 1;
    *(_DWORD *)(v12 + 8) = v13;
    *(_QWORD *)(a1 + 808) = v12 + 8 * v13 + 16;
    *(_DWORD *)(a1 + 832) = -1;
    *(_QWORD *)(a1 + 816) = 0;
    goto LABEL_13;
  }
  if (!v10)
    goto LABEL_11;
  if (*(_QWORD *)(a1 + 808) == *(_QWORD *)(a1 + 104))
  {
    _mtlIOGPUCommandBufferStorageBeginSegmentList(a1);
LABEL_11:
    v11 = *(_QWORD *)(a1 + 128);
    *(_DWORD *)(*(_QWORD *)(a1 + 120) + 12) = v11 - *(_QWORD *)(a1 + 120);
    *(_QWORD *)(a1 + 808) = v11;
    *(_DWORD *)(a1 + 832) = -1;
    *(_QWORD *)(a1 + 120) = 0;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 848) = 0u;
  }
LABEL_13:
  *(_DWORD *)(v2 + 12) |= 0x80000000;
}

void sub_211658C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IOGPUCommandQueueSubmitCommandBuffers(uint64_t a1, unsigned int a2, unsigned int a3, const void *a4, uintptr_t a5)
{
  uint64_t v5;
  dispatch_semaphore_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v5 = 3758097090;
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUCommandQueueID)
  {
    v11 = *(dispatch_semaphore_t **)(a1 + 40);
    if (v11)
    {
      if (a4)
      {
        IOGPUNotificationQueueWillSubmit(v11, 2 * a3);
        if (a3 == 1 && a5 <= 0x40)
        {
          v12 = IOConnectTrap3(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0, *(_QWORD *)(a1 + 24), a5, (uintptr_t)a4);
        }
        else
        {
          v13 = *(_QWORD *)(a1 + 16);
          input[0] = *(_QWORD *)(a1 + 24);
          input[1] = a2;
          input[2] = a3;
          input[3] = a5;
          v12 = IOConnectCallMethod(*(_DWORD *)(v13 + 20), 0x1Au, input, 4u, a4, a3 * a5, 0, 0, 0, 0);
        }
        v5 = v12;
        if ((_DWORD)v12)
          IOGPUNotificationQueueDidSubmit(*(dispatch_semaphore_t **)(a1 + 40), 2 * a3);
      }
    }
    else
    {
      return 3758096385;
    }
  }
  return v5;
}

dispatch_semaphore_t *IOGPUNotificationQueueWillSubmit(dispatch_semaphore_t *result, int a2)
{
  dispatch_semaphore_t *v3;

  if (result)
  {
    v3 = result;
    result = (dispatch_semaphore_t *)CFGetTypeID(result);
    if (result == (dispatch_semaphore_t *)kIOGPUNotificationQueueID && a2 != 0)
    {
      do
      {
        result = (dispatch_semaphore_t *)dispatch_semaphore_wait(v3[8], 0xFFFFFFFFFFFFFFFFLL);
        --a2;
      }
      while (a2);
    }
  }
  return result;
}

uint64_t IOGPUDeviceGetAllocatedSize(uint64_t a1, uint64_t *output)
{
  uint64_t *v2;
  uint64_t result;
  uint32_t outputCnt;

  v2 = *(uint64_t **)(a1 + 104);
  if (v2)
  {
    result = 0;
    *output = *v2;
  }
  else
  {
    outputCnt = 1;
    *output = 0;
    return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x18u, 0, 0, output, &outputCnt);
  }
  return result;
}

uint64_t IOGPUDeviceTraceObjectLabel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;

  v6 = kdebug_trace_string();
  if (v6 != -1)
  {
    v7 = v6;
    kdebug_trace();
    return v7;
  }
  return a5;
}

uint64_t IOGPUDeviceTraceEvent()
{
  return kdebug_trace();
}

uint64_t IOGPUMetalCommandBufferStorageBeginSegment(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _DWORD *v7;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(a1 + 120))
    _mtlIOGPUCommandBufferStorageBeginSegmentList(a1);
  v5 = *(_QWORD *)(a1 + 136);
  v6 = *(_QWORD *)(a1 + 112);
  if (v5 + 2048 >= v6)
  {
    IOGPUMetalCommandBufferStorageGrowSegmentList(a1);
    v6 = *(_QWORD *)(a1 + 112);
    v5 = *(_QWORD *)(a1 + 136);
  }
  v7 = *(_DWORD **)(a1 + 128);
  v7[6] = 0;
  v7[3] = 0;
  v7[4] = 0;
  v7[2] = a2 - v4;
  *(_OWORD *)(a1 + 848) = 0u;
  IOGPUResourceListReset(a1 + 144, (uint64_t)(v7 + 8), v6 - v5, 1);
  result = objc_msgSend(*(id *)(a1 + 776), "globalTraceObjectID");
  **(_QWORD **)(a1 + 128) = result;
  return result;
}

unint64_t IOGPUDeviceGetNextGlobalTraceID(uint64_t a1)
{
  unint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  unint64_t v9;
  size_t outputStructCnt;
  uint64_t outputStruct;
  uint64_t v12;

  v2 = (unint64_t *)(a1 + 152);
LABEL_2:
  v3 = *(_QWORD *)(a1 + 144);
  v4 = *(_QWORD *)(a1 + 152);
  do
  {
    v5 = __ldaxr(v2);
    if (v5 != v3)
    {
      __clrex();
      *(_QWORD *)(a1 + 144) = v5;
      while (!*v2)
        ;
      goto LABEL_14;
    }
  }
  while (__stlxr(0, v2));
  outputStructCnt = 16;
  outputStruct = 0;
  v12 = 0;
  if (IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 5u, 0, 0, &outputStruct, &outputStructCnt))
  {
    *(_QWORD *)(a1 + 136) = 1;
    v6 = 0x100000000;
    v7 = 1;
  }
  else
  {
    v7 = outputStruct;
    if (!outputStruct)
      IOGPUDeviceGetNextGlobalTraceID_cold_1();
    *(_QWORD *)(a1 + 136) = outputStruct;
    v6 = v12;
  }
  *(_QWORD *)(a1 + 144) = v6;
  *(_QWORD *)(a1 + 152) = v7;
LABEL_14:
  result = v4 + 1;
  do
  {
    v9 = __ldaxr(v2);
    if (v9 != v4)
    {
      __clrex();
      goto LABEL_2;
    }
  }
  while (__stlxr(result, v2));
  return result;
}

void IOGPUResourceListReset(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a3 <= 0)
    IOGPUResourceListReset_cold_1();
  *(_QWORD *)(a1 + 512) = a2;
  *(_DWORD *)(a1 + 536) = (unint64_t)a3 >> 6;
  if (a2 + (a3 & 0x3FFFFFFFC0uLL) > *(_QWORD *)(*(_QWORD *)(a1 + 576) + 112))
    IOGPUResourceListReset_cold_2();
  if (a4)
  {
    *(_QWORD *)(a1 + 520) = *(_QWORD *)(a1 + 528);
    *(_QWORD *)(a1 + 540) = 0;
    *(_DWORD *)(a1 + 504) = 0;
    *(_DWORD *)(a1 + 480) = 2048;
    *(_DWORD *)(a1 + 488) = 11;
    *(_QWORD *)(a1 + 496) = 31;
    bzero(*(void **)(a1 + 456), 0x2000uLL);
    bzero(*(void **)(a1 + 464), (unint64_t)*(unsigned int *)(a1 + 480) >> 3);
  }
}

uint64_t IOGPUResourceGetGPUVirtualAddress(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

_QWORD *IOGPUResourceGetClientShared(_QWORD *result)
{
  _QWORD *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (IOGPUResourceGetTypeID_onceToken != -1)
      dispatch_once(&IOGPUResourceGetTypeID_onceToken, &__block_literal_global_6);
    if (v2 == kIOGPUResourceID)
      return (_QWORD *)v1[9];
    else
      return 0;
  }
  return result;
}

uint64_t IOGPUResourceGetResidentDataSize(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t IOGPUResourceGetGlobalTraceObjectID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

uint64_t IOGPUResourceCreateAllocationIdentifierSet(uint64_t result, _QWORD *a2, _QWORD *a3)
{
  *a2 = *(_QWORD *)(result + 88);
  *a3 = *(_QWORD *)(result + 96);
  return result;
}

uint64_t IOGPUResourceCreate(mach_port_t *a1, _QWORD *a2, size_t a3)
{
  size_t v6;
  char *v7;
  uint64_t Instance;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a1[13];
  v14[0] = v6 + 80;
  MEMORY[0x24BDAC7A8](a1, a2);
  v7 = (char *)v14 - ((v6 + 95) & 0x1FFFFFFF0);
  if (IOGPUResourceGetTypeID_onceToken != -1)
    dispatch_once(&IOGPUResourceGetTypeID_onceToken, &__block_literal_global_6);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    bzero((char *)v14 - ((v6 + 95) & 0x1FFFFFFF0), v6 + 80);
    CFRetain(a1);
    *(_QWORD *)(Instance + 16) = a1;
    *(_QWORD *)(Instance + 72) = 0;
    *(_DWORD *)(Instance + 48) = 0;
    if (IOConnectCallMethod(a1[5], 9u, 0, 0, a2, a3, 0, 0, (char *)v14 - ((v6 + 95) & 0x1FFFFFFF0), v14))
    {
      CFRelease((CFTypeRef)Instance);
      return 0;
    }
    else
    {
      v10 = (void *)*((_QWORD *)v7 + 1);
      *(_QWORD *)(Instance + 24) = v10;
      *(_QWORD *)(Instance + 40) = *((_QWORD *)v7 + 4);
      *(_DWORD *)(Instance + 48) = *((_DWORD *)v7 + 7);
      v11 = *(_DWORD *)a2;
      *(_DWORD *)(Instance + 52) = *(_DWORD *)a2;
      if ((v11 & 0xF) != 0)
        v12 = 0;
      else
        v12 = a2[9];
      *(_QWORD *)(Instance + 32) = v12;
      *(_QWORD *)(Instance + 56) = *(_QWORD *)v7;
      v13 = *((_QWORD *)v7 + 2);
      *(_QWORD *)(Instance + 64) = *((_QWORD *)v7 + 9);
      *(_QWORD *)(Instance + 72) = v13;
      memcpy((void *)(Instance + 112), v7 + 80, v6);
      *(_OWORD *)(Instance + 88) = *((_OWORD *)v7 + 3);
      *(_QWORD *)(Instance + 104) = *((_QWORD *)v7 + 8);
      if ((*((_BYTE *)a2 + 20) & 0x40) != 0 && !v11 && (*((_DWORD *)v7 + 6) & 1) != 0 && v10)
        bzero(v10, a2[9]);
      *(_QWORD *)(Instance + 80) = *((_QWORD *)v7 + 5);
      if (*MEMORY[0x24BDAC928] && *(_QWORD *)(Instance + 24) && !a2[8])
        ((void (*)(uint64_t, _QWORD, _QWORD, _QWORD))*MEMORY[0x24BDAC928])(1677721616, *MEMORY[0x24BDAEC58], *(_QWORD *)(Instance + 40), 0);
    }
  }
  return Instance;
}

void IOGPUResourceRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

_QWORD *IOGPUResourceGetDataBytes(_QWORD *result)
{
  _QWORD *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (IOGPUResourceGetTypeID_onceToken != -1)
      dispatch_once(&IOGPUResourceGetTypeID_onceToken, &__block_literal_global_6);
    if (v2 == kIOGPUResourceID)
      return (_QWORD *)v1[3];
    else
      return 0;
  }
  return result;
}

uint64_t _mtlIOGPUCommandBufferStorageBeginSegmentList(uint64_t result)
{
  int v1;
  _QWORD *v2;
  uint64_t v3;
  unsigned int v4;

  v1 = *(_DWORD *)(result + 832);
  if (v1 != -1)
  {
    if (v1 == 1)
    {
      v3 = *(_QWORD *)(result + 816);
      v4 = *(_DWORD *)(result + 824) + 1;
      *(_DWORD *)(v3 + 8) = v4;
      v2 = (_QWORD *)(v3 + 8 * v4 + 16);
      *(_QWORD *)(result + 808) = v2;
      *(_QWORD *)(result + 816) = 0;
      goto LABEL_6;
    }
    result = MTLReleaseAssertionFailure();
  }
  v2 = *(_QWORD **)(result + 808);
LABEL_6:
  *(_DWORD *)(result + 832) = 0;
  *(_QWORD *)(result + 120) = v2;
  *v2 = *(_QWORD *)(result + 800);
  v2[1] = 0;
  *(_QWORD *)(result + 128) = v2 + 2;
  *(_QWORD *)(result + 136) = v2 + 6;
  return result;
}

double IOGPUResourceListInit(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  double result;

  *(_DWORD *)(a1 + 480) = 2048;
  *(_QWORD *)(a1 + 488) = 0x8000000000BLL;
  *(_QWORD *)(a1 + 456) = malloc_type_calloc(0x800uLL, 4uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 472) = malloc_type_malloc(8 * *(unsigned int *)(a1 + 492), 0x100004000313F17uLL);
  *(_QWORD *)(a1 + 464) = malloc_type_calloc((unint64_t)*(unsigned int *)(a1 + 492) >> 3, 1uLL, 0x527F2B0CuLL);
  *(_DWORD *)(a1 + 496) = (*(_DWORD *)(a1 + 480) >> 6) - 1;
  *(_DWORD *)(a1 + 536) = a3 >> 6;
  *(_QWORD *)(a1 + 528) = a4;
  *(_QWORD *)(a1 + 512) = a2;
  *(_QWORD *)(a1 + 520) = a4;
  *(_DWORD *)(a1 + 540) = 0;
  result = 0.0;
  *(_QWORD *)(a1 + 544) = 0;
  *(_DWORD *)(a1 + 504) = 0;
  *(_DWORD *)(a1 + 560) = a5;
  *(_QWORD *)(a1 + 568) = a6;
  *(_QWORD *)(a1 + 576) = a7;
  return result;
}

void _iogpuMetalCommandBufferStorageFree(uint64_t a1)
{
  void *v2;
  void *v3;

  IOGPUResourceListDestroy(a1 + 144);
  if (*(_QWORD *)(a1 + 32))
    _iogpuMetalCommandBufferStorageFree_cold_2();
  if (*(_QWORD *)(a1 + 96))
    _iogpuMetalCommandBufferStorageFree_cold_1();
  if (*(_QWORD *)(a1 + 768))
  {
    _iogpuMetalCommandBufferStorageReleaseCurrentResources(a1);
    free(*(void **)(a1 + 768));
    *(_QWORD *)(a1 + 768) = 0;
  }
  _iogpuMetalCommandBufferStorageReleaseExtraResources(a1);
  v2 = *(void **)(a1 + 728);
  if (v2)
  {
    objc_msgSend(v2, "releaseAllObjectsAndReset");
    MTLResourceListRelease();
    *(_QWORD *)(a1 + 728) = 0;
  }
  v3 = *(void **)(a1 + 736);
  if (v3)
  {
    objc_msgSend(v3, "releaseAllObjectsAndReset");
    MTLResourceListRelease();
    *(_QWORD *)(a1 + 736) = 0;
  }

  *(_QWORD *)(a1 + 896) = 0;
  *(_QWORD *)(a1 + 904) = 0;
  free((void *)a1);
}

void IOGPUMetalCommandBufferStorageDealloc(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;

  v2 = a1[4];
  if (v2)
    IOGPUMetalDeviceShmemUpdateTrimLevel(v2, a1[6]);
  v3 = a1[12];
  if (v3)
    IOGPUMetalDeviceShmemUpdateTrimLevel(v3, a1[101]);
  v4 = a1[8];
  if (v4)
    IOGPUMetalDeviceShmemUpdateTrimLevel(v4, a1[10]);
  IOGPUMetalCommandBufferStorageReset(a1);
  v5 = (uint64_t *)a1[1];
  if (!v5 || !IOGPUMetalCommandBufferStoragePoolReturnStorage(v5, a1))
    _iogpuMetalCommandBufferStorageFree((uint64_t)a1);
}

uint64_t IOGPUMetalDeviceShmemUpdateTrimLevel(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int v9;
  BOOL v10;
  int v11;
  int v12;
  int v13;
  int64x2_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(result + 136);
  v3 = a2 - v2;
  if (a2 - v2 >= 0)
  {
    v4 = result;
    if (v3 < *(unsigned int *)(result + 132))
    {
      v5 = 0;
      v6 = *MEMORY[0x24BDB03B8];
      v7 = ~*MEMORY[0x24BDB03B8];
      v8 = (v3 + *MEMORY[0x24BDB03B8]) & v7;
      v9 = *(_DWORD *)(result + 112);
      *(_DWORD *)(result + 112) = v9 + 1;
      v10 = -v9 < 0;
      v11 = -v9 & 7;
      v12 = v9 & 7;
      if (v10)
        v13 = v12;
      else
        v13 = -v11;
      *(_QWORD *)(result + 48 + 8 * v13) = v8;
      v14 = 0uLL;
      do
      {
        v14 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(*(int64x2_t *)(result + 48 + v5), v14), *(int8x16_t *)(result + 48 + v5), (int8x16_t)v14);
        v5 += 16;
      }
      while (v5 != 64);
      v15 = vextq_s8((int8x16_t)v14, (int8x16_t)v14, 8uLL).u64[0];
      v16 = (16 * *(_QWORD *)&vbsl_s8((int8x8_t)vcgtd_s64(v14.i64[0], v15), *(int8x8_t *)v14.i8, (int8x8_t)v15) / 10
           + v6) & v7;
      v17 = *(_QWORD *)(result + 40);
      v18 = v17 - v16 + 3;
      if (v17 >= v16)
        v18 = v17 - v16;
      v19 = v7 & (v18 >> 2);
      if (v19 <= 0x10000)
      {
        if (v8 <= v17)
          return result;
      }
      else
      {
        v20 = v17 - v16 - v19;
        result = madvise((void *)(v2 + v17 - v19), v19, 5);
        v8 = v20 + v16;
      }
      *(_QWORD *)(v4 + 40) = v8;
    }
  }
  return result;
}

void IOGPUMetalCommandBufferStorageReset(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  char v6;
  void *v7;

  _iogpuMetalCommandBufferStorageReleaseExtraResources((uint64_t)a1);
  v2 = (void *)a1[91];
  if (v2)
    objc_msgSend(v2, "releaseAllObjectsAndReset");
  v3 = (void *)a1[92];
  if (v3)
    objc_msgSend(v3, "releaseAllObjectsAndReset");
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = (void *)a1[v4 + 112];
    if (v7)
      objc_msgSend(v7, "removeAllObjects");
    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  a1[111] = 0;
  IOGPUMetalCommandBufferStorageReleaseDeviceShmems((uint64_t)a1);
  if (a1[96])
    _iogpuMetalCommandBufferStorageReleaseCurrentResources((uint64_t)a1);
  a1[97] = 0;
}

void _iogpuMetalCommandBufferStorageReleaseExtraResources(uint64_t a1)
{
  unint64_t v1;
  unint64_t v3;
  unint64_t *v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(a1 + 744);
  if (v1)
  {
    v3 = 0;
    v4 = (unint64_t *)(a1 + 744);
    do
    {
      v5 = *(_QWORD **)(*(_QWORD *)(a1 + 760) + 8 * v3);
      if (v5)
      {
        IOGPUMetalPooledResourceRelease(v5);
        v1 = *v4;
      }
      ++v3;
    }
    while (v3 < v1);
    free(*(void **)(a1 + 760));
    *v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
}

void _iogpuMetalCommandBufferStorageReleaseCurrentResources(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(unsigned int *)(a1 + 792);
  if ((_DWORD)v1)
  {
    v3 = 0;
    v4 = v1 << 6;
    do
    {
      v5 = *(_QWORD *)(a1 + 768) + v3;
      v6 = *(_QWORD **)(v5 + 32);
      if (v6)
      {
        IOGPUMetalPooledResourceRelease(v6);
        *(_DWORD *)(v5 + 56) = 0;
        *(_QWORD *)(v5 + 24) = 0;
        *(_QWORD *)(v5 + 32) = 0;
      }
      v3 += 64;
    }
    while (v4 != v3);
  }
}

void IOGPUMetalCommandBufferStorageReleaseDeviceShmems(uint64_t a1)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  _QWORD *v6;

  v2 = *(os_unfair_lock_s **)(a1 + 32);
  if (v2)
  {
    IOGPUMetalDeviceShmemRelease(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v3 = *(os_unfair_lock_s **)(a1 + 96);
  if (v3)
  {
    IOGPUMetalDeviceShmemRelease(v3);
    *(_QWORD *)(a1 + 96) = 0;
  }
  v4 = *(os_unfair_lock_s **)(a1 + 64);
  if (v4)
  {
    IOGPUMetalDeviceShmemRelease(v4);
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
  }
  v5 = *(os_unfair_lock_s **)(a1 + 864);
  if (v5)
  {
    v6 = (_QWORD *)(a1 + 864);
    IOGPUMetalDeviceShmemRelease(v5);
    *v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
  }
}

void IOGPUMetalDeviceShmemRelease(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;

  v1 = *(os_unfair_lock_s **)&a1[2]._os_unfair_lock_opaque;
  if (v1)
  {
    v2 = v1 + 2;
    *(_QWORD *)&a1[2]._os_unfair_lock_opaque = 0;
    v5 = a1;
    os_unfair_lock_lock(v1 + 6);
    if (v5[33]._os_unfair_lock_opaque >= v1[12]._os_unfair_lock_opaque)
    {
      v3 = *(os_unfair_lock_s **)&v2->_os_unfair_lock_opaque;
      *(_QWORD *)&v5[4]._os_unfair_lock_opaque = *(_QWORD *)&v2->_os_unfair_lock_opaque;
      if (v3)
        v4 = v3 + 6;
      else
        v4 = v1 + 4;
      *(_QWORD *)&v4->_os_unfair_lock_opaque = v5 + 4;
      *(_QWORD *)&v2->_os_unfair_lock_opaque = v5;
      *(_QWORD *)&v5[6]._os_unfair_lock_opaque = v2;
      ++v1[7]._os_unfair_lock_opaque;
    }
    else
    {

    }
    os_unfair_lock_unlock(v1 + 6);
    a1 = v1;
  }

}

BOOL IOGPUMetalCommandBufferStoragePoolReturnStorage(uint64_t *a1, _QWORD *a2)
{
  os_unfair_lock_s *v4;
  int v5;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  _BOOL8 v9;

  a2[1] = 0;
  v4 = (os_unfair_lock_s *)(a1 + 2);
  os_unfair_lock_lock((os_unfair_lock_t)a1 + 4);
  v5 = *((_DWORD *)a1 + 5);
  v6 = *((_DWORD *)a1 + 7);
  if (v5 < v6)
  {
    v7 = *a1;
    a2[2] = *a1;
    if (v7)
      v8 = (_QWORD *)(v7 + 24);
    else
      v8 = a1 + 1;
    *v8 = a2 + 2;
    *a1 = (uint64_t)a2;
    a2[3] = a1;
    *((_DWORD *)a1 + 5) = v5 + 1;
  }
  v9 = v5 < v6;
  os_unfair_lock_unlock(v4);
  return v9;
}

double IOGPUResourceListDestroy(uint64_t a1)
{
  double result;

  free(*(void **)(a1 + 456));
  free(*(void **)(a1 + 472));
  free(*(void **)(a1 + 464));
  result = 0.0;
  *(_OWORD *)(a1 + 568) = 0u;
  return result;
}

uint64_t IOGPUDeviceCreateDeviceShmem(uint64_t a1, unsigned int a2, unsigned int a3, _QWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v10;
  int v12;
  void (*v13)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD);
  _QWORD *v14;
  _QWORD *v15;
  size_t v16;
  uint64_t outputStruct;
  uint64_t v18;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  outputStruct = 0;
  v18 = 0;
  v16 = 16;
  v10 = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xDu, input, 2u, 0, 0, 0, 0, &outputStruct, &v16);
  if ((_DWORD)v10)
  {
    *a4 = 0;
    *a5 = 0;
    *a6 = 0;
  }
  else
  {
    *a4 = outputStruct;
    v12 = HIDWORD(v18);
    *a5 = v18;
    *a6 = v12;
    v13 = (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))*MEMORY[0x24BDAC928];
    if (*MEMORY[0x24BDAC928])
    {
      v14 = malloc_type_malloc(0x18uLL, 0x10200403ED2C137uLL);
      if (v14)
      {
        v15 = v14;
        *v14 = outputStruct;
        v14[1] = v18;
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
        v15[2] = *(_QWORD *)(a1 + 128);
        *(_QWORD *)(a1 + 128) = v15;
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
        v13(1677721616, *MEMORY[0x24BDAEC58], v18, 0, outputStruct, 0);
      }
    }
  }
  return v10;
}

uint64_t IOGPUDeviceDestroyDeviceShmem(uint64_t a1, unsigned int a2)
{
  os_unfair_lock_s *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t input;

  input = a2;
  v4 = (os_unfair_lock_s *)(a1 + 120);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
  v6 = (_QWORD *)(a1 + 128);
  v5 = *(_QWORD **)(a1 + 128);
  if (v5)
  {
    v7 = *(_QWORD **)(a1 + 128);
    while (*((_DWORD *)v7 + 3) != a2)
    {
      v7 = (_QWORD *)v7[2];
      if (!v7)
        goto LABEL_12;
    }
    if (*MEMORY[0x24BDAC928])
    {
      ((void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*MEMORY[0x24BDAC928])(1677721632, *MEMORY[0x24BDAEC58], *v7, *((unsigned int *)v7 + 2), 0, 0);
      v5 = (_QWORD *)*v6;
    }
    if (v5 != v7)
    {
      do
      {
        v8 = v5;
        v5 = (_QWORD *)v5[2];
      }
      while (v5 != v7);
      v6 = v8 + 2;
    }
    *v6 = v7[2];
    free(v7);
  }
LABEL_12:
  os_unfair_lock_unlock(v4);
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xEu, &input, 1u, 0, 0);
}

void IOGPUResourceListReset_cold_1()
{
  __assert_rtn("IOGPUResourceListReset", "IOGPUResourceList.m", 523, "(ssize_t)listSizeInBytes > 0");
}

uint64_t IOGPUMetalCommandBufferStorageGetDebugBufferPointers(uint64_t result, _QWORD *a2, _QWORD *a3)
{
  if (a2)
    *a2 = *(_QWORD *)(result + 872);
  if (a3)
    *a3 = *(_QWORD *)(result + 880);
  return result;
}

void IOGPUMetalCommandBufferStoragePoolPurge(uint64_t a1)
{
  os_unfair_lock_s *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v3 = *(_QWORD **)a1;
  if (*(_QWORD *)a1)
  {
    do
    {
      v5 = (_QWORD *)v3[2];
      v4 = (_QWORD *)v3[3];
      if (v5)
      {
        v5[3] = v4;
        v4 = (_QWORD *)v3[3];
      }
      else
      {
        *(_QWORD *)(a1 + 8) = v4;
      }
      *v4 = v5;
      --*(_DWORD *)(a1 + 20);
      IOGPUMetalCommandBufferStorageDealloc(v3);
      v3 = v5;
    }
    while (v5);
  }
  os_unfair_lock_unlock(v2);
}

_QWORD *IOGPUCommandQueueGetID(_QWORD *result)
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    if (CFGetTypeID(result) == kIOGPUCommandQueueID)
      return (_QWORD *)v1[3];
    else
      return 0;
  }
  return result;
}

unint64_t validateGPUPriority(unint64_t result, char a2)
{
  if (result > 5 || result == 3 && (a2 & 1) == 0)
    return MTLReportFailure();
  return result;
}

_QWORD *IOGPUCommandQueueGetConnect(_QWORD *result)
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    if (CFGetTypeID(result) == kIOGPUCommandQueueID)
      return (_QWORD *)*(unsigned int *)(v1[2] + 20);
    else
      return 0;
  }
  return result;
}

unsigned int *IOGPUDeviceGetConnect(unsigned int *result)
{
  unsigned int *v1;

  if (result)
  {
    v1 = result;
    if (CFGetTypeID(result) == kIOGPUDeviceID)
      return (unsigned int *)v1[5];
    else
      return 0;
  }
  return result;
}

uint64_t IOGPUCommandQueueSetPriorityAndBackground(uint64_t a1, void *inputStruct, _DWORD *a3)
{
  uint64_t result;
  uint64_t output;
  uint32_t outputCnt;

  outputCnt = 1;
  output = 3;
  result = IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x1Bu, (const uint64_t *)(a1 + 24), 1u, inputStruct, 0xCuLL, &output, &outputCnt, 0, 0);
  if (a3)
  {
    if (!(_DWORD)result)
      *a3 = output;
  }
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

uint64_t IOGPUDeviceGetGlobalTraceObjectID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

void IOGPUMetalSuballocatorCreate(IOGPUMetalDevice *a1)
{
  IOGPUMetalSuballocator *v2;
  char v3;

  v3 = 0;
  if (a1)
  {
    v2 = (IOGPUMetalSuballocator *)IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocator>::allocate((uint64_t)&v3, 1);
    if (v2)
      IOGPUMetalSuballocator::IOGPUMetalSuballocator(v2, a1);
  }
}

void *IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocator>::allocate(uint64_t a1, uint64_t a2)
{
  void *memptr;

  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 8uLL, 2824 * a2, 0x10F0040732811FFuLL))
    return 0;
  else
    return memptr;
}

void IOGPUMetalSuballocator::IOGPUMetalSuballocator(IOGPUMetalSuballocator *this, IOGPUMetalDevice *a2)
{
  uint64_t i;
  char *v4;
  IOGPUMetalDevice *v5;

  for (i = 0; i != 2816; i += 88)
  {
    v4 = (char *)this + i;
    *(_QWORD *)((char *)this + i + 56) = 0;
    *(_OWORD *)v4 = 0uLL;
    *((_OWORD *)v4 + 1) = 0uLL;
    *((_OWORD *)v4 + 2) = 0uLL;
    *((_QWORD *)v4 + 6) = (char *)this + i + 56;
    *((_QWORD *)v4 + 8) = 0;
    *((_QWORD *)v4 + 9) = -1;
    *((_DWORD *)v4 + 20) = 0;
  }
  *((_QWORD *)this + 352) = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("IOGPUMetalSuballocator", "IOGPUMetalSuballocator.mm", 117, "[device isKindOfClass:[IOGPUMetalDevice class]] && \"Bad device instance\"");
  v5 = a2;
}

double IOGPUMetalCommandBufferStoragePoolCreate(uint64_t a1)
{
  _QWORD *v2;
  double result;

  v2 = malloc_type_malloc(0x28uLL, 0x10A004036F81E10uLL);
  if (v2)
  {
    v2[4] = a1;
    result = 0.0;
    *((_OWORD *)v2 + 1) = xmmword_21167AE70;
    *v2 = 0;
    v2[1] = v2;
  }
  return result;
}

uint64_t IOGPUDeviceGetSharedMemorySize(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = 3758097090;
  if (a1 && CFGetTypeID(a1) == kIOGPUDeviceID)
  {
    v2 = 0;
    *a2 = a1[24];
  }
  return v2;
}

uint64_t IOGPUDeviceGetConfig64(uint64_t a1, _DWORD *a2, _DWORD *a3, _QWORD *a4, _QWORD *a5, _DWORD *a6)
{
  uint64_t v6;

  v6 = 3758097090;
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUDeviceID)
  {
    v6 = 0;
    *a2 = *(_DWORD *)(a1 + 160);
    *a3 = *(_DWORD *)(a1 + 164);
    *a4 = *(_QWORD *)(a1 + 168);
    *a5 = *(_QWORD *)(a1 + 176);
    *a6 = *(_DWORD *)(a1 + 184);
  }
  return v6;
}

uint64_t IOGPUDeviceCreateWithAPIProperty(io_service_t a1, const char *a2, int a3)
{
  kern_return_t v5;
  int v6;
  io_connect_t v7;
  uint64_t Instance;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  size_t v14;
  size_t outputStruct[2];
  __int128 v16;
  size_t outputStructCnt;
  io_connect_t connect;
  char __dst[16];
  _OWORD v20[32];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  connect = 0;
  v5 = IOServiceOpen(a1, *MEMORY[0x24BDAEC58], (a3 << 16) | 1, &connect);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      IOGPUDeviceCreateWithAPIProperty_cold_1(v6);
    return 0;
  }
  if (a2)
  {
    strncpy(__dst, a2, 0x10uLL);
    IOConnectCallStructMethod(connect, 6u, __dst, 0x10uLL, 0, 0);
  }
  v7 = connect;
  if (IOGPUDeviceGetTypeID_onceToken != -1)
    dispatch_once(&IOGPUDeviceGetTypeID_onceToken, &__block_literal_global_4);
  Instance = _CFRuntimeCreateInstance();
  v9 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = a1;
    *(_DWORD *)(Instance + 20) = v7;
    *(_QWORD *)(Instance + 68) = 0;
    *(_QWORD *)(Instance + 60) = 0;
    *(_DWORD *)(Instance + 76) = 0;
    *(_QWORD *)(Instance + 80) = 300000000000
                               * (unint64_t)*(unsigned int *)algn_253CFB4AC
                               / timebase_info;
    memset(v20, 0, 496);
    *(_OWORD *)__dst = 0u;
    outputStructCnt = 536;
    if (IOConnectCallStructMethod(v7, 2u, 0, 0, __dst, &outputStructCnt))
      goto LABEL_17;
    *(_QWORD *)(v9 + 24) = *(_QWORD *)__dst;
    v10 = DWORD1(v20[0]);
    *(_DWORD *)(v9 + 40) = DWORD1(v20[0]);
    if ((int)v10 < 2)
    {
      *(_QWORD *)(v9 + 32) = v9 + 24;
    }
    else
    {
      *(_QWORD *)(v9 + 32) = malloc_type_malloc(8 * v10, 0x10040436913F5uLL);
      v11 = *(unsigned int *)(v9 + 40);
      if ((int)v11 >= 1)
      {
        for (i = 0; i != v11; ++i)
          *(_QWORD *)(*(_QWORD *)(v9 + 32) + 8 * i) = *((unsigned int *)v20 + i + 2) + *(_QWORD *)(v9 + 24);
      }
    }
    *(_QWORD *)(v9 + 44) = *(_QWORD *)&__dst[8];
    *(_DWORD *)(v9 + 52) = v20[0];
    outputStruct[0] = 64;
    if (IOConnectCallStructMethod(*(_DWORD *)(v9 + 20), 0, 0, 0, (void *)(v9 + 160), outputStruct))
    {
LABEL_17:
      CFRelease((CFTypeRef)v9);
      return 0;
    }
    *(_OWORD *)outputStruct = 0u;
    v16 = 0u;
    v14 = 32;
    if (!IOConnectCallStructMethod(*(_DWORD *)(v9 + 20), 4u, 0, 0, outputStruct, &v14))
    {
      *(_QWORD *)(v9 + 88) = outputStruct[0];
      if (DWORD2(v16) >= 4)
        *(_QWORD *)(v9 + 96) = outputStruct[1];
      *(_QWORD *)(v9 + 104) = v16;
    }
    if (__globalGPUCommPageInit != -1)
      dispatch_once(&__globalGPUCommPageInit, &__block_literal_global_2_1);
    *(_QWORD *)(v9 + 112) = 0;
    *(_DWORD *)(v9 + 120) = 0;
    *(_OWORD *)(v9 + 128) = 0u;
    *(_OWORD *)(v9 + 144) = 0u;
  }
  return v9;
}

uint64_t IOGPUDeviceSetAppGPURole(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t result;
  mach_port_t v5;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  result = 3758097088;
  if (a1)
  {
    v5 = *(_DWORD *)(a1 + 20);
    if (v5)
    {
      input[0] = a2;
      input[1] = a3;
      return IOConnectCallScalarMethod(v5, 0x22u, input, 2u, 0, 0);
    }
  }
  return result;
}

void IOGPUCommandQueueRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

_QWORD *IOGPUMetalCommandBufferStorageAllocDebugBuffer(_QWORD *a1)
{
  _QWORD *result;
  uint64_t v3;

  result = IOGPUMetalDeviceShmemPoolCreateShmem(*(_QWORD *)(*a1 + 672));
  if (result)
  {
    a1[109] = result[17];
    v3 = result[17];
    a1[108] = result;
    a1[110] = v3 + *((unsigned int *)result + 33);
  }
  return result;
}

_QWORD *IOGPUMetalCommandBufferStorageAllocSidebandBuffer(_QWORD *a1, unsigned int a2)
{
  void *v3;
  unsigned int v5;
  int v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;

  if (!a1)
    IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_1();
  if (!*a1)
    IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_2();
  if (a1[8])
    IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_4();
  v3 = *(void **)(*a1 + 632);
  if (!v3)
    IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_3();
  while (objc_msgSend(v3, "shmemSize") < a2)
  {
    v5 = objc_msgSend(v3, "shmemSize");
    v6 = objc_msgSend(v3, "shmemSize");
    if (v5 >= 0x200000)
      v7 = (v6 + 0x100000);
    else
      v7 = (2 * v6);
    objc_msgSend(v3, "setShmemSize:", v7);
  }
  result = IOGPUMetalDeviceShmemPoolCreateShmem((uint64_t)v3);
  if (result)
  {
    v9 = result[17];
    a1[8] = result;
    a1[9] = v9;
    v10 = v9 + *((unsigned int *)result + 33);
    a1[10] = v9;
    a1[11] = v10;
  }
  return result;
}

uint64_t IOGPUDeviceGetMaxResourceSize(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = 3758097090;
  if (a1 && CFGetTypeID(a1) == kIOGPUDeviceID)
  {
    v2 = 0;
    *a2 = a1[25];
  }
  return v2;
}

void IOGPUNotificationQueueRelease(const void *a1)
{
  if (a1)
  {
    if (CFGetTypeID(a1) == kIOGPUNotificationQueueID)
      CFRelease(a1);
  }
}

void ioGPUNotificationQueueFinalize(uint64_t a1)
{
  mach_port_name_t v2;
  NSObject *v3;
  NSObject *v4;
  kern_return_t v5;
  int v6;

  v2 = *(_DWORD *)(a1 + 40);
  if (v2)
  {
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], v2, 1u, -1);
    *(_DWORD *)(a1 + 40) = 0;
  }
  if (*(_QWORD *)(a1 + 72))
    ioGPUNotificationQueueFinalize_cold_3();
  if (*(_QWORD *)(a1 + 48))
    ioGPUNotificationQueueFinalize_cold_2();
  v3 = *(NSObject **)(a1 + 56);
  if (v3)
    dispatch_release(v3);
  v4 = *(NSObject **)(a1 + 64);
  if (v4)
    dispatch_release(v4);
  if (*(_QWORD *)(a1 + 24))
  {
    v5 = IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x10u, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        ioGPUNotificationQueueFinalize_cold_1(v6);
    }
  }
  *(_QWORD *)(a1 + 24) = 0;
  CFRelease(*(CFTypeRef *)(a1 + 16));
}

void ioGPUCommandQueueFinalize(uint64_t a1)
{
  uint64_t v2;
  kern_return_t v3;
  _QWORD block[5];

  if (_cmdq_finalize_queue_once_0 != -1)
    dispatch_once(&_cmdq_finalize_queue_once_0, &__block_literal_global_5);
  v2 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ioGPUCommandQueueFinalize_block_invoke_2;
    block[3] = &__block_descriptor_tmp_7;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)_cmdq_finalize_queue_0, block);
  }
  if (*(_QWORD *)(a1 + 24))
  {
    v3 = IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 8u, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
    if (v3)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOGPUCommandQueue delete failed with error 0x%x", v3);
  }
  *(_QWORD *)(a1 + 24) = 0;
  CFRelease(*(CFTypeRef *)(a1 + 16));
}

dispatch_queue_t __ioGPUCommandQueueFinalize_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.Metal.NotificationQueueCleaupQueue", 0);
  _cmdq_finalize_queue_0 = (uint64_t)result;
  return result;
}

uint64_t IOGPUResourceSetOwnerIdentity(uint64_t a1, unsigned int a2)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = *(unsigned int *)(a1 + 48);
  input[1] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x24u, input, 2u, 0, 0);
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer(_QWORD *a1, int a2)
{
  uint64_t v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  _QWORD *Shmem;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  const void *v15;

  v2 = a1[4];
  if (!v2)
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_1();
  v4 = a1[5];
  if (!v4 || (v5 = a1[7]) == 0 || (v6 = a1[6]) == 0)
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_2();
  if (v5 < v4)
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_3();
  v7 = v6 - v4;
  if (v6 < v4)
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_4();
  v8 = a2 + 24 + v5 - v4;
  v9 = *(_QWORD *)(v2 + 8);
  v10 = *(_DWORD *)(v9 + 48);
  while (v10 < v8)
  {
    if (v10 >= 0x200000)
      v10 += 0x100000;
    else
      v10 *= 2;
  }
  objc_msgSend(*(id *)(v2 + 8), "setShmemSize:");
  Shmem = IOGPUMetalDeviceShmemPoolCreateShmem(v9);
  a1[4] = Shmem;
  if (!Shmem)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_5((uint64_t)a1);
    abort();
  }
  v12 = a1[111];
  if (v12)
    a1[111] = v12 - *(_QWORD *)(v2 + 136) + Shmem[17];
  v13 = *((unsigned int *)Shmem + 33);
  v14 = (char *)Shmem[17];
  a1[5] = v14;
  if (v13 < v8)
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_6();
  a1[7] = &v14[v13];
  v15 = *(const void **)(v2 + 136);
  if (!v15)
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_7();
  if (v13 <= v7)
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_8();
  memcpy(v14, v15, v7);
  IOGPUMetalDeviceShmemRelease((os_unfair_lock_s *)v2);
  a1[6] = a1[5] + v7;
}

void IOGPUMetalCommandBufferStorageGrowSegmentList(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  _QWORD *Shmem;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_DWORD *)(v2 + 132);
  if (v3 >= 0x200000)
    v4 = v3 + 0x100000;
  else
    v4 = 2 * v3;
  objc_msgSend(*(id *)(v2 + 8), "setShmemSize:", v4);
  Shmem = IOGPUMetalDeviceShmemPoolCreateShmem(*(_QWORD *)(v2 + 8));
  if (!Shmem)
  {
    v26 = *(uint64_t **)(a1 + 120);
    v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v26)
    {
      if (v27)
      {
        IOGPUMetalCommandBufferStorageGrowSegmentList_cold_2(v26);
        abort();
      }
    }
    else if (v27)
    {
      IOGPUMetalCommandBufferStorageGrowSegmentList_cold_1(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    abort();
  }
  v6 = Shmem;
  memcpy((void *)Shmem[17], *(const void **)(a1 + 104), *(unsigned int *)(*(_QWORD *)(a1 + 96) + 132));
  IOGPUMetalDeviceShmemRelease(*(os_unfair_lock_s **)(a1 + 96));
  *(_QWORD *)(a1 + 96) = v6;
  if (*(_DWORD *)(a1 + 836))
  {
    v7 = v6[17];
    v8 = *(_QWORD *)(a1 + 128) - *(_QWORD *)(a1 + 104);
    v9 = v7 + *((unsigned int *)v6 + 33);
    *(_QWORD *)(a1 + 104) = v7;
    *(_QWORD *)(a1 + 112) = v9;
    v10 = v7 + v8;
    *(_QWORD *)(a1 + 120) = v7;
    *(_QWORD *)(a1 + 128) = v10;
    v11 = v10 + 32;
    *(_QWORD *)(a1 + 136) = v10 + 32;
    v12 = a1 + 144;
    v13 = v9 - (v10 + 32);
LABEL_11:
    IOGPUResourceListReset(v12, v11, v13, 0);
    return;
  }
  v14 = *(_DWORD *)(a1 + 832);
  if (!v14)
  {
    v19 = *(_QWORD *)(a1 + 104);
    v20 = *(_QWORD *)(a1 + 120) - v19;
    v21 = *(_QWORD *)(a1 + 128) - v19;
    v22 = v6[17];
    v23 = v22 + *((unsigned int *)v6 + 33);
    *(_QWORD *)(a1 + 104) = v22;
    *(_QWORD *)(a1 + 112) = v23;
    v24 = v22 + v20;
    *(_QWORD *)(a1 + 808) = v24;
    v25 = v22 + v21;
    *(_QWORD *)(a1 + 120) = v24;
    *(_QWORD *)(a1 + 128) = v25;
    v11 = v25 + 32;
    *(_QWORD *)(a1 + 136) = v25 + 32;
    v12 = a1 + 144;
    v13 = v23 - (v25 + 32);
    goto LABEL_11;
  }
  if (v14 != 1)
  {
    v35 = MTLReleaseAssertionFailure();
    IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_1(v35);
  }
  v15 = *(_QWORD *)(a1 + 816) - *(_QWORD *)(a1 + 104);
  v16 = v6[17];
  v17 = v16 + *((unsigned int *)v6 + 33);
  *(_QWORD *)(a1 + 104) = v16;
  *(_QWORD *)(a1 + 112) = v17;
  v18 = v16 + v15;
  *(_QWORD *)(a1 + 816) = v18;
  *(_QWORD *)(a1 + 808) = v18;
}

void IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_1()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageAllocResourceAtIndex", "IOGPUMetalCommandBufferStorage.m", 403, "storage->hwResourcePools[dbclass]");
}

void IOGPUMetalCommandBufferStorageBeginKernelCommands(uint64_t a1, int a2)
{
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  v4 = *(_QWORD *)(a1 + 816);
  if (v4)
  {
    v5 = a2 - *(_DWORD *)(a1 + 40);
    goto LABEL_11;
  }
  v6 = *(_DWORD *)(a1 + 832);
  if (v6 != -1)
  {
    if (!v6)
    {
      v4 = *(_QWORD *)(a1 + 128);
      *(_DWORD *)(*(_QWORD *)(a1 + 120) + 12) = v4 - *(_QWORD *)(a1 + 120);
      *(_QWORD *)(a1 + 808) = v4;
      *(_QWORD *)(a1 + 120) = 0;
      *(_OWORD *)(a1 + 128) = 0u;
      *(_OWORD *)(a1 + 848) = 0u;
      goto LABEL_8;
    }
    MTLReleaseAssertionFailure();
  }
  v4 = *(_QWORD *)(a1 + 808);
LABEL_8:
  *(_QWORD *)(a1 + 816) = v4;
  *(_DWORD *)(a1 + 832) = 1;
  *(_QWORD *)(a1 + 824) = 0;
  if ((unint64_t)(v4 + 48) >= *(_QWORD *)(a1 + 112))
  {
    IOGPUMetalCommandBufferStorageGrowSegmentList(a1);
    v4 = *(_QWORD *)(a1 + 816);
  }
  *(_QWORD *)v4 = *(_QWORD *)(a1 + 800);
  *(_QWORD *)(v4 + 8) = 0x4000000100000000;
  v5 = a2 - *(_DWORD *)(a1 + 40);
  *(_DWORD *)(v4 + 16) = v5;
LABEL_11:
  v7 = *(_DWORD *)(a1 + 824);
  v8 = *(_DWORD *)(a1 + 828);
  if (v8)
  {
    if (*(_DWORD *)(v4 + 8 * (v8 - 1) + 20) == v5)
      return;
    ++v7;
  }
  if (v4 + 8 * (unint64_t)(v7 + 1) + 16 >= *(_QWORD *)(a1 + 112))
  {
    IOGPUMetalCommandBufferStorageGrowSegmentList(a1);
    v4 = *(_QWORD *)(a1 + 816);
  }
  *(_DWORD *)(v4 + 8 * v7 + 16) = v5;
  *(_DWORD *)(a1 + 824) = v7;
}

uint64_t IOGPUMetalCommandBufferStorageEndKernelCommands(uint64_t result, int a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(result + 816);
  v3 = a2 - *(_DWORD *)(result + 40);
  v4 = *(unsigned int *)(result + 824);
  *(_DWORD *)(result + 828) = v4 + 1;
  *(_DWORD *)(v2 + 8 * v4 + 20) = v3;
  return result;
}

uint64_t IOGPUMetalCommandBufferStorageGetSegmentListPointers(uint64_t result, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  _QWORD *v7;

  v7 = (_QWORD *)result;
  if (*(_QWORD *)(result + 120))
  {
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  result = _mtlIOGPUCommandBufferStorageBeginSegmentList(result);
  if (a2)
LABEL_3:
    *a2 = v7[15];
LABEL_4:
  if (a3)
    *a3 = v7[16];
  if (a4)
    *a4 = v7[14];
  return result;
}

uint64_t IOGPUMetalCommandBufferStorageResumeSegment(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 120);
  if (!v1)
    return 0;
  v2 = *(_QWORD *)(a1 + 848);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(a1 + 856);
  if (!v3)
    return 0;
  *(_QWORD *)(a1 + 128) = v2;
  *(_QWORD *)(a1 + 136) = v3;
  *(_QWORD *)(a1 + 848) = 0;
  *(_QWORD *)(a1 + 856) = 0;
  --*(_DWORD *)(v1 + 8);
  --*(_DWORD *)(a1 + 840);
  *(_QWORD *)(v2 + 24) = 0;
  *(_DWORD *)(v2 + 12) = 0;
  return 1;
}

void IOGPUMetalCommandBufferStoragePoolDealloc(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = (_QWORD *)*a1;
  if (v2)
  {
    do
    {
      v4 = (_QWORD *)v2[2];
      v3 = (_QWORD *)v2[3];
      if (v4)
      {
        v4[3] = v3;
        v3 = (_QWORD *)v2[3];
      }
      else
      {
        a1[1] = v3;
      }
      *v3 = v4;
      --*((_DWORD *)a1 + 5);
      IOGPUMetalCommandBufferStorageDealloc(v2);
      v2 = v4;
    }
    while (v4);
  }
  free(a1);
}

void IOGPUMetalCommandBufferStorageGrowDebugBuffer(uint64_t a1, int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD *Shmem;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *(_QWORD *)(a1 + 864);
  v4 = *(_DWORD *)(v3 + 132);
  v5 = v4 + a2;
  while (v4 < v5)
  {
    if (v4 >= 0x200000)
      v4 += 0x100000;
    else
      v4 *= 2;
  }
  objc_msgSend(*(id *)(v3 + 8), "setShmemSize:");
  Shmem = IOGPUMetalDeviceShmemPoolCreateShmem(*(_QWORD *)(v3 + 8));
  if (!Shmem)
  {
    v9 = *(_QWORD *)(a1 + 120);
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v9)
    {
      if (v10)
      {
        IOGPUMetalCommandBufferStorageGrowDebugBuffer_cold_2();
        abort();
      }
    }
    else if (v10)
    {
      IOGPUMetalCommandBufferStorageGrowDebugBuffer_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    abort();
  }
  v7 = Shmem;
  IOGPUMetalDeviceShmemRelease(*(os_unfair_lock_s **)(a1 + 864));
  *(_QWORD *)(a1 + 872) = v7[17];
  v8 = v7[17];
  *(_QWORD *)(a1 + 864) = v7;
  *(_QWORD *)(a1 + 880) = v8 + *((unsigned int *)v7 + 33);
}

void IOGPUMetalCommandBufferStorageGrowSidebandBuffer(uint64_t a1, int a2)
{
  uint64_t v2;
  unsigned int v4;
  void *i;
  unsigned int v6;
  int v7;
  uint64_t v8;
  _QWORD *Shmem;
  _QWORD *v10;
  size_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 64);
  if (!v2)
    IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_1();
  v4 = *(_DWORD *)(v2 + 132) + a2;
  for (i = *(void **)(*(_QWORD *)a1 + 632);
        objc_msgSend(i, "shmemSize") < v4;
        objc_msgSend(i, "setShmemSize:", v8))
  {
    v6 = objc_msgSend(i, "shmemSize");
    v7 = objc_msgSend(i, "shmemSize");
    if (v6 >= 0x200000)
      v8 = (v7 + 0x100000);
    else
      v8 = (2 * v7);
  }
  Shmem = IOGPUMetalDeviceShmemPoolCreateShmem((uint64_t)i);
  if (!Shmem)
  {
    v12 = *(_QWORD *)(a1 + 120);
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v12)
    {
      if (v13)
      {
        IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_3();
        abort();
      }
    }
    else if (v13)
    {
      IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    abort();
  }
  v10 = Shmem;
  v11 = *(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72);
  memcpy((void *)Shmem[17], *(const void **)(v2 + 136), v11);
  IOGPUMetalDeviceShmemRelease(*(os_unfair_lock_s **)(a1 + 64));
  *(_QWORD *)(a1 + 72) = v10[17];
  *(_QWORD *)(a1 + 88) = v10[17] + *((unsigned int *)v10 + 33);
  *(_QWORD *)(a1 + 80) = v10[17] + v11;
  *(_QWORD *)(a1 + 64) = v10;
}

unint64_t IOGPUMetalCommandBufferStorageAddResidencySets(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned int a4)
{
  unsigned int v6;
  id *v7;
  id v8;
  uint64_t v9;
  unint64_t result;

  if (a4)
    v6 = 8;
  else
    v6 = 32;
  v7 = (id *)(a1 + 8 * a4 + 896);
  v8 = *v7;
  if (!*v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD14E0]);
    *v7 = v8;
  }
  if (a3)
  {
    do
    {
      v9 = *a2++;
      objc_msgSend(*v7, "addObject:", v9);
      --a3;
    }
    while (a3);
    v8 = *v7;
  }
  result = objc_msgSend(v8, "count");
  if (result > v6)
    return MTLReportFailure();
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void _addResidencySets(os_unfair_lock_s *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;

  os_unfair_lock_lock(a1 + 110);
  if (!*(_QWORD *)&a1[2 * a4 + 106]._os_unfair_lock_opaque)
    *(_QWORD *)&a1[2 * a4 + 106]._os_unfair_lock_opaque = objc_opt_new();
  for (; a3; --a3)
  {
    objc_msgSend(*(id *)&a1[2 * a4 + 106]._os_unfair_lock_opaque, "addObject:", *a2);
    if (*(_DWORD *)__globalGPUCommPage)
      IOGPUDeviceTraceEvent();
    ++a2;
  }
  if (a4 == 1)
    v8 = 8;
  else
    v8 = 32;
  if (objc_msgSend(*(id *)&a1[2 * a4 + 106]._os_unfair_lock_opaque, "count") > v8)
    MTLReportFailure();
  _updateResidencySets((uint64_t)a1);
  os_unfair_lock_unlock(a1 + 110);
}

void _removeResidencySets(os_unfair_lock_s *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  os_unfair_lock_s *v8;

  os_unfair_lock_lock(a1 + 110);
  if (*(_QWORD *)&a1[2 * a4 + 106]._os_unfair_lock_opaque)
  {
    if (!a3)
      goto LABEL_9;
  }
  else
  {
    *(_QWORD *)&a1[2 * a4 + 106]._os_unfair_lock_opaque = objc_opt_new();
    if (!a3)
      goto LABEL_9;
  }
  v8 = &a1[2 * a4];
  do
  {
    objc_msgSend(*(id *)&v8[106]._os_unfair_lock_opaque, "removeObject:", *a2);
    if (*(_DWORD *)__globalGPUCommPage)
      IOGPUDeviceTraceEvent();
    ++a2;
    --a3;
  }
  while (a3);
LABEL_9:
  _updateResidencySets((uint64_t)a1);
  os_unfair_lock_unlock(a1 + 110);
}

void _updateResidencySets(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  void *v6;
  int v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  _BYTE v13[160];
  uint64_t v14;

  v2 = 0;
  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = 1;
  v4 = MEMORY[0x24BDAC760];
  do
  {
    v5 = v3;
    v6 = *(void **)(a1 + 424 + 8 * v2);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = ___updateResidencySets_block_invoke;
    v8[3] = &unk_24CC3F7E0;
    v8[4] = &v9;
    v8[5] = v13;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);
    v3 = 0;
    v2 = 1;
  }
  while ((v5 & 1) != 0);
  v7 = IOGPUCommandQueueSetResourceGroups(*(_QWORD *)(a1 + 384), *((unsigned int *)v10 + 6), (uintptr_t)v13);
  if (v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    _updateResidencySets_cold_1(v7);
  _Block_object_dispose(&v9, 8);
}

void sub_211661DE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

uint64_t ___updateResidencySets_block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v4 = *(unsigned int *)(v3 + 24);
  if (v4 <= 0x27)
  {
    v5 = *(_DWORD *)(a2 + 40);
    v6 = *(_QWORD *)(result + 40);
    *(_DWORD *)(v3 + 24) = v4 + 1;
    *(_DWORD *)(v6 + 4 * v4) = v5;
  }
  *a3 = 0;
  return result;
}

void sub_211662A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_211663414(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<NSObject *>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CC3EF60, MEMORY[0x24BEDAAF0]);
}

void sub_211663688(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

BOOL IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::init(int32x2_t *a1, size_t size, unsigned int a3)
{
  void *v5;
  BOOL v6;

  if (a3 < 2 * (int)size)
    return 0;
  a1[6].i32[0] = size;
  a1[6].i32[1] = size - 1;
  a1[7] = vadd_s32((int32x2_t)vshl_u32((uint32x2_t)vadd_s32(vdup_n_s32(size), (int32x2_t)0xFFF0000003FLL), (uint32x2_t)0xFFFFFFF4FFFFFFFALL), (int32x2_t)-1);
  a1[8].i32[0] = __clz(__rbit32(size));
  a1[9].i32[1] = a3;
  a1[2] = (int32x2_t)malloc_type_calloc(4uLL, size, 0xDE804F0AuLL);
  *a1 = (int32x2_t)malloc_type_calloc(8uLL, a1[6].u32[0], 0xD53F19F6uLL);
  a1[1] = (int32x2_t)malloc_type_calloc(8uLL, a1[6].u32[0], 0xD53F19F6uLL);
  a1[3] = (int32x2_t)malloc_type_calloc(8uLL, (a1[6].i32[0] + 63) >> 6, 0xDE804F0AuLL);
  a1[4] = (int32x2_t)malloc_type_calloc(8uLL, (a1[6].i32[0] + 63) >> 6, 0xDE804F0AuLL);
  v5 = malloc_type_calloc(8uLL, (a1[6].i32[0] + 4095) >> 12, 0xDE804F0AuLL);
  a1[5] = (int32x2_t)v5;
  if (!*(_QWORD *)&a1[2] || !*(_QWORD *)a1 || !*(_QWORD *)&a1[1] || !*(_QWORD *)&a1[3])
    return 0;
  if (a1[4])
    v6 = v5 == 0;
  else
    v6 = 1;
  return !v6;
}

void IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::releaseAllKeys(uint64_t *a1)
{
  uint64_t v2;
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1[2])
  {
    if (*a1)
    {
      v2 = a1[3];
      if (v2)
      {
        if (a1[1])
        {
          v3 = 0;
          do
          {
            v4 = *(_QWORD *)(v2 + 8 * v3);
            v5 = v3;
            if (v4)
            {
              v6 = v3 << 6;
              do
              {
                v7 = __clz(__rbit64(v4));
                v4 &= ~(1 << v7);
                v8 = v7 + v6;
                v9 = *a1;

                *(_QWORD *)(v9 + 8 * v8) = 0;
                --*((_DWORD *)a1 + 17);
              }
              while (v4);
              v2 = a1[3];
              *(_QWORD *)(v2 + 8 * v5) = 0;
            }
            v3 = v5 + 1;
          }
          while ((v5 + 1) <= *((_DWORD *)a1 + 14));
        }
      }
    }
  }
}

void sub_211666A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if ((char *)STACK[0x1008] != &a10)
    free((void *)STACK[0x1008]);
  _Unwind_Resume(a1);
}

void sub_211666CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if ((uint64_t *)STACK[0x800] != &a9)
    free((void *)STACK[0x800]);
  if ((unint64_t *)STACK[0x1008] != &STACK[0x808])
    free((void *)STACK[0x1008]);
  if ((unint64_t *)STACK[0x1810] != &STACK[0x1010])
    free((void *)STACK[0x1810]);
  if ((unint64_t *)STACK[0x2018] != &STACK[0x1818])
    free((void *)STACK[0x2018]);
  _Unwind_Resume(a1);
}

void sub_211666E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if ((uint64_t *)STACK[0x800] != &a9)
    free((void *)STACK[0x800]);
  if ((unint64_t *)STACK[0xC08] != &STACK[0x808])
    free((void *)STACK[0xC08]);
  _Unwind_Resume(a1);
}

void sub_211667034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if ((uint64_t *)STACK[0x800] != &a9)
    free((void *)STACK[0x800]);
  if ((unint64_t *)STACK[0xC08] != &STACK[0x808])
    free((void *)STACK[0xC08]);
  _Unwind_Resume(a1);
}

uint64_t IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::rehash(uint64_t a1, unsigned int a2)
{
  size_t v3;
  unsigned int v4;
  size_t v5;
  uint64_t v6;
  _BYTE *v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  unint64_t v34;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  int32x2_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;

  v3 = *(unsigned int *)(a1 + 48);
  v4 = 2 * v3;
  if (a2)
    v4 = a2;
  do
  {
    v5 = v3;
    v3 = (2 * v3);
  }
  while (v5 < v4);
  v6 = operator new();
  *(_QWORD *)(v6 + 64) = 0;
  v7 = (_BYTE *)(v6 + 64);
  *(_OWORD *)v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 44) = 0u;
  *(_QWORD *)(v6 + 72) = 0;
  *(_QWORD *)(v6 + 80) = 0;
  if (IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::init((int32x2_t *)v6, v5, *(_DWORD *)(a1 + 76)))
  {
LABEL_5:
    v8 = 0;
    v9 = *(_QWORD *)(a1 + 24);
    do
    {
      v10 = *(_QWORD *)(v9 + 8 * v8);
      if (v10)
      {
        v11 = v8 << 6;
        v12 = *(_QWORD *)a1;
        v13 = *(_QWORD *)(a1 + 8);
        v14 = *(_QWORD *)(v6 + 24);
        while (2)
        {
          v15 = 0;
          v16 = __clz(__rbit64(v10));
          v10 &= ~(1 << v16);
          v17 = v16 | v11;
          v18 = *(_QWORD *)(v12 + 8 * v17);
          v59 = *(_QWORD *)(v13 + 8 * v17);
          v19 = *(_DWORD *)(v6 + 48) - 1;
          v20 = (0x9E3779B97F4A7C15 * (v18 & 0xFFFFFFFFFFFFFFFCLL)) >> -*v7;
          v21 = *(_DWORD *)(v6 + 56);
          v22 = v20 & 0x3F;
          v23 = *(_QWORD *)(v14 + 8 * (v20 >> 6)) | ~(-1 << v20);
          v24 = v20 >> 6 << 6;
          v25 = (v20 >> 6) + 1;
          while (v23 == -1)
          {
            v15 = v15 - v22 + 64;
            v23 = *(_QWORD *)(v14 + 8 * (v25 & v21));
            v24 += 64;
            ++v25;
            v22 = 0;
            if (v15 >= 0x80)
              goto LABEL_38;
          }
          v26 = __clz(__rbit64(~v23)) + v24;
          if ((v26 - v20) > 0x7F)
          {
LABEL_38:
            v55 = IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::~IOGPUGenerationalSet(v6);
            MEMORY[0x212BDECF0](v55, 0x1030C408A7EA8B0);
            v5 = (2 * v5);
            v6 = operator new();
            *(_QWORD *)(v6 + 64) = 0;
            v7 = (_BYTE *)(v6 + 64);
            *(_OWORD *)v6 = 0u;
            *(_OWORD *)(v6 + 16) = 0u;
            *(_OWORD *)(v6 + 32) = 0u;
            *(_OWORD *)(v6 + 44) = 0u;
            *(_QWORD *)(v6 + 72) = 0;
            *(_QWORD *)(v6 + 80) = 0;
            if (IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::init((int32x2_t *)v6, v5, *(_DWORD *)(a1 + 76)))
            {
              goto LABEL_5;
            }
            goto LABEL_39;
          }
          LODWORD(v27) = *(_DWORD *)(v6 + 56);
          while ((v26 - v20) >= 0x20)
          {
            v28 = v26 - 31;
            if (v26 < 0x1F)
            {
LABEL_26:
              v36 = v26;
            }
            else
            {
              v29 = *(_QWORD *)(v6 + 16);
              if (v26 < (int)v26 - 30)
                v28 = v26 - 30;
              else
                v28 = v26;
              v30 = -31;
              while (1)
              {
                v31 = ((_DWORD)v26 + v30) & v19;
                v32 = *(_DWORD *)(v29 + 4 * v31);
                v33 = __clz(__rbit32(v32));
                v34 = (_DWORD)v26 + v30 + v33;
                if (v32 && v34 < v26)
                  break;
                if (!__CFADD__((_DWORD)v26, ++v30))
                  goto LABEL_26;
              }
              v38 = v34 & v19;
              v39 = *(int32x2_t *)v6;
              v40 = *(_QWORD *)(v6 + 8);
              v41 = *(_QWORD *)(*(_QWORD *)v6 + 8 * v38);
              v42 = *(_QWORD *)(v40 + 8 * v38);
              *(_DWORD *)(v29 + 4 * v31) = v32 & ~(1 << v33) | (1 << -(char)v30);
              v43 = *(_QWORD *)(v6 + 32);
              v27 = *(unsigned int *)(v6 + 56);
              v44 = v27 & (v34 >> 6);
              v45 = *(_QWORD *)(v43 + 8 * v44);
              if ((v45 & (1 << v34)) != 0)
              {
                *(_QWORD *)(v43 + 8 * v44) = v45 & ~(1 << v34);
                v46 = v27 & ((unint64_t)v26 >> 6);
                *(_QWORD *)(v43 + 8 * v46) |= 1 << v26;
                v47 = 1 << v46;
                v48 = *(unsigned int *)(v6 + 60) & (v46 >> 6);
                *(_QWORD *)(*(_QWORD *)(v6 + 40) + 8 * v48) |= v47;
              }
              v36 = v34;
              *(_QWORD *)(v14 + 8 * (v21 & (v26 >> 6))) |= 1 << v26;
              *(_QWORD *)(*(_QWORD *)&v39 + 8 * (v26 & v19)) = v41;
              *(_QWORD *)(v40 + 8 * (v26 & v19)) = v42;
              *(_QWORD *)(*(_QWORD *)&v39 + 8 * v38) = 2;
              *(_QWORD *)(v14 + 8 * (v21 & (v34 >> 6))) &= ~(1 << v34);
              v28 = v26 + v30;
            }
            v37 = v28 == (_DWORD)v26;
            v26 = v36;
            if (v37)
              goto LABEL_38;
          }
          v49 = v26 & v19;
          v50 = *(_QWORD *)(v6 + 8);
          *(_QWORD *)(*(_QWORD *)v6 + 8 * v49) = v18;
          *(_QWORD *)(v50 + 8 * v49) = v59;
          if ((unint64_t)(v18 & 3) - 1 <= 1)
          {
            v51 = v27 & ((unint64_t)v26 >> 6);
            v52 = *(_QWORD *)(v6 + 40);
            *(_QWORD *)(*(_QWORD *)(v6 + 32) + 8 * v51) |= 1 << v26;
            v53 = 1 << v51;
            v54 = *(unsigned int *)(v6 + 60) & (v51 >> 6);
            *(_QWORD *)(v52 + 8 * v54) |= v53;
            ++*(_DWORD *)(v6 + 72);
          }
          *(_DWORD *)(*(_QWORD *)(v6 + 16) + 4 * v20) |= 1 << (v26 - v20);
          *(_QWORD *)(v14 + 8 * (v21 & (v26 >> 6))) |= 1 << v26;
          ++*(_DWORD *)(v6 + 68);
          v11 = v8 << 6;
          if (v10)
            continue;
          break;
        }
      }
      ++v8;
    }
    while (v8 <= *(_DWORD *)(a1 + 56));
    IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::swap(a1, (uint64_t *)a1, (uint64_t *)v6);
    v56 = 1;
  }
  else
  {
LABEL_39:
    v56 = 0;
  }
  v57 = IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::~IOGPUGenerationalSet(v6);
  MEMORY[0x212BDECF0](v57, 0x1030C408A7EA8B0);
  return v56;
}

void IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::swap(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *a2;
  *a2 = *a3;
  *a3 = v3;
  v4 = a2[1];
  a2[1] = a3[1];
  a3[1] = v4;
  v5 = a2[2];
  a2[2] = a3[2];
  a3[2] = v5;
  v6 = a2[3];
  a2[3] = a3[3];
  a3[3] = v6;
  v7 = a2[4];
  a2[4] = a3[4];
  a3[4] = v7;
  v8 = a2[5];
  a2[5] = a3[5];
  a3[5] = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 15);
  *((_DWORD *)a2 + 15) = *((_DWORD *)a3 + 15);
  *((_DWORD *)a3 + 15) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 12);
  *((_DWORD *)a2 + 12) = *((_DWORD *)a3 + 12);
  *((_DWORD *)a3 + 12) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 19);
  *((_DWORD *)a2 + 19) = *((_DWORD *)a3 + 19);
  *((_DWORD *)a3 + 19) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 13);
  *((_DWORD *)a2 + 13) = *((_DWORD *)a3 + 13);
  *((_DWORD *)a3 + 13) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 14);
  *((_DWORD *)a2 + 14) = *((_DWORD *)a3 + 14);
  *((_DWORD *)a3 + 14) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 16);
  *((_DWORD *)a2 + 16) = *((_DWORD *)a3 + 16);
  *((_DWORD *)a3 + 16) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 17);
  *((_DWORD *)a2 + 17) = *((_DWORD *)a3 + 17);
  *((_DWORD *)a3 + 17) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 18);
  *((_DWORD *)a2 + 18) = *((_DWORD *)a3 + 18);
  *((_DWORD *)a3 + 18) = v8;
  v9 = a2[10];
  a2[10] = a3[10];
  a3[10] = v9;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::~IOGPUGenerationalSet(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
  if (*(_QWORD *)a1)
  {
    free(*(void **)a1);
    *(_QWORD *)a1 = 0;
  }
  v3 = *(void **)(a1 + 8);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 8) = 0;
  }
  v4 = *(void **)(a1 + 24);
  if (v4)
  {
    free(v4);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    free(v5);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    free(v6);
    *(_QWORD *)(a1 + 40) = 0;
  }
  return a1;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

uint64_t IOGPUNotificationQueueGetTypeID()
{
  if (IOGPUNotificationQueueGetTypeID_onceToken != -1)
    dispatch_once(&IOGPUNotificationQueueGetTypeID_onceToken, &__block_literal_global_0);
  return kIOGPUNotificationQueueID;
}

uint64_t ioGPUNotificationQueueIODispatch(uint64_t a1)
{
  IODataQueueMemory *i;
  uint64_t result;
  const void *v4;
  uint32_t dataSize;
  void (**data)(_QWORD, _QWORD);
  uint64_t v7;

  data = 0;
  v7 = 0;
  dataSize = 16;
  for (i = *(IODataQueueMemory **)(a1 + 32); ; i = *(IODataQueueMemory **)(a1 + 32))
  {
    result = IODataQueueDequeue(i, &data, &dataSize);
    if ((_DWORD)result)
      break;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    v4 = data;
    data[2](data, v7);
    _Block_release(v4);
    data = 0;
    v7 = 0;
    dataSize = 16;
  }
  return result;
}

dispatch_semaphore_t *IOGPUNotificationQueueDidSubmit(dispatch_semaphore_t *result, int a2)
{
  dispatch_semaphore_t *v3;

  if (result)
  {
    v3 = result;
    result = (dispatch_semaphore_t *)CFGetTypeID(result);
    if (result == (dispatch_semaphore_t *)kIOGPUNotificationQueueID && a2 != 0)
    {
      do
      {
        result = (dispatch_semaphore_t *)dispatch_semaphore_signal(v3[8]);
        --a2;
      }
      while (a2);
    }
  }
  return result;
}

CFStringRef ioGPUNotificationQueueCopyFormatDescription(_QWORD *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  CFIndex v5;

  v4 = a1[3];
  v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOGPUNotificationQueue %p ID=0x%llu refcnt=%d>"), a1, v4, v5);
}

CFStringRef ioGPUNotificationQueueCopyDebugDescription(_QWORD *a1)
{
  uint64_t v2;
  CFIndex v3;

  v2 = a1[3];
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, CFSTR("<IOGPUNotificationQueue %p ID=0x%llu refcnt=%d>"), a1, v2, v3);
}

uint64_t IOGPUIOCommandQueueGetTypeID()
{
  if (IOGPUIOCommandQueueGetTypeID_onceToken != -1)
    dispatch_once(&IOGPUIOCommandQueueGetTypeID_onceToken, &__block_literal_global_1);
  return kIOGPUIOCommandQueueID;
}

_QWORD *IOGPUIOCommandQueueCreate(mach_port_t *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t Instance;
  _QWORD *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint32_t outputCnt;
  uint64_t v37[2];
  uint64_t output[3];
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  if (IOGPUIOCommandQueueGetTypeID_onceToken != -1)
    dispatch_once(&IOGPUIOCommandQueueGetTypeID_onceToken, &__block_literal_global_1);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v18)
      IOGPUIOCommandQueueCreate_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    return 0;
  }
  v8 = (_QWORD *)Instance;
  CFRetain(a1);
  v8[2] = a1;
  v8[3] = 0;
  v8[5] = 0;
  input[0] = a3;
  input[1] = a4;
  outputCnt = 2;
  if (IOConnectCallMethod(a1[5], 0x2Bu, input, 2u, 0, 0, output, &outputCnt, 0, 0))
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v9)
      IOGPUIOCommandQueueCreate_cold_4(v9, v10, v11, v12, v13, v14, v15, v16);
    v17 = a1;
    goto LABEL_17;
  }
  *(_OWORD *)(v8 + 3) = *(_OWORD *)output;
  v26 = (_QWORD *)IOGPUNotificationQueueCreate(a1, 0x2000u, 0x10u);
  v8[5] = v26;
  if (!v26)
  {
    v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v27)
      IOGPUIOCommandQueueCreate_cold_2(v27, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_16;
  }
  v37[0] = v8[3];
  v37[1] = (uint64_t)IOGPUNotificationQueueGetID(v26);
  if (IOConnectCallMethod(a1[5], 0x2Du, v37, 2u, 0, 0, 0, 0, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      IOGPUIOCommandQueueCreate_cold_3();
LABEL_16:
    v17 = (mach_port_t *)v8;
LABEL_17:
    CFRelease(v17);
    return 0;
  }
  return v8;
}

dispatch_queue_t *IOGPUIOCommandQueueSetDispatchQueue(dispatch_queue_t *result, NSObject *a2)
{
  dispatch_queue_t *v3;

  if (result)
  {
    v3 = result;
    result = (dispatch_queue_t *)CFGetTypeID(result);
    if (result == (dispatch_queue_t *)kIOGPUIOCommandQueueID)
      return IOGPUNotificationQueueSetDispatchQueue((dispatch_queue_t *)v3[5], a2, 2);
  }
  return result;
}

uint64_t IOGPUIOCommandQueueGetConnect(_QWORD *a1)
{
  uint64_t v1;

  v1 = 3758097090;
  if (a1 && CFGetTypeID(a1) == kIOGPUIOCommandQueueID)
    return *(unsigned int *)(a1[2] + 20);
  return v1;
}

_QWORD *IOGPUIOCommandQueueGetID(_QWORD *result)
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    if (CFGetTypeID(result) == kIOGPUIOCommandQueueID)
      return (_QWORD *)v1[3];
    else
      return 0;
  }
  return result;
}

void IOGPUIOCommandQueueRelease(const void *a1)
{
  if (a1)
  {
    if (CFGetTypeID(a1) == kIOGPUIOCommandQueueID)
      CFRelease(a1);
  }
}

_QWORD *IOGPUIOCommandQueueGetGlobalTraceObjectID(_QWORD *result)
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    if (CFGetTypeID(result) == kIOGPUIOCommandQueueID)
      return (_QWORD *)v1[4];
    else
      return 0;
  }
  return result;
}

uint64_t IOGPUIOCommandQueueSubmitIOCommands(uint64_t a1, _DWORD *a2, unsigned int a3)
{
  uint64_t v3;
  dispatch_semaphore_t *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = 3758097090;
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUIOCommandQueueID)
  {
    v7 = *(dispatch_semaphore_t **)(a1 + 40);
    if (!v7)
      return 3758096385;
    if (!a2)
      return v3;
    if (!*a2)
      return 3758096385;
    if (a3 <= 0x2000)
    {
      v17 = 24 * *a2 + 8;
      IOGPUNotificationQueueWillSubmit(v7, a3);
      v3 = IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x2Eu, (const uint64_t *)(a1 + 24), 1u, a2, v17, 0, 0, 0, 0);
      if ((_DWORD)v3)
      {
        v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
        if (v18)
          IOGPUIOCommandQueueSubmitIOCommands_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
        IOGPUNotificationQueueDidSubmit(*(dispatch_semaphore_t **)(a1 + 40), a3);
      }
    }
    else
    {
      v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
      v3 = 3758097131;
      if (v8)
        IOGPUIOCommandQueueSubmitIOCommands_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  return v3;
}

uint64_t IOGPUIOCommandQueueCreateIOCommandBuffer(uint64_t a1, _DWORD *a2, uint64_t *a3)
{
  uint64_t v3;
  BOOL v7;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint32_t outputCnt;
  uint64_t output[3];

  output[2] = *MEMORY[0x24BDAC8D0];
  v3 = 3758097090;
  if (a1)
  {
    v7 = CFGetTypeID((CFTypeRef)a1) != kIOGPUIOCommandQueueID || a2 == 0;
    if (!v7 && a3 != 0)
    {
      outputCnt = 2;
      v3 = IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x2Fu, (const uint64_t *)(a1 + 24), 1u, 0, 0, output, &outputCnt, 0, 0);
      if ((_DWORD)v3)
      {
        v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
        if (v9)
          IOGPUIOCommandQueueCreateIOCommandBuffer_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
        v17 = 0;
        *a2 = 0;
      }
      else
      {
        CFRetain((CFTypeRef)a1);
        v17 = output[1];
        *a2 = output[0];
      }
      *a3 = v17;
    }
  }
  return v3;
}

uint64_t IOGPUIOCommandQueueDestroyIOCommandBuffer(_QWORD *a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v2 = 3758097090;
  if (a1 && CFGetTypeID(a1) == kIOGPUIOCommandQueueID)
  {
    v5 = a1[2];
    input[0] = a1[3];
    input[1] = a2;
    v2 = IOConnectCallMethod(*(_DWORD *)(v5 + 20), 0x30u, input, 2u, 0, 0, 0, 0, 0, 0);
    if ((_DWORD)v2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        IOGPUIOCommandQueueDestroyIOCommandBuffer_cold_1();
    }
    else
    {
      CFRelease(a1);
    }
  }
  return v2;
}

uint64_t IOGPUIOCommandQueueTryCancelIOCommandBuffer(_QWORD *a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v2 = 3758097090;
  if (a1)
  {
    if (CFGetTypeID(a1) == kIOGPUIOCommandQueueID)
    {
      v5 = a1[2];
      input[0] = a1[3];
      input[1] = a2;
      v2 = IOConnectCallMethod(*(_DWORD *)(v5 + 20), 0x31u, input, 2u, 0, 0, 0, 0, 0, 0);
      if ((_DWORD)v2)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          IOGPUIOCommandQueueTryCancelIOCommandBuffer_cold_1();
      }
    }
  }
  return v2;
}

uint64_t IOGPUIOCommandQueuePerformIO(uint64_t a1)
{
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUIOCommandQueueID)
    return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x32u, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
  else
    return 3758097090;
}

uint64_t IOGPUIOCommandQueueIOCommandBufferComplete(uint64_t a1)
{
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUIOCommandQueueID)
    return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x33u, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
  else
    return 3758097090;
}

uint64_t IOGPUIOCommandQueueIOCommandBufferBarrierComplete(_QWORD *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v3 = 3758097090;
  if (a1)
  {
    if (CFGetTypeID(a1) == kIOGPUIOCommandQueueID)
    {
      v7 = a1[2];
      input[0] = a1[3];
      input[1] = a2;
      input[2] = a3;
      v3 = IOConnectCallMethod(*(_DWORD *)(v7 + 20), 0x34u, input, 3u, 0, 0, 0, 0, 0, 0);
      if ((_DWORD)v3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          IOGPUIOCommandQueueIOCommandBufferBarrierComplete_cold_1();
      }
    }
  }
  return v3;
}

void ioGPUIOCommandQueueFinalize(uint64_t a1)
{
  uint64_t v2;
  kern_return_t v3;
  _QWORD block[5];

  if (_cmdq_finalize_queue_once != -1)
    dispatch_once(&_cmdq_finalize_queue_once, &__block_literal_global_3);
  v2 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ioGPUIOCommandQueueFinalize_block_invoke_2;
    block[3] = &__block_descriptor_tmp_5;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)_cmdq_finalize_queue, block);
  }
  if (*(_QWORD *)(a1 + 24))
  {
    v3 = IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x2Cu, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
    if (v3)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOGPUCommandQueue delete failed with error 0x%x", v3);
  }
  *(_QWORD *)(a1 + 24) = 0;
  CFRelease(*(CFTypeRef *)(a1 + 16));
}

CFStringRef ioGPUIOCommandQueueCopyFormatDescription(_QWORD *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  CFIndex v5;

  v4 = a1[3];
  v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOGPUIOCommandQueue %p ID=0x%llu refcnt=%d>"), a1, v4, v5);
}

CFStringRef ioGPUIOCommandQueueCopyDebugDescription(_QWORD *a1)
{
  uint64_t v2;
  CFIndex v3;

  v2 = a1[3];
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, CFSTR("<IOGPUIOCommandQueue %p ID=0x%llu refcnt=%d>"), a1, v2, v3);
}

dispatch_queue_t __ioGPUIOCommandQueueFinalize_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.Metal.NotificationQueueCleaupQueue", 0);
  _cmdq_finalize_queue = (uint64_t)result;
  return result;
}

void __ioGPUIOCommandQueueFinalize_block_invoke_2(uint64_t a1)
{
  IOGPUNotificationQueueSetDispatchQueue(*(dispatch_queue_t **)(a1 + 32), 0, 0);
  IOGPUNotificationQueueRelease(*(const void **)(a1 + 32));
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t IOGPUDeviceGetTypeID()
{
  if (IOGPUDeviceGetTypeID_onceToken != -1)
    dispatch_once(&IOGPUDeviceGetTypeID_onceToken, &__block_literal_global_4);
  return kIOGPUDeviceID;
}

uint64_t IOGPUDeviceCreate(io_service_t a1)
{
  return IOGPUDeviceCreateWithAPIProperty(a1, 0, 0);
}

void IOGPUDeviceRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

uint64_t IOGPUDeviceGetConfig(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v6;
  uint64_t v13;

  v6 = 3758097090;
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUDeviceID)
  {
    v6 = 0;
    *a2 = *(_DWORD *)(a1 + 160);
    *a3 = *(_DWORD *)(a1 + 164);
    v13 = *(_QWORD *)(a1 + 176);
    *a4 = *(_QWORD *)(a1 + 168);
    *a5 = v13;
    *a6 = *(_DWORD *)(a1 + 184);
  }
  return v6;
}

uint64_t IOGPUDeviceGetName(mach_port_t *a1, char *a2, size_t a3)
{
  uint64_t v3;
  size_t v8;
  char outputStruct[64];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = 3758097090;
  v8 = 64;
  if (a1)
  {
    if (CFGetTypeID(a1) == kIOGPUDeviceID)
    {
      v3 = IOConnectCallStructMethod(a1[5], 1u, 0, 0, outputStruct, &v8);
      if (!(_DWORD)v3)
        strncpy(a2, outputStruct, a3);
    }
  }
  return v3;
}

uint64_t IOGPUDeviceTraceEventStart()
{
  return kdebug_trace();
}

uint64_t IOGPUDeviceTraceEventEnd()
{
  return kdebug_trace();
}

uint64_t IOGPUDeviceGetCurrentTraceFilter(mach_port_t *a1)
{
  uint64_t v1;
  size_t v4;
  uint64_t outputStruct;

  v1 = 3758097090;
  v4 = 8;
  if (a1 && CFGetTypeID(a1) == kIOGPUDeviceID)
  {
    outputStruct = 0;
    return IOConnectCallMethod(a1[5], 3u, 0, 0, 0, 0, 0, 0, &outputStruct, &v4);
  }
  return v1;
}

void *IOGPUDeviceSetWaitForGPUCallback(uint64_t a1, void *aBlock)
{
  void *result;

  result = _Block_copy(aBlock);
  *(_QWORD *)(a1 + 112) = result;
  return result;
}

uint64_t IOGPUDeviceGetMemoryData(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t result;
  size_t outputStructCnt;
  __int128 outputStruct;
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  outputStruct = 0u;
  outputStructCnt = 48;
  result = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x16u, 0, 0, &outputStruct, &outputStructCnt);
  if (!(_DWORD)result)
  {
    if (a2)
      *a2 = outputStruct;
    if (a3)
      *a3 = *((_QWORD *)&outputStruct + 1);
    if (a4)
      *a4 = v16;
    if (a5)
      *a5 = *((_QWORD *)&v16 + 1);
    if (a6)
      *a6 = v17;
    if (a7)
      *a7 = *((_QWORD *)&v17 + 1);
  }
  return result;
}

uint64_t IOGPUDeviceGetAppGPURole(uint64_t a1, int a2, _DWORD *a3)
{
  uint64_t result;
  mach_port_t v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097088;
  if (a1)
  {
    v5 = *(_DWORD *)(a1 + 20);
    if (v5)
    {
      output = 0;
      input[0] = a2;
      outputCnt = 1;
      result = IOConnectCallScalarMethod(v5, 0x23u, input, 1u, &output, &outputCnt);
      if (!(_DWORD)result)
        *a3 = output;
    }
  }
  return result;
}

uint64_t IOGPUDeviceSetDisplayParams(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  mach_port_t v5;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  result = 3758097088;
  if (a1)
  {
    v5 = *(_DWORD *)(a1 + 20);
    if (v5)
    {
      input[0] = a2;
      input[1] = a3;
      return IOConnectCallScalarMethod(v5, 0x21u, input, 2u, 0, 0);
    }
  }
  return result;
}

uint64_t IOGPUDeviceCreateVNIODesc(_DWORD *cf, int a2, _DWORD *a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint32_t outputCnt;
  _DWORD input[7];

  *(_QWORD *)&input[5] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097088;
  input[0] = a2;
  if (cf)
  {
    if (cf[5])
    {
      if (CFGetTypeID(cf) == kIOGPUDeviceID)
      {
        v4 = 3758097090;
        if (a3)
        {
          if (a4)
          {
            outputCnt = 2;
            v4 = IOConnectCallMethod(cf[5], 0x29u, (const uint64_t *)input, 1u, 0, 0, (uint64_t *)&input[1], &outputCnt, 0, 0);
            if ((_DWORD)v4)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                IOGPUDeviceCreateVNIODesc_cold_1();
              v8 = 0;
              *a3 = 0;
            }
            else
            {
              v8 = *(_QWORD *)&input[3];
              *a3 = input[1];
            }
            *a4 = v8;
          }
        }
      }
    }
  }
  return v4;
}

uint64_t IOGPUDeviceDestroyVNIODesc(_DWORD *cf, int a2)
{
  uint64_t v2;
  uint64_t input;

  v2 = 3758097088;
  LODWORD(input) = a2;
  if (cf && cf[5] && CFGetTypeID(cf) == kIOGPUDeviceID)
    return IOConnectCallMethod(cf[5], 0x2Au, &input, 1u, 0, 0, 0, 0, 0, 0);
  return v2;
}

uint64_t IOGPUDeviceCreateDeviceAssertion(_DWORD *cf, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v4;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097088;
  if (cf)
  {
    if (cf[5])
    {
      if (CFGetTypeID(cf) == kIOGPUDeviceID)
      {
        input[0] = a2;
        input[1] = a3;
        output = 0;
        outputCnt = 1;
        v4 = IOConnectCallScalarMethod(cf[5], 0x37u, input, 2u, &output, &outputCnt);
        if (!(_DWORD)v4)
          *a4 = output;
      }
    }
  }
  return v4;
}

void ioGPUDeviceFinalize(uint64_t a1)
{
  void *v2;
  BOOL v3;
  os_unfair_lock_s *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  void (**v8)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unsigned int *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;

  _Block_release(*(const void **)(a1 + 112));
  *(_QWORD *)(a1 + 112) = 0;
  v2 = *(void **)(a1 + 32);
  if (v2)
    v3 = v2 == (void *)(a1 + 24);
  else
    v3 = 1;
  if (!v3)
    free(v2);
  IOConnectRelease(*(_DWORD *)(a1 + 20));
  *(_DWORD *)(a1 + 20) = 0;
  v4 = (os_unfair_lock_s *)(a1 + 120);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
  v7 = *(_QWORD **)(a1 + 128);
  v5 = (_QWORD *)(a1 + 128);
  v6 = v7;
  if (v7)
  {
    v8 = (void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x24BDAC928];
    v9 = (unsigned int *)MEMORY[0x24BDAEC58];
    do
    {
      v10 = (_QWORD *)v6[2];
      if (*v8)
        (*v8)(1677721632, *v9, *v6, *((unsigned int *)v6 + 2), 0, 0);
      v11 = (_QWORD *)*v5;
      v12 = v5;
      if ((_QWORD *)*v5 != v6)
      {
        do
        {
          v13 = v11;
          v11 = (_QWORD *)v11[2];
        }
        while (v11 != v6);
        v12 = v13 + 2;
      }
      *v12 = v6[2];
      free(v6);
      v6 = v10;
    }
    while (v10);
  }
  os_unfair_lock_unlock(v4);
}

CFStringRef ioGPUDeviceCopyFormatDescription(unsigned int *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  CFIndex v5;

  v4 = a1[5];
  v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOGPUDevice %p connect=%08x refcnt=%d>"), a1, v4, v5);
}

CFStringRef ioGPUDeviceCopyDebugDescription(unsigned int *a1)
{
  uint64_t v2;
  CFIndex v3;

  v2 = a1[5];
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, CFSTR("<IOGPUDevice %p connect=%08x refcnt=%d>"), a1, v2, v3);
}

void _eventMisused()
{
  NSLog(CFSTR("MTLEvent passed to API expecting MTLSharedEvent"));
}

void IOGPUKillClient_LeakingCommandQueue()
{
  abort();
}

uint64_t IOGPUCommandQueueGetTypeID()
{
  if (IOGPUCommandQueueGetTypeID_onceToken != -1)
    dispatch_once(&IOGPUCommandQueueGetTypeID_onceToken, &__block_literal_global_5);
  return kIOGPUCommandQueueID;
}

mach_port_t *IOGPUCommandQueueCreate(mach_port_t *a1)
{
  return IOGPUCommandQueueCreateWithQoS(a1, 2, 0);
}

uint64_t IOGPUCommandQueueSetQualityOfService(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x1Cu, (const uint64_t *)(a1 + 24), 1u, inputStruct, 4uLL, 0, 0, 0, 0);
}

void IOGPUCommandQueueDispatchAvailableCompletionNotifications(uint64_t a1)
{
  IOGPUNotificationQueueDispatchAvailableCompletionNotifications(*(_QWORD *)(a1 + 40));
}

uint64_t IOGPUCommandQueueSetResourceGroups(uint64_t a1, uintptr_t p2, uintptr_t a3)
{
  uintptr_t v4;
  io_connect_t v5;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 20);
  if (p2 <= 1)
    a3 = *(unsigned int *)a3;
  return IOConnectTrap3(v5, 7u, v4, p2, a3);
}

CFStringRef ioGPUCommandQueueCopyFormatDescription(_QWORD *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  CFIndex v5;

  v4 = a1[3];
  v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOGPUCommandQueue %p ID=0x%llu refcnt=%d>"), a1, v4, v5);
}

CFStringRef ioGPUCommandQueueCopyDebugDescription(_QWORD *a1)
{
  uint64_t v2;
  CFIndex v3;

  v2 = a1[3];
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, CFSTR("<IOGPUCommandQueue %p ID=0x%llu refcnt=%d>"), a1, v2, v3);
}

uint64_t IOGPUResourceGetTypeID()
{
  if (IOGPUResourceGetTypeID_onceToken != -1)
    dispatch_once(&IOGPUResourceGetTypeID_onceToken, &__block_literal_global_6);
  return kIOGPUResourceID;
}

uint64_t IOGPUResourceGetDataSize(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t IOGPUResourceGetGPUVirtualAddressLength(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

uint64_t IOGPUResourceGetPrivate(uint64_t a1)
{
  if (*(_DWORD *)(*(_QWORD *)(a1 + 16) + 52))
    return a1 + 112;
  else
    return 0;
}

_QWORD *IOGPUResourceGetClientSharedPrivate(_QWORD *result)
{
  _QWORD *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (IOGPUResourceGetTypeID_onceToken != -1)
      dispatch_once(&IOGPUResourceGetTypeID_onceToken, &__block_literal_global_6);
    if (v2 == kIOGPUResourceID && *(_DWORD *)(v1[2] + 44))
      return (_QWORD *)(v1[9] + 128);
    else
      return 0;
  }
  return result;
}

uint64_t IOGPUResourceTestEvent(uint64_t a1, unsigned int a2)
{
  return IOGPUDeviceTestEventFast(*(_QWORD *)(a1 + 16), (_DWORD *)(*(_QWORD *)(a1 + 72) + ((unint64_t)a2 << 6)));
}

CFTypeID IOGPUResourceFinishEvent(uint64_t a1, unsigned int a2)
{
  uintptr_t v3;
  CFTypeID result;
  uintptr_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  result = IOGPUDeviceTestEventFast(*(_QWORD *)(a1 + 16), (_DWORD *)(*(_QWORD *)(a1 + 72) + ((unint64_t)a2 << 6)));
  if (a1)
  {
    if (!(_DWORD)result)
    {
      result = CFGetTypeID((CFTypeRef)a1);
      if (result == kIOGPUResourceID)
      {
        v5 = *(unsigned int *)(a1 + 48);
        v6 = *(_QWORD *)(a1 + 16);
        v7 = *(_QWORD *)(v6 + 112);
        if (v7)
        {
          (*(void (**)(void))(v7 + 16))();
          v6 = *(_QWORD *)(a1 + 16);
        }
        return IOConnectTrap2(*(_DWORD *)(v6 + 20), 2u, v5, v3);
      }
    }
  }
  return result;
}

uint64_t IOGPUResourceCheckSysMem(uint64_t a1, int a2)
{
  if ((*(_BYTE *)(a1 + 52) & 0x80) != 0)
    return IOGPUDeviceTestEventFast(*(_QWORD *)(a1 + 16), (_DWORD *)(*(_QWORD *)(a1 + 72) + ((unint64_t)(a2 == 0) << 6)));
  else
    return 1;
}

CFTypeID IOGPUResourceFinishSysMem(CFTypeID result, int a2)
{
  if ((*(_BYTE *)(result + 52) & 0x80) != 0)
    return IOGPUResourceFinishEvent(result, a2 == 0);
  return result;
}

IOSurfaceRef IOGPUResourceCreateIOSurface(uint64_t a1, uint64_t a2, uint64_t a3)
{
  IOSurfaceRef v3;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = *(unsigned int *)(a1 + 48);
  input[1] = a2;
  input[2] = a3;
  output = 0;
  outputCnt = 1;
  v3 = 0;
  if (!IOConnectCallScalarMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x25u, input, 3u, &output, &outputCnt))
  {
    v3 = IOSurfaceLookupFromMachPort(output);
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], output, 0, -1);
  }
  return v3;
}

uint64_t IOGPUResourceGroupUpdateResources(uint64_t a1, uintptr_t p2, uintptr_t p3, uintptr_t a4, _QWORD *a5)
{
  unint64_t v8;
  uintptr_t v9;
  io_connect_t v11;
  uint64_t input;
  uintptr_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (p2 <= 0x100 && a4 <= 0x100)
    JUMPOUT(0x212BDE99CLL);
  if (a4)
  {
    if (a4 <= 0x100)
    {
      if (a4 == 1)
      {
        v8 = *a5;
        v9 = HIDWORD(*a5);
      }
      else
      {
        v8 = 0;
        v9 = 0;
      }
      v11 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 20);
      if (a4 <= 1)
        a5 = (_QWORD *)v8;
      IOConnectTrap4(v11, 5u, *(unsigned int *)(a1 + 48), a4, (uintptr_t)a5, v9);
      if (!p2)
        return 0;
      goto LABEL_9;
    }
    input = *(unsigned int *)(a1 + 48);
    v13 = a4;
    IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x36u, &input, 2u, a5, 8 * a4, 0, 0, 0, 0);
  }
  if (!p2)
    return 0;
LABEL_9:
  if (p2 > 0x100)
  {
    input = *(unsigned int *)(a1 + 48);
    v13 = p2;
    return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x35u, &input, 2u, (const void *)p3, 4 * p2, 0, 0, 0, 0);
  }
  else
  {
    if (p2 == 1)
      p3 = *(unsigned int *)p3;
    return IOConnectTrap3(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 4u, *(unsigned int *)(a1 + 48), p2, p3);
  }
}

unint64_t IOGPUResourceGroupGetAllocationSize(uint64_t a1)
{
  return atomic_load(*(unint64_t **)(a1 + 72));
}

uint64_t IOGPUResourceDetachBacking(uint64_t a1)
{
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = *(unsigned int *)(a1 + 48);
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x26u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOGPUResourceReplaceBackingWithBytes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  _QWORD inputStruct[3];

  v3 = *(_DWORD *)(a1 + 48);
  inputStruct[1] = a2;
  inputStruct[0] = v3;
  inputStruct[2] = a3;
  return IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x27u, 0, 0, inputStruct, 0x18uLL, 0, 0, 0, 0);
}

uint64_t IOGPUResourceReplaceBackingWithRanges(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5, _QWORD *a6)
{
  unsigned int v8;
  char v9;
  uint64_t result;
  BOOL v11;
  uint32_t outputCnt;
  _QWORD inputStruct[3];
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  v8 = *(_DWORD *)(a1 + 48);
  inputStruct[1] = a2;
  outputCnt = 1;
  inputStruct[0] = v8;
  if (a5)
    v9 = 2;
  else
    v9 = 0;
  BYTE4(inputStruct[0]) = v9 | a4;
  inputStruct[2] = a3;
  result = IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), 0x28u, 0, 0, inputStruct, 0x18uLL, output, &outputCnt, 0, 0);
  if ((_DWORD)result)
    v11 = 1;
  else
    v11 = a5 == 0;
  if (!v11)
    *a6 = output[0];
  return result;
}

CFStringRef ioGPUResourceCopyFormatDescription(unsigned int *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  CFIndex v5;

  v4 = a1[12];
  v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOGPUResource %p id=%08x refcnt=%d>"), a1, v4, v5);
}

CFStringRef ioGPUResourceCopyDebugDescription(unsigned int *a1)
{
  uint64_t v2;
  CFIndex v3;

  v2 = a1[12];
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, CFSTR("<IOGPUResource %p id=%08x refcnt=%d>"), a1, v2, v3);
}

uint64_t IOGPUDeviceTestEventFast(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t result;
  int v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *a2 | 0x8000;
  v4 = __clz(__rbit32(v3));
  result = 1;
  if (v4 != 15)
  {
    while (1)
    {
      v6 = a2[v4 + 1];
      if (v6 << 24 != -16777216 && (int)((v6 & 0xFFFFFF00) - **(_DWORD **)(v2 + 8 * (char)v6)) > 0)
        break;
      v3 ^= 1 << v4;
      v4 = __clz(__rbit32(v3));
      if (v4 >= 0xF)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t IOGPUResourceListAddResourceNoThreshold(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v3 = *(unsigned int *)(a2 + 16);
  v4 = (0x9E3779B97F4A7C15 * v3) >> -*(_BYTE *)(a1 + 488);
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 456) + 4 * v4);
  do
  {
    if (!v5)
      return _ioGPUResourceListAddResourceEntry(a1, a2, a3, 1);
    v6 = __clz(__rbit32(v5));
    v5 &= ~(1 << v6);
    v7 = (v6 + v4) & (*(_DWORD *)(a1 + 480) - 1);
    v8 = *(_QWORD *)(a1 + 472);
    v9 = *(_QWORD *)(v8 + 8 * v7);
  }
  while ((*(_DWORD *)(v8 + 8 * v7) & 0xFFFFFF) != (_DWORD)v3);
  v10 = (unsigned __int16)(HIWORD(v9) | a3);
  if (v10 != HIWORD(v9))
  {
    *(_QWORD *)(v8 + 8 * v7) = v9 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 48);
    *(_WORD *)(*(_QWORD *)(a1 + 512) + (((v9 >> 27) & 0x1FFFFF) << 6) + 2 * ((v9 >> 24) & 7) + 48) = HIWORD(v9) | a3;
    v9 = v9 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 48);
  }
  return (v9 >> 24) & 0xFFFFFF;
}

BOOL IOGPUResourceListMerge(uint64_t a1, uint64_t a2)
{
  return _ioGPUResourceListMergeGroup(a1, a2 + 32, *(_DWORD *)(a2 + 28));
}

BOOL _ioGPUResourceListMergeGroup(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;

  if (a3)
  {
    v5 = 0;
    v6 = 0;
    v7 = a2;
    v8 = a3;
    while (1)
    {
      v9 = a2 + (v5 << 6);
      v10 = *(unsigned __int16 *)(v9 + 62);
      if (*(_WORD *)(v9 + 62))
        break;
LABEL_7:
      ++v5;
      v7 += 64;
      v6 = v5 >= v8;
      if (v5 == v8)
        return 1;
    }
    v11 = 0;
    while (1)
    {
      v16 = 0;
      v12 = (_DWORD *)(v7 + 4 * v11);
      LODWORD(v16) = *v12;
      v13 = (v12[6] << 10);
      v15[0] = 0;
      v15[1] = v13;
      if (IOGPUResourceListAddResource(a1, (uint64_t)v15, *(unsigned __int16 *)(v7 + 2 * v11 + 48)) == -1)
        break;
      if (v10 == ++v11)
        goto LABEL_7;
    }
  }
  else
  {
    return 1;
  }
  return v6;
}

BOOL IOGPUResourceListMergeLists(uint64_t a1, uint64_t a2)
{
  return _ioGPUResourceListMergeGroup(a1, *(_QWORD *)(a2 + 512), *(_DWORD *)(a2 + 544));
}

uint64_t IOGPUResourceListShowResources(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(unsigned int *)(result + 544);
  if ((_DWORD)v1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(result + 512);
    v4 = v3;
    do
    {
      v5 = v3 + (v2 << 6);
      v6 = *(unsigned __int16 *)(v5 + 62);
      if (*(_WORD *)(v5 + 62))
      {
        v7 = 0;
        do
        {
          result = printf("Resource at %d(%d,%d) is %08x\n", (8 * v2) | v7, v2, v7, *(_DWORD *)(v4 + 4 * v7));
          ++v7;
        }
        while (v6 != v7);
      }
      ++v2;
      v4 += 64;
    }
    while (v2 != v1);
  }
  return result;
}

void ioGPUResourceListRebuild(uint64_t a1)
{
  unsigned int v1;
  unsigned int v2;
  void *v4;
  uint64_t v5;
  _DWORD *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  unint64_t v9;
  unsigned __int16 *v10;
  int *v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  _DWORD *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 480);
  v2 = 2 * v1;
  *(_DWORD *)(a1 + 480) = 2 * v1;
  ++*(_DWORD *)(a1 + 488);
  *(_DWORD *)(a1 + 484) = 2 * v1 - 1;
  *(_DWORD *)(a1 + 496) = ((v1 >> 5) & 0x3FFFFFF) - 1;
  if (((2 * v1) & 0x80000000) != 0)
  {
LABEL_18:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "ioGPUResourceListRebuild() failed.  Hash limit reached", buf, 2u);
    }
    abort();
  }
  while (1)
  {
    v4 = *(void **)(a1 + 456);
    if (*(_DWORD *)(a1 + 492) >= v2)
    {
      bzero(v4, 4 * v2);
      bzero(*(void **)(a1 + 464), (unint64_t)*(unsigned int *)(a1 + 480) >> 3);
    }
    else
    {
      free(v4);
      free(*(void **)(a1 + 472));
      free(*(void **)(a1 + 464));
      *(_QWORD *)(a1 + 456) = malloc_type_calloc(*(unsigned int *)(a1 + 480), 4uLL, 0x100004052888210uLL);
      *(_QWORD *)(a1 + 472) = malloc_type_malloc(8 * *(unsigned int *)(a1 + 480), 0x100004000313F17uLL);
      *(_QWORD *)(a1 + 464) = malloc_type_calloc((unint64_t)*(unsigned int *)(a1 + 480) >> 3, 1uLL, 0x95E4CA4AuLL);
      *(_DWORD *)(a1 + 492) = *(_DWORD *)(a1 + 480);
    }
    v17 = *(unsigned int *)(a1 + 544);
    if (!(_DWORD)v17)
      break;
    v5 = 0;
    v6 = *(_DWORD **)(a1 + 512);
    v7 = (unsigned __int16 *)(v6 + 12);
    v18 = v6;
    while (!HIWORD(v18[16 * v5 + 15]))
    {
LABEL_11:
      ++v5;
      v6 += 16;
      v7 += 32;
      if (v5 == v17)
        return;
    }
    v8 = 0;
    v9 = (unint64_t)HIWORD(v18[16 * v5 + 15]) << 24;
    v10 = v7;
    v11 = v6;
    while (1)
    {
      v12 = *v11++;
      v13 = v12 & 0xFFFFFF;
      v14 = *v10++;
      if ((ioGPUResourceListAddHashValue(a1, v13 | ((unint64_t)v14 << 48) | ((v5 << 27) | v8) & 0xFFFFFF000000) & 1) == 0)break;
      v8 += 0x1000000;
      if (v9 == v8)
        goto LABEL_11;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v16 = *(_DWORD *)(a1 + 480);
      *(_DWORD *)buf = 67109376;
      v20 = v16;
      v21 = 1024;
      v22 = 2 * v16;
      _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "intermediate rebuild failed, trying larger hash table %d -> %d...\n", buf, 0xEu);
    }
    v15 = *(_DWORD *)(a1 + 480);
    v2 = 2 * v15;
    *(_DWORD *)(a1 + 480) = 2 * v15;
    ++*(_DWORD *)(a1 + 488);
    *(_DWORD *)(a1 + 484) = 2 * v15 - 1;
    *(_DWORD *)(a1 + 496) = ((v15 >> 5) & 0x3FFFFFF) - 1;
    if (((2 * v15) & 0x80000000) != 0)
      goto LABEL_18;
  }
}

void IOGPUMetalSuballocatorDestroy(IOGPUMetalSuballocator *a1)
{
  void *v1;

  if (!a1)
    IOGPUMetalSuballocatorDestroy_cold_1();
  IOGPUMetalSuballocator::~IOGPUMetalSuballocator(a1);
  free(v1);
}

void IOGPUMetalSuballocator::~IOGPUMetalSuballocator(IOGPUMetalSuballocator *this)
{
  uint64_t i;

  for (i = 2728; i != -88; i -= 88)
    IOGPUMetalSuballocatorHeap::~IOGPUMetalSuballocatorHeap((IOGPUMetalSuballocatorHeap *)((char *)this + i));
}

void IOGPUMetalSuballocatorHeap::~IOGPUMetalSuballocatorHeap(IOGPUMetalSuballocatorHeap *this)
{
  uint64_t i;
  void *v3;
  void *v4;

  for (i = *(_QWORD *)this; i != *((_QWORD *)this + 1); i += 64)
  {
    if (*(_DWORD *)(i + 48))
      __assert_rtn("~IOGPUMetalSuballocatorHeap", "IOGPUMetalSuballocator.mm", 97, "false && \"At least one suballocation was not freed before suballocator is destroyed, primary buffer is leaked!\"");
  }
  std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::destroy((uint64_t)this + 48, *((_QWORD **)this + 7));
  v3 = (void *)*((_QWORD *)this + 3);
  if (v3)
  {
    *((_QWORD *)this + 4) = v3;
    free(v3);
  }
  v4 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v4;
    free(v4);
  }
}

void std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::destroy(a1, a2[1]);
    free(a2);
  }
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_21166FB24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *__p,uint64_t a37)
{
  uint64_t v37;
  void *v39;

  if (__p)
    operator delete(__p);
  v39 = *(void **)(v37 - 216);
  if (v39)
  {
    *(_QWORD *)(v37 - 208) = v39;
    operator delete(v39);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *__copy_helper_block_e8_64c66_ZTSNSt3__16vectorI24IOGPUIODecompressionArgsNS_9allocatorIS1_EEEE(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v2 = (_QWORD *)(a1 + 64);
  v2[2] = 0;
  return std::vector<IOGPUIODecompressionArgs>::__init_with_size[abi:ne180100]<IOGPUIODecompressionArgs*,IOGPUIODecompressionArgs*>(v2, *(const void **)(a2 + 64), *(_QWORD *)(a2 + 72), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a2 + 72) - *(_QWORD *)(a2 + 64)) >> 3));
}

void __destroy_helper_block_e8_64c66_ZTSNSt3__16vectorI24IOGPUIODecompressionArgsNS_9allocatorIS1_EEEE(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(_QWORD *)(a1 + 72) = v2;
    operator delete(v2);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<IOGPUIODecompressionArgs>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(40 * a2);
}

_QWORD *std::vector<IOGPUIODecompressionArgs>::__init_with_size[abi:ne180100]<IOGPUIODecompressionArgs*,IOGPUIODecompressionArgs*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<IOGPUIODecompressionArgs>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_211671164(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<IOGPUIODecompressionArgs>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x666666666666667)
    std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IOGPUIODecompressionArgs>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

void IOGPUMetalCommandBufferStorageGrowSegmentList_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211652000, MEMORY[0x24BDACB70], a3, "%s: failed to allocate shmem for the segmentList, segmentListHeader is null", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void IOGPUMetalCommandBufferStorageGrowSegmentList_cold_2(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = *((_DWORD *)a1 + 2);
  v3 = *((_DWORD *)a1 + 3);
  v4 = 136315906;
  v5 = "IOGPUMetalCommandBufferStorageGrowSegmentList";
  v6 = 2048;
  v7 = v1;
  v8 = 1024;
  v9 = v2;
  v10 = 1024;
  v11 = v3;
  _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s: failed to allocate shmem for the segmentList {commandBufferID: 0x%llx, segmentCount: %u, reserved:%u}", (uint8_t *)&v4, 0x22u);
}

void _iogpuMetalCommandBufferStorageFree_cold_1()
{
  __assert_rtn("_iogpuMetalCommandBufferStorageFree", "IOGPUMetalCommandBufferStorage.m", 155, "!storage->segmentListShmem");
}

void _iogpuMetalCommandBufferStorageFree_cold_2()
{
  __assert_rtn("_iogpuMetalCommandBufferStorageFree", "IOGPUMetalCommandBufferStorage.m", 154, "!storage->kernelCommandBufferResource");
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_1()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer", "IOGPUMetalCommandBufferStorage.m", 346, "lastkernelCommandBufferResource");
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_2()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer", "IOGPUMetalCommandBufferStorage.m", 347, "storage->kernelCommandBufferStart && storage->kernelCommandBufferEnd && storage->kernelCommandBufferCurrent");
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_3()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer", "IOGPUMetalCommandBufferStorage.m", 348, "storage->kernelCommandBufferEnd >= storage->kernelCommandBufferStart");
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_4()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer", "IOGPUMetalCommandBufferStorage.m", 349, "storage->kernelCommandBufferCurrent >= storage->kernelCommandBufferStart");
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_5(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *(uint64_t **)(a1 + 120);
  v2 = *v1;
  v3 = *((_DWORD *)v1 + 2);
  LODWORD(v1) = *((_DWORD *)v1 + 3);
  v4 = 136316162;
  v5 = "IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer";
  v6 = 2048;
  v7 = v2;
  v8 = 1024;
  v9 = v3;
  v10 = 1024;
  v11 = (int)v1;
  v12 = 1024;
  v13 = 0;
  _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s: failed to allocate shmem to grow commandBuffer {commandBufferID: 0x%llx, segmentCount: %u, reserved:%u}, 0x%x bytes failed to be allocated", (uint8_t *)&v4, 0x28u);
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_6()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer", "IOGPUMetalCommandBufferStorage.m", 385, "bytes_allocated >= new_space_required");
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_7()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer", "IOGPUMetalCommandBufferStorage.m", 390, "NULL != lastkernelCommandBufferResource->_virtualAddress");
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_8()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer", "IOGPUMetalCommandBufferStorage.m", 391, "current_bytes_in_use < bytes_allocated");
}

void IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_2(int a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "IOGPUMetalCommandBufferStorageAllocResourceAtIndex";
  v3 = 1024;
  v4 = a1;
  _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s: failed to allocate pooled resource at dbClass: %d", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

void IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_3()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageAllocResourceAtIndex", "IOGPUMetalCommandBufferStorage.m", 402, "dbclass < storage->commandBufferResourceCount");
}

void IOGPUMetalCommandBufferStorageGrowDebugBuffer_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211652000, MEMORY[0x24BDACB70], a3, "%s: failed to allocate shmem for the enhanced error debug buffer, segmentListHeader is null", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void IOGPUMetalCommandBufferStorageGrowDebugBuffer_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_211652000, MEMORY[0x24BDACB70], v0, "%s: failed to allocate shmem for the enhanced error debug buffer {commandBufferID: 0x%llx}", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_1()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageAllocSidebandBuffer", "IOGPUMetalCommandBufferStorage.m", 1115, "storage");
}

void IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_2()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageAllocSidebandBuffer", "IOGPUMetalCommandBufferStorage.m", 1116, "storage->device");
}

void IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_3()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageAllocSidebandBuffer", "IOGPUMetalCommandBufferStorage.m", 1120, "sidebandPool");
}

void IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_4()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageAllocSidebandBuffer", "IOGPUMetalCommandBufferStorage.m", 1117, "storage->sidebandBuffer.shmem == nil");
}

void IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_1()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowSidebandBuffer", "IOGPUMetalCommandBufferStorage.m", 1143, "storage->sidebandBuffer.shmem != nil");
}

void IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211652000, MEMORY[0x24BDACB70], a3, "%s: failed to allocate shmem for the sideband buffer, segmentListHeader is null", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_211652000, MEMORY[0x24BDACB70], v0, "%s: failed to allocate shmem for the sideband buffer {commandBufferID: 0x%llx}", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void _updateResidencySets_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "IOGPUCommandQueueSetResourceGroups() failed: %08x", (uint8_t *)v1, 8u);
}

void IOGPUNotificationQueueCreate_cold_1()
{
  __assert_rtn("IOGPUNotificationQueueCreate", "IOGPUNotificationQueue.c", 151, "result.notificationqueue_id");
}

void IOGPUNotificationQueueSetDispatchQueue_cold_1()
{
  __assert_rtn("IOGPUNotificationQueueSetDispatchQueue", "IOGPUNotificationQueue.c", 207, "notificationQueueRef->dispatchMach == NULL");
}

void IOGPUNotificationQueueSetDispatchQueue_cold_2()
{
  __assert_rtn("IOGPUNotificationQueueSetDispatchQueue", "IOGPUNotificationQueue.c", 206, "notificationQueueRef->dispatchQueue == NULL");
}

void ioGPUNotificationQueueFinalize_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "IOGPUNotificationQueue delete failed with error 0x%x", (uint8_t *)v1, 8u);
}

void ioGPUNotificationQueueFinalize_cold_2()
{
  __assert_rtn("ioGPUNotificationQueueFinalize", "IOGPUNotificationQueue.c", 53, "!r->dispatchQueue");
}

void ioGPUNotificationQueueFinalize_cold_3()
{
  __assert_rtn("ioGPUNotificationQueueFinalize", "IOGPUNotificationQueue.c", 52, "!r->dispatchMach");
}

void IOGPUIOCommandQueueCreate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_211652000, MEMORY[0x24BDACB70], a3, "Failed to create IO Command Queue Alloc", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void IOGPUIOCommandQueueCreate_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_211652000, MEMORY[0x24BDACB70], a3, "Failed to create a Notification Queue for IO Command Queue", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void IOGPUIOCommandQueueCreate_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_211652000, MEMORY[0x24BDACB70], v0, "Failed to set Notification Queue for IO Command Queue: %08x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void IOGPUIOCommandQueueCreate_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_211652000, MEMORY[0x24BDACB70], a3, "Failed to create IO Command Queue", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void IOGPUIOCommandQueueSubmitIOCommands_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_211652000, MEMORY[0x24BDACB70], a3, "Failed to submit IO Command Buffers: Notification Count too large", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void IOGPUIOCommandQueueSubmitIOCommands_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_211652000, MEMORY[0x24BDACB70], a3, "Failed to submit IO Command Buffers", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void IOGPUIOCommandQueueCreateIOCommandBuffer_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_211652000, MEMORY[0x24BDACB70], a3, "Failed to create IO Command Buffer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void IOGPUIOCommandQueueDestroyIOCommandBuffer_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_211652000, MEMORY[0x24BDACB70], v0, "Failed to Destroy IO Command Buffer: 0x%08x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void IOGPUIOCommandQueueTryCancelIOCommandBuffer_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_211652000, MEMORY[0x24BDACB70], v0, "Failed to Try Cancel IO Command Buffer: 0x%08x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void IOGPUIOCommandQueueIOCommandBufferBarrierComplete_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_211652000, MEMORY[0x24BDACB70], v0, "Failed to Complete Barrier for IO Command Buffer: 0x%08x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void IOGPUMetalPooledResourceRelease_cold_1()
{
  __assert_rtn("IOGPUMetalPooledResourceRelease", "IOGPUMetalPooledResource.m", 25, "[pool isKindOfClass:[IOGPUMetalResourcePool class]]");
}

void IOGPUDeviceCreateWithAPIProperty_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to create an IOAccelDevice... IOServiceOpen returned kIOReturn(0x%X)", (uint8_t *)v1, 8u);
}

void IOGPUDeviceGetNextGlobalTraceID_cold_1()
{
  __assert_rtn("getNextGIDGroup", "IOGPUDeviceRef.c", 428, "0 != gid_group_data.gid_group_min");
}

void IOGPUDeviceCheckAndLogSoftFaultCount_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "GPU Soft Fault count: %lld\n", (uint8_t *)&v1, 0xCu);
}

void IOGPUDeviceCreateVNIODesc_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to create VNIO object", v0, 2u);
}

void IOGPUCommandQueueCreateWithQoS_cold_1()
{
  __assert_rtn("IOGPUCommandQueueCreateWithQoS", "IOGPUCommandQueue.c", 271, "result.command_queue_id");
}

void IOGPUCommandQueueCreateWithQoS_cold_2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to create an a notification queue for cmd queue", v0, 2u);
}

void IOGPUCommandQueueCreateWithQoS_cold_3(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to set notification queue for cmd queue: %08x", (uint8_t *)v1, 8u);
}

void ioGPUResourceFinalize_cold_1()
{
  __assert_rtn((const char *)0xFFFFFFFFFFFFFFFFLL, "/Library/Caches/com.apple.xbs/Sources/IOGPUFamily/IOGPU/IOGPUResourceRef.c", 65, "Resource freed while busy");
}

void IOGPUResourceListReset_cold_2()
{
  __assert_rtn("IOGPUResourceListReset", "IOGPUResourceList.m", 531, "(uint8_t *)&l->resourceGroups[l->capacity] <= storage->segmentListEnd");
}

void IOGPUMetalSuballocatorDestroy_cold_1()
{
  __assert_rtn("IOGPUMetalSuballocatorDestroy", "IOGPUMetalSuballocator.mm", 160, "suballocator");
}

void IOGPUMetalSuballocatorAllocate_cold_1()
{
  __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 169, "suballocator && record && options && \"Invalid pointer argument passed\"");
}

void IOGPUMetalSuballocatorFree_cold_1()
{
  __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 424, "suballocator && record && \"Invalid pointer argument passed\"");
}

void IOGPUMetalSuballocatorFree_cold_2()
{
  __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 426, "record->bufferOffset + record->length <= kBufferSize && \"Bad buffer offset\"");
}

void IOGPUMetalSuballocatorFree_cold_3()
{
  __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 428, "record->bufferIndex >= 0 && record->bufferIndex < kMaxNumBuffers && \"Bad buffer index\"");
}

void IOGPUMetalSuballocatorFree_cold_4()
{
  __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 427, "record->heapIndex >= 0 && record->heapIndex < kNumHeaps && \"Bad heap index\"");
}

void IOGPUMetalSuballocatorFree_cold_5()
{
  __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 425, "record->length > 0 && record->length <= kBufferSize && \"Bad buffer length\"");
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEE8](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t IOAccelMemoryInfoDeregisterAPICollectionBlock()
{
  return MEMORY[0x24BE514A8]();
}

uint64_t IOAccelMemoryInfoRegisterAPICollectionBlock()
{
  return MEMORY[0x24BE514B0]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectRelease(io_connect_t connect)
{
  return MEMORY[0x24BDD7F28](*(_QWORD *)&connect);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOConnectTrap1(io_connect_t connect, uint32_t index, uintptr_t p1)
{
  return MEMORY[0x24BDD7F50](*(_QWORD *)&connect, *(_QWORD *)&index, p1);
}

kern_return_t IOConnectTrap2(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2)
{
  return MEMORY[0x24BDD7F58](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2);
}

kern_return_t IOConnectTrap3(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3)
{
  return MEMORY[0x24BDD7F60](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3);
}

kern_return_t IOConnectTrap4(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3, uintptr_t p4)
{
  return MEMORY[0x24BDD7F68](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3, p4);
}

kern_return_t IOConnectTrap6(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3, uintptr_t p4, uintptr_t p5, uintptr_t p6)
{
  return MEMORY[0x24BDD7F78](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3, p4, p5, p6);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x24BDD7FA0]();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x24BDD7FB0](dataQueue, data, dataSize);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88B8](*(_QWORD *)&entry, plane, *(_QWORD *)&options, iterator);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

Boolean IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B30](buffer);
}

uint64_t IOSurfaceBindAccel()
{
  return MEMORY[0x24BDD8B38]();
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8B48](buffer, key);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BC0](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

size_t IOSurfaceGetElementHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C18](buffer);
}

uint64_t IOSurfaceGetGraphicsCommPageAddress()
{
  return MEMORY[0x24BDD8C38]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C68](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C88](buffer);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8D20](*(_QWORD *)&port);
}

uint64_t IOSurfaceSetOwnershipIdentity()
{
  return MEMORY[0x24BDD8DA8]();
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x24BDD8DB0](buffer, *(_QWORD *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x24BDD8DB8](buffer, key, value);
}

uint64_t MTLAddDevice()
{
  return MEMORY[0x24BDDD108]();
}

uint64_t MTLCPUCacheModeString()
{
  return MEMORY[0x24BDDD110]();
}

uint64_t MTLCalculateSourceBufferSizeAndAlignment()
{
  return MEMORY[0x24BDDD118]();
}

uint64_t MTLGetDisallowedTextureUsagesWhenSwizzling()
{
  return MEMORY[0x24BDDD240]();
}

uint64_t MTLGetEnvDefault()
{
  return MEMORY[0x24BDDD248]();
}

uint64_t MTLGetTextureLevelInfoForDeviceWithOptions()
{
  return MEMORY[0x24BDDD268]();
}

uint64_t MTLHazardTrackingModeString()
{
  return MEMORY[0x24BDDD270]();
}

uint64_t MTLIOQosClassForPriority()
{
  return MEMORY[0x24BDDD288]();
}

uint64_t MTLPackColor()
{
  return MEMORY[0x24BDDD298]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x24BDDD388]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x24BDDD390]();
}

uint64_t MTLPurgeableStateString()
{
  return MEMORY[0x24BDDD398]();
}

uint64_t MTLRangeAllocatorAllocate()
{
  return MEMORY[0x24BDDD3A0]();
}

uint64_t MTLRangeAllocatorAllocateRange()
{
  return MEMORY[0x24BDDD3A8]();
}

uint64_t MTLRangeAllocatorDeallocate()
{
  return MEMORY[0x24BDDD3B0]();
}

uint64_t MTLRangeAllocatorDestroy()
{
  return MEMORY[0x24BDDD3B8]();
}

uint64_t MTLRangeAllocatorGetFreeSize()
{
  return MEMORY[0x24BDDD3C0]();
}

uint64_t MTLRangeAllocatorGetMaxFreeSize()
{
  return MEMORY[0x24BDDD3C8]();
}

uint64_t MTLRangeAllocatorInit()
{
  return MEMORY[0x24BDDD3D0]();
}

uint64_t MTLRangeAllocatorInitWithStartRange()
{
  return MEMORY[0x24BDDD3D8]();
}

uint64_t MTLReleaseAssertionFailure()
{
  return MEMORY[0x24BDDD3E8]();
}

uint64_t MTLReportFailure()
{
  return MEMORY[0x24BDDD3F0]();
}

uint64_t MTLResourceListAddResource()
{
  return MEMORY[0x24BDDD400]();
}

uint64_t MTLResourceListPoolCreateResourceList()
{
  return MEMORY[0x24BDDD408]();
}

uint64_t MTLResourceListRelease()
{
  return MEMORY[0x24BDDD410]();
}

uint64_t MTLResourceOptionsString()
{
  return MEMORY[0x24BDDD418]();
}

uint64_t MTLStorageModeString()
{
  return MEMORY[0x24BDDD428]();
}

uint64_t MTLTextureSwizzleChannelsToKey()
{
  return MEMORY[0x24BDDD430]();
}

uint64_t MTLTextureSwizzleKeyToChannels()
{
  return MEMORY[0x24BDDD438]();
}

uint64_t MTLTextureSwizzleString()
{
  return MEMORY[0x24BDDD440]();
}

uint64_t MTLTextureTypeString()
{
  return MEMORY[0x24BDDD448]();
}

uint64_t MTLTextureUsageString()
{
  return MEMORY[0x24BDDD450]();
}

uint64_t MTLValidationEnabled()
{
  return MEMORY[0x24BDDD470]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CC3EF78(__p);
}

uint64_t operator delete()
{
  return off_24CC3EF80();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CC3EF88(__sz);
}

uint64_t operator new()
{
  return off_24CC3EF90();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

uint64_t _mtlValidateArgumentsForTextureViewOnDevice()
{
  return MEMORY[0x24BDDDA30]();
}

uint64_t _mtlValidateMTLTextureSwizzleKey()
{
  return MEMORY[0x24BDDDA38]();
}

uint64_t _mtlValidateStrideTextureParameters()
{
  return MEMORY[0x24BDDDA40]();
}

uint64_t _mtlValidateTextureUsage()
{
  return MEMORY[0x24BDDDA48]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x24BDADE40]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x24BDADE48]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x24BDADE50]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x24BDADE70]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x24BDADF98](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t kdebug_trace_string()
{
  return MEMORY[0x24BDAE960]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

uint64_t mach_right_send_release()
{
  return MEMORY[0x24BDAEC40]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAED00](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x24BDAF5B0](*(_QWORD *)&t, x);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}


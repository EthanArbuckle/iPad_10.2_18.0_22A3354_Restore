@implementation SCNetworkReachabilitySetDispatchQueue

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 16)))
    ____SCNetworkReachabilitySetDispatchQueue_block_invoke_cold_2();
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2 == *(void **)(v3 + 240))
  {
    *(_QWORD *)(v3 + 240) = 0;
    v2 = *(void **)(a1 + 40);
  }
  nw_release(v2);
  if (pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 16)))
    ____SCNetworkReachabilitySetDispatchQueue_block_invoke_cold_1();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  int FlagsFromPath;
  int interface_index;
  uint64_t count;
  uint64_t v8;
  NSObject *CrazyIvan46Path;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  if (pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 16)))
    ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_3();
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 112))
  {
    FlagsFromPath = __SCNetworkReachabilityGetFlagsFromPath(v4 + 193, (uint64_t)"Path updated", *(nw_path_t *)(v4 + 248), *(_DWORD *)(v4 + 80), *(_DWORD *)(v4 + 272), *(_QWORD *)(v4 + 280), *(unsigned __int8 *)(v4 + 288), *(_DWORD *)(v4 + 292));
    interface_index = nw_path_get_interface_index();
    count = nw_array_get_count();
    nw_release(*(void **)(*(_QWORD *)(a1 + 32) + 248));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = nw_retain(a2);
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(v8 + 80) <= 1u)
    {
      CrazyIvan46Path = __SCNetworkReachabilityCreateCrazyIvan46Path(*(NSObject **)(v8 + 248), *(NSObject **)(a1 + 40), *(NSObject **)(v8 + 232), 1);
      v8 = *(_QWORD *)(a1 + 32);
      if (CrazyIvan46Path)
      {
        v10 = CrazyIvan46Path;
        nw_release(*(void **)(v8 + 248));
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = v10;
        v8 = *(_QWORD *)(a1 + 32);
      }
    }
    v11 = *(_DWORD *)(v8 + 272);
    if (v11 == 2)
    {
      *(_DWORD *)(v8 + 272) = 0;
      __SCNetworkReachabilityRestartResolver((void **)v8, (uint64_t)"Path updated, restart DNS");
      v8 = *(_QWORD *)(a1 + 32);
      v11 = *(_DWORD *)(v8 + 272);
    }
    v12 = __SCNetworkReachabilityGetFlagsFromPath(v8 + 193, (uint64_t)"ShouldUpdateClient", *(nw_path_t *)(v8 + 248), *(_DWORD *)(v8 + 80), v11, *(_QWORD *)(v8 + 280), *(unsigned __int8 *)(v8 + 288), *(_DWORD *)(v8 + 292));
    v13 = nw_path_get_interface_index();
    v14 = nw_array_get_count();
    v15 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v8 + 113) && v12 == FlagsFromPath && v13 == interface_index && v14 == count)
    {
      result = pthread_mutex_unlock((pthread_mutex_t *)(v15 + 16));
      if ((_DWORD)result)
        ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_2();
    }
    else
    {
      return reachUpdateAndUnlock(v15);
    }
  }
  else
  {
    result = pthread_mutex_unlock((pthread_mutex_t *)(v4 + 16));
    if ((_DWORD)result)
      ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_1();
  }
  return result;
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_3(uint64_t a1)
{
  nw_resolver_cancel();
  nw_release(*(void **)(a1 + 32));
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_cold_1()
{
  __assert_rtn("__SCNetworkReachabilitySetDispatchQueue_block_invoke", "SCNetworkReachability.c", 1978, "_unlock_");
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_cold_2()
{
  __assert_rtn("__SCNetworkReachabilitySetDispatchQueue_block_invoke", "SCNetworkReachability.c", 1973, "_lock_");
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_1()
{
  __assert_rtn("__SCNetworkReachabilitySetDispatchQueue_block_invoke_2", "SCNetworkReachability.c", 2022, "_unlock_");
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_2()
{
  __assert_rtn("__SCNetworkReachabilitySetDispatchQueue_block_invoke_2", "SCNetworkReachability.c", 2019, "_unlock_");
}

void ____SCNetworkReachabilitySetDispatchQueue_block_invoke_2_cold_3()
{
  __assert_rtn("__SCNetworkReachabilitySetDispatchQueue_block_invoke_2", "SCNetworkReachability.c", 1983, "_lock_");
}

@end

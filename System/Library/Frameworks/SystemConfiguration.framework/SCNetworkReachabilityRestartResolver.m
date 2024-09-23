@implementation SCNetworkReachabilityRestartResolver

BOOL ____SCNetworkReachabilityRestartResolver_block_invoke_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *evaluator_for_endpoint;
  NSObject *v6;
  nw_endpoint_type_t type;
  nw_endpoint_type_t v8;
  int FlagsFromPath;
  const sockaddr *address;
  int v11;
  NSObject *CrazyIvan46Path;
  NSObject *v13;
  char *v14;
  int interface_index;
  uint64_t v16;
  _BOOL4 v17;
  _BOOL8 result;
  char *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v6 = nw_path_evaluator_copy_path();
  if (!v6)
  {
    FlagsFromPath = 0;
    goto LABEL_23;
  }
  v19 = 0;
  type = nw_endpoint_get_type(a3);
  v8 = type;
  if (type == nw_endpoint_type_address)
  {
    address = nw_endpoint_get_address(a3);
    if (!address)
    {
LABEL_16:
      CrazyIvan46Path = __SCNetworkReachabilityCreateCrazyIvan46Path(v6, a3, *(NSObject **)(*(_QWORD *)(a1 + 40) + 232), 0);
      if (CrazyIvan46Path)
      {
        v13 = CrazyIvan46Path;
        nw_release(v6);
        v6 = v13;
      }
      goto LABEL_18;
    }
    _SC_sockaddr_to_string((uint64_t)address, v20, 0x80uLL);
    goto LABEL_10;
  }
  if (type != nw_endpoint_type_url && type != nw_endpoint_type_host)
  {
    v11 = asprintf(&v19, "endpoint %zu, ?");
    goto LABEL_12;
  }
  if (nw_endpoint_get_hostname(a3))
  {
LABEL_10:
    v11 = asprintf(&v19, "endpoint %zu, %s");
LABEL_12:
    if (v11 < 0 && v19)
    {
      free(v19);
      v19 = 0;
    }
    if (v8 != nw_endpoint_type_address)
      goto LABEL_18;
    goto LABEL_16;
  }
LABEL_18:
  if (v19)
    v14 = v19;
  else
    v14 = "";
  FlagsFromPath = __SCNetworkReachabilityGetFlagsFromPath(*(_QWORD *)(a1 + 40) + 193, (uint64_t)v14, v6, 0, 0, 0, 0, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  if (v19)
    free(v19);
LABEL_23:
  interface_index = nw_path_get_interface_index();
  nw_release(v6);
  nw_release(evaluator_for_endpoint);
  v16 = *(_QWORD *)(a1 + 40);
  v17 = (*(_DWORD *)(v16 + 292) & 6) != 2;
  if ((FlagsFromPath & 4) != 0)
    v17 = (*(_DWORD *)(v16 + 292) & 2) == 0;
  result = 1;
  if ((FlagsFromPath & 2) != 0 && v17)
  {
    *(_DWORD *)(v16 + 292) = FlagsFromPath;
    *(_DWORD *)(v16 + 296) = interface_index;
    if ((FlagsFromPath & 4) == 0)
      return 0;
  }
  return result;
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v6;
  int FlagsFromPath;
  int interface_index;
  uint64_t count;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 16)))
    ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_3();
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 112))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    FlagsFromPath = __SCNetworkReachabilityGetFlagsFromPath(v6 + 193, *(_QWORD *)(a1 + 40), *(nw_path_t *)(v6 + 248), *(_DWORD *)(v6 + 80), *(_DWORD *)(v6 + 272), *(_QWORD *)(v6 + 280), *(unsigned __int8 *)(v6 + 288), *(_DWORD *)(v6 + 292));
    interface_index = nw_path_get_interface_index();
    count = nw_array_get_count();
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)(v10 + 272) = a2;
    nw_release(*(void **)(v10 + 280));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = nw_retain(a3);
    v11 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(v11 + 288) = 0;
    *(_QWORD *)(v11 + 292) = 0;
    nw_array_apply();
    v12 = *((unsigned __int8 *)v19 + 24);
    v13 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(v13 + 288) = v12;
    v14 = __SCNetworkReachabilityGetFlagsFromPath(v13 + 193, (uint64_t)"ShouldUpdateClient", *(nw_path_t *)(v13 + 248), *(_DWORD *)(v13 + 80), *(_DWORD *)(v13 + 272), *(_QWORD *)(v13 + 280), v12, *(_DWORD *)(v13 + 292));
    v15 = nw_path_get_interface_index();
    v16 = nw_array_get_count();
    v17 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v13 + 113) && v14 == FlagsFromPath && v15 == interface_index && v16 == count)
    {
      if (pthread_mutex_unlock((pthread_mutex_t *)(v17 + 16)))
        ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_2();
    }
    else
    {
      reachUpdateAndUnlock(v17);
    }
    _Block_object_dispose(&v18, 8);
  }
  else if (pthread_mutex_unlock((pthread_mutex_t *)(v6 + 16)))
  {
    ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_1();
  }
}

void ____SCNetworkReachabilityRestartResolver_block_invoke(uint64_t a1)
{
  nw_resolver_cancel();
  nw_release(*(void **)(a1 + 32));
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_110(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 16)))
    ____SCNetworkReachabilityRestartResolver_block_invoke_110_cold_2();
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2 == *(void **)(v3 + 264))
  {
    *(_QWORD *)(v3 + 264) = 0;
    v2 = *(void **)(a1 + 40);
  }
  nw_release(v2);
  if (pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 16)))
    ____SCNetworkReachabilityRestartResolver_block_invoke_110_cold_1();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_110_cold_1()
{
  __assert_rtn("__SCNetworkReachabilityRestartResolver_block_invoke", "SCNetworkReachability.c", 1774, "_unlock_");
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_110_cold_2()
{
  __assert_rtn("__SCNetworkReachabilityRestartResolver_block_invoke", "SCNetworkReachability.c", 1769, "_lock_");
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_1()
{
  __assert_rtn("__SCNetworkReachabilityRestartResolver_block_invoke_2", "SCNetworkReachability.c", 1907, "_unlock_");
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_2()
{
  __assert_rtn("__SCNetworkReachabilityRestartResolver_block_invoke_2", "SCNetworkReachability.c", 1904, "_unlock_");
}

void ____SCNetworkReachabilityRestartResolver_block_invoke_2_cold_3()
{
  __assert_rtn("__SCNetworkReachabilityRestartResolver_block_invoke_2", "SCNetworkReachability.c", 1778, "_lock_");
}

@end

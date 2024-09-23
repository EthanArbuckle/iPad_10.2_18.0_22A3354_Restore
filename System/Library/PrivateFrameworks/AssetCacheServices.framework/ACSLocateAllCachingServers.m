@implementation ACSLocateAllCachingServers

void ___ACSLocateAllCachingServers_block_invoke(uint64_t a1, uint64_t a2, CFArrayRef theArray, __CFError *Copy)
{
  const __CFArray *MutableCopy;
  CFIndex Count;
  NSObject *v9;
  int v10;
  uint64_t v11;
  CFAbsoluteTime v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[9];
  int v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFArray *v25;
  __int16 v26;
  __CFError *v27;
  __int16 v28;
  CFAbsoluteTime v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  MutableCopy = theArray;
  v32 = *MEMORY[0x1E0C80C00];
  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    MutableCopy = CFArrayCreateMutableCopy(0, Count, MutableCopy);
  }
  if (Copy)
    Copy = aclErrorCreateCopy(Copy);
  v9 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_DWORD *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 67110658;
    v19 = v10;
    v20 = 2080;
    v21 = v11;
    v22 = 2112;
    v23 = a2;
    v24 = 2112;
    v25 = MutableCopy;
    v26 = 2112;
    v27 = Copy;
    v28 = 2048;
    v29 = v12;
    v30 = 2048;
    v31 = v13;
    _os_log_impl(&dword_1D4CDC000, v9, OS_LOG_TYPE_DEFAULT, "#%08x %s -> [%@] results %@, error %@, elapsed %.3f/%.3f", buf, 0x44u);
  }
  v14 = *(NSObject **)(a1 + 64);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 0x40000000;
  v16[2] = ___ACSLocateAllCachingServers_block_invoke_68;
  v16[3] = &unk_1E9877D50;
  v15 = *(_QWORD *)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v16[5] = MutableCopy;
  v17 = *(_DWORD *)(a1 + 72);
  v16[6] = Copy;
  v16[7] = v15;
  v16[8] = v14;
  dispatch_async(v14, v16);
}

void ___ACSLocateAllCachingServers_block_invoke_68(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1)
      ___ACSLocateAllCachingServers_block_invoke_68_cold_2();
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    if (CFGetRetainCount(v3) != 1)
      ___ACSLocateAllCachingServers_block_invoke_68_cold_1();
    CFRetain(*(CFTypeRef *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    if (CFGetRetainCount(v4) <= 1)
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), (uint64_t)"results", *(_QWORD *)(a1 + 40));
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    if (CFGetRetainCount(v5) <= 1)
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), (uint64_t)"error", *(_QWORD *)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 48));
    v6 = *(const void **)(a1 + 48);
    if (v6)
      CFRelease(v6);
  }
  v7 = *(const void **)(a1 + 40);
  if (v7)
    CFRelease(v7);
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
}

void ___ACSLocateAllCachingServers_block_invoke_68_cold_1()
{
  __assert_rtn("_ACSLocateAllCachingServers_block_invoke", "AssetCacheLocator.c", 1145, "CFGetRetainCount(error) == 1");
}

void ___ACSLocateAllCachingServers_block_invoke_68_cold_2()
{
  __assert_rtn("_ACSLocateAllCachingServers_block_invoke", "AssetCacheLocator.c", 1144, "CFGetRetainCount(results) == 1");
}

@end

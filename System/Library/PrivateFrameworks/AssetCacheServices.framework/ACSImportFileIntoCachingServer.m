@implementation ACSImportFileIntoCachingServer

void __ACSImportFileIntoCachingServer_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1)
      __ACSImportFileIntoCachingServer_block_invoke_cold_1();
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(const void **)(a1 + 40);
  if (v3)
  {
    if (CFGetRetainCount(v3) <= 1)
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), (uint64_t)"error", *(_QWORD *)(a1 + 40));
    CFRelease(*(CFTypeRef *)(a1 + 40));
    v4 = *(const void **)(a1 + 40);
    if (v4)
      CFRelease(v4);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
}

void __ACSImportFileIntoCachingServer_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _xpc_connection_s *SharedLocatorConnection;
  _xpc_connection_s *v10;
  void *v11;
  NSObject *global_queue;
  NSObject *v13;
  int v14;
  uint64_t v15;
  CFErrorRef v16;
  CFAbsoluteTime v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD handler[4];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _xpc_connection_s *v25;
  int v26;
  _QWORD block[8];
  int v28;
  CFErrorRef v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  CFErrorRef v35;
  __int16 v36;
  CFAbsoluteTime v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  SharedLocatorConnection = aclGetSharedLocatorConnection(*(unsigned int *)(a1 + 80), &v29, a3, a4, a5, a6, a7, a8);
  if (SharedLocatorConnection)
  {
    v10 = SharedLocatorConnection;
    xpc_retain(SharedLocatorConnection);
    v11 = *(void **)(a1 + 64);
    global_queue = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = __ACSImportFileIntoCachingServer_block_invoke_2_130;
    handler[3] = &unk_1E9877F28;
    v26 = *(_DWORD *)(a1 + 80);
    v22 = *(_QWORD *)(a1 + 56);
    v23 = *(_QWORD *)(a1 + 48);
    v21 = *(_OWORD *)(a1 + 32);
    v24 = *(_QWORD *)(a1 + 72);
    v25 = v10;
    xpc_connection_send_message_with_reply(v10, v11, global_queue, handler);
    xpc_release(*(xpc_object_t *)(a1 + 64));
  }
  else
  {
    v13 = qword_1ED1B39F0;
    if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_DWORD *)(a1 + 80);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = v29;
      v17 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
      *(_DWORD *)buf = 67109890;
      v31 = v14;
      v32 = 2080;
      v33 = v15;
      v34 = 2112;
      v35 = v16;
      v36 = 2048;
      v37 = v17;
      _os_log_impl(&dword_1D4CDC000, v13, OS_LOG_TYPE_DEFAULT, "#%08x %s -> error: %@, elapsed %.3f", buf, 0x26u);
    }
    CFRelease(*(CFTypeRef *)(a1 + 56));
    xpc_release(*(xpc_object_t *)(a1 + 64));
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
    {
      v19 = *(NSObject **)(a1 + 72);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = __ACSImportFileIntoCachingServer_block_invoke_127;
      block[3] = &unk_1E9877ED8;
      block[4] = v18;
      block[5] = v29;
      v28 = *(_DWORD *)(a1 + 80);
      block[6] = *(_QWORD *)(a1 + 40);
      block[7] = v19;
      dispatch_async(v19, block);
    }
    else if (v29)
    {
      CFRelease(v29);
    }
  }
}

void __ACSImportFileIntoCachingServer_block_invoke_127(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1)
      __ACSImportFileIntoCachingServer_block_invoke_127_cold_1();
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(const void **)(a1 + 40);
  if (v3)
  {
    if (CFGetRetainCount(v3) <= 1)
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), (uint64_t)"error", *(_QWORD *)(a1 + 40));
    CFRelease(*(CFTypeRef *)(a1 + 40));
    v4 = *(const void **)(a1 + 40);
    if (v4)
      CFRelease(v4);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
}

void __ACSImportFileIntoCachingServer_block_invoke_2_130(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFErrorRef v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  CFAbsoluteTime v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[8];
  int v17;
  BOOL v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  CFErrorRef v26;
  __int16 v27;
  CFAbsoluteTime v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEBUG))
    __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2_88_cold_1();
  if (MEMORY[0x1D8267440](a2) == MEMORY[0x1E0C812F8])
  {
    v9 = xpc_dictionary_get_BOOL(a2, "success");
    v8 = aclErrorCreateFromXPC(*(unsigned int *)(a1 + 80), a2);
  }
  else
  {
    v8 = aclErrorCreate(*(unsigned int *)(a1 + 80), (const __CFString *)*MEMORY[0x1E0C9AFD0], 100, CFSTR("unexpected reply from XPC service %s: %@"), v4, v5, v6, v7, (char)"com.apple.AssetCacheLocatorService");
    v9 = 0;
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  v10 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_DWORD *)(a1 + 80);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    *(_DWORD *)buf = 67110146;
    v20 = v11;
    v21 = 2080;
    v22 = v12;
    v23 = 1024;
    v24 = v9;
    v25 = 2112;
    v26 = v8;
    v27 = 2048;
    v28 = v13;
    _os_log_impl(&dword_1D4CDC000, v10, OS_LOG_TYPE_DEFAULT, "#%08x %s -> success %{BOOL}d, error %@, elapsed %.3f", buf, 0x2Cu);
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
  {
    v15 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __ACSImportFileIntoCachingServer_block_invoke_132;
    block[3] = &unk_1E9877F00;
    block[4] = v14;
    block[5] = v8;
    v18 = v9;
    v17 = *(_DWORD *)(a1 + 80);
    block[6] = *(_QWORD *)(a1 + 40);
    block[7] = v15;
    dispatch_async(v15, block);
  }
  else if (v8)
  {
    CFRelease(v8);
  }
  xpc_release(*(xpc_object_t *)(a1 + 72));
}

void __ACSImportFileIntoCachingServer_block_invoke_132(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1)
      __ACSImportFileIntoCachingServer_block_invoke_132_cold_1();
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(const void **)(a1 + 40);
  if (v3)
  {
    if (CFGetRetainCount(v3) <= 1)
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), (uint64_t)"error", *(_QWORD *)(a1 + 40));
    CFRelease(*(CFTypeRef *)(a1 + 40));
    v4 = *(const void **)(a1 + 40);
    if (v4)
      CFRelease(v4);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
}

void __ACSImportFileIntoCachingServer_block_invoke_cold_1()
{
  __assert_rtn("ACSImportFileIntoCachingServer_block_invoke", "AssetCacheLocator.c", 1440, "CFGetRetainCount(error) == 1");
}

void __ACSImportFileIntoCachingServer_block_invoke_127_cold_1()
{
  __assert_rtn("ACSImportFileIntoCachingServer_block_invoke", "AssetCacheLocator.c", 1540, "CFGetRetainCount(getError) == 1");
}

void __ACSImportFileIntoCachingServer_block_invoke_132_cold_1()
{
  __assert_rtn("ACSImportFileIntoCachingServer_block_invoke", "AssetCacheLocator.c", 1569, "CFGetRetainCount(error) == 1");
}

@end

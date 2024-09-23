@implementation ACSMightCurrentNetworkHaveCachingServer

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _xpc_connection_s *SharedLocatorConnection;
  _xpc_connection_s *v10;
  void *v11;
  NSObject *global_queue;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const void *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  CFTypeRef v23;
  CFAbsoluteTime v24;
  uint64_t v25;
  void *Copy;
  NSObject *v27;
  _QWORD handler[10];
  int v29;
  _QWORD v30[8];
  int v31;
  CFTypeRef cf;
  uint64_t block;
  _BYTE v34[32];
  CFAbsoluteTime v35;
  CFTypeRef v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  cf = 0;
  SharedLocatorConnection = aclGetSharedLocatorConnection(*(unsigned int *)(a1 + 80), (CFErrorRef *)&cf, a3, a4, a5, a6, a7, a8);
  if (SharedLocatorConnection)
  {
    v10 = SharedLocatorConnection;
    xpc_retain(SharedLocatorConnection);
    v11 = *(void **)(a1 + 40);
    global_queue = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2_88;
    handler[3] = &unk_1E9877E40;
    v29 = *(_DWORD *)(a1 + 80);
    handler[6] = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 64);
    handler[4] = *(_QWORD *)(a1 + 32);
    handler[5] = v13;
    v15 = *(_QWORD *)(a1 + 72);
    handler[7] = v14;
    handler[8] = v15;
    handler[9] = v10;
    xpc_connection_send_message_with_reply(v10, v11, global_queue, handler);
    xpc_release(*(xpc_object_t *)(a1 + 40));
  }
  else
  {
    xpc_release(*(xpc_object_t *)(a1 + 40));
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(double *)(a1 + 56);
    v18 = MEMORY[0x1E0C809B0];
    block = MEMORY[0x1E0C809B0];
    *(_QWORD *)v34 = 0x40000000;
    *(_QWORD *)&v34[8] = __aclSaveMightHaveResult_block_invoke;
    *(_QWORD *)&v34[16] = &__block_descriptor_tmp_221;
    *(_QWORD *)&v34[24] = v16;
    v37 = 1;
    v35 = v17;
    v36 = cf;
    dispatch_sync((dispatch_queue_t)qword_1ED1B3A10, &block);
    v19 = *(const void **)(a1 + 56);
    if (v19)
      CFRelease(v19);
    v20 = qword_1ED1B39F0;
    if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_DWORD *)(a1 + 80);
      v22 = *(_QWORD *)(a1 + 64);
      v23 = cf;
      v24 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
      LODWORD(block) = 67110146;
      HIDWORD(block) = v21;
      *(_WORD *)v34 = 2080;
      *(_QWORD *)&v34[2] = v22;
      *(_WORD *)&v34[10] = 2112;
      *(_QWORD *)&v34[12] = CFSTR("new");
      *(_WORD *)&v34[20] = 2112;
      *(_QWORD *)&v34[22] = v23;
      *(_WORD *)&v34[30] = 2048;
      v35 = v24;
      _os_log_impl(&dword_1D4CDC000, v20, OS_LOG_TYPE_DEFAULT, "#%08x %s -> [%@] error: %@, elapsed %.3f", (uint8_t *)&block, 0x30u);
    }
    v25 = *(_QWORD *)(a1 + 32);
    if (v25)
    {
      Copy = (void *)cf;
      if (cf)
      {
        Copy = aclErrorCreateCopy((__CFError *)cf);
        v25 = *(_QWORD *)(a1 + 32);
      }
      v30[0] = v18;
      v30[1] = 0x40000000;
      v30[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke_85;
      v30[3] = &unk_1E9877DF0;
      v30[4] = v25;
      v30[5] = Copy;
      v31 = *(_DWORD *)(a1 + 80);
      v27 = *(NSObject **)(a1 + 72);
      v30[6] = *(_QWORD *)(a1 + 64);
      v30[7] = v27;
      dispatch_async(v27, v30);
    }
    if (cf)
      CFRelease(cf);
  }
}

CFTypeRef __ACSMightCurrentNetworkHaveCachingServer_block_invoke(_QWORD *a1)
{
  const void *v2;
  CFTypeRef result;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = qword_1ED1B3A40;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = qword_1ED1B3A48;
  v2 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v2)
    CFRetain(v2);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = byte_1ED1B3A50;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = qword_1ED1B3A58;
  result = *(CFTypeRef *)(*(_QWORD *)(a1[7] + 8) + 24);
  if (result)
    return CFRetain(result);
  return result;
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_76(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1)
      __ACSMightCurrentNetworkHaveCachingServer_block_invoke_76_cold_1();
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

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_85(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1)
      __ACSMightCurrentNetworkHaveCachingServer_block_invoke_85_cold_1();
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

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2_88(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFError *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  CFAbsoluteTime v17;
  uint64_t v18;
  CFErrorRef Copy;
  NSObject *v20;
  _QWORD v21[8];
  int v22;
  BOOL v23;
  uint64_t block;
  _BYTE v25[48];
  BOOL v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEBUG))
    __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2_88_cold_1();
  if (MEMORY[0x1D8267440](a2) == MEMORY[0x1E0C812F8])
  {
    v9 = xpc_dictionary_get_BOOL(a2, "recentlySeen");
    v8 = aclErrorCreateFromXPC(*(unsigned int *)(a1 + 80), a2);
  }
  else
  {
    v8 = aclErrorCreate(*(unsigned int *)(a1 + 80), (const __CFString *)*MEMORY[0x1E0C9AFD0], 100, CFSTR("unexpected reply from XPC service %s: %@"), v4, v5, v6, v7, (char)"com.apple.AssetCacheLocatorService");
    v9 = 1;
  }
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  *(_QWORD *)v25 = 0x40000000;
  *(_QWORD *)&v25[8] = __aclSaveMightHaveResult_block_invoke;
  *(_QWORD *)&v25[16] = &__block_descriptor_tmp_221;
  *(_QWORD *)&v25[24] = v10;
  v26 = v9;
  *(_QWORD *)&v25[32] = v11;
  *(_QWORD *)&v25[40] = v8;
  dispatch_sync((dispatch_queue_t)qword_1ED1B3A10, &block);
  v13 = *(const void **)(a1 + 56);
  if (v13)
    CFRelease(v13);
  v14 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_DWORD *)(a1 + 80);
    v16 = *(_QWORD *)(a1 + 40);
    v17 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    LODWORD(block) = 67110402;
    HIDWORD(block) = v15;
    *(_WORD *)v25 = 2080;
    *(_QWORD *)&v25[2] = v16;
    *(_WORD *)&v25[10] = 2112;
    *(_QWORD *)&v25[12] = CFSTR("new");
    *(_WORD *)&v25[20] = 1024;
    *(_DWORD *)&v25[22] = v9;
    *(_WORD *)&v25[26] = 2112;
    *(_QWORD *)&v25[28] = v8;
    *(_WORD *)&v25[36] = 2048;
    *(CFAbsoluteTime *)&v25[38] = v17;
    _os_log_impl(&dword_1D4CDC000, v14, OS_LOG_TYPE_DEFAULT, "#%08x %s -> [%@] mightHave %{BOOL}d, error %@, elapsed %.3f", (uint8_t *)&block, 0x36u);
  }
  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
  {
    if (v8)
    {
      Copy = aclErrorCreateCopy(v8);
      v18 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      Copy = 0;
    }
    v20 = *(NSObject **)(a1 + 64);
    v21[0] = v12;
    v21[1] = 0x40000000;
    v21[2] = __ACSMightCurrentNetworkHaveCachingServer_block_invoke_92;
    v21[3] = &unk_1E9877E18;
    v21[4] = v18;
    v21[5] = Copy;
    v23 = v9;
    v22 = *(_DWORD *)(a1 + 80);
    v21[6] = *(_QWORD *)(a1 + 40);
    v21[7] = v20;
    dispatch_async(v20, v21);
  }
  if (v8)
    CFRelease(v8);
  xpc_release(*(xpc_object_t *)(a1 + 72));
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_92(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1)
      __ACSMightCurrentNetworkHaveCachingServer_block_invoke_92_cold_1();
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

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_76_cold_1()
{
  __assert_rtn("ACSMightCurrentNetworkHaveCachingServer_block_invoke", "AssetCacheLocator.c", 1207, "CFGetRetainCount(error) == 1");
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_85_cold_1()
{
  __assert_rtn("ACSMightCurrentNetworkHaveCachingServer_block_invoke", "AssetCacheLocator.c", 1264, "CFGetRetainCount(callbackError) == 1");
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_2_88_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D4CDC000, v0, v1, "#%08x %s reply callback(object=%@)");
  OUTLINED_FUNCTION_2_0();
}

void __ACSMightCurrentNetworkHaveCachingServer_block_invoke_92_cold_1()
{
  __assert_rtn("ACSMightCurrentNetworkHaveCachingServer_block_invoke", "AssetCacheLocator.c", 1297, "CFGetRetainCount(callbackError) == 1");
}

@end

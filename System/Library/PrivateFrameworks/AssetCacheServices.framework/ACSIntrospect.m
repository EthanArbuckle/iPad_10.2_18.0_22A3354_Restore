@implementation ACSIntrospect

void ___ACSIntrospect_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _xpc_connection_s *SharedLocatorConnection;
  _xpc_connection_s *v10;
  void *v11;
  NSObject *global_queue;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  CFErrorRef v17;
  CFAbsoluteTime v18;
  uint64_t v19;
  CFErrorRef Copy;
  NSObject *v21;
  _QWORD v22[9];
  int v23;
  _QWORD block[8];
  int v25;
  CFErrorRef v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  CFErrorRef v32;
  __int16 v33;
  CFAbsoluteTime v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  SharedLocatorConnection = aclGetSharedLocatorConnection(*(unsigned int *)(a1 + 72), &v26, a3, a4, a5, a6, a7, a8);
  if (SharedLocatorConnection)
  {
    v10 = SharedLocatorConnection;
    xpc_retain(SharedLocatorConnection);
    v11 = *(void **)(a1 + 40);
    global_queue = dispatch_get_global_queue(0, 0);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 0x40000000;
    v22[2] = ___ACSIntrospect_block_invoke_2;
    v22[3] = &unk_1E9877FC8;
    v23 = *(_DWORD *)(a1 + 72);
    v13 = *(_QWORD *)(a1 + 48);
    v22[6] = *(_QWORD *)(a1 + 56);
    v22[4] = *(_QWORD *)(a1 + 32);
    v22[5] = v13;
    v22[7] = *(_QWORD *)(a1 + 64);
    v22[8] = v10;
    xpc_connection_send_message_with_reply(v10, v11, global_queue, v22);
    xpc_release(*(xpc_object_t *)(a1 + 40));
  }
  else
  {
    xpc_release(*(xpc_object_t *)(a1 + 40));
    v14 = qword_1ED1B39F0;
    if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_DWORD *)(a1 + 72);
      v16 = *(_QWORD *)(a1 + 48);
      v17 = v26;
      v18 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
      *(_DWORD *)buf = 67109890;
      v28 = v15;
      v29 = 2080;
      v30 = v16;
      v31 = 2112;
      v32 = v17;
      v33 = 2048;
      v34 = v18;
      _os_log_impl(&dword_1D4CDC000, v14, OS_LOG_TYPE_DEFAULT, "#%08x %s -> error: %@, elapsed %.3f", buf, 0x26u);
    }
    v19 = *(_QWORD *)(a1 + 32);
    if (v19)
    {
      Copy = v26;
      if (v26)
      {
        Copy = aclErrorCreateCopy(v26);
        v19 = *(_QWORD *)(a1 + 32);
      }
      v21 = *(NSObject **)(a1 + 64);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = ___ACSIntrospect_block_invoke_138;
      block[3] = &unk_1E9877F78;
      block[4] = v19;
      block[5] = Copy;
      v25 = *(_DWORD *)(a1 + 72);
      block[6] = *(_QWORD *)(a1 + 48);
      block[7] = v21;
      dispatch_async(v21, block);
    }
    if (v26)
      CFRelease(v26);
  }
}

void ___ACSIntrospect_block_invoke_138(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1)
      ___ACSIntrospect_block_invoke_138_cold_1();
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

void ___ACSIntrospect_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFError *v8;
  const void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  CFAbsoluteTime v13;
  uint64_t v14;
  CFErrorRef Copy;
  NSObject *v16;
  uint64_t v17;
  _QWORD block[9];
  int v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const void *v25;
  __int16 v26;
  __CFError *v27;
  __int16 v28;
  CFAbsoluteTime v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEBUG))
    ___ACSIntrospect_block_invoke_2_cold_1();
  if (MEMORY[0x1D8267440](a2) == MEMORY[0x1E0C812F8])
  {
    if (xpc_dictionary_get_value(a2, "introspection"))
      v9 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
    else
      v9 = 0;
    v8 = aclErrorCreateFromXPC(*(unsigned int *)(a1 + 72), a2);
  }
  else
  {
    v8 = aclErrorCreate(*(unsigned int *)(a1 + 72), (const __CFString *)*MEMORY[0x1E0C9AFD0], 100, CFSTR("unexpected reply from XPC service %s: %@"), v4, v5, v6, v7, (char)"com.apple.AssetCacheLocatorService");
    v9 = 0;
  }
  v10 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_DWORD *)(a1 + 72);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    *(_DWORD *)buf = 67110147;
    v21 = v11;
    v22 = 2080;
    v23 = v12;
    v24 = 2113;
    v25 = v9;
    v26 = 2112;
    v27 = v8;
    v28 = 2048;
    v29 = v13;
    _os_log_impl(&dword_1D4CDC000, v10, OS_LOG_TYPE_DEFAULT, "#%08x %s -> result %{private}@, error %@, elapsed %.3f", buf, 0x30u);
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
  {
    if (v8)
    {
      Copy = aclErrorCreateCopy(v8);
      v14 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      Copy = 0;
    }
    v16 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = ___ACSIntrospect_block_invoke_141;
    block[3] = &unk_1E9877FA0;
    block[4] = v14;
    block[5] = v9;
    v19 = *(_DWORD *)(a1 + 72);
    v17 = *(_QWORD *)(a1 + 40);
    block[6] = Copy;
    block[7] = v17;
    block[8] = v16;
    dispatch_async(v16, block);
  }
  else if (v9)
  {
    CFRelease(v9);
  }
  if (v8)
    CFRelease(v8);
  xpc_release(*(xpc_object_t *)(a1 + 64));
}

void ___ACSIntrospect_block_invoke_141(uint64_t a1)
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
      ___ACSIntrospect_block_invoke_141_cold_2();
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    if (CFGetRetainCount(v3) != 1)
      ___ACSIntrospect_block_invoke_141_cold_1();
    CFRetain(*(CFTypeRef *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    if (CFGetRetainCount(v4) <= 1)
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), (uint64_t)"introspection", *(_QWORD *)(a1 + 40));
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    if (CFGetRetainCount(v5) <= 1)
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), (uint64_t)"error", *(_QWORD *)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
  v6 = *(const void **)(a1 + 40);
  if (v6)
    CFRelease(v6);
  v7 = *(const void **)(a1 + 48);
  if (v7)
    CFRelease(v7);
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
}

void ___ACSIntrospect_block_invoke_138_cold_1()
{
  __assert_rtn("_ACSIntrospect_block_invoke", "AssetCacheLocator.c", 1637, "CFGetRetainCount(callbackError) == 1");
}

void ___ACSIntrospect_block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D4CDC000, v0, v1, "#%08x %s reply callback(object=%@)");
  OUTLINED_FUNCTION_2_0();
}

void ___ACSIntrospect_block_invoke_141_cold_1()
{
  __assert_rtn("_ACSIntrospect_block_invoke", "AssetCacheLocator.c", 1672, "CFGetRetainCount(callbackError) == 1");
}

void ___ACSIntrospect_block_invoke_141_cold_2()
{
  __assert_rtn("_ACSIntrospect_block_invoke", "AssetCacheLocator.c", 1671, "CFGetRetainCount(introspection) == 1");
}

@end

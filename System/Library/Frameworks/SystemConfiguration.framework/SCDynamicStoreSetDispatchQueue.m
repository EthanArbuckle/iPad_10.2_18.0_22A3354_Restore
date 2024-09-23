@implementation SCDynamicStoreSetDispatchQueue

void __SCDynamicStoreSetDispatchQueue_block_invoke_3(uint64_t a1)
{
  const void *v2;
  CFTypeID TypeID;

  v2 = *(const void **)(a1 + 32);
  TypeID = SCDynamicStoreGetTypeID();
  if (!v2 || CFGetTypeID(v2) != TypeID)
    __SCDynamicStoreSetDispatchQueue_block_invoke_3_cold_1();
  mach_port_destruct(*MEMORY[0x1E0C83DA0], *(_DWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
}

void __SCDynamicStoreSetDispatchQueue_block_invoke(uint64_t a1)
{
  mach_msg_return_t v2;
  mach_msg_return_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _DWORD *v15;
  int v16;
  const void *v17;
  CFTypeID TypeID;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[6];
  int v23;
  _BYTE msg[32];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[28];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  memset(v29, 0, sizeof(v29));
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  memset(msg, 0, sizeof(msg));
  v2 = mach_msg((mach_msg_header_t *)msg, 2, 0, 0x7Cu, *(_DWORD *)(a1 + 56), 0, 0);
  if (v2)
  {
    v3 = v2;
    v4 = __log_SCDynamicStore();
    v5 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v4, (os_log_type_t)v5))
    {
      v6 = _os_log_pack_size();
      v14 = (char *)&block[-1] - ((MEMORY[0x1E0C80A78](v6, v7, v8, v9, v10, v11, v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0);
      __error();
      v15 = (_DWORD *)_os_log_pack_fill();
      *v15 = 67109120;
      v15[1] = v3;
      __SC_log_send(5, (uint64_t)v4, v5, v14);
    }
  }
  else
  {
    v16 = *(_DWORD *)&msg[20];
    mach_msg_destroy((mach_msg_header_t *)msg);
    v17 = *(const void **)(a1 + 32);
    TypeID = SCDynamicStoreGetTypeID();
    if (!v17 || CFGetTypeID(v17) != TypeID)
      __SCDynamicStoreSetDispatchQueue_block_invoke_cold_1();
    CFRetain(*(CFTypeRef *)(a1 + 32));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __SCDynamicStoreSetDispatchQueue_block_invoke_2;
    block[3] = &__block_descriptor_tmp_4;
    v23 = v16;
    v19 = *(NSObject **)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v20;
    dispatch_async(v19, block);
  }
}

void __SCDynamicStoreSetDispatchQueue_block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) == 70)
    __SCDynamicStoreReconnectNotifications(*(_QWORD *)(a1 + 32));
  rlsPerform(*(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __SCDynamicStoreSetDispatchQueue_block_invoke_cold_1()
{
  __assert_rtn("SCDynamicStoreSetDispatchQueue_block_invoke", "SCDNotifierInformViaCallback.c", 698, "isA_SCDynamicStore(store)");
}

void __SCDynamicStoreSetDispatchQueue_block_invoke_3_cold_1()
{
  __assert_rtn("SCDynamicStoreSetDispatchQueue_block_invoke_3", "SCDNotifierInformViaCallback.c", 716, "isA_SCDynamicStore(store)");
}

@end

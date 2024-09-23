@implementation SOSCCSetCompatibilityMode

uint64_t __SOSCCSetCompatibilityMode_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)(_QWORD, _QWORD);
  char v10;
  CFTypeRef *v11;
  __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[4];
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  __int128 buf;
  uint64_t (*v22)(uint64_t, xpc_object_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (gSecurityd)
  {
    v8 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 648);
    if (v8)
      return v8(*(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  v10 = *(_BYTE *)(a1 + 40);
  v11 = *(CFTypeRef **)(a1 + 32);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12 = SecLogAPICreate(0, "BOOL_and_error_request_returns_BOOL", 0, a4, a5, a6, a7, a8, 0);
  secLogObjForScope("api_trace");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_debug_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
  }

  if (v12)
    CFRelease(v12);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __BOOL_and_error_request_returns_BOOL_block_invoke;
  v15[3] = &__block_descriptor_33_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v16 = v10;
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v22 = __BOOL_and_error_request_returns_BOOL_block_invoke_2;
  v23 = &unk_1E1FD5DC0;
  v24 = &v17;
  securityd_send_sync_and_do(0x5Au, v11, (uint64_t)v15, (uint64_t)&buf);
  v14 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v14;
}

@end

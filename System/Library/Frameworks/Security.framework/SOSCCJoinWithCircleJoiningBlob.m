@implementation SOSCCJoinWithCircleJoiningBlob

uint64_t __SOSCCJoinWithCircleJoiningBlob_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, _QWORD, _QWORD), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  CFTypeRef *v10;
  uint64_t v11;
  __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  __int128 buf;
  BOOL (*v21)(uint64_t, void *);
  void *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (gSecurityd)
  {
    a4 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(gSecurityd + 584);
    if (a4)
      return a4(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  v9 = *(_DWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 32);
  v10 = *(CFTypeRef **)(a1 + 40);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = SecLogAPICreate(0, "cfdata_and_int_error_request_returns_BOOL", 0, (uint64_t)a4, a5, a6, a7, a8, 0);
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
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v21 = __cfdata_and_int_error_request_returns_BOOL_block_invoke;
  v22 = &__block_descriptor_44_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v23 = v11;
  v24 = v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __cfdata_and_int_error_request_returns_BOOL_block_invoke_2;
  v15[3] = &unk_1E1FD5DC0;
  v15[4] = &v16;
  securityd_send_sync_and_do(0x53u, v10, (uint64_t)&buf, (uint64_t)v15);
  v14 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v14;
}

@end

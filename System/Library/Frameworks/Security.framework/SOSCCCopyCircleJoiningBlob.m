@implementation SOSCCCopyCircleJoiningBlob

uint64_t __SOSCCCopyCircleJoiningBlob_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v9)(_QWORD, _QWORD);
  __CFData *v11;
  CFTypeRef *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 buf;
  BOOL (*v27)(uint64_t, void *);
  void *v28;
  __CFData *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (gSecurityd)
  {
    v9 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 568);
    if (v9)
      return v9(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  v11 = SOSPeerInfoCopyEncodedData(*(_QWORD *)(a1 + 32), a2, *(CFTypeRef **)(a1 + 40), a4, a5, a6, a7, a8);
  v12 = *(CFTypeRef **)(a1 + 40);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = SecLogAPICreate(0, "cfdata_error_request_returns_cfdata", 0, v13, v14, v15, v16, v17, 0);
  secLogObjForScope("api_trace");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_debug_impl(&dword_18A900000, v19, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
  }

  if (v18)
    CFRelease(v18);
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v27 = __cfdata_error_request_returns_cfdata_block_invoke;
  v28 = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v29 = v11;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __cfdata_error_request_returns_cfdata_block_invoke_2;
  v21[3] = &unk_1E1FD5DC0;
  v21[4] = &v22;
  securityd_send_sync_and_do(0x52u, v12, (uint64_t)&buf, (uint64_t)v21);
  v20 = v23[3];
  _Block_object_dispose(&v22, 8);
  if (v11)
    CFRelease(v11);
  return v20;
}

@end

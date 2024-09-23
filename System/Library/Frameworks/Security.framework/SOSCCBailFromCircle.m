@implementation SOSCCBailFromCircle

uint64_t __SOSCCBailFromCircle_BestEffort_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, _QWORD);
  CFTypeRef *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 352);
    if (v1)
      return v1(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(CFTypeRef **)(a1 + 40);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __uint64_t_to_BOOL_error_request_block_invoke;
  v7[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v7[4] = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __uint64_t_to_BOOL_error_request_block_invoke_2;
  v6[3] = &unk_1E1FD5DC0;
  securityd_send_sync_and_do(0x3Cu, v3, (uint64_t)v7, (uint64_t)v6);
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end

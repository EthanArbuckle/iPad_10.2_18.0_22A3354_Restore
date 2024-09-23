@implementation SOSCCPeersHaveViewsEnabled

uint64_t __SOSCCPeersHaveViewsEnabled_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, _QWORD);
  CFTypeRef *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 616);
    if (v1)
      return v1(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(CFTypeRef **)(a1 + 40);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[4] = &v9;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __cfarray_to_cfBOOLean_error_request_block_invoke;
  v8[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v8[4] = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __cfarray_to_cfBOOLean_error_request_block_invoke_2;
  v7[3] = &unk_1E1FD5DC0;
  v5 = 0;
  if (securityd_send_sync_and_do(0x69u, v3, (uint64_t)v8, (uint64_t)v7))
  {
    if (*((_BYTE *)v10 + 24))
      v6 = (uint64_t *)MEMORY[0x1E0C9AE50];
    else
      v6 = (uint64_t *)MEMORY[0x1E0C9AE40];
    v5 = *v6;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

@end

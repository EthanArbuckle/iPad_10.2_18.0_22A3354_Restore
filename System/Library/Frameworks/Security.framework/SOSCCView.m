@implementation SOSCCView

uint64_t __SOSCCView_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, _QWORD, _QWORD);
  uint64_t v3;
  CFTypeRef *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  __int16 v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(gSecurityd + 280);
    if (v1)
      return v1(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  v3 = *(int *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(CFTypeRef **)(a1 + 40);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __name_action_to_code_request_block_invoke;
  v9[3] = &__block_descriptor_48_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v9[4] = v5;
  v9[5] = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __name_action_to_code_request_block_invoke_3;
  v7[3] = &unk_1E1FD5000;
  v7[4] = &v10;
  v8 = 0;
  securityd_send_sync_and_do(0x36u, v4, (uint64_t)v9, (uint64_t)v7);
  v6 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

@end

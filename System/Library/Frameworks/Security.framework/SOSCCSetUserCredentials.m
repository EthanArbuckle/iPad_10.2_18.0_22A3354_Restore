@implementation SOSCCSetUserCredentials

uint64_t __SOSCCSetUserCredentials_block_invoke(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD, _QWORD, _QWORD);
  CFTypeRef *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(gSecurityd + 200);
    if (v1)
      return v1(a1[4], a1[5], a1[6]);
  }
  v3 = (CFTypeRef *)a1[6];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5[4] = &v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __label_and_password_to_BOOL_error_request_block_invoke;
  v6[3] = &__block_descriptor_48_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v7 = *((_OWORD *)a1 + 2);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __label_and_password_to_BOOL_error_request_block_invoke_3;
  v5[3] = &unk_1E1FD5DC0;
  securityd_send_sync_and_do(0x2Du, v3, (uint64_t)v6, (uint64_t)v5);
  v4 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

@end

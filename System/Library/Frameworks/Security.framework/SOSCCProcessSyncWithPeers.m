@implementation SOSCCProcessSyncWithPeers

uint64_t __SOSCCProcessSyncWithPeers_block_invoke(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD, _QWORD, _QWORD);
  CFTypeRef *v3;
  char v4;
  uint64_t *v5;
  const void *v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(gSecurityd + 480);
    if (v1)
      return v1(a1[4], a1[5], a1[6]);
  }
  v3 = (CFTypeRef *)a1[6];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[4] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __cfset_cfset_to_cfset_error_request_block_invoke;
  v9[3] = &__block_descriptor_48_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v10 = *((_OWORD *)a1 + 2);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __cfset_cfset_to_cfset_error_request_block_invoke_2;
  v8[3] = &unk_1E1FD5DC0;
  v4 = securityd_send_sync_and_do(0x6Au, v3, (uint64_t)v9, (uint64_t)v8);
  v5 = v12;
  if ((v4 & 1) == 0)
  {
    v6 = (const void *)v12[3];
    if (v6)
    {
      v12[3] = 0;
      CFRelease(v6);
      v5 = v12;
    }
  }
  v7 = v5[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

@end

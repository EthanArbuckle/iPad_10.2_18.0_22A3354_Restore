@implementation SOSCCCopyInitialSyncData

uint64_t __SOSCCCopyInitialSyncData_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, _QWORD);
  int v3;
  CFTypeRef *v4;
  const void *v5;
  CFTypeID v6;
  CFTypeID TypeID;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[4];
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 576);
    if (v1)
      return v1(*(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  v3 = *(_DWORD *)(a1 + 40);
  v4 = *(CFTypeRef **)(a1 + 32);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[4] = &v12;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __flags_to_data_error_request_block_invoke;
  v10[3] = &__block_descriptor_36_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v11 = v3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __flags_to_data_error_request_block_invoke_2;
  v9[3] = &unk_1E1FD5DC0;
  securityd_send_sync_and_do(0x59u, v4, (uint64_t)v10, (uint64_t)v9);
  v5 = (const void *)v13[3];
  if (v5)
  {
    v6 = CFGetTypeID(v5);
    TypeID = CFDataGetTypeID();
    v8 = v13[3];
    if (v6 == TypeID)
      goto LABEL_9;
  }
  else
  {
    v8 = 0;
  }
  SOSErrorCreate(1040, v4, 0, CFSTR("Expected CFData, got: %@"), v8);
  v8 = 0;
LABEL_9:
  _Block_object_dispose(&v12, 8);
  return v8;
}

@end

@implementation SOSCCCopyRecoveryPublicKey

uint64_t __SOSCCCopyRecoveryPublicKey_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  CFTypeRef *v3;
  const void *v4;
  CFTypeID v5;
  CFTypeID TypeID;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD))(gSecurityd + 312);
    if (v1)
      return v1(*(_QWORD *)(a1 + 32));
  }
  v3 = *(CFTypeRef **)(a1 + 32);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __data_to_error_request_block_invoke;
  v8[3] = &unk_1E1FD5DC0;
  v8[4] = &v9;
  securityd_send_sync_and_do(0x58u, v3, 0, (uint64_t)v8);
  v4 = (const void *)v10[3];
  if (v4)
  {
    v5 = CFGetTypeID(v4);
    TypeID = CFDataGetTypeID();
    v7 = v10[3];
    if (v5 == TypeID)
      goto LABEL_9;
  }
  else
  {
    v7 = 0;
  }
  SOSErrorCreate(1040, v3, 0, CFSTR("Expected CFData, got: %@"), v7);
  v7 = 0;
LABEL_9:
  _Block_object_dispose(&v9, 8);
  return v7;
}

@end

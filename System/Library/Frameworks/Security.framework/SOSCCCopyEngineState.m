@implementation SOSCCCopyEngineState

uint64_t __SOSCCCopyEngineState_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  CFTypeRef *v3;
  int v4;
  uint64_t *v5;
  const void *v6;
  CFTypeID v7;
  CFTypeID TypeID;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD))(gSecurityd + 440);
    if (v1)
      return v1(*(_QWORD *)(a1 + 32));
  }
  v3 = *(CFTypeRef **)(a1 + 32);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __der_array_error_request_block_invoke;
  v12[3] = &unk_1E1FD5DC0;
  v12[4] = &v13;
  v4 = securityd_send_sync_and_do(0x4Au, v3, 0, (uint64_t)v12);
  v5 = v14;
  if (v4)
  {
    v6 = (const void *)v14[3];
    if (!v6)
    {
      v9 = 0;
LABEL_9:
      SOSErrorCreate(1040, v3, 0, CFSTR("Expected array, got: %@"), v9);
      v5 = v14;
      v10 = (const void *)v14[3];
      if (v10)
      {
        v14[3] = 0;
        CFRelease(v10);
        v5 = v14;
      }
      goto LABEL_11;
    }
    v7 = CFGetTypeID(v6);
    TypeID = CFArrayGetTypeID();
    v5 = v14;
    if (v7 != TypeID)
    {
      v9 = v14[3];
      goto LABEL_9;
    }
  }
LABEL_11:
  v11 = v5[3];
  _Block_object_dispose(&v13, 8);
  return v11;
}

@end

@implementation SOSSetNewPublicBackupKey

uint64_t __SOSSetNewPublicBackupKey_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, _QWORD);
  uint64_t v3;
  CFTypeRef *v4;
  const void *v5;
  CFTypeID v6;
  CFTypeID TypeID;
  const __CFData *v8;
  uint64_t v9;
  const void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 376);
    if (v1)
      return v1(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(CFTypeRef **)(a1 + 40);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[4] = &v13;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __data_to_peer_info_error_request_block_invoke;
  v12[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v12[4] = v3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __data_to_peer_info_error_request_block_invoke_2;
  v11[3] = &unk_1E1FD5DC0;
  securityd_send_sync_and_do(0x4Du, v4, (uint64_t)v12, (uint64_t)v11);
  v5 = (const void *)v14[3];
  if (!v5)
  {
    v8 = 0;
    goto LABEL_8;
  }
  v6 = CFGetTypeID(v5);
  TypeID = CFDataGetTypeID();
  v8 = (const __CFData *)v14[3];
  if (v6 != TypeID)
  {
LABEL_8:
    SOSErrorCreate(1040, v4, 0, CFSTR("Expected CFData, got: %@"), v8);
    v9 = 0;
    goto LABEL_9;
  }
  v9 = SOSPeerInfoCreateFromData(TypeID, v4, v8);
LABEL_9:
  v10 = (const void *)v14[3];
  if (v10)
  {
    v14[3] = 0;
    CFRelease(v10);
  }
  _Block_object_dispose(&v13, 8);
  return v9;
}

@end

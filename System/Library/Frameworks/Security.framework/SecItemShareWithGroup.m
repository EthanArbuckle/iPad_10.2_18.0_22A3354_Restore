@implementation SecItemShareWithGroup

uint64_t __SecItemShareWithGroup_block_invoke(uint64_t a1, void *a2, const __CFDictionary *a3, uint64_t a4, const __CFDictionary *a5, CFTypeRef *a6)
{
  id v10;
  uint64_t v11;
  uint64_t (*v12)(const __CFDictionary *, uint64_t, uint64_t, CFTypeRef *);
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  _QWORD v18[5];
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v10 = a2;
  if ((isModifyingAPIRateWithinLimits() & 1) == 0)
    __security_simulatecrash(CFSTR("BUG IN CLIENT OF SECITEM: too many writes. See https://at.apple.com/secitemratelimit"), 0x53C0000Fu);
  if (!v10)
  {
    if (gSecurityd
      && (v12 = *(uint64_t (**)(const __CFDictionary *, uint64_t, uint64_t, CFTypeRef *))(gSecurityd + 96)) != 0)
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = SecSecurityClientGet();
      v15 = (const void *)v12(a3, v13, v14, a6);
      if (!v15)
      {
LABEL_8:
        v11 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 40);
      SecSecurityClientGet();
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      v18[4] = &v20;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __share_with_group_request_block_invoke;
      v19[3] = &__block_descriptor_48_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
      v19[4] = a3;
      v19[5] = v16;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __share_with_group_request_block_invoke_2;
      v18[3] = &unk_1E1FD5DC0;
      securityd_send_sync_and_do(0x83u, a6, (uint64_t)v19, (uint64_t)v18);
      v15 = (const void *)v21[3];
      _Block_object_dispose(&v20, 8);
      if (!v15)
        goto LABEL_8;
    }
    v11 = SecItemResultProcess(a3, a5, 0, v15, (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), (__CFString **)a6);
    CFRelease(v15);
    goto LABEL_11;
  }
  v11 = SecError(-50, (__CFString **)a6, CFSTR("Can't share token-protected items"));
LABEL_11:

  return v11;
}

@end

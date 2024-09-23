@implementation SecItemDelete

uint64_t __SecItemDelete_block_invoke(uint64_t a1, uint64_t a2)
{
  return SecItemAuthDoQuery(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32, 0, SecItemDelete, a2, &__block_literal_global_32);
}

uint64_t __SecItemDelete_block_invoke_2(uint64_t a1, void *a2, const __CFDictionary *a3, uint64_t a4, uint64_t a5, CFTypeRef *a6)
{
  id v8;
  uint64_t v9;
  uint64_t (*v10)(const __CFDictionary *, uint64_t, CFTypeRef *);
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];

  v8 = a2;
  if ((isModifyingAPIRateWithinLimits() & 1) == 0)
    __security_simulatecrash(CFSTR("BUG IN CLIENT OF SECITEM: too many writes. See https://at.apple.com/secitemratelimit"), 0x53C0000Fu);
  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __SecItemDelete_block_invoke_3;
    v14[3] = &unk_1E1FD5ED8;
    v15 = v8;
    v9 = SecTokenItemForEachMatching(a3, a6, v14);

  }
  else
  {
    if (gSecurityd
      && (v10 = *(uint64_t (**)(const __CFDictionary *, uint64_t, CFTypeRef *))(gSecurityd + 24)) != 0)
    {
      v11 = SecSecurityClientGet();
      v12 = v10(a3, v11, a6);
    }
    else
    {
      SecSecurityClientGet();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __dict_to_error_request_block_invoke;
      v16[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
      v16[4] = a3;
      v12 = securityd_send_sync_and_do(3u, a6, (uint64_t)v16, 0);
    }
    v9 = v12;
  }

  return v9;
}

uint64_t __SecItemDelete_block_invoke_3(uint64_t a1, CFDictionaryRef theDict, uint64_t a3, CFTypeRef *a4)
{
  const void *Value;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, CFTypeRef *);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v20;
  _QWORD v21[5];

  Value = CFDictionaryGetValue(theDict, CFSTR("oid"));
  v8 = *(void **)(a1 + 32);
  v20 = 0;
  v9 = objc_msgSend(v8, "deleteObject:error:", Value, &v20);
  v10 = v20;
  if ((v9 & 1) != 0)
    goto LABEL_6;
  if (CryptoTokenKitLibraryCore() && getTKErrorDomainSymbolLoc())
  {
    objc_msgSend(v10, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getTKErrorDomain();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
    {
      v13 = objc_msgSend(v10, "code");

      if (v13 == -6)
      {
LABEL_6:
        if (gSecurityd && (v14 = *(uint64_t (**)(uint64_t, uint64_t, CFTypeRef *))(gSecurityd + 24)) != 0)
        {
          v15 = SecSecurityClientGet();
          v16 = v14(a3, v15, a4);
        }
        else
        {
          SecSecurityClientGet();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __dict_to_error_request_block_invoke;
          v21[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
          v21[4] = a3;
          v16 = securityd_send_sync_and_do(3u, a4, (uint64_t)v21, 0);
        }
        v17 = v16;
        goto LABEL_18;
      }
    }
    else
    {

    }
  }
  v18 = v10;
  if (v18)
  {
    if (a4 && !*a4)
      *a4 = v18;
    else
      CFRelease(v18);
  }
  SecTokenProcessError((uint64_t)CFSTR("odel"), *(void **)(a1 + 32), (uint64_t)Value, (CFErrorRef *)a4);
  v17 = 0;
LABEL_18:

  return v17;
}

@end

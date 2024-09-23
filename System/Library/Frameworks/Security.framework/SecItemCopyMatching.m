@implementation SecItemCopyMatching

BOOL __SecItemCopyMatching_block_invoke(uint64_t a1, __CFString **a2)
{
  CFDictionaryRef *v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = (CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __SecItemCopyMatching_block_invoke_2;
  v4[3] = &__block_descriptor_48_e105_B48__0__TKClientTokenSession_8____CFDictionary__16____CFDictionary__24____CFDictionary__32_____CFError_40l;
  v5 = *(_OWORD *)(a1 + 40);
  return SecItemAuthDoQuery(v2, 0, SecItemCopyMatching, a2, v4);
}

uint64_t __SecItemCopyMatching_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5, CFTypeRef *a6)
{
  void *v10;
  char v11;
  uint64_t (*v12)(uint64_t, uint64_t, CFTypeRef *, CFTypeRef *);
  uint64_t v13;
  uint64_t v14;
  CFTypeRef cf;
  _QWORD v17[5];
  _QWORD v18[5];

  cf = 0;
  +[SecItemRateLimit instance](SecItemRateLimit, "instance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isReadOnlyAPICallWithinLimits");

  if ((v11 & 1) == 0)
    __security_simulatecrash(CFSTR("BUG IN CLIENT OF SECITEM: too many reads. See https://at.apple.com/secitemratelimit"), 0x53C0000Fu);
  if (gSecurityd
    && (v12 = *(uint64_t (**)(uint64_t, uint64_t, CFTypeRef *, CFTypeRef *))(gSecurityd + 8)) != 0)
  {
    v13 = SecSecurityClientGet();
    if ((v12(a3, v13, &cf, a6) & 1) == 0)
      return 0;
  }
  else
  {
    SecSecurityClientGet();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __cftype_to_BOOL_cftype_error_request_block_invoke;
    v18[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
    v18[4] = a3;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __cftype_to_BOOL_cftype_error_request_block_invoke_2;
    v17[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
    v17[4] = &cf;
    if (!securityd_send_sync_and_do(1u, a6, (uint64_t)v18, (uint64_t)v17))
      return 0;
  }
  v14 = SecItemResultProcess(*(const __CFDictionary **)(a1 + 32), a5, 0, cf, *(CFTypeRef **)(a1 + 40), (__CFString **)a6);
  if (cf)
    CFRelease(cf);
  return v14;
}

@end

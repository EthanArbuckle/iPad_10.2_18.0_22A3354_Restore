@implementation SecItemAdd

BOOL __SecItemAdd_block_invoke(uint64_t a1, __CFString **a2)
{
  uint64_t v2;
  CFDictionaryRef *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __SecItemAdd_block_invoke_2;
  v5[3] = &__block_descriptor_40_e105_B48__0__TKClientTokenSession_8____CFDictionary__16____CFDictionary__24____CFDictionary__32_____CFError_40l;
  v5[4] = v2;
  return SecItemAuthDoQuery(v3, 0, SecItemAdd, a2, v5);
}

uint64_t __SecItemAdd_block_invoke_2(uint64_t a1, void *a2, const __CFDictionary *a3, uint64_t a4, const __CFDictionary *a5, CFErrorRef *a6)
{
  id v10;
  void *v11;
  CFTypeRef *v12;
  id v13;
  __CFDictionary *MutableCopy;
  const void *Value;
  const void *v16;
  void *v17;
  const __CFDictionary *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  uint64_t (*v22)(const __CFDictionary *, uint64_t, const void **, CFErrorRef *);
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(__CFDictionary *, uint64_t, CFTypeRef *, CFErrorRef *);
  uint64_t v26;
  const void *v27;
  const __CFDictionary *v28;
  const void *context[5];
  CFTypeRef cf;
  CFTypeRef v32;
  uint64_t v33;
  uint64_t v34;
  BOOL (*v35)(uint64_t, void *, __CFString **);
  void *v36;
  CFTypeRef *p_cf;
  uint64_t v38;
  uint64_t v39;
  size_t (*v40)(uint64_t, void *, __CFString **, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v41;
  __CFDictionary *v42;

  v10 = a2;
  v11 = v10;
  if (v10)
  {
    v12 = *(CFTypeRef **)(a1 + 32);
    v13 = v10;
    cf = 0;
    v32 = 0;
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a3);
    CFDictionarySetValue(MutableCopy, CFSTR("pdmn"), CFSTR("dk"));
    Value = CFDictionaryGetValue(MutableCopy, CFSTR("toid"));
    if (Value)
    {
      v16 = Value;
      CFRetain(Value);
      CFDictionaryRemoveValue(MutableCopy, CFSTR("toid"));
      v17 = SecTokenCopyUpdatedObjectID(v13, (uint64_t)v16, MutableCopy, a6);
      CFRelease(v16);
      if (v17)
        goto LABEL_4;
    }
    else
    {
      CFDictionaryRemoveValue(MutableCopy, CFSTR("toid"));
      v17 = SecTokenCopyUpdatedObjectID(v13, 0, MutableCopy, a6);
      if (v17)
      {
LABEL_4:
        CFDictionaryRemoveValue(MutableCopy, CFSTR("toid"));
        if (CFDictionaryContainsKey(MutableCopy, CFSTR("v_Ref")))
        {
          CFDictionaryRemoveValue(MutableCopy, CFSTR("v_Ref"));
        }
        else
        {
          if (!SecTokenItemCreateFromAttributes(MutableCopy, a5, v13, v17, (uint64_t *)&v32, (__CFString **)a6))
          {
            v18 = 0;
            goto LABEL_47;
          }
          if (v32)
          {
            v28 = SecItemCopyAttributeDictionary(v32, 0);
            v18 = v28;
            if (v28)
            {
              context[0] = (const void *)MEMORY[0x1E0C809B0];
              context[1] = (const void *)3221225472;
              context[2] = __SecTokenItemAdd_block_invoke;
              context[3] = &__block_descriptor_40_e15_v24__0r_v8r_v16l;
              context[4] = MutableCopy;
              CFDictionaryApplyFunction(v28, (CFDictionaryApplierFunction)apply_block_2_8228, context);
            }
            goto LABEL_7;
          }
        }
        v18 = 0;
LABEL_7:
        v19 = (const void *)*MEMORY[0x1E0C9AE50];
        CFDictionarySetValue(MutableCopy, CFSTR("r_Attributes"), (const void *)*MEMORY[0x1E0C9AE50]);
        CFDictionarySetValue(MutableCopy, CFSTR("r_Data"), v19);
        v20 = CFDictionaryGetValue(MutableCopy, CFSTR("perm"));
        v21 = (const void *)*MEMORY[0x1E0C9AE40];
        if (v20 && v21)
        {
          if (CFEqual(v20, v21))
          {
LABEL_10:
            cf = CFRetain(MutableCopy);
LABEL_32:
            v24 = SecItemResultProcess(a3, a5, v13, cf, v12, (__CFString **)a6);
LABEL_33:
            v27 = v17;
            goto LABEL_34;
          }
        }
        else if (v20 == v21)
        {
          goto LABEL_10;
        }
        if (gSecurityd
          && (v25 = *(uint64_t (**)(__CFDictionary *, uint64_t, CFTypeRef *, CFErrorRef *))gSecurityd) != 0)
        {
          v26 = SecSecurityClientGet();
          if ((v25(MutableCopy, v26, &cf, a6) & 1) != 0)
            goto LABEL_32;
        }
        else
        {
          SecSecurityClientGet();
          v38 = MEMORY[0x1E0C809B0];
          v39 = 3221225472;
          v40 = __cftype_to_BOOL_cftype_error_request_block_invoke;
          v41 = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
          v42 = MutableCopy;
          v33 = MEMORY[0x1E0C809B0];
          v34 = 3221225472;
          v35 = __cftype_to_BOOL_cftype_error_request_block_invoke_2;
          v36 = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
          p_cf = &cf;
          if ((securityd_send_sync_and_do(0, (CFTypeRef *)a6, (uint64_t)&v38, (uint64_t)&v33) & 1) != 0)
            goto LABEL_32;
        }
LABEL_47:
        v24 = 0;
        goto LABEL_33;
      }
    }
    v27 = 0;
    v18 = 0;
    v24 = 0;
LABEL_34:
    if (cf)
      CFRelease(cf);
    if (MutableCopy)
      CFRelease(MutableCopy);
    if (v18)
      CFRelease(v18);
    if (v17)
      CFRelease(v27);
    if (v32)
      CFRelease(v32);

    goto LABEL_45;
  }
  context[0] = 0;
  logUnreasonableDataLength(a3);
  if ((isModifyingAPIRateWithinLimits() & 1) == 0)
    __security_simulatecrash(CFSTR("BUG IN CLIENT OF SECITEM: too many writes. See https://at.apple.com/secitemratelimit"), 0x53C0000Fu);
  if (gSecurityd
    && (v22 = *(uint64_t (**)(const __CFDictionary *, uint64_t, const void **, CFErrorRef *))gSecurityd) != 0)
  {
    v23 = SecSecurityClientGet();
    if ((v22(a3, v23, context, a6) & 1) == 0)
    {
      v24 = 0;
      goto LABEL_45;
    }
  }
  else
  {
    SecSecurityClientGet();
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = __cftype_to_BOOL_cftype_error_request_block_invoke;
    v41 = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
    v42 = a3;
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __cftype_to_BOOL_cftype_error_request_block_invoke_2;
    v36 = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
    p_cf = context;
    v24 = 0;
    if (!securityd_send_sync_and_do(0, (CFTypeRef *)a6, (uint64_t)&v38, (uint64_t)&v33))
      goto LABEL_45;
  }
  v24 = SecItemResultProcess(a3, a5, 0, context[0], *(CFTypeRef **)(a1 + 32), (__CFString **)a6);
  if (context[0])
    CFRelease(context[0]);
LABEL_45:

  return v24;
}

@end

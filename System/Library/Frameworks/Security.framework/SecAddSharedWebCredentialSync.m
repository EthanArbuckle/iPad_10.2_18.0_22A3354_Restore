@implementation SecAddSharedWebCredentialSync

uint64_t __SecAddSharedWebCredentialSync_block_invoke(uint64_t a1, CFTypeRef *a2)
{
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  _QWORD *v7;
  CFTypeRef v8;
  CFTypeRef v9;
  const void *v10;
  CFTypeRef v11;
  CFTypeRef cf;
  _QWORD v14[5];
  _QWORD v15[5];

  cf = 0;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  SecSecurityClientGet();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __cftype_to_BOOL_cftype_error_request_block_invoke;
  v15[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v15[4] = v4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __cftype_to_BOOL_cftype_error_request_block_invoke_2;
  v14[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v14[4] = &cf;
  v5 = securityd_send_sync_and_do(0x1Eu, a2, (uint64_t)v15, (uint64_t)v14);
  v6 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v6)
    CFRelease(v6);
  if ((v5 & 1) == 0 && !*a2)
    SecError(-26276, (__CFString **)a2, CFSTR("Internal error (XPC failure)"));
  v7 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v7)
  {
    if (a2)
      v8 = *a2;
    else
      v8 = 0;
    *v7 = v8;
    v10 = **(const void ***)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v10)
      CFRetain(v10);
  }
  else
  {
    v9 = *a2;
    if (*a2)
    {
      *a2 = 0;
      CFRelease(v9);
    }
  }
  v11 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v11);
  }
  return v5;
}

@end

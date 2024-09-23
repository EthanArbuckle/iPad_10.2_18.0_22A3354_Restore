@implementation SecKeychainSyncUpdateMessage

CFTypeRef ___SecKeychainSyncUpdateMessage_block_invoke(_QWORD *a1)
{
  uint64_t (*v2)(_QWORD, _QWORD);
  CFTypeRef result;
  uint64_t v4;
  CFTypeRef *v5;
  int v6;
  CFTypeID v7;
  CFTypeID TypeID;
  CFTypeRef cf;
  _QWORD v10[5];
  _QWORD v11[5];

  if (gSecurityd && (v2 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 504)) != 0)
  {
    result = (CFTypeRef)v2(a1[5], a1[6]);
  }
  else
  {
    v4 = a1[5];
    v5 = (CFTypeRef *)a1[6];
    cf = 0;
    v11[1] = 3221225472;
    v11[2] = __cftype_to_BOOL_cftype_error_request_block_invoke;
    v11[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
    v11[4] = v4;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __cftype_to_BOOL_cftype_error_request_block_invoke_2;
    v10[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
    v10[4] = &cf;
    v11[0] = MEMORY[0x1E0C809B0];
    v6 = securityd_send_sync_and_do(0x12u, v5, (uint64_t)v11, (uint64_t)v10);
    result = cf;
    if (v6)
    {
      if (!cf || (v7 = CFGetTypeID(cf), TypeID = CFArrayGetTypeID(), result = cf, v7 != TypeID))
      {
        SecError(-4, (__CFString **)v5, CFSTR("Unexpected nonarray returned: %@"), result);
        result = cf;
        if (cf)
        {
          cf = 0;
          CFRelease(result);
          result = cf;
        }
      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end

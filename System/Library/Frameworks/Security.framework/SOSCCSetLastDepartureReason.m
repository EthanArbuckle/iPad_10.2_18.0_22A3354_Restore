@implementation SOSCCSetLastDepartureReason

uint64_t __SOSCCSetLastDepartureReason_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, _QWORD);
  CFTypeRef *v3;
  _QWORD v4[4];
  int v5;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 472);
    if (v1)
      return v1(*(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  v3 = *(CFTypeRef **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __SOSCCSetLastDepartureReason_block_invoke_2;
  v4[3] = &__block_descriptor_36_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v5 = *(_DWORD *)(a1 + 40);
  return securityd_send_sync_and_do(0x47u, v3, (uint64_t)v4, (uint64_t)&__block_literal_global_6849);
}

uint64_t __SOSCCSetLastDepartureReason_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, "reason", *(unsigned int *)(a1 + 32));
  return 1;
}

BOOL __SOSCCSetLastDepartureReason_block_invoke_3(int a1, xpc_object_t xdict)
{
  return xpc_dictionary_get_BOOL(xdict, "status");
}

@end

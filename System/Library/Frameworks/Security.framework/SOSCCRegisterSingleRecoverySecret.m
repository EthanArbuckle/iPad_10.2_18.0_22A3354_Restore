@implementation SOSCCRegisterSingleRecoverySecret

uint64_t __SOSCCRegisterSingleRecoverySecret_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, _QWORD, _QWORD);
  char v3;
  CFTypeRef *v4;
  uint64_t v5;
  _QWORD v6[5];
  char v7;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(gSecurityd + 296);
    if (v1)
      return v1(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  v3 = *(_BYTE *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(CFTypeRef **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __keybag_and_BOOL_to_BOOL_error_request_block_invoke;
  v6[3] = &__block_descriptor_41_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v6[4] = v5;
  v7 = v3;
  return securityd_send_sync_and_do(0x4Eu, v4, (uint64_t)v6, (uint64_t)&__block_literal_global_263);
}

@end

@implementation SOSCCRegisterRecoveryPublicKey

uint64_t __SOSCCRegisterRecoveryPublicKey_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, _QWORD);
  CFTypeRef *v3;
  uint64_t v4;
  _QWORD v5[5];

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 304);
    if (v1)
      return v1(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(CFTypeRef **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __recovery_and_BOOL_to_BOOL_error_request_block_invoke;
  v5[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v5[4] = v4;
  return securityd_send_sync_and_do(0x57u, v3, (uint64_t)v5, (uint64_t)&__block_literal_global_264);
}

@end

@implementation SecTrustStoreCopyUsageConstraints

uint64_t __SecTrustStoreCopyUsageConstraints_block_invoke(_QWORD *a1, CFTypeRef *a2)
{
  uint64_t (*v2)(_QWORD, _QWORD, uint64_t, CFTypeRef *);
  _QWORD v4[5];
  _QWORD v5[4];
  __int128 v6;

  if (gTrustd)
  {
    v2 = *(uint64_t (**)(_QWORD, _QWORD, uint64_t, CFTypeRef *))(gTrustd + 128);
    if (v2)
      return v2(a1[5], a1[6], *(_QWORD *)(a1[4] + 8) + 24, a2);
  }
  v4[4] = *(_QWORD *)(a1[4] + 8) + 24;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __string_cert_to_array_error_block_invoke;
  v5[3] = &__block_descriptor_tmp_60_11802;
  v6 = *(_OWORD *)(a1 + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __string_cert_to_array_error_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_61_11803;
  return securityd_send_sync_and_do(0x65u, a2, (uint64_t)v5, (uint64_t)v4);
}

@end

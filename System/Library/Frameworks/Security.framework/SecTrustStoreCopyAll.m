@implementation SecTrustStoreCopyAll

uint64_t __SecTrustStoreCopyAll_block_invoke(uint64_t a1, CFTypeRef *a2)
{
  uint64_t (*v2)(_QWORD, uint64_t, CFTypeRef *);
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  if (gTrustd)
  {
    v2 = *(uint64_t (**)(_QWORD, uint64_t, CFTypeRef *))(gTrustd + 120);
    if (v2)
      return v2(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24, a2);
  }
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v6[2] = __string_to_array_error_block_invoke;
  v6[3] = &__block_descriptor_tmp_58_11794;
  v6[4] = v4;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __string_to_array_error_block_invoke_2;
  v5[3] = &__block_descriptor_tmp_59_11795;
  return securityd_send_sync_and_do(0x64u, a2, (uint64_t)v6, (uint64_t)v5);
}

@end

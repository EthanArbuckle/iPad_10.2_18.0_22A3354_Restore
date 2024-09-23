@implementation SecTrustStoreRemoveAll

uint64_t __SecTrustStoreRemoveAll_block_invoke(uint64_t a1, CFTypeRef *a2)
{
  uint64_t (*v2)(_QWORD);
  uint64_t v4;
  _QWORD v5[5];

  if (gTrustd)
  {
    v2 = *(uint64_t (**)(_QWORD))(gTrustd + 32);
    if (v2)
      return v2(*(_QWORD *)(a1 + 32));
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __string_to_error_block_invoke;
  v5[3] = &__block_descriptor_tmp_62_11808;
  v5[4] = v4;
  return securityd_send_sync_and_do(0x81u, a2, (uint64_t)v5, (uint64_t)&__block_literal_global_11809);
}

@end

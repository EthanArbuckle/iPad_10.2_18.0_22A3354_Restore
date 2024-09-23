@implementation SecTrustStoreRemoveCertificate

uint64_t __SecTrustStoreRemoveCertificate_block_invoke(uint64_t a1, CFTypeRef *a2)
{
  uint64_t (*v2)(_QWORD, _QWORD, CFTypeRef *);
  _QWORD v4[4];
  __int128 v5;

  if (gTrustd)
  {
    v2 = *(uint64_t (**)(_QWORD, _QWORD, CFTypeRef *))(gTrustd + 24);
    if (v2)
      return v2(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __string_cert_to_BOOL_error_block_invoke;
  v4[3] = &__block_descriptor_tmp_57_11791;
  v5 = *(_OWORD *)(a1 + 32);
  return securityd_send_sync_and_do(6u, a2, (uint64_t)v4, 0);
}

@end

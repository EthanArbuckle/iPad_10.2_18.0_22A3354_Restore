@implementation SecTrustStoreSetTrustSettings

uint64_t __SecTrustStoreSetTrustSettings_block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __SecTrustStoreSetTrustSettings_block_invoke_2;
  v3[3] = &unk_1E1FDB5B0;
  v5 = *(_QWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  result = SecOSStatusWith((uint64_t)v3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __SecTrustStoreSetTrustSettings_block_invoke_2(_QWORD *a1, CFTypeRef *a2)
{
  uint64_t (*v2)(_QWORD, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  if (gTrustd)
  {
    v2 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, CFTypeRef *))(gTrustd + 16);
    if (v2)
      return v2(a1[5], a1[6], *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24), a2);
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __string_cert_cftype_to_error_block_invoke;
  v5[3] = &__block_descriptor_tmp_56_11780;
  v6 = *(_OWORD *)(a1 + 5);
  v7 = v4;
  return securityd_send_sync_and_do(5u, a2, (uint64_t)v5, 0);
}

@end

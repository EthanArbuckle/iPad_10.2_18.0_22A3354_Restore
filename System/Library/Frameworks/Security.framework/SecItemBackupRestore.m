@implementation SecItemBackupRestore

uint64_t __SecItemBackupRestore_block_invoke(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t);
  uint64_t v3;
  CFTypeRef *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(gSecurityd + 168);
    if (v1)
      return v1(a1[5], a1[6], a1[7], a1[8], a1[9], *(_QWORD *)(a1[4] + 8) + 24);
  }
  v3 = a1[9];
  v4 = (CFTypeRef *)(*(_QWORD *)(a1[4] + 8) + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v6[2] = __string_string_data_data_data_to_BOOL_error_request_block_invoke;
  v6[3] = &__block_descriptor_tmp_89_8562;
  v5 = *(_OWORD *)(a1 + 7);
  v7 = *(_OWORD *)(a1 + 5);
  v8 = v5;
  v9 = v3;
  return securityd_send_sync_and_do(0x11u, v4, (uint64_t)v6, (uint64_t)&__block_literal_global_91);
}

@end

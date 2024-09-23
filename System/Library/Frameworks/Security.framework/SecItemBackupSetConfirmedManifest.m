@implementation SecItemBackupSetConfirmedManifest

uint64_t __SecItemBackupSetConfirmedManifest_block_invoke(_QWORD *a1)
{
  uint64_t (*v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t result;
  CFTypeRef *v4;
  uint64_t v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  if (gSecurityd && (v2 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(gSecurityd + 160)) != 0)
  {
    result = v2(a1[5], a1[6], a1[7], a1[8]);
  }
  else
  {
    v5 = a1[7];
    v4 = (CFTypeRef *)a1[8];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 0x40000000;
    v6[2] = __string_data_data_to_BOOL_error_request_block_invoke;
    v6[3] = &__block_descriptor_tmp_86_8558;
    v7 = *(_OWORD *)(a1 + 5);
    v8 = v5;
    result = securityd_send_sync_and_do(0x10u, v4, (uint64_t)v6, (uint64_t)&__block_literal_global_88_8559);
  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end

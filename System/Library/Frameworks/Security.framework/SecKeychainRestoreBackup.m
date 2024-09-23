@implementation SecKeychainRestoreBackup

uint64_t ___SecKeychainRestoreBackup_block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = ___SecKeychainRestoreBackup_block_invoke_2;
  v3[3] = &__block_descriptor_tmp_14_8481;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  result = SecOSStatusWith((uint64_t)v3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t ___SecKeychainRestoreBackup_block_invoke_2(_QWORD *a1, CFTypeRef *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  _QWORD v9[5];
  __int128 v10;

  if (gSecurityd && *(_QWORD *)(gSecurityd + 64))
  {
    v4 = a1[4];
    v8 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, CFTypeRef *))(gSecurityd + 64);
    v5 = SecSecurityClientGet();
    return v8(v4, v5, a1[5], a1[6], a2);
  }
  else
  {
    v7 = a1[4];
    SecSecurityClientGet();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __data_client_data_data_to_error_request_block_invoke;
    v9[3] = &__block_descriptor_tmp_35_8483;
    v9[4] = v7;
    v10 = *(_OWORD *)(a1 + 5);
    return securityd_send_sync_and_do(0xAu, a2, (uint64_t)v9, 0);
  }
}

@end

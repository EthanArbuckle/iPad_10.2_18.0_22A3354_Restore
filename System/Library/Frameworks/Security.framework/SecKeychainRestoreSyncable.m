@implementation SecKeychainRestoreSyncable

uint64_t ___SecKeychainRestoreSyncable_block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = ___SecKeychainRestoreSyncable_block_invoke_2;
  v3[3] = &__block_descriptor_tmp_21_8497;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  result = SecOSStatusWith((uint64_t)v3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t ___SecKeychainRestoreSyncable_block_invoke_2(_QWORD *a1, CFTypeRef *a2)
{
  uint64_t (*v2)(_QWORD, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  if (gSecurityd)
  {
    v2 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, CFTypeRef *))(gSecurityd + 128);
    if (v2)
      return v2(a1[4], a1[5], a1[6], a2);
  }
  v4 = a1[6];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __dict_data_data_to_error_request_block_invoke;
  v5[3] = &__block_descriptor_tmp_40_8498;
  v6 = *((_OWORD *)a1 + 2);
  v7 = v4;
  return securityd_send_sync_and_do(0xCu, a2, (uint64_t)v5, 0);
}

@end

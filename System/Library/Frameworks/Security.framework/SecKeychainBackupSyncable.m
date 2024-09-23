@implementation SecKeychainBackupSyncable

BOOL ___SecKeychainBackupSyncable_block_invoke(uint64_t a1, CFTypeRef *a2)
{
  uint64_t (*v3)(_QWORD, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (gSecurityd && (v3 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, CFTypeRef *))(gSecurityd + 120)) != 0)
  {
    v4 = v3(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __data_data_dict_to_dict_error_request_block_invoke;
    v8[3] = &__block_descriptor_tmp_38_8493;
    v9 = *(_OWORD *)(a1 + 40);
    v10 = v5;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __data_data_dict_to_dict_error_request_block_invoke_2;
    v7[3] = &unk_1E1FD6768;
    v7[4] = &v11;
    securityd_send_sync_and_do(0xBu, a2, (uint64_t)v8, (uint64_t)v7);
    v4 = v12[3];
    _Block_object_dispose(&v11, 8);
  }
  **(_QWORD **)(a1 + 32) = v4;
  return **(_QWORD **)(a1 + 32) != 0;
}

@end

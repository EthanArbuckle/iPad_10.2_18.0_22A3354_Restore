@implementation SecKeychainCopyEMCSBackup

uint64_t ___SecKeychainCopyEMCSBackup_block_invoke(uint64_t a1)
{
  uint64_t (*v2)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD);
  uint64_t v3;
  uint64_t result;

  if (gSecurityd && (v2 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))(gSecurityd + 56)) != 0)
  {
    v3 = SecSecurityClientGet();
    result = v2(v3, *(_QWORD *)(a1 + 40), 0, 1, 0);
  }
  else
  {
    SecSecurityClientGet();
    result = client_data_data_BOOL_to_data_error_request(*(_QWORD *)(a1 + 40), 0, 1);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end

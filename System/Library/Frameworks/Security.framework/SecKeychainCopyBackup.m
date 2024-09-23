@implementation SecKeychainCopyBackup

uint64_t ___SecKeychainCopyBackup_block_invoke(_QWORD *a1)
{
  uint64_t (*v2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v3;
  uint64_t result;

  if (gSecurityd && (v2 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(gSecurityd + 56)) != 0)
  {
    v3 = SecSecurityClientGet();
    result = v2(v3, a1[5], a1[6], 0, 0);
  }
  else
  {
    SecSecurityClientGet();
    result = client_data_data_BOOL_to_data_error_request(a1[5], a1[6], 0);
  }
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end

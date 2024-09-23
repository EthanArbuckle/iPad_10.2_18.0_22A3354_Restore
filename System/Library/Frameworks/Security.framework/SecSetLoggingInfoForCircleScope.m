@implementation SecSetLoggingInfoForCircleScope

uint64_t __SecSetLoggingInfoForCircleScope_block_invoke(_QWORD *a1)
{
  uint64_t (*v2)(_QWORD, _QWORD);
  uint64_t result;
  CFTypeRef *v4;
  uint64_t v5;
  _QWORD v6[5];

  if (gSecurityd && (v2 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 528)) != 0)
  {
    result = v2(a1[5], a1[6]);
  }
  else
  {
    v5 = a1[5];
    v4 = (CFTypeRef *)a1[6];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 0x40000000;
    v6[2] = __dict_to_error_request_block_invoke_13392;
    v6[3] = &__block_descriptor_tmp_5_13393;
    v6[4] = v5;
    result = securityd_send_sync_and_do(0x21u, v4, (uint64_t)v6, 0);
  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end

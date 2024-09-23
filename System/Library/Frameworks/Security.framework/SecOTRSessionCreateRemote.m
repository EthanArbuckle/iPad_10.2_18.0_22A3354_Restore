@implementation SecOTRSessionCreateRemote

void __SecOTRSessionCreateRemote_block_invoke(_QWORD *a1)
{
  uint64_t (*v2)(_QWORD, _QWORD);
  uint64_t v3;
  CFTypeRef *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (SecOTRGetDefaultsWriteSeconds_sdOnceToken != -1)
    dispatch_once(&SecOTRGetDefaultsWriteSeconds_sdOnceToken, &__block_literal_global_10243);
  if (gSecurityd && (v2 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 176)) != 0)
  {
    v3 = v2(a1[5], a1[6]);
  }
  else
  {
    v5 = a1[5];
    v4 = (CFTypeRef *)a1[6];
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v6[4] = &v8;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __data_to_data_error_request_block_invoke;
    v7[3] = &__block_descriptor_tmp_73_10279;
    v7[4] = v5;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 0x40000000;
    v6[2] = __data_to_data_error_request_block_invoke_2;
    v6[3] = &unk_1E1FD8988;
    securityd_send_sync_and_do(0x15u, v4, (uint64_t)v7, (uint64_t)v6);
    v3 = v9[3];
    _Block_object_dispose(&v8, 8);
  }
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v3;
}

@end

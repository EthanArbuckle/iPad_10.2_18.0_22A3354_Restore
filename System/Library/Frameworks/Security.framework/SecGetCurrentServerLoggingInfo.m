@implementation SecGetCurrentServerLoggingInfo

void __SecGetCurrentServerLoggingInfo_block_invoke(uint64_t a1)
{
  uint64_t (*v2)(_QWORD);
  uint64_t v3;
  CFTypeRef *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (gSecurityd && (v2 = *(uint64_t (**)(_QWORD))(gSecurityd + 512)) != 0)
  {
    v3 = v2(*(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = *(CFTypeRef **)(a1 + 40);
    v6 = 0;
    v7 = &v6;
    v8 = 0x2000000000;
    v9 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 0x40000000;
    v5[2] = __void_to_dict_error_request_block_invoke;
    v5[3] = &unk_1E1FDC378;
    v5[4] = &v6;
    securityd_send_sync_and_do(0x1Fu, v4, 0, (uint64_t)v5);
    v3 = v7[3];
    _Block_object_dispose(&v6, 8);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

@end

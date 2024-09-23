@implementation SecOTRSessionProcessPacketRemote

void __SecOTRSessionProcessPacketRemote_block_invoke(_QWORD *a1)
{
  uint64_t (*v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  char v3;
  _QWORD *v4;
  _QWORD *v5;
  CFTypeRef *v6;
  _BYTE *v7;
  _QWORD v8[7];
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  if (gSecurityd
    && (v2 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(gSecurityd + 184)) != 0)
  {
    v3 = v2(a1[5], a1[6], a1[7], a1[8], a1[9], a1[10]);
  }
  else
  {
    v5 = (_QWORD *)a1[7];
    v4 = (_QWORD *)a1[8];
    v7 = (_BYTE *)a1[9];
    v6 = (CFTypeRef *)a1[10];
    v19 = 0;
    v20 = &v19;
    v21 = 0x2000000000;
    v22 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2000000000;
    v18 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __data_data_to_data_data_BOOL_error_request_block_invoke;
    v9[3] = &__block_descriptor_tmp_75_10284;
    v10 = *(_OWORD *)(a1 + 5);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __data_data_to_data_data_BOOL_error_request_block_invoke_2;
    v8[3] = &unk_1E1FD89D0;
    v8[4] = &v19;
    v8[5] = &v15;
    v8[6] = &v11;
    v3 = securityd_send_sync_and_do(0x16u, v6, (uint64_t)v9, (uint64_t)v8);
    *v5 = v20[3];
    *v4 = v16[3];
    *v7 = *((_BYTE *)v12 + 24);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v3;
}

@end

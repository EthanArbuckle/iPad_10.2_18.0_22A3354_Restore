@implementation SecOTRVerifyAndExposeRawCompact

void __SecOTRVerifyAndExposeRawCompact_locked_block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v4 = SecOTRPublicIdentityCopyFromPrivate(*MEMORY[0x1E0C9AE00], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v6[2] = __SecOTRVerifyAndExposeRawCompact_locked_block_invoke_2;
  v6[3] = &__block_descriptor_tmp_70_10269;
  v7 = *(_OWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = a2;
  v10 = v5;
  v11 = *(_BYTE *)(a1 + 64);
  SecOTRPIPerformWithSerializationString((uint64_t)v4, (uint64_t)v6);
  if (v4)
    CFRelease(v4);
}

void __SecOTRVerifyAndExposeRawCompact_locked_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  char v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __SecOTRVerifyAndExposeRawCompact_locked_block_invoke_3;
  v3[3] = &__block_descriptor_tmp_69_10270;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  v7 = *(_OWORD *)(a1 + 56);
  v8 = *(_BYTE *)(a1 + 72);
  SecOTRPIPerformWithSerializationString(v2, (uint64_t)v3);
}

void __SecOTRVerifyAndExposeRawCompact_locked_block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  _QWORD *v19;
  __int16 v20;
  _QWORD *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = secLogObjForScope("OTR");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = v5[10];
    v8 = v5[11];
    v9 = v5[13];
    v10 = v5[14];
    v18 = 134219522;
    v19 = v5;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "session[%p] failed to decrypt, session: %@, mk: %@, mpk: %@, tpk: %@, tk: %@, chose tktu: %@", (uint8_t *)&v18, 0x48u);
  }
  v11 = secLogObjForScope("OTR");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD **)(a1 + 32);
    v13 = *(_QWORD **)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 64);
    v16 = *(_QWORD *)(a1 + 72);
    v17 = *(unsigned __int8 *)(a1 + 80);
    v18 = 134219522;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v14;
    v24 = 2112;
    v25 = a2;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    v30 = 1024;
    LODWORD(v31) = v17;
    _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "session[%p] failed to decrypt, mktu: %@, mpi: %@, tpi: %@, m: %@, tP: %@, tb: %hhx", (uint8_t *)&v18, 0x44u);
  }
}

@end

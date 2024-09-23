@implementation SecOTRVerifyAndExposeRaw

void __SecOTRVerifyAndExposeRaw_locked_block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v4 = SecOTRPublicIdentityCopyFromPrivate(*MEMORY[0x1E0C9AE00], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __SecOTRVerifyAndExposeRaw_locked_block_invoke_2;
  v5[3] = &__block_descriptor_tmp_67_10273;
  v6 = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  SecOTRPIPerformWithSerializationString((uint64_t)v4, (uint64_t)v5);
  if (v4)
    CFRelease(v4);
}

void __SecOTRVerifyAndExposeRaw_locked_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __SecOTRVerifyAndExposeRaw_locked_block_invoke_3;
  v4[3] = &__block_descriptor_tmp_66_10274;
  v2 = *(_QWORD *)(a1[4] + 32);
  v5 = *((_OWORD *)a1 + 2);
  v3 = a1[7];
  v6 = a1[6];
  v7 = a2;
  v8 = v3;
  SecOTRPIPerformWithSerializationString(v2, (uint64_t)v4);
}

void __SecOTRVerifyAndExposeRaw_locked_block_invoke_3(_QWORD *a1, uint64_t a2)
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
  int v16;
  _QWORD *v17;
  __int16 v18;
  _QWORD *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = secLogObjForScope("OTR");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (_QWORD *)a1[4];
    v6 = a1[5];
    v7 = v5[10];
    v8 = v5[11];
    v9 = v5[13];
    v10 = v5[14];
    v16 = 134219522;
    v17 = v5;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "session[%p] failed to decrypt, session: %@, mk: %@, mpk: %@, tpk: %@, tk: %@, chose tktu: %@", (uint8_t *)&v16, 0x48u);
  }
  v11 = secLogObjForScope("OTR");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (_QWORD *)a1[4];
    v13 = (_QWORD *)a1[6];
    v14 = a1[7];
    v15 = a1[8];
    v16 = 134219010;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = a2;
    v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "session[%p] failed to decrypt, mktu: %@, mpi: %@, tpi: %@, m: %@", (uint8_t *)&v16, 0x34u);
  }
}

@end

@implementation SecOTRSessionCreateFromID

void __SecOTRSessionCreateFromID_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __SecOTRSessionCreateFromID_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_17_10251;
  v4[4] = v2;
  v4[5] = a2;
  SecOTRPIPerformWithSerializationString(v3, (uint64_t)v4);
}

void __SecOTRSessionCreateFromID_block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = secLogObjForScope("otr");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = a2;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "%@ Creating with M: %@, T: %@", (uint8_t *)&v7, 0x20u);
  }
}

@end

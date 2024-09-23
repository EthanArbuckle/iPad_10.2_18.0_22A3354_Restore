@implementation SecOTRSProcessRevealSignatureMessage

void __SecOTRSProcessRevealSignatureMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = secLogObjForScope("otr");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = a2;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "%@ Sending Signature message: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __SecOTRSProcessRevealSignatureMessage_block_invoke_37(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = secLogObjForScope("otr");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_DWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v5;
    v9 = 1024;
    v10 = v6;
    v11 = 2112;
    v12 = a2;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "%@ Failed to process reveal sig message (%d): %@", (uint8_t *)&v7, 0x1Cu);
  }
}

@end

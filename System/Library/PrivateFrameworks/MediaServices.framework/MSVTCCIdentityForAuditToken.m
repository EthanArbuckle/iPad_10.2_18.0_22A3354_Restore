@implementation MSVTCCIdentityForAuditToken

void __MSVTCCIdentityForAuditToken_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    v7 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = a3;
      _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_ERROR, "MSVTCCIdentityForAuditToken failed. error=%@", (uint8_t *)&v8, 0xCu);
    }

  }
}

@end

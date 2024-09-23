@implementation SOSPeerInfoCopyWithBackupKeyUpdate

uint64_t __SOSPeerInfoCopyWithBackupKeyUpdate_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFData *v4;
  const __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(const __CFData **)(a1 + 32);
  if (v4)
  {
    v5 = SOSCopyIDOfDataBufferWithLength(v4, 8);
    secLogObjForScope("backup");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "Setting peerInfo backupKey to %@", (uint8_t *)&v9, 0xCu);
    }

    if (v5)
      CFRelease(v5);
    SOSPeerInfoV2DictionarySetValue(a2, (const void *)sBackupKeyKey, *(const void **)(a1 + 32));
  }
  else
  {
    secLogObjForScope("backup");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "Setting peerInfo backupKey to NULL", (uint8_t *)&v9, 2u);
    }

    SOSPeerInfoV2DictionaryRemoveValue(a2, (const void *)sBackupKeyKey);
  }
  return 1;
}

@end

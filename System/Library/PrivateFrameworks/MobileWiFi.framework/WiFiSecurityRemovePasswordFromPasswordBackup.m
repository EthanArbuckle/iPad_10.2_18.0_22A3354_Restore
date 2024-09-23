@implementation WiFiSecurityRemovePasswordFromPasswordBackup

intptr_t __WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  NSObject *v12;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
      v12 = MEMORY[0x1E0C81028];
      v13 = "%s: null ssid";
LABEL_18:
      _os_log_impl(&dword_1B9B9D000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0xCu);
    }
LABEL_19:
    v4 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v2, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
      v12 = MEMORY[0x1E0C81028];
      v13 = "%s: error: empty ssid";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v3 = WiFiSecurityCopySSIDHashForPasswordBackup(*(void **)(a1 + 32));
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "length"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v14 = 136315138;
    v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
    v8 = MEMORY[0x1E0C81028];
    v9 = "%s: error: empty ssid hash";
    v10 = 12;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v14 = 136315650;
    v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: ssid %@ (%@)", (uint8_t *)&v14, 0x20u);
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v6, "setObject:forKey:", v4, *MEMORY[0x1E0CD68F8]);
  objc_msgSend(v6, "setObject:forKey:", CFSTR("AirPort"), *MEMORY[0x1E0CD6B58]);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = SecItemDelete((CFDictionaryRef)v6);
  v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315650;
    v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
    v16 = 2112;
    v17 = v4;
    v18 = 1024;
    LODWORD(v19) = v7;
    v8 = MEMORY[0x1E0C81028];
    v9 = "%s:[%@] error result %d \n";
    v10 = 28;
LABEL_10:
    _os_log_impl(&dword_1B9B9D000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v10);
  }
LABEL_11:

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end

@implementation WiFiSecuritySavePasswordForPasswordBackup

intptr_t __WiFiSecuritySavePasswordForPasswordBackup_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  void *v16;
  CFTypeRef result;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  result = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    v13 = MEMORY[0x1E0C81028];
    v14 = "%s: null ssid";
LABEL_24:
    v15 = 12;
LABEL_27:
    _os_log_impl(&dword_1B9B9D000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
    goto LABEL_28;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    v13 = MEMORY[0x1E0C81028];
    v14 = "%s: null password";
    goto LABEL_24;
  }
  if (!objc_msgSend(v2, "length"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    v13 = MEMORY[0x1E0C81028];
    v14 = "%s: error: empty ssid";
    goto LABEL_24;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
      v20 = 2112;
      v21 = v16;
      v13 = MEMORY[0x1E0C81028];
      v14 = "%s: error: empty password for ssid %@";
      v15 = 22;
      goto LABEL_27;
    }
LABEL_28:
    v4 = 0;
    goto LABEL_15;
  }
  v3 = WiFiSecurityCopySSIDHashForPasswordBackup(*(void **)(a1 + 32));
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "length"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136315138;
    v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    v9 = MEMORY[0x1E0C81028];
    v10 = "%s: error: empty ssid hash";
    v11 = 12;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: ssid %@ (%@)", buf, 0x20u);
  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "dataUsingEncoding:", 4);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v7, "setObject:forKey:", v4, *MEMORY[0x1E0CD68F8]);
  objc_msgSend(v7, "setObject:forKey:", CFSTR("AirPort"), *MEMORY[0x1E0CD6B58]);
  objc_msgSend(v7, "setObject:forKey:", v6, *MEMORY[0x1E0CD70D8]);
  objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x1E0CD68A8], *MEMORY[0x1E0CD68A0]);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = SecItemAdd((CFDictionaryRef)v7, &result);
  v8 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v8 == -25299)
  {
    WiFiSecurityRemovePasswordFromPasswordBackup(*(_QWORD *)(a1 + 32));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = SecItemAdd((CFDictionaryRef)v7, &result);
    v8 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    v20 = 2112;
    v21 = v4;
    v22 = 1024;
    LODWORD(v23) = v8;
    v9 = MEMORY[0x1E0C81028];
    v10 = "%s:[%@] error result %d \n";
    v11 = 28;
LABEL_14:
    _os_log_impl(&dword_1B9B9D000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
  }
LABEL_15:

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end

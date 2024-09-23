@implementation OSAGetSubmittableLogs

void __OSAGetSubmittableLogs_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a2);
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");
  if (getxattr(v4, "DoNotSubmit", 0, 0, 0, 0) >= 1
    && (objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D64FC8]),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "BOOLValue"),
        v5,
        v6))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = v4;
      _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Skipping DoNotSubmit tagged report at %s", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

@end

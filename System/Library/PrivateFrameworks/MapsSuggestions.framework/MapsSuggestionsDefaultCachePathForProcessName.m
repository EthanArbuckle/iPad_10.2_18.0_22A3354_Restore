@implementation MapsSuggestionsDefaultCachePathForProcessName

void __MapsSuggestionsDefaultCachePathForProcessName_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MapsSuggestionsDefaultCacheDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MapsSuggestionsManager_%@.storage"), *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ED22EF98;
    qword_1ED22EF98 = v4;

    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v8 = qword_1ED22EF98;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "Using path %@", buf, 0xCu);
    }

  }
}

@end

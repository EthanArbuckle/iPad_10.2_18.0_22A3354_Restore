@implementation MapsSuggestionsPathForSuppressedEntries

void __MapsSuggestionsPathForSuppressedEntries_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MapsSuggestionsDefaultCacheDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("suppressedEntries.data"));
    objc_msgSend(v0, "stringByAppendingPathComponent:", v1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)qword_1ED22EFA8;
    qword_1ED22EFA8 = v2;

    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = qword_1ED22EFA8;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Using path %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

@end

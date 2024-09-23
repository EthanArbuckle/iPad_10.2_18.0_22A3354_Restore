@implementation MapsSuggestionsSearchTerminal

void __MapsSuggestionsSearchTerminal_block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || objc_msgSend(v5, "count") != 2)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = a1[4];
      v12 = a1[5];
      *(_DWORD *)buf = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_FAULT, "Couldn't get Terminal '%@' within airport '%@': %@", buf, 0x20u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v7 = a1[6];
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v9, 0);

  }
}

@end

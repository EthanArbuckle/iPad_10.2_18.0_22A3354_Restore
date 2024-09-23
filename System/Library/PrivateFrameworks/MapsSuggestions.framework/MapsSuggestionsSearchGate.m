@implementation MapsSuggestionsSearchGate

void __MapsSuggestionsSearchGate_block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || objc_msgSend(v5, "count") != 3)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = a1[4];
      v12 = a1[5];
      v13 = a1[6];
      *(_DWORD *)buf = 138413058;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_FAULT, "Couldn't get Gate '%@' within airport '%@' Terminal '%@': %@", buf, 0x2Au);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    v7 = a1[7];
    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v9, 0);

  }
}

@end

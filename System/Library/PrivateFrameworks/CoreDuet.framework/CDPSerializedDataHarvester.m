@implementation CDPSerializedDataHarvester

void __72___CDPSerializedDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _CDPSimpleDataPoint *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v2, "stringWithContentsOfFile:encoding:error:", v4, 4, &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v25;

  if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __72___CDPSerializedDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke_cold_1((uint64_t)v6);
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(_CDPSimpleDataPoint);
  v23 = v6;
  v24 = v5;
  if ((unint64_t)objc_msgSend(v8, "count") <= *(_QWORD *)(a1 + 56))
    v10 = 0;
  else
    v10 = (int)(objc_msgSend(v8, "count") - *(_DWORD *)(a1 + 56));
  for (; objc_msgSend(v8, "count") > v10; ++v10)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") && (unint64_t)objc_msgSend(v11, "length") >= 0xA)
    {
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDPSimpleDataPoint setUserIsSender:](v9, "setUserIsSender:", objc_msgSend(v13, "isEqualToString:", CFSTR("YES")));

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDPSimpleDataPoint setUserIsThreadInitiator:](v9, "setUserIsThreadInitiator:", objc_msgSend(v14, "isEqualToString:", CFSTR("YES")));

      v15 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDPSimpleDataPoint setTimestamp:](v9, "setTimestamp:", v17);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v12, "count") >= 4)
      {
        v19 = 3;
        do
        {
          v20 = v19 + 1;
          objc_msgSend(v12, "objectAtIndexedSubscript:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v21);

          v22 = objc_msgSend(v12, "count");
          v19 = v20;
        }
        while (v22 > v20);
      }
      -[_CDPSimpleDataPoint setPeopleIdentifiers:](v9, "setPeopleIdentifiers:", v18);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __72___CDPSerializedDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

@end

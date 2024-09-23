@implementation SGMicrodataToJsonParser

+ (id)parseMicrodataToJsonLd:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  __CFString *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  +[SGMicrodataParser parse:](SGMicrodataParser, "parse:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asJsonLd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 1, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      v11 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
    }
    else
    {
      sgLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v14 = 0;
        _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "Error: Failed to serialize to JSON", v14, 2u);
      }

      v10 = 0;
      v11 = 0;
    }
  }
  else
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "JSON Data is Empty. Nothing to return.", buf, 2u);
    }
    v11 = &stru_1E7DB83A8;
  }

  return v11;
}

@end

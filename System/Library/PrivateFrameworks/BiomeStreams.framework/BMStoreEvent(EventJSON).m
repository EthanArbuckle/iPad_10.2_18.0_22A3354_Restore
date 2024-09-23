@implementation BMStoreEvent(EventJSON)

- (id)jsonDictionary
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "timestamp");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithObjectsAndKeys:", v6, CFSTR("eventTimestamp"), 0);

  objc_msgSend(a1, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(a1, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "jsonDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v11);

  }
  objc_msgSend(a1, "eventBody");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    objc_msgSend(a1, "eventBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "jsonDict");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v15);

  }
  v16 = (void *)objc_msgSend(v7, "copy");

  return v16;
}

- (id)json
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  id v10;

  objc_msgSend(a1, "jsonDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v8 = v3;
  }
  else
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BMStoreEvent(EventJSON) json].cold.1(a1, (uint64_t)v5, v7);

    v8 = 0;
  }

  return v8;
}

- (void)json
{
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 138412802;
  v7 = objc_opt_class();
  v8 = 2112;
  v9 = objc_msgSend(a1, "dataType");
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_18D810000, a3, OS_LOG_TYPE_ERROR, "Failed to serialize store event %@ with type %@ to JSON: %@", (uint8_t *)&v6, 0x20u);
}

@end

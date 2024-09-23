@implementation NSDictionary(DMCUtilities)

+ (id)DMCDictionaryFromFile:()DMCUtilities
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v10 = objc_msgSend(v7, "code");

      if (v10 != 4)
        goto LABEL_2;
    }
    else
    {

    }
    v11 = *DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v3;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_ERROR, "Failed to make dictionary from file at path: %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }
LABEL_2:

  return v5;
}

- (uint64_t)DMCWriteToBinaryFile:()DMCUtilities
{
  id v4;
  DMCDictionaryWriter *v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[DMCDictionaryWriter initWithDictionary:path:]([DMCDictionaryWriter alloc], "initWithDictionary:path:", a1, v4);

  v6 = -[DMCDictionaryWriter write](v5, "write");
  return v6;
}

- (id)dmc_valueOfClass:()DMCUtilities forKey:
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "objectForKeyedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)dmc_jsonDictionaryFromData:()DMCUtilities
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = *DMCLogObjects();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138543362;
        v14 = v4;
        v8 = "Failed to serialize data with error: %{public}@";
        v9 = v6;
        v10 = 12;
LABEL_9:
        _os_log_impl(&dword_1A4951000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
      }
    }
    else if (v7)
    {
      *(_WORD *)buf = 0;
      v8 = "JSON Dict from response data is not valid.";
      v9 = v6;
      v10 = 2;
      goto LABEL_9;
    }
    v5 = 0;
    goto LABEL_11;
  }
  v5 = v3;
LABEL_11:

  return v5;
}

- (id)DMCShortenedPlistDescription
{
  void *v1;
  void *v2;

  objc_msgSend((id)objc_opt_class(), "DMCShortenedDictionary:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)DMCShortenedObject:()DMCUtilities
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "DMCShortenedArray:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "DMCShortenedDictionary:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "DMCShortenedData:", v4);
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = v4;
      }
    }
  }
  v6 = v5;

  return v6;
}

+ (id)DMCShortenedDictionary:()DMCUtilities
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__NSDictionary_DMCUtilities__DMCShortenedDictionary___block_invoke;
  v9[3] = &unk_1E4D370D0;
  v7 = v6;
  v10 = v7;
  v11 = a1;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

+ (id)DMCShortenedArray:()DMCUtilities
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "DMCShortenedObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)DMCShortenedData:()DMCUtilities
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v3, "length");
    v5 = (void *)MEMORY[0x1E0CB3940];
    if (v4 > 0x10)
    {
      objc_msgSend(v3, "subdataWithRange:", 0, 8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "DMCHexString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "subdataWithRange:", objc_msgSend(v3, "length") - 8, 8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "DMCHexString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("0x%@ ... 0x%@"), v8, v10);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "DMCHexString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("0x%@"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = CFSTR("<empty>");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Data { length = %lu, bytes = %@ }"), objc_msgSend(v3, "length"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end

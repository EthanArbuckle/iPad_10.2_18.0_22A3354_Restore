@implementation NSDictionary(xpcdictConv)

+ (id)dictionaryWithXPCDictionary:()xpcdictConv
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDBCE70];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithXPCDictionary:", v4);

  return v5;
}

- (id)initWithXPCDictionary:()xpcdictConv
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__3;
  v16[3] = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __51__NSDictionary_xpcdictConv__initWithXPCDictionary___block_invoke;
  v12 = &unk_24D0ADCF8;
  v14 = &v15;
  v5 = a1;
  v13 = v5;
  if (xpc_dictionary_apply(v4, &v9))
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[NSDictionary(xpcdictConv) initWithXPCDictionary:].cold.1((uint64_t)v16, v6);

    v5 = (id)objc_msgSend(v5, "initWithDictionary:", *(_QWORD *)(v16[0] + 40), v9, v10, v11, v12);
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)createXPCDictionary
{
  xpc_object_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  uint64_t v24;
  id v25;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = xpc_dictionary_create(0, 0, 0);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
        objc_msgSend(v3, "objectForKey:", v8, (_QWORD)v28);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          xpc_dictionary_set_string(v2, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
            v11 = objc_retainAutorelease(v9);
            xpc_dictionary_set_data(v2, v10, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v12 = objc_retainAutorelease(v9);
              if (!strcmp((const char *)objc_msgSend(v12, "objCType"), "i")
                || (v13 = objc_retainAutorelease(v12), !strcmp((const char *)objc_msgSend(v13, "objCType"), "s"))
                || (v14 = objc_retainAutorelease(v13), !strcmp((const char *)objc_msgSend(v14, "objCType"), "q"))
                || (v15 = objc_retainAutorelease(v14), !strcmp((const char *)objc_msgSend(v15, "objCType"), "q")))
              {
                xpc_dictionary_set_int64(v2, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), objc_msgSend(v12, "longLongValue"));
              }
              else
              {
                v16 = objc_retainAutorelease(v15);
                if (!strcmp((const char *)objc_msgSend(v16, "objCType"), "f")
                  || (v17 = objc_retainAutorelease(v16), !strcmp((const char *)objc_msgSend(v17, "objCType"), "d")))
                {
                  v22 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
                  objc_msgSend(v16, "doubleValue");
                  xpc_dictionary_set_double(v2, v22, v23);
                }
                else
                {
                  v18 = objc_retainAutorelease(v17);
                  if (strcmp((const char *)objc_msgSend(v18, "objCType"), "B"))
                  {
                    v19 = objc_retainAutorelease(v18);
                    if (strcmp((const char *)-[NSObject objCType](v19, "objCType"), "c"))
                    {
                      defaultLogHandle();
                      v27 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                        -[NSDictionary(xpcdictConv) createXPCDictionary].cold.1(v19, v27);

LABEL_31:
                      v25 = 0;
                      goto LABEL_32;
                    }
                  }
                  xpc_dictionary_set_BOOL(v2, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), objc_msgSend(v18, "BOOLValue"));
                }
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                defaultLogHandle();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  -[NSDictionary(xpcdictConv) createXPCDictionary].cold.2((uint64_t)v8, (uint64_t)v9, v19);
                goto LABEL_31;
              }
              v20 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
              objc_msgSend(v9, "timeIntervalSince1970");
              xpc_dictionary_set_date(v2, v20, (uint64_t)v21);
            }
          }
        }

        ++v7;
      }
      while (v5 != v7);
      v24 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v5 = v24;
    }
    while (v24);
  }

  v25 = v2;
LABEL_32:

  return v25;
}

+ (NSObject)dictionaryFromJsonData:()xpcdictConv
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;

  v3 = a3;
  if (!v3)
  {
    defaultLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[NSDictionary(xpcdictConv) dictionaryFromJsonData:].cold.1(v5, v8, v9);
    goto LABEL_11;
  }
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 0, &v12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (!v4)
  {
    defaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[NSDictionary(xpcdictConv) dictionaryFromJsonData:].cold.2(v5);

LABEL_11:
    v6 = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;

    v5 = v6;
  }
  else
  {
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[NSDictionary(xpcdictConv) dictionaryFromJsonData:].cold.3();

    v6 = 0;
    v5 = v4;
  }
LABEL_5:

  return v6;
}

+ (id)dictionaryFromXPCDictionary:()xpcdictConv withDataFromKey:
{
  id v6;
  void *v7;
  uint64_t v8;
  const void *bytes_ptr;
  size_t length;
  NSObject *v11;
  dispatch_data_t v12;
  void *v13;
  _QWORD destructor[4];
  id v16;

  v6 = a3;
  v7 = v6;
  if (a4
    && (xpc_dictionary_get_value(v6, (const char *)a4), v8 = objc_claimAutoreleasedReturnValue(), (a4 = (id)v8) != 0)
    && MEMORY[0x2199BBE54](v8) == MEMORY[0x24BDACF90])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(a4);
    length = xpc_data_get_length(a4);
    dispatch_get_global_queue(9, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    destructor[0] = MEMORY[0x24BDAC760];
    destructor[1] = 3221225472;
    destructor[2] = __73__NSDictionary_xpcdictConv__dictionaryFromXPCDictionary_withDataFromKey___block_invoke;
    destructor[3] = &unk_24D0ADBA8;
    a4 = a4;
    v16 = a4;
    v12 = dispatch_data_create(bytes_ptr, length, v11, destructor);

    objc_msgSend(a1, "dictionaryFromJsonData:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (uint64_t)saveAsDataInXPCDictionary:()xpcdictConv forKey:
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  xpc_object_t v10;

  v6 = a3;
  v7 = 0;
  if (v6)
  {
    if (a4)
    {
      objc_msgSend(a1, "convertToNSData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (uint64_t)v8;
      if (v8)
      {
        v9 = objc_msgSend(v8, "_createDispatchData");
        v10 = xpc_data_create_with_dispatch_data(v9);

        xpc_dictionary_set_value(v6, a4, v10);
        v7 = 1;
      }
    }
  }

  return v7;
}

- (NSObject)convertToNSData
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v6;
  id v7;

  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", a1) & 1) == 0)
  {
    defaultLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[NSDictionary(xpcdictConv) convertToNSData].cold.2();
    goto LABEL_10;
  }
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a1, 0, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (!v2)
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSDictionary(xpcdictConv) convertToNSData].cold.1(v3);

LABEL_10:
    v4 = 0;
    goto LABEL_4;
  }
  v4 = v2;

  v3 = v4;
LABEL_4:

  return v4;
}

- (id)objectForKey:()xpcdictConv ofType:
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (void)initWithXPCDictionary:()xpcdictConv .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_213A7E000, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSDictionary: %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)createXPCDictionary
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v8 = 138543618;
  v9 = a1;
  OUTLINED_FUNCTION_4_0();
  v6 = v5;
  OUTLINED_FUNCTION_3_0(&dword_213A7E000, a3, v7, "The value for key %{public}@ has unsupported type %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_7_0();
}

+ (void)dictionaryFromJsonData:()xpcdictConv .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "+[NSDictionary(xpcdictConv) dictionaryFromJsonData:]";
  v5 = 2114;
  v6 = 0;
  OUTLINED_FUNCTION_3_0(&dword_213A7E000, a1, a3, "%s: Cannot convert %{public}@ to dictionary", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)dictionaryFromJsonData:()xpcdictConv .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_213A7E000, v2, v3, "Failed to deserialize JSON object with error - %{public}@(0x%tx). Target: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

+ (void)dictionaryFromJsonData:()xpcdictConv .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "+[NSDictionary(xpcdictConv) dictionaryFromJsonData:]";
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_213A7E000, v0, v1, "%s: format not correct: %{public}@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

- (void)convertToNSData
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[NSDictionary(xpcdictConv) convertToNSData]";
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_213A7E000, v0, v1, "%s: Not a valid JSON object: %{public}@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

@end

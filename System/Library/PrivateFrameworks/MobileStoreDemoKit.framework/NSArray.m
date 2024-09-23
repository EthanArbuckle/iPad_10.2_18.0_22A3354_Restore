@implementation NSArray

uint64_t __42__NSArray_xpcarrayConv__initWithXPCArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const void *bytes_ptr;
  size_t length;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = MEMORY[0x2199BBE54]();
  if (v6 == MEMORY[0x24BDACF80])
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", xpc_BOOL_get_value(v5));
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v15 = (void *)v11;
    objc_msgSend(v10, "addObject:", v11);

    v9 = 1;
    goto LABEL_23;
  }
  if (v6 == MEMORY[0x24BDACFF0])
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", xpc_string_get_string_ptr(v5), 4);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x24BDACFD0])
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", xpc_int64_get_value(v5));
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x24BDACFF8])
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", xpc_uint64_get_value(v5));
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x24BDACF90])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    length = xpc_data_get_length(v5);
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", bytes_ptr, length);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x24BDACFA8])
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", xpc_double_get_value(v5));
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x24BDACFA0])
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithXPCDictionary:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x24BDACF78])
  {
    v14 = *(void **)(a1 + 32);
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v11 = objc_msgSend(v14, "initWithXPCArray:", v5);
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x24BDACF98])
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)xpc_date_get_value(v5));
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  defaultLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __42__NSArray_xpcarrayConv__initWithXPCArray___block_invoke_cold_1(a2, v7, v8);

  v9 = 0;
LABEL_23:

  return v9;
}

void __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  xpc_object_t v21;
  void *v22;
  double v23;
  NSObject *v24;
  double v25;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    v8 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
LABEL_5:
    v10 = v8;
    xpc_array_append_value(v7, v8);

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    v9 = objc_retainAutorelease(v6);
    v8 = xpc_data_create((const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_retainAutorelease(v6);
    if (!strcmp((const char *)objc_msgSend(v11, "objCType"), "i")
      || (v12 = objc_retainAutorelease(v11), !strcmp((const char *)objc_msgSend(v12, "objCType"), "s"))
      || (v13 = objc_retainAutorelease(v12), !strcmp((const char *)objc_msgSend(v13, "objCType"), "q"))
      || (v14 = objc_retainAutorelease(v13), !strcmp((const char *)objc_msgSend(v14, "objCType"), "q")))
    {
      v20 = *(void **)(a1 + 32);
      v21 = xpc_int64_create(objc_msgSend(v11, "longLongValue"));
    }
    else
    {
      v15 = objc_retainAutorelease(v14);
      if (!strcmp((const char *)objc_msgSend(v15, "objCType"), "f")
        || (v16 = objc_retainAutorelease(v15), !strcmp((const char *)objc_msgSend(v16, "objCType"), "d")))
      {
        v20 = *(void **)(a1 + 32);
        objc_msgSend(v15, "doubleValue");
        v21 = xpc_double_create(v25);
      }
      else
      {
        v17 = objc_retainAutorelease(v16);
        if (strcmp((const char *)objc_msgSend(v17, "objCType"), "B"))
        {
          v18 = objc_retainAutorelease(v17);
          if (strcmp((const char *)objc_msgSend(v18, "objCType"), "c"))
          {
            defaultLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke_cold_1(v18, v19);

            *a4 = 1;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
            goto LABEL_23;
          }
        }
        v20 = *(void **)(a1 + 32);
        v21 = xpc_BOOL_create(objc_msgSend(v17, "BOOLValue"));
      }
    }
    v22 = v21;
    xpc_array_append_value(v20, v21);

LABEL_23:
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "xpcArrayFromArray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "createXPCDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = xpc_date_create((uint64_t)v23);
    goto LABEL_5;
  }
  defaultLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke_cold_2(v24);

  *a4 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
LABEL_6:

}

void __42__NSArray_xpcarrayConv__initWithXPCArray___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_213A7E000, a2, a3, "The value at index %lu in this xpcArray are of an unsupported type", (uint8_t *)&v3);
}

void __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 136315138;
  v5 = objc_msgSend(objc_retainAutorelease(a1), "objCType");
  OUTLINED_FUNCTION_0(&dword_213A7E000, a2, v3, "Unsupported NSNumber type: %s for xpc dictionary encoding", (uint8_t *)&v4);
}

void __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213A7E000, log, OS_LOG_TYPE_ERROR, "The values in this NSArray are of an unsupported type", v1, 2u);
}

@end

@implementation NSDictionary

uint64_t __51__NSDictionary_xpcdictConv__initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const void *bytes_ptr;
  size_t length;
  void *v16;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a2, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x2199BBE54](v5);
  if (v7 == MEMORY[0x24BDACF80])
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", xpc_BOOL_get_value(v5));
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v16 = (void *)v12;
    objc_msgSend(v11, "setObject:forKey:", v12, v6);

    v10 = 1;
    goto LABEL_23;
  }
  if (v7 == MEMORY[0x24BDACFF0])
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", xpc_string_get_string_ptr(v5), 4);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x24BDACFD0])
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", xpc_int64_get_value(v5));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x24BDACFF8])
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", xpc_uint64_get_value(v5));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x24BDACFA0])
  {
    v13 = *(void **)(a1 + 32);
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v12 = objc_msgSend(v13, "initWithXPCDictionary:", v5);
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x24BDACF90])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    length = xpc_data_get_length(v5);
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", bytes_ptr, length);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x24BDACF78])
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithXPCArray:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x24BDACFA8])
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", xpc_double_get_value(v5));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x24BDACF98])
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)xpc_date_get_value(v5));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __51__NSDictionary_xpcdictConv__initWithXPCDictionary___block_invoke_cold_1((uint64_t)v6, v8, v9);

  v10 = 0;
LABEL_23:

  return v10;
}

void __51__NSDictionary_xpcdictConv__initWithXPCDictionary___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_213A7E000, a2, a3, "The value for key %{public}@ has a type that is not supported yet", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end

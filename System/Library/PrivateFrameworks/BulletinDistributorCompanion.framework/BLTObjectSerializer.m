@implementation BLTObjectSerializer

+ (id)serializeObject:(id)a3 nulls:(id *)a4 error:(id *)a5
{
  void *v7;
  id v8;
  const __CFAllocator *v9;
  CFDataRef Data;
  CFDataRef v11;
  NSObject *v12;
  CFDataRef v13;
  CFDataRef v14;
  NSObject *v15;
  id v17;
  id v18;

  v18 = 0;
  objc_msgSend(a3, "objectWithNoNSNulls:", &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  if (v7)
  {
    v17 = 0;
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)&v17);
    v11 = Data;
    if (!v17 || Data)
    {
      if (a4 && v8)
      {
        v13 = CFPropertyListCreateData(v9, v8, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)&v17);
        v14 = v13;
        if (!v17 || v13)
        {
          *a4 = objc_retainAutorelease(v13);
        }
        else
        {
          blt_general_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            +[BLTObjectSerializer serializeObject:nulls:error:].cold.1((uint64_t *)&v17, v15);

          if (a5)
            *a5 = objc_retainAutorelease(v17);
          CFRelease(v17);
        }

      }
    }
    else
    {
      blt_general_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[BLTObjectSerializer serializeObject:nulls:error:].cold.2();

      if (a5)
        *a5 = objc_retainAutorelease(v17);
      CFRelease(v17);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)unserializeObject:(id)a3 nulls:(id)a4 error:(id *)a5
{
  const __CFData *v7;
  const __CFData *v8;
  const __CFAllocator *v9;
  CFPropertyListRef v10;
  void *v11;
  NSObject *v12;
  CFPropertyListRef v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v18;
  CFErrorRef error;

  v7 = (const __CFData *)a3;
  v8 = (const __CFData *)a4;
  if (!v7)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_20;
  }
  error = 0;
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, 0, 0, &error);
  v11 = (void *)v10;
  if (error && !v10)
  {
    blt_general_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[BLTObjectSerializer unserializeObject:nulls:error:].cold.1();

    if (a5)
      *a5 = objc_retainAutorelease(error);
    CFRelease(error);
    goto LABEL_9;
  }
  if (v8)
  {
    v18 = 0;
    v13 = CFPropertyListCreateWithData(v9, v8, 0, 0, (CFErrorRef *)&v18);
    v14 = (void *)v13;
    if (!v18 || v13)
    {
      objc_msgSend(v11, "objectWithNSNulls:", v13);
      v16 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v16;
    }
    else
    {
      blt_general_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[BLTObjectSerializer unserializeObject:nulls:error:].cold.1();

      if (a5)
        *a5 = objc_retainAutorelease(v18);
      CFRelease(v18);
    }

  }
LABEL_20:

  return v11;
}

+ (unint64_t)sizeOfObject:(id)a3
{
  return objc_msgSend(a3, "blt_sizeof");
}

+ (void)serializeObject:(uint64_t *)a1 nulls:(NSObject *)a2 error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412546;
  v4 = 0;
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Failed to serialized value (%@) with error: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

+ (void)serializeObject:nulls:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0(&dword_2173D9000, v0, v1, "Failed to serialized value (%@) with error: %@");
  OUTLINED_FUNCTION_5();
}

+ (void)unserializeObject:nulls:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0(&dword_2173D9000, v0, v1, "Failed to unserialized data (%@) with error: %@");
  OUTLINED_FUNCTION_5();
}

@end

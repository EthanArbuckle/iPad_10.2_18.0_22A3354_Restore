@implementation NSData

- (id)bmdsl_deserialize
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(MEMORY[0x24BE0C008], "allowed");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v2, "unarchivedObjectOfClasses:fromData:error:", v3, v1, &v13);
    v1 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v13;

    if (!v1)
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[NSData bmdsl_deserialize].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    }
  }
  return v1;
}

- (void)bmdsl_deserialize
{
  OUTLINED_FUNCTION_0(&dword_214A1F000, a2, a3, "Failed to unarchive DSL %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end

@implementation BMDSL

- (id)bmdsl_serialize
{
  void *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;

  if (!a1)
    return 0;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v11);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v11;
  if (!v1)
  {
    __biome_log_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BMDSL bmdsl_serialize].cold.1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
  return v1;
}

- (void)bmdsl_serialize
{
  OUTLINED_FUNCTION_0(&dword_214A1F000, a2, a3, "Failed to convert DSL to data because %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end

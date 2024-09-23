@implementation NSNumber(CCDatabaseValue)

- (uint64_t)databaseValue_type
{
  id v1;
  unsigned int v2;
  NSObject *v4;

  v1 = objc_retainAutorelease(a1);
  v2 = *(char *)objc_msgSend(v1, "objCType") - 66;
  if (v2 > 0x31)
    goto LABEL_6;
  if (((1 << v2) & 0x2848200028483) != 0)
    return 3;
  if (((1 << v2) & 0x1400000000) != 0)
    return 2;
LABEL_6:
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[NSNumber(CCDatabaseValue) databaseValue_type].cold.1(v1, v4);

  return 0;
}

- (id)databaseValue_toData
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "databaseValue_toString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "databaseValue_toData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)databaseValue_type
{
  int v3;
  void *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2080;
  v6 = objc_msgSend(objc_retainAutorelease(a1), "objCType");
  _os_log_error_impl(&dword_237B25000, a2, OS_LOG_TYPE_ERROR, "%@ (objCType = %s)", (uint8_t *)&v3, 0x16u);
}

@end

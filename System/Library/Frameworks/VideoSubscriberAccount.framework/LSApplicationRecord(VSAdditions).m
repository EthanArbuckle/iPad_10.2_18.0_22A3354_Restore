@implementation LSApplicationRecord(VSAdditions)

+ (id)vs_applicationRecordWithBundleURL:()VSAdditions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithURL:allowPlaceholder:error:", v3, 1, &v10);
  v5 = v10;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[LSApplicationRecord(VSAdditions) vs_applicationRecordWithBundleURL:].cold.1();

  }
  return v4;
}

+ (id)vs_applicationRecordWithStoreItemIdentifier:()VSAdditions
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v10;

  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithStoreItemIdentifier:error:", a3, &v10);
  v5 = v10;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[LSApplicationRecord(VSAdditions) vs_applicationRecordWithStoreItemIdentifier:].cold.1((uint64_t)v6, a3, v8);

  }
  return v4;
}

+ (id)vs_applicationRecordWithBundleIdentifier:()VSAdditions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v10);
  v5 = v10;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[LSApplicationRecord(VSAdditions) vs_applicationRecordWithBundleIdentifier:].cold.1();

  }
  return v4;
}

+ (void)vs_applicationRecordWithBundleURL:()VSAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D2419000, v0, v1, "Unable to fetch valid app record from bundle URL: %@, %@");
  OUTLINED_FUNCTION_3();
}

+ (void)vs_applicationRecordWithStoreItemIdentifier:()VSAdditions .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_0(&dword_1D2419000, a2, a3, "Unable to fetch valid app record from store item identifier: %llu, %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

+ (void)vs_applicationRecordWithBundleIdentifier:()VSAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D2419000, v0, v1, "Unable to fetch valid app record from bundle ID: %@, %@");
  OUTLINED_FUNCTION_3();
}

@end

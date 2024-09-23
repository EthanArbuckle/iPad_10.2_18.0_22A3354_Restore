@implementation BMStreamsAccessDaemonDelegate

- (BOOL)prepareResource:(id)a3 withMode:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BMStreamsAccessDaemonDelegate prepareResource:withMode:].cold.1((uint64_t)v5, a4, v6);

  if (objc_msgSend(v5, "type") == 3)
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[BMDatabaseInitializer initializeSQLDatabaseWithIdentifier:](_TtC12BiomeStreams21BMDatabaseInitializer, "initializeSQLDatabaseWithIdentifier:", v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)prepareResource:(NSObject *)a3 withMode:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  BMAccessModePrintableDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_18D810000, a3, OS_LOG_TYPE_DEBUG, "BMStreamsAccessDaemonDelegate preparing resource %{public}@ for mode %{public}@", (uint8_t *)&v6, 0x16u);

}

@end

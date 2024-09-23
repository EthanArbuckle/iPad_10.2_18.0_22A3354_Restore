@implementation BMDaemon(Pruning)

+ (void)pruneRestrictedStreamsInDomain:()Pruning account:activity:.cold.1(_DWORD *a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_0_14(&dword_18D810000, v6, v7, "Ignoring non-directory file while pruning %@");

  OUTLINED_FUNCTION_1_6();
}

+ (void)pruneFeatureStoreWithActivity:()Pruning .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18D810000, log, OS_LOG_TYPE_FAULT, "Unable to locate FeatureStore for pruning!", v1, 2u);
}

+ (void)pruneTemporaryFilesInDirectory:()Pruning .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_18D810000, a3, OS_LOG_TYPE_ERROR, "Failed to prune temporary files in directory: %{public}@, error: %@", (uint8_t *)&v6, 0x16u);

}

@end

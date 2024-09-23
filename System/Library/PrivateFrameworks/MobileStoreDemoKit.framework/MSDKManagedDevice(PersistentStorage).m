@implementation MSDKManagedDevice(PersistentStorage)

- (void)getAppDataFolderPathWithReturnError:()PersistentStorage .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_213A7E000, a2, v4, "Failed to get document folder URL - Error:  %{public}@", (uint8_t *)&v5);

}

- (void)preserveAppDataToPersistentStorageWithReturnError:()PersistentStorage .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[MSDKManagedDevice(PersistentStorage) preserveAppDataToPersistentStorageWithReturnError:]";
  OUTLINED_FUNCTION_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", (uint8_t *)&v3);
}

- (void)preserveAppDataToPersistentStorageWithReturnError:()PersistentStorage .cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_213A7E000, a3, OS_LOG_TYPE_ERROR, "Failed to preserve app data from %{public}@ to persistent storage - Error:  %{public}@", (uint8_t *)&v6, 0x16u);

}

@end

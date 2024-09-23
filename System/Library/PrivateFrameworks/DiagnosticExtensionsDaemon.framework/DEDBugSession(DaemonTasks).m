@implementation DEDBugSession(DaemonTasks)

- (void)state
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "BugSession has pending operations but isn't finishing, uploading  or compressing. Returning .unknown", v1, 2u);
}

- (void)hasStaleDirectory
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_21469E000, a3, OS_LOG_TYPE_ERROR, "Error getting [%{public}@] directory metadata with error: [%{public}@]", (uint8_t *)&v6, 0x16u);

}

@end

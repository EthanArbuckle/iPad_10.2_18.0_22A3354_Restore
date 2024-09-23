@implementation BADownload(VeryPrivate)

- (void)cloneDownloadToFinalDestinationURL:()VeryPrivate error:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "applicationGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21ABD8000, a2, OS_LOG_TYPE_ERROR, "Failed to load container for app group identifier: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end

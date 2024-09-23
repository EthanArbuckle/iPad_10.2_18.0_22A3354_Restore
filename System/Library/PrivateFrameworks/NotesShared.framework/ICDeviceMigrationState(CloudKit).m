@implementation ICDeviceMigrationState(CloudKit)

- (void)objectWasFetchedFromCloudWithRecord:()CloudKit accountID:force:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "ICAccount (%@) does not have a user record name. Fetching it now.", (uint8_t *)&v4, 0xCu);

}

@end

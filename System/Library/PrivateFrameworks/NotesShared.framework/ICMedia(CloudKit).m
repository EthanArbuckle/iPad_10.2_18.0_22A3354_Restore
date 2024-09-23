@implementation ICMedia(CloudKit)

- (void)mergeCloudKitRecord:()CloudKit accountID:approach:mergeableFieldState:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Found a media (%@) in the cloud from an old version that used filename extensions. Re-pushing it to the cloud with the correct fields", (uint8_t *)&v5, 0xCu);

}

@end

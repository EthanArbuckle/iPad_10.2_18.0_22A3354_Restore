@implementation DKStorageProvider

- (int64_t)dataSize
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x24BEB1C90], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sync");

  objc_msgSend(MEMORY[0x24BEB1C90], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storageSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "usedBytes");
  return v5;
}

@end

@implementation NSPersistentHistoryTransaction(HomeKitDaemon)

- (uint64_t)hmd_transactionAuthor
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "author");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreDataContextTransactionAuthor contextAuthorWithString:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "type");
  return v3;
}

@end

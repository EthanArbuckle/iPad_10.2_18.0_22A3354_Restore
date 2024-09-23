@implementation NSError(HDNanoSyncSupport)

- (id)hd_persistentMessage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hd_persistentUserInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableNanoSyncMessage messageFromPersistentUserInfo:](HDCodableNanoSyncMessage, "messageFromPersistentUserInfo:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end

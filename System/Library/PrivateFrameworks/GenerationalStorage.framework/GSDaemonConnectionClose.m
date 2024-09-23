@implementation GSDaemonConnectionClose

void __GSDaemonConnectionClose_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend((id)sDaemonConn, "invalidate");
  v0 = (void *)sDaemonConn;
  sDaemonConn = 0;

  v1 = (void *)sDaemonProxy;
  sDaemonProxy = 0;

  +[GSStorageManager manager](GSStorageManager, "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_connectionWithDaemonWasLost");

}

@end

@implementation MBCanCreateLogs

void __MBCanCreateLogs_block_invoke()
{
  void *v0;
  id v1;

  MBGetLogDir();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  getpid();
  v1 = objc_retainAutorelease(v0);
  objc_msgSend(v1, "fileSystemRepresentation");
  MBCanCreateLogs_sCanCreateLogs = sandbox_check() == 0;

}

@end

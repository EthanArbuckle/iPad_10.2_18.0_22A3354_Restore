@implementation UARPStringSysdiagnoseDirectoryFilePath

void __UARPStringSysdiagnoseDirectoryFilePath_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDD17C8];
  InternalStorageDirectoryPath();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@/%@"), v3, CFSTR("sysdiagnose"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)UARPStringSysdiagnoseDirectoryFilePath_path;
  UARPStringSysdiagnoseDirectoryFilePath_path = v1;

}

@end

@implementation CLKIsNTKDaemon

void __CLKIsNTKDaemon_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  CLKIsNTKDaemon___isDaemon = objc_msgSend(v1, "isEqualToString:", CFSTR("nanotimekitcompaniond"));
}

@end

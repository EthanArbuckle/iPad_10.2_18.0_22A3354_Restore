@implementation CoreCDPUIPSListControllerPrivate

+ (id)backgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE75530], "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

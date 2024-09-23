@implementation CLKIsGreenfieldTool

void __CLKIsGreenfieldTool_block_invoke()
{
  void *v0;
  id v1;

  if (CLKInternalBuild())
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "processName");
    v1 = (id)objc_claimAutoreleasedReturnValue();

    CLKIsGreenfieldTool___result = objc_msgSend(v1, "isEqualToString:", CFSTR("GreenfieldTool"));
  }
  else
  {
    CLKIsGreenfieldTool___result = 0;
  }
}

@end

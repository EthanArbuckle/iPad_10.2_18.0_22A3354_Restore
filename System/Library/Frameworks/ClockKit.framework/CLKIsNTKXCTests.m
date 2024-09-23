@implementation CLKIsNTKXCTests

void __CLKIsNTKXCTests_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  if (CLKInternalBuild())
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "processName");
    v2 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("xctest")) & 1) != 0)
      v1 = 1;
    else
      v1 = objc_msgSend(v2, "isEqualToString:", CFSTR("NanoTimeKitTests-Runner"));
    CLKIsNTKXCTests___result = v1;

  }
  else
  {
    CLKIsNTKXCTests___result = 0;
  }
}

@end

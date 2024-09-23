@implementation AEIsModernAspectScreen

void __AEIsModernAspectScreen_block_invoke()
{
  double v0;
  double v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  AEIsModernAspectScreen_isModernScreen = v1 / v0 >= 2.16;

}

@end

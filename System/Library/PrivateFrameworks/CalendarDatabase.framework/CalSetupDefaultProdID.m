@implementation CalSetupDefaultProdID

void ___CalSetupDefaultProdID_block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)MEMORY[0x1E0DDB7D8];
  v1 = (id)objc_msgSend(MEMORY[0x1E0D0C418], "copyString");
  objc_msgSend(v0, "setDefaultProdid:", v1);

}

@end

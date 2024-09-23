@implementation MTUIIsPhoneIdiom

void __MTUIIsPhoneIdiom_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  MTUIIsPhoneIdiom_isPhoneIdiom = objc_msgSend(v0, "userInterfaceIdiom") == 0;

}

@end

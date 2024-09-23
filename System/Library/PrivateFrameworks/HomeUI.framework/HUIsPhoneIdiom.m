@implementation HUIsPhoneIdiom

void __HUIsPhoneIdiom_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ED580DB1 = objc_msgSend(v0, "userInterfaceIdiom") == 0;

}

@end

@implementation MTUIIsPadIdiom

void __MTUIIsPadIdiom_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  MTUIIsPadIdiom_isPadIdiom = objc_msgSend(v0, "userInterfaceIdiom") == 1;

}

@end

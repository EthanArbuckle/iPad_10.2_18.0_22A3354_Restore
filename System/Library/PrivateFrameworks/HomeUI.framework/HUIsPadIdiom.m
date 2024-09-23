@implementation HUIsPadIdiom

void __HUIsPadIdiom_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_640 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

}

@end

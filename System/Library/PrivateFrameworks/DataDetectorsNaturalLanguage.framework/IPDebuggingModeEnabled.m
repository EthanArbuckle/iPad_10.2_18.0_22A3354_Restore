@implementation IPDebuggingModeEnabled

void __IPDebuggingModeEnabled_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  IPDebuggingModeEnabled_sEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("IPFeatureManagerLog"));

}

void __IPDebuggingModeEnabled_block_invoke_0()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  IPDebuggingModeEnabled_sEnabled_0 = objc_msgSend(v0, "BOOLForKey:", CFSTR("IPFeatureManagerLog"));

}

void __IPDebuggingModeEnabled_block_invoke_1()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  IPDebuggingModeEnabled_sEnabled_1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("IPFeatureManagerLog"));

}

void __IPDebuggingModeEnabled_block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  IPDebuggingModeEnabled_sEnabled_2 = objc_msgSend(v0, "BOOLForKey:", CFSTR("IPFeatureManagerLog"));

}

@end

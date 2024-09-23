@implementation TIGetDisableArbiterConnectionTimeoutValue

void __TIGetDisableArbiterConnectionTimeoutValue_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_configureKey:domain:defaultValue:", CFSTR("DisableArbiterConnectionTimeout"), CFSTR("com.apple.keyboard"), MEMORY[0x24BDBD1C0]);

}

@end

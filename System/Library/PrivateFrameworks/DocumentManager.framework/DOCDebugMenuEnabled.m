@implementation DOCDebugMenuEnabled

void __DOCDebugMenuEnabled_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  DOCDebugMenuEnabled__debugMenuEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("DOCDebugMenuEnabled"));

}

@end

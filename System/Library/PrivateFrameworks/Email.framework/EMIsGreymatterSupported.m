@implementation EMIsGreymatterSupported

void __EMIsGreymatterSupported_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  EMIsGreymatterSupported_isGreymatterSupported = objc_msgSend(v0, "supportsGenerativeModelSystems");

}

@end

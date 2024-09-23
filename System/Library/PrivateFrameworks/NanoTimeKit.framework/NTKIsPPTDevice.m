@implementation NTKIsPPTDevice

void __NTKIsPPTDevice_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  NTKIsPPTDevice_isPPTDevice = objc_msgSend(v0, "fileExistsAtPath:", CFSTR("/var/mobile/Library/PPTDevice"));

}

@end

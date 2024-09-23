@implementation BWCaptureIsRunningInIOSAppOnMacEnvironment

uint64_t __BWCaptureIsRunningInIOSAppOnMacEnvironment_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isiOSAppOnMac");
  BWCaptureIsRunningInIOSAppOnMacEnvironment_isIOSAppOnMac = result;
  return result;
}

@end

@implementation AVCaptureIsRunningInIOSAppOnMacEnvironment

uint64_t __AVCaptureIsRunningInIOSAppOnMacEnvironment_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isiOSAppOnMac");
  AVCaptureIsRunningInIOSAppOnMacEnvironment_isIOSAppOnMac = result;
  return result;
}

@end

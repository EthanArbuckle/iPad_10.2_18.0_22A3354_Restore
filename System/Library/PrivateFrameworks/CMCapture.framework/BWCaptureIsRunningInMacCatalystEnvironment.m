@implementation BWCaptureIsRunningInMacCatalystEnvironment

uint64_t __BWCaptureIsRunningInMacCatalystEnvironment_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isMacCatalystApp");
  BWCaptureIsRunningInMacCatalystEnvironment_isCatalystApp = result;
  return result;
}

@end

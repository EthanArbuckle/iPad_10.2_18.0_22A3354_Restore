@implementation AVCaptureSessionIsLaunchPrewarmingEnabled

uint64_t __AVCaptureSessionIsLaunchPrewarmingEnabled_block_invoke()
{
  uint64_t result;

  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", 0x1E4220D28) & 1) != 0)result = 1;
  else
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", 0x1E4221D68);
  AVCaptureSessionIsLaunchPrewarmingEnabled_launchPrewarmingEnabled = result;
  return result;
}

@end

@implementation ABUIIsBlurSupported

uint64_t __ABUIIsBlurSupported_block_invoke()
{
  uint64_t result;
  double v1;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF7020], "settingsForPrivateStyle:", 2030), "blurRadius");
  ABUIIsBlurSupported_blurSupported = v1 > 0.0;
  return result;
}

@end

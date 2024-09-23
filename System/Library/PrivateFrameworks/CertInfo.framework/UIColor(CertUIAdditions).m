@implementation UIColor(CertUIAdditions)

+ (uint64_t)CertUIVerifiedColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.8, 0.278431373, 1.0);
}

@end

@implementation UIColor(DMCProfilesUI)

+ (uint64_t)DMCProfileVerifiedColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.8, 0.278431373, 1.0);
}

+ (uint64_t)DMCProfileRedColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
}

+ (uint64_t)DMCProfileSecondaryLabelColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
}

@end

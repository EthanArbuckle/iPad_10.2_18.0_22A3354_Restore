@implementation UIColor(GKDashboardUtils)

+ (uint64_t)_gkSelectedCellBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
}

+ (uint64_t)_gkSpeechViewTintColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (uint64_t)_gkvisualEffectTintColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.8, 0.82, 0.84, 0.05);
}

@end

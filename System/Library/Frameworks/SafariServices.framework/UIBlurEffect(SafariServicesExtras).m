@implementation UIBlurEffect(SafariServicesExtras)

+ (uint64_t)_sf_defaultPopoverBackgroundEffect
{
  return objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
}

+ (uint64_t)_sf_defaultStartPageBackgroundEffect
{
  return objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
}

@end

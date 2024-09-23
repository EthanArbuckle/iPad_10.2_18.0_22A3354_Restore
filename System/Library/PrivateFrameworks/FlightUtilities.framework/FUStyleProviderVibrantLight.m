@implementation FUStyleProviderVibrantLight

- (id)separatorColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
}

- (id)primaryTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
}

- (id)lightTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
}

@end

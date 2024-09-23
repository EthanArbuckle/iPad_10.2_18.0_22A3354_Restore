@implementation FUStyleProviderLight

- (id)separatorColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "tableSeparatorLightColor");
}

- (id)lightTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
}

@end

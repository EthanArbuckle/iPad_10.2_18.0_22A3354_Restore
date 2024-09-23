@implementation FUStyleProvider

- (id)separatorColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
}

- (int64_t)blendMode
{
  return 0;
}

- (id)compositingFilter
{
  return 0;
}

+ (id)providerForStyle:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return objc_alloc_init(*off_24ED16160[a3 - 1]);
}

- (id)primaryTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

- (id)lightTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
}

- (id)blueColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
}

- (id)greenColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
}

- (id)orangeColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
}

- (id)redColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
}

@end

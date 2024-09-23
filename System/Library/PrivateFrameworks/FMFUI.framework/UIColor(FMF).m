@implementation UIColor(FMF)

+ (uint64_t)fmfOrangeColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.937254906, 0.56078434, 0.0784313753, 1.0);
}

@end

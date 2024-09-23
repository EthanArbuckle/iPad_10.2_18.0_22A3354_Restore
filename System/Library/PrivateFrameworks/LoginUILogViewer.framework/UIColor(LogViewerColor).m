@implementation UIColor(LogViewerColor)

+ (id)logPurpleColor
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithRed:green:blue:alpha:", 0.921568627, 0.341176471, 0.968627451, 1.0);
}

+ (id)logCyanColor
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithRed:green:blue:alpha:", 0.309803922, 0.619607843, 0.619607843, 1.0);
}

+ (id)logYellowColor
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithRed:green:blue:alpha:", 0.68627451, 0.674509804, 0.258823529, 1.0);
}

@end

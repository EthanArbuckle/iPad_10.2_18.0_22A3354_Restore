@implementation CNImageDerivedColorGenerator

+ (void)fetchColorsForImage:(id)a3 withCompletionHandler:(id)a4
{
  objc_msgSend(MEMORY[0x1E0D13CD8], "fetchColorsForImage:ciContext:withCompletionHandler:", a3, 0, a4);
}

+ (id)colorsForImageRef:(CGImage *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D13CD8], "colorsForImageRef:", a3);
}

+ (id)defaultGrayColors
{
  return (id)objc_msgSend(MEMORY[0x1E0D13CD8], "defaultGrayColors");
}

@end

@implementation UITraitCollection(MediaControls)

- (BOOL)mr_shouldDim
{
  return (unint64_t)objc_msgSend(a1, "_backlightLuminance") < 2;
}

@end

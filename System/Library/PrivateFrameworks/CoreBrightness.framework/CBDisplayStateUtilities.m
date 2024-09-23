@implementation CBDisplayStateUtilities

+ (id)stringForDisplayMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 5)
    __asm { BR              X8 }
  return CFSTR("Unknown");
}

+ (id)stringForFlipbookState:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
    __asm { BR              X8 }
  return CFSTR("Unknown");
}

@end

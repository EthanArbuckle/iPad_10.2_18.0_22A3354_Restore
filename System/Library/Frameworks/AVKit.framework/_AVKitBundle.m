@implementation _AVKitBundle

+ (id)bundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
}

@end

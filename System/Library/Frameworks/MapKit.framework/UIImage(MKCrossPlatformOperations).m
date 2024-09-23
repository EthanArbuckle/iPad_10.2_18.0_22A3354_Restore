@implementation UIImage(MKCrossPlatformOperations)

+ (uint64_t)_mapkit_systemImageNamed:()MKCrossPlatformOperations
{
  return objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:");
}

@end

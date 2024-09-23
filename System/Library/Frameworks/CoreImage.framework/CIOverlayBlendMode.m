@implementation CIOverlayBlendMode

- (id)_kernel
{
  return +[CIBlendKernel overlay](CIBlendKernel, "overlay");
}

@end

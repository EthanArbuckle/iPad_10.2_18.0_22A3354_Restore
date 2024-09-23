@implementation CIScreenBlendMode

- (id)_kernel
{
  return +[CIBlendKernel screen](CIBlendKernel, "screen");
}

@end

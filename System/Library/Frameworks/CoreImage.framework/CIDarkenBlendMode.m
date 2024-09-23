@implementation CIDarkenBlendMode

- (id)_kernel
{
  return +[CIBlendKernel darken](CIBlendKernel, "darken");
}

@end

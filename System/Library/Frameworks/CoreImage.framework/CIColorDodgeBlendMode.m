@implementation CIColorDodgeBlendMode

- (id)_kernel
{
  return +[CIBlendKernel colorDodge](CIBlendKernel, "colorDodge");
}

@end

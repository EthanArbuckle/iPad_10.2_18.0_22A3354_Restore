@implementation DKUDeviceCMYKColorSpace

CGColorSpaceRef __DKUDeviceCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceCMYK();
  qword_1ECEE63C0 = (uint64_t)result;
  return result;
}

@end

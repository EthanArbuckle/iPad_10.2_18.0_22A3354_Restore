@implementation DKUDeviceLabColorSpace

CGColorSpaceRef __DKUDeviceLabColorSpace_block_invoke()
{
  CGColorSpaceRef result;
  _OWORD v1[2];
  CGFloat blackPoint[3];
  CGFloat whitePoint[2];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)whitePoint = xmmword_1BE4FE378;
  v4 = 0x3FF16BD900000000;
  memset(blackPoint, 0, sizeof(blackPoint));
  v1[0] = xmmword_1BE4FE390;
  v1[1] = unk_1BE4FE3A0;
  result = CGColorSpaceCreateLab(whitePoint, blackPoint, (const CGFloat *)v1);
  qword_1ECEE63E0 = (uint64_t)result;
  return result;
}

@end

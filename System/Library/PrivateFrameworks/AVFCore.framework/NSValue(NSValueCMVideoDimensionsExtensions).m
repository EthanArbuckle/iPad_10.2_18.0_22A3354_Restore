@implementation NSValue(NSValueCMVideoDimensionsExtensions)

+ (uint64_t)valueWithCMVideoDimensions:()NSValueCMVideoDimensionsExtensions
{
  uint64_t v4;

  v4 = a3;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v4, "{?=ii}");
}

- (uint64_t)CMVideoDimensionsValue
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(a1, "getValue:", &v2);
  return v2;
}

@end

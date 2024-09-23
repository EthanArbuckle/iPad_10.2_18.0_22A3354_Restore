@implementation NSValue(HKGraphSeriesDataBlockPath)

+ (uint64_t)valueWithHKGraphSeriesDataBlockPath:()HKGraphSeriesDataBlockPath
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{HKGraphSeriesDataBlockPath=qqq}");
}

- (uint64_t)HKGraphSeriesDataBlockPathValue
{
  *x8_0 = 0;
  x8_0[1] = 0;
  x8_0[2] = 0;
  return objc_msgSend(a1, "getValue:", x8_0);
}

@end

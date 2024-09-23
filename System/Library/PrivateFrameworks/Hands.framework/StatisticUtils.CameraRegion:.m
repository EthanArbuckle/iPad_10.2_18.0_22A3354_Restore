@implementation StatisticUtils.CameraRegion:

- (unint64_t)UInt64
{
  unint64_t result;

  result = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  *a1 = result;
  return result;
}

@end

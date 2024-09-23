@implementation HKIsUnitTesting

Class __HKIsUnitTesting_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("XCTest"));
  HKIsUnitTesting_result = result != 0;
  return result;
}

@end

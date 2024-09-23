@implementation HDIsUnitTesting

Class __HDIsUnitTesting_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("XCTest"));
  HDIsUnitTesting__HDFIsUnitTesting = result != 0;
  return result;
}

@end

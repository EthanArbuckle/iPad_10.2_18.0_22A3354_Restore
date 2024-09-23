@implementation CRIsTestContext

Class __CRIsTestContext_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("XCTestCase"));
  CRIsTestContext__isTestingContext = result != 0;
  return result;
}

@end

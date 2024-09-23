@implementation ENIsTestContext

Class __ENIsTestContext_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("XCTestCase"));
  ENIsTestContext__isTestingContext = result != 0;
  return result;
}

@end

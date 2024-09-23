@implementation Generate32BitConnectionID

uint64_t __Generate32BitConnectionID_block_invoke()
{
  uint64_t result;

  result = arc4random();
  Generate32BitConnectionID_connectionID = result;
  return result;
}

@end

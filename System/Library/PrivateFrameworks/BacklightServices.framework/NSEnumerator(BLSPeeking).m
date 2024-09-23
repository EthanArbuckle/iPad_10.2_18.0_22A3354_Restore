@implementation NSEnumerator(BLSPeeking)

- (BLSPeekingEnumerator)peekingEnumerator
{
  return +[BLSPeekingEnumerator peekingEnumeratorWithEnumerator:](BLSPeekingEnumerator, "peekingEnumeratorWithEnumerator:", a1);
}

@end

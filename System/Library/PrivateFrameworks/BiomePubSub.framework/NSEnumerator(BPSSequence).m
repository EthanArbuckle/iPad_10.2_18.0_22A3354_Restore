@implementation NSEnumerator(BPSSequence)

- (BPSSequence)bpsPublisher
{
  return -[BPSSequence initWithEnumerator:]([BPSSequence alloc], "initWithEnumerator:", a1);
}

@end

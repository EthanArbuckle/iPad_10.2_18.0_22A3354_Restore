@implementation NSArray(BPSSequence)

- (BPSSequence)bpsPublisher
{
  return -[BPSSequence initWithSequence:]([BPSSequence alloc], "initWithSequence:", a1);
}

@end

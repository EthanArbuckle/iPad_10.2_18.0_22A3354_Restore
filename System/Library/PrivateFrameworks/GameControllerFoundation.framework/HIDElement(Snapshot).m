@implementation HIDElement(Snapshot)

- (GCHIDElementSnapshot)gc_snapshot
{
  return -[GCHIDElementSnapshot initWithHIDElement:]([GCHIDElementSnapshot alloc], "initWithHIDElement:", a1);
}

@end

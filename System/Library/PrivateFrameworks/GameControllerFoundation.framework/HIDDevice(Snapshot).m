@implementation HIDDevice(Snapshot)

- (GCHIDDeviceSnapshot)gc_snapshot
{
  return -[GCHIDDeviceSnapshot initWithHIDDevice:]([GCHIDDeviceSnapshot alloc], "initWithHIDDevice:", a1);
}

@end

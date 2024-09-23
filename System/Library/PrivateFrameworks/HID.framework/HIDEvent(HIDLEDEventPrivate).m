@implementation HIDEvent(HIDLEDEventPrivate)

- (uint64_t)ledMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setLedMask:()HIDLEDEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)ledNumber
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setLedNumber:()HIDLEDEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)ledState
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setLedState:()HIDLEDEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end

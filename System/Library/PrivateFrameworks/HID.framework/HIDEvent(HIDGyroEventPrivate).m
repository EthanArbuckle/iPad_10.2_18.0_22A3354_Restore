@implementation HIDEvent(HIDGyroEventPrivate)

- (uint64_t)gyroSequence
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGyroSequence:()HIDGyroEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)gyroSubType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGyroSubType:()HIDGyroEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)gyroType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGyroType:()HIDGyroEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)gyroX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGyroX:()HIDGyroEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gyroY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGyroY:()HIDGyroEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gyroZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGyroZ:()HIDGyroEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end

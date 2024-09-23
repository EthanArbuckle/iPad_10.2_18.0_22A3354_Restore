@implementation HIDEvent(HIDPowerEventPrivate)

- (uint64_t)powerMeasurement
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setPowerMeasurement:()HIDPowerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)powerSubType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setPowerSubType:()HIDPowerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)powerType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setPowerType:()HIDPowerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end

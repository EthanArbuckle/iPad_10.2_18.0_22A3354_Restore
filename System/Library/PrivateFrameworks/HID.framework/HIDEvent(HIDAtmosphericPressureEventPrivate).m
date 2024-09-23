@implementation HIDEvent(HIDAtmosphericPressureEventPrivate)

- (uint64_t)atmosphericPressureLevel
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setAtmosphericPressureLevel:()HIDAtmosphericPressureEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)atmosphericSequence
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAtmosphericSequence:()HIDAtmosphericPressureEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end

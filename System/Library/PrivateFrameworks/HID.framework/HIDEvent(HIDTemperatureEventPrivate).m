@implementation HIDEvent(HIDTemperatureEventPrivate)

- (uint64_t)temperatureLevel
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setTemperatureLevel:()HIDTemperatureEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end

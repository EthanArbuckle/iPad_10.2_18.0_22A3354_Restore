@implementation HIDEvent(HIDProximityEventPrivate)

- (uint64_t)probabilityLevel
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setProbabilityLevel:()HIDProximityEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)proximityDetectionMask
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setProximityDetectionMask:()HIDProximityEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)proximityLevel
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setProximityLevel:()HIDProximityEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)proximityProximityType
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setProximityProximityType:()HIDProximityEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end

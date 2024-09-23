@implementation HIDEvent(HIDOrientationEventPrivate)

- (uint64_t)orientationAltitude
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationAltitude:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationAzimuth
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationAzimuth:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationDeviceOrientationUsage
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setOrientationDeviceOrientationUsage:()HIDOrientationEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)orientationOrientationType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)orientationQuatW
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationQuatW:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationQuatX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationQuatX:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationQuatY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationQuatY:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationQuatZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationQuatZ:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationRadius
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationRadius:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationTiltX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationTiltX:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationTiltY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationTiltY:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationTiltZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationTiltZ:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end

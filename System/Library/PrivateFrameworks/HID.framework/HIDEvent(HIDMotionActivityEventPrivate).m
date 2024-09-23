@implementation HIDEvent(HIDMotionActivityEventPrivate)

- (uint64_t)motionActivityActivityType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setMotionActivityActivityType:()HIDMotionActivityEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)motionActivityConfidence
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setMotionActivityConfidence:()HIDMotionActivityEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end

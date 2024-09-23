@implementation HIDEvent(HIDGenericGestureEventPrivate)

- (uint64_t)genericGestureType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)genericGestureTypeSwipeProgress
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGenericGestureTypeSwipeProgress:()HIDGenericGestureEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)genericGestureTypeTapCount
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGenericGestureTypeTapCount:()HIDGenericGestureEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end

@implementation HIDEvent(HIDButtonEventPrivate)

- (uint64_t)buttonClickCount
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setButtonClickCount:()HIDButtonEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)buttonMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setButtonMask:()HIDButtonEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)buttonNumber
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setButtonNumber:()HIDButtonEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)buttonPressure
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setButtonPressure:()HIDButtonEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)buttonState
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setButtonState:()HIDButtonEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end

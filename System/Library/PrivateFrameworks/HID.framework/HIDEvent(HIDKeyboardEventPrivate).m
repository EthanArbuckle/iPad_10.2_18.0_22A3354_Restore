@implementation HIDEvent(HIDKeyboardEventPrivate)

- (uint64_t)keyboardClickSpeed
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardClickSpeed:()HIDKeyboardEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)keyboardDown
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardDown:()HIDKeyboardEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)keyboardLongPress
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardLongPress:()HIDKeyboardEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)keyboardMouseKeyToggle
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardMouseKeyToggle:()HIDKeyboardEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)keyboardPressCount
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardPressCount:()HIDKeyboardEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)keyboardRepeat
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardRepeat:()HIDKeyboardEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)keyboardSlowKeyPhase
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardSlowKeyPhase:()HIDKeyboardEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)keyboardStickyKeyPhase
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardStickyKeyPhase:()HIDKeyboardEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)keyboardStickyKeyToggle
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardStickyKeyToggle:()HIDKeyboardEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)keyboardUsage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardUsage:()HIDKeyboardEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)keyboardUsagePage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setKeyboardUsagePage:()HIDKeyboardEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end

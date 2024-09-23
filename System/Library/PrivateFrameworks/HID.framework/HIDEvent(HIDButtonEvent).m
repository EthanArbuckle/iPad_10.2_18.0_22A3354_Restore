@implementation HIDEvent(HIDButtonEvent)

+ (char)buttonEvent:()HIDButtonEvent buttonMask:options:
{
  char *v5;

  v5 = (char *)_IOHIDEventCreate();
  *(_DWORD *)(*(_QWORD *)&v5[*MEMORY[0x1E0CBBA38] + 96] + 16) = a4;
  return v5;
}

@end

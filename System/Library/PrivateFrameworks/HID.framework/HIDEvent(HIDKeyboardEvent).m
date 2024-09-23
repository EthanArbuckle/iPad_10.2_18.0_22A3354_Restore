@implementation HIDEvent(HIDKeyboardEvent)

+ (char)keyboardEvent:()HIDKeyboardEvent usagePage:usage:down:options:
{
  char *v9;
  uint64_t v10;

  v9 = (char *)_IOHIDEventCreate();
  v10 = *(_QWORD *)&v9[*MEMORY[0x1E0CBBA38] + 96];
  *(_WORD *)(v10 + 16) = a4;
  *(_WORD *)(v10 + 18) = a5;
  *(_DWORD *)(v10 + 20) = a6;
  return v9;
}

@end

@implementation HIDEvent(HIDLEDEvent)

+ (char)lEDEvent:()HIDLEDEvent ledMask:number:state:options:
{
  char *v9;
  uint64_t v10;

  v9 = (char *)_IOHIDEventCreate();
  v10 = *(_QWORD *)&v9[*MEMORY[0x1E0CBBA38] + 96];
  *(_DWORD *)(v10 + 16) = a4;
  *(_BYTE *)(v10 + 20) = a5;
  *(_DWORD *)(v10 + 24) = a6;
  return v9;
}

@end

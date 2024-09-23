@implementation HIDEvent(HIDVendorDefinedEvent)

+ (char)vendorDefinedEvent:()HIDVendorDefinedEvent usagePage:usage:version:data:length:options:
{
  size_t v13;
  char *v14;
  uint64_t v15;

  v13 = a8;
  v14 = (char *)_IOHIDEventCreate();
  v15 = *(_QWORD *)&v14[*MEMORY[0x1E0CBBA38] + 96];
  *(_WORD *)(v15 + 16) = a4;
  *(_WORD *)(v15 + 18) = a5;
  *(_DWORD *)(v15 + 20) = a6;
  memmove((void *)(v15 + 28), a7, v13);
  *(_DWORD *)(v15 + 24) = a8;
  return v14;
}

@end

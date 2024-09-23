@implementation HIDEvent(HIDProximityEvent)

+ (char)proximityEvent:()HIDProximityEvent detectionMask:options:
{
  char *v5;

  v5 = (char *)_IOHIDEventCreate();
  *(_WORD *)(*(_QWORD *)&v5[*MEMORY[0x1E0CBBA38] + 96] + 16) = a4;
  return v5;
}

@end

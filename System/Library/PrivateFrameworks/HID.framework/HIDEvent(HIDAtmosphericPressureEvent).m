@implementation HIDEvent(HIDAtmosphericPressureEvent)

+ (char)atmosphericPressureEvent:()HIDAtmosphericPressureEvent level:sequence:options:
{
  char *v7;
  uint64_t v8;

  v7 = (char *)_IOHIDEventCreate();
  v8 = *(_QWORD *)&v7[*MEMORY[0x1E0CBBA38] + 96];
  *(_DWORD *)(v8 + 16) = vcvtd_n_s64_f64(a1, 0x10uLL);
  *(_DWORD *)(v8 + 20) = a5;
  return v7;
}

@end

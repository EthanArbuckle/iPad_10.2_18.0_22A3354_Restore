@implementation HIDEvent(HIDTemperatureEvent)

+ (char)temperatureEvent:()HIDTemperatureEvent level:options:
{
  char *v2;

  v2 = (char *)_IOHIDEventCreate();
  *(_DWORD *)(*(_QWORD *)&v2[*MEMORY[0x1E0CBBA38] + 96] + 16) = vcvtd_n_s64_f64(a1, 0x10uLL);
  return v2;
}

@end

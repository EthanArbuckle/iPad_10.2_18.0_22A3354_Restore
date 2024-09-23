@implementation HIDEvent(HIDAccelerometerEvent)

+ (char)accelerometerEvent:()HIDAccelerometerEvent x:y:z:options:
{
  char *v6;
  _DWORD *v7;

  v6 = (char *)_IOHIDEventCreate();
  v7 = *(_DWORD **)&v6[*MEMORY[0x1E0CBBA38] + 96];
  v7[4] = vcvtd_n_s64_f64(a1, 0x10uLL);
  v7[5] = vcvtd_n_s64_f64(a2, 0x10uLL);
  v7[6] = vcvtd_n_s64_f64(a3, 0x10uLL);
  return v6;
}

@end

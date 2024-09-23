@implementation HIDEvent(HIDOrientationEvent)

+ (char)polarOrientationEvent:()HIDOrientationEvent radius:azimuth:altitude:options:
{
  char *v6;
  _DWORD *v7;

  v6 = (char *)_IOHIDEventCreate();
  v7 = *(_DWORD **)&v6[*MEMORY[0x1E0CBBA38] + 96];
  v7[8] = 0;
  v7[4] = vcvtd_n_s64_f64(a1, 0x10uLL);
  v7[5] = vcvtd_n_s64_f64(a2, 0x10uLL);
  v7[6] = vcvtd_n_s64_f64(a3, 0x10uLL);
  return v6;
}

+ (char)quaternionOrientationEvent:()HIDOrientationEvent w:x:y:z:options:
{
  char *v8;
  _DWORD *v9;

  v8 = (char *)_IOHIDEventCreate();
  v9 = *(_DWORD **)&v8[*MEMORY[0x1E0CBBA38] + 96];
  v9[8] = 3;
  v9[4] = vcvtd_n_s64_f64(a1, 0x10uLL);
  v9[5] = vcvtd_n_s64_f64(a2, 0x10uLL);
  v9[6] = vcvtd_n_s64_f64(a3, 0x10uLL);
  v9[7] = vcvtd_n_s64_f64(a4, 0x10uLL);
  return v8;
}

+ (char)tiltOrientationEvent:()HIDOrientationEvent x:y:z:options:
{
  char *v6;
  _DWORD *v7;

  v6 = (char *)_IOHIDEventCreate();
  v7 = *(_DWORD **)&v6[*MEMORY[0x1E0CBBA38] + 96];
  v7[8] = 2;
  v7[4] = vcvtd_n_s64_f64(a1, 0x10uLL);
  v7[5] = vcvtd_n_s64_f64(a2, 0x10uLL);
  v7[6] = vcvtd_n_s64_f64(a3, 0x10uLL);
  return v6;
}

@end

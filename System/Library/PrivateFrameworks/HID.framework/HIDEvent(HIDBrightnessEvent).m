@implementation HIDEvent(HIDBrightnessEvent)

+ (char)brightnessEvent:()HIDBrightnessEvent currentBrightness:targetBrightness:transitionTime:options:
{
  char *v9;
  uint64_t v10;

  v9 = (char *)_IOHIDEventCreate();
  v10 = *(_QWORD *)&v9[*MEMORY[0x1E0CBBA38] + 96];
  *(_DWORD *)(v10 + 16) = vcvtd_n_s64_f64(a1, 0x10uLL);
  *(_DWORD *)(v10 + 20) = vcvtd_n_s64_f64(a2, 0x10uLL);
  *(_QWORD *)(v10 + 24) = a6;
  return v9;
}

@end

@implementation HIDEvent(HIDBiometricEvent)

+ (char)biometricEvent:()HIDBiometricEvent eventType:level:options:
{
  char *v7;
  uint64_t v8;

  v7 = (char *)_IOHIDEventCreate();
  v8 = *(_QWORD *)&v7[*MEMORY[0x1E0CBBA38] + 96];
  *(_DWORD *)(v8 + 16) = a5;
  *(_DWORD *)(v8 + 20) = vcvtd_n_s64_f64(a1, 0x10uLL);
  return v7;
}

@end

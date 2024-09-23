@implementation NTKDebugActivityWristRaiseTimeout

double __NTKDebugActivityWristRaiseTimeout_block_invoke(uint64_t a1, uint64_t a2)
{
  double result;
  float v3;
  id v4;

  if (NTKInternalBuild(a1, a2))
  {
    v4 = (id)CFPreferencesCopyAppValue(CFSTR("ActivityWristRaiseTimeout"), CFSTR("com.apple.NanoTimeKit.face"));
    objc_msgSend(v4, "floatValue");
    *(double *)&NTKDebugActivityWristRaiseTimeout___timeout = v3;

  }
  return result;
}

@end

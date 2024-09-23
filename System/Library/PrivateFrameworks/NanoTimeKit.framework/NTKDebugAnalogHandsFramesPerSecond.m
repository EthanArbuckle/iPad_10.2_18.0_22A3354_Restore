@implementation NTKDebugAnalogHandsFramesPerSecond

void __NTKDebugAnalogHandsFramesPerSecond_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  if (NTKInternalBuild(a1, a2))
  {
    v2 = (id)CFPreferencesCopyAppValue(CFSTR("AnalogHandsFPS"), CFSTR("com.apple.NanoTimeKit.face"));
    NTKDebugAnalogHandsFramesPerSecond___fps = objc_msgSend(v2, "integerValue");

  }
}

@end

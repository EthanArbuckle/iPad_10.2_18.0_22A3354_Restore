@implementation SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar

void __SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar_block_invoke()
{
  double v0;

  v0 = 10.0;
  if (_SFDeviceHasHomeButton())
    v0 = _SFRoundFloatToPixels(10.5);
  SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar_result_0 = 0x4010000000000000;
  SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar_result_1 = 0x4022000000000000;
  SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar_result_2 = *(_QWORD *)&v0;
  SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar_result_3 = 0x4022000000000000;
  SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar_noStatusBarInsets_0 = 0x401C000000000000;
  SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar_noStatusBarInsets_1 = 0x4022000000000000;
  SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar_noStatusBarInsets_2 = 0x401C000000000000;
  SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar_noStatusBarInsets_3 = 0x4022000000000000;
}

@end

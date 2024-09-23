@implementation SFCapsuleBottomBarPaddingForTopLayoutStyle

void __SFCapsuleBottomBarPaddingForTopLayoutStyle_block_invoke()
{
  int HasHomeButton;
  double v1;

  HasHomeButton = _SFDeviceHasHomeButton();
  v1 = 5.49;
  if (HasHomeButton)
    v1 = 0.5;
  SFCapsuleBottomBarPaddingForTopLayoutStyle_result_0 = _SFRoundFloatToPixels(v1);
  SFCapsuleBottomBarPaddingForTopLayoutStyle_result_2 = 0x4008000000000000;
}

@end

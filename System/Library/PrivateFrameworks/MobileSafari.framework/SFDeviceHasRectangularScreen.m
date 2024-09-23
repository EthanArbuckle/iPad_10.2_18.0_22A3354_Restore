@implementation SFDeviceHasRectangularScreen

void ___SFDeviceHasRectangularScreen_block_invoke()
{
  double v0;
  double v1;
  double v2;
  BOOL v3;
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_peripheryInsets");
  v3 = v2 == *(double *)(MEMORY[0x1E0DC49E8] + 8);
  if (v4 != *MEMORY[0x1E0DC49E8])
    v3 = 0;
  if (v1 != *(double *)(MEMORY[0x1E0DC49E8] + 24))
    v3 = 0;
  if (v0 != *(double *)(MEMORY[0x1E0DC49E8] + 16))
    v3 = 0;
  _SFDeviceHasRectangularScreen::hasRectangularScreen = v3;

}

@end

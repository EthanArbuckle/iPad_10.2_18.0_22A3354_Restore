@implementation FIUIOnePixel

double __FIUIOnePixel_block_invoke()
{
  double v0;
  double result;
  id v2;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  *(double *)&FIUIOnePixel_onePixel = 1.0 / v0;

  return result;
}

double __FIUIOnePixel_block_invoke_0()
{
  double v0;
  double result;
  id v2;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  *(double *)&FIUIOnePixel_onePixel_0 = 1.0 / v0;

  return result;
}

@end

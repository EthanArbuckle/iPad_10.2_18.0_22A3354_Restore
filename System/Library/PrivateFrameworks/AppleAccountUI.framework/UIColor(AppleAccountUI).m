@implementation UIColor(AppleAccountUI)

+ (id)aaui_colorWithHexString:()AppleAccountUI
{
  void *v0;
  int v2;

  v2 = 0;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scanHexInt:", &v2);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (float)((float)BYTE2(v2) / 255.0), (float)((float)BYTE1(v2) / 255.0), (float)((float)v2 / 255.0), 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

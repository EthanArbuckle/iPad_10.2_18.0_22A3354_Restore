@implementation AKBasicLoginAppearance

+ (UIColor)tableCellBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemGroupedBackgroundColor");
}

+ (int64_t)tableViewStyle
{
  return 2;
}

@end

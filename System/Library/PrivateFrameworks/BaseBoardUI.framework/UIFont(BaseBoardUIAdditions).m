@implementation UIFont(BaseBoardUIAdditions)

+ (id)bsui_preferredFontForTextStyle:()BaseBoardUIAdditions hiFontStyle:contentSizeCategory:
{
  +[UIFont bsui_defaultFont:forTextStyle:hiFontStyle:contentSizeCategory:](MEMORY[0x1E0CEA5E8], 0, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)bsui_preferredFontForTextStyle:()BaseBoardUIAdditions hiFontStyle:
{
  +[UIFont bsui_defaultFont:forTextStyle:hiFontStyle:contentSizeCategory:](MEMORY[0x1E0CEA5E8], 0, a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)bsui_defaultFontForTextStyle:()BaseBoardUIAdditions hiFontStyle:
{
  +[UIFont bsui_defaultFont:forTextStyle:hiFontStyle:contentSizeCategory:](MEMORY[0x1E0CEA5E8], 1, a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

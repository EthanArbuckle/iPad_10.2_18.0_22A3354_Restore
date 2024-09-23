@implementation UIColor

+ (id)sss_miniatureBorderColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

+ (id)sss_dittoBackgroundColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.9, 1.0);
}

@end

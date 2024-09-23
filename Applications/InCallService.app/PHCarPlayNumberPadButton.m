@implementation PHCarPlayNumberPadButton

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)buttonColor
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;

  if ((-[PHCarPlayNumberPadButton isFocused](self, "isFocused") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarFocusedColor](UIColor, "dynamicCarFocusedColor"));
  }
  else
  {
    if (objc_msgSend((id)objc_opt_class(self, v3), "currentStyle") == (id)2)
      v5 = 1.0;
    else
      v5 = 0.0;
    +[TPNumberPadDynamicButton unhighlightedCircleViewAlpha](TPNumberPadDynamicButton, "unhighlightedCircleViewAlpha");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v5, v6));
  }
  return v4;
}

- (id)highlightedButtonColor
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;

  if ((-[PHCarPlayNumberPadButton isFocused](self, "isFocused") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarFocusedColor](UIColor, "dynamicCarFocusedColor"));
  }
  else
  {
    if (objc_msgSend((id)objc_opt_class(self, v3), "currentStyle") == (id)2)
      v5 = 1.0;
    else
      v5 = 0.0;
    +[TPNumberPadDynamicButton highlightedCircleViewAlpha](TPNumberPadDynamicButton, "highlightedCircleViewAlpha");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v5, v6));
  }
  return v4;
}

+ (double)unhighlightedCircleViewAlpha
{
  return 1.0;
}

+ (double)highlightedCircleViewAlpha
{
  return 1.0;
}

+ (double)outerCircleDiameter
{
  return 40.0;
}

+ (double)verticalPadding
{
  return 3.0;
}

+ (double)horizontalPadding
{
  return 6.0;
}

+ (BOOL)isCarPlay
{
  return 1;
}

@end

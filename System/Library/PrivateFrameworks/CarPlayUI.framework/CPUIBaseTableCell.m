@implementation CPUIBaseTableCell

void __35___CPUIBaseTableCell_disabledColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)disabledColor_disabled;
  disabledColor_disabled = v0;

}

id __35___CPUIBaseTableCell_disabledColor__block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  if (objc_msgSend(a2, "userInterfaceStyle") == 1)
  {
    v2 = 0.568627451;
    v3 = 0.588235294;
    v4 = 1.0;
    v5 = 0.568627451;
  }
  else
  {
    v2 = 0.603921569;
    v5 = 0.6;
    v3 = 0.615686275;
    v4 = 1.0;
  }
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v2, v5, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __46___CPUIBaseTableCell_disabledHighlightedColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)disabledHighlightedColor_disabled;
  disabledHighlightedColor_disabled = v0;

}

id __46___CPUIBaseTableCell_disabledHighlightedColor__block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;

  if (objc_msgSend(a2, "userInterfaceStyle") == 1)
  {
    v2 = 0.505882353;
    v3 = 0.71372549;
    v4 = 0.976470588;
  }
  else
  {
    v2 = 0.337254902;
    v3 = 0.537254902;
    v4 = 0.639215686;
  }
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v2, v3, v4, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

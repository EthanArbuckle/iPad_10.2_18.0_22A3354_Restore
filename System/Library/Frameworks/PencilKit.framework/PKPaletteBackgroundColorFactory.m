@implementation PKPaletteBackgroundColorFactory

- (id)makeBackgroundColor
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_44);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id __54__PKPaletteBackgroundColorFactory_makeBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = 0.7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = 0.9;
  }
  objc_msgSend(v2, "colorWithAlphaComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

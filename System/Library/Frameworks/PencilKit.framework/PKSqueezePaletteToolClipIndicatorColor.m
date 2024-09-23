@implementation PKSqueezePaletteToolClipIndicatorColor

id __PKSqueezePaletteToolClipIndicatorColor_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

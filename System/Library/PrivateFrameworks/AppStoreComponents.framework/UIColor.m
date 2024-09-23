@implementation UIColor

void __55__UIColor_AppStoreComponents___asc_highlightBlendColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_asc_highlightBlendColor_highlightBlendColor;
  _asc_highlightBlendColor_highlightBlendColor = v0;

}

id __65__UIColor_AppStoreComponents__asc_colorWithLightColor_darkColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  v4 = 40;
  if (v3 == 2)
    v4 = 32;
  return *(id *)(a1 + v4);
}

@end

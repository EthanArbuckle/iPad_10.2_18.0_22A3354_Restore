@implementation UIColor(AppStoreComponents)

+ (id)_asc_highlightBlendColor
{
  if (_asc_highlightBlendColor_onceToken != -1)
    dispatch_once(&_asc_highlightBlendColor_onceToken, &__block_literal_global_34);
  return (id)_asc_highlightBlendColor_highlightBlendColor;
}

+ (id)asc_colorWithLightColor:()AppStoreComponents darkColor:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__UIColor_AppStoreComponents__asc_colorWithLightColor_darkColor___block_invoke;
  v12[3] = &unk_1E7561A30;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "colorWithDynamicProvider:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)asc_highlightedColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "_asc_highlightBlendColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_colorBlendedWithColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

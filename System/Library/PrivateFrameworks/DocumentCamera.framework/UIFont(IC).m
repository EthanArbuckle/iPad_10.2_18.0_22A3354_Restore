@implementation UIFont(IC)

+ (uint64_t)dc_preferredFontForTextStyle:()IC adjustedForDefaultSize:
{
  return objc_msgSend(a1, "dc_preferredFontForTextStyle:adjustedForDefaultSize:maxSize:", a3, 1.79769313e308);
}

+ (id)dc_preferredFontForTextStyle:()IC adjustedForDefaultSize:maxSize:
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v7 = a5;
  v8 = (void *)CTFontDescriptorCreateWithTextStyle();
  objc_msgSend(v8, "pointSize");
  v10 = a1 - v9;
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pointSize");
  v13 = v10 + v12;
  if (v13 >= a2)
    v13 = a2;
  objc_msgSend(v11, "fontWithSize:", ceil(v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end

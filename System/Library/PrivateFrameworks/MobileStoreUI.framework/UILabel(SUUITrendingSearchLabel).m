@implementation UILabel(SUUITrendingSearchLabel)

+ (uint64_t)SUUITrending_defaultTitleColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

+ (uint64_t)SUUITrending_defaultTitleFont
{
  return objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 22.0, *MEMORY[0x24BEBB5F8]);
}

+ (id)SUUITrending_titleLabelWithElement:()SUUITrendingSearchLabel
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v5, "setNumberOfLines:", objc_msgSend(v4, "numberOfLines"));
    objc_msgSend(v5, "setTextAlignment:", 1);
    objc_msgSend(v4, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementFontWithStyle(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(a1, "SUUITrending_defaultTitleFont");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    SUUIViewElementPlainColorWithStyle(v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(a1, "SUUITrending_defaultTitleColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributedStringWithDefaultFont:foregroundColor:style:", v7, v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setAttributedText:", v10);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)SUUITrending_defaultLabelWithText:()SUUITrendingSearchLabel
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(a1, "SUUITrending_defaultTitleFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    objc_msgSend(v6, "setText:", v5);
    objc_msgSend(v6, "setTextAlignment:", 1);
    objc_msgSend(a1, "SUUITrending_defaultTitleColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end

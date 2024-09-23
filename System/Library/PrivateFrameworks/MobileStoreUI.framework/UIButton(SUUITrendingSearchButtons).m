@implementation UIButton(SUUITrendingSearchButtons)

+ (uint64_t)SUUITrending_defaultButtonFont
{
  return objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
}

+ (id)SUUITrending_searchButtonWithElement:()SUUITrendingSearchButtons
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BEBD430];
  v4 = a3;
  objc_msgSend(v3, "buttonWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SUUITrending_applyConfigurationFromElement:", v4);

  return v5;
}

+ (id)SUUITrending_searchButtonWithTitle:()SUUITrendingSearchButtons
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "SUUITrending_searchButtonWithElement:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  return v5;
}

- (void)SUUITrending_applyConfigurationFromElement:()SUUITrendingSearchButtons
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "buttonImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v20, "buttonImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resourceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIImageWithResourceName(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setImage:forState:", v7, 0);
  }
  objc_msgSend(v20, "buttonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setTitle:forState:", v9, 0);
  objc_msgSend(v20, "buttonTitleStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v20, "style");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  SUUIViewElementPlainColorWithStyle(v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTintColor:", v14);

  objc_msgSend(a1, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "maxTextLines");
  if (v16)
  {
    objc_msgSend(v15, "setFont:", v16);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "SUUITrending_defaultButtonFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v18);

  }
  if (v17 == -1)
    v19 = 1;
  else
    v19 = v17;
  objc_msgSend(v15, "setNumberOfLines:", v19);
  objc_msgSend(v15, "setTextAlignment:", 1);
  objc_msgSend(v15, "setLineBreakMode:", 4);

}

@end

@implementation UIButton(HKBuddyAdditions)

+ (double)hk_buddyButtonHorizontalMargin
{
  int v0;
  double result;

  v0 = objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas4InchScreen");
  result = 24.0;
  if (v0)
    return 16.0;
  return result;
}

+ (_HKRoundedRectBuddyButton)hk_roundedRectBuddyButtonTintedWithColor:()HKBuddyAdditions title:target:action:
{
  id v9;
  id v10;
  id v11;
  _HKRoundedRectBuddyButton *v12;
  _HKRoundedRectBuddyButton *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [_HKRoundedRectBuddyButton alloc];
  v13 = -[_HKRoundedRectBuddyButton initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  -[_HKRoundedRectBuddyButton setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_HKRoundedRectBuddyButton setBackgroundColor:](v13, "setBackgroundColor:", v11);

  -[_HKRoundedRectBuddyButton setTitle:forState:](v13, "setTitle:forState:", v10, 0);
  if (v9 && a6)
    -[_HKRoundedRectBuddyButton addTarget:action:forControlEvents:](v13, "addTarget:action:forControlEvents:", v9, a6, 64);

  return v13;
}

+ (id)hk_buddyButtonTintedWithColor:()HKBuddyAdditions title:target:action:
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = (void *)MEMORY[0x1E0DC3518];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "buttonWithType:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v14, "setAllowsDefaultTighteningForTruncation:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v15);

  objc_msgSend(v14, "setTextAlignment:", 1);
  objc_msgSend(v13, "setTitle:forState:", v11, 0);

  objc_msgSend(v13, "setTitleColor:forState:", v12, 0);
  objc_msgSend(v13, "addTarget:action:forControlEvents:", v10, a6, 64);

  return v13;
}

@end

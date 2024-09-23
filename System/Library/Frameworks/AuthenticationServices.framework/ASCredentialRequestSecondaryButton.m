@implementation ASCredentialRequestSecondaryButton

+ (id)buttonWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v7 = a4;
  v8 = a3;
  +[ASCredentialRequestSecondaryButton buttonWithType:](ASCredentialRequestSecondaryButton, "buttonWithType:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  objc_msgSend(v9, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v9, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);

  v14 = *MEMORY[0x24BEBE070];
  objc_msgSend(v9, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaximumContentSizeCategory:", v14);

  objc_msgSend(v9, "setTitle:forState:", v8, 0);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", v7, a5, 64);

  return v9;
}

@end

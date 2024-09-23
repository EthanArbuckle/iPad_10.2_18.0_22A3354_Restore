@implementation HKFavoritesTableViewCell

- (HKFavoritesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKFavoritesTableViewCell *v4;
  UIImageView *v5;
  UIImageView *pin;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIImageView *v13;
  UIImageView *slashPin;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HKFavoritesTableViewCell;
  v4 = -[HKFavoritesTableViewCell initWithStyle:reuseIdentifier:](&v23, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    pin = v4->_pin;
    v4->_pin = v5;

    v7 = (void *)MEMORY[0x1E0DC3888];
    v8 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationWithFont:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_pin, "setPreferredSymbolConfiguration:", v10);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pin.fill"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v4->_pin, "setImage:", v11);

    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](v4->_pin, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v4->_pin, "setTintColor:", v12);

    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    slashPin = v4->_slashPin;
    v4->_slashPin = v13;

    v15 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configurationWithFont:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_slashPin, "setPreferredSymbolConfiguration:", v17);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pin.slash.fill"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v4->_slashPin, "setImage:", v18);

    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](v4->_slashPin, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v4->_slashPin, "setTintColor:", v19);

    -[HKFavoritesTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKFavoritesTableViewCell textLabel](v4, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v20);

    -[HKFavoritesTableViewCell setAccessoryView:](v4, "setAccessoryView:", v4->_pin);
  }
  return v4;
}

- (BOOL)isFavorited
{
  HKFavoritesTableViewCell *v2;
  UIImageView *v3;

  v2 = self;
  -[HKFavoritesTableViewCell accessoryView](self, "accessoryView");
  v3 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 == v2->_slashPin;

  return (char)v2;
}

- (void)setFavorited:(BOOL)a3
{
  _BOOL4 v3;
  int *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v5 = &OBJC_IVAR___HKFavoritesTableViewCell__pin;
  if (a3)
    v5 = &OBJC_IVAR___HKFavoritesTableViewCell__slashPin;
  -[HKFavoritesTableViewCell setAccessoryView:](self, "setAccessoryView:", *(Class *)((char *)&self->super.super.super.super.isa + *v5));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  if (v3)
    v7 = CFSTR("UNPIN_FROM_SUMMARY");
  else
    v7 = CFSTR("PIN_TO_SUMMARY");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFavoritesTableViewCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

}

+ (id)reuseIdentifier
{
  return CFSTR("HKFavoritesTableViewCellIdentifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slashPin, 0);
  objc_storeStrong((id *)&self->_pin, 0);
}

@end

@implementation CNMeCardSharingPickerLayoutAttributes

- (CNMeCardSharingPickerLayoutAttributes)initWithTopToAvatarPadding:(double)a3 headerFont:(id)a4 avatarViewSize:(CGSize)a5 avatarViewToNamePadding:(double)a6 backgroundColor:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  CNMeCardSharingPickerLayoutAttributes *v16;
  CNMeCardSharingPickerLayoutAttributes *v17;
  CNMeCardSharingPickerLayoutAttributes *v18;
  objc_super v20;

  height = a5.height;
  width = a5.width;
  v14 = a4;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CNMeCardSharingPickerLayoutAttributes;
  v16 = -[CNMeCardSharingPickerLayoutAttributes init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_topToAvatarPadding = a3;
    objc_storeStrong((id *)&v16->_headerFont, a4);
    v17->_avatarViewSize.width = width;
    v17->_avatarViewSize.height = height;
    v17->_avatarViewToNamePadding = a6;
    objc_storeStrong((id *)&v17->_backgroundColor, a7);
    v18 = v17;
  }

  return v17;
}

- (double)topToAvatarPadding
{
  return self->_topToAvatarPadding;
}

- (UIFont)headerFont
{
  return self->_headerFont;
}

- (CGSize)avatarViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_avatarViewSize.width;
  height = self->_avatarViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)avatarViewToNamePadding
{
  return self->_avatarViewToNamePadding;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_headerFont, 0);
}

+ (id)buddyHeaderFont
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (id)*MEMORY[0x1E0DC4AE8];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (v5 <= 320.0)
  {
    v6 = (id)*MEMORY[0x1E0DC4B50];

    v2 = v6;
  }
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontWithDescriptor:size:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)settingsHeaderFont
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;

  v2 = (id)*MEMORY[0x1E0DC4B48];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (v5 <= 320.0)
  {
    v6 = (id)*MEMORY[0x1E0DC4B50];

    v2 = v6;
  }
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)layoutAttributesForBuddy
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "buddyHeaderFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTopToAvatarPadding:headerFont:avatarViewSize:avatarViewToNamePadding:backgroundColor:", v3, v4, 20.0, 100.0, 100.0, 20.0);

  return v5;
}

+ (id)layoutAttributesForSettings
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "settingsHeaderFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTopToAvatarPadding:headerFont:avatarViewSize:avatarViewToNamePadding:backgroundColor:", v3, 0, 10.0, 80.0, 80.0, 5.0);

  return v4;
}

@end

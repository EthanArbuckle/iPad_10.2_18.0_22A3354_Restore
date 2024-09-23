@implementation CNSharingProfileOnboardingNameCell

- (CNSharingProfileOnboardingNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNSharingProfileOnboardingNameCell *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIImageView *avatarImageView;
  void *v12;
  uint64_t v13;
  UIView *fakeSeparator;
  void *v15;
  void *v16;
  CNSharingProfileOnboardingNameCell *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CNSharingProfileOnboardingNameCell;
  v4 = -[CNSharingProfileOnboardingNameCell initWithStyle:reuseIdentifier:](&v19, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    avatarImageView = v4->_avatarImageView;
    v4->_avatarImageView = (UIImageView *)v10;

    -[UIImageView setClipsToBounds:](v4->_avatarImageView, "setClipsToBounds:", 1);
    -[CNSharingProfileOnboardingNameCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_avatarImageView);

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
    fakeSeparator = v4->_fakeSeparator;
    v4->_fakeSeparator = (UIView *)v13;

    +[CNUIColorRepository contactStyleDefaultSeparatorColor](CNUIColorRepository, "contactStyleDefaultSeparatorColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_fakeSeparator, "setBackgroundColor:", v15);

    -[CNSharingProfileOnboardingNameCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v4->_fakeSeparator);

    v17 = v4;
  }

  return v4;
}

- (double)separatorHeight
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  -[CNSharingProfileOnboardingNameCell window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0.5;
  if (v3)
  {
    -[CNSharingProfileOnboardingNameCell superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CNSharingProfileOnboardingNameCell window](self, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "screen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scale");
      v4 = 1.0 / v8;

    }
  }
  return v4;
}

- (id)textFieldForIndex:(int64_t)a3
{
  int *v4;
  UITextField **p_givenNameField;
  void *v6;
  void *v7;
  UITextField *givenNameField;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (self->_nameOrder == 2)
  {
    v10[0] = self->_familyNameField;
    v4 = &OBJC_IVAR___CNSharingProfileOnboardingNameCell__givenNameField;
    p_givenNameField = (UITextField **)v10;
  }
  else
  {
    givenNameField = self->_givenNameField;
    v4 = &OBJC_IVAR___CNSharingProfileOnboardingNameCell__familyNameField;
    p_givenNameField = &givenNameField;
  }
  p_givenNameField[1] = *(UITextField **)((char *)&self->super.super.super.super.isa + *v4);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  CGFloat v9;
  void *v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double MaxY;
  void *v21;
  double Height;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v27.receiver = self;
  v27.super_class = (Class)CNSharingProfileOnboardingNameCell;
  -[CNSharingProfileOnboardingNameCell layoutSubviews](&v27, sel_layoutSubviews);
  v3 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  v4 = 24.0;
  if (v3 == 1)
  {
    -[CNSharingProfileOnboardingNameCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v4 = CGRectGetWidth(v28) + -84.0;

    v6 = 24.0;
  }
  else
  {
    v6 = 24.0 + 60.0 + 15.0;
  }
  if (v3 == 1)
    v7 = 0.0;
  else
    v7 = v4 + 60.0 + 15.0;
  -[CNSharingProfileOnboardingNameCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = CGRectGetWidth(v29) + -123.0;

  -[CNSharingProfileOnboardingNameCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = CGRectGetWidth(v30) + -99.0;

  -[CNSharingProfileOnboardingNameCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  -[UIImageView setFrame:](self->_avatarImageView, "setFrame:", v4, (CGRectGetHeight(v31) + -60.0) * 0.5, 60.0, 60.0);

  -[UIImageView layer](self->_avatarImageView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", 30.0);

  -[CNSharingProfileOnboardingNameCell textFieldForIndex:](self, "textFieldForIndex:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingNameCell textFieldForIndex:](self, "textFieldForIndex:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingNameCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17 * 0.5;
  -[CNSharingProfileOnboardingNameCell separatorHeight](self, "separatorHeight");
  objc_msgSend(v14, "setFrame:", v6, 0.0, v9, v18 - v19);

  objc_msgSend(v14, "frame");
  MaxY = CGRectGetMaxY(v32);
  -[CNSharingProfileOnboardingNameCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  Height = CGRectGetHeight(v33);
  objc_msgSend(v14, "bounds");
  v23 = Height - CGRectGetHeight(v34);
  -[CNSharingProfileOnboardingNameCell separatorHeight](self, "separatorHeight");
  objc_msgSend(v15, "setFrame:", v6, MaxY, v9, v23 - v24);

  objc_msgSend(v14, "frame");
  v25 = CGRectGetMaxY(v35);
  -[CNSharingProfileOnboardingNameCell separatorHeight](self, "separatorHeight");
  -[UIView setFrame:](self->_fakeSeparator, "setFrame:", v7, v25, v11, v26);

}

- (void)setAvatarImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_avatarImage != v5)
  {
    objc_storeStrong((id *)&self->_avatarImage, a3);
    -[UIImageView setImage:](self->_avatarImageView, "setImage:", v5);
  }

}

- (void)setGivenNameField:(id)a3 familyNameField:(id)a4
{
  UITextField *v7;
  UITextField **p_givenNameField;
  UITextField *givenNameField;
  void *v10;
  void *v11;
  void *v12;
  UITextField **p_familyNameField;
  UITextField *familyNameField;
  void *v15;
  void *v16;
  void *v17;
  UITextField *v18;

  v18 = (UITextField *)a3;
  v7 = (UITextField *)a4;
  p_givenNameField = &self->_givenNameField;
  givenNameField = self->_givenNameField;
  if (givenNameField != v18)
  {
    -[UITextField superview](givenNameField, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileOnboardingNameCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
      -[UITextField removeFromSuperview](*p_givenNameField, "removeFromSuperview");
    objc_storeStrong((id *)&self->_givenNameField, a3);
    -[CNSharingProfileOnboardingNameCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", *p_givenNameField);

  }
  p_familyNameField = &self->_familyNameField;
  familyNameField = self->_familyNameField;
  if (familyNameField != v7)
  {
    -[UITextField superview](familyNameField, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileOnboardingNameCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == v16)
      -[UITextField removeFromSuperview](*p_familyNameField, "removeFromSuperview");
    objc_storeStrong((id *)&self->_familyNameField, a4);
    -[CNSharingProfileOnboardingNameCell contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", *p_familyNameField);

  }
  -[CNSharingProfileOnboardingNameCell setNeedsLayout](self, "setNeedsLayout");

}

- (NSString)givenName
{
  return -[UITextField text](self->_givenNameField, "text");
}

- (void)setGivenName:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[UITextField setText:](self->_givenNameField, "setText:", v4);

}

- (NSString)familyName
{
  return -[UITextField text](self->_familyNameField, "text");
}

- (void)setFamilyName:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[UITextField setText:](self->_familyNameField, "setText:", v4);

}

- (void)prepareForReuse
{
  UITextField *familyNameField;
  UITextField *givenNameField;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNSharingProfileOnboardingNameCell;
  -[CNSharingProfileOnboardingNameCell prepareForReuse](&v5, sel_prepareForReuse);
  -[UIImageView setImage:](self->_avatarImageView, "setImage:", 0);
  -[UITextField removeFromSuperview](self->_familyNameField, "removeFromSuperview");
  familyNameField = self->_familyNameField;
  self->_familyNameField = 0;

  -[UITextField removeFromSuperview](self->_givenNameField, "removeFromSuperview");
  givenNameField = self->_givenNameField;
  self->_givenNameField = 0;

}

- (int64_t)nameOrder
{
  return self->_nameOrder;
}

- (void)setNameOrder:(int64_t)a3
{
  self->_nameOrder = a3;
}

- (UIImage)avatarImage
{
  return self->_avatarImage;
}

- (UITextField)givenNameField
{
  return self->_givenNameField;
}

- (void)setGivenNameField:(id)a3
{
  objc_storeStrong((id *)&self->_givenNameField, a3);
}

- (UITextField)familyNameField
{
  return self->_familyNameField;
}

- (void)setFamilyNameField:(id)a3
{
  objc_storeStrong((id *)&self->_familyNameField, a3);
}

- (UIView)fakeSeparator
{
  return self->_fakeSeparator;
}

- (void)setFakeSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_fakeSeparator, a3);
}

- (UIImageView)avatarImageView
{
  return self->_avatarImageView;
}

- (void)setAvatarImageView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_storeStrong((id *)&self->_fakeSeparator, 0);
  objc_storeStrong((id *)&self->_familyNameField, 0);
  objc_storeStrong((id *)&self->_givenNameField, 0);
  objc_storeStrong((id *)&self->_avatarImage, 0);
}

+ (id)cellIdentifier
{
  return CFSTR("CNSharingProfileOnboardingNameCell");
}

+ (double)desiredMinimumCellHeight
{
  return 88.0;
}

@end

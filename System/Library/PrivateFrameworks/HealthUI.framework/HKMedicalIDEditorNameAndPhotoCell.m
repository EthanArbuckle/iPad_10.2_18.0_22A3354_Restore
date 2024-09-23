@implementation HKMedicalIDEditorNameAndPhotoCell

- (HKMedicalIDEditorNameAndPhotoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMedicalIDEditorNameAndPhotoCell *v4;
  UIButton *v5;
  UIButton *editPhotoButton;
  UIButton *v7;
  UIButton *editPhotoLabelButton;
  UIView *v9;
  UIView *nameBottomSeparator;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIButton *v30;
  void *v31;
  void *v32;
  UIButton *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIButton *v38;
  void *v39;
  void *v40;
  UIButton *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)HKMedicalIDEditorNameAndPhotoCell;
  v4 = -[HKMedicalIDEditorMultilineStringCell initWithStyle:reuseIdentifier:](&v47, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    editPhotoButton = v4->_editPhotoButton;
    v4->_editPhotoButton = v5;

    v7 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    editPhotoLabelButton = v4->_editPhotoLabelButton;
    v4->_editPhotoLabelButton = v7;

    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    nameBottomSeparator = v4->_nameBottomSeparator;
    v4->_nameBottomSeparator = v9;

    -[HKMedicalIDEditorMultilineStringCell textView](v4, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutocorrectionType:", 1);

    -[HKMedicalIDEditorMultilineStringCell textView](v4, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAutocapitalizationType:", 1);

    -[HKMedicalIDEditorMultilineStringCell textView](v4, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setReturnKeyType:", 9);

    -[HKMedicalIDEditorMultilineStringCell textView](v4, "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorMultilineStringCell textView](v4, "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v15);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("name"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorMultilineStringCell setPlaceholder:](v4, "setPlaceholder:", v18);

    -[HKMedicalIDEditorMultilineStringCell setTextViewExtraMargins:](v4, "setTextViewExtraMargins:", 26.0, 58.0, 0.0, 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_nameBottomSeparator, "setBackgroundColor:", v19);

    -[UIButton imageView](v4->_editPhotoButton, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMasksToBounds:", 1);

    -[UIButton imageView](v4->_editPhotoButton, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentMode:", 2);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = objc_msgSend(v23, "CGColor");
    -[UIButton layer](v4->_editPhotoButton, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBorderColor:", v24);

    -[UIButton titleLabel](v4->_editPhotoButton, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextAlignment:", 1);

    -[UIButton titleLabel](v4->_editPhotoButton, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setLineBreakMode:", 0);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("edit_photo_accessibility"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](v4->_editPhotoButton, "setAccessibilityLabel:", v29);

    v30 = v4->_editPhotoButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("add_photo"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v30, "setTitle:forState:", v32, 0);

    v33 = v4->_editPhotoButton;
    HKHealthKeyColor();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v33, "setTitleColor:forState:", v34, 0);

    -[HKMedicalIDEditorNameAndPhotoCell _adjustEditPhotoButtonFontSizeIfNecessary](v4, "_adjustEditPhotoButtonFontSizeIfNecessary");
    -[UIButton setHidden:](v4->_editPhotoLabelButton, "setHidden:", 1);
    -[UIButton titleLabel](v4->_editPhotoLabelButton, "titleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTextAlignment:", 1);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("edit_photo_accessibility"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](v4->_editPhotoLabelButton, "setAccessibilityLabel:", v37);

    v38 = v4->_editPhotoLabelButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("edit_photo"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v38, "setTitle:forState:", v40, 0);

    v41 = v4->_editPhotoLabelButton;
    HKHealthKeyColor();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v41, "setTitleColor:forState:", v42, 0);

    -[HKMedicalIDEditorNameAndPhotoCell contentView](v4, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", v4->_editPhotoButton);

    -[HKMedicalIDEditorNameAndPhotoCell contentView](v4, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addSubview:", v4->_editPhotoLabelButton);

    -[HKMedicalIDEditorNameAndPhotoCell contentView](v4, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addSubview:", v4->_nameBottomSeparator);

    -[HKMedicalIDEditorNameAndPhotoCell _contentSizeCategoryDidChange:](v4, "_contentSizeCategoryDidChange:", 0);
  }
  return v4;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMedicalIDEditorNameAndPhotoCell;
  -[HKMedicalIDEditorMultilineStringCell _contentSizeCategoryDidChange:](&v6, sel__contentSizeCategoryDidChange_, a3);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_editPhotoLabelButton, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorNameAndPhotoCell;
  -[HKMedicalIDEditorMultilineStringCell layoutSubviews](&v3, sel_layoutSubviews);
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
    -[HKMedicalIDEditorNameAndPhotoCell _largeTextLayoutSubviews](self, "_largeTextLayoutSubviews");
  else
    -[HKMedicalIDEditorNameAndPhotoCell _regularLayoutSubviews](self, "_regularLayoutSubviews");
}

- (void)_regularLayoutSubviews
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;

  -[HKMedicalIDEditorMultilineStringCell setTextViewExtraMargins:](self, "setTextViewExtraMargins:", 26.0, 58.0, 0.0, 0.0);
  v3 = -[UIView hk_isLeftToRight](self, "hk_isLeftToRight");
  -[HKMedicalIDEditorNameAndPhotoCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  if (v3)
    v7 = 16.0;
  else
    v7 = v6 + -60.0 + -16.0;
  -[HKMedicalIDEditorNameAndPhotoCell photo](self, "photo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIButton titleLabel](self->_editPhotoLabelButton, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intrinsicContentSize");
    v11 = v10;
    v38 = v12;

    -[UIButton titleLabel](self->_editPhotoLabelButton, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_scaledValueForValue:", 16.5);
    objc_msgSend(v14, "ascender");
    v15 = 0x404E000000000000;
    if (v3)
    {
      v16 = 16.0;
      v17 = 26.0;
    }
    else
    {
      v17 = 26.0;
      v16 = v6 + -60.0 + -16.0;
    }
    v18 = 0x404E000000000000;
    CGRectGetMidX(*(CGRect *)(&v15 - 2));
    UIRoundToViewScale();
    v19 = v21;
    v39.size.width = 60.0;
    v39.origin.y = 26.0;
    v39.origin.x = v7;
    v39.size.height = 60.0;
    CGRectGetMaxY(v39);
    UIRoundToViewScale();
    v20 = v22;

  }
  else
  {
    v19 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v38 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  UIRoundToViewScale();
  v24 = v23;
  -[HKMedicalIDEditorMultilineStringCell textView](self, "textView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v26;

  -[HKMedicalIDEditorNameAndPhotoCell photo](self, "photo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[UIButton layer](self->_editPhotoButton, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBorderWidth:", 0.0);

    -[UIButton layer](self->_editPhotoButton, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCornerRadius:", 0.0);

    -[UIButton imageView](self->_editPhotoButton, "imageView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCornerRadius:", 30.0);

  }
  else
  {
    UIRoundToViewScale();
    v34 = v33;
    -[UIButton layer](self->_editPhotoButton, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBorderWidth:", v34);

    -[UIButton layer](self->_editPhotoButton, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCornerRadius:", 30.0);
  }

  if (v3)
    v36 = v7 + 76.0;
  else
    v36 = v7 + -16.0 - (v7 + -16.0);
  if (v3)
    v37 = v6 - (v7 + 76.0);
  else
    v37 = v7 + -16.0;
  -[UIButton setFrame:](self->_editPhotoButton, "setFrame:", v7);
  -[UIButton setFrame:](self->_editPhotoLabelButton, "setFrame:", v19, v20, v11, v38);
  -[UIView setFrame:](self->_nameBottomSeparator, "setFrame:", v36, v27 - v24 + -4.0 + 26.0, v37, v24);
}

- (void)_largeTextLayoutSubviews
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MaxY;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  -[HKMedicalIDEditorNameAndPhotoCell _adjustEditPhotoButtonFontSizeIfNecessary](self, "_adjustEditPhotoButtonFontSizeIfNecessary");
  v61 = 0.0;
  -[HKMedicalIDEditorMultilineStringCell setTextViewExtraMargins:](self, "setTextViewExtraMargins:", 26.0, 0.0, 0.0, 0.0);
  v3 = -[UIView hk_isLeftToRight](self, "hk_isLeftToRight");
  -[HKMedicalIDEditorNameAndPhotoCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  v60 = v6;
  v7 = (v6 + -120.0) * 0.5;
  -[HKMedicalIDEditorNameAndPhotoCell photo](self, "photo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIButton titleLabel](self->_editPhotoLabelButton, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intrinsicContentSize");
    v11 = v10;
    v62 = v12;

    -[UIButton titleLabel](self->_editPhotoLabelButton, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_scaledValueForValue:", 16.5);
    objc_msgSend(v14, "ascender");
    v64.origin.y = 26.0;
    v64.origin.x = (v6 + -120.0) * 0.5;
    v64.size.width = 120.0;
    v64.size.height = 120.0;
    CGRectGetMidX(v64);
    UIRoundToViewScale();
    v16 = v15;
    v65.origin.y = 26.0;
    v65.origin.x = (v6 + -120.0) * 0.5;
    v65.size.width = 120.0;
    v65.size.height = 120.0;
    CGRectGetMaxY(v65);
    UIRoundToViewScale();
    v18 = v17;

  }
  else
  {
    v16 = *MEMORY[0x1E0C9D648];
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v62 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  -[HKMedicalIDEditorMultilineStringCell textView](self, "textView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[HKMedicalIDEditorNameAndPhotoCell photo](self, "photo");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  v58 = v18;
  v59 = v16;
  if (v26)
    v28 = v16;
  else
    v28 = v7;
  if (v26)
    v29 = v18;
  else
    v29 = 26.0;
  v30 = 120.0;
  if (v26)
    v31 = v11;
  else
    v31 = 120.0;
  if (v26)
    v30 = v62;
  v32 = CGRectGetMaxY(*(CGRect *)&v28) + 5.0;

  -[HKMedicalIDEditorMultilineStringCell placeholderLabel](self, "placeholderLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  v54 = v34;
  v55 = v35;
  v56 = v36;

  if (v3)
  {
    -[HKMedicalIDEditorNameAndPhotoCell separatorInset](self, "separatorInset");
    v61 = v37;
  }
  -[HKMedicalIDEditorNameAndPhotoCell separatorInset](self, "separatorInset");
  v53 = v38;
  v57 = v25;
  v66.origin.x = v21;
  v66.origin.y = v32;
  v66.size.width = v23;
  v66.size.height = v25;
  MaxY = CGRectGetMaxY(v66);
  -[HKMedicalIDEditorMultilineStringCell textView](self, "textView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "font");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "lineHeight");
  v43 = v42;

  -[HKMedicalIDEditorNameAndPhotoCell photo](self, "photo");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[UIButton layer](self->_editPhotoButton, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setBorderWidth:", 0.0);

    -[UIButton layer](self->_editPhotoButton, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setCornerRadius:", 0.0);

    -[UIButton imageView](self->_editPhotoButton, "imageView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setCornerRadius:", 60.0);

  }
  else
  {
    UIRoundToViewScale();
    v50 = v49;
    -[UIButton layer](self->_editPhotoButton, "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setBorderWidth:", v50);

    -[UIButton layer](self->_editPhotoButton, "layer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setCornerRadius:", 60.0);
  }

  -[UIButton setFrame:](self->_editPhotoButton, "setFrame:", v7, 26.0, 120.0, 120.0);
  -[UIButton setFrame:](self->_editPhotoLabelButton, "setFrame:", v59, v58, v11, v62);
  -[UIView setFrame:](self->_nameBottomSeparator, "setFrame:", v61, MaxY + -1.0 + v43 * -0.5 + 26.0, v60 - v53, 1.0);
  -[HKMedicalIDEditorMultilineStringCell textView](self, "textView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v21, v32, v23, v57);

  -[HKMedicalIDEditorMultilineStringCell placeholderLabel](self, "placeholderLabel");
  v63 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setFrame:", v54, v32, v56, v55);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)HKMedicalIDEditorNameAndPhotoCell;
  -[HKMedicalIDEditorMultilineStringCell sizeThatFits:](&v11, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[UIButton frame](self->_editPhotoLabelButton, "frame");
  v8 = CGRectGetMaxY(v13) + 4.0;
  if (v7 >= v8)
    v9 = v7;
  else
    v9 = v8;
  v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)setName:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[HKMedicalIDEditorMultilineStringCell setStringValue:](self, "setStringValue:", v4);

}

- (void)setPhoto:(id)a3
{
  id v4;
  void *v5;
  UIButton *editPhotoButton;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HKMedicalIDEditorNameAndPhotoCell photo](self, "photo");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v4 != v10)
  {
    -[UIButton setImage:forState:](self->_editPhotoButton, "setImage:forState:", v10, 0);
    editPhotoButton = self->_editPhotoButton;
    if (v10)
    {
      -[UIButton setTitle:forState:](self->_editPhotoButton, "setTitle:forState:", 0, 0);
      -[UIButton setContentVerticalAlignment:](self->_editPhotoButton, "setContentVerticalAlignment:", 3);
      -[UIButton setContentHorizontalAlignment:](self->_editPhotoButton, "setContentHorizontalAlignment:", 3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("add_photo"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](editPhotoButton, "setTitle:forState:", v8, 0);

      -[UIButton setContentVerticalAlignment:](self->_editPhotoButton, "setContentVerticalAlignment:", 0);
      -[UIButton setContentHorizontalAlignment:](self->_editPhotoButton, "setContentHorizontalAlignment:", 0);
      -[UIButton titleLabel](self->_editPhotoButton, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextAlignment:", 1);

    }
    -[UIButton setHidden:](self->_editPhotoLabelButton, "setHidden:", v10 == 0);
    -[HKMedicalIDEditorNameAndPhotoCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (UIImage)photo
{
  return -[UIButton imageForState:](self->_editPhotoButton, "imageForState:", 0);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[HKMedicalIDEditorMultilineStringCell commitEditing](self, "commitEditing", a3);
  return 1;
}

+ (BOOL)showsLabelAndValue
{
  return 0;
}

- (void)_adjustEditPhotoButtonFontSizeIfNecessary
{
  void *v3;
  void *v4;
  _BOOL4 IsUsingAccessibilityContentSizeCategory;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat Height;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  _QWORD v26[2];
  CGRect v27;
  CGRect v28;

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("add_photo"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  v6 = 1.0;
  if (IsUsingAccessibilityContentSizeCategory)
    v6 = 2.0;
  v7 = v6 * 14.0;
  if (v6 * 14.0 >= 10.0)
  {
    v8 = v6 * 60.0;
    v9 = *MEMORY[0x1E0DC1138];
    v24 = v6 * 60.0 * 0.5 * (v6 * 60.0 * 0.5);
    do
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v7, *(_QWORD *)&v24, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 1, v11, 0, v8, v8);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;

      v27.origin.x = v13;
      v27.origin.y = v15;
      v27.size.width = v17;
      v27.size.height = v19;
      v20 = CGRectGetWidth(v27) * 0.5;
      v28.origin.x = v13;
      v28.origin.y = v15;
      v28.size.width = v17;
      v28.size.height = v19;
      Height = CGRectGetHeight(v28);
      if (v20 * v20 + Height * 0.5 * (Height * 0.5) <= v24)
        break;
      v7 = v7 + -0.5;
    }
    while (v7 >= 10.0);
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_editPhotoButton, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFont:", v22);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v10, "length"))
  {
    if (objc_msgSend(v10, "length") != 1)
    {
      v21 = 0;
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\n+"), 1, &v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByReplacingMatchesInString:options:range:withTemplate:", v10, 0, 0, objc_msgSend(v10, "length"), CFSTR(" "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "beginningOfDocument");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "positionFromPosition:offset:", v16, location);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "positionFromPosition:offset:", v17, length);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textRangeFromPosition:toPosition:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "replaceRange:withText:", v19, v15);
      -[HKMedicalIDEditorMultilineStringCell textViewDidChangeSelection:](self, "textViewDidChangeSelection:", v9);

      goto LABEL_7;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("\n")))
    {
      objc_msgSend(v9, "resignFirstResponder");
LABEL_7:
      v11 = 0;
      goto LABEL_8;
    }
  }
  v11 = 1;
LABEL_8:

  return v11;
}

- (CGRect)_separatorFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIButton)editPhotoButton
{
  return self->_editPhotoButton;
}

- (UIButton)editPhotoLabelButton
{
  return self->_editPhotoLabelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editPhotoLabelButton, 0);
  objc_storeStrong((id *)&self->_editPhotoButton, 0);
  objc_storeStrong((id *)&self->_nameBottomSeparator, 0);
}

@end

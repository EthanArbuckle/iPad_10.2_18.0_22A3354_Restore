@implementation CNAvatarCardContactCell

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0, 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v6, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNAvatarCardContactCell;
  -[CNAvatarCardActionCell awakeFromNib](&v3, sel_awakeFromNib);
  -[CNAvatarCardContactCell _updateFonts](self, "_updateFonts");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNAvatarCardContactCell;
  -[CNAvatarCardActionCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CNAvatarCardContactCell _updateFonts](self, "_updateFonts");
}

- (void)reloadData
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CNMonogrammer *v17;
  void *v18;
  CNMonogrammer *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  CGRect v27;

  -[CNAvatarCardActionCell action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "mainAction");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  objc_opt_class();
  v26 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v26;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "propertyAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatterWithFallBacks");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromContact:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardActionCell titleLabel](self, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    -[CNAvatarCardContactCell contactImageView](self, "contactImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutIfNeeded");

    v17 = [CNMonogrammer alloc];
    -[CNAvatarCardContactCell contactImageView](self, "contactImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v19 = -[CNMonogrammer initWithStyle:diameter:](v17, "initWithStyle:diameter:", 0, CGRectGetWidth(v27));

    -[CNAvatarCardContactCell contactImageView](self, "contactImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMonogrammer monogramForContact:](v19, "monogramForContact:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:", v21);

    +[CNUIColorRepository navigationListActionIconFillColorRegular](CNUIColorRepository, "navigationListActionIconFillColorRegular");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardActionCell actionImageView](self, "actionImageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTintColor:", v22);

    objc_msgSend(v9, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardActionCell actionImageView](self, "actionImageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setImage:", v24);

  }
}

- (BOOL)moreHighlighted
{
  return 1;
}

- (UIImageView)contactImageView
{
  return self->_contactImageView;
}

- (void)setContactImageView:(id)a3
{
  objc_storeStrong((id *)&self->_contactImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactImageView, 0);
}

@end

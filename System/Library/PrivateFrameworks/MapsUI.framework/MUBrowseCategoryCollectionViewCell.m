@implementation MUBrowseCategoryCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("MKVenuesBrowseCollectionViewCellIdentifier");
}

- (MUBrowseCategoryCollectionViewCell)initWithFrame:(CGRect)a3
{
  MUBrowseCategoryCollectionViewCell *v3;
  MUBrowseCategoryCollectionViewCell *v4;
  UIImageView *v5;
  UIImageView *imageView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIImageView *v16;
  UIImageView *highlightedImageView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UILabel *v26;
  UILabel *titleLabel;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSLayoutConstraint *titleLabelTopConstraint;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  objc_super v62;
  _QWORD v63[4];
  _QWORD v64[4];
  _QWORD v65[6];

  v65[4] = *MEMORY[0x1E0C80C00];
  v62.receiver = self;
  v62.super_class = (Class)MUBrowseCategoryCollectionViewCell;
  v3 = -[MUBrowseCategoryCollectionViewCell initWithFrame:](&v62, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUBrowseCategoryCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("VenuesBrowseCategoryCollectionViewCell"));
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v5;

    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v4->_imageView, "setAccessibilityIdentifier:", CFSTR("VenuesBrowseCategoryImage"));
    -[MUBrowseCategoryCollectionViewCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_imageView);

    v47 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView centerXAnchor](v4->_imageView, "centerXAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUBrowseCategoryCollectionViewCell contentView](v4, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "centerXAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v53);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v50;
    -[UIImageView topAnchor](v4->_imageView, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUBrowseCategoryCollectionViewCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v10;
    -[UIImageView widthAnchor](v4->_imageView, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToConstant:", 40.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v12;
    -[UIImageView heightAnchor](v4->_imageView, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 40.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v65[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "activateConstraints:", v15);

    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    highlightedImageView = v4->_highlightedImageView;
    v4->_highlightedImageView = v16;

    -[UIImageView setContentMode:](v4->_highlightedImageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_highlightedImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUBrowseCategoryCollectionViewCell imageView](v4, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v4->_highlightedImageView);

    v46 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView topAnchor](v4->_highlightedImageView, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView topAnchor](v4->_imageView, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v57);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v54;
    -[UIImageView bottomAnchor](v4->_highlightedImageView, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v4->_imageView, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v48);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v44;
    -[UIImageView leadingAnchor](v4->_highlightedImageView, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v21;
    -[UIImageView trailingAnchor](v4->_highlightedImageView, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "activateConstraints:", v25);

    -[UIImageView setAlpha:](v4->_highlightedImageView, "setAlpha:", 0.0);
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v26;

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 4);
    LODWORD(v28) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v28);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", CFSTR("VenuesBrowseCategoryTitle"));
    -[MUBrowseCategoryCollectionViewCell contentView](v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v4->_titleLabel);

    -[UILabel firstBaselineAnchor](v4->_titleLabel, "firstBaselineAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v4->_imageView, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 16.0);
    v32 = objc_claimAutoreleasedReturnValue();
    titleLabelTopConstraint = v4->_titleLabelTopConstraint;
    v4->_titleLabelTopConstraint = (NSLayoutConstraint *)v32;

    v49 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUBrowseCategoryCollectionViewCell contentView](v4, "contentView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v55);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v52;
    -[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUBrowseCategoryCollectionViewCell contentView](v4, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v37;
    v63[2] = v4->_titleLabelTopConstraint;
    -[UILabel lastBaselineAnchor](v4->_titleLabel, "lastBaselineAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUBrowseCategoryCollectionViewCell contentView](v4, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v63[3] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "activateConstraints:", v42);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUBrowseCategoryCollectionViewCell;
  -[MUBrowseCategoryCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[MUBrowseCategoryCollectionViewCell setBrowseItem:](self, "setBrowseItem:", 0);
}

- (void)setTitleLabelTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUBrowseCategoryCollectionViewCell titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v4 = a3;
  -[MUBrowseCategoryCollectionViewCell preferredSize](self, "preferredSize");
  v6 = v5;
  -[MUBrowseCategoryCollectionViewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredMaxLayoutWidth:", v6);

  -[MUBrowseCategoryCollectionViewCell preferredTitleLabelFont](self, "preferredTitleLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBrowseCategoryCollectionViewCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[MUBrowseCategoryCollectionViewCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_mapkit_scaledValueForValue:", 16.0);
  v13 = v12;
  -[MUBrowseCategoryCollectionViewCell titleLabelTopConstraint](self, "titleLabelTopConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v13);

  v19.receiver = self;
  v19.super_class = (Class)MUBrowseCategoryCollectionViewCell;
  -[MUBrowseCategoryCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v19, sel_preferredLayoutAttributesFittingAttributes_, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "frame");
  CGRectGetWidth(v20);
  -[MUBrowseCategoryCollectionViewCell preferredSize](self, "preferredSize");
  objc_msgSend(v15, "frame");
  CGRectGetHeight(v21);
  -[MUBrowseCategoryCollectionViewCell preferredSize](self, "preferredSize");
  objc_msgSend(v15, "frame");
  v17 = v16;
  objc_msgSend(v15, "frame");
  objc_msgSend(v15, "setFrame:", v17);
  return v15;
}

- (void)setBrowseItem:(id)a3
{
  MUBrowseCategoryItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = (MUBrowseCategoryItem *)a3;
  if (self->_browseItem != v5)
  {
    objc_storeStrong((id *)&self->_browseItem, a3);
    -[MUBrowseCategoryItem image](v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUBrowseCategoryCollectionViewCell imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);

    -[MUBrowseCategoryCollectionViewCell highlightedImageView](self, "highlightedImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", 0);

    -[MUBrowseCategoryItem title](v5, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0DC1288]);
      objc_msgSend(v10, "setAlignment:", 1);
      v11 = objc_alloc(MEMORY[0x1E0CB3498]);
      v15 = *MEMORY[0x1E0DC1178];
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v9, v12);

    }
    else
    {
      v13 = 0;
    }
    -[MUBrowseCategoryCollectionViewCell titleLabel](self, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttributedText:", v13);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MUBrowseCategoryCollectionViewCell;
  -[MUBrowseCategoryCollectionViewCell setHighlighted:](&v14, sel_setHighlighted_);
  -[MUBrowseCategoryCollectionViewCell highlightedImageView](self, "highlightedImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[MUBrowseCategoryCollectionViewCell imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.150000006);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_flatImageWithColor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUBrowseCategoryCollectionViewCell highlightedImageView](self, "highlightedImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v10);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__MUBrowseCategoryCollectionViewCell_setHighlighted___block_invoke;
  v12[3] = &unk_1E2E01998;
  v12[4] = self;
  v13 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v12, 0.100000001);
}

void __53__MUBrowseCategoryCollectionViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "highlightedImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (MUBrowseCategoryItem)browseItem
{
  return self->_browseItem;
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (UIFont)preferredTitleLabelFont
{
  return self->_preferredTitleLabelFont;
}

- (void)setPreferredTitleLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_preferredTitleLabelFont, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIImageView)highlightedImageView
{
  return self->_highlightedImageView;
}

- (void)setHighlightedImageView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSLayoutConstraint)titleLabelTopConstraint
{
  return self->_titleLabelTopConstraint;
}

- (void)setTitleLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_highlightedImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_preferredTitleLabelFont, 0);
  objc_storeStrong((id *)&self->_browseItem, 0);
}

@end

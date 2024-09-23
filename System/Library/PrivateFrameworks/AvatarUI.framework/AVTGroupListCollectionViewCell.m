@implementation AVTGroupListCollectionViewCell

+ (id)cellIdentifier
{
  return CFSTR("AVTGroupListCollectionViewCell");
}

+ (id)defaultSymbolImageName
{
  return CFSTR("suit.diamond.fill");
}

- (AVTGroupListCollectionViewCell)initWithFrame:(CGRect)a3
{
  AVTGroupListCollectionViewCell *v3;
  AVTGroupListCollectionViewCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTGroupListCollectionViewCell;
  v3 = -[AVTGroupListCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AVTGroupListCollectionViewCell setupContent](v3, "setupContent");
    -[AVTGroupListCollectionViewCell layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 1);

    -[AVTGroupListCollectionViewCell layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 5.0);

  }
  return v4;
}

- (void)setupContent
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *label;
  void *v11;
  void *v12;
  UIImageView *v13;
  UIImageView *imageView;
  void *v15;
  void *v16;
  void *v17;
  UIImageView *v18;
  UILabel *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  -[AVTGroupListCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEA700]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  label = self->_label;
  self->_label = v9;

  +[AVTUIFontRepository groupListLabelFont](AVTUIFontRepository, "groupListLabelFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v11);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_label, "setBackgroundColor:", v12);

  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 2);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_label);
  v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v5, v6, v7, v8);
  imageView = self->_imageView;
  self->_imageView = v13;

  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v15);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v16);

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:", *MEMORY[0x1E0CEB538]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v31);
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_imageView);
  v17 = (void *)MEMORY[0x1E0CB3718];
  v18 = self->_imageView;
  v33[0] = CFSTR("image");
  v33[1] = CFSTR("label");
  v19 = self->_label;
  v34[0] = v18;
  v34[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(imageL)-[image(imageLength)]-(spacing)-[label]-|"), 0, &unk_1EA571B98, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v21);

  -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToConstant:", 18.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  -[UIImageView centerYAnchor](self->_imageView, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v26;
  -[UILabel centerYAnchor](self->_label, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v30);

}

+ (double)estimatedLabelWidthForContainerWidth:(double)a3
{
  return a3 + -26.0 + -5.0;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "estimatedLabelWidthForContainerWidth:", a3.width);
  v8 = v7;
  -[AVTGroupListCollectionViewCell label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredMaxLayoutWidth:", v8);

  -[AVTGroupListCollectionViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemLayoutSizeFittingSize:", width, 1.0);
  v12 = v11;

  -[AVTGroupListCollectionViewCell estimatedLabelWidth](self, "estimatedLabelWidth");
  v14 = v13;
  -[AVTGroupListCollectionViewCell label](self, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredMaxLayoutWidth");
  if (v14 <= v16)
    v17 = 0.0;
  else
    v17 = 10.0;

  -[AVTGroupListCollectionViewCell bounds](self, "bounds");
  v19 = v18;
  v20 = 48.0;
  if (v12 >= 48.0)
    v20 = v12;
  v21 = v20 + v17;
  result.height = v21;
  result.width = v19;
  return result;
}

- (double)estimatedLabelWidth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[AVTGroupListCollectionViewCell label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0.0;
  v13 = *MEMORY[0x1E0CEA098];
  -[AVTGroupListCollectionViewCell label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTGroupListCollectionViewCell label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeWithAttributes:", v7);
  v11 = v10;

  return v11;
}

- (void)setTitle:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[AVTGroupListCollectionViewCell label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (void)setSymbolName:(id)a3
{
  void *v3;
  id *p_symbolName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  p_symbolName = (id *)&self->_symbolName;
  v12 = a3;
  if ((objc_msgSend(*p_symbolName, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_symbolName, a3);
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      v9 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend((id)objc_opt_class(), "defaultSymbolImageName");
      p_symbolName = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_systemImageNamed:", p_symbolName);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "imageWithRenderingMode:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[AVTGroupListCollectionViewCell imageView](self, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v8);

    if (!v7)
    {

    }
    -[AVTGroupListCollectionViewCell imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentMode:", 1);

  }
}

+ (id)highlightedBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTUIColorRepository dynamicColorWithLightColor:darkColor:](AVTUIColorRepository, "dynamicColorWithLightColor:darkColor:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setSelected:(BOOL)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTGroupListCollectionViewCell;
  -[AVTGroupListCollectionViewCell setSelected:](&v6, sel_setSelected_);
  if (a3)
    +[AVTUIColorRepository groupSidePickerCellSelectedBackgroundColor](AVTUIColorRepository, "groupSidePickerCellSelectedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTGroupListCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (UILabel)label
{
  return self->_label;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

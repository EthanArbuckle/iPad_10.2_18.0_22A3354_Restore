@implementation AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell

+ (id)cellIdentifier
{
  return CFSTR("AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell");
}

+ (id)labelFont
{
  return +[AVTUIFontRepository multicolorPickerLabelFont](AVTUIFontRepository, "multicolorPickerLabelFont");
}

+ (double)estimatedWidthForLabelSize:(CGSize)a3
{
  return a3.width + 20.0;
}

+ (double)estimatedTitleSpaceForWidth:(double)a3
{
  return a3 + -20.0;
}

- (AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell)initWithFrame:(CGRect)a3
{
  AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell *v3;
  id v4;
  uint64_t v5;
  UILabel *label;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell;
  v3 = -[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    objc_msgSend((id)objc_opt_class(), "labelFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v8);

    -[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_label);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  void *v5;
  double Height;
  void *v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell;
  -[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell layoutSubviews](&v8, sel_layoutSubviews);
  -[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = CGRectGetWidth(v9) + -20.0;
  -[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Height = CGRectGetHeight(v10);
  -[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 10.0, 0.0, v4, Height);

}

- (void)setItem:(id)a3
{
  void *v5;
  void *v6;
  AVTAvatarAttributeEditorSectionItem *v7;

  v7 = (AVTAvatarAttributeEditorSectionItem *)a3;
  if (self->_item != v7)
  {
    objc_storeStrong((id *)&self->_item, a3);
    -[AVTAvatarAttributeEditorSectionItem localizedName](v7, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[AVTAvatarAttributeEditorMulticolorPickerPlaceholderCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (AVTAvatarAttributeEditorSectionItem)item
{
  return self->_item;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end

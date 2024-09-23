@implementation CNSharingProfilePhotoPickerItemCell

- (CNSharingProfilePhotoPickerItemCell)initWithFrame:(CGRect)a3
{
  CNSharingProfilePhotoPickerItemCell *v3;
  CNSharingProfilePhotoPickerItemCell *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  uint64_t v9;
  UIImageView *imageView;
  void *v11;
  void *v12;
  uint64_t v13;
  CAShapeLayer *selectionStrokeLayer;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  CNSharingProfilePhotoPickerItemCell *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CNSharingProfilePhotoPickerItemCell;
  v3 = -[CNSharingProfilePhotoPickerItemCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CNSharingProfilePhotoPickerItemCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClipsToBounds:", 0);

    -[CNSharingProfilePhotoPickerItemCell bounds](v4, "bounds");
    v4->_originalSize.width = v6;
    v4->_originalSize.height = v7;
    v8 = objc_alloc(MEMORY[0x1E0DC3890]);
    v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v4->_imageView, "setBackgroundColor:", v11);

    -[UIImageView setClipsToBounds:](v4->_imageView, "setClipsToBounds:", 1);
    -[CNSharingProfilePhotoPickerItemCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_imageView);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v13 = objc_claimAutoreleasedReturnValue();
    selectionStrokeLayer = v4->_selectionStrokeLayer;
    v4->_selectionStrokeLayer = (CAShapeLayer *)v13;

    -[CNSharingProfilePhotoPickerItemCell bounds](v4, "bounds");
    -[CAShapeLayer setFrame:](v4->_selectionStrokeLayer, "setFrame:");
    -[CNSharingProfilePhotoPickerItemCell selectionBezierPath](v4, "selectionBezierPath");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](v4->_selectionStrokeLayer, "setPath:", objc_msgSend(v15, "CGPath"));

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v4->_selectionStrokeLayer, "setStrokeColor:", objc_msgSend(v16, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v4->_selectionStrokeLayer, "setFillColor:", objc_msgSend(v17, "CGColor"));

    -[CAShapeLayer setLineWidth:](v4->_selectionStrokeLayer, "setLineWidth:", 3.0);
    -[CAShapeLayer setHidden:](v4->_selectionStrokeLayer, "setHidden:", 1);
    -[CNSharingProfilePhotoPickerItemCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSublayer:", v4->_selectionStrokeLayer);

    v20 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)CNSharingProfilePhotoPickerItemCell;
  -[CNSharingProfilePhotoPickerItemCell layoutSubviews](&v13, sel_layoutSubviews);
  -[CNSharingProfilePhotoPickerItemCell bounds](self, "bounds");
  v15 = CGRectInset(v14, 8.0, 8.0);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  -[UIImageView bounds](self->_imageView, "bounds");
  v4 = v3 * 0.5;
  -[CNSharingProfilePhotoPickerItemCell _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  if (v6 == 0.0)
  {
    if (RoundToScale_onceToken != -1)
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
    v6 = *(double *)&RoundToScale___s;
  }
  v7 = v6 == 1.0;
  v8 = round(v6 * v4) / v6;
  v9 = round(v4);
  if (v7)
    v10 = v9;
  else
    v10 = v8;

  -[UIImageView layer](self->_imageView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", v10);

  -[CNSharingProfilePhotoPickerItemCell bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_selectionStrokeLayer, "setFrame:");
  -[CNSharingProfilePhotoPickerItemCell selectionBezierPath](self, "selectionBezierPath");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_selectionStrokeLayer, "setPath:", objc_msgSend(v12, "CGPath"));

}

- (void)setPickerItem:(id)a3
{
  CNSharingProfilePhotoPickerItem *v5;
  CNSharingProfilePhotoPickerItem **p_pickerItem;
  void *v7;
  UIImageView *imageView;
  CNSharingProfilePhotoPickerItem *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNSharingProfilePhotoPickerItem *v19;

  v5 = (CNSharingProfilePhotoPickerItem *)a3;
  p_pickerItem = &self->_pickerItem;
  if (self->_pickerItem != v5)
  {
    v19 = v5;
    objc_storeStrong((id *)&self->_pickerItem, a3);
    -[CNSharingProfilePhotoPickerItem avatarItem](*p_pickerItem, "avatarItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    imageView = self->_imageView;
    if (v7)
    {
      -[UIImageView setContentMode:](imageView, "setContentMode:", 1);
      v9 = *p_pickerItem;
      -[CNSharingProfilePhotoPickerItemCell bounds](self, "bounds");
      -[CNSharingProfilePhotoPickerItem compositeImageWithSize:](v9, "compositeImageWithSize:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharingProfilePhotoPickerItemCell updateWithImage:](self, "updateWithImage:", v12);
    }
    else
    {
      -[UIImageView setContentMode:](imageView, "setContentMode:", 4);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_isSmallScreen)
        v13 = 1;
      else
        v13 = 2;
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4AE8], v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0DC3870];
      -[CNSharingProfilePhotoPickerItem symbolImageName](*p_pickerItem, "symbolImageName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "systemImageNamed:withConfiguration:", v16, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "imageWithTintColor:renderingMode:", v12, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIImageView setImage:](self->_imageView, "setImage:", v18);
    }

    v5 = v19;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNSharingProfilePhotoPickerItemCell;
  v4 = a3;
  -[CNSharingProfilePhotoPickerItemCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v9.receiver, v9.super_class);

  -[CNSharingProfilePhotoPickerItemCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_selectionStrokeLayer, "setStrokeColor:", objc_msgSend(v8, "CGColor"));

  }
}

- (id)selectionBezierPath
{
  void *v2;
  CGRect v4;
  CGRect v5;

  v2 = (void *)MEMORY[0x1E0DC3508];
  -[CNSharingProfilePhotoPickerItemCell bounds](self, "bounds");
  v5 = CGRectInset(v4, 3.0, 3.0);
  return (id)objc_msgSend(v2, "bezierPathWithOvalInRect:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (void)updateWithImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  -[CAShapeLayer setHidden:](self->_selectionStrokeLayer, "setHidden:", !a3);
}

- (void)setSelected:(BOOL)a3
{
  -[CAShapeLayer setHidden:](self->_selectionStrokeLayer, "setHidden:", !a3);
}

- (void)prepareForReuse
{
  objc_super v3;

  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  -[CAShapeLayer setHidden:](self->_selectionStrokeLayer, "setHidden:", 1);
  v3.receiver = self;
  v3.super_class = (Class)CNSharingProfilePhotoPickerItemCell;
  -[CNSharingProfilePhotoPickerItemCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (BOOL)isSmallScreen
{
  return self->_isSmallScreen;
}

- (void)setIsSmallScreen:(BOOL)a3
{
  self->_isSmallScreen = a3;
}

- (CNSharingProfilePhotoPickerItem)pickerItem
{
  return self->_pickerItem;
}

- (CAShapeLayer)selectionStrokeLayer
{
  return self->_selectionStrokeLayer;
}

- (void)setSelectionStrokeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionStrokeLayer, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (CGSize)originalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_originalSize.width;
  height = self->_originalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOriginalSize:(CGSize)a3
{
  self->_originalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_selectionStrokeLayer, 0);
  objc_storeStrong((id *)&self->_pickerItem, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("CNSharingProfilePhotoPickerItemCell");
}

@end

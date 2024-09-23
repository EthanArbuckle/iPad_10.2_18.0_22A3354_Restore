@implementation DOCBorderedFittingImageView

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DOCBorderedFittingImageView;
  -[DOCFittingImageView layoutSubviews](&v13, sel_layoutSubviews);
  if (-[DOCBorderedFittingImageView addDecoration](self, "addDecoration"))
  {
    -[DOCBorderedFittingImageView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[DOCSeparatorView separatorThicknessForTraitCollection:](DOCSeparatorView, "separatorThicknessForTraitCollection:", v3);
    v5 = v4;
    -[DOCBorderedFittingImageView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderWidth:", v5);

    -[DOCBorderedFittingImageView decorationCornerRadius](self, "decorationCornerRadius");
    v8 = v7;
    -[DOCBorderedFittingImageView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v8;
  }
  else
  {
    -[DOCBorderedFittingImageView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderWidth:", 0.0);

    -[DOCBorderedFittingImageView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0.0;
  }
  objc_msgSend(v9, "setCornerRadius:", v11);

}

- (BOOL)addDecoration
{
  return self->_addDecoration;
}

- (double)decorationCornerRadius
{
  double result;
  double v4;
  double v5;
  double v6;
  double v7;

  result = self->_decorationCornerRadius;
  if (result < 0.0)
  {
    -[DOCFittingImageView fittingSize](self, "fittingSize");
    v5 = v4;
    -[DOCFittingImageView fittingSize](self, "fittingSize");
    if (v5 >= v6)
      v7 = v5;
    else
      v7 = v6;
    result = v7 * 6.0 * 0.0078125 + -1.0;
    if (result < 3.0)
      return 3.0;
  }
  return result;
}

- (void)updateImage:(id)a3 addDecoration:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[DOCFittingImageView setThumbnail:](self, "setThumbnail:", a3);
  -[DOCBorderedFittingImageView setAddDecoration:](self, "setAddDecoration:", v4);
  -[DOCBorderedFittingImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAddDecoration:(BOOL)a3
{
  if (self->_addDecoration != a3)
  {
    self->_addDecoration = a3;
    -[DOCBorderedFittingImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)initCommon
{
  objc_super v2;

  self->_decorationCornerRadius = -1.0;
  v2.receiver = self;
  v2.super_class = (Class)DOCBorderedFittingImageView;
  -[DOCFittingImageView initCommon](&v2, sel_initCommon);
}

- (void)setDecorationCornerRadius:(double)a3
{
  if (a3 < 0.0)
    a3 = -1.0;
  if (self->_decorationCornerRadius != a3)
  {
    self->_decorationCornerRadius = a3;
    -[DOCBorderedFittingImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFittingSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  -[DOCFittingImageView fittingSize](self, "fittingSize");
  v7 = v6;
  v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)DOCBorderedFittingImageView;
  -[DOCFittingImageView setFittingSize:](&v11, sel_setFittingSize_, width, height);
  if (v7 != width || v9 != height)
    -[DOCBorderedFittingImageView setNeedsLayout](self, "setNeedsLayout");
}

@end

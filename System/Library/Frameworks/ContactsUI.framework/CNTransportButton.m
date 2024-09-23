@implementation CNTransportButton

- (void)setGlyphColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_glyphColor != v5)
  {
    objc_storeStrong((id *)&self->_glyphColor, a3);
    -[CNTransportButton setTintColor:](self, "setTintColor:", v5);
    -[CNTransportButton _updateImageWithType:](self, "_updateImageWithType:", -[CNTransportButton transportType](self, "transportType"));
  }

}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)_updateImageWithType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0DC3870];
  -[CNTransportButton glyphColor](self, "glyphColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cnui_symbolImageForTransportType:withColor:", a3, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNTransportButton setHidden:](self, "setHidden:", 0);
    -[CNTransportButton setImage:](self, "setImage:", v8);
    -[CNTransportButton image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNTransportButton setImage:forState:](self, "setImage:forState:", v7, 0);

  }
  else
  {
    -[CNTransportButton setHidden:](self, "setHidden:", 1);
    -[CNTransportButton setImage:](self, "setImage:", 0);
    -[CNTransportButton setImage:forState:](self, "setImage:forState:", 0, 0);
  }

}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNTransportButton;
  -[CNTransportButton tintColorDidChange](&v4, sel_tintColorDidChange);
  -[CNTransportButton glyphColor](self, "glyphColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CNTransportButton _updateImageWithType:](self, "_updateImageWithType:", -[CNTransportButton transportType](self, "transportType"));
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

+ (CNTransportButton)transportButtonWithType:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "buttonWithType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v4);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 1, v7);
  objc_msgSend(v3, "setShowBackgroundPlatter:", 1);
  objc_msgSend(v3, "_setTouchInsets:", -3.5, -3.5, -3.5, -3.5);
  return (CNTransportButton *)v3;
}

- (void)setShowBackgroundPlatter:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (self->_showBackgroundPlatter != a3)
  {
    self->_showBackgroundPlatter = a3;
    if (a3)
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "transportBackgroundColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNTransportButton setBackgroundColor:](self, "setBackgroundColor:", v5);

      -[CNTransportButton _screen](self, "_screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scale");
      if (v7 == 0.0)
      {
        if (RoundToScale_onceToken != -1)
          dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
        v7 = *(double *)&RoundToScale___s;
      }
      v8 = 19.0;
      if (v7 != 1.0)
        v8 = round(v7 * 18.5) / v7;

      -[CNTransportButton layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCornerRadius:", v8);

      -[CNTransportButton layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBorderWidth:", 1.0);

      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "transportBorderColor");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "CGColor");
      -[CNTransportButton layer](self, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBorderColor:", v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNTransportButton setBackgroundColor:](self, "setBackgroundColor:", v14);

      -[CNTransportButton layer](self, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCornerRadius:", 0.0);

      -[CNTransportButton layer](self, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBorderWidth:", 0.0);

      -[CNTransportButton layer](self, "layer");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBorderColor:", 0);
    }

  }
}

+ (id)transportButton
{
  return (id)objc_msgSend(a1, "transportButtonWithType:", 1);
}

- (void)setTransportType:(int64_t)a3
{
  if (self->_transportType != a3)
  {
    self->_transportType = a3;
    -[CNTransportButton _updateImageWithType:](self, "_updateImageWithType:");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 37.0;
  v3 = 37.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_updateTouchInsetsToFillContainerWithSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;

  height = a3.height;
  width = a3.width;
  -[CNTransportButton frame](self, "frame");
  v6 = width - CGRectGetMaxX(v14);
  if (v6 >= 37.0)
    v7 = -8.0;
  else
    v7 = -v6;
  if (width >= height)
    v8 = height;
  else
    v8 = width;
  v9 = v8 + -37.0;
  v10 = v8 <= 44.0;
  v11 = 7.0;
  if (!v10)
    v11 = v9;
  v12 = v11 * -0.5;
  v10 = v11 <= 0.0;
  v13 = -0.0;
  if (!v10)
    v13 = v12;
  -[CNTransportButton _setTouchInsets:](self, "_setTouchInsets:", v13, v13, v13, v7);
}

- (BOOL)showBackgroundPlatter
{
  return self->_showBackgroundPlatter;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_glyphColor, 0);
}

@end

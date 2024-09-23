@implementation CPSScaledImageView

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPSScaledImageView;
  v4 = a3;
  -[CPSScaledImageView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[CPSScaledImageView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
    -[CPSScaledImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)invalidateIntrinsicContentSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPSScaledImageView;
  -[CPSScaledImageView invalidateIntrinsicContentSize](&v3, sel_invalidateIntrinsicContentSize);
  self->_needsUpdateScaledImageSize = 1;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  NSString *textStyleForScaling;
  void *v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double width;
  double height;
  CGSize result;

  if (self->_needsUpdateScaledImageSize)
  {
    self->_needsUpdateScaledImageSize = 0;
    -[CPSScaledImageView image](self, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[CPSScaledImageView traitCollection](self, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_textStyleForScaling)
        textStyleForScaling = self->_textStyleForScaling;
      else
        textStyleForScaling = (NSString *)*MEMORY[0x1E0CEB538];
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:compatibleWithTraitCollection:", textStyleForScaling, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "size");
      v8 = v7;
      objc_msgSend(v6, "_scaledValueForValue:");
      objc_msgSend(v6, "_scaledValueForValue:", v8);
      objc_msgSend(v4, "displayScale");
      UISizeRoundToScale();
      self->_scaledImageSize.width = v9;
      self->_scaledImageSize.height = v10;

    }
    else
    {
      self->_scaledImageSize = (CGSize)*MEMORY[0x1E0C9D820];
    }

  }
  width = self->_scaledImageSize.width;
  height = self->_scaledImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)textStyleForScaling
{
  return self->_textStyleForScaling;
}

- (void)setTextStyleForScaling:(id)a3
{
  objc_storeStrong((id *)&self->_textStyleForScaling, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStyleForScaling, 0);
}

@end

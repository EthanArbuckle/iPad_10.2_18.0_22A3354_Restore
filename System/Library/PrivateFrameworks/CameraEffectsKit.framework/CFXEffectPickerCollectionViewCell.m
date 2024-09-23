@implementation CFXEffectPickerCollectionViewCell

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXEffectPickerCollectionViewCell;
  -[CFXEffectPickerCollectionViewCell awakeFromNib](&v3, sel_awakeFromNib);
  -[CFXEffectPickerCollectionViewCell configureCellAppearence](self, "configureCellAppearence");
}

- (void)configureCellAppearence
{
  void *v3;
  void *v4;
  id v5;

  -[CFXEffectPickerCollectionViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 7.0);

  -[CFXEffectPickerCollectionViewCell imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CFXEffectPickerCollectionViewCell;
  -[CFXEffectPickerCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CFXEffectPickerCollectionViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setJtImage:", 0);

  -[CFXEffectPickerCollectionViewCell setEffect:](self, "setEffect:", 0);
  -[CFXEffectPickerCollectionViewCell setEffectIdentifier:](self, "setEffectIdentifier:", 0);
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CFXEffectPickerCollectionViewCell imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setJtImage:", v4);

}

- (JTImage)image
{
  void *v2;
  void *v3;

  -[CFXEffectPickerCollectionViewCell imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jtImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (JTImage *)v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CFXEffectPickerCollectionViewCell;
  -[CFXEffectPickerCollectionViewCell accessibilityLabel](&v5, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CFXEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
  objc_storeStrong((id *)&self->_effect, a3);
}

- (NSString)effectIdentifier
{
  return self->_effectIdentifier;
}

- (void)setEffectIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_effectIdentifier, a3);
}

- (JFXImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_effectIdentifier, 0);
  objc_storeStrong((id *)&self->_effect, 0);
}

@end

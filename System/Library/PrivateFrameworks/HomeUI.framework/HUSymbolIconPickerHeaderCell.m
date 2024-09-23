@implementation HUSymbolIconPickerHeaderCell

- (HUSymbolIconPickerHeaderCell)initWithFrame:(CGRect)a3
{
  HUSymbolIconPickerHeaderCell *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUSymbolIconPickerHeaderCell;
  v3 = -[HUSymbolIconPickerHeaderCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[HUSymbolIconPickerHeaderCell bounds](v3, "bounds");
    v5 = (void *)objc_msgSend(v4, "initWithFrame:");
    -[HUSymbolIconPickerHeaderCell setImageView:](v3, "setImageView:", v5);

    -[HUSymbolIconPickerHeaderCell imageView](v3, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 1);

    -[HUSymbolIconPickerHeaderCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSymbolIconPickerHeaderCell imageView](v3, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

  }
  return v3;
}

- (void)setIconDescriptor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_opt_class();
  v14 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v14;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "imageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:", *MEMORY[0x1E0CEB5B8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageSymbolConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationByApplyingConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:withConfiguration:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithRenderingMode:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSymbolIconPickerHeaderCell imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v12);

}

- (UIImageView)imageView
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
}

@end

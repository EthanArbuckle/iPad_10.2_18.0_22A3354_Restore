@implementation CNPhotoPickerGlyphProviderItem

+ (id)thumbnailViewForImage:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = fmax(v4, 90.0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v5, v5);
  objc_msgSend(v6, "setAutoresizingMask:", 18);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, v5, v5);
  objc_msgSend(v6, "center");
  objc_msgSend(v7, "setCenter:");
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "setContentMode:", 4);
  objc_msgSend(v7, "setImage:", v3);

  objc_msgSend(v6, "addSubview:", v7);
  return v6;
}

- (CNPhotoPickerGlyphProviderItem)initWithSymbolImageNamed:(id)a3 withAddItemType:(unint64_t)a4
{
  CNPhotoPickerGlyphProviderItem *v5;
  CNPhotoPickerGlyphProviderItem *v6;
  CNPhotoPickerGlyphProviderItem *v7;

  v5 = -[CNPhotoPickerGlyphProviderItem initWithSymbolImageNamed:](self, "initWithSymbolImageNamed:", a3);
  v6 = v5;
  if (v5)
  {
    v5->_addItemType = a4;
    v7 = v5;
  }

  return v6;
}

- (CNPhotoPickerGlyphProviderItem)initWithSymbolImageNamed:(id)a3
{
  id v5;
  CNPhotoPickerGlyphProviderItem *v6;
  CNPhotoPickerGlyphProviderItem *v7;
  CNPhotoPickerGlyphProviderItem *v8;

  v5 = a3;
  v6 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](self, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_symbolImageName, a3);
    v7->_addItemType = 4;
    v8 = v7;
  }

  return v7;
}

- (UIView)symbolImageView
{
  UIView *symbolImageView;

  symbolImageView = self->_symbolImageView;
  if (!symbolImageView)
  {
    -[CNPhotoPickerGlyphProviderItem setupSymbolImageView](self, "setupSymbolImageView");
    symbolImageView = self->_symbolImageView;
  }
  return symbolImageView;
}

- (void)setupSymbolImageView
{
  void *v3;
  _QWORD v4[5];

  -[CNPhotoPickerProviderItem callbackQueue](self, "callbackQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__CNPhotoPickerGlyphProviderItem_setupSymbolImageView__block_invoke;
  v4[3] = &unk_1E204F648;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (unint64_t)imageType
{
  return 0;
}

- (void)thumbnailViewWithCompletion:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[CNPhotoPickerGlyphProviderItem symbolImageView](self, "symbolImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (int64_t)scaleForImageNamed:(id)a3
{
  int v3;
  int64_t *v4;

  v3 = objc_msgSend(a3, "isEqualToString:", CFSTR("plus"));
  v4 = (int64_t *)MEMORY[0x1E0DC4CC8];
  if (!v3)
    v4 = (int64_t *)MEMORY[0x1E0DC4CD0];
  return *v4;
}

- (id)imageForImageNamed:(id)a3 withTintColor:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v6 = *MEMORY[0x1E0DC4B50];
  v7 = (void *)MEMORY[0x1E0DC3870];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", v9, -[CNPhotoPickerGlyphProviderItem scaleForImageNamed:](self, "scaleForImageNamed:", v9), 5, v8, 1, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)backgroundColorWithTintColor:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3E88];
  v4 = a3;
  objc_msgSend(v3, "traitCollectionWithUserInterfaceStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v13[0] = v7;
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "_dynamicColorWithColorsByTraitCollection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateTintColorIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CNPhotoPickerGlyphProviderItem tintColor](self, "tintColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v11)
  {
    -[CNPhotoPickerGlyphProviderItem setTintColor:](self, "setTintColor:", v11);
    v5 = (void *)objc_opt_class();
    -[CNPhotoPickerGlyphProviderItem symbolImageName](self, "symbolImageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerGlyphProviderItem imageForImageNamed:withTintColor:](self, "imageForImageNamed:withTintColor:", v6, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thumbnailViewForImage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerGlyphProviderItem setSymbolImageView:](self, "setSymbolImageView:", v8);

    -[CNPhotoPickerGlyphProviderItem backgroundColorWithTintColor:](self, "backgroundColorWithTintColor:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerGlyphProviderItem symbolImageView](self, "symbolImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

  }
}

- (unint64_t)addItemType
{
  return self->_addItemType;
}

- (void)setAddItemType:(unint64_t)a3
{
  self->_addItemType = a3;
}

- (void)setSymbolImageView:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImageView, a3);
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImageName, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);
}

void __54__CNPhotoPickerGlyphProviderItem_setupSymbolImageView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;

  v2 = (void *)objc_opt_class();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "symbolImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIColorRepository photoPickerSymbolImageColor](CNUIColorRepository, "photoPickerSymbolImageColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForImageNamed:withTintColor:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnailViewForImage:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 184);
  *(_QWORD *)(v8 + 184) = v7;

  v10 = *(id **)(a1 + 32);
  objc_msgSend(v10[23], "tintColor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundColorWithTintColor:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setBackgroundColor:", v11);

}

@end

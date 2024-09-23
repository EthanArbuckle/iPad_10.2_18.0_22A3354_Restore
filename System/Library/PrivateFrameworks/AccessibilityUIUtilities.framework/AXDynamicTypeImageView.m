@implementation AXDynamicTypeImageView

- (void)_commonInit
{
  UIFontMetrics *v3;
  UIFontMetrics *fontMetrics;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v3 = (UIFontMetrics *)objc_claimAutoreleasedReturnValue();
  fontMetrics = self->_fontMetrics;
  self->_fontMetrics = v3;

  v5 = (void *)*MEMORY[0x1E0DC4938];
  objc_storeStrong((id *)&self->_minimumContentSizeCategory, (id)*MEMORY[0x1E0DC4938]);
  objc_storeStrong((id *)&self->_maximumContentSizeCategory, v5);
  objc_initWeak(&location, self);
  v11[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__AXDynamicTypeImageView__commonInit__block_invoke;
  v8[3] = &unk_1E76ABB60;
  objc_copyWeak(&v9, &location);
  v7 = (id)-[AXDynamicTypeImageView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__AXDynamicTypeImageView__commonInit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_traitCollectionDidChange:", v4);

}

- (AXDynamicTypeImageView)initWithImage:(id)a3
{
  AXDynamicTypeImageView *v3;
  AXDynamicTypeImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXDynamicTypeImageView;
  v3 = -[AXDynamicTypeImageView initWithImage:](&v6, sel_initWithImage_, a3);
  v4 = v3;
  if (v3)
    -[AXDynamicTypeImageView _commonInit](v3, "_commonInit");
  return v4;
}

- (AXDynamicTypeImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  AXDynamicTypeImageView *v4;
  AXDynamicTypeImageView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXDynamicTypeImageView;
  v4 = -[AXDynamicTypeImageView initWithImage:highlightedImage:](&v7, sel_initWithImage_highlightedImage_, a3, a4);
  v5 = v4;
  if (v4)
    -[AXDynamicTypeImageView _commonInit](v4, "_commonInit");
  return v5;
}

- (AXDynamicTypeImageView)initWithFrame:(CGRect)a3
{
  AXDynamicTypeImageView *v3;
  AXDynamicTypeImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXDynamicTypeImageView;
  v3 = -[AXDynamicTypeImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AXDynamicTypeImageView _commonInit](v3, "_commonInit");
  return v4;
}

- (CGSize)_scaledSizeForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a3.width >= 0.0 && a3.height >= 0.0)
  {
    -[AXDynamicTypeImageView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXDynamicTypeImageView maximumContentSizeCategory](self, "maximumContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AXUIContentSizeCategoryMin(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXDynamicTypeImageView minimumContentSizeCategory](self, "minimumContentSizeCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXUIContentSizeCategoryMax(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXDynamicTypeImageView fontMetrics](self, "fontMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scaledValueForValue:compatibleWithTraitCollection:", v12, width);
    width = v14;
    -[AXDynamicTypeImageView fontMetrics](self, "fontMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scaledValueForValue:compatibleWithTraitCollection:", v12, height);
    height = v16;

  }
  v17 = width;
  v18 = height;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)AXDynamicTypeImageView;
  -[AXDynamicTypeImageView intrinsicContentSize](&v5, sel_intrinsicContentSize);
  -[AXDynamicTypeImageView _scaledSizeForSize:](self, "_scaledSizeForSize:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)AXDynamicTypeImageView;
  -[AXDynamicTypeImageView sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  -[AXDynamicTypeImageView _scaledSizeForSize:](self, "_scaledSizeForSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDynamicTypeImageView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) == 0)
    -[AXDynamicTypeImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setMinimumContentSizeCategory:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_minimumContentSizeCategory != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_minimumContentSizeCategory, a3);
    -[AXDynamicTypeImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v6;
  }

}

- (void)setMaximumContentSizeCategory:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_maximumContentSizeCategory != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_maximumContentSizeCategory, a3);
    -[AXDynamicTypeImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v6;
  }

}

- (void)setFontMetrics:(id)a3
{
  UIFontMetrics *v5;
  UIFontMetrics *v6;

  v5 = (UIFontMetrics *)a3;
  if (self->_fontMetrics != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fontMetrics, a3);
    -[AXDynamicTypeImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v6;
  }

}

- (UIFontMetrics)fontMetrics
{
  return self->_fontMetrics;
}

- (NSString)minimumContentSizeCategory
{
  return self->_minimumContentSizeCategory;
}

- (NSString)maximumContentSizeCategory
{
  return self->_maximumContentSizeCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_minimumContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_fontMetrics, 0);
}

@end

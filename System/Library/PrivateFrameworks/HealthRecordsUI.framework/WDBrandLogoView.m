@implementation WDBrandLogoView

- (WDBrandLogoView)initWithFrame:(CGRect)a3
{
  WDBrandLogoView *v3;
  WDBrandLogoView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WDBrandLogoView;
  v3 = -[WDBrandLogoView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WDBrandLogoView setContentMode:](v3, "setContentMode:", 4);
    LODWORD(v5) = 1148846080;
    -[WDBrandLogoView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v5);
    LODWORD(v6) = 1148846080;
    -[WDBrandLogoView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    LODWORD(v7) = 1148846080;
    -[WDBrandLogoView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v7);
    LODWORD(v8) = 1148846080;
    -[WDBrandLogoView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v8);
    objc_msgSend(MEMORY[0x1E0DC3890], "largeLogoViewDimension");
    -[WDBrandLogoView setSize:](v4, "setSize:");
  }
  return v4;
}

- (WDBrandLogoView)initWithSize:(double)a3
{
  WDBrandLogoView *v4;
  WDBrandLogoView *v5;

  v4 = -[WDBrandLogoView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
    -[WDBrandLogoView setSize:](v4, "setSize:", a3);
  return v5;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[WDBrandLogoView size](self, "size");
  v4 = v3;
  -[WDBrandLogoView size](self, "size");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)fetchBrandable:(id)a3 dataProvider:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20[3];
  id location;

  v6 = a3;
  v7 = a4;
  -[WDBrandLogoView prepareForReuse](self, "prepareForReuse");
  objc_initWeak(&location, self);
  -[WDBrandLogoView intrinsicContentSize](self, "intrinsicContentSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0DC3890], "logoDimensionForImageViewSize:");
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0DC3890], "logoInsetForImageViewSize:", v9, v11);
  v15 = v14;
  objc_msgSend(v6, "brand");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47__WDBrandLogoView_fetchBrandable_dataProvider___block_invoke;
  v19[3] = &unk_1E74D1B70;
  v20[1] = v15;
  objc_copyWeak(v20, &location);
  v20[2] = v13;
  v19[4] = self;
  objc_msgSend(v7, "fetchLogoForBrand:fallback:size:completion:", v16, v17, v19, *(double *)&v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDBrandLogoView setCancellationToken:](self, "setCancellationToken:", v18);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

}

uint64_t __47__WDBrandLogoView_fetchBrandable_dataProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  void *v7;
  id WeakRetained;

  if ((_DWORD)a3)
  {
    v5 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    v6 = *(double *)(a1 + 48);
    v5 = v6;
  }
  objc_msgSend(a2, "scaledToTargetSize:padding:", *(double *)(a1 + 56), *(double *)(a1 + 56), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setImage:", v7);

  objc_msgSend(*(id *)(a1 + 32), "setIsFallback:", a3);
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyle");
}

- (void)prepareForReuse
{
  void *v3;

  -[WDBrandLogoView cancellationToken](self, "cancellationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[WDBrandLogoView setCancellationToken:](self, "setCancellationToken:", 0);
  -[WDBrandLogoView setImage:](self, "setImage:", 0);
}

- (void)setSize:(double)a3
{
  self->_size = a3;
  -[WDBrandLogoView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[WDBrandLogoView _updateStyle](self, "_updateStyle");
}

- (void)_updateStyle
{
  _BOOL8 v3;

  v3 = -[WDBrandLogoView isFallback](self, "isFallback");
  -[WDBrandLogoView intrinsicContentSize](self, "intrinsicContentSize");
  -[UIImageView applyAccountLogoStyleForIsMonogram:imageViewSize:](self, "applyAccountLogoStyleForIsMonogram:imageViewSize:", v3);
}

- (double)size
{
  return self->_size;
}

- (WDCancellationToken)cancellationToken
{
  return self->_cancellationToken;
}

- (void)setCancellationToken:(id)a3
{
  objc_storeStrong((id *)&self->_cancellationToken, a3);
}

- (BOOL)isFallback
{
  return self->_isFallback;
}

- (void)setIsFallback:(BOOL)a3
{
  self->_isFallback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationToken, 0);
}

@end

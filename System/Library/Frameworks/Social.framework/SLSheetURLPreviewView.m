@implementation SLSheetURLPreviewView

- (SLSheetURLPreviewView)init
{
  return -[SLSheetURLPreviewView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (SLSheetURLPreviewView)initWithFrame:(CGRect)a3
{
  double v3;
  double v4;
  SLSheetURLPreviewView *v5;
  SLSheetURLPreviewView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v20.receiver = self;
  v20.super_class = (Class)SLSheetURLPreviewView;
  v5 = -[SLSheetImagePreviewView initWithFrame:](&v20, sel_initWithFrame_, v3, v4, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[SLSheetImagePreviewView intrinsicContentSize](v5, "intrinsicContentSize");
    v8 = v7;
    v10 = v9;
    -[SLSheetURLPreviewView setBounds:](v6, "setBounds:", v3, v4, v7, v9);
    -[SLSheetURLPreviewView layer](v6, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBounds:", v3, v4, v8, v10);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.310000002);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetURLPreviewView setBackgroundColor:](v6, "setBackgroundColor:", v12);

    -[SLSheetURLPreviewView layer](v6, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMasksToBounds:", 1);

    v14 = objc_alloc(MEMORY[0x1E0CEA658]);
    _SLSheetURLPreviewImageFrameWithBounds();
    v15 = (void *)objc_msgSend(v14, "initWithFrame:");
    -[SLSheetImagePreviewView setImageView:](v6, "setImageView:", v15);

    -[SLSheetImagePreviewView imageView](v6, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setContentMode:", 2);

    -[SLSheetImagePreviewView imageView](v6, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClipsToBounds:", 1);

    -[SLSheetImagePreviewView imageView](v6, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetURLPreviewView addSubview:](v6, "addSubview:", v18);

    -[SLSheetURLPreviewView setNeedsLayout](v6, "setNeedsLayout");
  }
  return v6;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)SLSheetURLPreviewView;
  -[SLSheetURLPreviewView layoutSubviews](&v17, sel_layoutSubviews);
  -[SLSheetImagePreviewView intrinsicContentSize](self, "intrinsicContentSize");
  -[SLSheetURLPreviewView setBounds:](self, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v3, v4);
  -[SLSheetURLPreviewView bounds](self, "bounds");
  _SLSheetURLPreviewImageFrameWithBounds();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SLSheetImagePreviewView imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  -[SLSheetImagePreviewView imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  -[UIView setFrame:](self->_placeholderPreviewView, "setFrame:");

  -[UIView bounds](self->_placeholderPreviewView, "bounds");
  v16 = v15 * 0.222222222;
  -[UIView bounds](self->_placeholderPreviewView, "bounds");
  v19 = CGRectInset(v18, v16, v16);
  -[UIImageView setFrame:](self->_placeholderGlyphView, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
}

- (void)ensurePlaceholderPreviewImage
{
  uint64_t v2;
  id v4;
  void *v5;
  UIView *v6;
  UIView *placeholderPreviewView;
  void *v8;
  double v9;
  CGFloat v10;
  UIImageView *v11;
  UIImageView *placeholderGlyphView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGRect v17;
  CGRect v18;

  if (!self->_placeholderPreviewView)
  {
    _SLLog(v2, 7, CFSTR("SLSheetURLPreviewView ensurePlaceholderPreviewImage building placeholder"));
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SLSheetImagePreviewView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    placeholderPreviewView = self->_placeholderPreviewView;
    self->_placeholderPreviewView = v6;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.87, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_placeholderPreviewView, "setBackgroundColor:", v8);

    -[UIView bounds](self->_placeholderPreviewView, "bounds");
    v10 = v9 * 0.222222222;
    -[UIView bounds](self->_placeholderPreviewView, "bounds");
    v18 = CGRectInset(v17, v10, v10);
    v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    placeholderGlyphView = self->_placeholderGlyphView;
    self->_placeholderGlyphView = v11;

    -[UIImageView setContentMode:](self->_placeholderGlyphView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](self->_placeholderGlyphView, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_placeholderGlyphView, "setTintColor:", v13);

    objc_msgSend(MEMORY[0x1E0CEA638], "socialFrameworkImageNamed:", CFSTR("URLPlaceholderPreviewGlyph"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithRenderingMode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_placeholderGlyphView, "setImage:", v15);

    -[UIImageView image](self->_placeholderGlyphView, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v2, 7, CFSTR("SLSheetURLPreviewView ensurePlaceholderPreviewImage loaded placeholder glyph %@"));

    -[UIView addSubview:](self->_placeholderPreviewView, "addSubview:", self->_placeholderGlyphView, v16);
    -[SLSheetURLPreviewView addSubview:](self, "addSubview:", self->_placeholderPreviewView);
  }
}

- (void)setImage:(id)a3
{
  uint64_t v3;
  id v5;
  UIView *placeholderPreviewView;
  objc_super v7;

  v5 = a3;
  if (self->_placeholderPreviewView)
  {
    _SLLog(v3, 7, CFSTR("SLSheetURLPreviewView setImage: removing placeholder"));
    -[UIView removeFromSuperview](self->_placeholderPreviewView, "removeFromSuperview");
    placeholderPreviewView = self->_placeholderPreviewView;
    self->_placeholderPreviewView = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)SLSheetURLPreviewView;
  -[SLSheetImagePreviewView setImage:](&v7, sel_setImage_, v5);

}

- (BOOL)generatePreviewImageFromAttachments
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[SLSheetImagePreviewView principalAttachments](self, "principalAttachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SLSheetImagePreviewView principalAttachments](self, "principalAttachments");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v4) = objc_opt_isKindOfClass();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "payload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLSheetURLPreviewView _generateAutomaticPreviewForURL:](self, "_generateAutomaticPreviewForURL:", v7);

    }
  }
  return v4 & 1;
}

- (void)_generateAutomaticPreviewForURL:(id)a3
{
  uint64_t v3;
  id v5;
  SLURLPreviewGenerator *v6;
  SLURLPreviewGenerator *webPreviewGenerator;
  SLURLPreviewGenerator *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("SLSheetURLPreviewView _generateAutomaticPreviewForURL: %@"));
  v6 = -[SLURLPreviewGenerator initWithFrame:]([SLURLPreviewGenerator alloc], "initWithFrame:", 0.0, 0.0, 420.0, 420.0, v5);
  webPreviewGenerator = self->_webPreviewGenerator;
  self->_webPreviewGenerator = v6;

  objc_initWeak(&location, self);
  v8 = self->_webPreviewGenerator;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__SLSheetURLPreviewView__generateAutomaticPreviewForURL___block_invoke;
  v9[3] = &unk_1E7590E08;
  objc_copyWeak(&v10, &location);
  -[SLURLPreviewGenerator loadURL:completion:](v8, "loadURL:completion:", v5, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __57__SLSheetURLPreviewView__generateAutomaticPreviewForURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SLSheetURLPreviewView__generateAutomaticPreviewForURL___block_invoke_2;
  v5[3] = &unk_1E7590B88;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __57__SLSheetURLPreviewView__generateAutomaticPreviewForURL___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  _SLLog(v1, 7, CFSTR("SLSheetURLPreviewView _generateAutomaticPreviewForURL: generated web preview %@ into preview view %@"));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "setImage:", v5, WeakRetained);
      v3 = WeakRetained;
    }
    v4 = (void *)v3[56];
    v3[56] = 0;

    v3 = WeakRetained;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderGlyphView, 0);
  objc_storeStrong((id *)&self->_placeholderPreviewView, 0);
  objc_storeStrong((id *)&self->_webPreviewGenerator, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
}

@end

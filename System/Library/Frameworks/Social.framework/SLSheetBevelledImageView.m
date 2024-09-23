@implementation SLSheetBevelledImageView

- (SLSheetBevelledImageView)init
{
  SLSheetBevelledImageView *v2;
  SLSheetBevelledImageView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SLSheetBevelledImageView;
  v2 = -[SLSheetImagePreviewView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    v4 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[SLSheetBevelledImageView intrinsicContentSize](v2, "intrinsicContentSize");
    -[SLSheetBevelledImageView setBounds:](v3, "setBounds:", v4, v5, v6, v7);
    -[SLSheetBevelledImageView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShouldRasterize:", 1);

    -[SLSheetBevelledImageView layer](v3, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    objc_msgSend(v9, "setRasterizationScale:");

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetBevelledImageView setBackgroundColor:](v3, "setBackgroundColor:", v11);

    v12 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[SLSheetBevelledImageView bounds](v3, "bounds");
    v13 = (void *)objc_msgSend(v12, "initWithFrame:");
    -[SLSheetImagePreviewView setImageView:](v3, "setImageView:", v13);

    -[SLSheetImagePreviewView imageView](v3, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentMode:", 2);

    -[SLSheetImagePreviewView imageView](v3, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClipsToBounds:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetImagePreviewView imageView](v3, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

    -[SLSheetImagePreviewView imageView](v3, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutoresizingMask:", 18);

    -[SLSheetImagePreviewView imageView](v3, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetBevelledImageView addSubview:](v3, "addSubview:", v19);

    -[SLSheetBevelledImageView setNeedsLayout](v3, "setNeedsLayout");
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  v16.receiver = self;
  v16.super_class = (Class)SLSheetBevelledImageView;
  -[SLSheetImagePreviewView intrinsicContentSize](&v16, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[SLSheetImagePreviewView image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SLSheetImagePreviewView image](self, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v10 = v9;
    -[SLSheetImagePreviewView image](self, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    v13 = v10 / v12;

    if (v13 < 0.8)
      v4 = v6 * v13;
  }
  v14 = v4;
  v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
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

  if (-[SLSheetBevelledImageView needsURLPlaceholderImage](self, "needsURLPlaceholderImage"))
  {
    if (!self->_placeholderPreviewView)
    {
      _SLLog(v2, 7, CFSTR("SLSheetBevelledImageView ensurePlaceholderPreviewImage building placeholder"));
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

      -[UIView setAutoresizingMask:](self->_placeholderPreviewView, "setAutoresizingMask:", 18);
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
      _SLLog(v2, 7, CFSTR("SLSheetBevelledImageView ensurePlaceholderPreviewImage loaded placeholder glyph %@"));

      -[UIView addSubview:](self->_placeholderPreviewView, "addSubview:", self->_placeholderGlyphView, v16);
      -[SLSheetBevelledImageView addSubview:](self, "addSubview:", self->_placeholderPreviewView);
    }
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
    _SLLog(v3, 7, CFSTR("SLSheetBevelledImageView setImage: removing placeholder"));
    -[UIView removeFromSuperview](self->_placeholderPreviewView, "removeFromSuperview");
    placeholderPreviewView = self->_placeholderPreviewView;
    self->_placeholderPreviewView = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)SLSheetBevelledImageView;
  -[SLSheetImagePreviewView setImage:](&v7, sel_setImage_, v5);
  -[SLSheetBevelledImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (BOOL)generatePreviewImageFromAttachments
{
  objc_super v4;

  if (-[SLSheetBevelledImageView needsURLPlaceholderImage](self, "needsURLPlaceholderImage"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SLSheetBevelledImageView;
  return -[SLSheetImagePreviewView generatePreviewImageFromAttachments](&v4, sel_generatePreviewImageFromAttachments);
}

- (void)layoutSubviews
{
  UIView *placeholderPreviewView;
  double v4;
  CGFloat v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)SLSheetBevelledImageView;
  -[SLSheetBevelledImageView layoutSubviews](&v6, sel_layoutSubviews);
  placeholderPreviewView = self->_placeholderPreviewView;
  if (placeholderPreviewView)
  {
    -[UIView bounds](placeholderPreviewView, "bounds");
    v5 = v4 * 0.222222222;
    -[UIView bounds](self->_placeholderPreviewView, "bounds");
    v8 = CGRectInset(v7, v5, v5);
    -[UIImageView setFrame:](self->_placeholderGlyphView, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
  }
}

- (BOOL)needsURLPlaceholderImage
{
  return self->_needsURLPlaceholderImage;
}

- (void)setNeedsURLPlaceholderImage:(BOOL)a3
{
  self->_needsURLPlaceholderImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderGlyphView, 0);
  objc_storeStrong((id *)&self->_placeholderPreviewView, 0);
}

@end

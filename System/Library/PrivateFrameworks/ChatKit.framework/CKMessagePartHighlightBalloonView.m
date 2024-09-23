@implementation CKMessagePartHighlightBalloonView

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKMessagePartHighlightBalloonView;
  -[CKBalloonView prepareForReuse](&v2, sel_prepareForReuse);
}

- (CKMessagePartHighlightBalloonView)initWithFrame:(CGRect)a3
{
  CKMessagePartHighlightBalloonView *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  UIView *colorView;
  uint64_t v14;
  UIImageView *imageView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CKMessagePartHighlightBalloonView;
  v3 = -[CKBalloonView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transcriptBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagePartHighlightBalloonView setBackgroundColor:](v3, "setBackgroundColor:", v6);

    v7 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
    colorView = v3->_colorView;
    v3->_colorView = (UIView *)v12;

    -[CKMessagePartHighlightBalloonView addSubview:](v3, "addSubview:", v3->_colorView);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v8, v9, v10, v11);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v14;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v3->_imageView, "setBackgroundColor:", v16);

    -[CKMessagePartHighlightBalloonView addSubview:](v3, "addSubview:", v3->_imageView);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "messageHighlightGoldColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagePartHighlightBalloonView setBalloonColor:](v3, "setBalloonColor:", v18);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "messageHighlightImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagePartHighlightBalloonView setGlyphImage:](v3, "setGlyphImage:", v20);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double MidX;
  double MidY;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v31.receiver = self;
  v31.super_class = (Class)CKMessagePartHighlightBalloonView;
  -[CKBalloonView layoutSubviews](&v31, sel_layoutSubviews);
  -[CKMessagePartHighlightBalloonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v9 * 0.5;
  -[CKMessagePartHighlightBalloonView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v11);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageHighlightTranscriptBalloonBorderWidth");
  v15 = v14;

  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  v33 = CGRectInset(v32, v15, v15);
  -[UIView setFrame:](self->_colorView, "setFrame:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
  -[UIView frame](self->_colorView, "frame");
  v17 = v16 * 0.5;
  -[UIView layer](self->_colorView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", v17);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageHighlightGlyphSymbolPointSize");
  v21 = v20;

  v34.origin.x = v4;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  MidX = CGRectGetMidX(v34);
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  MidY = CGRectGetMidY(v35);
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.width = v21;
  v36.size.height = v21;
  v24 = MidX - CGRectGetWidth(v36) * 0.5;
  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = v21;
  v37.size.height = v21;
  v25 = MidY - CGRectGetHeight(v37) * 0.5;
  -[CKMessagePartHighlightBalloonView traitCollection](self, "traitCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "displayScale");
  v28 = round(v24 * v27) / v27;
  v29 = round(v25 * v27) / v27;
  v30 = round(v21 * v27) / v27;

  -[UIImageView setFrame:](self->_imageView, "setFrame:", v28, v29, v30, v30);
}

- (UIColor)balloonColor
{
  return -[UIView backgroundColor](self->_colorView, "backgroundColor");
}

- (void)setBalloonColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_colorView, "setBackgroundColor:", a3);
}

- (UIImage)glyphImage
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setGlyphImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void)setGlyphImageColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKMessagePartHighlightBalloonView glyphImage](self, "glyphImage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ckImageWithTintColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessagePartHighlightBalloonView setGlyphImage:](self, "setGlyphImage:", v5);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end

@implementation AVTStickerCollectionViewCell

+ (id)cellIdentifier
{
  return CFSTR("AVTStickerCollectionViewCell");
}

+ (double)imageInsetForWidth:(double)a3
{
  BOOL v3;
  double result;

  v3 = a3 <= 120.0;
  result = 5.0;
  if (!v3)
    return 20.0;
  return result;
}

+ (CGPath)selectionPathInBounds:(CGRect)a3
{
  id v3;
  CGPath *v4;
  CGRect v6;

  v6 = CGRectInset(a3, 6.0, 6.0);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 16.0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGPath *)objc_msgSend(v3, "CGPath");

  return v4;
}

- (AVTStickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double width;
  AVTStickerCollectionViewCell *v4;
  AVTStickerCollectionViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  void *v11;
  double x;
  double y;
  double v14;
  double height;
  void *v16;
  void *v17;
  void *v18;
  AVTMSStickerView *v19;
  void *v20;
  AVTMSStickerView *v21;
  void *v22;
  void *v23;
  AVTMSStickerView *stickerView;
  AVTMSStickerView *v25;
  CGSize v26;
  CAShapeLayer *v27;
  id v28;
  id v29;
  CAShapeLayer *selectionLayer;
  CAShapeLayer *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  id (*v37)(uint64_t);
  void *v38;
  id v39;
  id location;
  objc_super v41;
  CGRect v42;
  CGRect v43;

  width = a3.size.width;
  v41.receiver = self;
  v41.super_class = (Class)AVTStickerCollectionViewCell;
  v4 = -[AVTStickerCollectionViewCell initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[AVTStickerCollectionViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 12.0);

    -[AVTStickerCollectionViewCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClipsToBounds:", 1);

    objc_msgSend((id)objc_opt_class(), "imageInsetForWidth:", width);
    v10 = v9;
    -[AVTStickerCollectionViewCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v43 = CGRectInset(v42, v10, v10);
    x = v43.origin.x;
    y = v43.origin.y;
    v14 = v43.size.width;
    height = v43.size.height;

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", x, y, v14, height);
    objc_msgSend(v16, "setAlpha:", 0.0);
    objc_msgSend(v16, "setContentMode:", 1);
    objc_msgSend(v16, "setAutoresizingMask:", 18);
    +[AVTUIColorRepository stickerPlaceholderBackgroundColor](AVTUIColorRepository, "stickerPlaceholderBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTintColor:", v17);

    -[AVTStickerCollectionViewCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v16);

    objc_storeStrong((id *)&v5->_imageView, v16);
    v19 = [AVTMSStickerView alloc];
    -[AVTStickerCollectionViewCell contentView](v5, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v21 = -[AVTMSStickerView initWithFrame:](v19, "initWithFrame:");

    -[AVTMSStickerView setDelegate:](v21, "setDelegate:", v5);
    -[AVTMSStickerView setAlpha:](v21, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMSStickerView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[AVTMSStickerView setAutoresizingMask:](v21, "setAutoresizingMask:", 18);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, v5);
      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __46__AVTStickerCollectionViewCell_initWithFrame___block_invoke;
      v38 = &unk_1EA51DAC8;
      objc_copyWeak(&v39, &location);
      -[MSStickerView setDragPreviewLiftContainerProvider:](v21, "setDragPreviewLiftContainerProvider:", &v35);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    -[AVTStickerCollectionViewCell contentView](v5, "contentView", v35, v36, v37, v38);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v21);

    stickerView = v5->_stickerView;
    v5->_stickerView = v21;
    v25 = v21;

    v26 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v5->_clippingRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v5->_clippingRect.size = v26;
    v27 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGray3Color");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v27, "setStrokeColor:", objc_msgSend(v28, "CGColor"));

    -[CAShapeLayer setLineWidth:](v27, "setLineWidth:", 3.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v27, "setFillColor:", objc_msgSend(v29, "CGColor"));

    -[CAShapeLayer setHidden:](v27, "setHidden:", 1);
    selectionLayer = v5->_selectionLayer;
    v5->_selectionLayer = v27;
    v31 = v27;

    -[AVTStickerCollectionViewCell contentView](v5, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSublayer:", v31);

  }
  return v5;
}

id __46__AVTStickerCollectionViewCell_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "dragPreviewContainerForLiftingStickerInStickerCell:", WeakRetained);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)allowsPeel
{
  return -[AVTMSStickerView allowsPeel](self->_stickerView, "allowsPeel");
}

- (void)setAllowsPeel:(BOOL)a3
{
  -[AVTMSStickerView setAllowsPeel:](self->_stickerView, "setAllowsPeel:", a3);
}

- (void)setShowPrereleaseSticker:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  if (self->_showPrereleaseSticker != a3)
  {
    v3 = a3;
    self->_showPrereleaseSticker = a3;
    if (a3)
      -[AVTStickerCollectionViewCell setupPrereleaseLabelIfNeeded](self, "setupPrereleaseLabelIfNeeded");
    -[AVTStickerCollectionViewCell prereleaseLabel](self, "prereleaseLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", !v3);

  }
}

- (void)setupPrereleaseLabelIfNeeded
{
  void *v3;
  id v4;
  double v5;
  double v6;
  UILabel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *prereleaseLabel;

  -[AVTStickerCollectionViewCell prereleaseLabel](self, "prereleaseLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    -[AVTStickerCollectionViewCell bounds](self, "bounds");
    v6 = v5 + -15.0;
    -[AVTStickerCollectionViewCell bounds](self, "bounds");
    v7 = (UILabel *)objc_msgSend(v4, "initWithFrame:", 0.0, v6);
    -[UILabel setAutoresizingMask:](v7, "setAutoresizingMask:", 10);
    AVTAvatarUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STICKER_PRERELEASE"), &stru_1EA5207B8, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v9);

    -[UILabel setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
    -[UILabel setTextAlignment:](v7, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v7, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v10);

    -[AVTStickerCollectionViewCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v7);

    prereleaseLabel = self->_prereleaseLabel;
    self->_prereleaseLabel = v7;

  }
}

- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate
{
  void *v2;
  void *v3;

  -[AVTStickerCollectionViewCell stickerView](self, "stickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disclosureValidationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVTStickerDisclosureValidationDelegate *)v3;
}

- (void)setDisclosureValidationDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTStickerCollectionViewCell stickerView](self, "stickerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisclosureValidationDelegate:", v4);

}

- (void)setClippingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_clippingRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_clippingRect = &self->_clippingRect;
  if (!CGRectEqualToRect(a3, self->_clippingRect))
  {
    p_clippingRect->origin.x = x;
    p_clippingRect->origin.y = y;
    p_clippingRect->size.width = width;
    p_clippingRect->size.height = height;
    -[AVTStickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double x;
  double y;
  double width;
  double height;
  void *v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;

  v36.receiver = self;
  v36.super_class = (Class)AVTStickerCollectionViewCell;
  -[AVTStickerCollectionViewCell layoutSubviews](&v36, sel_layoutSubviews);
  -[AVTStickerCollectionViewCell stickerView](self, "stickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTStickerCollectionViewCell fullImageSize](self, "fullImageSize");
    v5 = v4;
    v7 = v6;
    -[AVTStickerCollectionViewCell clippingRect](self, "clippingRect");
    -[AVTStickerCollectionViewCell stickerViewFrameForImageSize:clippingRect:](self, "stickerViewFrameForImageSize:clippingRect:", v5, v7, v8, v9, v10, v11);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[AVTStickerCollectionViewCell stickerView](self, "stickerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGray3Color");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "CGColor");
    -[AVTStickerCollectionViewCell selectionLayer](self, "selectionLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setStrokeColor:", v22);

    v24 = (void *)objc_opt_class();
    -[AVTStickerCollectionViewCell contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v26 = objc_msgSend(v24, "selectionPathInBounds:");
    -[AVTStickerCollectionViewCell selectionLayer](self, "selectionLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPath:", v26);

    if (-[AVTStickerCollectionViewCell showSelectionLayer](self, "showSelectionLayer"))
    {
      -[AVTStickerCollectionViewCell frame](self, "frame");
      if (v28 <= 120.0)
        v29 = 10.0;
      else
        v29 = 20.0;
      -[AVTStickerCollectionViewCell contentView](self, "contentView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bounds");
      v38 = CGRectInset(v37, v29, v29);
      x = v38.origin.x;
      y = v38.origin.y;
      width = v38.size.width;
      height = v38.size.height;

      -[AVTStickerCollectionViewCell imageView](self, "imageView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setFrame:", x, y, width, height);

    }
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AVTStickerCollectionViewCell;
  -[AVTStickerCollectionViewCell setSelected:](&v6, sel_setSelected_);
  if (-[AVTStickerCollectionViewCell showSelectionLayer](self, "showSelectionLayer"))
  {
    -[AVTStickerCollectionViewCell selectionLayer](self, "selectionLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", !v3);

  }
}

- (CGRect)stickerViewFrameForImageSize:(CGSize)a3 clippingRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[AVTStickerCollectionViewCell contentView](self, "contentView", a3.width, a3.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  if (!CGRectIsEmpty(v27))
  {
    -[AVTStickerCollectionViewCell fullImageSize](self, "fullImageSize");
    if (v19 != *MEMORY[0x1E0C9D820] || v18 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[AVTStickerCollectionViewCell fullImageSize](self, "fullImageSize");
      v11 = -(x * (v15 / width));
      v13 = -(y * (v17 / height));
      v15 = v15 / width * v21;
      v17 = v17 / height * v22;
    }
  }
  v23 = v11;
  v24 = v13;
  v25 = v15;
  v26 = v17;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGSize)imageSizeFromURL:(id)a3
{
  CGImageSource *v3;
  CGImageSource *v4;
  CFDictionaryRef v5;
  uint64_t v6;
  const __CFDictionary *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v3 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v3 && (v4 = v3, v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0), CFRelease(v4), v5))
  {
    v6 = *MEMORY[0x1E0CBD040];
    v7 = v5;
    -[__CFDictionary valueForKey:](v7, "valueForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    -[__CFDictionary valueForKey:](v7, "valueForKey:", *MEMORY[0x1E0CBD048]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    CFRelease(v7);
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v14 = v13;
  v15 = v10;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)updateWithImage:(id)a3 sticker:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  _QWORD v27[5];
  _QWORD v28[5];
  BOOL v29;
  BOOL v30;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    -[AVTStickerCollectionViewCell stickerView](self, "stickerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sticker");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v9)
      goto LABEL_12;
    -[AVTStickerCollectionViewCell layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllAnimations");

    if (v8)
    {
      objc_msgSend(v8, "size");
      v14 = v13;
      objc_msgSend(v8, "scale");
      v16 = v14 * v15;
      objc_msgSend(v8, "size");
      v18 = v17;
      objc_msgSend(v8, "scale");
      -[AVTStickerCollectionViewCell setFullImageSize:](self, "setFullImageSize:", v16, v18 * v19);
    }
    else
    {
      objc_msgSend(v9, "imageFileURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTStickerCollectionViewCell imageSizeFromURL:](self, "imageSizeFromURL:", v22);
      -[AVTStickerCollectionViewCell setFullImageSize:](self, "setFullImageSize:");

    }
    -[AVTStickerCollectionViewCell stickerView](self, "stickerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 0);

    -[AVTStickerCollectionViewCell stickerView](self, "stickerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSticker:", v9);

    -[AVTStickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[AVTStickerCollectionViewCell layer](self, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeAllAnimations");

    if (v8)
    {
      -[AVTStickerCollectionViewCell imageView](self, "imageView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setImage:", v8);

    }
  }
  v25 = -[AVTStickerCollectionViewCell stickerViewIsAnimating](self, "stickerViewIsAnimating") | v5;
  -[AVTStickerCollectionViewCell setStickerViewIsAnimating:](self, "setStickerViewIsAnimating:", v25);
  v26 = 0.3;
  if (!(_DWORD)v25)
    v26 = 0.0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __65__AVTStickerCollectionViewCell_updateWithImage_sticker_animated___block_invoke;
  v28[3] = &unk_1EA51DAF0;
  v28[4] = self;
  v29 = v9 != 0;
  v30 = v8 != 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __65__AVTStickerCollectionViewCell_updateWithImage_sticker_animated___block_invoke_2;
  v27[3] = &unk_1EA51D250;
  v27[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v28, v27, v26);
LABEL_12:

}

void __65__AVTStickerCollectionViewCell_updateWithImage_sticker_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  v2 = 0.0;
  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "stickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  if (!*(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 41))
      v2 = 1.0;
    else
      v2 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v2);

}

void __65__AVTStickerCollectionViewCell_updateWithImage_sticker_animated___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  double v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setStickerViewIsAnimating:", 0);
    objc_msgSend(*(id *)(a1 + 32), "stickerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alpha");
    v5 = v4 == 0.0;
    objc_msgSend(*(id *)(a1 + 32), "stickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v5);

    objc_msgSend(*(id *)(a1 + 32), "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alpha");
    v9 = v8;

    if (v9 == 0.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHidden:", 1);

      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImage:", 0);

    }
  }
}

- (void)purgeImageContents
{
  void *v3;
  id v4;

  -[AVTStickerCollectionViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[AVTStickerCollectionViewCell stickerView](self, "stickerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSticker:", 0);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTStickerCollectionViewCell;
  -[AVTStickerCollectionViewCell prepareForReuse](&v9, sel_prepareForReuse);
  -[AVTStickerCollectionViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[AVTStickerCollectionViewCell imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

  -[AVTStickerCollectionViewCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  -[AVTStickerCollectionViewCell setClippingRect:](self, "setClippingRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AVTStickerCollectionViewCell setFullImageSize:](self, "setFullImageSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[AVTStickerCollectionViewCell stickerView](self, "stickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSticker:", 0);

  -[AVTStickerCollectionViewCell stickerView](self, "stickerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[AVTStickerCollectionViewCell stickerView](self, "stickerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

}

- (void)stickerViewDidBeginPeel:(id)a3
{
  void *v4;
  id v5;

  -[AVTStickerCollectionViewCell delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVTStickerCollectionViewCell delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stickerCellDidPeelSticker:", self);

  }
}

- (void)stickerViewWasTapped:(id)a3
{
  void *v4;
  id v5;

  -[AVTStickerCollectionViewCell delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVTStickerCollectionViewCell delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stickerCellDidTapSticker:", self);

  }
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_displaySessionUUID, a3);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)showPrereleaseSticker
{
  return self->_showPrereleaseSticker;
}

- (BOOL)showSelectionLayer
{
  return self->_showSelectionLayer;
}

- (void)setShowSelectionLayer:(BOOL)a3
{
  self->_showSelectionLayer = a3;
}

- (AVTStickerCollectionViewCellDelegate)delegate
{
  return (AVTStickerCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (AVTMSStickerView)stickerView
{
  return self->_stickerView;
}

- (UILabel)prereleaseLabel
{
  return self->_prereleaseLabel;
}

- (BOOL)stickerViewIsAnimating
{
  return self->_stickerViewIsAnimating;
}

- (void)setStickerViewIsAnimating:(BOOL)a3
{
  self->_stickerViewIsAnimating = a3;
}

- (CGSize)fullImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fullImageSize.width;
  height = self->_fullImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFullImageSize:(CGSize)a3
{
  self->_fullImageSize = a3;
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_prereleaseLabel, 0);
  objc_storeStrong((id *)&self->_stickerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
}

@end

@implementation _NTKCFaceDetailCollectionCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (double)outlineLineWidth
{
  uint64_t v2;
  double result;

  v2 = NTKCScreenStyle();
  result = 2.66666667;
  if (v2 != 1)
    return 2.5;
  return result;
}

- (_NTKCFaceDetailCollectionCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  _NTKCFaceDetailCollectionCell *v5;
  uint64_t v6;
  UIImageView *imageView;
  void *v8;
  uint64_t v9;
  CAShapeLayer *outlineView;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIView *disabledDimmingView;
  void *v17;
  void *v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  v20.receiver = self;
  v20.super_class = (Class)_NTKCFaceDetailCollectionCell;
  v5 = -[_NTKCFaceDetailCollectionCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = objc_opt_new();
    imageView = v5->_imageView;
    v5->_imageView = (UIImageView *)v6;

    -[UIImageView setContentMode:](v5->_imageView, "setContentMode:", 1);
    -[_NTKCFaceDetailCollectionCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v5->_imageView);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v9 = objc_claimAutoreleasedReturnValue();
    outlineView = v5->_outlineView;
    v5->_outlineView = (CAShapeLayer *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v5->_outlineView, "setFillColor:", objc_msgSend(v11, "CGColor"));

    NTKCOutlineColor(1);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v5->_outlineView, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

    objc_msgSend((id)objc_opt_class(), "outlineLineWidth");
    -[CAShapeLayer setLineWidth:](v5->_outlineView, "setLineWidth:");
    -[CAShapeLayer setHidden:](v5->_outlineView, "setHidden:", 1);
    -[_NTKCFaceDetailCollectionCell contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v5->_outlineView);

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, width, height);
    disabledDimmingView = v5->_disabledDimmingView;
    v5->_disabledDimmingView = (UIView *)v15;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_disabledDimmingView, "setBackgroundColor:", v17);

    -[UIView setAlpha:](v5->_disabledDimmingView, "setAlpha:", 0.0);
    -[_NTKCFaceDetailCollectionCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v5->_disabledDimmingView);

  }
  return v5;
}

- (void)setSwatchFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_swatchFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_swatchFrame = &self->_swatchFrame;
  if (!CGRectEqualToRect(a3, self->_swatchFrame))
  {
    p_swatchFrame->origin.x = x;
    p_swatchFrame->origin.y = y;
    p_swatchFrame->size.width = width;
    p_swatchFrame->size.height = height;
    -[_NTKCFaceDetailCollectionCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOutlineOutset:(double)a3
{
  double v3;

  v3 = a3 - self->_outlineOutset;
  if (v3 < 0.0)
    v3 = -v3;
  if (v3 > 0.00000011920929)
  {
    self->_outlineOutset = a3;
    -[_NTKCFaceDetailCollectionCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void)setSwatchImageContentMode:(int64_t)a3
{
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", a3);
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _NTKCFaceDetailCollectionCellLabel *label;
  _NTKCFaceDetailCollectionCellLabel *v8;
  _NTKCFaceDetailCollectionCellLabel *v9;
  void *v10;
  _NTKCFaceDetailCollectionCellLabel *v11;
  id v12;

  v12 = a3;
  -[_NTKCFaceDetailCollectionCellLabel text](self->_label, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v4 != v12)
  {
    v6 = objc_msgSend(v12, "length");
    label = self->_label;
    if (v6)
    {
      if (!label)
      {
        v8 = (_NTKCFaceDetailCollectionCellLabel *)objc_opt_new();
        v9 = self->_label;
        self->_label = v8;

        -[_NTKCFaceDetailCollectionCellLabel setUsesShortTextWidth:](self->_label, "setUsesShortTextWidth:", CGRectGetWidth(self->_swatchFrame) < 90.0);
        -[_NTKCFaceDetailCollectionCell contentView](self, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "insertSubview:belowSubview:", self->_label, self->_disabledDimmingView);

        label = self->_label;
      }
      -[_NTKCFaceDetailCollectionCellLabel setText:](label, "setText:", v12);
      goto LABEL_8;
    }
    v5 = v12;
    if (label)
    {
      -[_NTKCFaceDetailCollectionCellLabel removeFromSuperview](label, "removeFromSuperview");
      v11 = self->_label;
      self->_label = 0;

LABEL_8:
      -[_NTKCFaceDetailCollectionCell setNeedsLayout](self, "setNeedsLayout");
      v5 = v12;
    }
  }

}

- (void)setStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double Height;
  void *v17;
  UIImageView *imageView;
  CGRect v19;

  if (self->_style != a3)
  {
    self->_style = a3;
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "deviceCategory");

    v6 = 0.0;
    if (v5 == 2)
    {
      v7 = self->_style - 2;
      if (v7 <= 2)
        v6 = dbl_1B755D8D8[v7];
    }
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "deviceCategory");

    if (v9 == 3)
    {
      v10 = self->_style - 2;
      if (v10 <= 2)
        v6 = dbl_1B755D8F0[v10];
    }
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "deviceCategory");

    if (v12 >= 4 && (unint64_t)(self->_style - 2) <= 2)
    {
      objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "screenCornerRadius");
      v15 = v14;
      Height = CGRectGetHeight(self->_swatchFrame);
      objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "screenBounds");
      v6 = v15 * (Height / CGRectGetHeight(v19));

    }
    imageView = self->_imageView;
    if (v6 == 0.0)
      -[UIImageView _setCornerRadius:](imageView, "_setCornerRadius:", 0.0);
    else
      -[UIImageView _setContinuousCornerRadius:](imageView, "_setContinuousCornerRadius:", v6);
    -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", v6 != 0.0);
  }
}

- (void)layoutSubviews
{
  double outlineOutset;
  double v4;
  double v5;
  CGRect *p_swatchFrame;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double x;
  double y;
  double width;
  double height;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  double *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  _NTKCFaceDetailCollectionCellLabel *label;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double MaxY;
  double v53;
  double v54;
  double v55;
  CGFloat rect;
  CGFloat v57;
  CGFloat v58;
  objc_super v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v59.receiver = self;
  v59.super_class = (Class)_NTKCFaceDetailCollectionCell;
  -[_NTKCFaceDetailCollectionCell layoutSubviews](&v59, sel_layoutSubviews);
  outlineOutset = self->_outlineOutset;
  -[CAShapeLayer lineWidth](self->_outlineView, "lineWidth");
  v5 = outlineOutset + v4;
  -[CAShapeLayer frame](self->_outlineView, "frame");
  p_swatchFrame = &self->_swatchFrame;
  v7 = CGRectGetMinX(self->_swatchFrame) - v5;
  v8 = CGRectGetWidth(self->_swatchFrame) + v5 * 2.0;
  v9 = CGRectGetMinY(self->_swatchFrame) - v5;
  v10 = CGRectGetHeight(self->_swatchFrame) + v5 * 2.0;
  v57 = v8;
  v58 = v7;
  rect = v9;
  -[CAShapeLayer setFrame:](self->_outlineView, "setFrame:", v7, v9, v8, v10);
  -[CAShapeLayer bounds](self->_outlineView, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CAShapeLayer lineWidth](self->_outlineView, "lineWidth");
  v20 = v19 * 0.5;
  -[CAShapeLayer lineWidth](self->_outlineView, "lineWidth");
  v22 = v21 * 0.5;
  v60.origin.x = v12;
  v60.origin.y = v14;
  v60.size.width = v16;
  v60.size.height = v18;
  v61 = CGRectInset(v60, v20, v22);
  x = v61.origin.x;
  y = v61.origin.y;
  width = v61.size.width;
  height = v61.size.height;
  if (self->_style <= 1uLL)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v61.origin.x, v61.origin.y, v61.size.width, v61.size.height);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "deviceCategory");

  if (v29 == 2)
  {
    v30 = self->_style - 2;
    v31 = 6.0;
    if (v30 < 3)
    {
      v32 = (double *)&unk_1B755D908;
LABEL_9:
      v31 = v32[v30];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "deviceCategory");

    if (v34 != 3)
    {
      objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "deviceCategory");

      v31 = 6.0;
      if (v36 >= 4 && (unint64_t)(self->_style - 2) <= 2)
      {
        objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "screenCornerRadius");
        v39 = v38;
        v62.origin.x = p_swatchFrame->origin.x;
        v62.origin.y = self->_swatchFrame.origin.y;
        v62.size.width = self->_swatchFrame.size.width;
        v62.size.height = self->_swatchFrame.size.height;
        v40 = CGRectGetHeight(v62);
        objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "screenBounds");
        v42 = v39 * (v40 / CGRectGetHeight(v63));

        -[CAShapeLayer lineWidth](self->_outlineView, "lineWidth");
        v31 = v42 + v5 + v43 * -0.5;
      }
      goto LABEL_13;
    }
    v30 = self->_style - 2;
    v31 = 6.0;
    if (v30 < 3)
    {
      v32 = (double *)&unk_1B755D920;
      goto LABEL_9;
    }
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v44 = objc_retainAutorelease(v27);
  -[CAShapeLayer setPath:](self->_outlineView, "setPath:", objc_msgSend(v44, "CGPath"));
  -[UIImageView setFrame:](self->_imageView, "setFrame:", p_swatchFrame->origin.x, self->_swatchFrame.origin.y, self->_swatchFrame.size.width, self->_swatchFrame.size.height);
  label = self->_label;
  if (label)
  {
    -[_NTKCFaceDetailCollectionCellLabel frame](label, "frame");
    UIRectCenteredXInRectScale();
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v64.size.width = v57;
    v64.origin.x = v58;
    v64.origin.y = rect;
    v64.size.height = v10;
    MaxY = CGRectGetMaxY(v64);
    v53 = 18.0;
    if (!self->_active)
      v53 = 14.0;
    v54 = MaxY + v53;
    -[_NTKCFaceDetailCollectionCellLabel firstLineBaseline](self->_label, "firstLineBaseline", 0);
    -[_NTKCFaceDetailCollectionCellLabel setFrame:](self->_label, "setFrame:", v47, v54 - v55, v49, v51);
  }
  -[_NTKCFaceDetailCollectionCell bounds](self, "bounds");
  -[UIView setFrame:](self->_disabledDimmingView, "setFrame:");

}

- (void)setDisabled:(BOOL)a3
{
  -[_NTKCFaceDetailCollectionCell setDisabled:animated:](self, "setDisabled:animated:", a3, 1);
}

- (void)setDisabled:(BOOL)a3 animated:(BOOL)a4
{
  double v5;

  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    if (a3)
    {
      -[_NTKCFaceDetailCollectionCell setActive:](self, "setActive:", 0, a4);
      v5 = 0.75;
    }
    else
    {
      -[_NTKCFaceDetailCollectionCell setActive:animated:forced:](self, "setActive:animated:forced:", self->_active, 1, 1);
      v5 = 0.0;
    }
    -[UIView setAlpha:](self->_disabledDimmingView, "setAlpha:", v5);
  }
}

- (void)setActive:(BOOL)a3
{
  -[_NTKCFaceDetailCollectionCell setActive:animated:](self, "setActive:animated:", a3, 1);
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  -[_NTKCFaceDetailCollectionCell setActive:animated:forced:](self, "setActive:animated:forced:", a3, a4, 0);
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4 forced:(BOOL)a5
{
  if (self->_active != a3 || a5)
  {
    self->_active = a3;
    if (!self->_disabled || !a3)
    {
      if (!a4)
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
        *(_DWORD *)&a3 = self->_active;
      }
      -[CAShapeLayer setHidden:](self->_outlineView, "setHidden:", !a3);
      -[_NTKCFaceDetailCollectionCellLabel setActive:](self->_label, "setActive:", self->_active);
      if (!a4)
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      -[_NTKCFaceDetailCollectionCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (BOOL)is3Lines
{
  return -[_NTKCFaceDetailCollectionCellLabel is3Lines](self->_label, "is3Lines");
}

- (CGRect)swatchFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_swatchFrame.origin.x;
  y = self->_swatchFrame.origin.y;
  width = self->_swatchFrame.size.width;
  height = self->_swatchFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)outlineOutset
{
  return self->_outlineOutset;
}

- (int64_t)swatchImageContentMode
{
  return self->_swatchImageContentMode;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_disabledDimmingView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_outlineView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end

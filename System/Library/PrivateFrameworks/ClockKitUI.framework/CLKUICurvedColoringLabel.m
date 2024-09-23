@implementation CLKUICurvedColoringLabel

- (CLKUICurvedColoringLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CLKUICurvedColoringLabel *v7;
  CLKUICurvedLabel *v8;
  CLKUICurvedLabel *curvedLabel;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CLKUICurvedColoringLabel;
  v7 = -[CLKUIColoringLabel initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[CLKUICurvedLabel initWithFrame:]([CLKUICurvedLabel alloc], "initWithFrame:", x, y, width, height);
    curvedLabel = v7->_curvedLabel;
    v7->_curvedLabel = v8;

    -[CLKUICurvedColoringLabel addSubview:](v7, "addSubview:", v7->_curvedLabel);
    -[CLKUIColoringLabel setUsesTextProviderSize:](v7, "setUsesTextProviderSize:", 0);
  }
  return v7;
}

- (double)_lastLineBaseline
{
  double result;

  -[CLKUICurvedLabel _lastLineBaseline](self->_curvedLabel, "_lastLineBaseline");
  return result;
}

- (double)_firstLineBaseline
{
  double result;

  -[CLKUICurvedLabel _firstLineBaseline](self->_curvedLabel, "_firstLineBaseline");
  return result;
}

- (void)setInterior:(BOOL)a3
{
  -[CLKUICurvedLabel setInterior:](self->_curvedLabel, "setInterior:", a3);
}

- (BOOL)interior
{
  return -[CLKUICurvedLabel interior](self->_curvedLabel, "interior");
}

- (void)setCircleRadius:(double)a3
{
  objc_super v4;

  -[CLKUICurvedLabel setCircleRadius:](self->_curvedLabel, "setCircleRadius:", a3);
  -[CLKUICurvedLabel maxLinearTextWidth](self->_curvedLabel, "maxLinearTextWidth");
  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v4, sel_setMaxWidth_);
}

- (double)circleRadius
{
  double result;

  -[CLKUICurvedLabel circleRadius](self->_curvedLabel, "circleRadius");
  return result;
}

- (void)setCenterAngle:(double)a3
{
  -[CLKUICurvedLabel setCenterAngle:](self->_curvedLabel, "setCenterAngle:", a3);
}

- (double)centerAngle
{
  double result;

  -[CLKUICurvedLabel centerAngle](self->_curvedLabel, "centerAngle");
  return result;
}

- (void)setPath:(id)a3
{
  id v5;
  objc_super v6;

  objc_storeStrong((id *)&self->_path, a3);
  v5 = a3;
  -[CLKUICurvedLabel setPath:](self->_curvedLabel, "setPath:", v5);
  -[CLKUICurvedLabel maxLinearTextWidth](self->_curvedLabel, "maxLinearTextWidth");
  v6.receiver = self;
  v6.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v6, sel_setMaxWidth_);

}

- (void)setUsesTextProviderTintColoring:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CLKUICurvedLabel attributedTextProvidesColor](self->_curvedLabel, "attributedTextProvidesColor") != a3)
  {
    -[CLKUICurvedLabel setAttributedTextProvidesColor:](self->_curvedLabel, "setAttributedTextProvidesColor:", v3);
    v5.receiver = self;
    v5.super_class = (Class)CLKUICurvedColoringLabel;
    -[CLKUIColoringLabel setUsesTextProviderTintColoring:](&v5, sel_setUsesTextProviderTintColoring_, v3);
  }
}

- (BOOL)textDefinesTruncation
{
  return 1;
}

- (BOOL)isTextTruncated
{
  return -[CLKUICurvedLabel isTextTruncated](self->_curvedLabel, "isTextTruncated");
}

- (double)maxWidth
{
  double result;

  -[CLKUICurvedLabel maxLinearWidth](self->_curvedLabel, "maxLinearWidth");
  return result;
}

- (void)setMaxAngularWidth:(double)a3
{
  objc_super v4;

  -[CLKUICurvedLabel setMaxAngularWidth:](self->_curvedLabel, "setMaxAngularWidth:", a3);
  -[CLKUICurvedLabel maxLinearTextWidth](self->_curvedLabel, "maxLinearTextWidth");
  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v4, sel_setMaxWidth_);
}

- (double)maxAngularWidth
{
  double result;

  -[CLKUICurvedLabel maxAngularWidth](self->_curvedLabel, "maxAngularWidth");
  return result;
}

- (void)setTextColor:(id)a3
{
  -[CLKUICurvedLabel setTextColor:](self->_curvedLabel, "setTextColor:", a3);
}

- (id)textColor
{
  return -[CLKUICurvedLabel textColor](self->_curvedLabel, "textColor");
}

- (void)setAlpha:(double)a3
{
  -[CLKUICurvedLabel setAlpha:](self->_curvedLabel, "setAlpha:", a3);
}

- (double)alpha
{
  double result;

  -[CLKUICurvedLabel alpha](self->_curvedLabel, "alpha");
  return result;
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[CLKUICurvedLabel setNumberOfLines:](self->_curvedLabel, "setNumberOfLines:", a3);
}

- (int64_t)numberOfLines
{
  return -[CLKUICurvedLabel numberOfLines](self->_curvedLabel, "numberOfLines");
}

- (void)setAttributedText:(id)a3
{
  -[CLKUICurvedLabel setAttributedText:](self->_curvedLabel, "setAttributedText:", a3);
}

- (id)attributedText
{
  return -[CLKUICurvedLabel attributedText](self->_curvedLabel, "attributedText");
}

- (void)setText:(id)a3
{
  -[CLKUICurvedLabel setText:](self->_curvedLabel, "setText:", a3);
}

- (id)text
{
  return -[CLKUICurvedLabel text](self->_curvedLabel, "text");
}

- (void)setFont:(id)a3
{
  CLKUICurvedLabel *curvedLabel;
  id v5;
  objc_super v6;

  curvedLabel = self->_curvedLabel;
  v5 = a3;
  -[CLKUICurvedLabel setFont:](curvedLabel, "setFont:", v5);
  v6.receiver = self;
  v6.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setFont:](&v6, sel_setFont_, v5);

}

- (id)font
{
  return -[CLKUICurvedLabel font](self->_curvedLabel, "font");
}

- (void)setTextProviderFont:(id)a3
{
  -[CLKUICurvedColoringLabel setFont:](self, "setFont:", a3);
  -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
}

- (void)setTracking:(double)a3
{
  objc_super v5;

  -[CLKUICurvedLabel setTracking:](self->_curvedLabel, "setTracking:");
  v5.receiver = self;
  v5.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setTracking:](&v5, sel_setTracking_, a3);
}

- (void)setBaselineOffset:(double)a3
{
  -[CLKUICurvedLabel setBaselineOffset:](self->_curvedLabel, "setBaselineOffset:");
  if (self->_baselineOffset != a3)
  {
    self->_baselineOffset = a3;
    -[CLKUIColoringLabel _requeryTextProviderAndNotify:](self, "_requeryTextProviderAndNotify:", 0);
  }
}

- (void)setImagePlacement:(unint64_t)a3
{
  -[CLKUICurvedLabel setImagePlacement:](self->_curvedLabel, "setImagePlacement:", a3);
}

- (unint64_t)imagePlacement
{
  return -[CLKUICurvedLabel imagePlacement](self->_curvedLabel, "imagePlacement");
}

- (void)setImagePadding:(double)a3
{
  objc_super v4;

  -[CLKUICurvedLabel setImagePadding:](self->_curvedLabel, "setImagePadding:", a3);
  -[CLKUICurvedLabel maxLinearTextWidth](self->_curvedLabel, "maxLinearTextWidth");
  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v4, sel_setMaxWidth_);
}

- (double)imagePadding
{
  double result;

  -[CLKUICurvedLabel imagePadding](self->_curvedLabel, "imagePadding");
  return result;
}

- (void)setImageView:(id)a3
{
  objc_super v4;

  -[CLKUICurvedLabel setImageView:](self->_curvedLabel, "setImageView:", a3);
  -[CLKUICurvedLabel maxLinearTextWidth](self->_curvedLabel, "maxLinearTextWidth");
  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v4, sel_setMaxWidth_);
}

- (UIView)imageView
{
  return -[CLKUICurvedLabel imageView](self->_curvedLabel, "imageView");
}

- (void)setImageView:(id)a3 placement:(unint64_t)a4 padding:(double)a5
{
  objc_super v6;

  -[CLKUICurvedLabel setImageView:placement:padding:](self->_curvedLabel, "setImageView:placement:padding:", a3, a4, a5);
  -[CLKUICurvedLabel maxLinearTextWidth](self->_curvedLabel, "maxLinearTextWidth");
  v6.receiver = self;
  v6.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v6, sel_setMaxWidth_);
}

- (void)invalidateCachedSize
{
  objc_super v3;

  -[CLKUICurvedLabel invalidateCachedSize](self->_curvedLabel, "invalidateCachedSize");
  v3.receiver = self;
  v3.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel invalidateCachedSize](&v3, sel_invalidateCachedSize);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CLKUICurvedColoringLabel invalidateCachedSize](self, "invalidateCachedSize");
}

- (void)layoutSubviews
{
  -[CLKUICurvedColoringLabel bounds](self, "bounds");
  -[CLKUICurvedLabel setFrame:](self->_curvedLabel, "setFrame:");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CLKUICurvedColoringLabel frame](self, "frame");
  if ((CLKRectEqualsRect() & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)CLKUICurvedColoringLabel;
    -[CLKUICurvedColoringLabel setFrame:](&v8, sel_setFrame_, x, y, width, height);
    -[CLKUICurvedColoringLabel setNeedsLayout](self, "setNeedsLayout");
    -[CLKUICurvedColoringLabel layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CLKUICurvedColoringLabel bounds](self, "bounds");
  if ((CLKRectEqualsRect() & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)CLKUICurvedColoringLabel;
    -[CLKUIColoringLabel setBounds:](&v8, sel_setBounds_, x, y, width, height);
    -[CLKUICurvedColoringLabel setNeedsLayout](self, "setNeedsLayout");
    -[CLKUICurvedColoringLabel layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  -[CLKUICurvedLabel setTextAlignment:](self->_curvedLabel, "setTextAlignment:");
}

- (void)sizeToFit
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGAffineTransform v19;

  -[CLKUICurvedColoringLabel transform](self, "transform");
  if (CGAffineTransformIsIdentity(&v19))
  {
    -[CLKUICurvedColoringLabel frame](self, "frame");
    v4 = v3;
    v6 = v5;
    -[CLKUICurvedColoringLabel sizeThatFits:](self, "sizeThatFits:", v7, v8);
    -[CLKUICurvedColoringLabel setFrame:](self, "setFrame:", v4, v6, v9, v10);
  }
  else
  {
    -[CLKUICurvedColoringLabel bounds](self, "bounds");
    v12 = v11;
    v14 = v13;
    -[CLKUICurvedColoringLabel sizeThatFits:](self, "sizeThatFits:", v15, v16);
    -[CLKUICurvedColoringLabel setBounds:](self, "setBounds:", v12, v14, v17, v18);
  }
  -[CLKUICurvedColoringLabel setNeedsLayout](self, "setNeedsLayout");
  -[CLKUICurvedColoringLabel layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[CLKUICurvedLabel sizeThatFits:](self->_curvedLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)textBoundingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CLKUICurvedLabel textBoundingRect](self->_curvedLabel, "textBoundingRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)getTextCenter:(CGPoint *)a3 startAngle:(double *)a4 endAngle:(double *)a5
{
  -[CLKUICurvedLabel getTextCenter:startAngle:endAngle:](self->_curvedLabel, "getTextCenter:startAngle:endAngle:", a3, a4, a5);
}

- (void)_setUpSnapshot
{
  __int128 v3;
  UIView *v4;
  UIView *snapshot;
  _OWORD v6[3];
  _OWORD v7[3];
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  -[CLKUICurvedColoringLabel transform](self, "transform");
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[CLKUICurvedColoringLabel setTransform:](self, "setTransform:", v8);
  -[CLKUICurvedColoringLabel snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", 0);
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  snapshot = self->super._snapshot;
  self->super._snapshot = v4;

  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  -[CLKUICurvedColoringLabel setTransform:](self, "setTransform:", v7);
  v6[0] = v9;
  v6[1] = v10;
  v6[2] = v11;
  -[UIView setTransform:](self->super._snapshot, "setTransform:", v6);
}

- (void)_setAnimationAlpha:(double)a3
{
  -[CLKUICurvedLabel setAnimationAlpha:](self->_curvedLabel, "setAnimationAlpha:", a3);
}

- (void)setImageViewOverrideSize:(CGSize)a3
{
  -[CLKUICurvedLabel setImageViewOverrideSize:](self->_curvedLabel, "setImageViewOverrideSize:", a3.width, a3.height);
}

- (CGSize)imageViewOverrideSize
{
  double v2;
  double v3;
  CGSize result;

  -[CLKUICurvedLabel imageViewOverrideSize](self->_curvedLabel, "imageViewOverrideSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)transformForImage
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->_curvedLabel;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transformForImage](result, "transformForImage");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (CGPoint)centerForImage
{
  double v2;
  double v3;
  CGPoint result;

  -[CLKUICurvedLabel centerForImage](self->_curvedLabel, "centerForImage");
  result.y = v3;
  result.x = v2;
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_curvedLabel, 0);
}

@end

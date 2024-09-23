@implementation _PKColorPickerCrosshairCornerMaskView

- (_PKColorPickerCrosshairCornerMaskView)initWithFrame:(CGRect)a3
{
  _PKColorPickerCrosshairCornerMaskView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PKColorPickerCrosshairCornerMaskView;
  result = -[_PKColorPickerCrosshairCornerMaskView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result->_cornerPosition = 0;
  result->_excludeCorner = 0;
  return result;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PKColorPickerCrosshairCornerMaskView;
  -[_PKColorPickerCrosshairCornerMaskView layoutSubviews](&v5, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorPickerCrosshairCornerMaskView _setFillColor:](self, "_setFillColor:", v3);

  -[_PKColorPickerCrosshairCornerMaskView maskPath](self, "maskPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorPickerCrosshairCornerMaskView _setPath:](self, "_setPath:", v4);

}

- (void)setCornerPosition:(unint64_t)a3
{
  self->_cornerPosition = a3;
  -[_PKColorPickerCrosshairCornerMaskView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setExcludeCorner:(BOOL)a3
{
  self->_excludeCorner = a3;
  -[_PKColorPickerCrosshairCornerMaskView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[_PKColorPickerCrosshairCornerMaskView _shapeLayer](self, "_shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGPath");

  objc_msgSend(v7, "setPath:", v6);
}

- (void)_setFillColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[_PKColorPickerCrosshairCornerMaskView _shapeLayer](self, "_shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setFillColor:", v6);
}

- (id)maskPath
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double a;
  double v13;
  double MidY;
  double MidX;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double b;
  CGAffineTransform v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[_PKColorPickerCrosshairCornerMaskView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[_PKColorPickerCrosshairCornerMaskView cornerPosition](self, "cornerPosition"))
  {
    CGAffineTransformMakeScale(&v25, 0.5, 0.5);
    v11 = v10 * v25.c;
    a = v25.a;
    b = v25.b;
    v13 = v10 * v25.d;
    if (-[_PKColorPickerCrosshairCornerMaskView cornerPosition](self, "cornerPosition") == 3
      || -[_PKColorPickerCrosshairCornerMaskView cornerPosition](self, "cornerPosition") == 4)
    {
      v26.origin.x = v4;
      v26.origin.y = v6;
      v26.size.width = v8;
      v26.size.height = v10;
      MidY = CGRectGetMidY(v26);
    }
    else
    {
      v27.origin.x = v4;
      v27.origin.y = v6;
      v27.size.width = v8;
      v27.size.height = v10;
      MidY = CGRectGetMinY(v27);
    }
    v16 = MidY;
    v17 = v11 + a * v8;
    v18 = v13 + b * v8;
    if (-[_PKColorPickerCrosshairCornerMaskView cornerPosition](self, "cornerPosition") == 2
      || -[_PKColorPickerCrosshairCornerMaskView cornerPosition](self, "cornerPosition") == 4)
    {
      v28.origin.x = v4;
      v28.origin.y = v6;
      v28.size.width = v8;
      v28.size.height = v10;
      MidX = CGRectGetMidX(v28);
    }
    else
    {
      v29.origin.x = v4;
      v29.origin.y = v6;
      v29.size.width = v8;
      v29.size.height = v10;
      MidX = CGRectGetMinX(v29);
    }
  }
  else
  {
    MidX = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", MidX, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_PKColorPickerCrosshairCornerMaskView excludeCorner](self, "excludeCorner"))
  {
    v20 = (void *)MEMORY[0x1E0DC3508];
    -[_PKColorPickerCrosshairCornerMaskView bounds](self, "bounds");
    objc_msgSend(v20, "bezierPathWithRect:");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bezierPathByReversingPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendPath:", v22);

  }
  else
  {
    v21 = v19;
  }

  return v21;
}

- (unint64_t)cornerPosition
{
  return self->_cornerPosition;
}

- (BOOL)excludeCorner
{
  return self->_excludeCorner;
}

@end

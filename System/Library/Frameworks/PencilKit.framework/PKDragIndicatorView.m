@implementation PKDragIndicatorView

- (PKDragIndicatorView)init
{
  PKDragIndicatorView *v2;
  PKDragIndicatorView *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDragIndicatorView;
  v2 = -[PKDragIndicatorView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    v2->_scalingFactor = 1.0;
    v4 = *MEMORY[0x1E0CD2A68];
    -[PKDragIndicatorView layer](v2, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", v4);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKDragIndicatorView;
  -[PKDragIndicatorView layoutSubviews](&v10, sel_layoutSubviews);
  -[PKDragIndicatorView bounds](self, "bounds");
  v4 = v3;
  -[PKDragIndicatorView bounds](self, "bounds");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6 * 0.5;
  -[PKDragIndicatorView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "pk_paletteButtonBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDragIndicatorView setBackgroundColor:](self, "setBackgroundColor:", v9);

}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKDragIndicatorView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setScalingFactor:(double)a3
{
  if (self->_scalingFactor != a3)
  {
    self->_scalingFactor = a3;
    -[PKDragIndicatorView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
{
  unint64_t v3;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = -[PKDragIndicatorView edgeLocation](self, "edgeLocation");
  v5 = v3 == 2 || v3 == 8;
  v6 = PKPaletteDragHandleSize(v5);
  v8 = v7;
  -[PKDragIndicatorView scalingFactor](self, "scalingFactor");
  v10 = v8 * v9;
  v11 = v6 * v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

@end

@implementation FMFixedSizeView

- (FMFixedSizeView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  FMFixedSizeView *v5;
  FMFixedSizeView *v6;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)FMFixedSizeView;
  v5 = -[FMFixedSizeView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
    -[FMFixedSizeView setFixedIntrinsicSize:](v5, "setFixedIntrinsicSize:", width, height);
  return v6;
}

- (void)setIntrinsicContentSize:(CGSize)a3
{
  self->_fixedIntrinsicSize = a3;
  -[FMFixedSizeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)fixedIntrinsicSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fixedIntrinsicSize.width;
  height = self->_fixedIntrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFixedIntrinsicSize:(CGSize)a3
{
  self->_fixedIntrinsicSize = a3;
}

@end

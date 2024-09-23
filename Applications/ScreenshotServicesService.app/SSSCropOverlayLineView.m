@implementation SSSCropOverlayLineView

- (SSSCropOverlayLineView)initWithEdge:(unint64_t)a3
{
  SSSCropOverlayLineView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSCropOverlayLineView;
  result = -[SSSCropOverlayLineView init](&v5, "init");
  result->_edge = a3;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSSCropOverlayLineView;
  -[SSSCropOverlayLineView tintColorDidChange](&v4, "tintColorDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropOverlayLineView tintColor](self, "tintColor"));
  -[SSSCropOverlayLineView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

+ (double)preferredDimension
{
  return 1.0;
}

- (unint64_t)edge
{
  return self->_edge;
}

@end

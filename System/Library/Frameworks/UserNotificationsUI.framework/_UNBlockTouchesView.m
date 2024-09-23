@implementation _UNBlockTouchesView

- (_UNBlockTouchesView)initWithFrame:(CGRect)a3
{
  _UNBlockTouchesView *v3;
  _UNBlockTouchesView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UNBlockTouchesView;
  v3 = -[_UNBlockTouchesView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_UNBlockTouchesView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

  }
  return v4;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UNBlockTouchesView;
  -[_UNBlockTouchesView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  -[_UNBlockTouchesView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHitTestsAsOpaque:", !v3);

}

- (BOOL)isUserInteractionEnabled
{
  void *v3;
  int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UNBlockTouchesView;
  if (-[_UNBlockTouchesView isUserInteractionEnabled](&v6, sel_isUserInteractionEnabled))
  {
    -[_UNBlockTouchesView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hitTestsAsOpaque") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

@end

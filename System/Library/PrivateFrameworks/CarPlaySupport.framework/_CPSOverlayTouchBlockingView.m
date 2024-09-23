@implementation _CPSOverlayTouchBlockingView

- (_CPSOverlayTouchBlockingView)initWithFrame:(CGRect)a3
{
  _CPSOverlayTouchBlockingView *v4;
  id v5;
  objc_super v6;
  SEL v7;
  _CPSOverlayTouchBlockingView *v8;
  CGRect v9;

  v9 = a3;
  v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)_CPSOverlayTouchBlockingView;
  v8 = -[_CPSOverlayTouchBlockingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    v5 = (id)-[_CPSOverlayTouchBlockingView layer](v8, "layer");
    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

  }
  v4 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v4;
}

@end

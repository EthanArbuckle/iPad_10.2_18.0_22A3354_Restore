@implementation CKComposeNavbarManagerContentView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKComposeNavbarManagerContentView;
  -[CKComposeNavbarManagerContentView layoutSubviews](&v13, sel_layoutSubviews);
  -[CKComposeNavbarManagerContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKComposeNavbarManagerContentView canvasView](self, "canvasView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CKComposeNavbarManagerContentView canvasView](self, "canvasView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)CKComposeNavbarManagerContentView;
  -[CKComposeNavbarManagerContentView sizeThatFits:](&v13, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[CKComposeNavbarManagerContentView canvasView](self, "canvasView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", v5, v7);
  v10 = v9;

  v11 = v5;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CKNavigationBarCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->_canvasView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasView, 0);
}

@end

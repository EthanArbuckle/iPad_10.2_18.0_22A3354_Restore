@implementation CKTypingView

- (CKTypingView)initWithFrame:(CGRect)a3
{
  CKTypingView *v3;
  CKBaseLayer *v4;
  CKBaseLayer *baseLayer;
  CKBaseLayer *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKTypingView;
  v3 = -[CKTypingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CKBaseLayer);
    baseLayer = v3->_baseLayer;
    v3->_baseLayer = v4;

    v6 = v3->_baseLayer;
    -[CKTypingView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[CKBaseLayer setFrame:](v6, "setFrame:");

    -[CKTypingView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", v3->_baseLayer);

  }
  return v3;
}

- (void)setIndicatorLayer:(id)a3
{
  CKTypingIndicatorLayerProtocol *v5;
  CKTypingIndicatorLayerProtocol *indicatorLayer;
  CKTypingIndicatorLayerProtocol *v7;
  void *v8;
  void *v9;
  CKTypingIndicatorLayerProtocol *v10;

  v5 = (CKTypingIndicatorLayerProtocol *)a3;
  indicatorLayer = self->_indicatorLayer;
  v10 = v5;
  if (indicatorLayer != v5)
  {
    -[CKTypingIndicatorLayerProtocol removeFromSuperlayer](indicatorLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->_indicatorLayer, a3);
    v7 = self->_indicatorLayer;
    -[CKTypingView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    -[CKTypingIndicatorLayerProtocol setFrame:](v7, "setFrame:");

    -[CKTypingView baseLayer](self, "baseLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", v10);

  }
}

- (CKTypingIndicatorLayerProtocol)indicatorLayer
{
  return self->_indicatorLayer;
}

- (CKBaseLayer)baseLayer
{
  return self->_baseLayer;
}

- (void)setBaseLayer:(id)a3
{
  objc_storeStrong((id *)&self->_baseLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseLayer, 0);
  objc_storeStrong((id *)&self->_indicatorLayer, 0);
}

@end

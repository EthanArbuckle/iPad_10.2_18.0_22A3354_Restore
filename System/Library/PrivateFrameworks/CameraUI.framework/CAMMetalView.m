@implementation CAMMetalView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CAMMetalView;
  -[CAMMetalView layoutSubviews](&v17, sel_layoutSubviews);
  -[CAMMetalView metalLayer](self, "metalLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  -[CAMMetalView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v10 = v9;

  objc_msgSend(v3, "setContentsScale:", v10);
  v11 = round(v5 * v10);
  v12 = round(v7 * v10);
  objc_msgSend(v3, "drawableSize");
  if (v11 != v14 || v12 != v13)
  {
    objc_msgSend(v3, "setDrawableSize:", v11, v12);
    -[CAMMetalView metalViewDelegate](self, "metalViewDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "metalViewDidChangeDrawableSize:", self);

  }
}

- (CAMMetalViewDelegate)metalViewDelegate
{
  return self->_metalViewDelegate;
}

- (void)setMetalViewDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_metalViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalViewDelegate, 0);
}

@end

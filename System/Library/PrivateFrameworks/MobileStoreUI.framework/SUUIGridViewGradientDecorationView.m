@implementation SUUIGridViewGradientDecorationView

- (SUUIGridViewGradientDecorationView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIGridViewGradientDecorationView;
  return -[SUUIGridViewGradientDecorationView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  SUUIGridViewGradientDecorationBackgroundView *backgroundView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIGridViewGradientDecorationView;
  -[SUUIGridViewGradientDecorationView layoutSubviews](&v9, sel_layoutSubviews);
  backgroundView = self->_backgroundView;
  -[SUUIGridViewGradientDecorationView bounds](self, "bounds");
  -[SUUIGridViewGradientDecorationBackgroundView setFrame:](backgroundView, "setFrame:");
  if (-[IKColor colorType](self->_kolor, "colorType") == 3)
  {
    v4 = (void *)MEMORY[0x24BDBCEB8];
    -[IKColor gradientColors](self->_kolor, "gradientColors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      -[IKColor gradientColors](self->_kolor, "gradientColors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "removeObjectAtIndex:", 0);
      -[SUUIGridViewGradientDecorationBackgroundView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v8);
      -[SUUIGridViewGradientDecorationView _createGradient:withGradientType:](self, "_createGradient:withGradientType:", v6, -[IKColor gradientDirectionType](self->_kolor, "gradientDirectionType"));

    }
  }
}

- (void)_createGradient:(id)a3 withGradientType:(int64_t)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SUUIGridViewGradientDecorationBackgroundView layer](self->_backgroundView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IKColor gradientType](self->_kolor, "gradientType") == 1)
  {
    v7 = 1.0;
    v8 = 0.5;
    v9 = 0.0;
    v10 = 0.5;
  }
  else
  {
    if (-[IKColor gradientType](self->_kolor, "gradientType") != 2)
      goto LABEL_6;
    v9 = 0.5;
    v10 = 1.0;
    v8 = 0.0;
    v7 = 0.5;
  }
  objc_msgSend(v6, "setStartPoint:", v8, v9);
  objc_msgSend(v6, "setEndPoint:", v10, v7);
LABEL_6:
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16));
        objc_msgSend(v11, "addObject:", objc_msgSend(v17, "CGColor", (_QWORD)v18));
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  objc_msgSend(v6, "setColors:", v11);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  SUUIGridViewGradientDecorationBackgroundView *backgroundView;
  SUUIGridViewGradientDecorationBackgroundView *v6;
  SUUIGridViewGradientDecorationBackgroundView *v7;
  SUUIGridViewGradientDecorationBackgroundView *v8;
  SUUIGridViewGradientDecorationBackgroundView *v9;
  IKColor *v10;
  IKColor *kolor;
  SUUIGridViewGradientDecorationBackgroundView *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIGridViewGradientDecorationView;
  -[SUUIGridViewGradientDecorationView applyLayoutAttributes:](&v15, sel_applyLayoutAttributes_, v4);
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[SUUIGridViewGradientDecorationBackgroundView removeFromSuperview](backgroundView, "removeFromSuperview");
    v6 = self->_backgroundView;
    self->_backgroundView = 0;

  }
  v7 = [SUUIGridViewGradientDecorationBackgroundView alloc];
  v8 = -[SUUIGridViewGradientDecorationBackgroundView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = self->_backgroundView;
  self->_backgroundView = v8;

  -[SUUIGridViewGradientDecorationBackgroundView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
  -[SUUIGridViewGradientDecorationView addSubview:](self, "addSubview:", self->_backgroundView);
  objc_msgSend(v4, "gradientColor");
  v10 = (IKColor *)objc_claimAutoreleasedReturnValue();
  kolor = self->_kolor;
  self->_kolor = v10;

  if (-[IKColor colorType](self->_kolor, "colorType") != 3)
  {
    v12 = self->_backgroundView;
    objc_msgSend(v4, "gradientColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGridViewGradientDecorationBackgroundView setBackgroundColor:](v12, "setBackgroundColor:", v14);

  }
}

- (UIView)backgroundView
{
  return &self->_backgroundView->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kolor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end

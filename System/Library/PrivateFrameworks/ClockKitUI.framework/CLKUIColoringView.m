@implementation CLKUIColoringView

- (CLKUIColoringView)initWithFrame:(CGRect)a3
{
  CLKUIColoringView *v3;
  CLKUIColoringView *v4;
  _CLKUIColorManager *v5;
  _CLKUIColorManager *colorManager;
  _CLKUIColorManager *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLKUIColoringView;
  v3 = -[CLKUIColoringView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CLKUIColoringView setOpaque:](v3, "setOpaque:", 0);
    v5 = objc_alloc_init(_CLKUIColorManager);
    colorManager = v4->_colorManager;
    v4->_colorManager = v5;

    v7 = v4->_colorManager;
    -[CLKUIColoringView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CLKUIColorManager setLayer:](v7, "setLayer:", v8);

  }
  return v4;
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)CLKUIColoringView;
  -[CLKUIColoringView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKUIColoringView;
  v5 = -[CLKUIColoringView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4)
    || -[_CLKUIColorManager shouldAnimatePropertyWithKey:](self->_colorManager, "shouldAnimatePropertyWithKey:", v4);

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_colorManager;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (BOOL)usesLegibility
{
  return 0;
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_colorManager, 0);
}

@end

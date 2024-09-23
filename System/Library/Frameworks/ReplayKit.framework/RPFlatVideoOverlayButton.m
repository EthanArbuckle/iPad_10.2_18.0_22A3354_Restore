@implementation RPFlatVideoOverlayButton

- (RPFlatVideoOverlayButton)initWithStyle:(int64_t)a3
{
  RPFlatVideoOverlayButton *v4;
  RPFlatVideoOverlayButton *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RPFlatVideoOverlayButton;
  v4 = -[RPFlatVideoOverlayButton initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    -[RPFlatVideoOverlayButton _normalButtonImage](v4, "_normalButtonImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFlatVideoOverlayButton setImage:forState:](v5, "setImage:forState:", v6, 0);

    -[RPFlatVideoOverlayButton _highlightedButtonImage](v5, "_highlightedButtonImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFlatVideoOverlayButton setImage:forState:](v5, "setImage:forState:", v7, 1);

    -[RPFlatVideoOverlayButton sizeToFit](v5, "sizeToFit");
    -[RPFlatVideoOverlayButton setDeliversTouchesForGesturesToSuperview:](v5, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[RPFlatVideoOverlayButton addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", v5, sel__handleTap_, 64);
  }
  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  self->_action = a4;
}

- (void)_handleTap:(id)a3
{
  id *p_target;
  id WeakRetained;
  char v6;
  id v7;

  p_target = &self->_target;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(p_target);
    objc_msgSend(v7, "performSelector:withObject:", self->_action, self);

  }
}

- (id)_normalButtonImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__RPFlatVideoOverlayButton__normalButtonImage__block_invoke;
  block[3] = &unk_24D15D648;
  block[4] = self;
  if (_normalButtonImage_onceToken != -1)
    dispatch_once(&_normalButtonImage_onceToken, block);
  return (id)_normalButtonImage_image;
}

void __46__RPFlatVideoOverlayButton__normalButtonImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_createOverlayImageWithBackgroundWhite:backgroundAlpha:glyphAlpha:", 0.959999979, 0.959999979, 0.300000012);
  v2 = (void *)_normalButtonImage_image;
  _normalButtonImage_image = v1;

}

- (id)_highlightedButtonImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__RPFlatVideoOverlayButton__highlightedButtonImage__block_invoke;
  block[3] = &unk_24D15D648;
  block[4] = self;
  if (_highlightedButtonImage_onceToken != -1)
    dispatch_once(&_highlightedButtonImage_onceToken, block);
  return (id)_highlightedButtonImage_image;
}

void __51__RPFlatVideoOverlayButton__highlightedButtonImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_createOverlayImageWithBackgroundWhite:backgroundAlpha:glyphAlpha:", 0.959999979, 0.959999979, 0.5);
  v2 = (void *)_highlightedButtonImage_image;
  _highlightedButtonImage_image = v1;

}

- (id)_createOverlayImageWithBackgroundWhite:(double)a3 backgroundAlpha:(double)a4 glyphAlpha:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGFloat width;
  CGFloat height;
  CGContext *CurrentContext;
  void *v16;
  CGSize v18;
  CGRect v19;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("RPVideoOverlayBackgroundMask"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("RPVideoOverlayGlyphMask"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDBEFB0];
  v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v9, "size");
  width = v18.width;
  height = v18.height;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetGrayFillColor(CurrentContext, a3, a4);
  v19.origin.x = v11;
  v19.origin.y = v12;
  v19.size.width = width;
  v19.size.height = height;
  CGContextFillRect(CurrentContext, v19);
  objc_msgSend(v9, "drawAtPoint:blendMode:alpha:", 23, v11, v12, 1.0);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 23, v11, v12, 1.0);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 0, v11, v12, a5);
  UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v16;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

@end

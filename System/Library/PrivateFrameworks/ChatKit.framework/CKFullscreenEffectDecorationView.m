@implementation CKFullscreenEffectDecorationView

+ (id)decorationViewKind
{
  return CFSTR("FullscreenEffectDecorationView");
}

+ (id)reuseIdentifier
{
  return CFSTR("FullscreenEffectDecorationView-reuseIdentifier");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFullscreenEffectDecorationView;
  -[CKFullscreenEffectDecorationView prepareForReuse](&v3, sel_prepareForReuse);
  -[CKFullscreenEffectDecorationView tearDownEffectView](self, "tearDownEffectView");
}

- (void)setupForEffectView:(id)a3
{
  id v4;

  v4 = a3;
  -[CKFullscreenEffectDecorationView bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");
  -[CKFullscreenEffectDecorationView addSubview:](self, "addSubview:", v4);
  -[CKFullscreenEffectDecorationView setEffectView:](self, "setEffectView:", v4);

}

- (void)tearDownEffectView
{
  void *v3;
  id v4;

  -[CKFullscreenEffectDecorationView effectView](self, "effectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimation");

  -[CKFullscreenEffectDecorationView effectView](self, "effectView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

}

- (CKFullscreenEffectView)effectView
{
  return (CKFullscreenEffectView *)objc_loadWeakRetained((id *)&self->_effectView);
}

- (void)setEffectView:(id)a3
{
  objc_storeWeak((id *)&self->_effectView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_effectView);
}

@end

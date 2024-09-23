@implementation NTKHandView

- (void)_initWithImage:(id)a3 forDevice:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKHandView;
  -[CLKUIHandView _initWithImage:forDevice:](&v4, sel__initWithImage_forDevice_, a3, a4);
}

- (void)setColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKHandView;
  -[CLKUIHandView setColor:](&v3, sel_setColor_, a3);
}

- (void)setInlayColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKHandView;
  -[CLKUIHandView setInlayColor:](&v3, sel_setInlayColor_, a3);
}

- (void)setInlayInsets:(UIEdgeInsets)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKHandView;
  -[CLKUIHandView setInlayInsets:](&v3, sel_setInlayInsets_, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setHandDotColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKHandView;
  -[CLKUIHandView setHandDotColor:](&v3, sel_setHandDotColor_, a3);
}

- (id)transitionContainerView
{
  UIView *transitionContainerView;
  id v4;
  UIView *v5;
  UIView *v6;

  transitionContainerView = self->_transitionContainerView;
  if (!transitionContainerView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKHandView bounds](self, "bounds");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_transitionContainerView;
    self->_transitionContainerView = v5;

    -[NTKHandView addSubview:](self, "addSubview:", self->_transitionContainerView);
    transitionContainerView = self->_transitionContainerView;
  }
  return transitionContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContainerView, 0);
}

@end

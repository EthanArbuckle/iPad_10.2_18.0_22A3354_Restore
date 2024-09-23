@implementation CPSInlineCardContainerView

- (CPSInlineCardContainerView)initWithFrame:(CGRect)a3
{
  CPSInlineCardContainerView *v3;
  uint64_t v4;
  UITapGestureRecognizer *tapRecognizer;
  CPSInlineCardContainerView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPSInlineCardContainerView;
  v3 = -[CPSInlineCardContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_tappedView_);
    tapRecognizer = v3->_tapRecognizer;
    v3->_tapRecognizer = (UITapGestureRecognizer *)v4;

    -[UITapGestureRecognizer setDelegate:](v3->_tapRecognizer, "setDelegate:", v3);
    -[CPSInlineCardContainerView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapRecognizer);
    v6 = v3;
  }

  return v3;
}

- (void)tappedView:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didTapBackgroundView:", self);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  BOOL v12;
  objc_super v14;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView convertPoint:fromView:](self->_contentView, "convertPoint:fromView:", self, x, y);
  v9 = v8;
  v11 = v10;
  -[UIView bounds](self->_contentView, "bounds");
  v15.x = v9;
  v15.y = v11;
  if (CGRectContainsPoint(v16, v15))
  {
    v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CPSInlineCardContainerView;
    v12 = -[CPSInlineCardContainerView pointInside:withEvent:](&v14, sel_pointInside_withEvent_, v7, x, y);
  }

  return v12;
}

- (CPSInlineCardViewDelegate)delegate
{
  return (CPSInlineCardViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
}

@end

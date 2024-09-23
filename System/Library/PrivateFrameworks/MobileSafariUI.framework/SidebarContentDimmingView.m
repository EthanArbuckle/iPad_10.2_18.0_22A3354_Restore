@implementation SidebarContentDimmingView

- (SidebarContentDimmingView)initWithFrame:(CGRect)a3 dimmedContentFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  SidebarContentDimmingView *v8;
  uint64_t v9;
  UIView *dimmingView;
  UIView *v11;
  void *v12;
  uint64_t v13;
  UITapGestureRecognizer *dismissRecognizer;
  SidebarContentDimmingView *v15;
  objc_super v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)SidebarContentDimmingView;
  v8 = -[SidebarContentDimmingView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    dimmingView = v8->_dimmingView;
    v8->_dimmingView = (UIView *)v9;

    v11 = v8->_dimmingView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[SidebarContentDimmingView addSubview:](v8, "addSubview:", v8->_dimmingView);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v8, sel__dismissRecognized_);
    dismissRecognizer = v8->_dismissRecognizer;
    v8->_dismissRecognizer = (UITapGestureRecognizer *)v13;

    -[UITapGestureRecognizer setDelegate:](v8->_dismissRecognizer, "setDelegate:", v8);
    -[SidebarContentDimmingView addGestureRecognizer:](v8, "addGestureRecognizer:", v8->_dismissRecognizer);
    -[SidebarContentDimmingView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("sidebarContentDimmingView"));
    v15 = v8;
  }

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  _BOOL4 v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGPoint v29;
  CGPoint v30;
  CGRect v31;
  CGRect v32;

  y = a3.y;
  x = a3.x;
  if ((objc_msgSend(a4, "type") | 2) != 0xB)
    goto LABEL_3;
  -[UIView bounds](self->_dimmingView, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SidebarContentDimmingView convertPoint:toView:](self, "convertPoint:toView:", self->_dimmingView, x, y);
  v29.x = v15;
  v29.y = v16;
  v31.origin.x = v8;
  v31.origin.y = v10;
  v31.size.width = v12;
  v31.size.height = v14;
  v17 = CGRectContainsPoint(v31, v29);
  if (v17)
  {
LABEL_3:
    -[UIView bounds](self->_passthroughView, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[SidebarContentDimmingView convertPoint:toView:](self, "convertPoint:toView:", self->_passthroughView, x, y);
    v30.x = v26;
    v30.y = v27;
    v32.origin.x = v19;
    v32.origin.y = v21;
    v32.size.width = v23;
    v32.size.height = v25;
    LOBYTE(v17) = !CGRectContainsPoint(v32, v30);
  }
  return v17;
}

- (void)setDimmedContentFrame:(CGRect)a3
{
  -[UIView setFrame:](self->_dimmingView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setTransparent:(BOOL)a3
{
  UIView *dimmingView;
  double v4;

  dimmingView = self->_dimmingView;
  v4 = 0.5;
  if (a3)
    v4 = 0.0;
  -[UIView setAlpha:](dimmingView, "setAlpha:", v4);
}

- (void)_dismissRecognized:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sidebarDimmingViewDismiss:", self);

}

- (UIView)passthroughView
{
  return self->_passthroughView;
}

- (void)setPassthroughView:(id)a3
{
  objc_storeStrong((id *)&self->_passthroughView, a3);
}

- (SidebarContentDimmingViewDelegate)delegate
{
  return (SidebarContentDimmingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passthroughView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_dismissRecognizer, 0);
}

@end

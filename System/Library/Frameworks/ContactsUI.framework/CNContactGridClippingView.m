@implementation CNContactGridClippingView

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double Width;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  void *v22;
  CGPath *Mutable;
  CGFloat MidY;
  void *v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v26.receiver = self;
  v26.super_class = (Class)CNContactGridClippingView;
  -[CNContactGridClippingView layoutSubviews](&v26, sel_layoutSubviews);
  -[CNContactGridClippingView actionsMaskLayer](self, "actionsMaskLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactGridClippingView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    Width = CGRectGetWidth(v27);

    -[CNContactGridClippingView avatarView](self, "avatarView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGridClippingView avatarView](self, "avatarView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    objc_msgSend(v12, "convertRect:toView:", self);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    -[CNContactGridClippingView actionsMaskLayer](self, "actionsMaskLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v5, v7, Width, v9);

    Mutable = CGPathCreateMutable();
    v28.origin.x = v15;
    v28.origin.y = v17;
    v28.size.width = v19;
    v28.size.height = v21;
    MidY = CGRectGetMidY(v28);
    CGPathAddArc(Mutable, 0, 0.0, MidY, v21 * 0.5, 0.0, 6.28318531, 1);
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = Width;
    v29.size.height = v9;
    CGPathAddRect(Mutable, 0, v29);
    -[CNContactGridClippingView actionsMaskLayer](self, "actionsMaskLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPath:", Mutable);

    CFRelease(Mutable);
  }
}

- (void)setMasksToAvatar:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (-[CNContactGridClippingView masksToAvatar](self, "masksToAvatar") != a3)
  {
    if (v3)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CD2840]);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "setFillColor:", objc_msgSend(v5, "CGColor"));

      objc_msgSend(v8, "setFillRule:", *MEMORY[0x1E0CD2B70]);
      -[CNContactGridClippingView layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMask:", v8);

      -[CNContactGridClippingView setActionsMaskLayer:](self, "setActionsMaskLayer:", v8);
    }
    else
    {
      -[CNContactGridClippingView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMask:", 0);

      -[CNContactGridClippingView setActionsMaskLayer:](self, "setActionsMaskLayer:", 0);
    }
  }
}

- (BOOL)masksToAvatar
{
  void *v2;
  BOOL v3;

  -[CNContactGridClippingView actionsMaskLayer](self, "actionsMaskLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CNAvatarView)avatarView
{
  return (CNAvatarView *)objc_loadWeakRetained((id *)&self->_avatarView);
}

- (void)setAvatarView:(id)a3
{
  objc_storeWeak((id *)&self->_avatarView, a3);
}

- (CAShapeLayer)actionsMaskLayer
{
  return self->_actionsMaskLayer;
}

- (void)setActionsMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_actionsMaskLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsMaskLayer, 0);
  objc_destroyWeak((id *)&self->_avatarView);
}

@end

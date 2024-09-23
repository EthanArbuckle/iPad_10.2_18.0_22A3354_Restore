@implementation SFBadgeContainerView

- (void)layoutSubviews
{
  char isKindOfClass;
  UIView *contentView;
  UIView *v5;
  UIView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat rect;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v31.receiver = self;
  v31.super_class = (Class)SFBadgeContainerView;
  -[SFBadgeContainerView layoutSubviews](&v31, sel_layoutSubviews);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  contentView = self->_contentView;
  if ((isKindOfClass & 1) != 0)
  {
    -[UIView imageView](contentView, "imageView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = contentView;
  }
  v6 = v5;
  -[UIView bounds](v5, "bounds");
  -[UIView alignmentRectForFrame:](v6, "alignmentRectForFrame:");
  -[SFBadgeContainerView convertRect:fromView:](self, "convertRect:fromView:", v6);
  v29 = v8;
  v30 = v7;
  v27 = v10;
  v28 = v9;
  -[SFBadgeContainerView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (self->_positionsBadgeRelativeToLayoutMargins)
  {
    -[SFBadgeContainerView layoutMargins](self, "layoutMargins");
    v12 = v12 + v19;
    v14 = v14 + v20;
    v16 = v16 - (v19 + v21);
    v18 = v18 - (v20 + v22);
  }
  rect = v16;
  v32.origin.x = v12;
  v32.origin.y = v14;
  v32.size.width = v16;
  v32.size.height = v18;
  v23 = CGRectGetMaxX(v32) + -6.0 + -1.0;
  v33.origin.x = v30;
  v33.origin.y = v29;
  v33.size.width = v28;
  v33.size.height = v27;
  v26 = fmax(v23, CGRectGetMaxX(v33) + -6.0);
  v34.origin.x = v12;
  v34.origin.y = v14;
  v34.size.width = rect;
  v34.size.height = v18;
  v24 = CGRectGetMinY(v34) + 1.0;
  v35.origin.x = v30;
  v35.origin.y = v29;
  v35.size.width = v28;
  v35.size.height = v27;
  -[SFBadge setFrame:](self->_badge, "setFrame:", v26, fmax(v24, CGRectGetMinY(v35)), 6.0, 6.0);
  -[UIView bounds](self->_contentView, "bounds");
  -[SFBadgeMaskView setFrame:](self->_badgeMask, "setFrame:");
  -[SFBadge frame](self->_badge, "frame");
  -[SFBadgeMaskView setBadgeRect:](self->_badgeMask, "setBadgeRect:");

}

- (void)setShowsBadge:(BOOL)a3
{
  SFBadge *v4;
  SFBadge *badge;
  SFBadgeMaskView *v6;
  SFBadgeMaskView *v7;
  SFBadgeMaskView *badgeMask;
  SFBadge *v9;
  SFBadgeMaskView *v10;

  if (self->_showsBadge != a3)
  {
    self->_showsBadge = a3;
    if (a3)
    {
      v4 = objc_alloc_init(SFBadge);
      badge = self->_badge;
      self->_badge = v4;

      -[SFBadge setUserInteractionEnabled:](self->_badge, "setUserInteractionEnabled:", 0);
      -[SFBadge setTintColor:](self->_badge, "setTintColor:", self->_badgeTintColor);
      -[SFBadgeContainerView addSubview:](self, "addSubview:", self->_badge);
      v6 = [SFBadgeMaskView alloc];
      -[UIView bounds](self->_contentView, "bounds");
      v7 = -[SFBadgeMaskView initWithFrame:](v6, "initWithFrame:");
      badgeMask = self->_badgeMask;
      self->_badgeMask = v7;

      -[SFBadgeMaskView setAutoresizingMask:](self->_badgeMask, "setAutoresizingMask:", 18);
      -[UIView bounds](self->_contentView, "bounds");
      -[SFBadgeMaskView setFrame:](self->_badgeMask, "setFrame:");
      -[UIView setMaskView:](self->_contentView, "setMaskView:", self->_badgeMask);
    }
    else
    {
      -[SFBadge removeFromSuperview](self->_badge, "removeFromSuperview");
      v9 = self->_badge;
      self->_badge = 0;

      -[UIView setMaskView:](self->_contentView, "setMaskView:", 0);
      v10 = self->_badgeMask;
      self->_badgeMask = 0;

    }
  }
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  v8 = v5;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    -[UIView setMaskView:](*p_contentView, "setMaskView:", 0);
    objc_storeStrong((id *)&self->_contentView, a3);
    if (*p_contentView)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      -[UIView setAutoresizingMask:](*p_contentView, "setAutoresizingMask:", 18);
      -[SFBadgeContainerView bounds](self, "bounds");
      -[UIView setFrame:](*p_contentView, "setFrame:");
      -[UIView bounds](*p_contentView, "bounds");
      -[SFBadgeMaskView setFrame:](self->_badgeMask, "setFrame:");
      -[UIView setMaskView:](*p_contentView, "setMaskView:", self->_badgeMask);
      -[SFBadgeContainerView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_contentView, 0);
    }
  }

}

- (void)setBadgeTintColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_badgeTintColor, a3);
  v5 = a3;
  -[SFBadge setTintColor:](self->_badge, "setTintColor:", v5);

}

- (void)pulse
{
  UIView *v3;

  v3 = self->_contentView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[UIView progressStyle](v3, "progressStyle") == 2)
    -[UIView setNeedsPulseOnView:](v3, "setNeedsPulseOnView:", self);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  SFBadgeContainerView *v6;
  UIView *contentView;
  id v8;

  y = a3.y;
  x = a3.x;
  v6 = self;
  contentView = self->_contentView;
  v8 = a4;
  -[UIView convertPoint:fromView:](contentView, "convertPoint:fromView:", v6, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](contentView, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIView intrinsicContentSize](self->_contentView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)showsBadge
{
  return self->_showsBadge;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)positionsBadgeRelativeToLayoutMargins
{
  return self->_positionsBadgeRelativeToLayoutMargins;
}

- (void)setPositionsBadgeRelativeToLayoutMargins:(BOOL)a3
{
  self->_positionsBadgeRelativeToLayoutMargins = a3;
}

- (UIColor)badgeTintColor
{
  return self->_badgeTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTintColor, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_badgeMask, 0);
  objc_storeStrong((id *)&self->_badge, 0);
}

@end

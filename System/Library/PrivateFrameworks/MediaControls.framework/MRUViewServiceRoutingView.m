@implementation MRUViewServiceRoutingView

- (MRUViewServiceRoutingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUViewServiceRoutingView *v7;
  MRUViewServiceRoutingHeaderView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  MRUViewServiceRoutingHeaderView *headerView;
  MRUViewServiceRoutingFooterView *v15;
  MRUViewServiceRoutingFooterView *footerView;
  uint64_t v17;
  UITableView *tableView;
  void *v19;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)MRUViewServiceRoutingView;
  v7 = -[MRUViewServiceRoutingView initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v8 = [MRUViewServiceRoutingHeaderView alloc];
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = -[MRUViewServiceRoutingHeaderView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    headerView = v7->_headerView;
    v7->_headerView = (MRUViewServiceRoutingHeaderView *)v13;

    -[MRUViewServiceRoutingView addSubview:](v7, "addSubview:", v7->_headerView);
    v15 = -[MRUViewServiceRoutingFooterView initWithFrame:]([MRUViewServiceRoutingFooterView alloc], "initWithFrame:", v9, v10, v11, v12);
    footerView = v7->_footerView;
    v7->_footerView = v15;

    -[MRUViewServiceRoutingView addSubview:](v7, "addSubview:", v7->_footerView);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:", x, y, width, height);
    tableView = v7->_tableView;
    v7->_tableView = (UITableView *)v17;

    -[UITableView setSeparatorStyle:](v7->_tableView, "setSeparatorStyle:", 0);
    -[UITableView setAlwaysBounceVertical:](v7->_tableView, "setAlwaysBounceVertical:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v7->_tableView, "setBackgroundColor:", v19);

    -[UITableView setEstimatedRowHeight:](v7->_tableView, "setEstimatedRowHeight:", 108.0);
    -[UITableView setRowHeight:](v7->_tableView, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v9, v10, v11, v12);
    -[UITableView setTableFooterView:](v7->_tableView, "setTableFooterView:", v20);

    -[UITableView setScrollIndicatorInsets:](v7->_tableView, "setScrollIndicatorInsets:", 24.0, 0.0, 24.0, 0.0);
    -[MRUViewServiceRoutingView addSubview:](v7, "addSubview:", v7->_tableView);
    -[MRUViewServiceRoutingView updateVisibility](v7, "updateVisibility");
  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  double MinX;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double MaxY;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v39.receiver = self;
  v39.super_class = (Class)MRUViewServiceRoutingView;
  -[MRUViewServiceRoutingView layoutSubviews](&v39, sel_layoutSubviews);
  -[MRUViewServiceRoutingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UITableView setFrame:](self->_tableView, "setFrame:");
  if (*(_WORD *)&self->_footerVisible)
  {
    -[MRUViewServiceRoutingView safeAreaInsets](self, "safeAreaInsets");
    v4 = v4 + v11;
    v6 = v6 + v12;
    v8 = v8 - (v11 + v13);
    v10 = v10 - (v12 + v14);
  }
  -[UIView setFrame:](self->_alertView, "setFrame:", v4, v6, v8, v10);
  -[MRUViewServiceRoutingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v8, v10);
  v16 = v15;
  v18 = v17;
  v40.origin.x = v4;
  v40.origin.y = v6;
  v40.size.width = v8;
  v40.size.height = v10;
  MinX = CGRectGetMinX(v40);
  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  -[MRUViewServiceRoutingHeaderView setFrame:](self->_headerView, "setFrame:", MinX, CGRectGetMinY(v41), v16, v18);
  UIRectInset();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[MRUViewServiceRoutingFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", v24, v26);
  v29 = v28;
  v31 = v30;
  v42.origin.x = v21;
  v42.origin.y = v23;
  v42.size.width = v25;
  v42.size.height = v27;
  v32 = CGRectGetMinX(v42);
  v43.origin.x = v21;
  v43.origin.y = v23;
  v43.size.width = v25;
  v43.size.height = v27;
  MaxY = CGRectGetMaxY(v43);
  v34 = MaxY;
  if (self->_footerVisible)
  {
    v34 = MaxY - v31;
    UIRectInset();
    v21 = v35;
    v23 = v36;
    v25 = v37;
    v27 = v38;
  }
  -[MRUViewServiceRoutingFooterView setFrame:](self->_footerView, "setFrame:", v32, v34, v29, v31);
  -[UIView setFrame:](self->_contentView, "setFrame:", v21, v23, v25, v27);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double preferredWidth;
  int64_t state;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = MRUDefaultExpandedWidth(self);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    preferredWidth = self->_preferredWidth;
    if (v6 >= preferredWidth)
      preferredWidth = v6;
    if (preferredWidth >= width)
      v6 = width;
    else
      v6 = preferredWidth;
  }
  state = self->_state;
  if (state == 1)
  {
    -[UITableView _contentSize](self->_tableView, "_contentSize");
    if (v9 >= height)
      v9 = height;
  }
  else if (!state)
  {
    if (self->_showAlertView)
    {
      -[MRUViewServiceRoutingView safeAreaInsets](self, "safeAreaInsets");
      v13 = v12 + 390.0;
      -[MRUViewServiceRoutingView safeAreaInsets](self, "safeAreaInsets");
      v9 = v13 + v14;
    }
    else
    {
      -[MRUViewServiceRoutingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v6, height);
      v16 = height - v15;
      v17 = v15 + 0.0;
      if (self->_footerVisible)
      {
        -[MRUViewServiceRoutingFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", v6, v16);
        v16 = v16 - v18;
        v17 = v17 + v18;
      }
      -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", v6, v16);
      if (v19 >= v16)
        v20 = v16;
      else
        v20 = v19;
      v9 = v17 + v20;
    }
  }
  v21 = v6;
  result.height = v9;
  result.width = v21;
  return result;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  UIView *v7;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  v7 = v5;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[MRUViewServiceRoutingView addSubview:](self, "addSubview:", v7);
    -[MRUViewServiceRoutingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAlertView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_alertView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_alertView, a3);
    -[MRUViewServiceRoutingView addSubview:](self, "addSubview:", self->_alertView);
    -[MRUViewServiceRoutingView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;

  v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUViewServiceRoutingHeaderView setStylingProvider:](self->_headerView, "setStylingProvider:", v5);
    -[MRUViewServiceRoutingFooterView setStylingProvider:](self->_footerView, "setStylingProvider:", v5);
  }

}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[MRUViewServiceRoutingView updateVisibility](self, "updateVisibility");
    -[MRUViewServiceRoutingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[MRUViewServiceRoutingView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", 0.0, 0.0, a3, 0.0);
}

- (void)setFooterVisible:(BOOL)a3
{
  if (self->_footerVisible != a3)
  {
    self->_footerVisible = a3;
    -[MRUViewServiceRoutingView updateVisibility](self, "updateVisibility");
    -[MRUViewServiceRoutingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowAlertView:(BOOL)a3
{
  if (self->_showAlertView != a3)
  {
    self->_showAlertView = a3;
    -[MRUViewServiceRoutingView updateVisibility](self, "updateVisibility");
    -[MRUViewServiceRoutingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateVisibility
{
  int64_t state;
  double v4;
  double v5;
  double v6;
  double v7;

  state = self->_state;
  if (state == 1)
  {
    -[UITableView setAlpha:](self->_tableView, "setAlpha:", 1.0);
    v4 = 0.0;
    -[MRUViewServiceRoutingHeaderView setAlpha:](self->_headerView, "setAlpha:", 0.0);
    -[UIView setAlpha:](self->_contentView, "setAlpha:", 0.0);
    -[MRUViewServiceRoutingFooterView setAlpha:](self->_footerView, "setAlpha:", 0.0);
  }
  else
  {
    if (state)
      return;
    v4 = 0.0;
    -[UITableView setAlpha:](self->_tableView, "setAlpha:", 0.0);
    if (self->_showAlertView)
      v5 = 0.0;
    else
      v5 = 1.0;
    -[MRUViewServiceRoutingHeaderView setAlpha:](self->_headerView, "setAlpha:", v5);
    if (self->_showAlertView)
      v6 = 0.0;
    else
      v6 = 1.0;
    -[UIView setAlpha:](self->_contentView, "setAlpha:", v6);
    v7 = 0.0;
    if (self->_footerVisible && !self->_showAlertView)
      v7 = 1.0;
    -[MRUViewServiceRoutingFooterView setAlpha:](self->_footerView, "setAlpha:", v7);
    if (self->_showAlertView)
      v4 = 1.0;
  }
  -[UIView setAlpha:](self->_alertView, "setAlpha:", v4);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)alertView
{
  return self->_alertView;
}

- (MRUViewServiceRoutingHeaderView)headerView
{
  return self->_headerView;
}

- (MRUViewServiceRoutingFooterView)footerView
{
  return self->_footerView;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)state
{
  return self->_state;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)isFooterVisible
{
  return self->_footerVisible;
}

- (BOOL)showAlertView
{
  return self->_showAlertView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

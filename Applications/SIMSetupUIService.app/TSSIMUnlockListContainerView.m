@implementation TSSIMUnlockListContainerView

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
  double MaxY;
  double v12;
  CGFloat v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)TSSIMUnlockListContainerView;
  -[TSSIMUnlockListContainerView layoutSubviews](&v15, "layoutSubviews");
  -[TSSIMUnlockListContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", v3, v5);
  v8 = v7;
  v10 = v9;
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = v8;
  v16.size.height = v10;
  MaxY = CGRectGetMaxY(v16);
  -[TSSIMUnlockListContainerView safeAreaInsets](self, "safeAreaInsets");
  v13 = v6 - v10 + -110.0 - v12;
  v17.origin.x = 0.0;
  v17.origin.y = MaxY;
  v17.size.width = v4;
  v17.size.height = v13;
  v14 = CGRectGetMaxY(v17);
  -[UIView setFrame:](self->_headerView, "setFrame:", 0.0, 0.0, v8, v10);
  -[UITableView setFrame:](self->_tableView, "setFrame:", 0.0, MaxY, v4, v13);
  -[UIView setFrame:](self->_footerView, "setFrame:", 0.0, v14, v4, 110.0);
}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView *headerView;
  UIView *v7;

  v5 = (UIView *)a3;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    -[TSSIMUnlockListContainerView addSubview:](self, "addSubview:", self->_headerView);
    -[TSSIMUnlockListContainerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setTableView:(id)a3
{
  UITableView *v5;
  UITableView *tableView;
  UITableView *v7;

  v5 = (UITableView *)a3;
  tableView = self->_tableView;
  if (tableView != v5)
  {
    v7 = v5;
    -[UITableView removeFromSuperview](tableView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_tableView, a3);
    -[TSSIMUnlockListContainerView addSubview:](self, "addSubview:", self->_tableView);
    -[TSSIMUnlockListContainerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setFooterView:(id)a3
{
  UIView *v5;
  UIView *footerView;
  UIView *v7;

  v5 = (UIView *)a3;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](footerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_footerView, a3);
    -[TSSIMUnlockListContainerView addSubview:](self, "addSubview:", self->_footerView);
    -[TSSIMUnlockListContainerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (UIView)headerView
{
  return self->_headerView;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end

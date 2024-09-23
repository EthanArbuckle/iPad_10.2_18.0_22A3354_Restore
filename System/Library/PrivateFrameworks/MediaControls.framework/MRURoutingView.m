@implementation MRURoutingView

- (MRURoutingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRURoutingView *v7;
  uint64_t v8;
  UITableView *tableView;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)MRURoutingView;
  v7 = -[MRURoutingView initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", 0, x, y, width, height);
    tableView = v7->_tableView;
    v7->_tableView = (UITableView *)v8;

    -[UITableView setSeparatorStyle:](v7->_tableView, "setSeparatorStyle:", 0);
    -[UITableView setIndicatorStyle:](v7->_tableView, "setIndicatorStyle:", 2);
    -[UITableView setAlwaysBounceVertical:](v7->_tableView, "setAlwaysBounceVertical:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v7->_tableView, "setBackgroundColor:", v10);

    -[UITableView setRowHeight:](v7->_tableView, "setRowHeight:", 52.0);
    -[UITableView _setHeaderAndFooterViewsFloat:](v7->_tableView, "_setHeaderAndFooterViewsFloat:", 0);
    v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v12 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UITableView setTableFooterView:](v7->_tableView, "setTableFooterView:", v12);

    -[UITableView setAccessibilityIdentifier:](v7->_tableView, "setAccessibilityIdentifier:", CFSTR("mru-routing-list"));
    -[MRURoutingView addSubview:](v7, "addSubview:", v7->_tableView);
  }
  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRURoutingView;
  -[MRURoutingView layoutSubviews](&v3, sel_layoutSubviews);
  -[MRURoutingView bounds](self, "bounds");
  -[UITableView setFrame:](self->_tableView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UITableView _contentSize](self->_tableView, "_contentSize");
  if (52.0 * 3.0 >= v6)
    v7 = 52.0 * 3.0;
  else
    v7 = v6;
  v8 = self->_contentEdgeInsets.bottom + self->_contentEdgeInsets.top + v7;
  if (v8 >= height)
    v9 = height;
  else
    v9 = v8;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
  -[UITableView setContentInset:](self->_tableView, "setContentInset:");
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end

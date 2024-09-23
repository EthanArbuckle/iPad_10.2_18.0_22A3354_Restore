@implementation MCSectionBasedTableView

- (MCSectionBasedTableView)initWithFrame:(CGRect)a3
{
  MCSectionBasedTableView *v3;
  MCSectionBasedTableView *v4;
  uint64_t v5;
  UITableView *tableView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCSectionBasedTableView;
  v3 = -[MCSectionBasedTableView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MCSectionBasedTableView _createTableView](v3, "_createTableView");
    v5 = objc_claimAutoreleasedReturnValue();
    tableView = v4->_tableView;
    v4->_tableView = (UITableView *)v5;

    -[MCSectionBasedTableView addSubview:](v4, "addSubview:", v4->_tableView);
  }
  return v4;
}

- (id)_createTableView
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setSeparatorStyle:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  return v3;
}

- (void)layoutSubviews
{
  double Width;
  double Height;
  void *v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)MCSectionBasedTableView;
  -[MCSectionBasedTableView layoutSubviews](&v6, sel_layoutSubviews);
  -[MCSectionBasedTableView bounds](self, "bounds");
  Width = CGRectGetWidth(v7);
  -[MCSectionBasedTableView bounds](self, "bounds");
  Height = CGRectGetHeight(v8);
  -[MCSectionBasedTableView tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, Width, Height);

}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end

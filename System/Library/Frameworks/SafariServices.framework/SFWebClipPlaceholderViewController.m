@implementation SFWebClipPlaceholderViewController

- (SFWebClipPlaceholderViewController)initWithStyle:(int64_t)a3
{
  SFWebClipPlaceholderViewController *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SFWebClipPlaceholderViewController *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFWebClipPlaceholderViewController;
  v3 = -[SFWebClipPlaceholderViewController initWithStyle:](&v14, sel_initWithStyle_, 1);
  if (v3)
  {
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWebClipPlaceholderViewController setTitle:](v3, "setTitle:", v4);

    v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, v3, 0);

    objc_msgSend(v7, "setEnabled:", 0);
    -[SFWebClipPlaceholderViewController navigationItem](v3, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v7);

    v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v10 = (void *)objc_msgSend(v9, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E0DC34F0], "_sf_popoverCancelButtonItem"), v3, 0);
    objc_msgSend(v10, "setEnabled:", 0);
    -[SFWebClipPlaceholderViewController navigationItem](v3, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v10);

    v12 = v3;
  }

  return v3;
}

- (void)loadView
{
  UITableViewCell *v3;
  UITableViewCell *titleCell;
  void *v5;
  UITableViewCell *v6;
  UITableViewCell *addressCell;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFWebClipPlaceholderViewController;
  -[SFWebClipPlaceholderViewController loadView](&v9, sel_loadView);
  v3 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
  titleCell = self->_titleCell;
  self->_titleCell = v3;

  -[UITableViewCell setSelectionStyle:](self->_titleCell, "setSelectionStyle:", 0);
  -[UITableViewCell textLabel](self->_titleCell, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  v6 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
  addressCell = self->_addressCell;
  self->_addressCell = v6;

  -[UITableViewCell setSelectionStyle:](self->_addressCell, "setSelectionStyle:", 0);
  -[UITableViewCell textLabel](self->_addressCell, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

}

- (void)viewWillLayoutSubviews
{
  -[SFWebClipPlaceholderViewController _cellInset](self, "_cellInset");
  -[UITableViewCell setSeparatorInset:](self->_titleCell, "setSeparatorInset:");
  -[SFWebClipPlaceholderViewController _cellInset](self, "_cellInset");
  -[UITableViewCell setSeparatorInset:](self->_addressCell, "setSeparatorInset:");
}

- (UIEdgeInsets)_cellInset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  -[SFWebClipPlaceholderViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sf_safeAreaInsetsFlippedForLayoutDirectionality");
  v4 = v3 + 90.0;

  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v8;
  result.top = v5;
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  int *v6;

  v5 = objc_msgSend(a4, "row", a3);
  v6 = &OBJC_IVAR___SFWebClipPlaceholderViewController__addressCell;
  if (!v5)
    v6 = &OBJC_IVAR___SFWebClipPlaceholderViewController__titleCell;
  return *(id *)((char *)&self->super.super.super.super.isa + *v6);
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
}

@end

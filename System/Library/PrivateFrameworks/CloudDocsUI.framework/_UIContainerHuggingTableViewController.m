@implementation _UIContainerHuggingTableViewController

- (_UIContainerHuggingTableViewController)initWithStyle:(int64_t)a3
{
  _UIContainerHuggingTableViewController *v3;
  _UIDocumentPickerContainerViewHuggingTableView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIContainerHuggingTableViewController;
  v3 = -[_UIContainerHuggingTableViewController initWithStyle:](&v7, sel_initWithStyle_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(_UIDocumentPickerContainerViewHuggingTableView);
    -[_UIContainerHuggingTableViewController setTableView:](v3, "setTableView:", v4);

    -[_UIContainerHuggingTableViewController tableView](v3, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutoresizingMask:", 18);

  }
  return v3;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContainerHuggingTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAncestralContainerView:", v5);

  v7.receiver = self;
  v7.super_class = (Class)_UIContainerHuggingTableViewController;
  -[_UIContainerHuggingTableViewController willMoveToParentViewController:](&v7, sel_willMoveToParentViewController_, v4);

}

@end

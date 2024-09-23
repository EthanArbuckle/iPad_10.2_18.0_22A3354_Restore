@implementation HKTableViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (HKTableViewController)init
{
  HKTableViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKTableViewController;
  result = -[HKTableViewController initWithStyle:](&v3, sel_initWithStyle_, 2);
  if (result)
    result->_useInsetStyling = 1;
  return result;
}

- (HKTableViewController)initWithUsingInsetStyling:(BOOL)a3
{
  uint64_t v4;
  HKTableViewController *result;
  objc_super v6;

  if (a3)
    v4 = 2;
  else
    v4 = 1;
  v6.receiver = self;
  v6.super_class = (Class)HKTableViewController;
  result = -[HKTableViewController initWithStyle:](&v6, sel_initWithStyle_, v4);
  if (result)
    result->_useInsetStyling = a3;
  return result;
}

- (void)viewDidLoad
{
  _BOOL8 useInsetStyling;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKTableViewController;
  -[HKTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  useInsetStyling = self->_useInsetStyling;
  -[HKTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSectionContentInsetFollowsLayoutMargins:", useInsetStyling);

  if (self->_useInsetStyling)
  {
    -[HKTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setSectionCornerRadius:", 10.0);

    -[HKTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setSectionContentInset:", 0.0, 16.0, 20.0, 16.0);

  }
}

@end

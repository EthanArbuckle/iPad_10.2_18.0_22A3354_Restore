@implementation HRWDHealthTableViewController

- (HRWDHealthTableViewController)initWithStyle:(int64_t)a3 profile:(id)a4
{
  id v6;
  HRWDHealthTableViewController *v7;
  HRWDHealthTableViewController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HRWDHealthTableViewController;
  v7 = -[HRWDTableViewController initWithStyle:](&v10, sel_initWithStyle_, a3);
  v8 = v7;
  if (v7)
    -[HRWDTableViewController setProfile:](v7, "setProfile:", v6);

  return v8;
}

@end

@implementation EKUIReadonlyEventViewController

- (EKUIReadonlyEventViewController)initWithEvent:(id)a3
{
  id v4;
  EKUIReadonlyEventViewController *v5;
  EKUIReadonlyEventViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKUIReadonlyEventViewController;
  v5 = -[EKUIReadonlyEventViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[EKEventViewController setNoninteractivePlatterMode:](v5, "setNoninteractivePlatterMode:", 1);
    -[EKEventViewController setEvent:](v6, "setEvent:", v4);
  }

  return v6;
}

- (void)willCommitPreview
{
  -[EKEventViewController setNoninteractivePlatterMode:](self, "setNoninteractivePlatterMode:", 0);
  -[EKEventViewController setAllowsEditing:](self, "setAllowsEditing:", 1);
  -[EKUIReadonlyEventViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (BOOL)wantsManagement
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v8;

  if (-[EKEventViewController noninteractivePlatterMode](self, "noninteractivePlatterMode"))
  {
    -[EKUIReadonlyEventViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "interfaceOrientation");

    return 1 << v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EKUIReadonlyEventViewController;
    return -[EKEventViewController supportedInterfaceOrientations](&v8, sel_supportedInterfaceOrientations);
  }
}

@end

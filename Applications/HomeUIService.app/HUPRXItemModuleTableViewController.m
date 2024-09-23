@implementation HUPRXItemModuleTableViewController

- (void)itemManagerDidFinishUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUPRXItemModuleTableViewController;
  -[HUPRXItemModuleTableViewController itemManagerDidFinishUpdate:](&v13, "itemManagerDidFinishUpdate:", v4);
  v6 = objc_opt_class(HSPCMVVMShellViewController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HUPRXItemModuleTableViewController parentViewController](self, "parentViewController"));
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "itemManagerDidFinishUpdate:", v4);
  }
  else
  {
    v11 = HFLogForCategory(58, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100060004(v12);

  }
}

@end

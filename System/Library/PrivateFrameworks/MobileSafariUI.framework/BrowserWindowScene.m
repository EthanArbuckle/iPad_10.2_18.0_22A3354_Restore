@implementation BrowserWindowScene

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  objc_super v8;

  if (sel_closeActiveTab_ == a3)
  {
    -[BrowserWindowScene _browserController](self, "_browserController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tabController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canCloseTab");

    return v7;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BrowserWindowScene;
    return -[BrowserWindowScene canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_);
  }
}

- (void)closeActiveTab:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BrowserWindowScene _browserController](self, "_browserController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closeActiveTab:", v4);

}

- (id)_browserController
{
  void *v2;
  id v3;

  -[BrowserWindowScene delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

@end

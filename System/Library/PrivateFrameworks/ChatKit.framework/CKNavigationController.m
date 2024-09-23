@implementation CKNavigationController

- (void)viewDidLayoutSubviews
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKNavigationController;
  -[CKNavigationController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  -[CKNavigationController visibleViewController](self, "visibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKNavigationController visibleViewController](self, "visibleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (BOOL)prefersStatusBarHidden
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  -[CKNavigationController visibleViewController](self, "visibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "prefersStatusBarHidden");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKNavigationController;
    v4 = -[CKNavigationController prefersStatusBarHidden](&v7, sel_prefersStatusBarHidden);
  }
  v5 = v4;

  return v5;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  CKNavigationController *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      v13 = 1024;
      v14 = v4;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "navigationController: %@, setting view controllers: %@, animated: %{BOOL}d", buf, 0x1Cu);
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)CKNavigationController;
  -[CKNavigationController setViewControllers:animated:](&v8, sel_setViewControllers_animated_, v6, v4);

}

- (BOOL)shouldAutorotate
{
  void *v2;
  char v3;

  -[CKNavigationController visibleViewController](self, "visibleViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldAutorotate");

  return v3;
}

- (id)preferredFocusEnvironments
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

@implementation UIView(_SFBarItem)

- (void)sf_configureLargeContentViewerWithImage:()_SFBarItem title:
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  objc_msgSend(a1, "setShowsLargeContentViewer:", 1);
  objc_msgSend(a1, "setLargeContentImage:", v6);

  objc_msgSend(a1, "setLargeContentTitle:", v7);
}

- (void)sf_configureLargeContentViewerForBarItem:()_SFBarItem
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "setShowsLargeContentViewer:", 1);
  v5 = (void *)MEMORY[0x1E0DC3870];
  SFSystemImageNameForBarItem(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_systemImageNamed:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLargeContentImage:", v7);

  SFAccessibilityTitleForBarItem(a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLargeContentTitle:", v8);

}

@end

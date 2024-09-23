@implementation DDPreviewNavigationController

- (id)previewActions
{
  void *v2;
  void *v3;

  -[DDPreviewNavigationController visibleViewController](self, "visibleViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "performSelector:withObject:", sel_previewActions, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end

@implementation UITableViewController(HUAdditions)

- (id)hu_actionSheetWithTitle:()HUAdditions message:indexPath:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForRowAtIndexPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(a1, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceView:", v12);

  }
  return v9;
}

- (id)hu_getSelectedCell
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathForSelectedRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForRowAtIndexPath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)hu_shouldScrollToTop
{
  void *v2;
  double v3;
  _BOOL8 v4;

  if (!objc_msgSend(a1, "isViewLoaded"))
    return 1;
  objc_msgSend(a1, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustedContentInset");
  v4 = v3 <= 0.0;

  return v4;
}

@end

@implementation UINavigationItem(MobileSafariFrameworkExtras)

- (BOOL)sf_isEmpty
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "leftBarButtonItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(a1, "rightBarButtonItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "count") == 0;

    }
  }

  return v3;
}

- (uint64_t)_sf_prefersDismissOrDoneButtonOnLeft
{
  return 0;
}

- (id)sf_preferredDismissOrDoneButtonItem
{
  if (objc_msgSend(a1, "_sf_prefersDismissOrDoneButtonOnLeft"))
    objc_msgSend(a1, "leftBarButtonItem");
  else
    objc_msgSend(a1, "rightBarButtonItem");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sf_setPreferredDismissOrDoneButtonItem:()MobileSafariFrameworkExtras
{
  id v4;

  v4 = a3;
  if (objc_msgSend(a1, "_sf_prefersDismissOrDoneButtonOnLeft"))
    objc_msgSend(a1, "setLeftBarButtonItem:", v4);
  else
    objc_msgSend(a1, "setRightBarButtonItem:", v4);

}

@end

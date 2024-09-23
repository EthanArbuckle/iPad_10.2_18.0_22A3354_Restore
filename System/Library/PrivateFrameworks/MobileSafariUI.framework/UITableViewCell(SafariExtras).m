@implementation UITableViewCell(SafariExtras)

- (void)_safari_setLinkedPageTitle:()SafariExtras URL:
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "safari_stringForListDisplay");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_safari_setLinkedPageTitle:description:", v6, v7);

}

- (void)_safari_setLinkedPageTitle:()SafariExtras description:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  objc_msgSend(a1, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineBreakMode:", 4);
  if (v6)
    v8 = v6;
  else
    v8 = v10;
  objc_msgSend(v7, "setText:", v8);

  if (objc_msgSend(a1, "style") == 3)
  {
    objc_msgSend(a1, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 5);
    objc_msgSend(v9, "setText:", v10);

  }
}

@end

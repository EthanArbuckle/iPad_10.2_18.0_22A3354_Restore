@implementation SUUIMoreListController

- (SUUIMoreListController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUUIMoreListController *v4;
  SUUIMoreListController *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIMoreListController;
  v4 = -[SUUIMoreListController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SUUIMoreListController navigationItem](v4, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackButtonTitle:", &stru_2511FF0C8);

  }
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(MEMORY[0x24BEBD768], "instancesRespondToSelector:", a2))
  {
    v11.receiver = self;
    v11.super_class = (Class)SUUIMoreListController;
    -[UIMoreListController tableView:didSelectRowAtIndexPath:](&v11, sel_tableView_didSelectRowAtIndexPath_, v7, v8);
  }
  -[SUUIMoreListController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storeKitDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "moreNavigationController:didSelectItemAtIndex:", v9, objc_msgSend(v8, "row"));

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  if (SUUIAllowsLandscapePhone())
    return 26;
  return 2;
}

@end

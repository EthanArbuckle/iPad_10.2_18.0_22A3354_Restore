@implementation SUUIMenuViewController

- (SUUIMenuViewController)initWithMenuTitles:(id)a3 images:(id)a4
{
  id v6;
  id v7;
  SUUIMenuViewController *v8;
  SUUIMenuViewController *v9;
  uint64_t v10;
  NSArray *menuTitles;
  uint64_t v12;
  NSArray *menuImages;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SUUIMenuViewController;
  v8 = -[SUUIMenuViewController init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_indexOfCheckedTitle = 0x7FFFFFFFFFFFFFFFLL;
    v10 = objc_msgSend(v6, "copy");
    menuTitles = v9->_menuTitles;
    v9->_menuTitles = (NSArray *)v10;

    v12 = objc_msgSend(v7, "copy");
    menuImages = v9->_menuImages;
    v9->_menuImages = (NSArray *)v12;

  }
  return v9;
}

- (SUUIMenuViewController)initWithMenuTitles:(id)a3
{
  return -[SUUIMenuViewController initWithMenuTitles:images:](self, "initWithMenuTitles:images:", a3, 0);
}

- (void)setIndexOfCheckedTitle:(int64_t)a3
{
  int64_t indexOfCheckedTitle;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_indexOfCheckedTitle != a3)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    indexOfCheckedTitle = self->_indexOfCheckedTitle;
    if (indexOfCheckedTitle != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", indexOfCheckedTitle, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v6);

    }
    self->_indexOfCheckedTitle = a3;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v7);

    }
    if (-[SUUIMenuViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SUUIMenuViewController tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadRowsAtIndexPaths:withRowAnimation:", v9, 5);

    }
  }
}

- (void)setMenuStyle:(int64_t)a3
{
  id v3;

  if (self->_menuStyle != a3)
  {
    self->_menuStyle = a3;
    -[SUUIMenuViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsDisplay");

  }
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2 * (self->_menuStyle == 1);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIMenuViewController;
  -[SUUIMenuViewController loadView](&v7, sel_loadView);
  -[SUUIMenuViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("a"));
  objc_msgSend(v3, "setSeparatorStyle:", 0);
  objc_msgSend(v3, "setSemanticContentAttribute:", storeSemanticContentAttribute());
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[SUUIMenuViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_menuTitles, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  SUUITableViewCell *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *menuImages;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGSize v19;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("a"), v6);
  v7 = (SUUITableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[SUUITableViewCell initWithStyle:reuseIdentifier:]([SUUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("a"));
  v8 = objc_msgSend(v6, "row");
  if (v8 == self->_indexOfCheckedTitle)
    v9 = 3;
  else
    v9 = 0;
  -[SUUITableViewCell setAccessoryType:](v7, "setAccessoryType:", v9);
  -[SUUITableViewCell textLabel](v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_menuTitles, "objectAtIndex:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v12);

  menuImages = self->_menuImages;
  if (menuImages)
  {
    -[NSArray objectAtIndex:](menuImages, "objectAtIndex:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19.width = 35.0;
    v19.height = 35.0;
    UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
    objc_msgSend(v14, "drawInRect:", 0.0, 0.0, 35.0, 35.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    -[SUUITableViewCell imageView](v7, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v15);

  }
  if (v8 == -[NSArray count](self->_menuTitles, "count") - 1)
  {
    -[SUUITableViewCell setBottomBorderColor:](v7, "setBottomBorderColor:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUITableViewCell setBottomBorderColor:](v7, "setBottomBorderColor:", v17);

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "menuViewController:didSelectItemAtIndex:", self, objc_msgSend(v6, "row"));

  }
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "backgroundColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (SUUIMenuViewControllerDelegate)delegate
{
  return (SUUIMenuViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)menuTitles
{
  return self->_menuTitles;
}

- (NSArray)menuImages
{
  return self->_menuImages;
}

- (int64_t)indexOfCheckedTitle
{
  return self->_indexOfCheckedTitle;
}

- (int64_t)menuStyle
{
  return self->_menuStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuImages, 0);
  objc_storeStrong((id *)&self->_menuTitles, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

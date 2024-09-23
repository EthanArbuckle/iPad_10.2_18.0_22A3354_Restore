@implementation WFContentItemsViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFContentItemsViewController;
  -[WFContentItemsViewController viewDidLoad](&v5, sel_viewDidLoad);
  WFLocalizedString(CFSTR("Items"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItemsViewController setTitle:](self, "setTitle:", v3);

  -[WFContentItemsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFContentItemCellIdentifier"));

}

- (void)setContentItems:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_contentItems, a3);
  -[WFContentItemsViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_contentItems, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *contentItems;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFContentItemCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  contentItems = self->_contentItems;
  v9 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](contentItems, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessoryType:", 1);
  objc_msgSend(v10, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UIImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v12);

  objc_msgSend(v10, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  WFContentItemViewController *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[NSArray objectAtIndex:](self->_contentItems, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_allowsCoercion)
  {
    v5 = -[WFContentItemViewController initWithContentItem:]([WFContentItemViewController alloc], "initWithContentItem:", v23);
    goto LABEL_5;
  }
  v5 = -[WFContentGraphViewController initWithContentItem:]([WFContentGraphViewController alloc], "initWithContentItem:", v23);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7)
  {
LABEL_5:
    -[WFContentItemsViewController navigationController](self, "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushViewController:animated:", v5, 1);
    goto LABEL_6;
  }
  v8 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  -[WFContentItemsViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  -[WFContentItemsViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15 + 20.0;
  -[WFContentItemViewController view](v5, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", 0.0, 0.0, v12, v16);

  -[WFContentItemViewController view](v5, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAutoresizingMask:", 0);

  objc_msgSend(v8, "addChildViewController:", v5);
  -[WFContentItemViewController didMoveToParentViewController:](v5, "didMoveToParentViewController:", v8);
  objc_msgSend(v8, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItemViewController view](v5, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  -[WFContentItemViewController title](v5, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v21);

  -[WFContentItemsViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pushViewController:animated:", v8, 1);

LABEL_6:
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (BOOL)allowsCoercion
{
  return self->_allowsCoercion;
}

- (void)setAllowsCoercion:(BOOL)a3
{
  self->_allowsCoercion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItems, 0);
}

@end

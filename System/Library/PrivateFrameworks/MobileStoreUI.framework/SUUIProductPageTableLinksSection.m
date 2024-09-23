@implementation SUUIProductPageTableLinksSection

- (SUUIProductPageTableLinksSection)initWithItem:(id)a3 clientContext:(id)a4 askPermission:(BOOL)a5
{
  id v9;
  id v10;
  SUUIProductPageTableLinksSection *v11;
  SUUIProductPageTableLinksSection *v12;
  id *p_item;
  NSMutableArray *v14;
  NSMutableArray *actions;
  NSMutableArray *v16;
  NSMutableArray *titles;
  void *v18;
  void *v19;
  id v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  NSMutableArray *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSMutableArray *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSMutableArray *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  objc_super v75;

  v9 = a3;
  v10 = a4;
  v75.receiver = self;
  v75.super_class = (Class)SUUIProductPageTableLinksSection;
  v11 = -[SUUIProductPageTableLinksSection init](&v75, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_42;
  p_item = (id *)&v11->_item;
  objc_storeStrong((id *)&v11->_item, a3);
  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  actions = v12->_actions;
  v56 = 48;
  v12->_actions = v14;

  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  titles = v12->_titles;
  v12->_titles = v16;

  if (SUUIUserInterfaceIdiom(v10))
  {
    if (a5)
      goto LABEL_42;
    goto LABEL_16;
  }
  objc_msgSend(*p_item, "inAppPurchases");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    +[SUUIProductPageAction actionWithType:](SUUIProductPageAction, "actionWithType:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke;
    v72[3] = &unk_2511F4510;
    v73 = v18;
    v20 = v10;
    v74 = v20;
    objc_msgSend(v19, "setViewControllerBlock:", v72);
    -[NSMutableArray addObject:](v12->_actions, "addObject:", v19);
    v21 = v12->_titles;
    if (v20)
      objc_msgSend(v20, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_TITLE"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_TITLE"), 0, CFSTR("ProductPage"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v21, "addObject:", v22, 48);

  }
  objc_msgSend(*p_item, "releaseNotes", v56);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "count"))
  {
    +[SUUIProductPageAction actionWithType:](SUUIProductPageAction, "actionWithType:", 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_2;
    v69[3] = &unk_2511F4510;
    v70 = v23;
    v25 = v10;
    v71 = v25;
    objc_msgSend(v24, "setViewControllerBlock:", v69);
    objc_msgSend(*(id *)((char *)&v12->super.super.super.isa + v56), "addObject:", v24);
    v26 = v12->_titles;
    if (v25)
      objc_msgSend(v25, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_UPDATE_HISTORY_TITLE"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_UPDATE_HISTORY_TITLE"), 0, CFSTR("ProductPage"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v26, "addObject:", v27);

  }
  if (!a5)
  {
LABEL_16:
    objc_msgSend(v9, "supportURLString", v56);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      +[SUUIProductPageAction actionWithType:](SUUIProductPageAction, "actionWithType:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setURL:", v30);

      objc_msgSend(*(id *)((char *)&v12->super.super.super.isa + v57), "addObject:", v29);
      v31 = v12->_titles;
      if (v10)
        objc_msgSend(v10, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_DEVELOPER_WEBSITE"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_DEVELOPER_WEBSITE"), 0, CFSTR("ProductPage"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v31, "addObject:", v32);

    }
    objc_msgSend(v9, "licenseAgreementURLString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "URLByAppendingQueryParameter:value:", CFSTR("mt"), CFSTR("8"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      +[SUUIProductPageAction actionWithType:](SUUIProductPageAction, "actionWithType:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setURL:", v35);
      v66[0] = MEMORY[0x24BDAC760];
      v66[1] = 3221225472;
      v66[2] = __77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_3;
      v66[3] = &unk_2511F4538;
      v37 = v35;
      v67 = v37;
      v38 = v10;
      v68 = v38;
      objc_msgSend(v36, "setViewControllerBlock:", v66);
      objc_msgSend(*(id *)((char *)&v12->super.super.super.isa + v57), "addObject:", v36);
      v39 = v12->_titles;
      if (v38)
        objc_msgSend(v38, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_LICENSE_AGREEMENT"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_LICENSE_AGREEMENT"), 0, CFSTR("ProductPage"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v39, "addObject:", v40);

    }
    objc_msgSend(v9, "privacyPolicyURLString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      +[SUUIProductPageAction actionWithType:](SUUIProductPageAction, "actionWithType:", 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setURL:", v43);

      objc_msgSend(*(id *)((char *)&v12->super.super.super.isa + v57), "addObject:", v42);
      v44 = v12->_titles;
      if (v10)
        objc_msgSend(v10, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_PRIVACY_POLICY"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_PRIVACY_POLICY"), 0, CFSTR("ProductPage"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v44, "addObject:", v45);

    }
    objc_msgSend(v9, "artistPageURL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      +[SUUIProductPageAction actionWithType:](SUUIProductPageAction, "actionWithType:", 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setURL:", v46);
      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = 3221225472;
      v62[2] = __77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_4;
      v62[3] = &unk_2511F4560;
      v48 = v10;
      v63 = v48;
      v64 = v9;
      v65 = v46;
      objc_msgSend(v47, "setViewControllerBlock:", v62);
      objc_msgSend(*(id *)((char *)&v12->super.super.super.isa + v57), "addObject:", v47);
      v49 = v12->_titles;
      if (v48)
        objc_msgSend(v48, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_DEVELOPER_APPS"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_DEVELOPER_APPS"), 0, CFSTR("ProductPage"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v49, "addObject:", v50);

    }
    objc_msgSend(v9, "developerInfo");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      +[SUUIProductPageAction actionWithType:](SUUIProductPageAction, "actionWithType:", 3);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v10, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_DEVELOPER_INFO"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_DEVELOPER_INFO"), 0, CFSTR("ProductPage"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 3221225472;
      v58[2] = __77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_5;
      v58[3] = &unk_2511F4588;
      v59 = v51;
      v60 = v10;
      v61 = v53;
      v54 = v53;
      objc_msgSend(v52, "setViewControllerBlock:", v58);
      objc_msgSend(*(id *)((char *)&v12->super.super.super.isa + v57), "addObject:", v52);
      -[NSMutableArray addObject:](v12->_titles, "addObject:", v54);

    }
  }
LABEL_42:

  return v12;
}

SUUIViewController *__77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke(uint64_t a1)
{
  SUUIProductPageTableViewController *v2;
  void *v3;
  SUUIViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = -[SUUIProductPageTableViewController initWithInAppPurchases:clientContext:]([SUUIProductPageTableViewController alloc], "initWithInAppPurchases:clientContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  -[SUUIProductPageTableViewController view](v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  v4 = objc_alloc_init(SUUIViewController);
  -[SUUIViewController setClientContext:](v4, "setClientContext:", *(_QWORD *)(a1 + 40));
  -[SUUIViewController addChildViewController:](v4, "addChildViewController:", v2);
  -[SUUIViewController showDefaultNavigationItems](v4, "showDefaultNavigationItems");
  -[SUUIViewController view](v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageTableViewController view](v2, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[SUUIProductPageTableViewController view](v2, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewController view](v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

  return v4;
}

SUUIViewController *__77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_2(uint64_t a1)
{
  SUUIProductPageTableViewController *v2;
  void *v3;
  SUUIViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = -[SUUIProductPageTableViewController initWithReleaseNotes:clientContext:]([SUUIProductPageTableViewController alloc], "initWithReleaseNotes:clientContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  -[SUUIProductPageTableViewController view](v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  v4 = objc_alloc_init(SUUIViewController);
  -[SUUIViewController setClientContext:](v4, "setClientContext:", *(_QWORD *)(a1 + 40));
  -[SUUIViewController addChildViewController:](v4, "addChildViewController:", v2);
  -[SUUIViewController showDefaultNavigationItems](v4, "showDefaultNavigationItems");
  -[SUUIViewController view](v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageTableViewController view](v2, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[SUUIProductPageTableViewController view](v2, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewController view](v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

  return v4;
}

SUUIApplicationLicenseViewController *__77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_3(uint64_t a1)
{
  SUUIApplicationLicenseViewController *v2;

  v2 = -[SUUIApplicationLicenseViewController initWithLicenseAgreementURL:]([SUUIApplicationLicenseViewController alloc], "initWithLicenseAgreementURL:", *(_QWORD *)(a1 + 32));
  -[SUUIViewController setClientContext:](v2, "setClientContext:", *(_QWORD *)(a1 + 40));
  return v2;
}

SUUIStorePageViewController *__77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_4(uint64_t a1)
{
  SUUIStorePageViewController *v2;
  void *v3;

  v2 = objc_alloc_init(SUUIStorePageViewController);
  -[SUUIStorePageViewController setClientContext:](v2, "setClientContext:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "artistName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageViewController setTitle:](v2, "setTitle:", v3);

  -[SUUIStorePageViewController loadURL:withCompletionBlock:](v2, "loadURL:withCompletionBlock:", *(_QWORD *)(a1 + 48), 0);
  return v2;
}

SUUIDeveloperInfoViewController *__77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_5(_QWORD *a1)
{
  SUUIDeveloperInfoViewController *v2;

  v2 = -[SUUIDeveloperInfoViewController initWithDeveloperInfo:]([SUUIDeveloperInfoViewController alloc], "initWithDeveloperInfo:", a1[4]);
  -[SUUIViewController setClientContext:](v2, "setClientContext:", a1[5]);
  -[SUUIDeveloperInfoViewController setTitle:](v2, "setTitle:", a1[6]);
  return v2;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return *MEMORY[0x24BEBE770];
}

- (int64_t)numberOfRowsInSection
{
  return -[NSMutableArray count](self->_titles, "count");
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  return (id)-[NSMutableArray objectAtIndex:](self->_actions, "objectAtIndex:", objc_msgSend(a4, "row", a3));
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  SUUITableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *titles;
  uint64_t v16;
  void *v17;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("LK"));
  v7 = (SUUITableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[SUUITableViewCell initWithStyle:reuseIdentifier:]([SUUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("LK"));
    -[SUUITableViewCell setAccessoryType:](v7, "setAccessoryType:", 1);
    -[SUUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[SUUITableViewCell setBottomBorderColor:](v7, "setBottomBorderColor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUITableViewCell setBottomBorderColor:](v7, "setBottomBorderColor:", v9);

    }
    -[SUUITableViewCell textLabel](v7, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v10, "setTextColor:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextColor:", v13);

    }
  }
  -[SUUITableViewCell textLabel](v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  titles = self->_titles;
  v16 = objc_msgSend(v6, "row");

  -[NSMutableArray objectAtIndex:](titles, "objectAtIndex:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v17);

  return v7;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end

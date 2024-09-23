@implementation FontInstallMissingAppViewController

- (void)viewWillAppear:(BOOL)a3
{
  NSMutableArray *v3;
  NSMutableArray *providers;
  FontInstallMissingAppViewController *v5;
  id v6;
  FontInstallMissingAppViewController *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v13;
  BOOL v14;
  SEL v15;
  FontInstallMissingAppViewController *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FontInstallMissingAppViewController;
  -[FontInstallMissingAppViewController viewWillAppear:](&v13, "viewWillAppear:", a3);
  v5 = v16;
  v6 = -[FontInstallMissingAppViewController tableView](v16, "tableView");
  objc_msgSend(v6, "setDataSource:", v5);

  v7 = v16;
  v8 = -[FontInstallMissingAppViewController tableView](v16, "tableView");
  objc_msgSend(v8, "setDelegate:", v7);

  v9 = -[FontInstallMissingAppViewController tableView](v16, "tableView");
  objc_msgSend(v9, "setEstimatedSectionHeaderHeight:", 100.0);

  v10 = -[FontInstallMissingAppViewController tableView](v16, "tableView");
  objc_msgSend(v10, "setSectionHeaderHeight:", UITableViewAutomaticDimension);

  v11 = -[FontInstallMissingAppViewController tableView](v16, "tableView");
  objc_msgSend(v11, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(UITableViewHeaderFooterView), providerHeaderReuseIdentifier);

  v12 = -[NSMutableDictionary objectForKeyedSubscript:](v16->font, "objectForKeyedSubscript:", CFSTR("providers"));
  v3 = (NSMutableArray *)objc_msgSend(v12, "mutableCopy");
  providers = v16->providers;
  v16->providers = v3;

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  NSMutableDictionary *font;
  NSArray *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location[2];
  FontInstallMissingAppViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = objc_msgSend(v11, "item");
  v9 = -[NSMutableArray objectAtIndexedSubscript:](v13->providers, "objectAtIndexedSubscript:", v10);
  -[NSMutableArray removeObjectAtIndex:](v13->providers, "removeObjectAtIndex:", v10);
  -[NSMutableArray insertObject:atIndex:](v13->providers, "insertObject:atIndex:", v9, 0);
  font = v13->font;
  v7 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v13->providers);
  -[NSMutableDictionary setObject:forKey:](font, "setObject:forKey:");

  v8 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  id location[2];
  FontInstallMissingAppViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[NSMutableArray count](v7->providers, "count");
  objc_storeStrong(location, 0);
  return (int64_t)v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  NSBundle *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13[2];
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13[1] = (id)a4;
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v13[0] = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("PROVIDER_INSTRUCTIONS"), &stru_100014650, 0);

  v12 = objc_msgSend(location[0], "dequeueReusableHeaderFooterViewWithIdentifier:", providerHeaderReuseIdentifier);
  v7 = objc_msgSend(v12, "textLabel");
  objc_msgSend(v7, "setLineBreakMode:");

  v8 = objc_msgSend(v12, "textLabel");
  objc_msgSend(v8, "setNumberOfLines:", 0);

  v9 = v13[0];
  v10 = objc_msgSend(v12, "textLabel");
  objc_msgSend(v10, "setText:", v9);

  v11 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  UIScreen *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  FontInstallMissingAppViewController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("ProviderCell"));
  v14 = -[NSMutableArray objectAtIndexedSubscript:](v18->providers, "objectAtIndexedSubscript:", objc_msgSend(v16, "item"));
  objc_msgSend(v15, "setProviderBundle:", v14);
  v9 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen scale](v9, "scale");
  v8 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v14);
  v7 = objc_msgSend(v15, "imageView");
  objc_msgSend(v7, "setImage:", v8);

  v12 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v14, 0, 0);
  v11 = objc_msgSend(v12, "localizedName");
  v10 = objc_msgSend(v15, "textLabel");
  objc_msgSend(v10, "setText:", v11);

  if (objc_msgSend(v16, "item"))
    v4 = 0;
  else
    v4 = 3;
  objc_msgSend(v15, "setAccessoryType:", v4, a4);
  v13 = v15;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (NSMutableDictionary)font
{
  return self->font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->font, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->font, 0);
  objc_storeStrong((id *)&self->providers, 0);
}

@end

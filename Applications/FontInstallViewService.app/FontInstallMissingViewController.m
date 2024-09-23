@implementation FontInstallMissingViewController

- (void)viewDidLoad
{
  NSMutableArray *v2;
  NSMutableArray *installable;
  NSMutableArray *v4;
  NSMutableArray *notInstallable;
  objc_super v6;
  SEL v7;
  FontInstallMissingViewController *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)FontInstallMissingViewController;
  -[FontInstallMissingViewController viewDidLoad](&v6, "viewDidLoad");
  v2 = objc_opt_new(NSMutableArray);
  installable = v8->installable;
  v8->installable = v2;

  v4 = objc_opt_new(NSMutableArray);
  notInstallable = v8->notInstallable;
  v8->notInstallable = v4;

}

- (void)viewWillAppear:(BOOL)a3
{
  const __CFString *v3;
  const __CFString *v4;
  id v5;
  id v6;
  NSString *v7;
  NSBundle *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSString *v13;
  NSBundle *v14;
  id v15;
  NSString *v16;
  NSString *v17;
  NSBundle *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSString *v25;
  NSBundle *v26;
  id v27;
  NSString *v28;
  NSString *v29;
  NSBundle *v30;
  NSMutableArray *installable;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id WeakRetained;
  id obj;
  id v39;
  FontInstallMissingViewController *v40;
  id v41;
  FontInstallMissingViewController *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id location;
  _QWORD __b[8];
  id v51;
  objc_super v52;
  BOOL v53;
  SEL v54;
  FontInstallMissingViewController *v55;
  _BYTE v56[128];

  v55 = self;
  v54 = a2;
  v53 = a3;
  v52.receiver = self;
  v52.super_class = (Class)FontInstallMissingViewController;
  -[FontInstallMissingViewController viewWillAppear:](&v52, "viewWillAppear:", a3);
  v40 = v55;
  v41 = -[FontInstallMissingViewController tableView](v55, "tableView");
  objc_msgSend(v41, "setDataSource:", v40);

  v42 = v55;
  v43 = -[FontInstallMissingViewController tableView](v55, "tableView");
  objc_msgSend(v43, "setDelegate:", v42);

  v44 = -[FontInstallMissingViewController tableView](v55, "tableView");
  objc_msgSend(v44, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(UITableViewHeaderFooterView), headerReuseIdentifier);

  v45 = -[FontInstallMissingViewController tableView](v55, "tableView");
  objc_msgSend(v45, "setEstimatedSectionHeaderHeight:", 100.0);

  v46 = -[FontInstallMissingViewController tableView](v55, "tableView");
  objc_msgSend(v46, "setSectionHeaderHeight:", UITableViewAutomaticDimension);

  v48 = -[FontInstallMissingViewController navigationController](v55, "navigationController");
  v47 = objc_msgSend(v48, "remoteController");
  objc_storeWeak((id *)&v55->remoteController, v47);

  objc_storeStrong((id *)&v55->output, &__NSArray0__struct);
  if (!-[NSMutableArray count](v55->installable, "count") && !-[NSMutableArray count](v55->notInstallable, "count"))
  {
    memset(__b, 0, sizeof(__b));
    WeakRetained = objc_loadWeakRetained((id *)&v55->remoteController);
    obj = objc_msgSend(WeakRetained, "input");

    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
    if (v39)
    {
      v34 = *(_QWORD *)__b[2];
      v35 = 0;
      v36 = v39;
      while (1)
      {
        v33 = v35;
        if (*(_QWORD *)__b[2] != v34)
          objc_enumerationMutation(obj);
        v51 = *(id *)(__b[1] + 8 * v35);
        location = objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("providers"));
        if (objc_msgSend(location, "count"))
        {
          installable = v55->installable;
          v32 = objc_msgSend(v51, "mutableCopy");
          -[NSMutableArray addObject:](installable, "addObject:");

        }
        else
        {
          -[NSMutableArray addObject:](v55->notInstallable, "addObject:", v51);
        }
        objc_storeStrong(&location, 0);
        ++v35;
        if (v33 + 1 >= (unint64_t)v36)
        {
          v35 = 0;
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
          if (!v36)
            break;
        }
      }
    }

  }
  if (-[NSMutableArray count](v55->installable, "count"))
  {
    v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v7 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("DONT_INSTALL_TITLE"));
    v6 = -[FontInstallMissingViewController navigationItem](v55, "navigationItem");
    v5 = objc_msgSend(v6, "leftBarButtonItem");
    objc_msgSend(v5, "setTitle:", v7);

    v10 = -[FontInstallMissingViewController navigationItem](v55, "navigationItem");
    v9 = objc_msgSend(v10, "leftBarButtonItem");
    objc_msgSend(v9, "setEnabled:", 1);

    v14 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v13 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", CFSTR("DO_INSTALL_TITLE"), &stru_100014650, 0);
    v12 = -[FontInstallMissingViewController navigationItem](v55, "navigationItem");
    v11 = objc_msgSend(v12, "rightBarButtonItem");
    objc_msgSend(v11, "setTitle:", v13);

    v18 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    if (-[NSMutableArray count](v55->installable, "count") == (id)1)
      v4 = CFSTR("INSTALLABLE_DETAIL_TITLE_SINGULAR");
    else
      v4 = CFSTR("INSTALLABLE_DETAIL_TITLE_PLURAL");
    v17 = -[NSBundle localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", v4, &stru_100014650, 0);
    v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
    v15 = -[FontInstallMissingViewController navigationItem](v55, "navigationItem");
    objc_msgSend(v15, "setTitle:", v16);

  }
  else
  {
    v20 = -[FontInstallMissingViewController navigationItem](v55, "navigationItem");
    v19 = objc_msgSend(v20, "leftBarButtonItem");
    objc_msgSend(v19, "setTitle:");

    v22 = -[FontInstallMissingViewController navigationItem](v55, "navigationItem");
    v21 = objc_msgSend(v22, "leftBarButtonItem");
    objc_msgSend(v21, "setEnabled:", 0);

    v26 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v25 = -[NSBundle localizedStringForKey:value:table:](v26, "localizedStringForKey:value:table:", CFSTR("DONE_TITLE"), &stru_100014650);
    v24 = -[FontInstallMissingViewController navigationItem](v55, "navigationItem");
    v23 = objc_msgSend(v24, "rightBarButtonItem");
    objc_msgSend(v23, "setTitle:", v25);

    v30 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    if (-[NSMutableArray count](v55->notInstallable, "count") == (id)1)
      v3 = CFSTR("CANT_INSTALL_DETAIL_TITLE_SINGULAR");
    else
      v3 = CFSTR("CANT_INSTALL_DETAIL_TITLE_PLURAL");
    v29 = -[NSBundle localizedStringForKey:value:table:](v30, "localizedStringForKey:value:table:", v3, &stru_100014650, 0);
    v28 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
    v27 = -[FontInstallMissingViewController navigationItem](v55, "navigationItem");
    objc_msgSend(v27, "setTitle:", v28);

  }
}

- (void)dismissViewWithMissingFonts:(id)a3
{
  id location[2];
  FontInstallMissingViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->output, location[0]);
  -[FontInstallMissingViewController dismissViewControllerAnimated:completion:](v4, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  FontInstallMissingViewController *v3;
  id WeakRetained;
  id v5;
  BOOL v6;
  objc_super v7;
  BOOL v8;
  SEL v9;
  FontInstallMissingViewController *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v5 = -[FontInstallMissingViewController navigationController](self, "navigationController");
  v3 = (FontInstallMissingViewController *)objc_msgSend(v5, "topViewController");
  v6 = v3 != v10;

  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v10->remoteController);
    objc_msgSend(WeakRetained, "doneWithMissingFonts:withDismissAnimated:", v10->output, 0);

  }
  v7.receiver = v10;
  v7.super_class = (Class)FontInstallMissingViewController;
  -[FontInstallMissingViewController viewDidDisappear:](&v7, "viewDidDisappear:", v8);
}

- (void)doInstall:(id)a3
{
  NSMutableArray *v3;
  NSDictionary *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSMutableArray *obj;
  id v13;
  _QWORD __b[8];
  id v15;
  NSMutableArray *v16;
  id location[2];
  FontInstallMissingViewController *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _BYTE v21[128];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = objc_opt_new(NSMutableArray);
  memset(__b, 0, sizeof(__b));
  obj = v18->installable;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
  if (v13)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v13;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v15 = *(id *)(__b[1] + 8 * v10);
      v3 = v16;
      v19[0] = CFSTR("uniqueID");
      v7 = objc_msgSend(v15, "objectForKeyedSubscript:");
      v20[0] = v7;
      v19[1] = CFSTR("installProvider");
      v6 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("providers"));
      v5 = objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v20[1] = v5;
      v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      -[NSMutableArray addObject:](v3, "addObject:");

      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        v10 = 0;
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
        if (!v11)
          break;
      }
    }
  }

  -[FontInstallMissingViewController dismissViewWithMissingFonts:](v18, "dismissViewWithMissingFonts:", v16);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)doNotInstall:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v5[15];
  char v6;
  id v7;
  id location[2];
  FontInstallMissingViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = &_os_log_default;
  v6 = 2;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
  {
    log = v7;
    type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "MissingFonts doNotInstall", v5, 2u);
  }
  objc_storeStrong(&v7, 0);
  -[FontInstallMissingViewController dismissViewWithMissingFonts:](v9, "dismissViewWithMissingFonts:", &__NSArray0__struct);
  objc_storeStrong(location, 0);
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = v10;
  v8 = objc_msgSend(location[0], "destinationViewController");
  v5 = objc_msgSend(v9, "font");
  objc_msgSend(v8, "setFont:");

  v7 = objc_msgSend(v9, "font");
  v6 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("displayName"));
  objc_msgSend(v8, "setTitle:");

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)unwindSegue:(id)a3
{
  id v3;
  id location[2];
  FontInstallMissingViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[FontInstallMissingViewController tableView](v5, "tableView");
  objc_msgSend(v3, "reloadData");

  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  _BOOL8 v4;
  _BOOL8 v5;
  id location[2];
  FontInstallMissingViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[NSMutableArray count](v7->installable, "count") != 0;
  v4 = -[NSMutableArray count](v7->notInstallable, "count") != 0;
  objc_storeStrong(location, 0);
  return v5 + v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  id location[2];
  FontInstallMissingViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = a4;
  v6 = 0;
  if (!-[NSMutableArray count](v9->installable, "count"))
    v7 = a4 + 1;
  if (v7)
  {
    if (v7 == 1)
      v6 = -[NSMutableArray count](v9->notInstallable, "count");
  }
  else
  {
    v6 = -[NSMutableArray count](v9->installable, "count");
  }
  objc_storeStrong(location, 0);
  return (int64_t)v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  id v9;
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  NSBundle *v14;
  NSBundle *v15;
  id v17;
  __CFString *v18;
  int64_t v19;
  id location[2];
  FontInstallMissingViewController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  v18 = &stru_100014650;
  if (!-[NSMutableArray count](v21->installable, "count"))
    ++v19;
  if (v19)
  {
    if (v19 == 1)
    {
      v14 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v6 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", CFSTR("NOT_INSTALLABLE_HEADER"), &stru_100014650, 0);
      v7 = v18;
      v18 = v6;

    }
  }
  else
  {
    v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v4 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("INSTALLABLE_HEADER"), &stru_100014650, 0);
    v5 = v18;
    v18 = v4;

  }
  v17 = objc_msgSend(location[0], "dequeueReusableHeaderFooterViewWithIdentifier:", headerReuseIdentifier);
  v9 = objc_msgSend(v17, "textLabel");
  objc_msgSend(v9, "setLineBreakMode:");

  v10 = objc_msgSend(v17, "textLabel");
  objc_msgSend(v10, "setNumberOfLines:", 0);

  v11 = v18;
  v12 = objc_msgSend(v17, "textLabel");
  objc_msgSend(v12, "setText:", v11);

  v13 = v17;
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSString *v13;
  NSString *v14;
  NSBundle *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  UIScreen *v20;
  id v21;
  id v22;
  id v23;
  BOOL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char *v30;
  id v31;
  id v32;
  id location[2];
  FontInstallMissingViewController *v34;

  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = 0;
  objc_storeStrong(&v32, a4);
  v31 = 0;
  v30 = (char *)objc_msgSend(v32, "section");
  if (!-[NSMutableArray count](v34->installable, "count"))
    ++v30;
  if (v30)
  {
    if (v30 == (char *)1)
    {
      v4 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("CannotInstall"));
      v5 = v31;
      v31 = v4;

      v10 = -[NSMutableArray objectAtIndexedSubscript:](v34->notInstallable, "objectAtIndexedSubscript:", objc_msgSend(v32, "item"));
      v9 = objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("displayName"));
      v8 = objc_msgSend(v31, "textLabel");
      objc_msgSend(v8, "setText:", v9);

    }
  }
  else
  {
    v29 = -[NSMutableArray objectAtIndexedSubscript:](v34->installable, "objectAtIndexedSubscript:", objc_msgSend(v32, "item"));
    v28 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("Installable"));
    objc_msgSend(v28, "setFont:", v29);
    v17 = objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("displayName"));
    v16 = objc_msgSend(v28, "fontName");
    objc_msgSend(v16, "setText:", v17);

    v27 = objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("providers"));
    v26 = objc_msgSend(v27, "objectAtIndexedSubscript:");
    v20 = +[UIScreen mainScreen](UIScreen, "mainScreen");
    -[UIScreen scale](v20, "scale");
    v19 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v26);
    v18 = objc_msgSend(v28, "providerIcon");
    objc_msgSend(v18, "setImage:", v19);

    v23 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v26, 0, 0);
    v22 = objc_msgSend(v23, "localizedName");
    v21 = objc_msgSend(v28, "providerName");
    objc_msgSend(v21, "setText:", v22);

    v25 = (unint64_t)objc_msgSend(v27, "count") > 1;
    objc_msgSend(v28, "setAccessoryType:", v25);
    if (v25)
    {
      v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v14 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("PROVIDER_COUNT"), &stru_100014650, 0);
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, (char *)objc_msgSend(v27, "count") - 1);
      v12 = objc_msgSend(v28, "providerCount");
      objc_msgSend(v12, "setText:", v13);

    }
    else
    {
      v11 = objc_msgSend(v28, "providerCount");
      objc_msgSend(v11, "setText:", &stru_100014650);

    }
    objc_storeStrong(&v31, v28);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  v7 = v31;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  int v6;
  id v7;
  id v8;
  char *v9;
  id v10;
  id location[2];
  FontInstallMissingViewController *v12;
  char v13;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = (char *)objc_msgSend(v10, "section");
  if (!-[NSMutableArray count](v12->installable, "count"))
    ++v9;
  if (v9)
  {
    v13 = 0;
  }
  else
  {
    v8 = -[NSMutableArray objectAtIndexedSubscript:](v12->installable, "objectAtIndexedSubscript:", objc_msgSend(v10, "item"));
    v7 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("providers"));
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v6 = 0;
    }
    else
    {
      v13 = 0;
      v6 = 1;
    }
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
    if (!v6)
      v13 = 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v13 & 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->remoteController);
  objc_storeStrong((id *)&self->output, 0);
  objc_storeStrong((id *)&self->notInstallable, 0);
  objc_storeStrong((id *)&self->installable, 0);
}

@end

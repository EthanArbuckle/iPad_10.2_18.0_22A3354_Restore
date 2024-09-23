@implementation RecoverDeviceMenuViewController

- (void)initOptions:(int)a3
{
  char v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[RecoverDeviceMenuViewController setOptions:](self, "setOptions:", v5);

  if ((v3 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController options](self, "options"));
    objc_msgSend(v6, "addObject:", &off_10001DB78);

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        return;
LABEL_7:
      v8 = (id)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController options](self, "options"));
      objc_msgSend(v8, "addObject:", &off_10001DBA8);

      return;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController options](self, "options"));
  objc_msgSend(v7, "addObject:", &off_10001DB90);

  if ((v3 & 4) != 0)
    goto LABEL_7;
}

- (RecoverDeviceMenuViewController)initWithOptions:(int)a3 forDevice:(id)a4
{
  uint64_t v4;
  id v6;
  RecoverDeviceMenuViewController *v7;
  RecoverDeviceMenuViewController *v8;
  void *v9;
  UIView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)RecoverDeviceMenuViewController;
  v7 = -[RecoverDeviceMenuViewController initWithStyle:](&v26, "initWithStyle:", 0);
  v8 = v7;
  if (v7)
  {
    -[RecoverDeviceMenuViewController setDeviceType:](v7, "setDeviceType:", v6);
    -[RecoverDeviceMenuViewController initOptions:](v8, "initOptions:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController tableView](v8, "tableView"));
    objc_msgSend(v9, "setAllowsSelection:", 1);

    v10 = objc_opt_new(UIView);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController tableView](v8, "tableView"));
    objc_msgSend(v11, "setTableFooterView:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController tableView](v8, "tableView"));
    objc_msgSend(v12, "setSectionFooterHeight:", 1.0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController tableView](v8, "tableView"));
    objc_msgSend(v14, "setBackgroundColor:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController tableView](v8, "tableView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
    objc_msgSend(v16, "setCornerRadius:", 10.0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController tableView](v8, "tableView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
    objc_msgSend(v17, "selectRowAtIndexPath:animated:scrollPosition:", v18, 0, 1);

    v19 = objc_alloc((Class)UIImageView);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle.fill")));
    v21 = objc_msgSend(v19, "initWithImage:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController tableView](v8, "tableView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "cellForRowAtIndexPath:", v23));
    objc_msgSend(v24, "setAccessoryView:", v21);

  }
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController options](self, "options", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)titleForOption:(int)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  switch(a3)
  {
    case 4:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MENU_REBOOT_BUTTON_TITLE");
      break;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MENU_EACS_BUTTON_TITLE");
      break;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MENU_SYSTEM_RECOVERY_BUTTON_TITLE");
      break;
    default:
      v6 = CFSTR("unknown");
      return v6;
  }
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10001C720, 0));

  return v6;
}

- (id)subtitleForOption:(int)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  __CFString *v9;

  switch(a3)
  {
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController deviceType](self, "deviceType"));
      v6 = (void *)v5;
      v7 = CFSTR("MENU_REBOOT_BUTTON_SUBTITLE");
      break;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController deviceType](self, "deviceType"));
      v6 = (void *)v5;
      v7 = CFSTR("MENU_EACS_BUTTON_SUBTITLE");
      break;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController deviceType](self, "deviceType"));
      v6 = (void *)v5;
      v7 = CFSTR("SYSTEM_RECOVERY_SUBTITLE");
      break;
    default:
      v9 = CFSTR("unknown option");
      return v9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v7, v5));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v8, &stru_10001C720, 0));

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  char *v24;
  void *v25;
  char *v26;
  double v27;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));
  v8 = objc_msgSend(v7, "intValue");

  v9 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration subtitleCellConfiguration](UIListContentConfiguration, "subtitleCellConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController titleForOption:](self, "titleForOption:", v8));
  objc_msgSend(v10, "setText:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textProperties"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "font"));
  objc_msgSend(v13, "pointSize");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textProperties"));
  objc_msgSend(v15, "setFont:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController subtitleForOption:](self, "subtitleForOption:", v8));
  objc_msgSend(v10, "setSecondaryText:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "secondaryTextProperties"));
  objc_msgSend(v18, "setColor:", v17);

  objc_msgSend(v10, "setTextToSecondaryTextVerticalPadding:", 6.0);
  objc_msgSend(v10, "setDirectionalLayoutMargins:", 10.0, 10.0, 10.0, 10.0);
  objc_msgSend(v9, "setContentConfiguration:", v10);
  v19 = objc_alloc((Class)UIImageView);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circle")));
  v21 = objc_msgSend(v19, "initWithImage:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  objc_msgSend(v21, "setTintColor:", v22);

  objc_msgSend(v9, "setAccessoryView:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration"));
  objc_msgSend(v9, "setBackgroundConfiguration:", v23);

  v24 = (char *)objc_msgSend(v5, "row");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController options](self, "options"));
  v26 = (char *)objc_msgSend(v25, "count") - 1;

  if (v24 == v26)
  {
    objc_msgSend(v9, "bounds");
    objc_msgSend(v9, "setSeparatorInset:", 0.0, v27, 0.0, 0.0);
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)UIImageView);
  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle.fill")));
  v8 = objc_msgSend(v7, "initWithImage:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v5));

  objc_msgSend(v9, "setAccessoryView:", v8);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController tableView](self, "tableView"));
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathsForSelectedRows"));

  if (!v9)
  {
    v9 = objc_opt_new(NSMutableArray);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController options](self, "options"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = 0;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v12, 0));
        -[NSMutableArray addObject:](v9, "addObject:", v13);

        ++v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController options](self, "options"));
        v15 = objc_msgSend(v14, "count");

      }
      while (v12 < (unint64_t)v15);
    }
  }
  v16 = objc_alloc((Class)UIImageView);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circle")));
  v18 = objc_msgSend(v16, "initWithImage:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  objc_msgSend(v18, "setTintColor:", v19);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = v9;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v26 = objc_msgSend(v25, "row", (_QWORD)v30);
        if (v26 != objc_msgSend(v7, "row"))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController tableView](self, "tableView"));
          objc_msgSend(v27, "deselectRowAtIndexPath:animated:", v25, 1);

          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v25));
          objc_msgSend(v28, "setAccessoryView:", v18);

        }
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v22);
  }

  return v7;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  return 0;
}

- (int)selectedOption
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceMenuViewController tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForSelectedRow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));
  v7 = objc_msgSend(v6, "intValue");

  return v7;
}

- (NSMutableArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_deviceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end

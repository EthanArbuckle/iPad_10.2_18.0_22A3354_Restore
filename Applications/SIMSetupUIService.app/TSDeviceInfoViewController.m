@implementation TSDeviceInfoViewController

- (TSDeviceInfoViewController)initWithOptions:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  TSDeviceInfoViewController *v23;
  TSDeviceInfoViewController *v24;
  uint64_t v25;
  NSMutableArray *sortedInfo;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _QWORD v38[4];
  _BYTE v39[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = TSUserInfoEidKey;
  v29 = TSUserInfoImeiKey;
  v38[0] = TSUserInfoEidKey;
  v38[1] = TSUserInfoImeiKey;
  v30 = TSUserInfoImei2Key;
  v38[2] = TSUserInfoImei2Key;
  v38[3] = TSUserInfoMeidKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 4));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", v10));
        v12 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0 && objc_msgSend(v11, "length"))
        {
          v37[0] = v10;
          v37[1] = v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
          -[NSMutableArray addObject:](v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v7);
  }

  if (-[NSMutableArray count](v4, "count") == (id)1
    || (v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle")),
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DEVICE_INFO_TITLE"), &stru_10001CAA0, CFSTR("Localizable"))), v14, !v15))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", v28));
    v18 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    {
      if (objc_msgSend(v17, "length"))
        v15 = CFSTR("EID");
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", v29));

    v20 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0 && objc_msgSend(v19, "length"))
      v15 = CFSTR("IMEI");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", v30));

    v22 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0 && objc_msgSend(v21, "length"))
      v15 = CFSTR("IMEI2");

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  v32.receiver = self;
  v32.super_class = (Class)TSDeviceInfoViewController;
  v23 = -[TSDeviceInfoViewController initWithTitle:detailText:icon:](&v32, "initWithTitle:detailText:icon:", v15, 0, 0);
  v24 = v23;
  if (v23)
  {
    v23->_singleItemFlow = v16;
    v25 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));
    sortedInfo = v24->_sortedInfo;
    v24->_sortedInfo = (NSMutableArray *)v25;

  }
  return v24;
}

- (void)_doneButtonTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIBarButtonItem *v19;
  UIBarButtonItem *doneButton;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  _BOOL8 singleItemFlow;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)TSDeviceInfoViewController;
  -[TSDeviceInfoViewController viewDidLoad](&v38, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v3);

  v6 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[TSDeviceInfoViewController setTableView:](self, "setTableView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setRowHeight:", UITableViewAutomaticDimension);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setEstimatedRowHeight:", 0.0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setAllowsMultipleSelection:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v11, "setBackgroundColor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v13, "setDataSource:", self);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v14, "setDelegate:", self);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v15, "setScrollEnabled:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v16, "setEditing:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v17, "setAllowsSelection:", 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v18, "setSeparatorStyle:", 0);

  if (self->_singleItemFlow)
  {
    v19 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_doneButtonTapped");
    doneButton = self->_doneButton;
    self->_doneButton = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v21, "setLeftBarButtonItem:animated:", self->_doneButton, 1);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v22, "reloadData");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "heightAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v25, "contentSize");
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:", v26));
  -[TSDeviceInfoViewController setHeightAnchor:](self, "setHeightAnchor:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController heightAnchor](self, "heightAnchor"));
  objc_msgSend(v28, "setActive:", 1);

  singleItemFlow = self->_singleItemFlow;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "centerYAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerYAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));
  objc_msgSend(v34, "setActive:", singleItemFlow);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController navigationController](self, "navigationController"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "navigationBar"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v36, "setBackgroundColor:", v37);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v3, "reloadData");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController view](self, "view"));
  objc_msgSend(v4, "layoutIfNeeded");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController heightAnchor](self, "heightAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoViewController tableView](self, "tableView"));
  objc_msgSend(v6, "contentSize");
  objc_msgSend(v5, "setConstant:", v7);

  v8.receiver = self;
  v8.super_class = (Class)TSDeviceInfoViewController;
  -[TSDeviceInfoViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v26;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_sortedInfo, "objectAtIndex:", a4));
  v6 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v7, "setFont:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  objc_msgSend(v9, "setLineBreakMode:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  objc_msgSend(v10, "setNumberOfLines:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  objc_msgSend(v11, "setTextAlignment:", 1);

  if (self->_singleItemFlow)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v13, v26);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    v16 = (void *)TSUserInfoEidKey;

    if (v15 == v16)
    {
      v23 = CFSTR("EID");
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
      v18 = (void *)TSUserInfoImeiKey;

      if (v17 == v18)
      {
        v23 = CFSTR("IMEI");
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
        v20 = (void *)TSUserInfoImei2Key;

        if (v19 == v20)
        {
          v23 = CFSTR("IMEI2");
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
          v22 = (void *)TSUserInfoMeidKey;

          if (v21 == v22)
            v23 = CFSTR("MEID");
          else
            v23 = 0;
        }
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v23, v13);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v12, "setText:", v24);

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)-[NSMutableArray count](self->_sortedInfo, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 100.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  TSDeviceInfoCell *v6;
  NSMutableArray *sortedInfo;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  CGAffineTransform v30;
  CGAffineTransform v31;

  v5 = a4;
  v6 = -[TSDeviceInfoCell initWithStyle:reuseIdentifier:]([TSDeviceInfoCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("deviceInfo"));
  sortedInfo = self->_sortedInfo;
  v8 = objc_msgSend(v5, "section");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](sortedInfo, "objectAtIndex:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICode128BarcodeGenerator")));
  objc_msgSend(v12, "setDefaults");
  objc_msgSend(v12, "setValue:forKey:", v11, CFSTR("inputMessage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell contentView](v6, "contentView"));
  objc_msgSend(v13, "bounds");
  v15 = v14 * 6.0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "outputImage"));
  objc_msgSend(v16, "extent");
  v18 = v15 / v17;

  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, v18, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "outputImage"));
  v30 = v31;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageByApplyingTransform:", &v30));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell imageView](v6, "imageView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCIImage:](UIImage, "imageWithCIImage:", v20));
  objc_msgSend(v21, "setImage:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell imageView](v6, "imageView"));
  objc_msgSend(v23, "setContentMode:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell imageView](v6, "imageView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell contentView](v6, "contentView"));
  objc_msgSend(v25, "bounds");
  v27 = v26 * 0.5;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TSDeviceInfoCell imageView](v6, "imageView"));
  objc_msgSend(v28, "center");
  objc_msgSend(v24, "setCenter:", v27);

  return v6;
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_sortedInfo, 0);
}

@end

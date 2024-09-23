@implementation SWCViewController

- (id)selectedItem
{
  return self->_selectedDict;
}

- (void)setCredentials:(id)a3
{
  id v4;
  UITableView *table;
  id obj;

  v4 = a3;
  obj = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v4);

  objc_msgSend(obj, "sortUsingSelector:", "compareCredentialDictionaryAscending:");
  objc_storeStrong((id *)&self->_credentials, obj);
  table = self->_table;
  if (table)
    -[UITableView reloadData](table, "reloadData");

}

- (void)_enableTable
{
  -[UITableView setUserInteractionEnabled:](self->_table, "setUserInteractionEnabled:", 1);
}

- (id)tableView
{
  UITableView *table;
  UITableView *v4;
  UITableView *v5;
  UITableView *v6;
  void *v7;

  table = self->_table;
  if (!table)
  {
    v4 = (UITableView *)objc_alloc_init((Class)UITableView);
    v5 = self->_table;
    self->_table = v4;

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_table, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setAutoresizingMask:](self->_table, "setAutoresizingMask:", 0);
    v6 = self->_table;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[UITableView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UITableView setSeparatorStyle:](self->_table, "setSeparatorStyle:", 0);
    table = self->_table;
  }
  -[UITableView sizeToFit](table, "sizeToFit");
  return self->_table;
}

- (void)loadView
{
  id v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t value;
  CFTypeRef v10;
  BOOL v11;
  CFTypeID v12;
  void *v13;
  double Height;
  void *v15;
  void *v16;
  NSDictionary *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  _OWORD bytes[2];
  __CFString *CFErrorWithXPCObject;
  CFTypeRef cf;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  CGRect v46;

  v3 = objc_alloc_init((Class)UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v3, "addSubview:", v4);
  CFErrorWithXPCObject = 0;
  memset(bytes, 0, sizeof(bytes));
  v5 = sub_1000037E8(5u, (CFTypeRef *)&CFErrorWithXPCObject);
  if (!v5)
  {
    v10 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  xpc_dictionary_set_data(v5, "client", bytes, 0x20uLL);
  v7 = sub_1000035BC(v6, (CFTypeRef *)&CFErrorWithXPCObject);
  if (v7)
  {
    v8 = v7;
    cf = 0;
    value = xpc_dictionary_get_value(v7, "error");
    if (value)
    {
      CFErrorWithXPCObject = (__CFString *)SecCreateCFErrorWithXPCObject(value);
LABEL_13:
      v10 = 0;
LABEL_14:
      xpc_release(v8);
      goto LABEL_15;
    }
    v11 = sub_100003174(v8, &cf, &CFErrorWithXPCObject);
    v10 = cf;
    if (v11)
    {
      if (!cf)
        goto LABEL_14;
      v12 = CFGetTypeID(cf);
      if (v12 == CFArrayGetTypeID())
        goto LABEL_14;
    }
    else if (!cf)
    {
      goto LABEL_13;
    }
    CFRelease(v10);
    goto LABEL_13;
  }
  v10 = 0;
LABEL_15:
  xpc_release(v6);
LABEL_16:
  if (CFErrorWithXPCObject)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedDescription](CFErrorWithXPCObject, "localizedDescription"));
    NSLog(CFSTR("Unable to get accounts: %@"), v13);

  }
  -[SWCViewController setCredentials:](self, "setCredentials:", v10);
  if (v10)
    CFRelease(v10);
  Height = 45.0;
  objc_msgSend(v4, "setFrame:", 0.0, 0.0, 300.0, 45.0);
  objc_msgSend(v4, "layoutIfNeeded");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleCells"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));

  if (v16)
  {
    objc_msgSend(v16, "frame");
    Height = CGRectGetHeight(v46);
  }
  v17 = _NSDictionaryOfVariableBindings(CFSTR("table"), v4, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if ((unint64_t)-[NSMutableArray count](self->_credentials, "count") < 3)
  {
    if (-[NSMutableArray count](self->_credentials, "count") == (id)2)
    {
      v42 = CFSTR("height");
      Height = Height + Height;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Height));
      v43 = v31;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[table]|"), 0, v21, v18));
      objc_msgSend(v3, "addConstraints:", v32);

      v33 = CFSTR("V:|[table(height)]-|");
    }
    else
    {
      v40 = CFSTR("height");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Height));
      v41 = v34;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[table]|"), 0, v21, v18));
      objc_msgSend(v3, "addConstraints:", v35);

      v33 = CFSTR("V:|[table(height)]|");
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v33, 0, v21, v18));
    objc_msgSend(v3, "addConstraints:", v36);

    -[SWCViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0, Height);
    objc_msgSend(v4, "setScrollEnabled:", 0);
  }
  else
  {
    v19 = fmax(Height * 2.0 + 30.0, 120.0);
    v44 = CFSTR("height");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
    v45 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[table]-|"), 0, v21, v18));
    objc_msgSend(v3, "addConstraints:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[table(height)]-|"), 0, v21, v18));
    objc_msgSend(v3, "addConstraints:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v24, "scale");
    v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
    objc_msgSend(v27, "setBorderWidth:", 1.0 / v26);

    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor opaqueSeparatorColor](UIColor, "opaqueSeparatorColor")));
    v29 = objc_msgSend(v28, "CGColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
    objc_msgSend(v30, "setBorderColor:", v29);

    -[SWCViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0, v19 + 20.0);
  }

  -[SWCViewController setView:](self, "setView:", v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSIndexPath *v6;
  NSIndexPath *selectedCell;
  void *v8;
  void *v9;
  objc_super v10;
  _OWORD v11[2];
  void *v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_credentials, "objectAtIndex:", 0));
  objc_storeStrong((id *)&self->_selectedDict, v5);
  v6 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
  selectedCell = self->_selectedCell;
  self->_selectedCell = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView cellForRowAtIndexPath:](self->_table, "cellForRowAtIndexPath:", self->_selectedCell));
  objc_msgSend(v8, "setTicked:", 1);
  objc_msgSend(v8, "layoutSubviews");
  -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_table, "selectRowAtIndexPath:animated:scrollPosition:", self->_selectedCell, 0, 1);
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  if (!sub_1000038A0(v11, (uint64_t)v5, (CFTypeRef *)&v12))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
    NSLog(CFSTR("Unable to select item: %@"), v9);

  }
  v10.receiver = self;
  v10.super_class = (Class)SWCViewController;
  -[SWCViewController viewWillAppear:](&v10, "viewWillAppear:", v3);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)-[NSMutableArray count](self->_credentials, "count", a3, a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSIndexPath *v6;
  id v7;
  void *v8;
  void *v9;
  NSIndexPath *selectedCell;
  NSIndexPath *v11;
  void *v12;
  _OWORD v13[2];
  void *v14;

  v6 = (NSIndexPath *)a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_credentials, "objectAtIndex:", -[NSIndexPath row](v6, "row")));
  objc_storeStrong((id *)&self->_selectedDict, v8);
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  if (!sub_1000038A0(v13, (uint64_t)v8, (CFTypeRef *)&v14))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
    NSLog(CFSTR("Unable to select item: %@"), v9);

  }
  selectedCell = self->_selectedCell;
  self->_selectedCell = v6;
  v11 = v6;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v11));
  objc_msgSend(v12, "setTicked:", 1);
  objc_msgSend(v12, "layoutSubviews");

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", a4));
  objc_msgSend(v4, "setTicked:", 0);
  objc_msgSend(v4, "layoutSubviews");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSIndexPath *v5;
  void *v6;
  SWCItemCell *v7;

  v5 = (NSIndexPath *)a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_credentials, "objectAtIndex:", -[NSIndexPath row](v5, "row")));
  v7 = -[SWCItemCell initWithDictionary:]([SWCItemCell alloc], "initWithDictionary:", v6);
  if ((unint64_t)-[NSMutableArray count](self->_credentials, "count") < 3
    || (-[SWCItemCell setShowSeparator:](v7, "setShowSeparator:", 1), !-[NSIndexPath row](v5, "row")))
  {
    -[SWCItemCell setShowTopSeparator:](v7, "setShowTopSeparator:", 1);
  }
  -[SWCItemCell setTicked:](v7, "setTicked:", self->_selectedCell == v5);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCell, 0);
  objc_storeStrong((id *)&self->_selectedDict, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_middleLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end

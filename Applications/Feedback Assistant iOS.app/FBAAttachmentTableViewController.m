@implementation FBAAttachmentTableViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  FBAAttachmentTableViewController *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)FBAAttachmentTableViewController;
  -[FBAAttachmentTableViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ADD_FILES"), &stru_1000EA660, 0));
  -[FBAAttachmentTableViewController setTitle:](self, "setTitle:", v4);

  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "dismiss:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAAttachmentTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAAttachmentTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("extensionCell"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAAttachmentTableViewController devicesController](self, "devicesController"));
  if (v8)
  {
    -[FBAAttachmentTableViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 1);
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x3032000000;
    v16 = sub_100041640;
    v17 = sub_100041650;
    v18 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAAttachmentTableViewController devicesController](v18, "devicesController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentDeviceBugSession"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100041658;
    v12[3] = &unk_1000E7888;
    v12[4] = buf;
    objc_msgSend(v10, "listDiagnosticExtensionsWithCompletion:", v12);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No attachment manager dismissing view", buf, 2u);
    }

    -[FBAAttachmentTableViewController dismiss:](self, "dismiss:", self);
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAAttachmentTableViewController extensions](self, "extensions", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("extensionCell"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAAttachmentTableViewController extensions](self, "extensions"));
  v9 = objc_msgSend(v6, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  if (v11)
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  else
    v12 = CFSTR("-");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v13, "setText:", v12);

  if (v11)
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v15, "setTextColor:", v14);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAAttachmentTableViewController extensions](self, "extensions"));
  v7 = objc_msgSend(v5, "row");

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAAttachmentTableViewController devicesController](self, "devicesController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentDeviceAttachmentManager"));
  objc_msgSend(v9, "gatherFilesWithDedExtension:answers:", v10, &__NSDictionary0__struct);

  -[FBAAttachmentTableViewController dismiss:](self, "dismiss:", self);
}

- (void)dismiss:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FBAAttachmentTableViewController parentViewController](self, "parentViewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (FBKDeviceDiagnosticsController)devicesController
{
  return self->_devicesController;
}

- (void)setDevicesController:(id)a3
{
  objc_storeStrong((id *)&self->_devicesController, a3);
}

- (NSArray)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_devicesController, 0);
}

@end

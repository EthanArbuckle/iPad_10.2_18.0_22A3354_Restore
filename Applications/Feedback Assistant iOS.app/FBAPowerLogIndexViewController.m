@implementation FBAPowerLogIndexViewController

+ (BOOL)canDisplayURL:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pathExtension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("plsql"));

  return v5;
}

- (void)setPowerLogURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  -[FBAPowerLogIndexViewController setLogURL:](self, "setLogURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController logURL](self, "logURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

  v7 = objc_alloc((Class)PLDatabaseReader);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController logURL](self, "logURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v10 = objc_msgSend(v7, "initWithDatabaseFile:", v9);
  -[FBAPowerLogIndexViewController setDatabaseReader:](self, "setDatabaseReader:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController databaseReader](self, "databaseReader"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tableNamesFromDatabase"));
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = &__NSArray0__struct;
  -[FBAPowerLogIndexViewController setTableNames:](self, "setTableNames:", v14);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController tableView](self, "tableView"));
  objc_msgSend(v15, "reloadData");

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBAPowerLogIndexViewController;
  -[FBAPowerLogIndexViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  if (!-[FBAPowerLogIndexViewController enteringDetail](self, "enteringDetail"))
    -[FBAPowerLogIndexViewController setDatabaseReader:](self, "setDatabaseReader:", 0);
  -[FBAPowerLogIndexViewController setEnteringDetail:](self, "setEnteringDetail:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBAPowerLogIndexViewController;
  -[FBAPowerLogIndexViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  -[FBAPowerLogIndexViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setRowHeight:", UITableViewAutomaticDimension);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setEstimatedRowHeight:", 80.0);

  -[FBAPowerLogIndexViewController setEnteringDetail:](self, "setEnteringDetail:", 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController tableNames](self, "tableNames", a3, a4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController tableNames](self, "tableNames"));
    v7 = objc_msgSend(v6, "count");

  }
  else
  {
    v7 = 0;
  }

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("TextCell"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController tableNames](self, "tableNames"));
  v9 = objc_msgSend(v6, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" ")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("POWER_LOG_SECTION"), &stru_1000EA660, 0));

  return v5;
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "destinationViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSelectedRow"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController tableNames](self, "tableNames"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "row")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" ")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navigationItem"));
  objc_msgSend(v10, "setTitle:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAPowerLogIndexViewController databaseReader](self, "databaseReader"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValueOfTable:", v8));
  objc_msgSend(v13, "displayText:", v12);

  -[FBAPowerLogIndexViewController setEnteringDetail:](self, "setEnteringDetail:", 1);
}

- (NSURL)logURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PLDatabaseReader)databaseReader
{
  return (PLDatabaseReader *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDatabaseReader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)tableNames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTableNames:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)enteringDetail
{
  return self->_enteringDetail;
}

- (void)setEnteringDetail:(BOOL)a3
{
  self->_enteringDetail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong((id *)&self->_databaseReader, 0);
  objc_storeStrong((id *)&self->_logURL, 0);
}

@end

@implementation FBKPowerLogIndexViewController

+ (BOOL)canDisplayURL:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  -[FBKPowerLogIndexViewController setLogURL:](self, "setLogURL:", a3);
  -[FBKPowerLogIndexViewController logURL](self, "logURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKPowerLogIndexViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

  v7 = objc_alloc((Class)getPLDatabaseReaderClass());
  -[FBKPowerLogIndexViewController logURL](self, "logURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithDatabaseFile:", v9);
  -[FBKPowerLogIndexViewController setDatabaseReader:](self, "setDatabaseReader:", v10);

  -[FBKPowerLogIndexViewController databaseReader](self, "databaseReader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableNamesFromDatabase");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = v12;
  else
    v14 = MEMORY[0x24BDBD1A8];
  -[FBKPowerLogIndexViewController setTableNames:](self, "setTableNames:", v14);

  -[FBKPowerLogIndexViewController tableView](self, "tableView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadData");

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBKPowerLogIndexViewController;
  -[FBKPowerLogIndexViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (!-[FBKPowerLogIndexViewController enteringDetail](self, "enteringDetail"))
    -[FBKPowerLogIndexViewController setDatabaseReader:](self, "setDatabaseReader:", 0);
  -[FBKPowerLogIndexViewController setEnteringDetail:](self, "setEnteringDetail:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBKPowerLogIndexViewController;
  -[FBKPowerLogIndexViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[FBKPowerLogIndexViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  -[FBKPowerLogIndexViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 1);
  v4 = *MEMORY[0x24BEBE770];
  -[FBKPowerLogIndexViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRowHeight:", v4);

  -[FBKPowerLogIndexViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEstimatedRowHeight:", 80.0);

  -[FBKPowerLogIndexViewController setEnteringDetail:](self, "setEnteringDetail:", 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[FBKPowerLogIndexViewController tableNames](self, "tableNames", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[FBKPowerLogIndexViewController tableNames](self, "tableNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("TextCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKPowerLogIndexViewController tableNames](self, "tableNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("POWER_LOG_SECTION"), &stru_24E15EAF8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

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

  objc_msgSend(a3, "destinationViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKPowerLogIndexViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKPowerLogIndexViewController tableNames](self, "tableNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v9);

  -[FBKPowerLogIndexViewController databaseReader](self, "databaseReader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValueOfTable:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayText:", v12);

  -[FBKPowerLogIndexViewController setEnteringDetail:](self, "setEnteringDetail:", 1);
}

- (NSURL)logURL
{
  return (NSURL *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setLogURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (PLDatabaseReader)databaseReader
{
  return (PLDatabaseReader *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setDatabaseReader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (NSArray)tableNames
{
  return (NSArray *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setTableNames:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1040);
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

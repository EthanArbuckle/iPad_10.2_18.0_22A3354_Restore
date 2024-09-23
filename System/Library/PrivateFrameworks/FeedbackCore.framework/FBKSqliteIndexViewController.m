@implementation FBKSqliteIndexViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBKSqliteIndexViewController;
  -[FBKSqliteIndexViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[FBKSqliteIndexViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  -[FBKSqliteIndexViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 1);
  -[FBKSqliteIndexViewController setTableNames:](self, "setTableNames:", MEMORY[0x24BDBD1A8]);
  -[FBKSqliteIndexViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("FBKTableNameCell"));

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FBKSqliteIndexViewController;
  -[FBKSqliteIndexViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  FBKSqliteReader *v7;
  void *v8;
  FBKSqliteReader *v9;
  NSObject *v10;
  _QWORD block[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FBKSqliteIndexViewController;
  -[FBKSqliteIndexViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  -[FBKSqliteIndexViewController dbUrl](self, "dbUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSqliteIndexViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

  v7 = [FBKSqliteReader alloc];
  -[FBKSqliteIndexViewController dbUrl](self, "dbUrl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FBKSqliteReader initWithFile:](v7, "initWithFile:", v8);
  -[FBKSqliteIndexViewController setReader:](self, "setReader:", v9);

  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__FBKSqliteIndexViewController_viewWillAppear___block_invoke;
  block[3] = &unk_24E156D78;
  block[4] = self;
  dispatch_async(v10, block);

}

void __47__FBKSqliteIndexViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "reader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTableNames:", v3);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__FBKSqliteIndexViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_24E156D78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __47__FBKSqliteIndexViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

+ (BOOL)canDisplayURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a1) = objc_msgSend(a1, "canDisplayExtension:strict:", v5, 0);
  return (char)a1;
}

+ (id)dbUrlForMetadataUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v4 = a3;
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "canDisplayExtension:strict:", v6, 1))
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend(v4, "URLByDeletingPathExtension");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (id)v8;
      objc_msgSend(a1, "removeWalShm:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v9, "URLByAppendingPathExtension:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v13, 0);

        if (v14)
        {
          v9 = v11;
          v7 = v9;
        }
        else
        {
          v7 = 0;
          v9 = v11;
        }
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)canDisplayExtension:(id)a3 strict:(BOOL)a4
{
  id v5;
  void *v6;

  if (a4)
    return objc_msgSend(&unk_24E18D670, "containsObject:", a3);
  v5 = a1;
  objc_msgSend(a1, "removeWalShm:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "canDisplayExtension:strict:", v6, 1);

  return (char)v5;
}

+ (id)removeWalShm:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-wal"), &stru_24E15EAF8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-shm"), &stru_24E15EAF8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  -[FBKSqliteIndexViewController tableNames](self, "tableNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[FBKSqliteIndexViewController reader](self, "reader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "csvRepresentationForTable:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBKBugFormAttachmentPreview textFileForString:withFileName:](FBKBugFormAttachmentPreview, "textFileForString:withFileName:", v8, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE8F668], "interactionControllerWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setAnnotation:", v5);

  objc_msgSend(v10, "presentPreviewAnimated:", 1);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[FBKSqliteIndexViewController tableNames](self, "tableNames", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("FBKTableNameCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSqliteIndexViewController tableNames](self, "tableNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  return v7;
}

- (void)documentInteractionControllerDidEndPreview:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBKSqliteIndexViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1);
}

- (CGRect)documentInteractionControllerRectForPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a3;
  -[FBKSqliteIndexViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)documentInteractionControllerViewForPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[FBKSqliteIndexViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSURL)dbUrl
{
  return self->_dbUrl;
}

- (void)setDbUrl:(id)a3
{
  objc_storeStrong((id *)&self->_dbUrl, a3);
}

- (NSArray)tableNames
{
  return (NSArray *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setTableNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (FBKSqliteReader)reader
{
  return (FBKSqliteReader *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setReader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong((id *)&self->_dbUrl, 0);
}

@end

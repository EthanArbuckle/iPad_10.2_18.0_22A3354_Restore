@implementation FBASqliteIndexViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBASqliteIndexViewController;
  -[FBASqliteIndexViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  -[FBASqliteIndexViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 1);
  -[FBASqliteIndexViewController setTableNames:](self, "setTableNames:", &__NSArray0__struct);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController tableView](self, "tableView"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("FBATableNameCell"));

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FBASqliteIndexViewController;
  -[FBASqliteIndexViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  FBASqliteReader *v7;
  void *v8;
  FBASqliteReader *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  _QWORD block[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FBASqliteIndexViewController;
  -[FBASqliteIndexViewController viewWillAppear:](&v13, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController dbUrl](self, "dbUrl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

  v7 = [FBASqliteReader alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController dbUrl](self, "dbUrl"));
  v9 = -[FBASqliteReader initWithFile:](v7, "initWithFile:", v8);
  -[FBASqliteIndexViewController setReader:](self, "setReader:", v9);

  global_queue = dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043964;
  block[3] = &unk_1000E61B8;
  block[4] = self;
  dispatch_async(v11, block);

}

+ (BOOL)canDisplayURL:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pathExtension"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

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
  unsigned int v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));

  if (objc_msgSend(a1, "canDisplayExtension:strict:", v6, 1))
  {
    v7 = v4;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByDeletingPathExtension"));
    if (v8)
    {
      v9 = (id)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "removeWalShm:", v6));
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathExtension:", v10));

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
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
    return objc_msgSend(&off_1000EEAF0, "containsObject:", a3);
  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "removeWalShm:", a3));
  LOBYTE(v5) = objc_msgSend(v5, "canDisplayExtension:strict:", v6, 1);

  return (char)v5;
}

+ (id)removeWalShm:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-wal"), &stru_1000EA660));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-shm"), &stru_1000EA660));

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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController tableNames](self, "tableNames"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController reader](self, "reader"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "csvRepresentationForTable:", v11));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBABugFormAttachmentPreview textFileForString:withFileName:](FBABugFormAttachmentPreview, "textFileForString:withFileName:", v8, v11));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDocumentInteractionController interactionControllerWithURL:](UIDocumentInteractionController, "interactionControllerWithURL:", v9));
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setAnnotation:", v5);

  objc_msgSend(v10, "presentPreviewAnimated:", 1);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController tableNames](self, "tableNames", a3, a4));
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

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("FBATableNameCell"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController tableNames](self, "tableNames"));
  v9 = objc_msgSend(v6, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v11, "setText:", v10);

  return v7;
}

- (void)documentInteractionControllerDidEndPreview:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotation"));

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotation"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForRowAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageView"));
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteIndexViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotation"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForRowAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageView"));

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
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTableNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (FBASqliteReader)reader
{
  return (FBASqliteReader *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong((id *)&self->_dbUrl, 0);
}

@end

@implementation FBABugFormFileBrowserTableViewController

- (FBABugFormFileBrowserTableViewController)initWithGroup:(id)a3
{
  id v4;
  FBABugFormFileBrowserTableViewController *v5;
  FBABugFormFileBrowserTableViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBABugFormFileBrowserTableViewController;
  v5 = -[FBABugFormFileBrowserTableViewController init](&v8, "init");
  v6 = v5;
  if (v5)
    -[FBABugFormFileBrowserTableViewController setGroup:](v5, "setGroup:", v4);

  return v6;
}

- (FBABugFormFileBrowserTableViewController)initWithUrl:(id)a3
{
  id v4;
  FBABugFormFileBrowserTableViewController *v5;
  FBABugFormFileBrowserTableViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBABugFormFileBrowserTableViewController;
  v5 = -[FBABugFormFileBrowserTableViewController init](&v8, "init");
  v6 = v5;
  if (v5)
    -[FBABugFormFileBrowserTableViewController setUrl:](v5, "setUrl:", v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FBABugFormFileBrowserTableViewController;
  -[FBABugFormFileBrowserTableViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController group](self, "group"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController group](self, "group"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
    -[FBABugFormFileBrowserTableViewController setTitle:](self, "setTitle:", v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController url](self, "url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    -[FBABugFormFileBrowserTableViewController setTitle:](self, "setTitle:", v8);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController url](self, "url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, &__NSArray0__struct, 4, 0));
    -[FBABugFormFileBrowserTableViewController setDirectoryList:](self, "setDirectoryList:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("DEFileCell"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController group](self, "group", a3, a4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController group](self, "group"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attachmentItems"));
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController directoryList](self, "directoryList"));
    v8 = objc_msgSend(v6, "count");
  }

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("DEFileCell"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController group](self, "group"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController group](self, "group"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attachmentItems"));
    v11 = objc_msgSend(v6, "row");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName"));
    if (objc_msgSend(v12, "isLocal"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attachedPath"));
      v15 = +[FBKFileManager isDirectory:](FBKFileManager, "isDirectory:", v14) ^ 1;

    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController directoryList](self, "directoryList"));
    v17 = objc_msgSend(v6, "row");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v17));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
    v15 = +[FBKFileManager isDirectory:](FBKFileManager, "isDirectory:", v12) ^ 1;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v18, "setText:", v13);

  objc_msgSend(v7, "setAccessoryType:", 1);
  if (v15)
    v19 = &FBKSystemImageNamePaper;
  else
    v19 = &FBKSystemImageNameFolder;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", *v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageView"));
  objc_msgSend(v21, "setImage:", v20);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController group](self, "group"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController group](self, "group"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attachmentItems"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

    v10 = objc_claimAutoreleasedReturnValue(+[FBAAttachmentViewingControllerSelector controllerForItem:](FBAAttachmentViewingControllerSelector, "controllerForItem:", v9));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController directoryList](self, "directoryList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

    v10 = objc_claimAutoreleasedReturnValue(+[FBAAttachmentViewingControllerSelector controllerForUrl:](FBAAttachmentViewingControllerSelector, "controllerForUrl:", v9));
  }
  v12 = (void *)v10;

  if (v12)
  {
    v13 = objc_opt_class(UIDocumentInteractionController);
    isKindOfClass = objc_opt_isKindOfClass(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if ((isKindOfClass & 1) != 0)
    {
      if (v16)
        sub_1000993E0(v15, v17, v18, v19, v20, v21, v22, v23);

      v24 = v12;
      -[NSObject setDelegate:](v24, "setDelegate:", self);
      -[NSObject setAnnotation:](v24, "setAnnotation:", v5);
      -[NSObject presentPreviewAnimated:](v24, "presentPreviewAnimated:", 1);
    }
    else
    {
      if (v16)
        sub_100099410(v15, v17, v18, v19, v20, v21, v22, v23);

      v24 = objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController navigationController](self, "navigationController"));
      -[NSObject pushViewController:animated:](v24, "pushViewController:animated:", v12, 1);
    }
  }
  else
  {
    v24 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1000993A4(v24);
  }

}

- (void)documentInteractionControllerDidEndPreview:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController tableView](self, "tableView"));
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController tableView](self, "tableView"));
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormFileBrowserTableViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotation"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForRowAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageView"));

  return v8;
}

- (DEDAttachmentGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSArray)directoryList
{
  return self->_directoryList;
}

- (void)setDirectoryList:(id)a3
{
  objc_storeStrong((id *)&self->_directoryList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryList, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end

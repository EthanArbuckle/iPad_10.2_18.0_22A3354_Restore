@implementation FBKBugFormFileBrowserTableViewController

- (FBKBugFormFileBrowserTableViewController)initWithGroup:(id)a3
{
  id v4;
  FBKBugFormFileBrowserTableViewController *v5;
  FBKBugFormFileBrowserTableViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKBugFormFileBrowserTableViewController;
  v5 = -[FBKBugFormFileBrowserTableViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[FBKBugFormFileBrowserTableViewController setGroup:](v5, "setGroup:", v4);

  return v6;
}

- (FBKBugFormFileBrowserTableViewController)initWithUrl:(id)a3
{
  id v4;
  FBKBugFormFileBrowserTableViewController *v5;
  FBKBugFormFileBrowserTableViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKBugFormFileBrowserTableViewController;
  v5 = -[FBKBugFormFileBrowserTableViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[FBKBugFormFileBrowserTableViewController setUrl:](v5, "setUrl:", v4);

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
  v11.super_class = (Class)FBKBugFormFileBrowserTableViewController;
  -[FBKBugFormFileBrowserTableViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[FBKBugFormFileBrowserTableViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  -[FBKBugFormFileBrowserTableViewController group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FBKBugFormFileBrowserTableViewController group](self, "group");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormFileBrowserTableViewController setTitle:](self, "setTitle:", v6);
  }
  else
  {
    -[FBKBugFormFileBrowserTableViewController url](self, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormFileBrowserTableViewController setTitle:](self, "setTitle:", v8);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormFileBrowserTableViewController url](self, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, MEMORY[0x24BDBD1A8], 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormFileBrowserTableViewController setDirectoryList:](self, "setDirectoryList:", v9);

  }
  -[FBKBugFormFileBrowserTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("DEFileCell"));

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
  int64_t v8;

  -[FBKBugFormFileBrowserTableViewController group](self, "group", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FBKBugFormFileBrowserTableViewController group](self, "group");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    -[FBKBugFormFileBrowserTableViewController directoryList](self, "directoryList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "count");
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString **v19;
  void *v20;
  void *v21;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("DEFileCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormFileBrowserTableViewController group](self, "group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FBKBugFormFileBrowserTableViewController group](self, "group");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attachmentItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "row");

    objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isLocal"))
    {
      objc_msgSend(v12, "attachedPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = !+[FBKFileManager isDirectory:](FBKFileManager, "isDirectory:", v14);

    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    -[FBKBugFormFileBrowserTableViewController directoryList](self, "directoryList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "row");

    objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = !+[FBKFileManager isDirectory:](FBKFileManager, "isDirectory:", v12);
  }

  objc_msgSend(v7, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v13);

  objc_msgSend(v7, "setAccessoryType:", 1);
  if (v15)
    v19 = FBKSystemImageNamePaper;
  else
    v19 = FBKSystemImageNameFolder;
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", *v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
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
  void *v10;
  void *v11;
  char isKindOfClass;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;

  v5 = a4;
  -[FBKBugFormFileBrowserTableViewController group](self, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FBKBugFormFileBrowserTableViewController group](self, "group");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[FBKAttachmentViewingControllerSelector controllerForItem:](FBKAttachmentViewingControllerSelector, "controllerForItem:", v9);
  }
  else
  {
    -[FBKBugFormFileBrowserTableViewController directoryList](self, "directoryList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[FBKAttachmentViewingControllerSelector controllerForUrl:](FBKAttachmentViewingControllerSelector, "controllerForUrl:", v9);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    +[FBKLog appHandle](FBKLog, "appHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if ((isKindOfClass & 1) != 0)
    {
      if (v14)
        -[FBKBugFormFileBrowserTableViewController tableView:didSelectRowAtIndexPath:].cold.2(v13, v15, v16, v17, v18, v19, v20, v21);

      v22 = v11;
      -[NSObject setDelegate:](v22, "setDelegate:", self);
      -[NSObject setAnnotation:](v22, "setAnnotation:", v5);
      -[NSObject presentPreviewAnimated:](v22, "presentPreviewAnimated:", 1);
    }
    else
    {
      if (v14)
        -[FBKBugFormFileBrowserTableViewController tableView:didSelectRowAtIndexPath:].cold.3(v13, v15, v16, v17, v18, v19, v20, v21);

      -[FBKBugFormFileBrowserTableViewController navigationController](self, "navigationController");
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject pushViewController:animated:](v22, "pushViewController:animated:", v11, 1);
    }
  }
  else
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[FBKBugFormFileBrowserTableViewController tableView:didSelectRowAtIndexPath:].cold.1(v22);
  }

}

- (void)documentInteractionControllerDidEndPreview:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBKBugFormFileBrowserTableViewController tableView](self, "tableView");
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
  -[FBKBugFormFileBrowserTableViewController tableView](self, "tableView");
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
  -[FBKBugFormFileBrowserTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

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

- (void)tableView:(os_log_t)log didSelectRowAtIndexPath:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "cannot display item", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)tableView:(uint64_t)a3 didSelectRowAtIndexPath:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, a1, a3, "will display document on detail view controller from file browser", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)tableView:(uint64_t)a3 didSelectRowAtIndexPath:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, a1, a3, "will display FBK file controller from file browser", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end

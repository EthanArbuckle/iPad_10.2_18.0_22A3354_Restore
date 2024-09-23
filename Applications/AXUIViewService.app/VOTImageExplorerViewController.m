@implementation VOTImageExplorerViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)VOTImageExplorerViewController;
  -[VOTImageExplorerViewController viewDidLoad](&v35, "viewDidLoad");
  v3 = objc_alloc((Class)UITableView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = objc_msgSend(v3, "initWithFrame:style:", 1);
  -[VOTImageExplorerViewController setTableView:](self, "setTableView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setDataSource:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController tableView](self, "tableView"));
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(VOTImageExplorerImageTableViewCell, v10, v11, v12), CFSTR("ImageExplorerImageCell"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController tableView](self, "tableView"));
  objc_msgSend(v13, "addSubview:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController tableView](self, "tableView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leftAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leftAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController tableView](self, "tableView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "rightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "rightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  objc_msgSend(v24, "setActive:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController tableView](self, "tableView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
  objc_msgSend(v29, "setActive:", 1);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController tableView](self, "tableView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));
  objc_msgSend(v34, "setActive:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VOTImageExplorerViewController;
  -[VOTImageExplorerViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[VOTImageExplorerViewController setupNavigationItems](self, "setupNavigationItems");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[VOTImageExplorerViewController _dismissImageExplorer](self, "_dismissImageExplorer", a3);
}

- (void)setupNavigationItems
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_handleDoneButtonTap:");
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setRightBarButtonItems:", v7);

}

- (void)_handleDoneButtonTap:(id)a3
{
  -[VOTImageExplorerViewController _dismissImageExplorer](self, "_dismissImageExplorer", a3);
}

- (void)_dismissImageExplorer
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController delegate](self, "delegate"));
  objc_msgSend(v3, "imageExplorerViewControllerWillDisappear");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (void)launchImageExplorerFromHostApp:(id)a3 withImage:(id)a4 visionFeatures:(id)a5 data:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  if (objc_msgSend(v18, "length"))
  {
    v13 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.title.with.hostname"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v18));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v16, "setTitle:", v15);

  }
  else
  {
    v17 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v15, "setTitle:", v14);
  }

  -[VOTImageExplorerViewController updateImageExplorerWithImage:features:data:](self, "updateImageExplorerWithImage:features:data:", v12, v11, v10);
}

- (void)updateImageExplorerWithImage:(id)a3 features:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = ((uint64_t (*)(void))VOTLogImageExplorer)();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10001396C(self, (uint64_t)v12, v13, v14);

  v15 = ((uint64_t (*)(void))VOTLogImageExplorer)();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_1000138C0(self, (uint64_t)v16, v17, v18);

  if (v8)
  {
    v19 = -[VOTImageExplorerViewController setImage:](self, "setImage:", v8);
    if (v9)
      goto LABEL_7;
LABEL_12:
    v25 = VOTLogImageExplorer(v19);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      sub_1000137C8((uint64_t)self, (uint64_t)v26, v27, v28);

    if (v10)
      goto LABEL_8;
    goto LABEL_15;
  }
  v21 = ((uint64_t (*)(void))VOTLogImageExplorer)();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    sub_100013844((uint64_t)self, (uint64_t)v22, v23, v24);

  if (!v9)
    goto LABEL_12;
LABEL_7:
  v20 = -[VOTImageExplorerViewController setFeatures:](self, "setFeatures:", v9);
  if (v10)
  {
LABEL_8:
    -[VOTImageExplorerViewController setData:](self, "setData:", v10);
    goto LABEL_18;
  }
LABEL_15:
  v29 = VOTLogImageExplorer(v20);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    sub_10001374C((uint64_t)self, (uint64_t)v30, v31, v32);

LABEL_18:
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController tableView](self, "tableView"));
  objc_msgSend(v33, "reloadData");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;

  v6 = a3;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController data](self, "data"));
    v8 = objc_msgSend(v7, "count");
    v9 = a4 - 1;

    if ((unint64_t)v8 <= v9)
    {
      v13 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController data](self, "data"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v9));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "values"));
      v13 = (int64_t)objc_msgSend(v12, "count");

    }
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  char *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController data](self, "data", a3));
  v4 = (char *)objc_msgSend(v3, "count") + 1;

  return (int64_t)v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController data](self, "data"));
    v8 = objc_msgSend(v7, "count");
    v9 = a4 - 1;

    if ((unint64_t)v8 <= v9)
    {
      v12 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController data](self, "data"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v9));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));

    }
  }
  else
  {
    v13 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.image"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  VOTImageExplorerImageTableViewCell *v9;
  void *v10;
  char *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController tableView](self, "tableView"));
  v8 = v7;
  if (v6)
  {
    v9 = (VOTImageExplorerImageTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("ImageExplorerDetailCell")));

    if (!v9)
      v9 = (VOTImageExplorerImageTableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("ImageExplorerDetailCell"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController data](self, "data"));
    v11 = (char *)objc_msgSend(v10, "count");
    v12 = (char *)objc_msgSend(v5, "section") - 1;

    if (v11 > v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController data](self, "data"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", (char *)objc_msgSend(v5, "section") - 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "values"));

      v16 = objc_msgSend(v15, "count");
      if (v16 > objc_msgSend(v5, "row"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v5, "row")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell textLabel](v9, "textLabel"));
        objc_msgSend(v18, "setText:", v17);

      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell textLabel](v9, "textLabel"));
    objc_msgSend(v19, "setLineBreakMode:", 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell textLabel](v9, "textLabel"));
    objc_msgSend(v20, "setNumberOfLines:", 0);
  }
  else
  {
    v9 = (VOTImageExplorerImageTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("ImageExplorerImageCell")));

    if (!v9)
      v9 = -[VOTImageExplorerImageTableViewCell initWithStyle:reuseIdentifier:]([VOTImageExplorerImageTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("ImageExplorerImageCell"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController image](self, "image"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell explorerImageView](v9, "explorerImageView"));
    objc_msgSend(v22, "setImage:", v21);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageTableViewCell explorerImageView](v9, "explorerImageView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController features](self, "features"));
    objc_msgSend(v20, "setVisionFeatures:", v23);

  }
  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  double v7;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;

  v6 = a3;
  if (!objc_msgSend(a4, "section"))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController image](self, "image"));
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController image](self, "image"));
      objc_msgSend(v11, "size");
      if (v12 <= 0.0)
      {

      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController image](self, "image"));
        objc_msgSend(v13, "size");
        v15 = v14;

        if (v15 > 0.0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController image](self, "image"));
          objc_msgSend(v16, "size");
          v18 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewController image](self, "image"));
          objc_msgSend(v19, "size");
          v21 = v18 / v20;

          objc_msgSend(v6, "frame");
          v7 = v22 / v21;
          goto LABEL_3;
        }
      }
    }
  }
  v7 = UITableViewAutomaticDimension;
LABEL_3:

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 100.0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (VOTImageExplorerViewControllerDelegate)delegate
{
  return (VOTImageExplorerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VOTImageExplorerImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

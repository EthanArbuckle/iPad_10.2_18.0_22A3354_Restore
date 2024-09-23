@implementation FBAOpaqueFileViewController

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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FBAOpaqueFileViewController;
  -[FBAOpaqueFileViewController viewDidLoad](&v23, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController item](self, "item"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController item](self, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController fileNameLabel](self, "fileNameLabel"));
    objc_msgSend(v7, "setText:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController fileNameLabel](self, "fileNameLabel"));
    objc_msgSend(v8, "setNumberOfLines:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController item](self, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileSize"));
    v11 = objc_msgSend(v10, "unsignedLongLongValue");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", v11, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController fileSizeLabel](self, "fileSizeLabel"));
    objc_msgSend(v13, "setText:", v12);

    if (FBKIsInternalInstall() && -[FBAOpaqueFileViewController showsItem](self, "showsItem"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController item](self, "item"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(INTERNAL)\n\n%@"), v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController debugLabel](self, "debugLabel"));
      objc_msgSend(v17, "setText:", v16);

      v18 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "didTapView");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController view](self, "view"));
      objc_msgSend(v19, "addGestureRecognizer:", v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController debugLabel](self, "debugLabel"));
      objc_msgSend(v20, "setAlpha:", 0.0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController debugLabel](self, "debugLabel"));
      objc_msgSend(v21, "setHidden:", 0);

    }
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController fileNameLabel](self, "fileNameLabel"));
    objc_msgSend(v22, "setText:", &stru_1000EA660);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController fileNameLabel](self, "fileNameLabel"));
    objc_msgSend(v12, "setText:", &stru_1000EA660);
  }

}

+ (BOOL)shouldDisplayItem:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "pointsToReachableDir") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attachedPath"));
    if (objc_msgSend(v3, "isLocal")
      && objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0)
      && +[FBKFileManager humansCanReadFile:](FBKFileManager, "humansCanReadFile:", v5))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileSize"));
      v4 = objc_msgSend(v6, "intValue") == 0;

    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

- (BOOL)showsItem
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", FBKShowDEDItem);

  return v3;
}

- (void)didTapView
{
  void *v3;
  double v4;
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOpaqueFileViewController debugLabel](self, "debugLabel"));
  objc_msgSend(v3, "alpha");
  v5 = v4 == 0.0;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015214;
  v6[3] = &unk_1000E6680;
  v7 = v5;
  v6[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.25);
}

- (DEDAttachmentItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (UILabel)debugLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_debugLabel);
}

- (void)setDebugLabel:(id)a3
{
  objc_storeWeak((id *)&self->_debugLabel, a3);
}

- (UILabel)fileNameLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_fileNameLabel);
}

- (void)setFileNameLabel:(id)a3
{
  objc_storeWeak((id *)&self->_fileNameLabel, a3);
}

- (UILabel)fileSizeLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_fileSizeLabel);
}

- (void)setFileSizeLabel:(id)a3
{
  objc_storeWeak((id *)&self->_fileSizeLabel, a3);
}

- (UIImageView)icon
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_icon);
}

- (void)setIcon:(id)a3
{
  objc_storeWeak((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icon);
  objc_destroyWeak((id *)&self->_fileSizeLabel);
  objc_destroyWeak((id *)&self->_fileNameLabel);
  objc_destroyWeak((id *)&self->_debugLabel);
  objc_storeStrong((id *)&self->_item, 0);
}

@end

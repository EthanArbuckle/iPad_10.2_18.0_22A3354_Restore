@implementation FBKOpaqueFileViewController

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
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
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
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)FBKOpaqueFileViewController;
  -[FBKOpaqueFileViewController viewDidLoad](&v32, sel_viewDidLoad);
  -[FBKOpaqueFileViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  -[FBKOpaqueFileViewController item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FBKOpaqueFileViewController item](self, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKOpaqueFileViewController fileNameLabel](self, "fileNameLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[FBKOpaqueFileViewController fileNameLabel](self, "fileNameLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    -[FBKOpaqueFileViewController item](self, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileSize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKOpaqueFileViewController fileSizeLabel](self, "fileSizeLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    if (FBKIsInternalInstall(v14, v15) && -[FBKOpaqueFileViewController showsItem](self, "showsItem"))
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      -[FBKOpaqueFileViewController item](self, "item");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("(INTERNAL)\n\n%@"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKOpaqueFileViewController debugLabel](self, "debugLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v19);

      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_didTapView);
      -[FBKOpaqueFileViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addGestureRecognizer:", v21);

      -[FBKOpaqueFileViewController debugLabel](self, "debugLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAlpha:", 0.0);

      -[FBKOpaqueFileViewController debugLabel](self, "debugLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHidden:", 0);

    }
  }
  else
  {
    -[FBKOpaqueFileViewController fileNameLabel](self, "fileNameLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", &stru_24E15EAF8);

    -[FBKOpaqueFileViewController fileNameLabel](self, "fileNameLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", &stru_24E15EAF8);
  }

  -[FBKOpaqueFileViewController item](self, "item");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isLocal");

  if (v27)
  {
    v28 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("square.and.arrow.up"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithImage:style:target:action:", v29, 0, self, sel_showShareSheet);
    -[FBKOpaqueFileViewController navigationItem](self, "navigationItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setRightBarButtonItem:", v30);

  }
}

- (void)showShareSheet
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE8F650]);
  -[FBKOpaqueFileViewController item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachedPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithActivityItems:applicationActivities:", v6, 0);

  objc_msgSend(v7, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKOpaqueFileViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceItem:", v10);

  -[FBKOpaqueFileViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, &__block_literal_global_32);
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
    objc_msgSend(v3, "attachedPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isLocal")
      && objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0)
      && +[FBKFileManager humansCanReadFile:](FBKFileManager, "humansCanReadFile:", v5))
    {
      objc_msgSend(v3, "fileSize");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("showDEDItem"));

  return v3;
}

- (void)didTapView
{
  void *v3;
  double v4;
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;

  -[FBKOpaqueFileViewController debugLabel](self, "debugLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4 == 0.0;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__FBKOpaqueFileViewController_didTapView__block_invoke;
  v6[3] = &unk_24E158740;
  v7 = v5;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v6, 0.25);
}

void __41__FBKOpaqueFileViewController_didTapView__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fileSizeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "fileNameLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "debugLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1.0;
  }
  else
  {
    objc_msgSend(v3, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "fileNameLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "debugLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0.0;
  }
  v11 = v7;
  objc_msgSend(v7, "setAlpha:", v8);

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

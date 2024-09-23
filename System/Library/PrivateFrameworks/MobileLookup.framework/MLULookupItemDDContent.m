@implementation MLULookupItemDDContent

- (MLULookupItemDDContent)initWithURL:(id)a3 result:(__DDResult *)a4 documentProperties:(id)a5
{
  id v8;
  id v9;
  MLULookupItemDDContent *v10;
  uint64_t v11;
  DDPreviewAction *previewAction;
  DDPreviewAction *v13;
  void *v14;
  DDPreviewNavigationController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v8 = a3;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MLULookupItemDDContent;
  v10 = -[MLULookupItemDDContent init](&v22, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE2B3B0], "previewActionForURL:result:context:", v8, a4, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    previewAction = v10->_previewAction;
    v10->_previewAction = (DDPreviewAction *)v11;

    v13 = v10->_previewAction;
    if (v13)
    {
      -[DDPreviewAction viewController](v13, "viewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (-[DDPreviewAction requiresEmbeddingNavigationController](v10->_previewAction, "requiresEmbeddingNavigationController"))
        {
          v15 = objc_alloc_init(DDPreviewNavigationController);
          -[DDPreviewNavigationController setEdgesForExtendedLayout:](v15, "setEdgesForExtendedLayout:", 1);
          objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[DDPreviewNavigationController view](v15, "view");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setBackgroundColor:", v16);

          objc_msgSend(v14, "setEdgesForExtendedLayout:", 0);
          -[DDPreviewAction platterTitle](v10->_previewAction, "platterTitle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setTitle:", v18);

          -[DDPreviewNavigationController setNavigationBarHidden:](v15, "setNavigationBarHidden:", 0);
          -[DDPreviewNavigationController pushViewController:animated:](v15, "pushViewController:animated:", v14, 0);
          -[MLULookupItemContent setPreviewViewController:](v10, "setPreviewViewController:", v15);

        }
        else
        {
          -[MLULookupItemContent setPreviewViewController:](v10, "setPreviewViewController:", v14);
        }
      }

    }
    -[MLULookupItemContent previewViewController](v10, "previewViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[MLULookupItemContent setValid:](v10, "setValid:", 1);
    }
    else
    {
      -[MLULookupItemDDContent contact](v10, "contact");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLULookupItemContent setValid:](v10, "setValid:", v20 != 0);

    }
  }

  return v10;
}

- (id)commitURL
{
  return (id)-[DDPreviewAction commitURL](self->_previewAction, "commitURL");
}

- (id)contact
{
  return (id)-[DDPreviewAction contact](self->_previewAction, "contact");
}

- (unint64_t)commitType
{
  void *v4;

  if ((-[DDPreviewAction wantsSeamlessCommit](self->_previewAction, "wantsSeamlessCommit") & 1) != 0)
    return 2;
  -[DDPreviewAction commitURL](self->_previewAction, "commitURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 4;
  else
    return 1;
}

- (void)dismissViewController
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MLULookupItemDDContent;
  -[MLULookupItemContent dismissViewController](&v2, sel_dismissViewController);
}

- (void)setupViewControllerInCommitMode
{
  -[DDPreviewAction setPreviewMode:](self->_previewAction, "setPreviewMode:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewAction, 0);
}

@end

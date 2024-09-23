@implementation CSModalViewControllerBase

- (id)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSModalViewControllerBase;
  -[CSModalViewControllerBase view](&v3, sel_view);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)viewIfLoaded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSModalViewControllerBase;
  -[CSModalViewControllerBase viewIfLoaded](&v3, sel_viewIfLoaded);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  -[CSModalViewControllerBase view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase registerView:forRole:](self, "registerView:forRole:", v3, 2);
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setDelegate:", self);
  v8.receiver = self;
  v8.super_class = (Class)CSModalViewControllerBase;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v8, sel_viewDidLoad);

}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CSModalViewControllerBase;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v40, sel_aggregateAppearance_, v4);
  -[CSModalViewControllerBase view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9 && objc_msgSend(v9, "showsDateView"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "priority:", 40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 0;
  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "priority:", 40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 1;
  }
  objc_msgSend(v11, "hidden:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "vibrantAndCentered:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v15);

  +[CSComponent backgroundContent](CSComponent, "backgroundContent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "priority:", 40);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hidden:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v18);

  +[CSComponent pageContent](CSComponent, "pageContent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "priority:", 40);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hidden:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v21);

  +[CSComponent pageControl](CSComponent, "pageControl");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "priority:", 40);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hidden:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v24);

  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "priority:", 40);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "hidden:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "fakeStatusBar:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v28);

  +[CSComponent quickActions](CSComponent, "quickActions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "priority:", 40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hidden:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v31);

  v32 = (void *)objc_opt_new();
  objc_msgSend(v32, "priority:", 40);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "style:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v35);

  CSGetLegibilitySettingsForBackgroundStyle(7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLegibilitySettings:", v36);

  v37 = (void *)objc_opt_new();
  objc_msgSend(v37, "priority:", 40);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "shouldRenderInline:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v39);

}

- (void)aggregateBehavior:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSModalViewControllerBase;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v4, sel_aggregateBehavior_, v3);
  objc_msgSend(v3, "addRestrictedCapabilities:", 130, v4.receiver, v4.super_class);

}

- (int64_t)presentationStyle
{
  return 2;
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 500;
}

- (BOOL)isPortrait
{
  return (unint64_t)(-[CSModalViewControllerBase interfaceOrientation](self, "interfaceOrientation") - 1) < 2;
}

@end

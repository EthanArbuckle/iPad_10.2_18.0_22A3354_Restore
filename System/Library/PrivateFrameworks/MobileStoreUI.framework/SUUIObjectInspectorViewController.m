@implementation SUUIObjectInspectorViewController

+ (void)showInspectableObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  SUUIObjectInspectorViewController *v7;

  v3 = a3;
  v7 = -[SUUIObjectInspectorViewController initWithInspectableObject:]([SUUIObjectInspectorViewController alloc], "initWithInspectableObject:", v3);

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIObjectInspectorViewController showFromViewController:](v7, "showFromViewController:", v6);
}

- (SUUIObjectInspectorViewController)initWithInspectableObject:(id)a3
{
  id v4;
  SUUIObjectInspectorViewController *v5;
  SUUIObjectInspectorViewController *v6;
  id v7;

  v4 = a3;
  v5 = -[SUUIObjectInspectorViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    -[SUUIObjectInspectorViewController setInspectableObject:](v5, "setInspectableObject:", v4);
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[SUUIObjectInspectorViewController setSections:](v6, "setSections:", v7);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
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
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)SUUIObjectInspectorViewController;
  -[SUUIObjectInspectorViewController viewDidLoad](&v37, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
  -[SUUIObjectInspectorViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[SUUIObjectInspectorViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOpaque:", 0);

  v8 = objc_alloc(MEMORY[0x24BEBDB38]);
  objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEffect:", v9);
  -[SUUIObjectInspectorViewController setBackgroundView:](self, "setBackgroundView:", v10);

  -[SUUIObjectInspectorViewController backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleBackgroundTap_);
  objc_msgSend(v11, "addGestureRecognizer:", v12);

  v13 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[SUUIObjectInspectorViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v15 = (void *)objc_msgSend(v13, "initWithFrame:");
  -[SUUIObjectInspectorViewController setContentView:](self, "setContentView:", v15);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v16);

  v18 = objc_alloc(MEMORY[0x24BEBD788]);
  v19 = *MEMORY[0x24BDBF090];
  v20 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v21 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v22 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v23 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x24BDBF090], v20, v21, v22);
  -[SUUIObjectInspectorViewController setNavigationBar:](self, "setNavigationBar:", v23);

  -[SUUIObjectInspectorViewController navigationBar](self, "navigationBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController navigationItem](self, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pushNavigationItem:animated:", v25, 0);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F0]), "initWithFrame:style:", 0, v19, v20, v21, v22);
  -[SUUIObjectInspectorViewController setTableView:](self, "setTableView:", v26);

  -[SUUIObjectInspectorViewController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDataSource:", self);

  -[SUUIObjectInspectorViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDelegate:", self);

  -[SUUIObjectInspectorViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController backgroundView](self, "backgroundView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", v30);

  -[SUUIObjectInspectorViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v32);

  -[SUUIObjectInspectorViewController contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController tableView](self, "tableView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v34);

  -[SUUIObjectInspectorViewController contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController navigationBar](self, "navigationBar");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", v36);

  -[SUUIObjectInspectorViewController setupConstraints](self, "setupConstraints");
  -[SUUIObjectInspectorViewController populate](self, "populate");
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;

  -[SUUIObjectInspectorViewController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SUUIObjectInspectorViewController backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[SUUIObjectInspectorViewController backgroundView](self, "backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[SUUIObjectInspectorViewController backgroundView](self, "backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[SUUIObjectInspectorViewController backgroundView](self, "backgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[SUUIObjectInspectorViewController contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v56 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIObjectInspectorViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leftAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIObjectInspectorViewController contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIObjectInspectorViewController contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIObjectInspectorViewController navigationBar](self, "navigationBar");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SUUIObjectInspectorViewController navigationBar](self, "navigationBar");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v56);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  -[SUUIObjectInspectorViewController navigationBar](self, "navigationBar");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leftAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v26);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[SUUIObjectInspectorViewController navigationBar](self, "navigationBar");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v30);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  -[SUUIObjectInspectorViewController tableView](self, "tableView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SUUIObjectInspectorViewController tableView](self, "tableView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController navigationBar](self, "navigationBar");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

  -[SUUIObjectInspectorViewController tableView](self, "tableView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leftAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v26);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  -[SUUIObjectInspectorViewController tableView](self, "tableView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v28);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  -[SUUIObjectInspectorViewController tableView](self, "tableView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v30);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

}

- (void)handleBackgroundTap:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[SUUIObjectInspectorViewController dismiss](self, "dismiss");
}

- (void)showFromViewController:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  CGAffineTransform v39;
  CGAffineTransform v40;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SUUIObjectInspectorViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[SUUIObjectInspectorViewController backgroundView](self, "backgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", 0.0);

  -[SUUIObjectInspectorViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v4, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIObjectInspectorViewController calculateContentViewFrameWithParentBounds:withTraitCollection:](self, "calculateContentViewFrameWithParentBounds:withTraitCollection:", v25, v18, v20, v22, v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[SUUIObjectInspectorViewController contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  CGAffineTransformMakeScale(&v40, 0.9, 0.9);
  -[SUUIObjectInspectorViewController contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v40;
  objc_msgSend(v35, "setTransform:", &v39);

  -[SUUIObjectInspectorViewController contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAlpha:", 0.0);

  -[SUUIObjectInspectorViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v37);

  objc_msgSend(v4, "addChildViewController:", self);
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __60__SUUIObjectInspectorViewController_showFromViewController___block_invoke;
  v38[3] = &unk_2511F47C0;
  v38[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v38, 0.2);

}

void __60__SUUIObjectInspectorViewController_showFromViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v6[0] = *MEMORY[0x24BDBD8B8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v4, "setTransform:", v6);

}

- (void)dismiss
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__SUUIObjectInspectorViewController_dismiss__block_invoke;
  v3[3] = &unk_2511F47C0;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __44__SUUIObjectInspectorViewController_dismiss__block_invoke_2;
  v2[3] = &unk_2511F4908;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v3, v2, 0.2);
}

void __44__SUUIObjectInspectorViewController_dismiss__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  CGAffineTransformMakeScale(&v6, 0.9, 0.9);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  objc_msgSend(v4, "setTransform:", &v5);

}

void __44__SUUIObjectInspectorViewController_dismiss__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

- (CGRect)calculateContentViewFrameWithParentBounds:(CGRect)a3 withTraitCollection:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v8;
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
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_msgSend(a4, "userInterfaceIdiom");
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v9 = CGRectGetWidth(v19);
  v10 = v9;
  if (v8)
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v11 = CGRectGetHeight(v20);
    if (v10 < v11)
      v11 = v10;
    v12 = round(v11 * 0.8);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v13 = CGRectGetMidX(v21) - v12 * 0.5;
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v14 = CGRectGetMidY(v22) - v12 * 0.5;
    v15 = v12;
  }
  else
  {
    v12 = v9 * 0.95;
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v15 = CGRectGetHeight(v23) * 0.9;
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    v13 = CGRectGetMidX(v24) - v12 * 0.5;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v14 = CGRectGetMidY(v25) - v15 * 0.5;
  }
  v16 = v13;
  v17 = v12;
  v18 = v15;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v14;
  result.origin.x = v16;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __88__SUUIObjectInspectorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_2511F4640;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v4);
}

void __88__SUUIObjectInspectorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "view");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calculateContentViewFrameWithParentBounds:withTraitCollection:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

}

- (void)populate
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  -[SUUIObjectInspectorViewController inspectableObject](self, "inspectableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "populateObjectInspector:", self);

  -[SUUIObjectInspectorViewController friendlyName](self, "friendlyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SUUIObjectInspectorViewController inspectableObject](self, "inspectableObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIObjectInspectorViewController setFriendlyName:](self, "setFriendlyName:", v7);

  }
  -[SUUIObjectInspectorViewController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (void)setFriendlyName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIObjectInspectorViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (NSString)friendlyName
{
  void *v2;
  void *v3;

  -[SUUIObjectInspectorViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setInformation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIObjectInspectorViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrompt:", v4);

}

- (NSString)information
{
  void *v2;
  void *v3;

  -[SUUIObjectInspectorViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prompt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)beginSectionWithFriendlyName:(id)a3
{
  id v5;
  void *v6;
  _SUUIInspectablePropertySection *v7;
  void *v8;
  id v9;

  v5 = a3;
  -[SUUIObjectInspectorViewController currentSection](self, "currentSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUIObjectInspectorViewController.m"), 215, CFSTR("Multiple calls to beginSectionWithFriendlyName: without call to endSection."));

  }
  v7 = objc_alloc_init(_SUUIInspectablePropertySection);
  -[SUUIObjectInspectorViewController setCurrentSection:](self, "setCurrentSection:", v7);

  -[SUUIObjectInspectorViewController currentSection](self, "currentSection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFriendlyName:", v5);

}

- (void)endSection
{
  void *v3;
  void *v4;
  void *v5;

  -[SUUIObjectInspectorViewController currentSection](self, "currentSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUUIObjectInspectorViewController sections](self, "sections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIObjectInspectorViewController currentSection](self, "currentSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    -[SUUIObjectInspectorViewController setCurrentSection:](self, "setCurrentSection:", 0);
  }
}

- (void)exposePropertyWithFriendlyName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _SUUIInspectableProperty *v10;

  v6 = a4;
  v7 = a3;
  v10 = objc_alloc_init(_SUUIInspectableProperty);
  -[_SUUIInspectableProperty setFriendlyName:](v10, "setFriendlyName:", v7);

  -[_SUUIInspectableProperty setValue:](v10, "setValue:", v6);
  -[SUUIObjectInspectorViewController currentSection](self, "currentSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[SUUIObjectInspectorViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[SUUIObjectInspectorViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PropertyReuseIdentifier"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PropertyReuseIdentifier"));
  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[SUUIObjectInspectorViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "friendlyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a5;
  v8 = a4;
  -[SUUIObjectInspectorViewController sections](self, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "row");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "friendlyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(v17, "valueString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setText:", v15);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[SUUIObjectInspectorViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v16, "friendlyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: %@"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setString:", v15);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (SUUIInspectableObject)inspectableObject
{
  return self->_inspectableObject;
}

- (void)setInspectableObject:(id)a3
{
  objc_storeStrong((id *)&self->_inspectableObject, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBar, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (_SUUIInspectablePropertySection)currentSection
{
  return self->_currentSection;
}

- (void)setCurrentSection:(id)a3
{
  objc_storeStrong((id *)&self->_currentSection, a3);
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_currentSection, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_inspectableObject, 0);
}

@end

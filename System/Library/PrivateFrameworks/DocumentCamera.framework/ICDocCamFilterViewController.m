@implementation ICDocCamFilterViewController

- (ICDocCamFilterViewController)init
{
  void *v3;
  ICDocCamFilterViewController *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamFilterViewController;
  v4 = -[ICDocCamFilterViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, CFSTR("ICDocCamFilterViewController"), v3);

  return v4;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ICDocCamFilterViewController;
  -[ICDocCamFilterViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[ICDocCamFilterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[ICDocCamFilterViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 18);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[ICDocCamFilterViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICDocCamFilterViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 0);

  -[ICDocCamFilterViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScrollEnabled:", 0);

  -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICDocCamFilterViewController initializeFilters](self, "initializeFilters");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel_longPressGesture_);
  -[ICDocCamFilterViewController setLongPressGesture:](self, "setLongPressGesture:", v11);

  -[ICDocCamFilterViewController longPressGesture](self, "longPressGesture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[ICDocCamFilterViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterViewController longPressGesture](self, "longPressGesture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addGestureRecognizer:", v14);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICDocCamFilterViewController;
  -[ICDocCamFilterViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)centerContent:(BOOL)a3 isPortrait:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
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
  void *v19;
  double MaxY;
  double v21;
  double v22;
  void *v23;
  id v24;
  CGRect v25;

  if (a3)
  {
    v4 = a4;
    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentSize");
    v8 = v7;
    v10 = v9;

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;

    if (v4)
    {
      v16 = (v13 - v8) * 0.5;
      if (v8 >= v13)
        v16 = 0.0;
      v17 = -v16;
      -[ICDocCamFilterViewController scrollView](self, "scrollView");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setContentOffset:", v17, 0.0);
    }
    else
    {
      if (v10 >= v15)
        v18 = 0.0;
      else
        v18 = (v15 - v10) * 0.5;
      -[ICDocCamFilterViewController navigationController](self, "navigationController");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "navigationBar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      MaxY = CGRectGetMaxY(v25);
      -[ICDocCamFilterViewController bottomContentInset](self, "bottomContentInset");
      v22 = -(v18 - (MaxY - v21) * -0.5);
      -[ICDocCamFilterViewController scrollView](self, "scrollView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setContentOffset:", 0.0, v22);

    }
  }
}

- (void)viewDidLayoutSubviews
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICDocCamFilterViewController;
  -[ICDocCamFilterViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[ICDocCamFilterViewController updateScrollViewContentSize](self, "updateScrollViewContentSize");
  -[ICDocCamFilterViewController updateConstraints](self, "updateConstraints");
  -[ICDocCamFilterViewController setUpScrollView](self, "setUpScrollView");
  v6 = 0;
  v7 = 0;
  -[UIViewController dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:](self, "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v7, &v6);
  v3 = v6 == 0;
  v4 = (unint64_t)(-[UIViewController dc_effectiveInterfaceOrientation](self, "dc_effectiveInterfaceOrientation")
                        - 1) < 2;
  -[ICDocCamFilterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[ICDocCamFilterViewController centerContent:isPortrait:](self, "centerContent:isPortrait:", v3, v4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamFilterViewController;
  v7 = a4;
  -[ICDocCamFilterViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[ICDocCamFilterViewController setTransitioning:](self, "setTransitioning:", 1);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__ICDocCamFilterViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_24C5B7B50;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_7, v8);

}

uint64_t __83__ICDocCamFilterViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "setTransitioning:", 0);
  v5 = 0;
  v6 = 0;
  objc_msgSend(*(id *)(a1 + 32), "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v6, &v5);
  v2 = v5 == 0;
  v3 = (unint64_t)(objc_msgSend(*(id *)(a1 + 32), "dc_effectiveInterfaceOrientation") - 1) < 2;
  objc_msgSend(*(id *)(a1 + 32), "updateConstraints");
  objc_msgSend(*(id *)(a1 + 32), "setUpScrollView");
  return objc_msgSend(*(id *)(a1 + 32), "centerContent:isPortrait:", v2, v3);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamFilterViewController;
  -[ICDocCamFilterViewController dealloc](&v4, sel_dealloc);
}

- (void)prepareToAnimateIn:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v18 = 0;
  v19 = 0;
  -[UIViewController dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:](self, "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v19, &v18);
  if ((DCDebugInterfaceEnabled() & 1) != 0 || ((unint64_t)(v19 - 3) >= 2 ? (v5 = v18 == 1) : (v5 = 1), v5))
  {
    -[ICDocCamFilterViewController contentSize](self, "contentSize");
    -[ICDocCamFilterViewController setHorizontalOffset:](self, "setHorizontalOffset:");
    v7 = 0.0;
  }
  else
  {
    -[ICDocCamFilterViewController setHorizontalOffset:](self, "setHorizontalOffset:", 0.0);
    -[ICDocCamFilterViewController contentSize](self, "contentSize");
    v7 = v6;
  }
  -[ICDocCamFilterViewController setBottomOffset:](self, "setBottomOffset:", v7);
  -[ICDocCamFilterViewController updateConstraints](self, "updateConstraints");
  v8 = (void *)MEMORY[0x24BDF6F90];
  if (v3)
  {
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke;
    v17[3] = &unk_24C5B7AE0;
    v17[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v17);
    -[ICDocCamFilterViewController setHorizontalOffset:](self, "setHorizontalOffset:", 0.0);
    -[ICDocCamFilterViewController setBottomOffset:](self, "setBottomOffset:", 0.0);
    -[ICDocCamFilterViewController updateConstraints](self, "updateConstraints");
    v8 = (void *)MEMORY[0x24BDF6F90];
    v15[4] = self;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_2;
    v16[3] = &unk_24C5B7AE0;
    v16[4] = self;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_3;
    v15[3] = &unk_24C5B7B78;
    v10 = 0.05;
    v11 = v16;
    v12 = v15;
  }
  else
  {
    v13[4] = self;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_4;
    v14[3] = &unk_24C5B7AE0;
    v14[4] = self;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_5;
    v13[3] = &unk_24C5B7B78;
    v10 = 0.15;
    v11 = v14;
    v12 = v13;
  }
  objc_msgSend(v8, "animateWithDuration:animations:completion:", v11, v12, v10);
}

void __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "horizontalLineView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setOpacity:", v4);

  objc_msgSend(*(id *)(a1 + 32), "verticalLineView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1.0;
  objc_msgSend(v5, "setOpacity:", v6);

}

void __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "horizontalLineView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setOpacity:", v4);

  objc_msgSend(*(id *)(a1 + 32), "verticalLineView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1.0;
  objc_msgSend(v5, "setOpacity:", v6);

}

void __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "horizontalLineView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setOpacity:", v4);

  objc_msgSend(*(id *)(a1 + 32), "verticalLineView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setOpacity:", v6);

}

void __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "horizontalLineView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setOpacity:", v4);

  objc_msgSend(*(id *)(a1 + 32), "verticalLineView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setOpacity:", v6);

}

- (void)setBottomContentInset:(double)a3
{
  id v3;

  if (self->_bottomContentInset != a3)
  {
    self->_bottomContentInset = a3;
    -[ICDocCamFilterViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  -[ICDocCamFilterViewController layoutConstraints](self, "layoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1628];
    -[ICDocCamFilterViewController layoutConstraints](self, "layoutConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[ICDocCamFilterViewController setLayoutConstraints:](self, "setLayoutConstraints:", 0);
  }
  -[ICDocCamFilterViewController setScrollViewBottomConstraint:](self, "setScrollViewBottomConstraint:", 0);
  v6 = 0;
  v7 = 0;
  -[UIViewController dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:](self, "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v7, &v6);
  if ((DCDebugInterfaceEnabled() & 1) != 0 || v6 == 1)
    -[ICDocCamFilterViewController updateConstraintsPad](self, "updateConstraintsPad");
  else
    -[ICDocCamFilterViewController updateConstraintsPhone](self, "updateConstraintsPhone");
}

- (void)updateConstraintsPad
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double MaxY;
  double v13;
  double v14;
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
  double v40;
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
  id v52;
  CGRect v53;

  v52 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ICDocCamFilterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[ICDocCamFilterViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = v7;

  v9 = (v5 - v8) * 0.5;
  -[ICDocCamFilterViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  MaxY = CGRectGetMaxY(v53);
  -[ICDocCamFilterViewController bottomContentInset](self, "bottomContentInset");
  v14 = (MaxY - v13) * 0.5;

  -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToConstant:", 128.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:", v17);

  -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterViewController horizontalOffset](self, "horizontalOffset");
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:", v22);

  -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:", v27);

  -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:", v32);

  -[ICDocCamFilterViewController scrollView](self, "scrollView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", 60.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:", v35);

  -[ICDocCamFilterViewController scrollView](self, "scrollView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterViewController horizontalOffset](self, "horizontalOffset");
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, v40 + -34.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:", v41);

  -[ICDocCamFilterViewController scrollView](self, "scrollView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45, v9 + v14);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:", v46);

  -[ICDocCamFilterViewController scrollView](self, "scrollView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50, v14 - v9);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:", v51);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v52);
  -[ICDocCamFilterViewController setLayoutConstraints:](self, "setLayoutConstraints:", v52);

}

- (CGSize)contentSize
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  int v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  CGSize result;

  -[ICDocCamFilterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v17 = 0;
  v18 = 0;
  -[UIViewController dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:](self, "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v18, &v17);
  if ((DCDebugInterfaceEnabled() & 1) != 0 || ((unint64_t)(v18 - 3) >= 2 ? (v8 = v17 == 1) : (v8 = 1), v8))
  {
    v9 = DCDebugInterfaceEnabled();
    if (v17 == 1)
      v10 = 1;
    else
      v10 = v9;
    v11 = 34.0;
    if (!v10)
      v11 = 16.0;
    v12 = v11 * 2.0 + 60.0;
    -[ICDocCamFilterViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dc_directionalSafeAreaInsets");
    v5 = v12 + v14;

  }
  else
  {
    *(double *)&v7 = 100.0;
  }
  v15 = v5;
  v16 = *(double *)&v7;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)updateConstraintsPhone
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
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
  double v30;
  void *v31;
  double v32;
  double v33;
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
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v91 = 0;
  v92 = 0;
  -[UIViewController dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:](self, "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v92, &v91);
  v4 = v92 - 3;
  -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 > 1)
  {
    objc_msgSend(v5, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 100.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v35);

    -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v40);

    -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v45);

    -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController bottomOffset](self, "bottomOffset");
    v51 = v50;
    -[ICDocCamFilterViewController bottomContentInset](self, "bottomContentInset");
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, v51 - v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v53);

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "heightAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToConstant:", 60.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v56);

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v61);

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v66);

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController bottomOffset](self, "bottomOffset");
    v72 = v71;
    -[ICDocCamFilterViewController bottomContentInset](self, "bottomContentInset");
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v70, v72 - (v73 + 28.0));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController setScrollViewBottomConstraint:](self, "setScrollViewBottomConstraint:", v74);

    -[ICDocCamFilterViewController scrollViewBottomConstraint](self, "scrollViewBottomConstraint");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v75);
  }
  else
  {
    objc_msgSend(v5, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dc_directionalSafeAreaInsets");
    objc_msgSend(v7, "constraintEqualToConstant:", v9 + 92.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

    -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController horizontalOffset](self, "horizontalOffset");
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

    -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

    -[ICDocCamFilterViewController backgroundView](self, "backgroundView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v25);

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToConstant:", 60.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v28);

    -[ICDocCamFilterViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dc_directionalSafeAreaInsets");
    if (v30 == 0.0)
    {
      v33 = 16.0;
    }
    else
    {
      -[ICDocCamFilterViewController view](self, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dc_directionalSafeAreaInsets");
      v33 = v32;

    }
    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "trailingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController horizontalOffset](self, "horizontalOffset");
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, v80 - v33);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v81);

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "topAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v86);

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "bottomAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterViewController view](self, "view");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "bottomAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v90);

  }
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3);
  -[ICDocCamFilterViewController setLayoutConstraints:](self, "setLayoutConstraints:", v3);

}

- (void)filterSelected:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id from;
  id location;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ICDocCamFilterViewController currentFilterType](self, "currentFilterType");
  if (v5 != objc_msgSend(v4, "filterType"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v10, "isSelected"))
          {
            v7 = v10;
            objc_msgSend(v7, "setSelected:", 0);
            goto LABEL_12;
          }
        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    objc_msgSend(v4, "setSelected:", 1);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    objc_initWeak(&v16, v7);
    v11 = dispatch_time(0, 50000000);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__ICDocCamFilterViewController_filterSelected___block_invoke;
    v12[3] = &unk_24C5B8490;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    objc_copyWeak(&v15, &v16);
    dispatch_after(v11, MEMORY[0x24BDAC9B8], v12);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

void __47__ICDocCamFilterViewController_filterSelected___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = a1 + 4;
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "filterViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(a1 + 5);
  v6 = objc_msgSend(v4, "filterViewControllerDidSelectFilter:", objc_msgSend(v5, "filterType"));

  v7 = objc_loadWeakRetained(a1 + 5);
  v10 = v7;
  if (v6)
  {
    v8 = objc_msgSend(v7, "filterType");
    v9 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "setCurrentFilterType:", v8);

  }
  else
  {
    objc_msgSend(v7, "setSelected:", 0);

    v10 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v10, "setSelected:", 1);
  }

}

- (void)initializeFilters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;

  -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 0);

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 0);

    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelaysContentTouches:", 0);

    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    for (i = 0; i != 4; ++i)
    {
      +[ICDocCamFilterButton filterButtonWithType:](ICDocCamFilterButton, "filterButtonWithType:", word_20CF292B6[i]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_filterSelected_, 64);
      objc_msgSend(v12, "addObject:", v10);
      -[ICDocCamFilterViewController scrollView](self, "scrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v10);

    }
    -[ICDocCamFilterViewController setFilterButtons:](self, "setFilterButtons:", v12);
    -[ICDocCamFilterViewController setCurrentFilterType:](self, "setCurrentFilterType:", -[ICDocCamFilterViewController currentFilterType](self, "currentFilterType"));

  }
}

- (void)updateScrollViewContentSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double Height;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  unint64_t v31;
  double v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  unint64_t v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  CGRect v46;
  CGRect v47;

  v44 = 0;
  v45 = 0;
  -[UIViewController dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:](self, "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v45, &v44);
  if ((DCDebugInterfaceEnabled() & 1) != 0 || v44 == 1)
  {
    v21 = *MEMORY[0x24BDBF148];
    v22 = *(double *)(MEMORY[0x24BDBF148] + 8);
    -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v25 = 0;
      do
      {
        -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "bounds");
        v29 = v28;
        -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count") - 1;

        if (v31 <= v25)
          v32 = v29;
        else
          v32 = 101.0;
        v22 = v22 + v32;

        ++v25;
        -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

      }
      while (v34 > v25);
    }
  }
  else
  {
    v3 = 20.0;
    v4 = 20.0;
    if ((unint64_t)(v45 - 3) <= 1)
    {
      -[ICDocCamFilterViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safeAreaLayoutGuide");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layoutFrame");
      Height = CGRectGetHeight(v46);

      if (Height > 322.0)
        v4 = 20.0;
      else
        v4 = 8.0;
    }
    -[ICDocCamFilterViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;

    -[ICDocCamFilterViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v15 = CGRectGetMaxY(v47) + v4 * 2.0;
    -[ICDocCamFilterViewController bottomContentInset](self, "bottomContentInset");
    v17 = v15 + v16;

    if (v10 == 320.0)
      v3 = 8.0;
    -[ICDocCamFilterViewController bottomContentInset](self, "bottomContentInset");
    v19 = v12 > 256.0 && v18 == 0.0;
    v20 = v17 + 8.0;
    if (!v19)
      v20 = v17;
    v21 = v10 - v3 * 2.0;
    v22 = v12 - v20;
  }
  -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v36, "size");
    v38 = v37;
    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = v45 - 1;
    objc_msgSend(v36, "size");
    v38 = v41;
    v43 = v42;
    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 <= 1)
    {
      v38 = v21;
      v22 = v43;
    }
  }
  objc_msgSend(v39, "setContentSize:", v38, v22);

}

- (void)setUpScrollView
{
  double *v3;
  void *v4;
  uint64_t v5;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double Height;
  BOOL v12;
  double v13;
  double v14;
  char v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v42;
  double v43;
  int v44;
  int v45;
  double v46;
  double v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CGRect v52;
  CGRect v53;

  v50 = 0;
  v51 = 0;
  -[UIViewController dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:](self, "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v51, &v50);
  v3 = (double *)MEMORY[0x24BDBF148];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v50;
  if ((unint64_t)(v51 - 3) <= 1 && v50 == 0)
  {
    -[ICDocCamFilterViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaLayoutGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutFrame");
    Height = CGRectGetHeight(v52);

    v12 = Height > 322.0;
    if (Height > 322.0)
      v8 = 44.0;
    else
      v8 = 40.0;
    v5 = v50;
    if (v12)
      v7 = 22.0;
    else
      v7 = 26.0;
  }
  else
  {
    v7 = 8.0;
    v8 = 60.0;
  }
  v13 = *v3;
  v14 = v3[1];
  if (v5)
  {
    v15 = 0;
    v16 = 16.0;
    v17 = v3[1];
    v18 = *v3;
  }
  else
  {
    -[ICDocCamFilterViewController scrollView](self, "scrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentSize");
    v21 = v20;
    v23 = v22;

    if ((unint64_t)(v51 - 1) > 1)
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 11.0);
      v25 = objc_claimAutoreleasedReturnValue();

      -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setIconSize:", v8);
      objc_msgSend(v24, "bounds");
      v28 = v23 - (v27 - v7);
      -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v28 / (double)(unint64_t)(objc_msgSend(v29, "count") - 1);

      v15 = 0;
      v16 = 14.0;
      v4 = (void *)v25;
      v18 = v13;
    }
    else
    {
      v15 = objc_msgSend(MEMORY[0x24BDF6750], "dc_isRTL");
      -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (v21 - v8) / (double)(unint64_t)(objc_msgSend(v24, "count") - 1);
      v16 = 20.0;
      v17 = v14;
    }

  }
  -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31)
  {
    v32 = 0;
    v33 = -1;
    do
    {
      -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if ((v15 & 1) != 0)
      {
        -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v36, "count") + v33);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v34, "objectAtIndexedSubscript:", v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v37, "filterNameLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFont:", v4);

      objc_msgSend(v37, "labelVerticalSpacingConstraint");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setConstant:", v16);

      objc_msgSend(v37, "setIconSize:", v8);
      objc_msgSend(v37, "bounds");
      v42 = 0.0;
      if (!v50)
      {
        if ((unint64_t)(v51 - 1) <= 1)
        {
          if (v40 > 60.0)
            v40 = 60.0;
          v43 = 0.0;
          v42 = v13;
          goto LABEL_32;
        }
        if (v40 <= 60.0)
          v42 = 0.0;
        else
          v42 = (60.0 - v40) * 0.5;
      }
      v43 = v14;
LABEL_32:
      v53 = CGRectIntegral(*(CGRect *)&v42);
      objc_msgSend(v37, "setFrame:", v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);
      v44 = DCDebugInterfaceEnabled();
      if (v50 == 1)
        v45 = 1;
      else
        v45 = v44;
      if (v45)
        v46 = v8 + 41.0;
      else
        v46 = v17;
      v47 = -0.0;
      if (!v45)
        v47 = v18;
      v13 = v13 + v47;
      v14 = v14 + v46;

      ++v32;
      -[ICDocCamFilterViewController filterButtons](self, "filterButtons");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "count");

      --v33;
    }
    while (v49 > v32);
  }

}

- (void)setCurrentFilterType:(signed __int16)a3
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  self->_currentFilterType = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ICDocCamFilterViewController filterButtons](self, "filterButtons", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "setSelected:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "filterType") == v3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)filterButtonFromLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  -[ICDocCamFilterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hitTest:withEvent:", 0, x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v6, "superview");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }
  v8 = objc_opt_class();
  DCDynamicCast(v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ICDocCamFilterViewController longPressGesture](self, "longPressGesture");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[ICDocCamFilterViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v7);
    -[ICDocCamFilterViewController filterButtonFromLocation:](self, "filterButtonFromLocation:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v8 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)applyToAll:(signed __int16)a3
{
  uint64_t v3;
  void *v5;

  v3 = a3;
  -[ICDocCamFilterViewController filterViewDelegate](self, "filterViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterViewControllerApplyToAll:", v3);

  -[ICDocCamFilterViewController setCurrentFilterType:](self, "setCurrentFilterType:", v3);
}

- (void)longPressGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
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
  _QWORD v20[5];
  __int16 v21;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[ICDocCamFilterViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    -[ICDocCamFilterViewController filterButtonFromLocation:](self, "filterButtonFromLocation:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "filterType");
    -[ICDocCamFilterViewController filterViewDelegate](self, "filterViewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "filterViewControllerCanApplyToAll:", v7);

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDF67E8];
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Apply Filter to All Scans"), CFSTR("Apply Filter to All Scans"), CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __49__ICDocCamFilterViewController_longPressGesture___block_invoke;
      v20[3] = &unk_24C5B84B8;
      v20[4] = self;
      v21 = v7;
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addAction:", v13);
      objc_msgSend(v10, "setPreferredAction:", v13);
      v14 = (void *)MEMORY[0x24BDF67E8];
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, &__block_literal_global_51);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v16);

      objc_msgSend(v10, "popoverPresentationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filterIconView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSourceView:", v18);

      objc_msgSend(v6, "filterIconView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      objc_msgSend(v17, "setSourceRect:");

      -[ICDocCamFilterViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
    }

  }
}

uint64_t __49__ICDocCamFilterViewController_longPressGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyToAll:", *(__int16 *)(a1 + 40));
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)horizontalOffset
{
  return self->_horizontalOffset;
}

- (void)setHorizontalOffset:(double)a3
{
  self->_horizontalOffset = a3;
}

- (double)bottomOffset
{
  return self->_bottomOffset;
}

- (void)setBottomOffset:(double)a3
{
  self->_bottomOffset = a3;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (ICDocCamFilterViewDelegate)filterViewDelegate
{
  return (ICDocCamFilterViewDelegate *)objc_loadWeakRetained((id *)&self->_filterViewDelegate);
}

- (void)setFilterViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_filterViewDelegate, a3);
}

- (signed)currentFilterType
{
  return self->_currentFilterType;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (NSLayoutConstraint)scrollViewBottomConstraint
{
  return self->_scrollViewBottomConstraint;
}

- (void)setScrollViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, a3);
}

- (NSLayoutConstraint)scrollViewTrailingConstraint
{
  return self->_scrollViewTrailingConstraint;
}

- (UIView)backgroundView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_backgroundView);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundView, a3);
}

- (DCSinglePixelVerticalLineView)verticalLineView
{
  return (DCSinglePixelVerticalLineView *)objc_loadWeakRetained((id *)&self->_verticalLineView);
}

- (void)setVerticalLineView:(id)a3
{
  objc_storeWeak((id *)&self->_verticalLineView, a3);
}

- (DCSinglePixelHorizontalLineView)horizontalLineView
{
  return (DCSinglePixelHorizontalLineView *)objc_loadWeakRetained((id *)&self->_horizontalLineView);
}

- (void)setHorizontalLineView:(id)a3
{
  objc_storeWeak((id *)&self->_horizontalLineView, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (NSMutableArray)filterButtons
{
  return self->_filterButtons;
}

- (void)setFilterButtons:(id)a3
{
  objc_storeStrong((id *)&self->_filterButtons, a3);
}

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
}

- (void)setLongPressGesture:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGesture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_filterButtons, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_destroyWeak((id *)&self->_horizontalLineView);
  objc_destroyWeak((id *)&self->_verticalLineView);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong((id *)&self->_scrollViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_filterViewDelegate);
}

@end

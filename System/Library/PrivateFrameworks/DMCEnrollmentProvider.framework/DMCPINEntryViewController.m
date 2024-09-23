@implementation DMCPINEntryViewController

- (DMCPINEntryViewController)initWithStyle:(unint64_t)a3
{
  DMCPINEntryViewController *v4;
  DMCPINEntryViewController *v5;
  unsigned int *v6;
  void *v7;
  void *v8;
  DMCDevicePINPane *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)DMCPINEntryViewController;
  v4 = -[DevicePINController init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = (unsigned int *)((char *)v4 + (int)*MEMORY[0x24BE75668]);
    *v6 = 3;
    v4->_style = a3;
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v8);

    v9 = objc_alloc_init(DMCDevicePINPane);
    -[DMCDevicePINPane setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    -[PSEditingPane setDelegate:](v9, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v11, CFSTR("mode"));

    -[DevicePINController setSpecifier:](v5, "setSpecifier:", v10);
    -[DevicePINController setPane:](v5, "setPane:", v9);
    objc_initWeak(&location, v5);
    v19[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __43__DMCPINEntryViewController_initWithStyle___block_invoke;
    v15[3] = &unk_24D52E2D0;
    objc_copyWeak(&v16, &location);
    v13 = (id)-[DMCPINEntryViewController registerForTraitChanges:withHandler:](v5, "registerForTraitChanges:withHandler:", v12, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __43__DMCPINEntryViewController_initWithStyle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_titleFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v1);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMCPINEntryViewController;
  -[DevicePINController loadView](&v7, sel_loadView);
  if (-[DMCPINEntryViewController style](self, "style") == 1)
  {
    v3 = (void *)objc_opt_new();
    -[DMCPINEntryViewController _titleFont](self, "_titleFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFont:", v4);

    DMCLocalizedStringByDevice();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", v5);

    objc_msgSend(v3, "setTextAlignment:", 1);
    objc_msgSend(v3, "setNumberOfLines:", 2);
    objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v3, "setMinimumScaleFactor:", 0.5);
    -[DMCPINEntryViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3);

    -[DMCPINEntryViewController setTitleLabel:](self, "setTitleLabel:", v3);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMCPINEntryViewController;
  -[DevicePINController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[DMCPINEntryViewController _updateStyle](self, "_updateStyle");
}

- (void)viewControllerHasBeenDismissed
{
  DevicePINControllerDelegate **p_delegate;
  id WeakRetained;
  id v4;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v4, "didCancelEnteringPIN");

  }
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  DevicePINControllerDelegate **p_delegate;
  id WeakRetained;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "didCancelEnteringPIN");

  }
}

- (void)_updateStyle
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
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
  DMCEnrollmentUIBarButtonItem *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  CGSize v26;
  CGRect v27;

  v3 = -[DMCPINEntryViewController style](self, "style");
  -[PSDetailController pane](self, "pane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", v3);

  v5 = -[DMCPINEntryViewController style](self, "style");
  if (v5)
  {
    if (v5 != 1)
      return;
    -[PSDetailController pane](self, "pane");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCPINEntryViewController descriptionText](self, "descriptionText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

    v26.width = 1.0;
    v26.height = 1.0;
    UIGraphicsBeginImageContext(v26);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "set");

    v27.origin.x = 0.0;
    v27.origin.y = 0.0;
    v27.size.width = 1.0;
    v27.size.height = 1.0;
    UIRectFill(v27);
    UIGraphicsGetImageFromCurrentImageContext();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    -[DMCPINEntryViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidesBackButton:", 1);

    -[DMCPINEntryViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundImage:forBarMetrics:", v25, 0);

    -[DMCPINEntryViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    objc_msgSend(v13, "setShadowImage:", v14);

    -[DMCPINEntryViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslucent:", 1);

    -[DMCPINEntryViewController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", 0);

    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCPINEntryViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v18);

    if (-[DevicePINController simplePIN](self, "simplePIN"))
    {
      -[DMCPINEntryViewController navigationItem](self, "navigationItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setRightBarButtonItem:", 0);

    }
    v21 = -[DMCEnrollmentUIBarButtonItem initWithType:target:action:]([DMCEnrollmentUIBarButtonItem alloc], "initWithType:target:action:", 1, self, sel_leftBarButtonTapped_);
    -[DMCPINEntryViewController navigationItem](self, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLeftBarButtonItem:", v21);

  }
  else
  {
    -[DMCPINEntryViewController navigationItem](self, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    DMCLocalizedStringByDevice();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitle:", v24);

    -[PSDetailController pane](self, "pane");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    DMCLocalizedStringByDevice();
    v21 = (DMCEnrollmentUIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitle:", v21);
  }

}

- (void)viewWillLayoutSubviews
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double MinY;
  void *v64;
  double v65;
  double v66;
  CGFloat v67;
  void *v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  void *v72;
  CGFloat v73;
  void *v74;
  double v75;
  CGFloat v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  objc_super v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v99.receiver = self;
  v99.super_class = (Class)DMCPINEntryViewController;
  -[DevicePINController viewWillLayoutSubviews](&v99, sel_viewWillLayoutSubviews);
  if (-[DMCPINEntryViewController style](self, "style") == 1)
  {
    v3 = kDMCTopMarginForViewController(self);
    -[DMCPINEntryViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v96 = v3 + CGRectGetHeight(v100) + 80.0;

    -[DMCPINEntryViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = CGRectGetWidth(v101) + -30.0;
    -[DMCPINEntryViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeAreaInsets");
    v10 = v7 + v9 * -2.0;

    -[DMCPINEntryViewController titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v10;
    objc_msgSend(v11, "sizeThatFits:", v10, 1.79769313e308);
    v97 = v12;

    -[DMCPINEntryViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeAreaInsets");
    v89 = v14;

    -[PSDetailController pane](self, "pane");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "descriptionLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSDetailController pane](self, "pane");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "passcodeField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSDetailController pane](self, "pane");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v94 = v21;
    v95 = v20;

    -[PSDetailController pane](self, "pane");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v92 = v24;
    v93 = v23;
    v90 = v26;
    v91 = v25;

    objc_msgSend(v16, "superview");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[DMCPINEntryViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "convertRect:toView:", v36, v29, v31, v33, v35);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    objc_msgSend(v18, "superview");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;
    -[DMCPINEntryViewController view](self, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "convertRect:toView:", v54, v47, v49, v51, v53);
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;

    v85 = v40;
    v87 = v38;
    v102.origin.x = v38;
    v102.origin.y = v40;
    v81 = v44;
    v83 = v42;
    v102.size.width = v42;
    v102.size.height = v44;
    MinY = CGRectGetMinY(v102);
    -[DMCPINEntryViewController titleLabel](self, "titleLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "frame");
    v65 = MinY - CGRectGetMaxY(v103);

    v66 = v65 + -13.0;
    v104.origin.x = v56;
    v104.origin.y = v58;
    v104.size.width = v60;
    v104.size.height = v62;
    v67 = CGRectGetMaxY(v104) - v66;
    -[DMCPINEntryViewController view](self, "view");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "bounds");
    v69 = CGRectGetHeight(v105) + -216.0;

    v70 = 0.0;
    if (v67 > v69)
    {
      v106.origin.x = v56;
      v106.origin.y = v58;
      v106.size.width = v60;
      v106.size.height = v62;
      v71 = CGRectGetMaxY(v106) - v66;
      -[DMCPINEntryViewController view](self, "view");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "bounds");
      v70 = v71 - CGRectGetHeight(v107) + 216.0 + 10.0;

    }
    if (!-[DevicePINController simplePIN](self, "simplePIN", *(_QWORD *)&v81, *(_QWORD *)&v83, *(_QWORD *)&v85, *(_QWORD *)&v87))
    {
      v108.origin.y = v86;
      v108.origin.x = v88;
      v108.size.height = v82;
      v108.size.width = v84;
      v73 = CGRectGetMaxY(v108) + 75.0 - v66;
      -[DMCPINEntryViewController view](self, "view");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "bounds");
      v75 = v73 - CGRectGetHeight(v109) + 216.0 + 10.0;

      if (v70 < v75)
        v70 = v75;
    }
    v110.origin.y = v92;
    v110.origin.x = v93;
    v110.size.height = v90;
    v110.size.width = v91;
    v76 = CGRectGetMinY(v110) - v66 - v70;
    -[PSDetailController pane](self, "pane");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setFrame:", 0.0, v76, v95, v94);

    -[DMCPINEntryViewController titleLabel](self, "titleLabel");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setFrame:", v89 + 15.0, v96 + 15.0 - v70, v98, v97);

    -[DMCPINEntryViewController view](self, "view");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCPINEntryViewController titleLabel](self, "titleLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "bringSubviewToFront:", v80);

  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75E10]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75668]));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v8, CFSTR("mode"));

    -[DevicePINController setSpecifier:](self, "setSpecifier:", v6);
    v5 = obj;
  }

}

- (void)setInProgress:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  DMCEnrollmentUIBarButtonItem *v10;
  void *v11;
  DMCEnrollmentUIBarButtonItem *v12;

  if (*(&self->_inProgress + 1) != a3)
  {
    v3 = a3;
    *(&self->_inProgress + 1) = a3;
    if (-[DMCPINEntryViewController style](self, "style") == 1)
    {
      -[DMCPINEntryViewController navigationItem](self, "navigationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leftBarButtonItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v3)
      {
        objc_msgSend(v6, "setEnabled:", 0);

        -[DMCPINEntryViewController navigationItem](self, "navigationItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "rightBarButtonItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMCPINEntryViewController setRightBarButtonItem:](self, "setRightBarButtonItem:", v9);

        v10 = -[DMCEnrollmentUIBarButtonItem initWithType:target:action:]([DMCEnrollmentUIBarButtonItem alloc], "initWithType:target:action:", 3, 0, 0);
      }
      else
      {
        objc_msgSend(v6, "setEnabled:", 1);

        -[DMCPINEntryViewController rightBarButtonItem](self, "rightBarButtonItem");
        v10 = (DMCEnrollmentUIBarButtonItem *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v10;
      -[DMCPINEntryViewController navigationItem](self, "navigationItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRightBarButtonItem:", v12);

    }
  }
}

- (id)stringsBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (void)leftBarButtonTapped:(id)a3
{
  DevicePINControllerDelegate **p_delegate;
  id WeakRetained;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "didCancelEnteringPIN");

  }
}

- (id)_titleFont
{
  int v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = MGGetSInt32Answer();
  v3 = (_QWORD *)MEMORY[0x24BDF7800];
  if (v2 == 5)
    v3 = (_QWORD *)MEMORY[0x24BDF7848];
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (DevicePINControllerDelegate)delegate
{
  return (DevicePINControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)inProgress
{
  return *(&self->_inProgress + 1);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIBarButtonItem)rightBarButtonItem
{
  return self->_rightBarButtonItem;
}

- (void)setRightBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

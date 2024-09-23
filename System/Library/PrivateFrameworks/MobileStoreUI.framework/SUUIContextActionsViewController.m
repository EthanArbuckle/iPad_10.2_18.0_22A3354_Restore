@implementation SUUIContextActionsViewController

- (SUUIContextActionsViewController)initWithCoder:(id)a3
{
  void *v4;
  objc_class *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", CFSTR("SKUnsupportedPresentationException"), CFSTR("%@ must be used with configuration"), v6);

  return 0;
}

- (SUUIContextActionsViewController)initWithConfiguration:(id)a3
{
  id v5;
  SUUIContextActionsViewController *v6;
  SUUIContextActionsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIContextActionsViewController;
  v6 = -[SUUIContextActionsViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_orbPresentation = 0;
    v7->_appliedSystemRecognizer = 0;
    -[SUUIContextActionsViewController setTransitioningDelegate:](v7, "setTransitioningDelegate:", v7);
    -[SUUIContextActionsViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 4);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *backgroundView;
  UIVisualEffectView *v9;
  void *v10;
  id v11;
  UIStackView *v12;
  UIStackView *stackView;
  UIStackView *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SUUIContextActionsViewController;
  -[SUUIContextActionsViewController viewDidLoad](&v16, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_viewTapped_);
  -[SUUIContextActionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

  v5 = objc_alloc(MEMORY[0x24BEBDB38]);
  objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIVisualEffectView *)objc_msgSend(v5, "initWithEffect:", v6);

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView _setContinuousCornerRadius:](v7, "_setContinuousCornerRadius:", 16.0);
  -[UIVisualEffectView setClipsToBounds:](v7, "setClipsToBounds:", 1);
  -[UIVisualEffectView setHidden:](v7, "setHidden:", 1);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v7;
  v9 = v7;

  -[SUUIContextActionsViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

  v11 = objc_alloc(MEMORY[0x24BEBD978]);
  v12 = (UIStackView *)objc_msgSend(v11, "initWithArrangedSubviews:", MEMORY[0x24BDBD1A8]);
  -[UIStackView setAxis:](v12, "setAxis:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  stackView = self->_stackView;
  self->_stackView = v12;
  v14 = v12;

  -[SUUIContextActionsViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v14);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIContextActionsViewController;
  -[SUUIContextActionsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SUUIContextActionsViewController _reloadViewsConfiguration](self, "_reloadViewsConfiguration");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIContextActionsViewController;
  -[SUUIContextActionsViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[SUUIContextActionsViewController systemProvidedGestureRecognzier](self, "systemProvidedGestureRecognzier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SUUIContextActionsViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v6);
    -[SUUIContextActionsViewController setGestureRecognizerInitialLocation:](self, "setGestureRecognizerInitialLocation:");

    objc_msgSend(v4, "addTarget:action:", self, sel_systemProvidedGestureRecognzierTriggered_);
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double Height;
  void *v11;
  void *v12;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)SUUIContextActionsViewController;
  -[SUUIContextActionsViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[SUUIContextActionsViewController scrollableActionGroupView](self, "scrollableActionGroupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIContextActionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", v5, v6);
  v8 = v7;
  -[SUUIContextActionsViewController scrollableActionGroupView](self, "scrollableActionGroupView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  Height = CGRectGetHeight(v14);

  if (v8 > Height)
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.0399999991);
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIContextActionsViewController scrollableActionGroupView](self, "scrollableActionGroupView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v11);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIContextActionsViewController;
  -[SUUIContextActionsViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    v5 = objc_msgSend(v4, "horizontalSizeClass");
    -[SUUIContextActionsViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "horizontalSizeClass");

    if (v5 != v7)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __61__SUUIContextActionsViewController_traitCollectionDidChange___block_invoke;
      v8[3] = &unk_2511F47C0;
      v8[4] = self;
      -[SUUIContextActionsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v8);
    }
  }

}

void __61__SUUIContextActionsViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "userInterfaceIdiom") != 1)
    goto LABEL_9;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  if (v3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setModalPresentationStyle:", 7);
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationSource");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 0, 0);

    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "presentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v6);

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "barButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentationSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      objc_msgSend(v12, "barButtonItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBarButtonItem:", v14);

    }
    else
    {
      objc_msgSend(v12, "sourceView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:

        return;
      }
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "presentationSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sourceView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSourceView:", v19);

      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentationSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sourceRect");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSourceRect:", v22, v24, v26, v28);
    }

    goto LABEL_9;
  }
}

- (void)viewTapped:(id)a3
{
  -[SUUIContextActionsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)systemProvidedGestureRecognzierTriggered:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  -[SUUIContextActionsViewController gestureRecognizerInitialLocation](self, "gestureRecognizerInitialLocation");
  v6 = v5;
  v7 = v4;
  v8 = v5 == *MEMORY[0x24BDBEFB0] && v4 == *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (!v8 && objc_msgSend(v17, "state") == 2)
  {
    -[SUUIContextActionsViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locationInView:", v10);
    v12 = v11;
    v14 = v13;

    v15 = v12 - v6;
    if (v12 - v6 < 0.0)
      v15 = -(v12 - v6);
    if (v15 > 40.0)
      goto LABEL_12;
    v16 = v14 - v7;
    if (v14 - v7 < 0.0)
      v16 = -(v14 - v7);
    if (v16 > 25.0)
LABEL_12:
      -[SUUIContextActionsViewController _applySystemRecognizer](self, "_applySystemRecognizer");
  }

}

- (void)_applySystemRecognizer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SUUIContextActionsViewController contextActionView](self, "contextActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIContextActionsViewController systemProvidedGestureRecognzier](self, "systemProvidedGestureRecognzier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:", v4);

  -[SUUIContextActionsViewController systemProvidedGestureRecognzier](self, "systemProvidedGestureRecognzier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SUUIContextActionsViewController systemProvidedGestureRecognzier](self, "systemProvidedGestureRecognzier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeTarget:action:", self, sel_systemProvidedGestureRecognzierTriggered_);

  }
  -[SUUIContextActionsViewController setAppliedSystemRecognizer:](self, "setAppliedSystemRecognizer:", 1);
}

- (void)_reloadViewsConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
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
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _QWORD v157[8];
  _QWORD v158[4];
  void *v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1628];
  -[SUUIContextActionsViewController constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  -[SUUIContextActionsViewController stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v154;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v154 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
        -[SUUIContextActionsViewController stackView](self, "stackView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSpacing:", 0.0);

        -[SUUIContextActionsViewController stackView](self, "stackView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeArrangedSubview:", v11);

        objc_msgSend(v11, "removeFromSuperview");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
    }
    while (v8);
  }

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIContextActionsViewController setConstraints:](self, "setConstraints:", v14);

  v15 = *MEMORY[0x24BEBE250];
  __61__SUUIContextActionsViewController__reloadViewsConfiguration__block_invoke(v16, *MEMORY[0x24BEBE250], 0, 0x8000);
  v17 = objc_claimAutoreleasedReturnValue();
  v161 = *MEMORY[0x24BEBB588];
  v162 = *MEMORY[0x24BDC4CD0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __61__SUUIContextActionsViewController__reloadViewsConfiguration__block_invoke((uint64_t)v18, v15, v18, 0);
  v19 = objc_claimAutoreleasedReturnValue();

  -[SUUIContextActionsViewController configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contextActions");
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc(MEMORY[0x24BEBD688]);
  v145 = (void *)v21;
  objc_msgSend(MEMORY[0x24BEBD680], "actionGroupWithActions:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithActionGroup:actionHandlerInvocationDelegate:", v23, self);

  v147 = (void *)v17;
  objc_msgSend(v24, "_setVisualStyleOverrideTitleLabelFont:", v17);
  LODWORD(v25) = 1132068864;
  objc_msgSend(v24, "setContentCompressionResistancePriority:forAxis:", 1, v25);
  v144 = v24;
  -[SUUIContextActionsViewController setContextActionView:](self, "setContextActionView:", v24);
  v26 = 0;
  if (!-[SUUIContextActionsViewController isOrbPresentation](self, "isOrbPresentation"))
  {
    if ((-[SUUIContextActionsViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) != 0)
    {
      v26 = 0;
    }
    else
    {
      v27 = (void *)MEMORY[0x24BEBD678];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_2511FF0C8, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "actionWithTitle:type:handler:", v29, 1, &__block_literal_global_40);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "singlePointImageWithColor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "imageWithAlignmentRectInsets:", -55.0, 0.0, 0.0, 0.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTrailingImage:", v34);

      v35 = objc_alloc(MEMORY[0x24BEBD688]);
      v36 = (void *)MEMORY[0x24BEBD680];
      v160 = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v160, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "actionGroupWithActions:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v35, "initWithActionGroup:actionHandlerInvocationDelegate:", v38, self);

      v39 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v26, "heightAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToConstant:", 56.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = v41;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v159, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "activateConstraints:", v42);

      objc_msgSend(v26, "_setVisualStyleOverrideTitleLabelFont:", v19);
    }
  }
  v43 = objc_alloc(MEMORY[0x24BEBD978]);
  v44 = (void *)objc_msgSend(v43, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v44, "setAxis:", 1);
  objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SUUIContextActionsViewController stackView](self, "stackView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addArrangedSubview:", v44);

  v46 = -[SUUIContextActionsViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
  if ((v46 & 1) == 0)
  {
    -[SUUIContextActionsViewController contextActionView](self, "contextActionView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "_setContinuousCornerRadius:", 16.0);

    -[SUUIContextActionsViewController contextActionView](self, "contextActionView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setClipsToBounds:", 1);

    -[SUUIContextActionsViewController contextActionView](self, "contextActionView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setMaskedCorners:", 15);

  }
  -[SUUIContextActionsViewController contextActionView](self, "contextActionView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "_setDrawsBackground:", 0);

  -[SUUIContextActionsViewController contextActionView](self, "contextActionView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addArrangedSubview:", v52);

  if (-[SUUIContextActionsViewController hasAppliedSystemRecognizer](self, "hasAppliedSystemRecognizer"))
  {
    -[SUUIContextActionsViewController contextActionView](self, "contextActionView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIContextActionsViewController systemProvidedGestureRecognzier](self, "systemProvidedGestureRecognzier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:", v54);

  }
  if (v26)
  {
    -[SUUIContextActionsViewController stackView](self, "stackView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setSpacing:", 8.0);

    -[SUUIContextActionsViewController stackView](self, "stackView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addArrangedSubview:", v26);

  }
  if ((v46 | -[SUUIContextActionsViewController isOrbPresentation](self, "isOrbPresentation")) == 1)
  {
    -[SUUIContextActionsViewController stackView](self, "stackView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "centerYAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIContextActionsViewController view](self, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v60);
    v152 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SUUIContextActionsViewController view](self, "view");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "layoutMarginsGuide");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIContextActionsViewController stackView](self, "stackView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v57, -10.0);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[SUUIContextActionsViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if ((v46 & 1) != 0)
  {
    objc_msgSend(v63, "leadingAnchor");
    v65 = objc_claimAutoreleasedReturnValue();

    -[SUUIContextActionsViewController view](self, "view");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "trailingAnchor");
    v67 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v63, "layoutMarginsGuide");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "leadingAnchor");
    v65 = objc_claimAutoreleasedReturnValue();

    -[SUUIContextActionsViewController view](self, "view");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "layoutMarginsGuide");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "trailingAnchor");
    v67 = objc_claimAutoreleasedReturnValue();

  }
  v143 = v26;
  v146 = (void *)v19;

  -[SUUIContextActionsViewController stackView](self, "stackView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = (void *)v65;
  objc_msgSend(v71, "constraintEqualToAnchor:", v65);
  v72 = objc_claimAutoreleasedReturnValue();

  -[SUUIContextActionsViewController stackView](self, "stackView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = (void *)v67;
  objc_msgSend(v74, "constraintEqualToAnchor:", v67);
  v75 = objc_claimAutoreleasedReturnValue();

  v142 = v46;
  v148 = (void *)v75;
  v149 = (void *)v72;
  v150 = v44;
  if ((v46 & 1) == 0)
  {
    -[SUUIContextActionsViewController view](self, "view");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "layoutMargins");
    v78 = v77;
    -[SUUIContextActionsViewController view](self, "view");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "layoutMargins");
    v81 = -(v78 + v80);

    -[SUUIContextActionsViewController stackView](self, "stackView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "widthAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIContextActionsViewController view](self, "view");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "heightAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:constant:", v85, v81);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v87) = 1132068864;
    objc_msgSend(v86, "setPriority:", v87);
    -[SUUIContextActionsViewController stackView](self, "stackView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIContextActionsViewController view](self, "view");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "topAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintGreaterThanOrEqualToAnchor:constant:", v91, 70.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v93) = 1148829696;
    v138 = v92;
    objc_msgSend(v92, "setPriority:", v93);
    -[SUUIContextActionsViewController constraints](self, "constraints");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v158[0] = v92;
    v158[1] = v86;
    -[SUUIContextActionsViewController stackView](self, "stackView");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "widthAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIContextActionsViewController view](self, "view");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "heightAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "constraintLessThanOrEqualToAnchor:constant:", v94, v81);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v158[2] = v95;
    -[SUUIContextActionsViewController stackView](self, "stackView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "centerXAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIContextActionsViewController view](self, "view");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "centerXAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v158[3] = v100;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v158, 4);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "addObjectsFromArray:", v101);

    v75 = (uint64_t)v148;
    v72 = (uint64_t)v149;

    v44 = v150;
    LODWORD(v102) = 1144750080;
    objc_msgSend(v149, "setPriority:", v102);
    LODWORD(v103) = 1144750080;
    objc_msgSend(v148, "setPriority:", v103);
    -[SUUIContextActionsViewController backgroundView](self, "backgroundView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setHidden:", 0);

  }
  -[SUUIContextActionsViewController constraints](self, "constraints");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v157[0] = v152;
  v157[1] = v72;
  v157[2] = v75;
  -[SUUIContextActionsViewController stackView](self, "stackView");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "bottomAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIContextActionsViewController view](self, "view");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "bottomAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "constraintLessThanOrEqualToAnchor:", v133);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v157[3] = v131;
  -[SUUIContextActionsViewController backgroundView](self, "backgroundView");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "centerYAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "centerYAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "constraintEqualToAnchor:", v127);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v157[4] = v126;
  -[SUUIContextActionsViewController backgroundView](self, "backgroundView");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "centerXAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "centerXAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "constraintEqualToAnchor:", v123);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v157[5] = v122;
  -[SUUIContextActionsViewController backgroundView](self, "backgroundView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "widthAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "widthAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v157[6] = v108;
  -[SUUIContextActionsViewController backgroundView](self, "backgroundView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "heightAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "heightAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintEqualToAnchor:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v157[7] = v112;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v157, 8);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "addObjectsFromArray:", v113);

  v114 = (void *)MEMORY[0x24BDD1628];
  -[SUUIContextActionsViewController constraints](self, "constraints");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "activateConstraints:", v115);

  if (v142)
  {
    -[SUUIContextActionsViewController stackView](self, "stackView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIContextActionsViewController view](self, "view");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "bounds");
    objc_msgSend(v116, "systemLayoutSizeFittingSize:", v118, v119);
    v121 = v120;

    -[SUUIContextActionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 347.0, v121);
  }

}

id __61__SUUIContextActionsViewController__reloadViewsConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if ((_DWORD)a4)
  {
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", a4);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v8, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __61__SUUIContextActionsViewController__reloadViewsConfiguration__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 1;
}

- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  _QWORD v9[4];
  void (**v10)(_QWORD);
  char v11;

  v8 = (void (**)(_QWORD))a5;
  if (a4)
  {
    v11 = 0;
    (*((void (**)(id, id, char *))a4 + 2))(a4, a3, &v11);
    if (v11)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __83__SUUIContextActionsViewController_interfaceAction_invokeActionHandler_completion___block_invoke;
      v9[3] = &unk_2511F7A18;
      v10 = v8;
      -[SUUIContextActionsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);

    }
    else if (v8)
    {
      v8[2](v8);
    }
  }
  else
  {
    -[SUUIContextActionsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);
  }

}

uint64_t __83__SUUIContextActionsViewController_interfaceAction_invokeActionHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_transitionPresentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SUUIContextActionsPresentationController *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[SUUIContextActionsViewController transitionPresentationController](self, "transitionPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = -[SUUIContextActionsPresentationController initWithPresentedViewController:presentingViewController:]([SUUIContextActionsPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v6, v7);
    -[SUUIContextActionsViewController setTransitionPresentationController:](self, "setTransitionPresentationController:", v9);

  }
  -[SUUIContextActionsViewController transitionPresentationController](self, "transitionPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)animationControllerForDismissedController:(id)a3
{
  SUUIContextActionsViewController *v4;

  if (-[SUUIContextActionsViewController isOrbPresentation](self, "isOrbPresentation", a3))
    v4 = self;
  else
    v4 = 0;
  return v4;
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBDB00];
  -[SUUIContextActionsViewController transitionDuration:](self, "transitionDuration:", v4);
  v7 = v6;
  v10 = v4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__SUUIContextActionsViewController_animateTransition___block_invoke;
  v11[3] = &unk_2511F47C0;
  v11[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__SUUIContextActionsViewController_animateTransition___block_invoke_2;
  v9[3] = &unk_2511F4908;
  v8 = v4;
  objc_msgSend(v5, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v11, v9, v7, 0.0, 1.0, 0.0);

}

void __54__SUUIContextActionsViewController_animateTransition___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "transitionPresentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "dismissalAnimations");

}

uint64_t __54__SUUIContextActionsViewController_animateTransition___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
    v3 = objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1;
  else
    v3 = 0;
  return objc_msgSend(v2, "completeTransition:", v3);
}

- (BOOL)isOrbPresentation
{
  return self->_orbPresentation;
}

- (void)setOrbPresentation:(BOOL)a3
{
  self->_orbPresentation = a3;
}

- (UIGestureRecognizer)systemProvidedGestureRecognzier
{
  return self->_systemProvidedGestureRecognzier;
}

- (void)setSystemProvidedGestureRecognzier:(id)a3
{
  objc_storeStrong((id *)&self->_systemProvidedGestureRecognzier, a3);
}

- (SUUIContextActionsPresentationController)transitionPresentationController
{
  return self->_transitionPresentationController;
}

- (void)setTransitionPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_transitionPresentationController, a3);
}

- (SUUIContextActionsConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (UIInterfaceActionGroupView)contextActionView
{
  return self->_contextActionView;
}

- (void)setContextActionView:(id)a3
{
  objc_storeStrong((id *)&self->_contextActionView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIInterfaceActionGroupView)scrollableActionGroupView
{
  return self->_scrollableActionGroupView;
}

- (void)setScrollableActionGroupView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollableActionGroupView, a3);
}

- (CGPoint)gestureRecognizerInitialLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_gestureRecognizerInitialLocation.x;
  y = self->_gestureRecognizerInitialLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGestureRecognizerInitialLocation:(CGPoint)a3
{
  self->_gestureRecognizerInitialLocation = a3;
}

- (BOOL)hasAppliedSystemRecognizer
{
  return self->_appliedSystemRecognizer;
}

- (void)setAppliedSystemRecognizer:(BOOL)a3
{
  self->_appliedSystemRecognizer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollableActionGroupView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_contextActionView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_transitionPresentationController, 0);
  objc_storeStrong((id *)&self->_systemProvidedGestureRecognzier, 0);
}

@end

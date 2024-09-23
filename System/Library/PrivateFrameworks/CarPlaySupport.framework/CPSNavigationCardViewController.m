@implementation CPSNavigationCardViewController

- (void)_updateHelperConstraints
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id *location;
  id v9;
  id v10;
  CPSLayoutHelperView *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  CPSLayoutHelperView *v16;
  id v17;
  id v18;
  CPSCardPlatterView *v19;
  CPSPausedCardView *v20;
  id v21;
  CPSLayoutHelperView *v22;
  id v23;
  id v24;
  CPSCardPlatterView *v25;
  CPSPausedCardView *v26;
  id v27;
  CPSLayoutHelperView *v28;
  CPSPausedCardView *v29;
  id v30;
  id v31;
  CPSCardPlatterView *v32;
  CPSManeuversCardView *v33;
  id v34;
  CPSLayoutHelperView *v35;
  id v36;
  id v37;
  CPSCardPlatterView *v38;
  CPSManeuversCardView *v39;
  id v40;
  CPSLayoutHelperView *v41;
  CPSManeuversCardView *v42;
  void *v43;
  NSArray *v44;
  NSArray *v45;
  _QWORD v46[2];
  CPSNavigationCardViewController *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v47 = self;
  v46[1] = a2;
  v45 = -[CPSNavigationCardViewController layoutHelperVerticalConstraints](self, "layoutHelperVerticalConstraints");

  if (v45)
  {
    v43 = (void *)MEMORY[0x24BDD1628];
    v44 = -[CPSNavigationCardViewController layoutHelperVerticalConstraints](v47, "layoutHelperVerticalConstraints");
    objc_msgSend(v43, "deactivateConstraints:");

  }
  v46[0] = 0;
  v42 = -[CPSNavigationCardViewController currentManeuversCardView](v47, "currentManeuversCardView");

  if (v42)
  {
    v41 = -[CPSNavigationCardViewController layoutHelperView](v47, "layoutHelperView");
    v40 = (id)-[CPSLayoutHelperView topAnchor](v41, "topAnchor");
    v39 = -[CPSNavigationCardViewController currentManeuversCardView](v47, "currentManeuversCardView");
    v38 = -[CPSManeuversCardView cardPlatterView](v39, "cardPlatterView");
    v37 = (id)-[CPSCardPlatterView topAnchor](v38, "topAnchor");
    v36 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
    v50[0] = v36;
    v35 = -[CPSNavigationCardViewController layoutHelperView](v47, "layoutHelperView");
    v34 = (id)-[CPSLayoutHelperView bottomAnchor](v35, "bottomAnchor");
    v33 = -[CPSNavigationCardViewController currentManeuversCardView](v47, "currentManeuversCardView");
    v32 = -[CPSManeuversCardView cardPlatterView](v33, "cardPlatterView");
    v31 = (id)-[CPSCardPlatterView bottomAnchor](v32, "bottomAnchor");
    v30 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
    v50[1] = v30;
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
    v3 = (void *)v46[0];
    v46[0] = v2;

  }
  else
  {
    v29 = -[CPSNavigationCardViewController currentPausedCardView](v47, "currentPausedCardView");

    if (v29)
    {
      v28 = -[CPSNavigationCardViewController layoutHelperView](v47, "layoutHelperView");
      v27 = (id)-[CPSLayoutHelperView topAnchor](v28, "topAnchor");
      v26 = -[CPSNavigationCardViewController currentPausedCardView](v47, "currentPausedCardView");
      v25 = -[CPSPausedCardView cardPlatterView](v26, "cardPlatterView");
      v24 = (id)-[CPSCardPlatterView topAnchor](v25, "topAnchor");
      v23 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
      v49[0] = v23;
      v22 = -[CPSNavigationCardViewController layoutHelperView](v47, "layoutHelperView");
      v21 = (id)-[CPSLayoutHelperView bottomAnchor](v22, "bottomAnchor");
      v20 = -[CPSNavigationCardViewController currentPausedCardView](v47, "currentPausedCardView");
      v19 = -[CPSPausedCardView cardPlatterView](v20, "cardPlatterView");
      v18 = (id)-[CPSCardPlatterView bottomAnchor](v19, "bottomAnchor");
      v17 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
      v49[1] = v17;
      v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 2);
      v5 = (void *)v46[0];
      v46[0] = v4;

    }
    else
    {
      v16 = -[CPSNavigationCardViewController layoutHelperView](v47, "layoutHelperView");
      v15 = (id)-[CPSLayoutHelperView topAnchor](v16, "topAnchor");
      v14 = (id)-[CPSNavigationCardViewController view](v47, "view");
      v13 = (id)objc_msgSend(v14, "topAnchor");
      v12 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
      v48[0] = v12;
      v11 = -[CPSNavigationCardViewController layoutHelperView](v47, "layoutHelperView");
      v10 = (id)-[CPSLayoutHelperView heightAnchor](v11, "heightAnchor");
      v9 = (id)objc_msgSend(v10, "constraintEqualToConstant:", 0.0);
      v48[1] = v9;
      v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
      v7 = (void *)v46[0];
      v46[0] = v6;

    }
  }
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v46[0], v46);
  -[CPSNavigationCardViewController setLayoutHelperVerticalConstraints:](v47, "setLayoutHelperVerticalConstraints:", v46[0]);
  objc_storeStrong(location, 0);
}

- (void)viewWillLayoutSubviews
{
  objc_super v2;
  SEL v3;
  CPSNavigationCardViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSNavigationCardViewController;
  -[CPSNavigationCardViewController viewWillLayoutSubviews](&v2, sel_viewWillLayoutSubviews);
}

- (void)viewDidLoad
{
  double v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *v24;
  CPSLayoutHelperView *v25;
  id v26;
  id v27;
  objc_super v28;
  SEL v29;
  CPSNavigationCardViewController *v30;
  _QWORD v31[7];

  v31[6] = *MEMORY[0x24BDAC8D0];
  v30 = self;
  v29 = a2;
  v28.receiver = self;
  v28.super_class = (Class)CPSNavigationCardViewController;
  -[CPSNavigationCardViewController viewDidLoad](&v28, sel_viewDidLoad);
  v27 = (id)-[CPSNavigationCardViewController view](v30, "view");
  objc_msgSend(v27, "setUserInteractionEnabled:", 0);
  v26 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v26, "setClipsToBounds:", 1);
  v3 = (id)-[CPSNavigationCardViewController view](v30, "view");
  objc_msgSend(v3, "addSubview:", v26);

  -[CPSNavigationCardViewController setContainerView:](v30, "setContainerView:", v26);
  v25 = objc_alloc_init(CPSLayoutHelperView);
  -[CPSLayoutHelperView setClipsToBounds:](v25, "setClipsToBounds:", 1);
  v4 = (id)-[CPSNavigationCardViewController view](v30, "view");
  objc_msgSend(v4, "addSubview:", v25);

  objc_storeStrong((id *)&v30->_layoutHelperView, v25);
  LODWORD(v2) = 1112014848;
  -[CPSLayoutHelperView setContentHuggingPriority:forAxis:](v25, "setContentHuggingPriority:forAxis:", 1, v2);
  v7 = (id)objc_msgSend(v26, "topAnchor");
  v6 = (id)objc_msgSend(v27, "topAnchor");
  v5 = (id)objc_msgSend(v7, "constraintEqualToAnchor:");
  -[CPSNavigationCardViewController setContainerViewTopConstraint:](v30, "setContainerViewTopConstraint:");

  v9 = (id)objc_msgSend(v26, "heightAnchor");
  v8 = (id)objc_msgSend(v9, "constraintEqualToConstant:", 0.0);
  -[CPSNavigationCardViewController setContainerViewHeightConstraint:](v30, "setContainerViewHeightConstraint:");

  v10 = (void *)MEMORY[0x24BDD1628];
  v24 = -[CPSNavigationCardViewController containerViewTopConstraint](v30, "containerViewTopConstraint");
  v31[0] = v24;
  v23 = -[CPSNavigationCardViewController containerViewHeightConstraint](v30, "containerViewHeightConstraint");
  v31[1] = v23;
  v22 = (id)objc_msgSend(v26, "leftAnchor");
  v21 = (id)objc_msgSend(v27, "leftAnchor");
  v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
  v31[2] = v20;
  v19 = (id)objc_msgSend(v26, "rightAnchor");
  v18 = (id)objc_msgSend(v27, "rightAnchor");
  v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
  v31[3] = v17;
  v16 = (id)-[CPSLayoutHelperView leadingAnchor](v25, "leadingAnchor");
  v15 = (id)objc_msgSend(v27, "leadingAnchor");
  v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v31[4] = v14;
  v13 = (id)-[CPSLayoutHelperView widthAnchor](v25, "widthAnchor");
  v12 = (id)objc_msgSend(v13, "constraintEqualToConstant:", 1.0);
  v31[5] = v12;
  v11 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 6);
  objc_msgSend(v10, "activateConstraints:");

  objc_storeStrong((id *)&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
}

- (void)availableHeightChangedTo:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSLayoutConstraint *v8;
  CPSPausedCardView *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *v11;
  CPSCardPlatterView *v12;
  CPSPausedCardView *v13;
  BOOL v14;
  CPSPausedCardView *v15;
  CPSManeuversCardView *v16;
  NSLayoutConstraint *v17;
  UIView *v18;
  CPSManeuversCardView *v19;
  BOOL v20;
  CPSManeuversCardView *v21;
  NSLayoutConstraint *v22;
  CPSCardPlatterView *v23;
  CPSManeuversCardView *v24;
  BOOL v25;
  CPSManeuversCardView *v26;

  v26 = -[CPSNavigationCardViewController currentManeuversCardView](self, "currentManeuversCardView");

  if (v26)
  {
    v24 = -[CPSNavigationCardViewController currentManeuversCardView](self, "currentManeuversCardView");
    v23 = -[CPSManeuversCardView cardPlatterView](v24, "cardPlatterView");
    -[CPSCardPlatterView frame](v23, "frame");
    v25 = v3 > a3;

    if (v25)
    {
      v19 = -[CPSNavigationCardViewController currentManeuversCardView](self, "currentManeuversCardView");
      v18 = -[CPSNavigationCardViewController containerView](self, "containerView");
      -[UIView bounds](v18, "bounds");
      CGSizeMake_8();
      v20 = -[CPSManeuversCardView canFitSize:](v19, "canFitSize:", v4, v5);

      if (v20)
      {
        v16 = -[CPSNavigationCardViewController currentManeuversCardView](self, "currentManeuversCardView");
        -[CPSManeuversCardView invalidate](v16, "invalidate");

        v17 = -[CPSNavigationCardViewController containerViewHeightConstraint](self, "containerViewHeightConstraint");
        -[NSLayoutConstraint setConstant:](v17, "setConstant:", a3);

        -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](self, "setNavigationCardHidden:forRequester:animated:completion:", 0, CFSTR("Sizing"), 1, 0);
      }
      else
      {
        -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](self, "setNavigationCardHidden:forRequester:animated:completion:", 1, CFSTR("Sizing"), 1, 0);
      }
    }
    else
    {
      v21 = -[CPSNavigationCardViewController currentManeuversCardView](self, "currentManeuversCardView");
      -[CPSManeuversCardView invalidate](v21, "invalidate");

      v22 = -[CPSNavigationCardViewController containerViewHeightConstraint](self, "containerViewHeightConstraint");
      -[NSLayoutConstraint setConstant:](v22, "setConstant:", a3);

      -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](self, "setNavigationCardHidden:forRequester:animated:completion:", 0, CFSTR("Sizing"), 1, 0);
    }
  }
  else
  {
    v15 = -[CPSNavigationCardViewController currentPausedCardView](self, "currentPausedCardView");

    if (v15)
    {
      v13 = -[CPSNavigationCardViewController currentPausedCardView](self, "currentPausedCardView");
      v12 = -[CPSPausedCardView cardPlatterView](v13, "cardPlatterView");
      -[CPSCardPlatterView frame](v12, "frame");
      v14 = v6 > a3;

      if (v14)
      {
        -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](self, "setNavigationCardHidden:forRequester:animated:completion:", 1, CFSTR("Sizing"), 1, 0);
        v10 = -[CPSNavigationCardViewController containerViewTopConstraint](self, "containerViewTopConstraint");
        v9 = -[CPSNavigationCardViewController currentPausedCardView](self, "currentPausedCardView");
        -[CPSPausedCardView frame](v9, "frame");
        -[NSLayoutConstraint setConstant:](v10, "setConstant:", -(v7 + 8.0 + 44.0));

      }
      else
      {
        v11 = -[CPSNavigationCardViewController containerViewHeightConstraint](self, "containerViewHeightConstraint");
        -[NSLayoutConstraint setConstant:](v11, "setConstant:", a3);

        -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](self, "setNavigationCardHidden:forRequester:animated:completion:", 0, CFSTR("Sizing"), 1, 0);
      }
    }
    else
    {
      v8 = -[CPSNavigationCardViewController containerViewHeightConstraint](self, "containerViewHeightConstraint");
      -[NSLayoutConstraint setConstant:](v8, "setConstant:", a3);

      -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](self, "setNavigationCardHidden:forRequester:animated:completion:", 0, CFSTR("Sizing"), 1, 0);
    }
  }
}

- (void)setNavigationCardHidden:(BOOL)a3 forRequester:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  NSMutableSet *v6;
  NSMutableSet *navigationCardHiddenRequesters;
  uint64_t v8;
  void *v9;
  NSMutableSet *v10;
  NSMutableSet *v11;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  int v21;
  int v22;
  void (*v23)(uint64_t);
  void *v24;
  CPSNavigationCardViewController *v25;
  id v26;
  BOOL v27;
  id location;
  BOOL v29;
  SEL v30;
  CPSNavigationCardViewController *v31;

  v31 = self;
  v30 = a2;
  v29 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v27 = a5;
  v26 = 0;
  objc_storeStrong(&v26, a6);
  if (v29)
  {
    if (!v31->_navigationCardHiddenRequesters)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      navigationCardHiddenRequesters = v31->_navigationCardHiddenRequesters;
      v31->_navigationCardHiddenRequesters = v6;

    }
    v11 = -[CPSNavigationCardViewController navigationCardHiddenRequesters](v31, "navigationCardHiddenRequesters");
    -[NSMutableSet addObject:](v11, "addObject:", location);

  }
  else
  {
    v10 = -[CPSNavigationCardViewController navigationCardHiddenRequesters](v31, "navigationCardHiddenRequesters");
    -[NSMutableSet removeObject:](v10, "removeObject:", location);

  }
  -[CPSNavigationCardViewController _updateNavigationCardHidden](v31, "_updateNavigationCardHidden");
  if (v27)
  {
    v9 = (void *)MEMORY[0x24BDF6F90];
    v8 = MEMORY[0x24BDAC760];
    v20 = MEMORY[0x24BDAC760];
    v21 = -1073741824;
    v22 = 0;
    v23 = __92__CPSNavigationCardViewController_setNavigationCardHidden_forRequester_animated_completion___block_invoke;
    v24 = &unk_24E26F1B8;
    v25 = v31;
    v14 = v8;
    v15 = -1073741824;
    v16 = 0;
    v17 = __92__CPSNavigationCardViewController_setNavigationCardHidden_forRequester_animated_completion___block_invoke_2;
    v18 = &unk_24E270788;
    v19 = v26;
    objc_msgSend(v9, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 512, &v20, &v14, 0.4, 0.0, 10.0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong((id *)&v25, 0);
  }
  else if (v26)
  {
    (*((void (**)(void))v26 + 2))();
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&location, 0);
}

void __92__CPSNavigationCardViewController_setNavigationCardHidden_forRequester_animated_completion___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __92__CPSNavigationCardViewController_setNavigationCardHidden_forRequester_animated_completion___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_updateNavigationCardHidden
{
  double v2;
  double v3;
  NSLayoutConstraint *v4;
  CPSPausedCardView *v5;
  NSLayoutConstraint *v6;
  CPSPausedCardView *v7;
  CPSManeuversCardView *v8;
  NSLayoutConstraint *v9;
  CPSManeuversCardView *v10;
  NSMutableSet *v11;
  BOOL v12;

  v11 = -[CPSNavigationCardViewController navigationCardHiddenRequesters](self, "navigationCardHiddenRequesters");
  v12 = -[NSMutableSet count](v11, "count") == 0;

  if (v12)
  {
    if (-[CPSNavigationCardViewController navigationCardHidden](self, "navigationCardHidden"))
    {
      -[CPSNavigationCardViewController setNavigationCardHidden:](self, "setNavigationCardHidden:", 0);
      v4 = -[CPSNavigationCardViewController containerViewTopConstraint](self, "containerViewTopConstraint");
      -[NSLayoutConstraint setConstant:](v4, "setConstant:", 0.0);

    }
  }
  else if (!-[CPSNavigationCardViewController navigationCardHidden](self, "navigationCardHidden"))
  {
    -[CPSNavigationCardViewController setNavigationCardHidden:](self, "setNavigationCardHidden:", 1);
    v10 = -[CPSNavigationCardViewController currentManeuversCardView](self, "currentManeuversCardView");

    if (v10)
    {
      v9 = -[CPSNavigationCardViewController containerViewTopConstraint](self, "containerViewTopConstraint");
      v8 = -[CPSNavigationCardViewController currentManeuversCardView](self, "currentManeuversCardView");
      -[CPSManeuversCardView frame](v8, "frame");
      -[NSLayoutConstraint setConstant:](v9, "setConstant:", -(v2 + 8.0));

    }
    else
    {
      v7 = -[CPSNavigationCardViewController currentPausedCardView](self, "currentPausedCardView");

      if (v7)
      {
        v6 = -[CPSNavigationCardViewController containerViewTopConstraint](self, "containerViewTopConstraint");
        v5 = -[CPSNavigationCardViewController currentPausedCardView](self, "currentPausedCardView");
        -[CPSPausedCardView frame](v5, "frame");
        -[NSLayoutConstraint setConstant:](v6, "setConstant:", -(v3 + 8.0));

      }
    }
  }
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  CPSManeuversCardView *v4;
  CPSManeuversCardView *v5;
  CPSManeuversCardView *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSArray *v15;
  UIView *v16;
  CPSManeuversCardView *v17;
  CPSManeuversCardView *v19;
  char v20;
  CPSManeuversCardView *v21;
  id v22;
  id v23;
  int v24;
  char v25;
  NSArray *v26;
  char v27;
  CPSManeuversCardView *v28;
  char v29;
  id v30;
  id location[2];
  CPSNavigationCardViewController *v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v29 = 0;
  v19 = -[CPSNavigationCardViewController currentManeuversCardView](v32, "currentManeuversCardView");
  v27 = 0;
  v25 = 0;
  v20 = 0;
  if (v19)
  {
    v28 = -[CPSNavigationCardViewController currentManeuversCardView](v32, "currentManeuversCardView");
    v27 = 1;
    v26 = -[CPSManeuversCardView maneuvers](v28, "maneuvers");
    v25 = 1;
    v20 = BSEqualObjects();
  }
  if ((v25 & 1) != 0)

  if ((v27 & 1) != 0)
  v29 = v20 & 1;
  if ((v20 & 1) != 0)
  {
    v17 = -[CPSNavigationCardViewController currentManeuversCardView](v32, "currentManeuversCardView");
    -[CPSManeuversCardView showManeuvers:usingDisplayStyles:](v17, "showManeuvers:usingDisplayStyles:", location[0], MEMORY[0x24BDBD1A8]);

    v24 = 1;
  }
  else
  {
    v23 = -[CPSNavigationCardViewController containerView](v32, "containerView");
    v16 = -[CPSNavigationCardViewController containerView](v32, "containerView");
    v15 = -[UIView subviews](v16, "subviews");
    v22 = (id)-[NSArray copy](v15, "copy");

    v21 = 0;
    -[CPSNavigationCardViewController setCurrentManeuversCardView:](v32, "setCurrentManeuversCardView:");
    -[CPSNavigationCardViewController setCurrentPausedCardView:](v32, "setCurrentPausedCardView:", 0);
    if (objc_msgSend(location[0], "count"))
    {
      v4 = [CPSManeuversCardView alloc];
      v5 = -[CPSManeuversCardView initWithManeuvers:](v4, "initWithManeuvers:", location[0]);
      v6 = v21;
      v21 = v5;

      objc_msgSend(v23, "addSubview:", v21);
      -[CPSNavigationCardViewController setCurrentManeuversCardView:](v32, "setCurrentManeuversCardView:", v21);
      -[CPSNavigationCardViewController _updateCardBackgroundColors](v32, "_updateCardBackgroundColors");
      v7 = (void *)MEMORY[0x24BDD1628];
      v14 = (id)-[CPSManeuversCardView topAnchor](v21, "topAnchor");
      v13 = (id)objc_msgSend(v23, "topAnchor");
      v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
      v33[0] = v12;
      v11 = (id)-[CPSManeuversCardView bottomAnchor](v21, "bottomAnchor");
      v10 = (id)objc_msgSend(v23, "bottomAnchor");
      v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
      v33[1] = v9;
      v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
      objc_msgSend(v7, "activateConstraints:");

    }
    -[CPSNavigationCardViewController _updateHelperConstraints](v32, "_updateHelperConstraints");
    -[CPSNavigationCardViewController _transitionFromViews:inView:](v32, "_transitionFromViews:inView:", v22, v21);
    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
    v24 = 0;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  CPSManeuversCardView *v4;
  CPSManeuversCardView *v6;
  id v7;
  id location[2];
  CPSNavigationCardViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = -[CPSNavigationCardViewController currentManeuversCardView](v9, "currentManeuversCardView");

  if (v6)
  {
    v4 = -[CPSNavigationCardViewController currentManeuversCardView](v9, "currentManeuversCardView");
    -[CPSManeuversCardView updateEstimates:forManeuver:](v4, "updateEstimates:forManeuver:", location[0], v7);

  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6
{
  id v9;
  id v10;
  unint64_t v11;
  id location[2];
  CPSNavigationCardViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = a4;
  v10 = 0;
  objc_storeStrong(&v10, a5);
  v9 = 0;
  objc_storeStrong(&v9, a6);
  -[CPSNavigationCardViewController _showPausedViewForReason:description:pauseCardColor:](v13, "_showPausedViewForReason:description:pauseCardColor:", v11, v10, v9);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_showPausedViewForReason:(unint64_t)a3 description:(id)a4 pauseCardColor:(id)a5
{
  CPSPausedCardView *v5;
  NSArray *v7;
  UIView *v8;
  UIView *v9;
  void *v10;
  id v11;
  id v12;
  NSLayoutYAxisAnchor *v13;
  UIView *v14;
  id v15;
  id v16;
  NSLayoutYAxisAnchor *v17;
  UIView *v18;
  id v19;
  CPSPausedCardView *v20;
  id v21;
  id v22;
  id location;
  unint64_t v24;
  SEL v25;
  CPSNavigationCardViewController *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v26 = self;
  v25 = a2;
  v24 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v8 = -[CPSNavigationCardViewController containerView](v26, "containerView");
  v7 = -[UIView subviews](v8, "subviews");
  v21 = (id)-[NSArray copy](v7, "copy");

  -[CPSNavigationCardViewController setCurrentManeuversCardView:](v26, "setCurrentManeuversCardView:", 0);
  -[CPSNavigationCardViewController setCurrentPausedCardView:](v26, "setCurrentPausedCardView:", 0);
  v5 = [CPSPausedCardView alloc];
  v20 = -[CPSPausedCardView initWithReason:title:backgroundColor:](v5, "initWithReason:title:backgroundColor:", v24, location, v22);
  -[CPSNavigationCardViewController setCurrentPausedCardView:](v26, "setCurrentPausedCardView:", v20);
  -[CPSNavigationCardViewController _updateCardBackgroundColors](v26, "_updateCardBackgroundColors");
  v9 = -[CPSNavigationCardViewController containerView](v26, "containerView");
  -[UIView addSubview:](v9, "addSubview:", v20);

  v10 = (void *)MEMORY[0x24BDD1628];
  v19 = (id)-[CPSPausedCardView topAnchor](v20, "topAnchor");
  v18 = -[CPSNavigationCardViewController containerView](v26, "containerView");
  v17 = -[UIView topAnchor](v18, "topAnchor");
  v16 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
  v27[0] = v16;
  v15 = (id)-[CPSPausedCardView bottomAnchor](v20, "bottomAnchor");
  v14 = -[CPSNavigationCardViewController containerView](v26, "containerView");
  v13 = -[UIView bottomAnchor](v14, "bottomAnchor");
  v12 = (id)objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:");
  v27[1] = v12;
  v11 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  objc_msgSend(v10, "activateConstraints:");

  -[CPSNavigationCardViewController _updateHelperConstraints](v26, "_updateHelperConstraints");
  -[CPSNavigationCardViewController _transitionFromViews:inView:](v26, "_transitionFromViews:inView:", v21, v20);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
}

- (void)_transitionFromViews:(id)a3 inView:(id)a4
{
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
  id v17;
  id v18;
  NSLayoutXAxisAnchor *v19;
  UIView *v20;
  id v21;
  id v22;
  NSLayoutXAxisAnchor *v23;
  UIView *v24;
  id v25;
  UIView *v26;
  NSLayoutConstraint *v27;
  id v28;
  NSLayoutConstraint *v29;
  void *v30;
  id v31;
  void *v32;
  UIView *v33;
  NSLayoutXAxisAnchor *v34;
  UIView *v35;
  id v36;
  UIView *v37;
  NSLayoutXAxisAnchor *v38;
  UIView *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v46;
  int v47;
  int v48;
  void (*v49)(uint64_t);
  void *v50;
  id v51[5];
  uint64_t v52;
  int v53;
  int v54;
  uint64_t (*v55)(uint64_t);
  void *v56;
  CPSNavigationCardViewController *v57;
  id v58[5];
  id v59[5];
  id v60;
  uint64_t v61;
  int v62;
  int v63;
  void (*v64)(uint64_t, void *, void *, void *);
  void *v65;
  CPSNavigationCardViewController *v66;
  BOOL v67;
  BOOL v68;
  id v69;
  id location[2];
  CPSNavigationCardViewController *v71;
  _QWORD v72[2];
  _QWORD v73[3];

  v73[2] = *MEMORY[0x24BDAC8D0];
  v71 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v69 = 0;
  objc_storeStrong(&v69, a4);
  if (objc_msgSend(location[0], "count"))
  {
    v68 = v69 == 0;
    v44 = location[0];
    v61 = MEMORY[0x24BDAC760];
    v62 = -1073741824;
    v63 = 0;
    v64 = __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke;
    v65 = &unk_24E2707B0;
    v66 = v71;
    v67 = v68;
    objc_msgSend(v44, "enumerateObjectsUsingBlock:", &v61);
    if (v69)
    {
      v36 = (id)objc_msgSend(v69, "leadingAnchor");
      v35 = -[CPSNavigationCardViewController containerView](v71, "containerView");
      v34 = -[UIView leadingAnchor](v35, "leadingAnchor");
      v33 = -[CPSNavigationCardViewController containerView](v71, "containerView");
      -[UIView frame](v33, "frame");
      v59[1] = v4;
      v59[2] = v5;
      v59[3] = v6;
      v59[4] = v7;
      v60 = (id)objc_msgSend(v36, "constraintEqualToAnchor:constant:", v34, *(double *)&v6 + 8.0);

      v40 = (id)objc_msgSend(v69, "trailingAnchor");
      v39 = -[CPSNavigationCardViewController containerView](v71, "containerView");
      v38 = -[UIView trailingAnchor](v39, "trailingAnchor");
      v37 = -[CPSNavigationCardViewController containerView](v71, "containerView");
      -[UIView frame](v37, "frame");
      v58[1] = v8;
      v58[2] = v9;
      v58[3] = v10;
      v58[4] = v11;
      v59[0] = (id)objc_msgSend(v40, "constraintEqualToAnchor:constant:", v38, *(double *)&v10 + 8.0);

      v41 = (void *)MEMORY[0x24BDD1628];
      v73[0] = v60;
      v73[1] = v59[0];
      v42 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2);
      objc_msgSend(v41, "activateConstraints:");

      v43 = (id)-[CPSNavigationCardViewController view](v71, "view");
      objc_msgSend(v43, "layoutIfNeeded");

      objc_msgSend(v69, "layoutIfNeeded");
      objc_msgSend(v60, "setConstant:");
      objc_msgSend(v59[0], "setConstant:", 0.0);
      if (-[CPSNavigationCardViewController _shouldAnimate](v71, "_shouldAnimate"))
      {
        v32 = (void *)MEMORY[0x24BDF6F90];
        v52 = MEMORY[0x24BDAC760];
        v53 = -1073741824;
        v54 = 0;
        v55 = __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_4;
        v56 = &unk_24E26EF28;
        v57 = v71;
        v58[0] = v69;
        objc_msgSend(v32, "animateWithDuration:delay:options:animations:completion:", 0, &v52, &__block_literal_global_8, 0.4, 0.0);
        objc_storeStrong(v58, 0);
        objc_storeStrong((id *)&v57, 0);
      }
      else
      {
        v31 = (id)-[CPSNavigationCardViewController view](v71, "view");
        objc_msgSend(v31, "layoutIfNeeded");

        objc_msgSend(v69, "layoutIfNeeded");
      }
      objc_storeStrong(v59, 0);
      objc_storeStrong(&v60, 0);
    }
    objc_storeStrong((id *)&v66, 0);
  }
  else if (v69)
  {
    v16 = (void *)MEMORY[0x24BDD1628];
    v25 = (id)objc_msgSend(v69, "leadingAnchor");
    v24 = -[CPSNavigationCardViewController containerView](v71, "containerView");
    v23 = -[UIView leadingAnchor](v24, "leadingAnchor");
    v22 = (id)objc_msgSend(v25, "constraintEqualToAnchor:constant:");
    v72[0] = v22;
    v21 = (id)objc_msgSend(v69, "trailingAnchor");
    v20 = -[CPSNavigationCardViewController containerView](v71, "containerView");
    v19 = -[UIView trailingAnchor](v20, "trailingAnchor");
    v18 = (id)objc_msgSend(v21, "constraintEqualToAnchor:constant:", 0.0);
    v72[1] = v18;
    v17 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 2);
    objc_msgSend(v16, "activateConstraints:");

    v27 = -[CPSNavigationCardViewController containerViewTopConstraint](v71, "containerViewTopConstraint");
    v26 = -[CPSNavigationCardViewController containerView](v71, "containerView");
    -[UIView frame](v26, "frame");
    v51[1] = v12;
    v51[2] = v13;
    v51[3] = v14;
    v51[4] = v15;
    -[NSLayoutConstraint setConstant:](v27, "setConstant:", -*(double *)&v15);

    v28 = (id)-[CPSNavigationCardViewController view](v71, "view");
    objc_msgSend(v28, "layoutIfNeeded");

    v29 = -[CPSNavigationCardViewController containerViewTopConstraint](v71, "containerViewTopConstraint");
    -[NSLayoutConstraint setConstant:](v29, "setConstant:", 0.0);

    v30 = (void *)MEMORY[0x24BDF6F90];
    v46 = MEMORY[0x24BDAC760];
    v47 = -1073741824;
    v48 = 0;
    v49 = __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_6;
    v50 = &unk_24E26F1B8;
    v51[0] = v71;
    objc_msgSend(v30, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v46, &__block_literal_global_26_0, 0.35, 0.0, 0.8);
    objc_storeStrong(v51, 0);
  }
  objc_storeStrong(&v69, 0);
  objc_storeStrong(location, 0);
}

void __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v16;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38[4];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v38[3] = a3;
  v38[2] = a4;
  v38[1] = (id)a1;
  v38[0] = (id)objc_msgSend(location[0], "snapshotViewAfterScreenUpdates:", 0);
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "containerView");
  objc_msgSend(v16, "addSubview:", v38[0]);

  objc_msgSend(location[0], "frame");
  v34 = v4;
  v35 = v5;
  v36 = v6;
  v37 = v7;
  objc_msgSend(v38[0], "setFrame:", v4, v5, v6, v7);
  objc_msgSend(location[0], "removeFromSuperview");
  objc_msgSend(v38[0], "frame");
  *(_QWORD *)&v32 = v8;
  *((_QWORD *)&v32 + 1) = v9;
  *(_QWORD *)&v33 = v10;
  *((_QWORD *)&v33 + 1) = v11;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    *((double *)&v32 + 1) = *((double *)&v32 + 1) - *((double *)&v33 + 1) - 8.0;
  else
    *(double *)&v32 = *(double *)&v32 - *(double *)&v33 - 8.0;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldAnimate") & 1) != 0)
  {
    v13 = (void *)MEMORY[0x24BDF6F90];
    v12 = MEMORY[0x24BDAC760];
    v24 = MEMORY[0x24BDAC760];
    v25 = -1073741824;
    v26 = 0;
    v27 = __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_2;
    v28 = &unk_24E26F140;
    v29 = v38[0];
    v30 = v32;
    v31 = v33;
    v18 = v12;
    v19 = -1073741824;
    v20 = 0;
    v21 = __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_3;
    v22 = &unk_24E26F168;
    v23 = v38[0];
    objc_msgSend(v13, "animateWithDuration:animations:completion:", &v24, &v18, 0.35);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v29, 0);
  }
  else
  {
    objc_msgSend(v38[0], "removeFromSuperview");
  }
  objc_storeStrong(v38, 0);
  objc_storeStrong(location, 0);
}

uint64_t __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), a1, a1);
}

uint64_t __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v2, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

void __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_6(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)updateTripEstimates:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)_updateSizingViewConstraintsForView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  CPSManeuversCardView *v4;
  CPSPausedCardView *v5;
  id location[2];
  CPSNavigationCardViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSNavigationCardViewController currentManeuversCardView](v7, "currentManeuversCardView");
  -[CPSManeuversCardView removeFromSuperview](v4, "removeFromSuperview");

  v5 = -[CPSNavigationCardViewController currentPausedCardView](v7, "currentPausedCardView");
  -[CPSPausedCardView removeFromSuperview](v5, "removeFromSuperview");

  -[CPSNavigationCardViewController setCurrentPausedCardView:](v7, "setCurrentPausedCardView:", 0);
  -[CPSNavigationCardViewController setCurrentManeuversCardView:](v7, "setCurrentManeuversCardView:", 0);
  -[CPSNavigationCardViewController _updateHelperConstraints](v7, "_updateHelperConstraints");
  objc_storeStrong(location, 0);
}

- (void)setGuidanceBackgroundColor:(id)a3
{
  id location[2];
  CPSNavigationCardViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_guidanceBackgroundColor != location[0])
  {
    objc_storeStrong((id *)&v4->_guidanceBackgroundColor, location[0]);
    -[CPSNavigationCardViewController _updateCardBackgroundColors](v4, "_updateCardBackgroundColors");
  }
  objc_storeStrong(location, 0);
}

- (void)_updateCardBackgroundColors
{
  UIColor *v2;
  CPSManeuversCardView *v3;
  id v4;
  CPSManeuversCardView *v5;
  CPSCardPlatterView *v6;
  UIColor *v7;
  CPSPausedCardView *v8;
  CPSCardPlatterView *v9;
  CPSManeuversCardView *v10;
  id v11;
  CPSManeuversCardView *v12;
  CPSCardPlatterView *v13;
  id v14;
  CPSPausedCardView *v15;
  CPSCardPlatterView *v16;
  CPSCardPlatterView *v17;
  CPSPausedCardView *v18;
  id v19;
  NSArray *v20;
  CPSManeuversCardView *v21;
  BOOL v22;
  char v23;
  UIColor *v24;
  char v25;
  UIColor *v26;
  char v27;
  id v28;
  char v29;
  id v30;
  id location;
  id v32[2];
  CPSNavigationCardViewController *v33;

  v33 = self;
  v32[1] = (id)a2;
  v18 = -[CPSNavigationCardViewController currentPausedCardView](self, "currentPausedCardView");
  v17 = -[CPSPausedCardView cardPlatterView](v18, "cardPlatterView");
  v32[0] = (id)-[CPSCardPlatterView backgroundColor](v17, "backgroundColor");

  v21 = -[CPSNavigationCardViewController currentManeuversCardView](v33, "currentManeuversCardView");
  v20 = -[CPSManeuversCardView maneuvers](v21, "maneuvers");
  v19 = -[NSArray firstObject](v20, "firstObject");
  location = (id)objc_msgSend(v19, "cardBackgroundColor");

  v2 = -[CPSNavigationCardViewController guidanceBackgroundColor](v33, "guidanceBackgroundColor");
  v22 = v2 != 0;

  if (v22)
  {
    v8 = -[CPSNavigationCardViewController currentPausedCardView](v33, "currentPausedCardView");
    v9 = -[CPSPausedCardView cardPlatterView](v8, "cardPlatterView");
    v25 = 0;
    if (v32[0])
    {
      v7 = (UIColor *)v32[0];
    }
    else
    {
      v26 = -[CPSNavigationCardViewController guidanceBackgroundColor](v33, "guidanceBackgroundColor");
      v25 = 1;
      v7 = v26;
    }
    -[CPSCardPlatterView setBackgroundColor:](v9, "setBackgroundColor:", v7);
    if ((v25 & 1) != 0)

    v5 = -[CPSNavigationCardViewController currentManeuversCardView](v33, "currentManeuversCardView");
    v6 = -[CPSManeuversCardView cardPlatterView](v5, "cardPlatterView");
    v23 = 0;
    if (location)
    {
      v4 = location;
    }
    else
    {
      v24 = -[CPSNavigationCardViewController guidanceBackgroundColor](v33, "guidanceBackgroundColor");
      v23 = 1;
      v4 = v24;
    }
    -[CPSCardPlatterView setBackgroundColor:](v6, "setBackgroundColor:", v4);
    if ((v23 & 1) != 0)

    v3 = -[CPSNavigationCardViewController currentManeuversCardView](v33, "currentManeuversCardView");
    -[CPSManeuversCardView setUsesCustomBackgroundColor:](v3, "setUsesCustomBackgroundColor:", 1);

  }
  else
  {
    v15 = -[CPSNavigationCardViewController currentPausedCardView](v33, "currentPausedCardView");
    v16 = -[CPSPausedCardView cardPlatterView](v15, "cardPlatterView");
    v29 = 0;
    if (v32[0])
    {
      v14 = v32[0];
    }
    else
    {
      v30 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
      v29 = 1;
      v14 = v30;
    }
    -[CPSCardPlatterView setBackgroundColor:](v16, "setBackgroundColor:", v14);
    if ((v29 & 1) != 0)

    v12 = -[CPSNavigationCardViewController currentManeuversCardView](v33, "currentManeuversCardView");
    v13 = -[CPSManeuversCardView cardPlatterView](v12, "cardPlatterView");
    v27 = 0;
    if (location)
    {
      v11 = location;
    }
    else
    {
      v28 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
      v27 = 1;
      v11 = v28;
    }
    -[CPSCardPlatterView setBackgroundColor:](v13, "setBackgroundColor:", v11);
    if ((v27 & 1) != 0)

    v10 = -[CPSNavigationCardViewController currentManeuversCardView](v33, "currentManeuversCardView");
    -[CPSManeuversCardView setUsesCustomBackgroundColor:](v10, "setUsesCustomBackgroundColor:", location != 0);

  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v32, 0);
}

- (BOOL)_shouldAnimate
{
  return -[CPSNavigationCardViewController passesLinkCheck](self, "passesLinkCheck", a2, self);
}

- (void)_updateLinkedCheck
{
  void *v2;
  NSString *v3;
  id v4;
  uint64_t v5;
  BOOL v6;
  id location[2];
  CPSNavigationCardViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  v2 = (void *)MEMORY[0x24BDC1550];
  v3 = -[CPSNavigationCardViewController navigatingBundleIdentifier](self, "navigatingBundleIdentifier");
  location[0] = (id)objc_msgSend(v2, "bundleProxyForIdentifier:");

  v4 = (id)objc_msgSend(location[0], "sdkVersion");
  v5 = objc_msgSend(v4, "compare:options:", CFSTR("13.4"), 64);

  v6 = 1;
  if (v5)
    v6 = v5 == 1;
  -[CPSNavigationCardViewController setPassesLinkCheck:](v8, "setPassesLinkCheck:", v6);
  objc_storeStrong(location, 0);
}

- (void)setNavigatingBundleIdentifier:(id)a3
{
  uint64_t v3;
  NSString *navigatingBundleIdentifier;
  id location[2];
  CPSNavigationCardViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v6->_navigatingBundleIdentifier, "isEqualToString:", location[0]))
  {
    v3 = objc_msgSend(location[0], "copy");
    navigatingBundleIdentifier = v6->_navigatingBundleIdentifier;
    v6->_navigatingBundleIdentifier = (NSString *)v3;

    -[CPSNavigationCardViewController _updateLinkedCheck](v6, "_updateLinkedCheck");
  }
  objc_storeStrong(location, 0);
}

- (CPSLayoutHelperView)layoutHelperView
{
  return self->_layoutHelperView;
}

- (UIColor)guidanceBackgroundColor
{
  return self->_guidanceBackgroundColor;
}

- (BOOL)navigationCardHidden
{
  return self->_navigationCardHidden;
}

- (void)setNavigationCardHidden:(BOOL)a3
{
  self->_navigationCardHidden = a3;
}

- (NSString)navigatingBundleIdentifier
{
  return self->_navigatingBundleIdentifier;
}

- (NSLayoutConstraint)containerViewHeightConstraint
{
  return self->_containerViewHeightConstraint;
}

- (void)setContainerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewHeightConstraint, a3);
}

- (NSLayoutConstraint)containerViewTopConstraint
{
  return self->_containerViewTopConstraint;
}

- (void)setContainerViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewTopConstraint, a3);
}

- (NSLayoutConstraint)sizingViewBottomConstraint
{
  return self->_sizingViewBottomConstraint;
}

- (void)setSizingViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sizingViewBottomConstraint, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (CPSManeuversCardView)currentManeuversCardView
{
  return self->_currentManeuversCardView;
}

- (void)setCurrentManeuversCardView:(id)a3
{
  objc_storeStrong((id *)&self->_currentManeuversCardView, a3);
}

- (CPSPausedCardView)currentPausedCardView
{
  return self->_currentPausedCardView;
}

- (void)setCurrentPausedCardView:(id)a3
{
  objc_storeStrong((id *)&self->_currentPausedCardView, a3);
}

- (NSMutableSet)navigationCardHiddenRequesters
{
  return self->_navigationCardHiddenRequesters;
}

- (void)setNavigationCardHiddenRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_navigationCardHiddenRequesters, a3);
}

- (BOOL)passesLinkCheck
{
  return self->_passesLinkCheck;
}

- (void)setPassesLinkCheck:(BOOL)a3
{
  self->_passesLinkCheck = a3;
}

- (NSArray)layoutHelperVerticalConstraints
{
  return self->_layoutHelperVerticalConstraints;
}

- (void)setLayoutHelperVerticalConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutHelperVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_navigationCardHiddenRequesters, 0);
  objc_storeStrong((id *)&self->_currentPausedCardView, 0);
  objc_storeStrong((id *)&self->_currentManeuversCardView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_sizingViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_containerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_containerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_navigatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_guidanceBackgroundColor, 0);
  objc_storeStrong((id *)&self->_layoutHelperView, 0);
}

@end

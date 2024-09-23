@implementation CPSInstrumentClusterViewController

- (void)loadView
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
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
  id v23;
  id v24;
  id v25;
  id v26;
  NSArray *v27;
  BOOL v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  NSArray *v36;
  BOOL v37;
  CPSAbridgableLabel *v38;
  objc_super v39;
  SEL v40;
  CPSInstrumentClusterViewController *v41;
  _QWORD v42[5];

  v42[4] = *MEMORY[0x24BDAC8D0];
  v41 = self;
  v40 = a2;
  v39.receiver = self;
  v39.super_class = (Class)CPSInstrumentClusterViewController;
  -[CPSInstrumentClusterViewController loadView](&v39, sel_loadView);
  v31 = (id)-[CPSInstrumentClusterViewController view](v41, "view");
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v33 = (id)-[CPSInstrumentClusterViewController view](v41, "view");
  v32 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  objc_msgSend(v33, "setBackgroundColor:");

  v38 = objc_alloc_init(CPSAbridgableLabel);
  -[CPSInstrumentClusterViewController setInactiveLabel:](v41, "setInactiveLabel:", v38);
  v34 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 16.0, *MEMORY[0x24BDF7888]);
  -[CPSAbridgableLabel setFont:](v38, "setFont:");

  -[CPSAbridgableLabel setTextAlignment:](v38, "setTextAlignment:");
  -[CPSAbridgableLabel setNumberOfLines:](v38, "setNumberOfLines:", 1);
  v35 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  -[CPSAbridgableLabel setTextColor:](v38, "setTextColor:");

  -[CPSAbridgableLabel setTranslatesAutoresizingMaskIntoConstraints:](v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v36 = -[CPSInstrumentClusterViewController attributedInactiveVariants](v41, "attributedInactiveVariants");
  v37 = -[NSArray count](v36, "count") == 0;

  if (v37)
  {
    v27 = -[CPSInstrumentClusterViewController inactiveVariants](v41, "inactiveVariants");
    v28 = -[NSArray count](v27, "count") == 0;

    if (!v28)
    {
      v26 = (id)objc_opt_self();
      v25 = (id)objc_msgSend(v26, "inactiveVariants");
      -[CPSAbridgableLabel setTextVariants:](v38, "setTextVariants:");

    }
  }
  else
  {
    v30 = (id)objc_opt_self();
    v29 = (id)objc_msgSend(v30, "attributedInactiveVariants");
    -[CPSAbridgableLabel setAttributedTextVariants:](v38, "setAttributedTextVariants:");

  }
  v2 = (id)-[CPSInstrumentClusterViewController view](v41, "view");
  objc_msgSend(v2, "addSubview:", v38);

  v3 = (void *)MEMORY[0x24BDD1628];
  v24 = (id)-[CPSInstrumentClusterViewController view](v41, "view");
  v23 = (id)objc_msgSend(v24, "safeAreaLayoutGuide");
  v22 = (id)objc_msgSend(v23, "leadingAnchor");
  v21 = (id)-[CPSAbridgableLabel leadingAnchor](v38, "leadingAnchor");
  v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:constant:", -8.0);
  v42[0] = v20;
  v19 = (id)-[CPSInstrumentClusterViewController view](v41, "view");
  v18 = (id)objc_msgSend(v19, "safeAreaLayoutGuide");
  v17 = (id)objc_msgSend(v18, "trailingAnchor");
  v16 = (id)-[CPSAbridgableLabel trailingAnchor](v38, "trailingAnchor");
  v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:", 8.0);
  v42[1] = v15;
  v14 = (id)-[CPSInstrumentClusterViewController view](v41, "view");
  v13 = (id)objc_msgSend(v14, "safeAreaLayoutGuide");
  v12 = (id)objc_msgSend(v13, "centerYAnchor");
  v11 = (id)-[CPSAbridgableLabel centerYAnchor](v38, "centerYAnchor");
  v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:constant:");
  v42[2] = v10;
  v9 = (id)-[CPSInstrumentClusterViewController view](v41, "view");
  v8 = (id)objc_msgSend(v9, "safeAreaLayoutGuide");
  v7 = (id)objc_msgSend(v8, "centerXAnchor");
  v6 = (id)-[CPSAbridgableLabel centerXAnchor](v38, "centerXAnchor");
  v5 = (id)objc_msgSend(v7, "constraintEqualToAnchor:constant:", 0.0);
  v42[3] = v5;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
  objc_msgSend(v3, "activateConstraints:");

  objc_storeStrong((id *)&v38, 0);
}

- (void)setGuidanceStyle:(int64_t)a3
{
  if (self->_guidanceStyle != a3)
  {
    self->_guidanceStyle = a3;
    -[CPSInstrumentClusterViewController _updateGuidanceStyle](self, "_updateGuidanceStyle");
  }
}

- (void)_updateGuidanceStyle
{
  -[CPSInstrumentClusterViewController guidanceStyle](self, "guidanceStyle");
}

- (void)setInactiveVariants:(id)a3
{
  uint64_t v3;
  NSArray *inactiveVariants;
  CPSAbridgableLabel *v5;
  id location[2];
  CPSInstrumentClusterViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "copy");
  inactiveVariants = v7->_inactiveVariants;
  v7->_inactiveVariants = (NSArray *)v3;

  v5 = -[CPSInstrumentClusterViewController inactiveLabel](v7, "inactiveLabel");
  -[CPSAbridgableLabel setTextVariants:](v5, "setTextVariants:", v7->_inactiveVariants);

  objc_storeStrong(location, 0);
}

- (void)setAttributedInactiveVariants:(id)a3
{
  uint64_t v3;
  NSArray *attributedInactiveVariants;
  CPSAbridgableLabel *v5;
  id location[2];
  CPSInstrumentClusterViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "copy");
  attributedInactiveVariants = v7->_attributedInactiveVariants;
  v7->_attributedInactiveVariants = (NSArray *)v3;

  v5 = -[CPSInstrumentClusterViewController inactiveLabel](v7, "inactiveLabel");
  -[CPSAbridgableLabel setAttributedTextVariants:](v5, "setAttributedTextVariants:", v7->_attributedInactiveVariants);

  objc_storeStrong(location, 0);
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  CPSDashboardManeuversCardView *v4;
  CPSDashboardManeuversCardView *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CPSDashboardManeuversCardView *v20;
  CPSClusterPausedCardView *v21;
  CPSClusterPausedCardView *v22;
  CPSDashboardManeuversCardView *v23;
  CPSAbridgableLabel *v25;
  CPSDashboardManeuversCardView *v26;
  CPSDashboardManeuversCardView *v27;
  BOOL v28;
  id v29;
  id v30;
  id location[2];
  CPSInstrumentClusterViewController *v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v25 = -[CPSInstrumentClusterViewController inactiveLabel](v32, "inactiveLabel");
  -[CPSAbridgableLabel setHidden:](v25, "setHidden:", 1);

  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = -[CPSInstrumentClusterViewController maneuversCardView](v32, "maneuversCardView");

  if (v26)
  {
    v23 = -[CPSInstrumentClusterViewController maneuversCardView](v32, "maneuversCardView");
    objc_msgSend(v29, "addObject:");

  }
  v22 = -[CPSInstrumentClusterViewController pausedCardView](v32, "pausedCardView");

  if (v22)
  {
    v21 = -[CPSInstrumentClusterViewController pausedCardView](v32, "pausedCardView");
    objc_msgSend(v29, "addObject:");

  }
  v28 = objc_msgSend(v29, "count") != 0;
  -[CPSInstrumentClusterViewController setManeuversCardView:](v32, "setManeuversCardView:");
  -[CPSInstrumentClusterViewController setPausedCardView:](v32, "setPausedCardView:", 0);
  v27 = 0;
  if (objc_msgSend(location[0], "count"))
  {
    v4 = objc_alloc_init(CPSDashboardManeuversCardView);
    v5 = v27;
    v27 = v4;

    v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    -[CPSDashboardManeuversCardView setBackgroundColor:](v27, "setBackgroundColor:");

    -[CPSDashboardManeuversCardView setAllowsCustomBackgroundColorForManeuver:](v27, "setAllowsCustomBackgroundColorForManeuver:", 1);
    -[CPSDashboardManeuversCardView setTranslatesAutoresizingMaskIntoConstraints:](v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (id)-[CPSInstrumentClusterViewController view](v32, "view");
    objc_msgSend(v7, "addSubview:", v27);

    objc_storeStrong((id *)&v32->_maneuversCardView, v27);
    -[CPSDashboardManeuversCardView showManeuvers:usingDisplayStyles:](v27, "showManeuvers:usingDisplayStyles:", location[0], v30);
    v8 = (void *)MEMORY[0x24BDD1628];
    v19 = (id)-[CPSInstrumentClusterViewController view](v32, "view");
    v18 = (id)objc_msgSend(v19, "safeAreaLayoutGuide");
    v17 = (id)objc_msgSend(v18, "topAnchor");
    v16 = (id)-[CPSDashboardManeuversCardView topAnchor](v27, "topAnchor");
    v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v33[0] = v15;
    v14 = (id)-[CPSInstrumentClusterViewController view](v32, "view");
    v13 = (id)objc_msgSend(v14, "safeAreaLayoutGuide");
    v12 = (id)objc_msgSend(v13, "bottomAnchor");
    v11 = (id)-[CPSDashboardManeuversCardView bottomAnchor](v27, "bottomAnchor");
    v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
    v33[1] = v10;
    v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
    objc_msgSend(v8, "activateConstraints:");

    v20 = -[CPSInstrumentClusterViewController maneuversCardView](v32, "maneuversCardView");
    -[CPSDashboardManeuversCardView setHidden:](v20, "setHidden:", 0);

  }
  -[CPSInstrumentClusterViewController _transitionFromViews:inView:animated:](v32, "_transitionFromViews:inView:animated:", v29, v27, v28);
  objc_storeStrong((id *)&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  CPSDashboardManeuversCardView *v5;
  id v6;
  id location[2];
  CPSInstrumentClusterViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[CPSInstrumentClusterViewController maneuversCardView](v8, "maneuversCardView");
  -[CPSDashboardManeuversCardView updateEstimates:forManeuver:](v5, "updateEstimates:forManeuver:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6
{
  CPSClusterPausedCardView *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CPSClusterPausedCardView *v20;
  CPSClusterPausedCardView *v21;
  CPSDashboardManeuversCardView *v22;
  CPSAbridgableLabel *v26;
  CPSDashboardManeuversCardView *v27;
  CPSClusterPausedCardView *v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  id location[2];
  CPSInstrumentClusterViewController *v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = a4;
  v31 = 0;
  objc_storeStrong(&v31, a5);
  v30 = 0;
  objc_storeStrong(&v30, a6);
  v26 = -[CPSInstrumentClusterViewController inactiveLabel](v34, "inactiveLabel");
  -[CPSAbridgableLabel setHidden:](v26, "setHidden:", 1);

  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = -[CPSInstrumentClusterViewController maneuversCardView](v34, "maneuversCardView");

  if (v27)
  {
    v22 = -[CPSInstrumentClusterViewController maneuversCardView](v34, "maneuversCardView");
    objc_msgSend(v29, "addObject:");

  }
  v21 = -[CPSInstrumentClusterViewController pausedCardView](v34, "pausedCardView");

  if (v21)
  {
    v20 = -[CPSInstrumentClusterViewController pausedCardView](v34, "pausedCardView");
    objc_msgSend(v29, "addObject:");

  }
  -[CPSInstrumentClusterViewController setManeuversCardView:](v34, "setManeuversCardView:");
  -[CPSInstrumentClusterViewController setPausedCardView:](v34, "setPausedCardView:", 0);
  v6 = [CPSClusterPausedCardView alloc];
  v28 = -[CPSPausedCardView initWithReason:title:backgroundColor:](v6, "initWithReason:title:backgroundColor:", v32, v31, v30);
  v7 = (id)-[CPSInstrumentClusterViewController view](v34, "view");
  objc_msgSend(v7, "addSubview:", v28);

  objc_storeStrong((id *)&v34->_pausedCardView, v28);
  v8 = (void *)MEMORY[0x24BDD1628];
  v19 = (id)-[CPSInstrumentClusterViewController view](v34, "view");
  v18 = (id)objc_msgSend(v19, "safeAreaLayoutGuide");
  v17 = (id)objc_msgSend(v18, "topAnchor");
  v16 = (id)-[CPSClusterPausedCardView topAnchor](v28, "topAnchor");
  v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  v35[0] = v15;
  v14 = (id)-[CPSInstrumentClusterViewController view](v34, "view");
  v13 = (id)objc_msgSend(v14, "safeAreaLayoutGuide");
  v12 = (id)objc_msgSend(v13, "bottomAnchor");
  v11 = (id)-[CPSClusterPausedCardView bottomAnchor](v28, "bottomAnchor");
  v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v35[1] = v10;
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  objc_msgSend(v8, "activateConstraints:");

  -[CPSInstrumentClusterViewController _transitionFromViews:inView:animated:](v34, "_transitionFromViews:inView:animated:", v29, v28, 1);
  objc_storeStrong((id *)&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  CPSAbridgableLabel *v4;
  CPSClusterPausedCardView *v5;
  CPSClusterPausedCardView *v6;
  CPSDashboardManeuversCardView *v7;
  CPSDashboardManeuversCardView *v9;
  id v10;
  BOOL v11;
  id location[2];
  CPSInstrumentClusterViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = -[CPSInstrumentClusterViewController maneuversCardView](v13, "maneuversCardView");

  if (v9)
  {
    v7 = -[CPSInstrumentClusterViewController maneuversCardView](v13, "maneuversCardView");
    objc_msgSend(v10, "addObject:");

  }
  v6 = -[CPSInstrumentClusterViewController pausedCardView](v13, "pausedCardView");

  if (v6)
  {
    v5 = -[CPSInstrumentClusterViewController pausedCardView](v13, "pausedCardView");
    objc_msgSend(v10, "addObject:");

  }
  -[CPSInstrumentClusterViewController setManeuversCardView:](v13, "setManeuversCardView:");
  -[CPSInstrumentClusterViewController setPausedCardView:](v13, "setPausedCardView:", 0);
  -[CPSInstrumentClusterViewController _transitionFromViews:inView:animated:](v13, "_transitionFromViews:inView:animated:", v10, 0, 1);
  v4 = -[CPSInstrumentClusterViewController inactiveLabel](v13, "inactiveLabel");
  -[CPSAbridgableLabel setHidden:](v4, "setHidden:", 0);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_transitionFromViews:(id)a3 inView:(id)a4 animated:(BOOL)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v42;
  int v43;
  int v44;
  void (*v45)(uint64_t);
  void *v46;
  id v47[5];
  id v48[5];
  id v49;
  uint64_t v50;
  int v51;
  int v52;
  void (*v53)(id *, void *, void *, void *);
  void *v54;
  CPSInstrumentClusterViewController *v55;
  BOOL v56;
  id v57;
  id location[2];
  CPSInstrumentClusterViewController *v59;
  _QWORD v60[2];
  _QWORD v61[3];

  v61[2] = *MEMORY[0x24BDAC8D0];
  v59 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v57 = 0;
  objc_storeStrong(&v57, a4);
  v56 = a5;
  if (a5)
  {
    v39 = location[0];
    v50 = MEMORY[0x24BDAC760];
    v51 = -1073741824;
    v52 = 0;
    v53 = __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke;
    v54 = &unk_24E26F190;
    v55 = v59;
    objc_msgSend(v39, "enumerateObjectsUsingBlock:", &v50);
    if (v57)
    {
      v29 = (id)objc_msgSend(v57, "leadingAnchor");
      v28 = (id)-[CPSInstrumentClusterViewController view](v59, "view");
      v27 = (id)objc_msgSend(v28, "safeAreaLayoutGuide");
      v26 = (id)objc_msgSend(v27, "leadingAnchor");
      v25 = (id)-[CPSInstrumentClusterViewController view](v59, "view");
      objc_msgSend(v25, "frame");
      v48[1] = v5;
      v48[2] = v6;
      v48[3] = v7;
      v48[4] = v8;
      v49 = (id)objc_msgSend(v29, "constraintEqualToAnchor:constant:", v26, *(double *)&v7);

      v34 = (id)objc_msgSend(v57, "trailingAnchor");
      v33 = (id)-[CPSInstrumentClusterViewController view](v59, "view");
      v32 = (id)objc_msgSend(v33, "safeAreaLayoutGuide");
      v31 = (id)objc_msgSend(v32, "trailingAnchor");
      v30 = (id)-[CPSInstrumentClusterViewController view](v59, "view");
      objc_msgSend(v30, "frame");
      v47[1] = v9;
      v47[2] = v10;
      v47[3] = v11;
      v47[4] = v12;
      v48[0] = (id)objc_msgSend(v34, "constraintEqualToAnchor:constant:", v31, *(double *)&v11);

      v35 = (void *)MEMORY[0x24BDD1628];
      v61[0] = v49;
      v61[1] = v48[0];
      v36 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
      objc_msgSend(v35, "activateConstraints:");

      v37 = (id)-[CPSInstrumentClusterViewController view](v59, "view");
      objc_msgSend(v37, "layoutIfNeeded");

      objc_msgSend(v57, "layoutIfNeeded");
      objc_msgSend(v49, "setConstant:");
      objc_msgSend(v48[0], "setConstant:", 0.0);
      v38 = (void *)MEMORY[0x24BDF6F90];
      v42 = MEMORY[0x24BDAC760];
      v43 = -1073741824;
      v44 = 0;
      v45 = __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_4;
      v46 = &unk_24E26F1B8;
      v47[0] = v59;
      objc_msgSend(v38, "animateWithDuration:delay:options:animations:completion:", 0, &v42, &__block_literal_global_16, 0.35, 0.0);
      objc_storeStrong(v47, 0);
      objc_storeStrong(v48, 0);
      objc_storeStrong(&v49, 0);
    }
    objc_storeStrong((id *)&v55, 0);
  }
  else if (v57)
  {
    v13 = (void *)MEMORY[0x24BDD1628];
    v24 = (id)objc_msgSend(v57, "leadingAnchor");
    v23 = (id)-[CPSInstrumentClusterViewController view](v59, "view");
    v22 = (id)objc_msgSend(v23, "safeAreaLayoutGuide");
    v21 = (id)objc_msgSend(v22, "leadingAnchor");
    v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:constant:");
    v60[0] = v20;
    v19 = (id)objc_msgSend(v57, "trailingAnchor");
    v18 = (id)-[CPSInstrumentClusterViewController view](v59, "view");
    v17 = (id)objc_msgSend(v18, "safeAreaLayoutGuide");
    v16 = (id)objc_msgSend(v17, "trailingAnchor");
    v15 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", 0.0);
    v60[1] = v15;
    v14 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
    objc_msgSend(v13, "activateConstraints:");

  }
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
}

void __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v39[3] = a3;
  v39[2] = a4;
  v39[1] = a1;
  v39[0] = (id)objc_msgSend(location[0], "snapshotViewAfterScreenUpdates:", 0);
  v15 = (id)objc_msgSend(a1[4], "view");
  objc_msgSend(v15, "addSubview:", v39[0]);

  v16 = v39[0];
  objc_msgSend(location[0], "frame");
  v35 = v4;
  v36 = v5;
  v37 = v6;
  v38 = v7;
  objc_msgSend(v16, "setFrame:", v4, v5, v6, v7);
  objc_msgSend(location[0], "removeFromSuperview");
  objc_msgSend(v39[0], "frame");
  *((_QWORD *)&v33 + 1) = v8;
  *(double *)&v34 = v9;
  *((_QWORD *)&v34 + 1) = v10;
  *(double *)&v33 = v11 - v9;
  v18 = (void *)MEMORY[0x24BDF6F90];
  v17 = MEMORY[0x24BDAC760];
  v25 = MEMORY[0x24BDAC760];
  v26 = -1073741824;
  v27 = 0;
  v28 = __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_2;
  v29 = &unk_24E26F140;
  v30 = v39[0];
  v31 = v33;
  v32 = v34;
  v19 = v17;
  v20 = -1073741824;
  v21 = 0;
  v22 = __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_3;
  v23 = &unk_24E26F168;
  v24 = v39[0];
  objc_msgSend(v18, "animateWithDuration:animations:completion:", &v25, 0.35);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(v39, 0);
  objc_storeStrong(location, 0);
}

uint64_t __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), a1, a1);
}

uint64_t __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

- (int64_t)guidanceStyle
{
  return self->_guidanceStyle;
}

- (NSArray)inactiveVariants
{
  return self->_inactiveVariants;
}

- (NSArray)attributedInactiveVariants
{
  return self->_attributedInactiveVariants;
}

- (CPSDashboardManeuversCardView)maneuversCardView
{
  return self->_maneuversCardView;
}

- (void)setManeuversCardView:(id)a3
{
  objc_storeStrong((id *)&self->_maneuversCardView, a3);
}

- (CPSClusterPausedCardView)pausedCardView
{
  return self->_pausedCardView;
}

- (void)setPausedCardView:(id)a3
{
  objc_storeStrong((id *)&self->_pausedCardView, a3);
}

- (CPSAbridgableLabel)inactiveLabel
{
  return self->_inactiveLabel;
}

- (void)setInactiveLabel:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveLabel, 0);
  objc_storeStrong((id *)&self->_pausedCardView, 0);
  objc_storeStrong((id *)&self->_maneuversCardView, 0);
  objc_storeStrong((id *)&self->_attributedInactiveVariants, 0);
  objc_storeStrong((id *)&self->_inactiveVariants, 0);
}

@end

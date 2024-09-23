@implementation CPSPanViewController

- (CPSPanViewController)initWithEnvironment:(id)a3
{
  CPSPanViewController *v3;
  CPSPanViewController *v5;
  CPSPanViewController *v6;
  objc_super v7;
  id location[2];
  CPSPanViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)CPSPanViewController;
  v6 = -[CPSPanViewController init](&v7, sel_init);
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
    objc_storeWeak((id *)&v9->_environment, location[0]);
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)loadView
{
  id v2;
  id v3;

  v2 = objc_alloc(MEMORY[0x24BE153B8]);
  v3 = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CPSPanViewController setView:](self, "setView:");

}

- (void)viewDidLoad
{
  BOOL v2;
  CPSPanView *v3;
  CPSTemplateEnvironment *v4;
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
  CPSPanViewController *v20;
  id v21;
  id v22;
  id v23;
  CPSPanView *v24;
  id v25;
  objc_super v26;
  SEL v27;
  CPSPanViewController *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v28 = self;
  v27 = a2;
  v26.receiver = self;
  v26.super_class = (Class)CPSPanViewController;
  -[CPSPanViewController viewDidLoad](&v26, sel_viewDidLoad);
  v4 = -[CPSPanViewController environment](v28, "environment");
  v2 = -[CPSTemplateEnvironment rightHandDrive](v4, "rightHandDrive");
  v28->_rightHandDrive = v2;

  v25 = (id)-[CPSPanViewController view](v28, "view");
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = [CPSPanView alloc];
  v24 = -[CPSPanView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CPSPanView setDelegate:](v24, "setDelegate:", v28);
  objc_msgSend(v25, "addSubview:", v24);
  v5 = v25;
  v18 = (id)-[CPSPanView leftAnchor](v24, "leftAnchor");
  v17 = (id)objc_msgSend(v25, "leftAnchor");
  v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
  v29[0] = v16;
  v15 = (id)-[CPSPanView topAnchor](v24, "topAnchor");
  v14 = (id)objc_msgSend(v25, "topAnchor");
  v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
  v29[1] = v13;
  v12 = (id)-[CPSPanView rightAnchor](v24, "rightAnchor");
  v11 = (id)objc_msgSend(v25, "rightAnchor");
  v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v29[2] = v10;
  v9 = (id)-[CPSPanView bottomAnchor](v24, "bottomAnchor");
  v8 = (id)objc_msgSend(v25, "bottomAnchor");
  v7 = (id)objc_msgSend(v9, "constraintEqualToAnchor:");
  v29[3] = v7;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
  objc_msgSend(v5, "addConstraints:");

  -[CPSPanViewController setPanView:](v28, "setPanView:", v24);
  v23 = &unk_24E29A8F0;
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = v23;
  v20 = v28;
  v21 = v22;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:");
  objc_storeStrong((id *)&v28->_nudgeGestureRecognizers, v22);
  objc_storeStrong(&v21, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(&v25, 0);
}

void __35__CPSPanViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  _CPSNudgeTapGestureRecognizer *v8;
  id v9;
  _CPSNudgeTapGestureRecognizer *v11;
  id v12[4];
  id location[2];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[3] = a3;
  v12[2] = a4;
  v12[1] = (id)a1;
  v12[0] = -[_CPSNudgeLongPressGestureRecognizer initWithTarget:action:]([_CPSNudgeLongPressGestureRecognizer alloc], "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel__handleNudgeLongPress_);
  v6 = v12[0];
  v15[0] = location[0];
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15);
  objc_msgSend(v6, "setAllowedPressTypes:");

  objc_msgSend(v12[0], "setDirection:", _CPPanDirectionForPressType(objc_msgSend(location[0], "unsignedIntegerValue")));
  objc_msgSend(v12[0], "setMinimumPressDuration:", 0.25);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12[0]);
  v11 = -[_CPSNudgeTapGestureRecognizer initWithTarget:action:]([_CPSNudgeTapGestureRecognizer alloc], "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel__handleNudgeTapped_);
  v8 = v11;
  v14 = location[0];
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  -[_CPSNudgeTapGestureRecognizer setAllowedPressTypes:](v8, "setAllowedPressTypes:");

  -[_CPSNudgeTapGestureRecognizer setDirection:](v11, "setDirection:", _CPPanDirectionForPressType(objc_msgSend(location[0], "unsignedIntegerValue")));
  -[_CPSNudgeTapGestureRecognizer requireGestureRecognizerToFail:](v11, "requireGestureRecognizerToFail:", v12[0]);
  -[_CPSNudgeTapGestureRecognizer setDelegate:](v11, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  NSArray *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *, void *);
  void *v8;
  CPSPanViewController *v9;
  objc_super v10;
  BOOL v11;
  SEL v12;
  CPSPanViewController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSPanViewController;
  -[CPSPanViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  v3 = -[CPSPanViewController nudgeGestureRecognizers](v13, "nudgeGestureRecognizers");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __38__CPSPanViewController_viewDidAppear___block_invoke;
  v8 = &unk_24E26FDC8;
  v9 = v13;
  -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:");

  -[CPSPanViewController setNeedsFocusUpdate](v13, "setNeedsFocusUpdate");
  objc_storeStrong((id *)&v9, 0);
}

void __38__CPSPanViewController_viewDidAppear___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(a1[4], "view");
  v3 = (id)objc_msgSend(v4, "_window");
  objc_msgSend(v3, "addGestureRecognizer:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSArray *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *, void *);
  void *v8;
  CPSPanViewController *v9;
  objc_super v10;
  BOOL v11;
  SEL v12;
  CPSPanViewController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSPanViewController;
  -[CPSPanViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, a3);
  v3 = -[CPSPanViewController nudgeGestureRecognizers](v13, "nudgeGestureRecognizers");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __42__CPSPanViewController_viewWillDisappear___block_invoke;
  v8 = &unk_24E26FDC8;
  v9 = v13;
  -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:");

  objc_storeStrong((id *)&v9, 0);
}

void __42__CPSPanViewController_viewWillDisappear___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(a1[4], "view");
  v3 = (id)objc_msgSend(v4, "_window");
  objc_msgSend(v3, "removeGestureRecognizer:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)_handleNudgeTapped:(id)a3
{
  CPSPanEventDelegate *v3;
  id location[2];
  CPSPanViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSPanViewController panDelegate](v5, "panDelegate");
  -[CPSPanEventDelegate panWithDirection:](v3, "panWithDirection:", objc_msgSend(location[0], "direction"));

  objc_storeStrong(location, 0);
}

- (void)_handleNudgeLongPress:(id)a3
{
  CPSPanEventDelegate *v3;
  CPSPanEventDelegate *v4;
  uint64_t v5;
  id location[2];
  CPSPanViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = objc_msgSend(location[0], "state");
  if (v5 == 1)
  {
    v4 = -[CPSPanViewController panDelegate](v7, "panDelegate");
    -[CPSPanEventDelegate panBeganWithDirection:](v4, "panBeganWithDirection:", objc_msgSend(location[0], "direction"));

  }
  else if (v5 == 3)
  {
    v3 = -[CPSPanViewController panDelegate](v7, "panDelegate");
    -[CPSPanEventDelegate panEndedWithDirection:](v3, "panEndedWithDirection:", objc_msgSend(location[0], "direction"));

  }
  objc_storeStrong(location, 0);
}

- (void)panView:(id)a3 panBeganWithDirection:(int64_t)a4
{
  CPSPanEventDelegate *v5;
  id location[2];
  CPSPanViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSPanViewController panDelegate](v7, "panDelegate");
  -[CPSPanEventDelegate panBeganWithDirection:](v5, "panBeganWithDirection:", a4);

  objc_storeStrong(location, 0);
}

- (void)panView:(id)a3 panEndedWithDirection:(int64_t)a4
{
  CPSPanEventDelegate *v5;
  id location[2];
  CPSPanViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSPanViewController panDelegate](v7, "panDelegate");
  -[CPSPanEventDelegate panEndedWithDirection:](v5, "panEndedWithDirection:", a4);

  objc_storeStrong(location, 0);
}

- (void)panView:(id)a3 panWithDirection:(int64_t)a4
{
  CPSPanEventDelegate *v5;
  id location[2];
  CPSPanViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSPanViewController panDelegate](v7, "panDelegate");
  -[CPSPanEventDelegate panWithDirection:](v5, "panWithDirection:", a4);

  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  CPSPanButton *v3;
  CPSPanView *v4;
  CPSPanButton *v5;
  CPSPanView *v6;
  id v7;
  CPSPanButton *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (self->_rightHandDrive)
  {
    v6 = -[CPSPanViewController panView](self, "panView");
    v5 = -[CPSPanView panLeftButton](v6, "panLeftButton");
    v9[0] = v5;
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);

  }
  else
  {
    v4 = -[CPSPanViewController panView](self, "panView");
    v3 = -[CPSPanView panUpButton](v4, "panUpButton");
    v8 = v3;
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);

  }
  return v7;
}

- (id)_linearFocusItemsWithPresentedMapButtons:(id)a3
{
  id v4;
  CPSPanButton *v5;
  CPSPanView *v6;
  id v7;
  CPSPanButton *v8;
  CPSPanView *v9;
  CPSPanButton *v10;
  CPSPanView *v11;
  CPSPanButton *v12;
  CPSPanView *v13;
  id v14;
  CPSPanButton *v15;
  CPSPanView *v16;
  CPSPanButton *v17;
  CPSPanView *v18;
  CPSPanButton *v19;
  CPSPanView *v20;
  id v21;
  CPSPanButton *v22;
  CPSPanView *v23;
  id v24;
  id location[2];
  CPSPanViewController *v26;
  _QWORD v27[3];
  CPSPanButton *v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v26->_rightHandDrive)
  {
    v20 = -[CPSPanViewController panView](v26, "panView");
    v19 = -[CPSPanView panLeftButton](v20, "panLeftButton");
    v29[0] = v19;
    v18 = -[CPSPanViewController panView](v26, "panView");
    v17 = -[CPSPanView panUpButton](v18, "panUpButton");
    v29[1] = v17;
    v16 = -[CPSPanViewController panView](v26, "panView");
    v15 = -[CPSPanView panRightButton](v16, "panRightButton");
    v29[2] = v15;
    v14 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
    objc_msgSend(v24, "addObjectsFromArray:");

    objc_msgSend(v24, "addObjectsFromArray:", location[0]);
    v23 = -[CPSPanViewController panView](v26, "panView");
    v22 = -[CPSPanView panDownButton](v23, "panDownButton");
    v28 = v22;
    v21 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
    objc_msgSend(v24, "addObjectsFromArray:");

  }
  else
  {
    v6 = -[CPSPanViewController panView](v26, "panView");
    v5 = -[CPSPanView panRightButton](v6, "panRightButton");
    objc_msgSend(v24, "addObject:");

    objc_msgSend(v24, "addObjectsFromArray:", location[0]);
    v13 = -[CPSPanViewController panView](v26, "panView");
    v12 = -[CPSPanView panDownButton](v13, "panDownButton");
    v27[0] = v12;
    v11 = -[CPSPanViewController panView](v26, "panView");
    v10 = -[CPSPanView panLeftButton](v11, "panLeftButton");
    v27[1] = v10;
    v9 = -[CPSPanViewController panView](v26, "panView");
    v8 = -[CPSPanView panUpButton](v9, "panUpButton");
    v27[2] = v8;
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
    objc_msgSend(v24, "addObjectsFromArray:");

  }
  v4 = v24;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_linearFocusItems
{
  CPSPanButton *v3;
  CPSPanView *v4;
  CPSPanButton *v5;
  CPSPanView *v6;
  CPSPanButton *v7;
  CPSPanView *v8;
  CPSPanButton *v9;
  CPSPanView *v10;
  CPSPanButton *v11;
  CPSPanView *v12;
  CPSPanButton *v13;
  CPSPanView *v14;
  CPSPanButton *v15;
  CPSPanView *v16;
  CPSPanButton *v17;
  CPSPanView *v18;
  id v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  if (self->_rightHandDrive)
  {
    v18 = -[CPSPanViewController panView](self, "panView");
    v17 = -[CPSPanView panLeftButton](v18, "panLeftButton");
    v22[0] = v17;
    v16 = -[CPSPanViewController panView](self, "panView");
    v15 = -[CPSPanView panUpButton](v16, "panUpButton");
    v22[1] = v15;
    v14 = -[CPSPanViewController panView](self, "panView");
    v13 = -[CPSPanView panRightButton](v14, "panRightButton");
    v22[2] = v13;
    v12 = -[CPSPanViewController panView](self, "panView");
    v11 = -[CPSPanView panDownButton](v12, "panDownButton");
    v22[3] = v11;
    v20 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);

  }
  else
  {
    v10 = -[CPSPanViewController panView](self, "panView");
    v9 = -[CPSPanView panRightButton](v10, "panRightButton");
    v21[0] = v9;
    v8 = -[CPSPanViewController panView](self, "panView");
    v7 = -[CPSPanView panDownButton](v8, "panDownButton");
    v21[1] = v7;
    v6 = -[CPSPanViewController panView](self, "panView");
    v5 = -[CPSPanView panLeftButton](v6, "panLeftButton");
    v21[2] = v5;
    v4 = -[CPSPanViewController panView](self, "panView");
    v3 = -[CPSPanView panUpButton](v4, "panUpButton");
    v21[3] = v3;
    v20 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);

  }
  return v20;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  CPSPanView *v4;
  CPSPanButton *v5;
  CPSPanButton *v6;
  BOOL v7;
  char v8;
  CPSPanButton *v9;
  char v10;
  CPSPanView *v11;
  char v12;
  CPSPanButton *v13;
  id location[2];
  CPSPanViewController *v15;
  BOOL v16;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (CPSPanButton *)(id)objc_msgSend(location[0], "previouslyFocusedItem");
  v4 = -[CPSPanViewController panView](v15, "panView");
  v6 = -[CPSPanView panUpButton](v4, "panUpButton");
  v12 = 0;
  v10 = 0;
  v8 = 0;
  v7 = 0;
  if (v5 == v6)
  {
    v13 = (CPSPanButton *)(id)objc_msgSend(location[0], "nextFocusedItem");
    v12 = 1;
    v11 = -[CPSPanViewController panView](v15, "panView");
    v10 = 1;
    v9 = -[CPSPanView panLeftButton](v11, "panLeftButton");
    v8 = 1;
    v7 = 0;
    if (v13 == v9)
      v7 = objc_msgSend(location[0], "focusHeading") == 16;
  }
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  if ((v12 & 1) != 0)

  v16 = !v7;
  objc_storeStrong(location, 0);
  return v16;
}

- (double)sideButtonTopInset
{
  double v2;
  CPSPanView *v4;
  double v5;

  v4 = -[CPSPanViewController panView](self, "panView");
  -[CPSPanView sideButtonTopInset](v4, "sideButtonTopInset");
  v5 = v2;

  return v5;
}

- (CPSTemplateEnvironment)environment
{
  return (CPSTemplateEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (CPSPanView)panView
{
  return self->_panView;
}

- (void)setPanView:(id)a3
{
  objc_storeStrong((id *)&self->_panView, a3);
}

- (CPSPanEventDelegate)panDelegate
{
  return (CPSPanEventDelegate *)objc_loadWeakRetained((id *)&self->_panDelegate);
}

- (void)setPanDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_panDelegate, a3);
}

- (NSArray)nudgeGestureRecognizers
{
  return self->_nudgeGestureRecognizers;
}

- (void)setNudgeGestureRecognizers:(id)a3
{
  objc_storeStrong((id *)&self->_nudgeGestureRecognizers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nudgeGestureRecognizers, 0);
  objc_destroyWeak((id *)&self->_panDelegate);
  objc_storeStrong((id *)&self->_panView, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end

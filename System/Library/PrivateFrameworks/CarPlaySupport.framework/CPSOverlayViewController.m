@implementation CPSOverlayViewController

- (void)invalidate
{
  id v2;

  -[CPSOverlayViewController _invalidateVisibilityView](self, "_invalidateVisibilityView");
  v2 = (id)-[CPSOverlayViewController viewControllers](self, "viewControllers");
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_0);

}

void __38__CPSOverlayViewController_invalidate__block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7[3] = a3;
  v7[2] = a4;
  v7[1] = a1;
  v7[0] = CPSSafeProtocolCast(&unk_2553F1430, location[0]);
  objc_msgSend(v7[0], "invalidate");
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  CPSOverlayViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSOverlayViewController;
  -[CPSOverlayViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  -[CPSOverlayViewController _updateVisibilityView](v6, "_updateVisibilityView");
}

- (void)viewDidLoad
{
  _CPSOverlayTouchBlockingView *v2;
  id v3;
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
  _CPSOverlayTouchBlockingView *v16;
  id v17;
  objc_super v18;
  SEL v19;
  CPSOverlayViewController *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v20 = self;
  v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)CPSOverlayViewController;
  -[CPSOverlayViewController viewDidLoad](&v18, sel_viewDidLoad);
  v17 = (id)-[CPSOverlayViewController view](v20, "view");
  v2 = [_CPSOverlayTouchBlockingView alloc];
  v16 = -[_CPSOverlayTouchBlockingView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[_CPSOverlayTouchBlockingView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_CPSOverlayTouchBlockingView setUserInteractionEnabled:](v16, "setUserInteractionEnabled:", 1);
  objc_msgSend(v17, "insertSubview:atIndex:", v16, 0);
  v14 = (id)objc_msgSend(v17, "topAnchor");
  v13 = (id)-[_CPSOverlayTouchBlockingView topAnchor](v16, "topAnchor");
  v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
  v21[0] = v12;
  v11 = (id)objc_msgSend(v17, "leftAnchor");
  v10 = (id)-[_CPSOverlayTouchBlockingView leftAnchor](v16, "leftAnchor");
  v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
  v21[1] = v9;
  v8 = (id)objc_msgSend(v17, "rightAnchor");
  v7 = (id)-[_CPSOverlayTouchBlockingView rightAnchor](v16, "rightAnchor");
  v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");
  v21[2] = v6;
  v5 = (id)objc_msgSend(v17, "bottomAnchor");
  v4 = (id)-[_CPSOverlayTouchBlockingView bottomAnchor](v16, "bottomAnchor");
  v3 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");
  v21[3] = v3;
  v15 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v15);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v17, 0);
}

- (UIFocusGuide)rightHandDriveGuide
{
  UIFocusGuide *v2;
  UIFocusGuide *rightHandDriveGuide;
  UIFocusGuide *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  UIFocusGuide *v11;
  id v12;
  id v13;
  UIFocusGuide *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  UIFocusGuide *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  UIFocusGuide *v24;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  if (!self->_rightHandDriveGuide)
  {
    v2 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x24BDF6A58]);
    rightHandDriveGuide = self->_rightHandDriveGuide;
    self->_rightHandDriveGuide = v2;

    v6 = (id)-[CPSOverlayViewController view](self, "view");
    v5 = -[CPSOverlayViewController rightHandDriveGuide](self, "rightHandDriveGuide");
    objc_msgSend(v6, "addLayoutGuide:");

    v7 = (void *)MEMORY[0x24BDD1628];
    v24 = -[CPSOverlayViewController rightHandDriveGuide](self, "rightHandDriveGuide");
    v23 = (id)-[UIFocusGuide rightAnchor](v24, "rightAnchor");
    v22 = (id)-[CPSOverlayViewController view](self, "view");
    v21 = (id)objc_msgSend(v22, "rightAnchor");
    v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
    v26[0] = v20;
    v19 = -[CPSOverlayViewController rightHandDriveGuide](self, "rightHandDriveGuide");
    v18 = (id)-[UIFocusGuide bottomAnchor](v19, "bottomAnchor");
    v17 = (id)-[CPSOverlayViewController view](self, "view");
    v16 = (id)objc_msgSend(v17, "bottomAnchor");
    v15 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v26[1] = v15;
    v14 = -[CPSOverlayViewController rightHandDriveGuide](self, "rightHandDriveGuide");
    v13 = (id)-[UIFocusGuide heightAnchor](v14, "heightAnchor");
    v12 = (id)objc_msgSend(v13, "constraintEqualToConstant:");
    v26[2] = v12;
    v11 = -[CPSOverlayViewController rightHandDriveGuide](self, "rightHandDriveGuide");
    v10 = (id)-[UIFocusGuide widthAnchor](v11, "widthAnchor");
    v9 = (id)objc_msgSend(v10, "constraintEqualToConstant:", 1.0);
    v26[3] = v9;
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
    objc_msgSend(v7, "activateConstraints:");

  }
  return self->_rightHandDriveGuide;
}

- (void)_resetRightHandDriveGuide
{
  if (self->_rightHandDriveGuide)
    -[UIFocusGuide setPreferredFocusEnvironments:](self->_rightHandDriveGuide, "setPreferredFocusEnvironments:", 0);
}

- (BOOL)shouldHideNavigationBarForViewController:(id)a3
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  id v13;
  int v14;
  id location[2];
  CPSOverlayViewController *v16;
  char v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 1;
    v14 = 1;
  }
  else
  {
    v9 = (id)-[CPSOverlayViewController viewControllers](v16, "viewControllers");
    v8 = (id)objc_msgSend(v9, "firstObject");
    v10 = objc_msgSend(v8, "isEqual:", location[0]);

    if ((v10 & 1) != 0)
    {
      v3 = (void *)objc_opt_class();
      v13 = CPSSafeCast_2(v3, location[0]);
      v7 = (id)objc_msgSend(v13, "navigationItem");
      v12 = (id)objc_msgSend(v7, "title");

      if (v12 && objc_msgSend(v12, "length"))
      {
        v17 = 0;
        v14 = 1;
      }
      else
      {
        v5 = (void *)objc_opt_class();
        v6 = (id)objc_msgSend(v13, "associatedTemplate");
        v11 = CPSSafeCast_2(v5, v6);

        if (v11)
          v17 = objc_msgSend(v11, "shouldHideNavigationBar") & 1;
        else
          v17 = 0;
        v14 = 1;
        objc_storeStrong(&v11, 0);
      }
      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v13, 0);
    }
    else
    {
      v17 = 0;
      v14 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v17 & 1;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  id v4;
  objc_super v5;
  id v6;
  BOOL v7;
  SEL v8;
  CPSOverlayViewController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSOverlayViewController;
  v6 = -[CPSOverlayViewController popViewControllerAnimated:](&v5, sel_popViewControllerAnimated_, a3);
  objc_msgSend(v6, "_cps_viewControllerWasPopped");
  v4 = v6;
  objc_storeStrong(&v6, 0);
  return v4;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  id v6;
  objc_super v7;
  id v8;
  BOOL v9;
  id location[2];
  CPSOverlayViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v7.receiver = v11;
  v7.super_class = (Class)CPSOverlayViewController;
  v8 = -[CPSOverlayViewController popToViewController:animated:](&v7, sel_popToViewController_animated_, location[0], a4);
  objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, &__block_literal_global_123);
  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

void __57__CPSOverlayViewController_popToViewController_animated___block_invoke(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "_cps_viewControllerWasPopped");
  objc_storeStrong(location, 0);
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  id v4;
  objc_super v5;
  id v6;
  BOOL v7;
  SEL v8;
  CPSOverlayViewController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSOverlayViewController;
  v6 = -[CPSOverlayViewController popToRootViewControllerAnimated:](&v5, sel_popToRootViewControllerAnimated_, a3);
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, &__block_literal_global_126);
  v4 = v6;
  objc_storeStrong(&v6, 0);
  return v4;
}

void __60__CPSOverlayViewController_popToRootViewControllerAnimated___block_invoke(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "_cps_viewControllerWasPopped");
  objc_storeStrong(location, 0);
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  CPSOverlayViewController *v4;
  int v5;
  CPSOverlayViewController *v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id obj;
  uint64_t v17;
  objc_super v18;
  _QWORD __b[8];
  id v20;
  BOOL v21;
  id location[2];
  CPSOverlayViewController *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = a4;
  memset(__b, 0, sizeof(__b));
  obj = (id)-[CPSOverlayViewController viewControllers](v23, "viewControllers");
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
  if (v17)
  {
    v12 = *(_QWORD *)__b[2];
    v13 = 0;
    v14 = v17;
    while (1)
    {
      v11 = v13;
      if (*(_QWORD *)__b[2] != v12)
        objc_enumerationMutation(obj);
      v20 = *(id *)(__b[1] + 8 * v13);
      v4 = (CPSOverlayViewController *)(id)objc_msgSend(v20, "parentViewController");
      v10 = v4 != v23;

      if (!v10)
      {
        v9 = (id)objc_msgSend(v20, "view");
        objc_msgSend(v9, "removeFromSuperview");

        objc_msgSend(v20, "removeFromParentViewController");
      }
      ++v13;
      if (v11 + 1 >= v14)
      {
        v13 = 0;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
        if (!v14)
          break;
      }
    }
  }

  v6 = v23;
  v7 = location[0];
  v8 = (id)-[CPSOverlayViewController viewControllers](v23, "viewControllers");
  if (objc_msgSend(v8, "count"))
    v5 = v21;
  else
    v5 = 0;
  v18.receiver = v6;
  v18.super_class = (Class)CPSOverlayViewController;
  -[CPSOverlayViewController setViewControllers:animated:](&v18, sel_setViewControllers_animated_, v7, v5 != 0);

  -[CPSOverlayViewController _updateVisibilityView](v23, "_updateVisibilityView");
  objc_storeStrong(location, 0);
}

- (unint64_t)indexOfTemplate:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(id *, void *, void *, void *);
  void *v10;
  id v11;
  id location[2];
  CPSOverlayViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)-[CPSOverlayViewController viewControllers](v13, "viewControllers");
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __44__CPSOverlayViewController_indexOfTemplate___block_invoke;
  v10 = &unk_24E26F3E8;
  v11 = location[0];
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:");
  objc_storeStrong(&v11, 0);

  objc_storeStrong(location, 0);
  return v5;
}

uint64_t __44__CPSOverlayViewController_indexOfTemplate___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  char v10;
  id v11;
  id v12[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[3] = a3;
  v12[2] = a4;
  v12[1] = a1;
  v12[0] = CPSSafeProtocolCast(&unk_2553F1430, location[0]);
  v11 = (id)objc_msgSend(v12[0], "associatedTemplate");
  v9 = (id)objc_msgSend(v11, "identifier");
  v8 = (id)objc_msgSend(a1[4], "identifier");
  v10 = objc_msgSend(v9, "isEqual:");

  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
  return v10 & 1;
}

- (id)viewControllerForTemplate:(id)a3
{
  id v4;
  uint64_t v5;
  id location[2];
  CPSOverlayViewController *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSOverlayViewController indexOfTemplate:](v7, "indexOfTemplate:", location[0]);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v4 = (id)-[CPSOverlayViewController viewControllers](v7, "viewControllers");
    v8 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", v5);

  }
  objc_storeStrong(location, 0);
  return v8;
}

- (void)popToTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v5;
  id v6;
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id location[2];
  CPSOverlayViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v11 = -[CPSOverlayViewController viewControllerForTemplate:](v15, "viewControllerForTemplate:", location[0]);
  if (v11)
  {
    v5 = -[CPSOverlayViewController popToViewController:animated:](v15, "popToViewController:animated:", v11, v13);
    if (v13)
    {
      v10 = (id)-[CPSOverlayViewController transitionCoordinator](v15, "transitionCoordinator");
      v6 = v10;
      v9 = v12;
      objc_msgSend(v6, "animateAlongsideTransition:completion:");
      objc_storeStrong(&v9, 0);
      objc_storeStrong(&v10, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void __62__CPSOverlayViewController_popToTemplate_animated_completion___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)popToRootTemplateAnimated:(BOOL)a3 completion:(id)a4
{
  id v4;
  id v5;
  BOOL v6;
  id v7;
  BOOL v8;
  id v9;
  id location;
  BOOL v11;
  SEL v12;
  CPSOverlayViewController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v9 = -[CPSOverlayViewController popToRootViewControllerAnimated:](v13, "popToRootViewControllerAnimated:", v11);
  v8 = objc_msgSend(v9, "count") != 0;
  if (location)
  {
    v7 = (id)-[CPSOverlayViewController transitionCoordinator](v13, "transitionCoordinator");
    if (v7)
    {
      v4 = v7;
      v5 = location;
      v6 = v8;
      objc_msgSend(v4, "animateAlongsideTransition:completion:");
      objc_storeStrong(&v5, 0);
    }
    else
    {
      (*((void (**)(id, BOOL))location + 2))(location, v8);
    }
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

void __65__CPSOverlayViewController_popToRootTemplateAnimated_completion___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)popTemplateAnimated:(BOOL)a3 completion:(id)a4
{
  id v4;
  id v5;
  BOOL v6;
  id v7;
  BOOL v8;
  id v9;
  id location;
  BOOL v11;
  SEL v12;
  CPSOverlayViewController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v9 = -[CPSOverlayViewController popViewControllerAnimated:](v13, "popViewControllerAnimated:", v11);
  v8 = v9 != 0;
  v7 = (id)-[CPSOverlayViewController transitionCoordinator](v13, "transitionCoordinator");
  if (v7)
  {
    v4 = v7;
    v5 = location;
    v6 = v8;
    objc_msgSend(v4, "animateAlongsideTransition:completion:");
    objc_storeStrong(&v5, 0);
  }
  else
  {
    (*((void (**)(id, BOOL))location + 2))(location, v8);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

void __59__CPSOverlayViewController_popTemplateAnimated_completion___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)pushTemplateViewController:(id)a3 animated:(BOOL)a4 presentationStyle:(unint64_t)a5 completion:(id)a6
{
  id v6;
  CPSOverlayViewController *v7;
  id v8;
  id v9;
  id v13;
  char v14;
  id v15;
  id v16;
  int v17;
  id v18;
  unint64_t v19;
  BOOL v20;
  id location[2];
  CPSOverlayViewController *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  v19 = a5;
  v18 = 0;
  objc_storeStrong(&v18, a6);
  v13 = (id)-[CPSOverlayViewController view](v22, "view");
  v14 = objc_msgSend(v13, "isHidden");

  if ((v14 & 1) != 0)
  {
    v9 = (id)-[CPSOverlayViewController view](v22, "view");
    objc_msgSend(v9, "setHidden:", 0);

  }
  if (v19)
  {
    if (v19 == 1)
    {
      v7 = v22;
      v23[0] = location[0];
      v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      -[CPSOverlayViewController setViewControllers:animated:](v7, "setViewControllers:animated:");

    }
    else if (v19 == 2)
    {
      (*((void (**)(void))v18 + 2))();
      v17 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    -[CPSOverlayViewController pushViewController:animated:](v22, "pushViewController:animated:", location[0], v20);
  }
  -[CPSOverlayViewController setNavigationBarHidden:animated:](v22, "setNavigationBarHidden:animated:", 0, 1);
  v16 = (id)-[CPSOverlayViewController transitionCoordinator](v22, "transitionCoordinator");
  if (v16)
  {
    v6 = v16;
    v15 = v18;
    objc_msgSend(v6, "animateAlongsideTransition:completion:");
    objc_storeStrong(&v15, 0);
  }
  else
  {
    (*((void (**)(void))v18 + 2))();
  }
  -[CPSOverlayViewController _updateVisibilityView](v22, "_updateVisibilityView");
  objc_storeStrong(&v16, 0);
  v17 = 0;
LABEL_14:
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __93__CPSOverlayViewController_pushTemplateViewController_animated_presentationStyle_completion___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)presentTemplateViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v5;
  id v6;
  id v9;
  char v10;
  id v11;
  id v12;
  BOOL v13;
  id location[2];
  CPSOverlayViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v9 = (id)-[CPSOverlayViewController view](v15, "view");
  v10 = objc_msgSend(v9, "isHidden");

  if ((v10 & 1) != 0)
  {
    v6 = (id)-[CPSOverlayViewController view](v15, "view");
    objc_msgSend(v6, "setHidden:", 0);

  }
  v5 = objc_alloc(MEMORY[0x24BDF6BF8]);
  v11 = (id)objc_msgSend(v5, "initWithRootViewController:", location[0]);
  objc_msgSend(v11, "setOverrideUserInterfaceStyle:", -[CPSOverlayViewController overrideUserInterfaceStyle](v15, "overrideUserInterfaceStyle"));
  objc_msgSend(v11, "setModalPresentationStyle:", 0);
  -[CPSOverlayViewController presentViewController:animated:completion:](v15, "presentViewController:animated:completion:", v11, v13, v12);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)presentActionSheetTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v5;
  id v8;
  char v9;
  os_log_t oslog;
  id v11;
  id v12;
  BOOL v13;
  id location[2];
  CPSOverlayViewController *v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v8 = (id)-[CPSOverlayViewController view](v15, "view");
  v9 = objc_msgSend(v8, "isHidden");

  if ((v9 & 1) != 0)
  {
    v5 = (id)-[CPSOverlayViewController view](v15, "view");
    objc_msgSend(v5, "setHidden:", 0);

  }
  v11 = +[CPSActionSheetController actionSheetControllerWithActionSheet:](CPSActionSheetController, "actionSheetControllerWithActionSheet:", location[0]);
  if (v11)
  {
    oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)location[0]);
      _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "Presenting action sheet template %@", v16, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[CPSOverlayViewController presentViewController:animated:completion:](v15, "presentViewController:animated:completion:", v11, v13, v12);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (id)presentedTemplateViewController
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8[2];
  CPSOverlayViewController *v9;
  id v10;

  v9 = self;
  v8[1] = (id)a2;
  v7 = (id)-[CPSOverlayViewController presentedViewController](self, "presentedViewController");

  if (v7)
  {
    v3 = (void *)objc_opt_class();
    v4 = (id)-[CPSOverlayViewController presentedViewController](v9, "presentedViewController");
    v8[0] = CPSSafeCast_2(v3, v4);

    v5 = (void *)objc_opt_class();
    v6 = (id)objc_msgSend(v8[0], "topViewController");
    v10 = CPSSafeCast_2(v5, v6);

    objc_storeStrong(v8, 0);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)dismissTemplateAnimated:(BOOL)a3 completion:(id)a4
{
  id v4;
  char v5;
  id v6;
  char isKindOfClass;
  id location;
  BOOL v9;
  SEL v10;
  CPSOverlayViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v6 = (id)-[CPSOverlayViewController visibleViewController](v11, "visibleViewController");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (v4 = (id)-[CPSOverlayViewController visibleViewController](v11, "visibleViewController"), objc_opt_class(), v5 = objc_opt_isKindOfClass(), v4, (v5 & 1) != 0))
  {
    -[CPSOverlayViewController dismissViewControllerAnimated:completion:](v11, "dismissViewControllerAnimated:completion:", v9, location);
  }
  objc_storeStrong(&location, 0);
}

- (id)topTemplate
{
  id v3;
  id v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v3 = (id)-[CPSOverlayViewController topViewController](self, "topViewController");
  v5[0] = CPSSafeProtocolCast(&unk_2553F1430, v3);

  v4 = (id)objc_msgSend(v5[0], "associatedTemplate");
  objc_storeStrong(v5, 0);
  return v4;
}

- (id)templates
{
  id v3;
  id v4;

  v3 = (id)-[CPSOverlayViewController viewControllers](self, "viewControllers");
  v4 = (id)objc_msgSend(v3, "cps_map:", &__block_literal_global_136);

  return v4;
}

id __37__CPSOverlayViewController_templates__block_invoke(void *a1, void *a2)
{
  id v4;
  id v5[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5[1] = a1;
  v5[0] = CPSSafeProtocolCast(&unk_2553F1430, location[0]);
  v4 = (id)objc_msgSend(v5[0], "associatedTemplate");
  objc_storeStrong(v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)restoresFocusAfterTransition
{
  id v3;
  char v4;

  v3 = (id)-[CPSOverlayViewController topViewController](self, "topViewController");
  v4 = objc_msgSend(v3, "restoresFocusAfterTransition");

  return v4 & 1;
}

- (id)preferredFocusEnvironments
{
  id v3;
  id v4;
  id v5;
  id v6;
  UIFocusItem *v7;
  UIFocusItem *v8;
  id v9[2];
  CPSOverlayViewController *v10;

  v10 = self;
  v9[1] = (id)a2;
  v9[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[CPSOverlayViewController usePreferredItemOnNextUpdate](v10, "usePreferredItemOnNextUpdate"))
  {
    -[CPSOverlayViewController setUsePreferredItemOnNextUpdate:](v10, "setUsePreferredItemOnNextUpdate:", 0);
    -[CPSOverlayViewController _resetRightHandDriveGuide](v10, "_resetRightHandDriveGuide");
    v8 = -[CPSOverlayViewController preferredFocusItem](v10, "preferredFocusItem");

    if (v8)
    {
      v7 = -[CPSOverlayViewController preferredFocusItem](v10, "preferredFocusItem");
      objc_msgSend(v9[0], "addObject:");

    }
  }
  v6 = (id)-[CPSOverlayViewController topViewController](v10, "topViewController");

  if (v6)
  {
    v5 = (id)-[CPSOverlayViewController topViewController](v10, "topViewController");
    v4 = (id)objc_msgSend(v5, "preferredFocusEnvironments");
    objc_msgSend(v9[0], "addObjectsFromArray:");

  }
  v3 = v9[0];
  objc_storeStrong(v9, 0);
  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v4;
  id v5;
  id v6;
  char v7;
  UIFocusGuide *v8;
  id v9;
  UIFocusItem *v10;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  char v16;
  id v17;
  char v18;
  id v19;
  id v20;
  id location[2];
  CPSOverlayViewController *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v14 = (id)objc_msgSend(location[0], "nextFocusedView");
  v13 = (id)objc_msgSend(v14, "_window");
  v12 = (id)-[CPSOverlayViewController view](v22, "view");
  v4 = (id)objc_msgSend(v12, "_window");
  v15 = v13 == v4;

  if (!v15)
  {
    -[CPSOverlayViewController setUsePreferredItemOnNextUpdate:](v22, "setUsePreferredItemOnNextUpdate:", 1);
    if (-[CPSOverlayViewController _useRightHandDriveFocusGuide](v22, "_useRightHandDriveFocusGuide"))
    {
      v10 = -[CPSOverlayViewController preferredFocusItem](v22, "preferredFocusItem");
      v23[0] = v10;
      v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v8 = -[CPSOverlayViewController rightHandDriveGuide](v22, "rightHandDriveGuide");
      -[UIFocusGuide setPreferredFocusEnvironments:](v8, "setPreferredFocusEnvironments:", v9);

    }
  }
  v6 = (id)objc_msgSend(location[0], "nextFocusedView");
  v18 = 0;
  v16 = 0;
  v7 = 0;
  if (v6)
  {
    v19 = (id)objc_msgSend(location[0], "nextFocusedView");
    v18 = 1;
    v17 = (id)-[CPSOverlayViewController view](v22, "view");
    v16 = 1;
    v7 = objc_msgSend(v19, "isDescendantOfView:");
  }
  if ((v16 & 1) != 0)

  if ((v18 & 1) != 0)
  if ((v7 & 1) != 0)
  {
    v5 = (id)objc_msgSend(location[0], "nextFocusedItem");
    -[CPSOverlayViewController setPreferredFocusItem:](v22, "setPreferredFocusItem:");

  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (id)_firstFocusProvidingForViewController:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  id v10;
  _QWORD __b[8];
  uint64_t v12;
  int v13;
  id location[2];
  CPSOverlayViewController *v15;
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "conformsToProtocol:", &unk_2553FBD28) & 1) != 0)
  {
    v16 = location[0];
    v13 = 1;
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(location[0], "childViewControllers");
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
    if (v9)
    {
      v5 = *(_QWORD *)__b[2];
      v6 = 0;
      v7 = v9;
      while (1)
      {
        v4 = v6;
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(__b[1] + 8 * v6);
        v10 = -[CPSOverlayViewController _firstFocusProvidingForViewController:](v15, "_firstFocusProvidingForViewController:", v12);
        if (v10)
        {
          v16 = v10;
          v13 = 1;
        }
        else
        {
          v13 = 0;
        }
        objc_storeStrong(&v10, 0);
        if (v13)
          break;
        ++v6;
        if (v4 + 1 >= v7)
        {
          v6 = 0;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
          if (!v7)
            goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      v13 = 0;
    }

    if (!v13)
    {
      v16 = 0;
      v13 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v16;
}

- (BOOL)_useRightHandDriveFocusGuide
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  id location;
  id v13[2];
  CPSOverlayViewController *v14;
  BOOL v15;

  v14 = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  v8 = (void *)objc_opt_class();
  v9 = (id)-[CPSOverlayViewController topViewController](v14, "topViewController");
  location = CPSSafeCast_2(v8, v9);

  v10 = (id)-[CPSOverlayViewController topViewController](v14, "topViewController");
  v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_2553FBD28);

  if ((v11 & 1) != 0)
  {
    v2 = (id)-[CPSOverlayViewController topViewController](v14, "topViewController");
    v3 = v13[0];
    v13[0] = v2;

  }
  else if (location)
  {
    v7 = (id)objc_msgSend(location, "selectedViewController");
    v4 = -[CPSOverlayViewController _firstFocusProvidingForViewController:](v14, "_firstFocusProvidingForViewController:");
    v5 = v13[0];
    v13[0] = v4;

  }
  v15 = (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v13[0], "useRightHandDriveFocusGuide") & 1) != 0;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);
  return v15;
}

- (id)_linearFocusMovementSequences
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20[2];
  CPSOverlayViewController *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v21 = self;
  v20[1] = (id)a2;
  v9 = (void *)objc_opt_class();
  v10 = (id)-[CPSOverlayViewController topViewController](v21, "topViewController");
  v20[0] = CPSSafeCast_2(v9, v10);

  v11 = (id)-[CPSOverlayViewController topViewController](v21, "topViewController");
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_2553FBD28);

  if ((v12 & 1) != 0)
  {
    v19 = (id)-[CPSOverlayViewController topViewController](v21, "topViewController");
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = (id)-[CPSOverlayViewController navigationBar](v21, "navigationBar");
    v6 = (id)objc_msgSend(v7, "_linearFocusItems");
    objc_msgSend(v18, "addObjectsFromArray:");

    v8 = (id)objc_msgSend(v19, "_linearFocusItems");
    objc_msgSend(v18, "addObjectsFromArray:");

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDF70C0]), "initWithItems:loops:", v18, 0);
    if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v19, "useRightHandDriveFocusGuide") & 1) == 0)
      -[CPSOverlayViewController _resetRightHandDriveGuide](v21, "_resetRightHandDriveGuide");
    v24[0] = v17;
    v22 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v16 = 1;
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    if (!v20[0])
      goto LABEL_14;
    v5 = (id)objc_msgSend(v20[0], "selectedViewController");
    v15 = -[CPSOverlayViewController _firstFocusProvidingForViewController:](v21, "_firstFocusProvidingForViewController:");

    if (v15)
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v3 = (id)objc_msgSend(v20[0], "tabBarButtons");
      objc_msgSend(v14, "addObjectsFromArray:");

      v4 = (id)objc_msgSend(v15, "_linearFocusItems");
      objc_msgSend(v14, "addObjectsFromArray:");

      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF70C0]), "initWithItems:loops:", v14, 0);
      if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v15, "useRightHandDriveFocusGuide") & 1) == 0)
        -[CPSOverlayViewController _resetRightHandDriveGuide](v21, "_resetRightHandDriveGuide");
      v23 = v13;
      v22 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
      v16 = 1;
      objc_storeStrong((id *)&v13, 0);
      objc_storeStrong(&v14, 0);
    }
    else
    {
      v16 = 0;
    }
    objc_storeStrong(&v15, 0);
    if (!v16)
    {
LABEL_14:
      v22 = MEMORY[0x24BDBD1A8];
      v16 = 1;
    }
  }
  objc_storeStrong(v20, 0);
  return v22;
}

- (void)updateVisibilityForPid:(int)a3
{
  -[CPSOverlayViewController setPid:](self, "setPid:", a3);
  -[CPSOverlayViewController _updateVisibilityView](self, "_updateVisibilityView");
}

- (BOOL)_needsVisibilityView
{
  BOOL v3;
  char v4;
  id v5;

  v4 = 0;
  v3 = 0;
  if (-[CPSOverlayViewController pid](self, "pid") > 0)
  {
    v5 = -[CPSOverlayViewController templates](self, "templates");
    v4 = 1;
    v3 = objc_msgSend(v5, "count") != 0;
  }
  if ((v4 & 1) != 0)

  return v3;
}

- (void)_updateVisibilityView
{
  _UINonHostingVisibilityPropagationView *v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
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
  id v27;
  id v28;
  id v29;
  char v30;
  _UINonHostingVisibilityPropagationView *v31;
  int v32;
  BOOL v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char v40;
  uint8_t v41[7];
  char v42;
  id v43;
  id v44;
  id v45;
  os_log_type_t v46;
  id v47;
  os_log_type_t v48;
  id v49;
  os_log_type_t v50;
  id location;
  char v52;
  char v53;
  id v54;
  char v55;
  _UINonHostingVisibilityPropagationView *v56;
  char v57;
  id v58;
  BOOL v59;
  char v60;
  BOOL v61;
  unsigned int v62;
  int v63;
  SEL v64;
  CPSOverlayViewController *v65;
  _QWORD v66[4];
  uint8_t v67[16];
  uint8_t v68[16];
  uint8_t v69[8];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v65 = self;
  v64 = a2;
  v31 = -[CPSOverlayViewController visibilityView](self, "visibilityView");
  v32 = -[_UINonHostingVisibilityPropagationView pid](v31, "pid");

  v63 = v32;
  v62 = -[CPSOverlayViewController pid](v65, "pid");
  v2 = -[CPSOverlayViewController visibilityView](v65, "visibilityView");
  v33 = v2 != 0;

  v61 = v33;
  v60 = -[CPSOverlayViewController _needsVisibilityView](v65, "_needsVisibilityView");
  v59 = v32 != v62;
  v34 = (void *)MEMORY[0x24BDD17C8];
  v39 = (id)-[CPSOverlayViewController view](v65, "view");
  v38 = (id)objc_msgSend(v39, "window");
  v37 = (id)objc_msgSend(v38, "windowScene");
  v36 = (id)objc_msgSend(v37, "_FBSScene");
  v35 = (id)objc_msgSend(v36, "identifier");
  v58 = (id)objc_msgSend(v34, "stringWithFormat:", CFSTR("CPTUIH-Overlay-%d-%@"), v62, v35);

  v57 = 0;
  v55 = 0;
  v53 = 0;
  v40 = 0;
  if (v33)
  {
    v56 = -[CPSOverlayViewController visibilityView](v65, "visibilityView");
    v55 = 1;
    v54 = (id)-[_UINonHostingVisibilityPropagationView environmentIdentifier](v56, "environmentIdentifier");
    v53 = 1;
    v40 = objc_msgSend(v58, "isEqualToString:");
  }
  if ((v53 & 1) != 0)

  if ((v55 & 1) != 0)
  v57 = v40 & 1;
  v52 = 0;
  v30 = 0;
  if (v61)
  {
    v30 = 0;
    if (v63 == v62)
      v30 = v57;
  }
  v52 = v30;
  if ((v60 & 1) != 0 || !v61)
  {
    if (v59 && v61)
    {
      v49 = CarPlaySupportGeneralLogging();
      v48 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_2((uint64_t)v68, v63);
        _os_log_impl(&dword_21E389000, (os_log_t)v49, v48, "Removing visibility view for invalid pid: %{public}d", v68, 8u);
      }
      objc_storeStrong(&v49, 0);
      -[CPSOverlayViewController _invalidateVisibilityView](v65, "_invalidateVisibilityView");
    }
  }
  else
  {
    location = CarPlaySupportGeneralLogging();
    v50 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_2((uint64_t)v69, v63);
      _os_log_impl(&dword_21E389000, (os_log_t)location, v50, "Removing visibility view for pid: %{public}d, not considered visible", v69, 8u);
    }
    objc_storeStrong(&location, 0);
    -[CPSOverlayViewController _invalidateVisibilityView](v65, "_invalidateVisibilityView");
  }
  if ((v60 & 1) != 0 && (v52 & 1) == 0)
  {
    v47 = CarPlaySupportGeneralLogging();
    v46 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_2((uint64_t)v67, v62);
      _os_log_impl(&dword_21E389000, (os_log_t)v47, v46, "Client needs visibility view, installing for pid: %{public}d", v67, 8u);
    }
    objc_storeStrong(&v47, 0);
    v28 = (id)-[CPSOverlayViewController view](v65, "view");
    v29 = (id)objc_msgSend(v28, "window");

    if (v29)
    {
      v3 = objc_alloc(MEMORY[0x24BDF7110]);
      v45 = (id)objc_msgSend(v3, "initWithFrame:pid:environmentIdentifier:", v62, v58, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CPSOverlayViewController setVisibilityView:](v65, "setVisibilityView:", v45);
      v7 = (id)-[CPSOverlayViewController view](v65, "view");
      v6 = (id)objc_msgSend(v7, "window");
      objc_msgSend(v6, "insertSubview:atIndex:", v45, 0);

      v27 = (id)-[CPSOverlayViewController view](v65, "view");
      v26 = (id)objc_msgSend(v27, "window");
      v25 = (id)objc_msgSend(v26, "topAnchor");
      v24 = (id)objc_msgSend(v45, "topAnchor");
      v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
      v66[0] = v23;
      v22 = (id)-[CPSOverlayViewController view](v65, "view");
      v21 = (id)objc_msgSend(v22, "window");
      v20 = (id)objc_msgSend(v21, "leftAnchor");
      v19 = (id)objc_msgSend(v45, "leftAnchor");
      v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
      v66[1] = v18;
      v17 = (id)-[CPSOverlayViewController view](v65, "view");
      v16 = (id)objc_msgSend(v17, "window");
      v15 = (id)objc_msgSend(v16, "rightAnchor");
      v14 = (id)objc_msgSend(v45, "rightAnchor");
      v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
      v66[2] = v13;
      v12 = (id)-[CPSOverlayViewController view](v65, "view");
      v11 = (id)objc_msgSend(v12, "window");
      v10 = (id)objc_msgSend(v11, "bottomAnchor");
      v9 = (id)objc_msgSend(v45, "bottomAnchor");
      v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
      v66[3] = v8;
      v44 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 4);

      objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v44);
      objc_storeStrong(&v44, 0);
      objc_storeStrong(&v45, 0);
    }
    else
    {
      v43 = CarPlaySupportGeneralLogging();
      v42 = 16;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
      {
        v4 = v43;
        v5 = v42;
        __os_log_helper_16_0_0(v41);
        _os_log_error_impl(&dword_21E389000, v4, v5, "No window available to install visibility view", v41, 2u);
      }
      objc_storeStrong(&v43, 0);
    }
  }
  objc_storeStrong(&v58, 0);
}

- (void)_invalidateVisibilityView
{
  -[_UINonHostingVisibilityPropagationView removeFromSuperview](self->_visibilityView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_visibilityView, 0);
}

- (UIFocusItem)preferredFocusItem
{
  return (UIFocusItem *)objc_loadWeakRetained((id *)&self->preferredFocusItem);
}

- (void)setPreferredFocusItem:(id)a3
{
  objc_storeWeak((id *)&self->preferredFocusItem, a3);
}

- (BOOL)usePreferredItemOnNextUpdate
{
  return self->usePreferredItemOnNextUpdate;
}

- (void)setUsePreferredItemOnNextUpdate:(BOOL)a3
{
  self->usePreferredItemOnNextUpdate = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (_UINonHostingVisibilityPropagationView)visibilityView
{
  return self->_visibilityView;
}

- (void)setVisibilityView:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityView, 0);
  objc_destroyWeak((id *)&self->preferredFocusItem);
  objc_storeStrong((id *)&self->_rightHandDriveGuide, 0);
}

@end

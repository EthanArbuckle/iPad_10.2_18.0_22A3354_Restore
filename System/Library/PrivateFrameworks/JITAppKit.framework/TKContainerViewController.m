@implementation TKContainerViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;
  SEL v5;
  TKContainerViewController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)TKContainerViewController;
  -[TKContainerViewController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v2 = (id)-[TKContainerViewController view](v6, "view");
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  TKContainerViewController *v4;

  v4 = self;
  v3 = a2;
  -[TKKeyPathObserver stopObserving](self->_observer, "stopObserving");
  v2.receiver = v4;
  v2.super_class = (Class)TKContainerViewController;
  -[TKContainerViewController dealloc](&v2, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  TKContainerViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)TKContainerViewController;
  -[TKContainerViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
  v6->_appearing = 1;
  -[TKContainerViewController observeChild](v6, "observeChild");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  TKContainerViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)TKContainerViewController;
  -[TKContainerViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  v6->_appearing = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  TKContainerViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  -[TKKeyPathObserver stopObserving](self->_observer, "stopObserving");
  v3.receiver = v6;
  v3.super_class = (Class)TKContainerViewController;
  -[TKContainerViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, v4);
}

- (unint64_t)edgesForExtendedLayout
{
  objc_super v3;
  SEL v4;
  TKContainerViewController *v5;

  v5 = self;
  v4 = a2;
  if (self->_childViewController)
    return -[UIViewController edgesForExtendedLayout](v5->_childViewController, "edgesForExtendedLayout");
  v3.receiver = v5;
  v3.super_class = (Class)TKContainerViewController;
  return -[TKContainerViewController edgesForExtendedLayout](&v3, sel_edgesForExtendedLayout);
}

- (void)setChildViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UINavigationItem *v8;
  UINavigationItem *childNavigationItem;
  NSArray *v10;
  id v11;
  TKKeyPathObserver *observer;
  uint64_t v13;
  TKKeyPathObserver *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  double v20;
  uint64_t v21;
  id v22;
  void *v23;
  UIView *v24;
  uint64_t v25;
  int v26;
  int v27;
  void (*v28)(id *, void *, void *);
  void *v29;
  id v30;
  id from;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  int v36;
  int v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40;
  TKContainerViewController *v41;
  uint64_t v42;
  int v43;
  int v44;
  void (*v45)(uint64_t);
  void *v46;
  id v47;
  id v48[2];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  id v54;
  int v55;
  id location[2];
  TKContainerViewController *v57;

  v57 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v57->_childViewController == location[0])
  {
    v55 = 1;
  }
  else
  {
    -[TKKeyPathObserver stopObserving](v57->_observer, "stopObserving");
    objc_storeStrong((id *)&v57->_childNavigationItem, 0);
    if (v57->_childViewController)
    {
      -[UIViewController willMoveToParentViewController:](v57->_childViewController, "willMoveToParentViewController:", 0);
      v24 = -[UIViewController view](v57->_childViewController, "view");
      -[UIView removeFromSuperview](v24, "removeFromSuperview");

      -[UIViewController removeFromParentViewController](v57->_childViewController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&v57->_childViewController, location[0]);
    if (location[0])
    {
      v54 = (id)-[TKContainerViewController view](v57, "view");
      -[TKContainerViewController addChildViewController:](v57, "addChildViewController:", location[0]);
      v53 = (id)objc_msgSend(location[0], "view");
      objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v54, "bounds");
      *(double *)&v51 = v3;
      *((double *)&v51 + 1) = v4;
      *(double *)&v52 = v5;
      *((double *)&v52 + 1) = v6;
      v49 = v51;
      v50 = v52;
      objc_msgSend(v53, "setFrame:", v3, v4, v5, v6);
      objc_msgSend(v53, "setAutoresizingMask:", 18);
      v19 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      objc_msgSend(v19, "statusBarOrientationAnimationDuration");
      v20 = v7 / 2.0;

      v48[1] = *(id *)&v20;
      v23 = (void *)MEMORY[0x24BEBDB00];
      v22 = v54;
      v21 = MEMORY[0x24BDAC760];
      v42 = MEMORY[0x24BDAC760];
      v43 = -1073741824;
      v44 = 0;
      v45 = __52__TKContainerViewController_setChildViewController___block_invoke;
      v46 = &unk_24E099990;
      v47 = v54;
      v48[0] = v53;
      v35 = v21;
      v36 = -1073741824;
      v37 = 0;
      v38 = __52__TKContainerViewController_setChildViewController___block_invoke_2;
      v39 = &unk_24E099918;
      v40 = location[0];
      v41 = v57;
      objc_msgSend(v23, "transitionWithView:duration:options:animations:completion:", v22, 5243008, &v42, &v35, v20);
      v8 = (UINavigationItem *)(id)objc_msgSend(location[0], "navigationItem");
      childNavigationItem = v57->_childNavigationItem;
      v57->_childNavigationItem = v8;

      v34 = -[UINavigationItem rightBarButtonItems](v57->_childNavigationItem, "rightBarButtonItems");
      if (v34)
      {
        v18 = (id)-[TKContainerViewController navigationItem](v57, "navigationItem");
        objc_msgSend(v18, "setRightBarButtonItems:", v34);

      }
      v10 = -[UINavigationItem leftBarButtonItems](v57->_childNavigationItem, "leftBarButtonItems");
      v11 = v34;
      v34 = v10;

      if (v34)
      {
        v17 = (id)-[TKContainerViewController navigationItem](v57, "navigationItem");
        objc_msgSend(v17, "setLeftBarButtonItems:", v34);

      }
      v33 = -[UINavigationItem title](v57->_childNavigationItem, "title");
      if (v33)
      {
        v16 = (id)-[TKContainerViewController navigationItem](v57, "navigationItem");
        objc_msgSend(v16, "setTitle:", v33);

      }
      v32 = -[UINavigationItem titleView](v57->_childNavigationItem, "titleView");
      if (v32)
      {
        v15 = (id)-[TKContainerViewController navigationItem](v57, "navigationItem");
        objc_msgSend(v15, "setTitleView:", v32);

      }
      if (!v57->_observer)
      {
        objc_initWeak(&from, v57);
        v14 = [TKKeyPathObserver alloc];
        v25 = MEMORY[0x24BDAC760];
        v26 = -1073741824;
        v27 = 0;
        v28 = __52__TKContainerViewController_setChildViewController___block_invoke_3;
        v29 = &unk_24E09A120;
        objc_copyWeak(&v30, &from);
        v13 = -[TKKeyPathObserver initWithBlock:](v14, "initWithBlock:", &v25);
        observer = v57->_observer;
        v57->_observer = (TKKeyPathObserver *)v13;

        objc_destroyWeak(&v30);
        objc_destroyWeak(&from);
      }
      -[TKContainerViewController observeChild](v57, "observeChild");
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      objc_storeStrong((id *)&v41, 0);
      objc_storeStrong(&v40, 0);
      objc_storeStrong(v48, 0);
      objc_storeStrong(&v47, 0);
      objc_storeStrong(&v53, 0);
      objc_storeStrong(&v54, 0);
      v55 = 0;
    }
    else
    {
      v55 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

void __52__TKContainerViewController_setChildViewController___block_invoke(uint64_t a1)
{
  void *v2;
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
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)MEMORY[0x24BDD1628];
  v15 = (id)objc_msgSend(*(id *)(a1 + 40), "leftAnchor");
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "leftAnchor");
  v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
  v16[0] = v13;
  v12 = (id)objc_msgSend(*(id *)(a1 + 40), "rightAnchor");
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "rightAnchor");
  v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v16[1] = v10;
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "topAnchor");
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "topAnchor");
  v7 = (id)objc_msgSend(v9, "constraintEqualToAnchor:");
  v16[2] = v7;
  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v4 = (id)objc_msgSend(v6, "constraintEqualToAnchor:");
  v16[3] = v4;
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 4);
  objc_msgSend(v2, "activateConstraints:");

}

void __52__TKContainerViewController_setChildViewController___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  if ((objc_msgSend(MEMORY[0x24BEBD7A0], "instancesRespondToSelector:", sel__computeAndApplyScrollContentInsetDeltaForViewController_) & 1) != 0)
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 40), "navigationController");
    objc_msgSend(v3, "_computeAndApplyScrollContentInsetDeltaForViewController:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v1 = (id)objc_msgSend(v2, "view");
    objc_msgSend(v1, "setNeedsLayout");

  }
}

void __52__TKContainerViewController_setChildViewController___block_invoke_3(id *a1, void *a2, void *a3)
{
  id WeakRetained;
  id v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = 0;
  objc_storeStrong(&v6, a3);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "updateInternals:", v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)observeChild
{
  -[TKKeyPathObserver stopObserving](self->_observer, "stopObserving");
  if (self->_childViewController)
  {
    if (self->_childNavigationItem)
    {
      -[TKKeyPathObserver observe:keyPath:](self->_observer, "observe:keyPath:", self->_childViewController, CFSTR("navigationItem"));
      -[TKKeyPathObserver observe:keyPath:](self->_observer, "observe:keyPath:", self->_childNavigationItem, CFSTR("rightBarButtonItems"));
      -[TKKeyPathObserver observe:keyPath:](self->_observer, "observe:keyPath:", self->_childNavigationItem, CFSTR("leftBarButtonItems"));
      -[TKKeyPathObserver observe:keyPath:](self->_observer, "observe:keyPath:", self->_childNavigationItem, CFSTR("title"));
      -[TKKeyPathObserver observe:keyPath:](self->_observer, "observe:keyPath:", self->_childNavigationItem, CFSTR("titleView"));
    }
  }
}

- (void)updateInternals:(id)a3
{
  id v3;
  UIView *v4;
  id v5;
  NSString *v6;
  id v7;
  NSArray *v8;
  id v9;
  NSArray *v10;
  id location[2];
  TKContainerViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("navigationItem")) & 1) != 0)
  {
    -[TKKeyPathObserver stopObserving](v12->_observer, "stopObserving");
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("rightBarButtonItems")) & 1) != 0)
  {
    v10 = -[UINavigationItem rightBarButtonItems](v12->_childNavigationItem, "rightBarButtonItems");
    v9 = (id)-[TKContainerViewController navigationItem](v12, "navigationItem");
    objc_msgSend(v9, "setRightBarButtonItems:", v10);

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("leftBarButtonItems")) & 1) != 0)
  {
    v8 = -[UINavigationItem leftBarButtonItems](v12->_childNavigationItem, "leftBarButtonItems");
    v7 = (id)-[TKContainerViewController navigationItem](v12, "navigationItem");
    objc_msgSend(v7, "setLeftBarButtonItems:", v8);

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("title")) & 1) != 0)
  {
    v6 = -[UINavigationItem title](v12->_childNavigationItem, "title");
    v5 = (id)-[TKContainerViewController navigationItem](v12, "navigationItem");
    objc_msgSend(v5, "setTitle:", v6);

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("titleView")) & 1) != 0)
  {
    v4 = -[UINavigationItem titleView](v12->_childNavigationItem, "titleView");
    v3 = (id)-[TKContainerViewController navigationItem](v12, "navigationItem");
    objc_msgSend(v3, "setTitleView:", v4);

  }
  objc_storeStrong(location, 0);
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_childNavigationItem, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end

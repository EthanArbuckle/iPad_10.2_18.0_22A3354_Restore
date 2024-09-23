@implementation TKApplicationViewController

- (TKApplicationViewController)initWithBundleURL:(id)a3 loadPage:(id)a4
{
  id v6;
  id v7;
  TKApplicationViewController *v8;
  TKApplicationViewController *v9;
  uint64_t v10;
  int v11;
  int v12;
  id (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id location[2];
  TKApplicationViewController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v8 = v18;
  v6 = location[0];
  v7 = v16;
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __58__TKApplicationViewController_initWithBundleURL_loadPage___block_invoke;
  v14 = &unk_24E099850;
  v15 = v16;
  v18 = 0;
  v18 = -[TKApplicationViewController initWithBundleURL:viewName:delegate:](v8, "initWithBundleURL:viewName:delegate:", v6, v7);
  v9 = v18;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v18, 0);
  return v9;
}

id __58__TKApplicationViewController_initWithBundleURL_loadPage___block_invoke(uint64_t a1)
{
  id v3;
  id v4;

  v3 = +[TKApplication shared](TKApplication, "shared");
  v4 = (id)objc_msgSend(v3, "loadPage:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (TKApplicationViewController)initWithBundleURL:(id)a3 loadPage:(id)a4 withData:(id)a5
{
  id v8;
  id v9;
  TKApplicationViewController *v10;
  TKApplicationViewController *v11;
  uint64_t v12;
  int v13;
  int v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  TKApplicationViewController *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v10 = v22;
  v8 = location[0];
  v9 = v20;
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __67__TKApplicationViewController_initWithBundleURL_loadPage_withData___block_invoke;
  v16 = &unk_24E099878;
  v17 = v20;
  v18 = v19;
  v22 = 0;
  v22 = -[TKApplicationViewController initWithBundleURL:viewName:delegate:](v10, "initWithBundleURL:viewName:delegate:", v8, v9);
  v11 = v22;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v11;
}

id __67__TKApplicationViewController_initWithBundleURL_loadPage_withData___block_invoke(uint64_t a1)
{
  id v3;
  id v4;

  v3 = +[TKApplication shared](TKApplication, "shared");
  v4 = (id)objc_msgSend(v3, "loadPage:withData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return v4;
}

- (TKApplicationViewController)initWithBundleURL:(id)a3 loadPage:(id)a4 withDataRequest:(id)a5
{
  id v8;
  id v9;
  TKApplicationViewController *v10;
  TKApplicationViewController *v11;
  uint64_t v12;
  int v13;
  int v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  TKApplicationViewController *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v10 = v22;
  v8 = location[0];
  v9 = v20;
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __74__TKApplicationViewController_initWithBundleURL_loadPage_withDataRequest___block_invoke;
  v16 = &unk_24E099878;
  v17 = v20;
  v18 = v19;
  v22 = 0;
  v22 = -[TKApplicationViewController initWithBundleURL:viewName:delegate:](v10, "initWithBundleURL:viewName:delegate:", v8, v9);
  v11 = v22;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v11;
}

id __74__TKApplicationViewController_initWithBundleURL_loadPage_withDataRequest___block_invoke(uint64_t a1)
{
  id v3;
  id v4;

  v3 = +[TKApplication shared](TKApplication, "shared");
  v4 = (id)objc_msgSend(v3, "loadPage:withDataRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return v4;
}

- (TKApplicationViewController)initWithBundleURL:(id)a3 viewName:(id)a4 delegate:(id)a5
{
  TKApplicationViewController *v5;
  TKApplicationViewController *v7;
  id v8;
  id v9;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(id *, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  id from;
  objc_super v21;
  id v22;
  id v23;
  id location[2];
  TKApplicationViewController *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v5 = v25;
  v25 = 0;
  v21.receiver = v5;
  v21.super_class = (Class)TKApplicationViewController;
  v25 = -[TKApplicationViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0);
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    objc_initWeak(&from, v25);
    v9 = +[TKApplication shared](TKApplication, "shared");
    v8 = location[0];
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __67__TKApplicationViewController_initWithBundleURL_viewName_delegate___block_invoke;
    v16 = &unk_24E0998C8;
    objc_copyWeak(&v19, &from);
    v17 = v23;
    v18 = v22;
    objc_msgSend(v9, "loadBundle:completion:", v8, &v12);

    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);
  }
  v7 = v25;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v7;
}

void __67__TKApplicationViewController_initWithBundleURL_viewName_delegate___block_invoke(id *a1, void *a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[1] = a1;
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __67__TKApplicationViewController_initWithBundleURL_viewName_delegate___block_invoke_2;
  v8 = &unk_24E0998A0;
  objc_copyWeak(v12, a1 + 6);
  v9 = location[0];
  v10 = a1[4];
  v11 = a1[5];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(v12);
  objc_storeStrong(location, 0);
}

void __67__TKApplicationViewController_initWithBundleURL_viewName_delegate___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  BOOL v5;
  id v6;
  id v7;
  id v8;
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 56));
  if (location[0])
  {
    if (*(_QWORD *)(a1 + 32))
    {
      if ((objc_msgSend(location[0], "handleApplicationControllerError") & 1) == 0)
      {
        v8 = +[TKApplication shared](TKApplication, "shared");
        v7 = (id)objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
        v6 = (id)objc_msgSend(v8, "newErrorViewController:");
        objc_msgSend(location[0], "setChildViewController:");

      }
    }
    else
    {
      v4 = +[TKApplication shared](TKApplication, "shared");
      v3 = (id)objc_msgSend(v4, "repository");
      v1 = (id)objc_msgSend(v3, "tmlPathForName:", *(_QWORD *)(a1 + 40));
      v5 = v1 != 0;

      if (v5 || (objc_msgSend(location[0], "handleApplicationControllerError") & 1) == 0)
      {
        v2 = (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        objc_msgSend(location[0], "didLoadViewController:");

      }
    }
  }
  objc_storeStrong(location, 0);
}

- (BOOL)handleApplicationControllerError
{
  id v3;
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[TKApplicationViewController setLoadingViewController:](self, "setLoadingViewController:", 0);
  v3 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v3, "applicationControllerError:", self);

  return 1;
}

- (void)didLoadViewController:(id)a3
{
  id v3;
  char v4;
  char v5;
  id WeakRetained;
  id location[2];
  TKApplicationViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[TKApplicationViewController setChildViewController:](v8, "setChildViewController:", location[0]);
  v5 = 0;
  v4 = 0;
  if (location[0])
  {
    WeakRetained = objc_loadWeakRetained((id *)&v8->_delegate);
    v5 = 1;
    v4 = objc_opt_respondsToSelector();
  }
  if ((v5 & 1) != 0)

  if ((v4 & 1) != 0)
  {
    v3 = objc_loadWeakRetained((id *)&v8->_delegate);
    objc_msgSend(v3, "applicationController:didLoadViewController:", v8, location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;
  SEL v7;
  TKApplicationViewController *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)TKApplicationViewController;
  -[TKApplicationViewController viewDidLoad](&v6, sel_viewDidLoad);
  v5 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v4 = (id)-[TKApplicationViewController view](v8, "view");
  objc_msgSend(v4, "setBackgroundColor:", v5);

  if (!v8->_loadingViewController)
  {
    v3 = +[TKApplication shared](TKApplication, "shared");
    v2 = (id)objc_msgSend(v3, "newLoadingViewController");
    -[TKApplicationViewController setLoadingViewController:](v8, "setLoadingViewController:");

  }
}

- (void)setChildViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;
  UIView *v13;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  TKApplicationViewController *v20;
  uint64_t v21;
  int v22;
  int v23;
  void (*v24)(uint64_t);
  void *v25;
  TKApplicationViewController *v26;
  id v27;
  id v28[2];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  int v35;
  id location[2];
  TKApplicationViewController *v37;

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v37->_childViewController == location[0])
  {
    v35 = 1;
  }
  else
  {
    if (v37->_childViewController)
    {
      -[UIViewController willMoveToParentViewController:](v37->_childViewController, "willMoveToParentViewController:", 0);
      v13 = -[UIViewController view](v37->_childViewController, "view");
      -[UIView removeFromSuperview](v13, "removeFromSuperview");

      -[UIViewController removeFromParentViewController](v37->_childViewController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&v37->_childViewController, location[0]);
    if (location[0])
    {
      v34 = (id)-[TKApplicationViewController view](v37, "view");
      -[TKApplicationViewController addChildViewController:](v37, "addChildViewController:", location[0]);
      -[UIViewController willMoveToParentViewController:](v37->_loadingViewController, "willMoveToParentViewController:");
      v33 = (id)objc_msgSend(location[0], "view");
      objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v34, "bounds");
      *(double *)&v31 = v3;
      *((double *)&v31 + 1) = v4;
      *(double *)&v32 = v5;
      *((double *)&v32 + 1) = v6;
      v29 = v31;
      v30 = v32;
      objc_msgSend(v33, "setFrame:", v3, v4, v5, v6);
      v8 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      objc_msgSend(v8, "statusBarOrientationAnimationDuration");
      v9 = v7 / 2.0;

      v28[1] = *(id *)&v9;
      v11 = (void *)MEMORY[0x24BEBDB00];
      v12 = (id)-[TKApplicationViewController view](v37, "view");
      v10 = MEMORY[0x24BDAC760];
      v21 = MEMORY[0x24BDAC760];
      v22 = -1073741824;
      v23 = 0;
      v24 = __54__TKApplicationViewController_setChildViewController___block_invoke;
      v25 = &unk_24E0998F0;
      v26 = v37;
      v27 = v34;
      v28[0] = v33;
      v14 = v10;
      v15 = -1073741824;
      v16 = 0;
      v17 = __54__TKApplicationViewController_setChildViewController___block_invoke_2;
      v18 = &unk_24E099918;
      v19 = location[0];
      v20 = v37;
      objc_msgSend(v11, "transitionWithView:duration:options:animations:completion:", v12, 5243008, &v21, &v14, v9);

      objc_storeStrong((id *)&v20, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(v28, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong((id *)&v26, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      v35 = 0;
    }
    else
    {
      v35 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

void __54__TKApplicationViewController_setChildViewController___block_invoke(uint64_t a1)
{
  id v1;
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
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v1 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "view");
  objc_msgSend(v1, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 40), "insertSubview:atIndex:", *(_QWORD *)(a1 + 48), 0);
  v3 = (void *)MEMORY[0x24BDD1628];
  v16 = (id)objc_msgSend(*(id *)(a1 + 48), "leftAnchor");
  v15 = (id)objc_msgSend(*(id *)(a1 + 40), "leftAnchor");
  v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v17[0] = v14;
  v13 = (id)objc_msgSend(*(id *)(a1 + 48), "rightAnchor");
  v12 = (id)objc_msgSend(*(id *)(a1 + 40), "rightAnchor");
  v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
  v17[1] = v11;
  v10 = (id)objc_msgSend(*(id *)(a1 + 48), "topAnchor");
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "topAnchor");
  v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
  v17[2] = v8;
  v7 = (id)objc_msgSend(*(id *)(a1 + 48), "bottomAnchor");
  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
  v5 = (id)objc_msgSend(v7, "constraintEqualToAnchor:");
  v17[3] = v5;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  objc_msgSend(v3, "activateConstraints:");

}

void __54__TKApplicationViewController_setChildViewController___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 992), "removeFromParentViewController");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 992), 0);
}

- (void)setLoadingViewController:(id)a3
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  TKApplicationViewController *v24;
  uint64_t v25;
  int v26;
  int v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  TKApplicationViewController *v43;
  uint64_t v44;
  int v45;
  int v46;
  void (*v47)(uint64_t);
  void *v48;
  TKApplicationViewController *v49;
  double v50;
  int v51;
  id location[2];
  TKApplicationViewController *v53;

  v53 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v53->_loadingViewController == location[0])
  {
    v51 = 1;
  }
  else
  {
    v16 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    objc_msgSend(v16, "statusBarOrientationAnimationDuration");
    v17 = v3 / 2.0;

    v50 = v17;
    if (v53->_loadingViewController)
    {
      -[UIViewController willMoveToParentViewController:](v53->_loadingViewController, "willMoveToParentViewController:");
      v14 = (void *)MEMORY[0x24BEBDB00];
      v15 = (id)-[TKApplicationViewController view](v53, "view");
      v13 = v50;
      v12 = MEMORY[0x24BDAC760];
      v44 = MEMORY[0x24BDAC760];
      v45 = -1073741824;
      v46 = 0;
      v47 = __56__TKApplicationViewController_setLoadingViewController___block_invoke;
      v48 = &unk_24E099940;
      v49 = v53;
      v38 = v12;
      v39 = -1073741824;
      v40 = 0;
      v41 = __56__TKApplicationViewController_setLoadingViewController___block_invoke_2;
      v42 = &unk_24E099968;
      v43 = v53;
      objc_msgSend(v14, "transitionWithView:duration:options:animations:completion:", v15, 5243008, &v44, &v38, v13);

      objc_storeStrong((id *)&v43, 0);
      objc_storeStrong((id *)&v49, 0);
    }
    objc_storeStrong((id *)&v53->_loadingViewController, location[0]);
    if (location[0])
    {
      v37 = (id)-[TKApplicationViewController view](v53, "view");
      -[TKApplicationViewController addChildViewController:](v53, "addChildViewController:", location[0]);
      v36 = (id)objc_msgSend(location[0], "view");
      objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v37, "bounds");
      *(_QWORD *)&v34 = v4;
      *((_QWORD *)&v34 + 1) = v5;
      *(_QWORD *)&v35 = v6;
      *((_QWORD *)&v35 + 1) = v7;
      v32 = v34;
      v33 = v35;
      objc_msgSend(v36, "setFrame:", v34, v35);
      v11 = (void *)MEMORY[0x24BEBDB00];
      v9 = v37;
      v10 = v50;
      v8 = MEMORY[0x24BDAC760];
      v25 = MEMORY[0x24BDAC760];
      v26 = -1073741824;
      v27 = 0;
      v28 = __56__TKApplicationViewController_setLoadingViewController___block_invoke_3;
      v29 = &unk_24E099990;
      v30 = v37;
      v31 = v36;
      v18 = v8;
      v19 = -1073741824;
      v20 = 0;
      v21 = __56__TKApplicationViewController_setLoadingViewController___block_invoke_4;
      v22 = &unk_24E099918;
      v23 = location[0];
      v24 = v53;
      objc_msgSend(v11, "transitionWithView:duration:options:animations:completion:", v9, 5243008, &v25, &v18, v10);
      objc_storeStrong((id *)&v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v37, 0);
      v51 = 0;
    }
    else
    {
      v51 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

void __56__TKApplicationViewController_setLoadingViewController___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "view");
  objc_msgSend(v1, "removeFromSuperview");

}

uint64_t __56__TKApplicationViewController_setLoadingViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "removeFromParentViewController");
}

void __56__TKApplicationViewController_setLoadingViewController___block_invoke_3(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
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

uint64_t __56__TKApplicationViewController_setLoadingViewController___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
}

- (void)dismissApplicationControllerAnimated:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  BOOL v7;
  BOOL v8;
  id v9;
  id WeakRetained;
  char v11;
  BOOL v12;

  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "dismissApplicationController:animated:", self, v12);

  }
  else
  {
    v3 = (id)-[TKApplicationViewController presentingViewController](self, "presentingViewController");
    v8 = v3 == 0;

    if (v8)
    {
      v4 = (id)-[TKApplicationViewController navigationController](self, "navigationController");
      v7 = v4 == 0;

      if (!v7)
      {
        v6 = (id)-[TKApplicationViewController navigationController](self, "navigationController");
        v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", v12);

      }
    }
    else
    {
      -[TKApplicationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v12, 0);
    }
  }
}

+ (id)applicationViewController:(id)a3
{
  id v3;
  id v4;
  id v6;
  int v7;
  id v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = location[0];
  while (1)
  {
    LOBYTE(v7) = 0;
    if (v8)
    {
      objc_opt_class();
      v7 = objc_opt_isKindOfClass() ^ 1;
    }
    if ((v7 & 1) == 0)
      break;
    v3 = (id)objc_msgSend(v8, "parentViewController");
    v4 = v8;
    v8 = v3;

  }
  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)viewName
{
  return self->_viewName;
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (UIViewController)loadingViewController
{
  return self->_loadingViewController;
}

- (TKApplicationViewControllerDelegate)delegate
{
  return (TKApplicationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_viewName, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end

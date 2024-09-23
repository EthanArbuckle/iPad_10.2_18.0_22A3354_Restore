@implementation CKSyndicationPageViewController

- (void)createContentPages
{
  NSMutableArray *v3;
  NSMutableArray *pageContent;
  uint64_t i;
  CKSyndicationContentViewController *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  pageContent = self->_pageContent;
  self->_pageContent = v3;

  for (i = 0; i != 3; ++i)
  {
    v6 = -[CKSyndicationContentViewController initWithIndex:]([CKSyndicationContentViewController alloc], "initWithIndex:", i);
    -[NSMutableArray addObject:](self->_pageContent, "addObject:", v6);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UIPageViewController *v6;
  UIPageViewController *pageViewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CKSyndicationPageViewController;
  -[CKSyndicationPageViewController viewDidLoad](&v27, sel_viewDidLoad);
  -[CKSyndicationPageViewController createContentPages](self, "createContentPages");
  v3 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, *MEMORY[0x1E0CEB9F0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (UIPageViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F0]), "initWithTransitionStyle:navigationOrientation:options:", 1, 0, v5);
  pageViewController = self->_pageViewController;
  self->_pageViewController = v6;

  -[UIPageViewController setDataSource:](self->_pageViewController, "setDataSource:", self);
  -[UIPageViewController setDelegate:](self->_pageViewController, "setDelegate:", self);
  -[CKSyndicationPageViewController viewControllerAtIndex:](self, "viewControllerAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationPageViewController pageViewController](self, "pageViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setViewControllers:direction:animated:completion:", v9, 0, 0, 0);

  -[CKSyndicationPageViewController pageViewController](self, "pageViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationPageViewController addChildViewController:](self, "addChildViewController:", v11);

  -[CKSyndicationPageViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationPageViewController pageViewController](self, "pageViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v14);

  -[CKSyndicationPageViewController pageViewController](self, "pageViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didMoveToParentViewController:", self);

  v16 = objc_alloc_init(MEMORY[0x1E0CEA7E8]);
  v17 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dynamicColorWithLightColor:darkColor:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPageIndicatorTintColor:", v20);

  v21 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dynamicColorWithLightColor:darkColor:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCurrentPageIndicatorTintColor:", v24);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v25);

  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel_pageControlChanged_, 4096);
  objc_msgSend(v16, "setNumberOfPages:", 3);
  -[CKSyndicationPageViewController setPageControl:](self, "setPageControl:", v16);
  -[CKSyndicationPageViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v16);

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
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)CKSyndicationPageViewController;
  -[CKSyndicationPageViewController viewDidLayoutSubviews](&v40, sel_viewDidLayoutSubviews);
  -[CKSyndicationPageViewController pageControl](self, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKSyndicationPageViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

    -[CKSyndicationPageViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getButtonTray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CKSyndicationPageViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getButtonTray");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;

    }
    else
    {
      v14 = 150.0;
    }
    v15 = CKIsRunningInMacCatalyst();
    v16 = 0.125;
    if (v15)
      v16 = 0.5;
    v17 = v14 * v16;
    v18 = v8 - v14 * v16 - v14;
    -[CKSyndicationPageViewController pageViewController](self, "pageViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, v6, v18);

    -[CKSyndicationPageViewController pageViewController](self, "pageViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v24 = v17 * 0.5 + v23;
    -[CKSyndicationPageViewController pageViewController](self, "pageViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = v27;
    -[CKSyndicationPageViewController pageControl](self, "pageControl");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", 0.0, v24, v28, v17);

    if (CKIsRunningInMacCatalyst())
    {
      -[CKSyndicationPageViewController pageViewController](self, "pageViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "frame");
      v33 = v32;
      -[CKSyndicationPageViewController pageViewController](self, "pageViewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "frame");
      v37 = v36;
      -[CKSyndicationPageViewController pageControl](self, "pageControl");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFrame:", 0.0, v33, v37, v17);

    }
    -[CKSyndicationPageViewController pageControl](self, "pageControl");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAutoresizingMask:", 8);

  }
}

- (void)pageControlChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "currentPage");
  -[CKSyndicationPageViewController pageContent](self, "pageContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationPageViewController pageViewController](self, "pageViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = v4 < v9;
  -[CKSyndicationPageViewController viewControllerAtIndex:](self, "viewControllerAtIndex:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationPageViewController pageViewController](self, "pageViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setViewControllers:direction:animated:completion:", v12, v10, 1, 0);

}

- (id)viewControllerAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;

  -[CKSyndicationPageViewController pageContent](self, "pageContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_pageContent, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (unint64_t)indexOfViewController:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CKSyndicationPageViewController pageContent](self, "pageContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  unint64_t v5;
  void *v6;

  v5 = -[CKSyndicationPageViewController indexOfViewController:](self, "indexOfViewController:", a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[CKSyndicationPageViewController viewControllerAtIndex:](self, "viewControllerAtIndex:", v5 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  unint64_t v5;
  void *v6;

  v5 = -[CKSyndicationPageViewController indexOfViewController:](self, "indexOfViewController:", a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[CKSyndicationPageViewController viewControllerAtIndex:](self, "viewControllerAtIndex:", v5 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = v5;
    v6 = -[CKSyndicationPageViewController indexOfViewController:](self, "indexOfViewController:", v5);
    -[CKSyndicationPageViewController pageControl](self, "pageControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCurrentPage:", v6);

    v5 = v8;
  }

}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  void *v7;
  id v8;

  if (!a6)
  {
    objc_msgSend(a5, "objectAtIndex:", 0, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationPageViewController pageControl](self, "pageControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCurrentPage:", -[CKSyndicationPageViewController indexOfViewController:](self, "indexOfViewController:", v8));

  }
}

- (UIPageViewController)pageViewController
{
  return self->_pageViewController;
}

- (void)setPageViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pageViewController, a3);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (CKSyndicationOnboardingPageViewControllerDelegate)delegate
{
  return (CKSyndicationOnboardingPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)pageContent
{
  return self->_pageContent;
}

- (void)setPageContent:(id)a3
{
  objc_storeStrong((id *)&self->_pageContent, a3);
}

- (double)buttonTrayHeight
{
  return self->_buttonTrayHeight;
}

- (void)setButtonTrayHeight:(double)a3
{
  self->_buttonTrayHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageContent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
}

@end

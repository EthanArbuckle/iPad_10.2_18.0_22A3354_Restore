@implementation PBAStackViewController

- (PBAStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PBAStackViewController *v4;
  PBAStackViewController *v5;
  NSArray *viewControllers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PBAStackViewController;
  v4 = -[PBAStackViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    viewControllers = v4->_viewControllers;
    v4->_viewControllers = (NSArray *)&__NSArray0__struct;

  }
  return v5;
}

- (PBAStackViewController)initWithRootViewController:(id)a3
{
  id v4;
  PBAStackViewController *v5;

  v4 = a3;
  v5 = -[PBAStackViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  -[PBAStackViewController pushViewController:animated:completion:](v5, "pushViewController:animated:completion:", v4, 0, 0);

  return v5;
}

- (void)loadView
{
  id v3;
  void *v4;
  UIView *v5;
  UIView *containerView;

  v3 = objc_alloc((Class)UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  containerView = self->_containerView;
  self->_containerView = v5;

  -[PBAStackViewController setView:](self, "setView:", self->_containerView);
}

- (void)setViewControllers:(id)a3
{
  -[PBAStackViewController setViewControllers:animated:](self, "setViewControllers:animated:", a3, 0);
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  -[PBAStackViewController _setViewControllers:animated:completion:](self, "_setViewControllers:animated:completion:", a3, a4, 0);
}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  NSArray *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  void *i;
  void *v18;
  NSArray *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  _QWORD *v32;
  id v33;
  _BOOL4 v34;
  void *v35;
  id v36;
  _QWORD *v37;
  void *v38;
  void (**v39)(void);
  _QWORD v40[4];
  _QWORD *v41;
  void (**v42)(void);
  _QWORD v43[4];
  _QWORD *v44;
  _QWORD v45[4];
  id v46;
  _QWORD *v47;
  void (**v48)(void);
  _QWORD v49[4];
  _QWORD *v50;
  _QWORD v51[4];
  _QWORD *v52;
  _QWORD *v53;
  void (**v54)(void);
  _QWORD v55[4];
  id v56;
  PBAStackViewController *v57;
  char v58;
  _QWORD v59[4];
  id v60;
  char v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];

  v34 = a4;
  v7 = a3;
  v39 = (void (**)(void))a5;
  v8 = self->_viewControllers;
  v9 = objc_msgSend(v7, "copy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBAStackViewController topViewController](self, "topViewController"));
  v38 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v35 = v9;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v71 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
        if (!-[NSArray containsObject:](v8, "containsObject:", v18))
        {
          -[PBAStackViewController addChildViewController:](self, "addChildViewController:", v18);
          if (v18 == v11)
            v15 = 1;
          else
            objc_msgSend(v18, "didMoveToParentViewController:", self);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v19 = v8;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v67 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v12, "containsObject:", v24) & 1) == 0)
        {
          objc_msgSend(v24, "willMoveToParentViewController:", 0);
          if (v24 != v10)
            objc_msgSend(v24, "removeFromParentViewController");
        }
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    }
    while (v21);
  }

  objc_storeStrong((id *)&self->_viewControllers, v35);
  if (v10 != v11)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    -[UIView bounds](self->_containerView, "bounds");
    objc_msgSend(v25, "setFrame:");
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10000780C;
    v64[3] = &unk_100018748;
    v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v65 = v33;
    v32 = objc_retainBlock(v64);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100007818;
    v62[3] = &unk_100018748;
    v36 = v25;
    v63 = v36;
    v31 = objc_retainBlock(v62);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100007824;
    v59[3] = &unk_100018AD0;
    v61 = 0;
    v26 = v10;
    v60 = v26;
    v37 = objc_retainBlock(v59);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100007838;
    v55[3] = &unk_100018AF8;
    v58 = v15 & 1;
    v27 = v11;
    v56 = v27;
    v57 = self;
    v28 = objc_retainBlock(v55);
    if (!v34)
    {
      if (v26)
      {
        ((void (*)(void))v37[2])();
        objc_msgSend(v33, "removeFromSuperview");
        if (v39)
          v39[2]();
      }
      if (v27)
      {
        -[UIView addSubview:](self->_containerView, "addSubview:", v36);
        ((void (*)(_QWORD *))v28[2])(v28);
        if (v39)
          v39[2]();
      }
      goto LABEL_42;
    }
    if (v26 && v27)
    {
      objc_msgSend(v36, "setAlpha:", 1.0);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100007854;
      v51[3] = &unk_100018B40;
      v52 = v37;
      v53 = v28;
      v54 = v39;
      -[PBAStackViewController transitionFromViewController:toViewController:duration:options:animations:completion:](self, "transitionFromViewController:toViewController:duration:options:animations:completion:", v26, v27, 5242880, &stru_100018B18, v51, 0.5);

      v29 = v52;
    }
    else if (!v26 || v27)
    {
      if (v26 || !v27)
        goto LABEL_42;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PBAStackViewController view](self, "view"));
      objc_msgSend(v30, "addSubview:", v36);

      objc_msgSend(v36, "setAlpha:", 0.0);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000078F4;
      v43[3] = &unk_100018B68;
      v44 = v31;
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100007900;
      v40[3] = &unk_100018BB8;
      v41 = v28;
      v42 = v39;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v43, v40, 0.5);

      v29 = v44;
    }
    else
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_1000078A0;
      v49[3] = &unk_100018B68;
      v50 = v32;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000078AC;
      v45[3] = &unk_100018B90;
      v47 = v37;
      v46 = v33;
      v48 = v39;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v49, v45, 0.5);

      v29 = v50;
    }

LABEL_42:
  }

}

- (UIViewController)topViewController
{
  return (UIViewController *)-[NSArray lastObject](self->_viewControllers, "lastObject");
}

- (UIViewController)visibleViewController
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBAStackViewController topViewController](self, "topViewController"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      v5 = v4;

      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));
      v2 = v5;
    }
    while (v4);
  }
  else
  {
    v5 = v2;
  }
  return (UIViewController *)v5;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  NSArray *viewControllers;
  id v9;
  id v10;

  v5 = a4;
  viewControllers = self->_viewControllers;
  v9 = a5;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](viewControllers, "arrayByAddingObject:", a3));
  -[PBAStackViewController _setViewControllers:animated:completion:](self, "_setViewControllers:animated:completion:", v10, v5, v9);

}

- (void)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSUInteger v5;
  NSUInteger v6;
  id v7;

  v3 = a3;
  v5 = -[NSArray count](self->_viewControllers, "count");
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", 0, v6));
  -[PBAStackViewController setViewControllers:animated:](self, "setViewControllers:animated:", v7, v3);

}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", 0, 1));
  -[PBAStackViewController setViewControllers:animated:](self, "setViewControllers:animated:", v5, v3);

}

- (void)popToViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSUInteger v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v7 = -[NSArray indexOfObject:](self->_viewControllers, "indexOfObject:");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBAStackViewController.m"), 204, CFSTR("attempt to pop to view controller %@ not in view controller stack"), v10);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", 0, v7 + 1));
  -[PBAStackViewController setViewControllers:animated:](self, "setViewControllers:animated:", v8, v4);

}

- (void)removeViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *viewControllers;
  id v7;
  id v8;

  v4 = a4;
  viewControllers = self->_viewControllers;
  v7 = a3;
  v8 = -[NSArray mutableCopy](viewControllers, "mutableCopy");
  objc_msgSend(v8, "removeObject:", v7);

  -[PBAStackViewController setViewControllers:animated:](self, "setViewControllers:animated:", v8, v4);
}

- (void)replaceViewController:(id)a3 withViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v9 = a4;
  v10 = -[NSArray mutableCopy](self->_viewControllers, "mutableCopy");
  v11 = objc_msgSend(v10, "indexOfObject:", v13);
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBAStackViewController.m"), 221, CFSTR("attempt to replace view controller %@ not in view controller stack"), v13);

  }
  objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v11, v9);
  -[PBAStackViewController setViewControllers:animated:](self, "setViewControllers:animated:", v10, v5);

}

- (void)showViewController:(id)a3 sender:(id)a4
{
  id v5;

  v5 = a3;
  -[PBAStackViewController pushViewController:animated:completion:](self, "pushViewController:animated:completion:", v5, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UIView *containerView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PBAStackViewController;
  -[PBAStackViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBAStackViewController topViewController](self, "topViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentViewController"));

  if (!v4)
    -[PBAStackViewController addChildViewController:](self, "addChildViewController:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  -[UIView bounds](self->_containerView, "bounds");
  objc_msgSend(v5, "setFrame:");

  containerView = self->_containerView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  -[UIView addSubview:](containerView, "addSubview:", v7);

  if (!v4)
    objc_msgSend(v3, "didMoveToParentViewController:", self);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PBAStackViewController;
  -[PBAStackViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end

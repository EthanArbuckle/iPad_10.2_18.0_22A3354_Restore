@implementation LUIUserGridViewController

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionController](self, "collectionController"));
  objc_msgSend(v3, "unbindContent");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionController](self, "collectionController"));
  objc_msgSend(v4, "setDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)LUIUserGridViewController;
  -[LUIUserGridViewController dealloc](&v5, "dealloc");
}

- (LUIUserGridViewController)initWithCoder:(id)a3
{
  LUIUserGridViewController *v3;
  LUIUserGridViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIUserGridViewController;
  v3 = -[LUIUserGridViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[LUIUserGridViewController commonInit](v3, "commonInit");
  return v4;
}

- (LUIUserGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  LUIUserGridViewController *v4;
  LUIUserGridViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LUIUserGridViewController;
  v4 = -[LUIUserGridViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[LUIUserGridViewController commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  LUIUserGridViewLayout *v3;
  LUIUserGridViewLayout *collectionViewLayout;
  UICollectionView *v5;
  UICollectionView *collectionView;
  CATCollectionController *v7;
  CATCollectionController *collectionController;
  void *v9;
  void *v10;
  void *v11;
  NSArray *arrangedObjects;
  NSMutableArray *v13;
  NSMutableArray *pendingChangeDescriptors;
  void *v15;

  v3 = objc_opt_new(LUIUserGridViewLayout);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v3;

  v5 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("LUIUserGridCollectionView"));
  v7 = objc_opt_new(CATCollectionController);
  collectionController = self->_collectionController;
  self->_collectionController = v7;

  -[CATCollectionController setDelegate:](self->_collectionController, "setDelegate:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[LUISortingSupport sharedInstance](LUISortingSupport, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortDescriptorWithKey:comparatorType:", CFSTR("contact"), 0));
  v15 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  -[CATCollectionController setSortDescriptors:](self->_collectionController, "setSortDescriptors:", v11);

  arrangedObjects = self->_arrangedObjects;
  self->_arrangedObjects = (NSArray *)&__NSArray0__struct;

  v13 = objc_opt_new(NSMutableArray);
  pendingChangeDescriptors = self->_pendingChangeDescriptors;
  self->_pendingChangeDescriptors = v13;

}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v3 = objc_msgSend(v2, "statusBarStyle");

  return (int64_t)v3;
}

- (void)notIntendedUserButtonPressed:(id)a3 forViewController:(id)a4
{
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController navigationController](self, "navigationController", a3, a4));
  v4 = objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)LUIUserGridViewController;
  -[LUIUserGridViewController viewWillLayoutSubviews](&v19, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController privacyView](self, "privacyView"));
  objc_msgSend(v3, "sizeToFit");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController privacyView](self, "privacyView"));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController view](self, "view"));
  objc_msgSend(v9, "frame");
  v11 = (v10 - v6) * 0.5;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController view](self, "view"));
  objc_msgSend(v12, "frame");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
  objc_msgSend(v15, "privacyViewBaselineToBottomPadding");
  v17 = v14 - v16 - v8;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController privacyView](self, "privacyView"));
  objc_msgSend(v18, "setFrame:", v11, v17, v6, v8);

}

- (void)viewDidLoad
{
  void *v3;
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)LUIUserGridViewController;
  -[LUIUserGridViewController viewDidLoad](&v21, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionController](self, "collectionController"));
  objc_msgSend(v5, "bindContentToObject:withKeyPath:", self, CFSTR("students"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setShowsVerticalScrollIndicator:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  objc_msgSend(v9, "setPrefetchingEnabled:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  objc_msgSend(v11, "setClipsToBounds:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  objc_msgSend(v12, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(LUIUserGridViewCell), CFSTR("LUIUserGridViewCell"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  objc_msgSend(v13, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(LUIPaneHeaderView), UICollectionElementKindSectionHeader, CFSTR("LUIPaneHeaderView"));

  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
  {
    v14 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "handleLongPress:");
    objc_msgSend(v14, "setDelegate:", self);
    objc_msgSend(v14, "setDelaysTouchesBegan:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
    objc_msgSend(v15, "addGestureRecognizer:", v14);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  objc_msgSend(v16, "addSubview:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyView defaultPrivacyView](LUIPrivacyView, "defaultPrivacyView"));
  -[LUIUserGridViewController setPrivacyView:](self, "setPrivacyView:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController privacyView](self, "privacyView"));
  objc_msgSend(v19, "addSubview:", v20);

  -[LUIUserGridViewController activateLayoutConstraints](self, "activateLayoutConstraints");
}

- (void)activateLayoutConstraints
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionViewConstraints](self, "collectionViewConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v2);

}

- (id)collectionViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v26[0] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v26[1] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, 20.0));
  v26[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v11, "bottomInset");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10));
  v26[3] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));

  return v14;
}

- (void)enumerateVisibleCellsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];

  v4 = (void (**)(id, _QWORD, char *))a3;
  v15 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v9)
        objc_enumerationMutation(v6);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10), &v15);
      if (v15)
        break;
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)setSortDescriptors:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionController](self, "collectionController"));
  objc_msgSend(v5, "setSortDescriptors:", v4);

}

- (id)sortDescriptors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionController](self, "collectionController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortDescriptors"));

  return v3;
}

- (void)setUsers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController students](self, "students"));

  v5 = v7;
  if (v4 != v7)
  {
    -[LUIUserGridViewController setStudents:](self, "setStudents:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
    objc_msgSend(v6, "reloadData");

    v5 = v7;
  }

}

- (void)setFooterButtonTitle:(id)a3
{
  NSString **p_footerButtonTitle;
  id v5;

  p_footerButtonTitle = &self->_footerButtonTitle;
  v5 = a3;
  if (!-[NSString isEqualToString:](*p_footerButtonTitle, "isEqualToString:"))
    objc_storeStrong((id *)p_footerButtonTitle, a3);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  v8 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "A user is selected. Switching into password view...", v12, 2u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v7));
  -[LUIUserGridViewController setProgressView:](self, "setProgressView:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
  objc_msgSend(v10, "setDelegate:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
  objc_msgSend(v10, "startLoginFlowForUser:", v11);

}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a4));
  objc_msgSend(v4, "setAvatarAlpha:", 0.5);

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a4));
  objc_msgSend(v4, "setAvatarAlpha:", 1.0);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a4));
  objc_msgSend(v4, "setAvatarAlpha:", 1.0);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController arrangedObjects](self, "arrangedObjects", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController arrangedObjects](self, "arrangedObjects"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("LUIUserGridViewCell"), v6));
  objc_msgSend(v10, "setAvatarAlpha:", 1.0);
  objc_msgSend(v10, "setUserInfo:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContactCache sharedInstance](LUIContactCache, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contactForUser:isInstructor:", v9, 0));
  objc_msgSend(v10, "setContact:", v12);

  return v10;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  void *v11;
  UICollectionReusableView *v12;
  void *v13;

  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  if (UICollectionElementKindSectionHeader != v9
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView")),
        v12 = (UICollectionReusableView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("LUIPaneHeaderView"), v10)), v11, v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController headerTitle](self, "headerTitle")), -[UICollectionReusableView setTitle:](v12, "setTitle:", v13), v13, !v12))
  {
    v12 = objc_opt_new(UICollectionReusableView);
  }

  return v12;
}

- (void)controllerWillChangeContent:(id)a3
{
  void *v4;
  NSMutableArray *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionController](self, "collectionController", a3));
  -[LUIUserGridViewController setIsFirstUpdate:](self, "setIsFirstUpdate:", objc_msgSend(v4, "numberOfArrangedObjects") == 0);

  v5 = objc_opt_new(NSMutableArray);
  -[LUIUserGridViewController setPendingChangeDescriptors:](self, "setPendingChangeDescriptors:", v5);

}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  LUIUserGridViewController *v12;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionController](self, "collectionController", a3));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrangedObjects"));

  if (-[LUIUserGridViewController isFirstUpdate](self, "isFirstUpdate"))
  {
    -[LUIUserGridViewController setArrangedObjects:](self, "setArrangedObjects:", v9);
    -[LUIUserGridViewController setPendingChangeDescriptors:](self, "setPendingChangeDescriptors:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
    objc_msgSend(v5, "reloadData");

    -[LUIUserGridViewController setIsFirstUpdate:](self, "setIsFirstUpdate:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController pendingChangeDescriptors](self, "pendingChangeDescriptors"));
    -[LUIUserGridViewController setPendingChangeDescriptors:](self, "setPendingChangeDescriptors:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100034E28;
    v10[3] = &unk_100068D60;
    v11 = v6;
    v12 = self;
    v13 = v9;
    v8 = v6;
    objc_msgSend(v7, "performBatchUpdates:completion:", v10, 0);

  }
}

- (void)controller:(id)a3 willChangeObject:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6 newIndex:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  _CATCollectionControllerChangeDescriptor *v15;

  v12 = a4;
  v13 = a3;
  v15 = objc_opt_new(_CATCollectionControllerChangeDescriptor);
  -[_CATCollectionControllerChangeDescriptor setCollectionController:](v15, "setCollectionController:", v13);

  -[_CATCollectionControllerChangeDescriptor setObject:](v15, "setObject:", v12);
  -[_CATCollectionControllerChangeDescriptor setOldIndex:](v15, "setOldIndex:", a5);
  -[_CATCollectionControllerChangeDescriptor setChangeType:](v15, "setChangeType:", a6);
  -[_CATCollectionControllerChangeDescriptor setNewIndex:](v15, "setNewIndex:", a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController pendingChangeDescriptors](self, "pendingChangeDescriptors"));
  objc_msgSend(v14, "addObject:", v15);

}

- (void)handleLongPress:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v4 = a3;
  if (objc_msgSend(v4, "state") == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController collectionView](self, "collectionView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForItemAtIndexPath:", v11));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUserInfoController sharedController](LUIUserInfoController, "sharedController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
      objc_msgSend(v14, "presentUserInfoForUser:", v15);

    }
    else
    {
      v16 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
        sub_10003CA48(v16);
    }

  }
}

- (LUIPaneHeaderView)headerView
{
  LUIPaneHeaderView *headerView;
  LUIPaneHeaderView *v4;
  LUIPaneHeaderView *v5;
  LUIPaneHeaderView *v6;
  void *v7;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = -[LUIPaneHeaderView initWithFrame:]([LUIPaneHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_headerView;
    self->_headerView = v4;

    -[LUIPaneHeaderView setAutoresizingMask:](self->_headerView, "setAutoresizingMask:", 2);
    v6 = self->_headerView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[LUIPaneHeaderView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    headerView = self->_headerView;
  }
  return headerView;
}

- (BOOL)shouldShowBottomLeftVibrantButton
{
  return 1;
}

- (BOOL)shouldShowBottomRightVibrantButton
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUITemporarySessionSupport sharedInstance](LUITemporarySessionSupport, "sharedInstance"));
  v3 = objc_msgSend(v2, "isTemporarySessionAllowed");

  return v3;
}

- (int64_t)imageTypeForBottomRightVibrantButton
{
  return 4;
}

- (id)titleForBottomLeftVibrantButton
{
  return self->_footerButtonTitle;
}

- (id)titleForBottomRightVibrantButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GUEST"), &stru_100069EB8, 0));

  return v3;
}

- (void)bottomLeftVibrantButtonTapped:(id)a3
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController navigationController](self, "navigationController", a3));
  v3 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)presentPasscodeViewControllerForUser:(id)a3 passcodeViewDidAppearAction:(id)a4 passcodeCanceledAction:(id)a5 passcodeEnteredAction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewController navigationController](self, "navigationController"));
  +[LUIUserLoginPasswordViewController presentInNavigationController:user:passcodeViewDidAppearAction:passcodeCanceledAction:passcodeEnteredAction:](LUIUserLoginPasswordViewController, "presentInNavigationController:user:passcodeViewDidAppearAction:passcodeCanceledAction:passcodeEnteredAction:", v14, v13, v12, v11, v10);

}

- (NSArray)students
{
  return self->_students;
}

- (void)setStudents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)footerButtonTitle
{
  return self->_footerButtonTitle;
}

- (NSArray)users
{
  return self->_users;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitle, a3);
}

- (CATCollectionController)collectionController
{
  return self->_collectionController;
}

- (void)setCollectionController:(id)a3
{
  objc_storeStrong((id *)&self->_collectionController, a3);
}

- (NSMutableArray)pendingChangeDescriptors
{
  return self->_pendingChangeDescriptors;
}

- (void)setPendingChangeDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_pendingChangeDescriptors, a3);
}

- (NSArray)arrangedObjects
{
  return self->_arrangedObjects;
}

- (void)setArrangedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_arrangedObjects, a3);
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
  objc_storeStrong((id *)&self->_headerText, a3);
}

- (LUIPrivacyView)privacyView
{
  return self->_privacyView;
}

- (void)setPrivacyView:(id)a3
{
  objc_storeStrong((id *)&self->_privacyView, a3);
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (BOOL)isFirstUpdate
{
  return self->_isFirstUpdate;
}

- (void)setIsFirstUpdate:(BOOL)a3
{
  self->_isFirstUpdate = a3;
}

- (UILabel)rosterLabel
{
  return self->_rosterLabel;
}

- (void)setRosterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_rosterLabel, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (LUIUserGridViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (LUIProgressAnimationProtocol)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_rosterLabel, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_privacyView, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_arrangedObjects, 0);
  objc_storeStrong((id *)&self->_pendingChangeDescriptors, 0);
  objc_storeStrong((id *)&self->_collectionController, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_footerButtonTitle, 0);
  objc_storeStrong((id *)&self->_students, 0);
}

@end

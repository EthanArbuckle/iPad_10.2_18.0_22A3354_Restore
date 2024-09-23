@implementation UIViewController

- (CGSize)pageContainerSize
{
  UIViewController *v2;
  UIView *v3;
  double v4;
  double v5;
  UIView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  v3 = -[UIViewController view](v2, "view");
  if (v3)
  {
    v6 = v3;
    -[UIView bounds](v3, "bounds");
    v8 = v7;
    v10 = v9;

    v4 = v8;
    v5 = v10;
  }
  else
  {
    __break(1u);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)as_activatePresentationHack
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000105DC;
  block[3] = &unk_100754C58;
  block[4] = a1;
  if (qword_1008542A0 != -1)
    dispatch_once(&qword_1008542A0, block);
}

- (void)as_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  char isKindOfClass;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_opt_class(UISearchController);
  isKindOfClass = objc_opt_isKindOfClass(v8, v10);
  if ((isKindOfClass & 1) == 0)
    -[UIViewController as_viewWillBecomePartiallyVisible](self, "as_viewWillBecomePartiallyVisible");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100088160;
  v15[3] = &unk_100754C80;
  v17 = (isKindOfClass & 1) == 0;
  v15[4] = self;
  v16 = v9;
  v12 = v9;
  -[UIViewController as_presentViewController:animated:completion:](self, "as_presentViewController:animated:completion:", v8, v6, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "as_dismissalTransitionWillBegin:", UIPresentationControllerDismissalTransitionWillBeginNotification, v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "addObserver:selector:name:object:", self, "as_dismissalTransitionDidEnd:", UIPresentationControllerDismissalTransitionDidEndNotification, v8);

}

- (void)as_dismissalTransitionDidEnd:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIPresentationControllerDismissalTransitionDidEndCompletedKey));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[UIViewController as_viewDidBecomeFullyVisible](self, "as_viewDidBecomeFullyVisible");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = UIPresentationControllerDismissalTransitionWillBeginNotification;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "object"));
    objc_msgSend(v7, "removeObserver:name:object:", self, v8, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v11 = UIPresentationControllerDismissalTransitionDidEndNotification;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "object"));
    objc_msgSend(v10, "removeObserver:name:object:", self, v11, v12);

  }
  else
  {
    -[UIViewController as_viewDidBecomePartiallyVisible](self, "as_viewDidBecomePartiallyVisible");
  }

}

- (id)as_viewControllersForVisibilityCallbackForwarding
{
  uint64_t v3;
  void *v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void *v8;
  void *v10;
  void *v11;

  v3 = objc_opt_class(UITabBarController);
  if ((objc_opt_isKindOfClass(self, v3) & 1) == 0)
  {
    v7 = objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(self, v7) & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers"));
      return v8;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController topViewController](self, "topViewController"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController topViewController](self, "topViewController"));
      v10 = v5;
      v6 = &v10;
      goto LABEL_7;
    }
LABEL_8:
    v8 = &__NSArray0__struct;
    goto LABEL_9;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController selectedViewController](self, "selectedViewController"));
  if (!v4)
    goto LABEL_8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController selectedViewController](self, "selectedViewController"));
  v11 = v5;
  v6 = &v11;
LABEL_7:
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 1));

LABEL_9:
  return v8;
}

- (void)as_viewWillBecomeFullyVisible
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController as_viewControllersForVisibilityCallbackForwarding](self, "as_viewControllersForVisibilityCallbackForwarding", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "as_viewWillBecomeFullyVisible");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)as_viewDidBecomeFullyVisible
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController as_viewControllersForVisibilityCallbackForwarding](self, "as_viewControllersForVisibilityCallbackForwarding", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "as_viewDidBecomeFullyVisible");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)as_viewWillBecomePartiallyVisible
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController as_viewControllersForVisibilityCallbackForwarding](self, "as_viewControllersForVisibilityCallbackForwarding", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "as_viewWillBecomePartiallyVisible");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)as_viewDidBecomePartiallyVisible
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController as_viewControllersForVisibilityCallbackForwarding](self, "as_viewControllersForVisibilityCallbackForwarding", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "as_viewDidBecomePartiallyVisible");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (_TtP8AppStore20PageTraitEnvironment_)snapshotPageTraitEnvironment
{
  UIViewController *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_class *v8;
  char *v9;
  char *v10;
  UIViewController *v11;
  objc_super v13;

  v2 = self;
  -[UIViewController pageContainerSize](v2, "pageContainerSize");
  v4 = v3;
  v6 = v5;
  v7 = -[UIViewController traitCollection](v2, "traitCollection");
  v8 = (objc_class *)type metadata accessor for SnapshotPageTraitEnvironment();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = &v9[OBJC_IVAR____TtC8AppStore28SnapshotPageTraitEnvironment_pageContainerSize];
  *(_QWORD *)v10 = v4;
  *((_QWORD *)v10 + 1) = v6;
  *(_QWORD *)&v9[OBJC_IVAR____TtC8AppStore28SnapshotPageTraitEnvironment_traitCollection] = v7;
  v13.receiver = v9;
  v13.super_class = v8;
  v11 = -[UIViewController init](&v13, "init");

  return (_TtP8AppStore20PageTraitEnvironment_ *)v11;
}

- (void)ppt_pageRenderMetricsPresenterPageLoaded:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  UIViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10020D3F8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end

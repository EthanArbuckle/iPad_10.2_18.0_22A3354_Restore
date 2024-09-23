@implementation SPUISearchBarWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SPUISecureViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  SPUISearchBarWindow *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SPUISearchBarWindowSceneDelegate *v20;

  v6 = a3;
  objc_msgSend(v6, "_setKeepContextAssociationInBackground:", 1);
  v20 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_FBSScene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  objc_msgSend(v6, "_registerSettingsDiffActionArray:forKey:", v7, v9);

  v10 = objc_opt_new(SPUISecureViewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "createAdditionalHeaderView"));

  objc_msgSend(v13, "setInteractionDelegate:", self);
  -[SPUISecureViewController setView:](v10, "setView:", v13);
  -[SPUISearchBarWindowSceneDelegate setView:](self, "setView:", v13);
  objc_msgSend(v13, "setActiveInterfaceOrientation:", 1);
  v14 = objc_alloc_init(SPUISearchBarWindow);
  -[SPUISearchBarWindowSceneDelegate setSearchBarWindow:](self, "setSearchBarWindow:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate searchBarWindow](self, "searchBarWindow"));
  objc_msgSend(v15, "setBackgroundColor:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate searchBarWindow](self, "searchBarWindow"));
  objc_msgSend(v16, "setWindowScene:", v6);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate searchBarWindow](self, "searchBarWindow"));
  objc_msgSend(v17, "setRootViewController:", v10);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate searchBarWindow](self, "searchBarWindow"));
  objc_msgSend(v18, "setHidden:", 0);

  -[SPUISearchBarWindowSceneDelegate sizeBar](self, "sizeBar");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v19, "addObserver:selector:name:object:", self, "sizeBar", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)sizeBar
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate view](self, "view"));
  objc_msgSend(v3, "setNeedsLayout");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate view](self, "view"));
  objc_msgSend(v4, "layoutIfNeeded");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate view](self, "view"));
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", UILayoutFittingExpandedSize.width, UILayoutFittingExpandedSize.height);
  -[SPUISearchBarWindowSceneDelegate didSizeWithHeight:](self, "didSizeWithHeight:", v5);

}

- (void)didSizeWithHeight:(double)a3
{
  double v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  -[SPUISearchBarWindowSceneDelegate headerHeight](self, "headerHeight");
  if (v5 != a3)
  {
    -[SPUISearchBarWindowSceneDelegate setHeaderHeight:](self, "setHeaderHeight:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate searchBarWindow](self, "searchBarWindow"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_scene"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005B6C;
    v8[3] = &unk_10000C3E0;
    *(double *)&v8[4] = a3;
    objc_msgSend(v6, "updateClientSettingsWithBlock:", v8);

  }
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "settings"));
  v10 = objc_opt_class(SPUISearchBarSceneSettings);
  isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  v12 = v18;
  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "settings"));
    v14 = objc_msgSend(v13, "interfaceOrientation");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate view](self, "view"));
    v16 = objc_msgSend(v15, "activeInterfaceOrientation");

    if (v16 != v14)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate view](self, "view"));
      objc_msgSend(v17, "setActiveInterfaceOrientation:", v14);

      -[SPUISearchBarWindowSceneDelegate sizeBar](self, "sizeBar");
    }

    v12 = v18;
  }

}

- (void)didFocusHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headerView"));
  objc_msgSend(v5, "showCancelButton:animated:", 0, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate searchBarWindow](self, "searchBarWindow"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_scene"));
  objc_msgSend(v7, "updateClientSettingsWithTransitionBlock:", &stru_10000C420);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[SPUISearchBarWindowSceneDelegate searchBarWindow](self, "searchBarWindow"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v9, "endEditing:", 1);

}

- (SPUISearchBarWindow)searchBarWindow
{
  return (SPUISearchBarWindow *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSearchBarWindow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (SPUISearchHeader)view
{
  return (SPUISearchHeader *)objc_getProperty(self, a2, 24, 1);
}

- (void)setView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_searchBarWindow, 0);
}

@end

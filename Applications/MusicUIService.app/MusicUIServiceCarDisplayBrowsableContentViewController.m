@implementation MusicUIServiceCarDisplayBrowsableContentViewController

- (void)switchToState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  _QWORD *v10;
  id needsSwitch;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "associatedBundleID"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stateName"));
    v7 = (objc_msgSend(v6, "isEqualToString:", CFSTR("nowplaying")) & 1) != 0
      || MRMediaRemoteApplicationSupportsImmediatePlayback(v5) != 0;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceCarDisplayBrowsableContentViewController traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == (id)3)
    {
      -[MusicUIServiceCarDisplayBrowsableContentViewController _performSwitchToNowPlayingForBundleID:showNowPlaying:](self, "_performSwitchToNowPlayingForBundleID:showNowPlaying:", v5, v7);
    }
    else
    {
      objc_initWeak(&location, self);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100005F34;
      v12[3] = &unk_10000C3A0;
      objc_copyWeak(&v14, &location);
      v13 = v5;
      v15 = v7;
      v10 = objc_retainBlock(v12);
      needsSwitch = self->_needsSwitch;
      self->_needsSwitch = v10;

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id needsSwitch;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicUIServiceCarDisplayBrowsableContentViewController;
  -[MusicUIServiceCarDisplayBrowsableContentViewController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MusicUIServiceCarDisplayBrowsableContentViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v4, "userInterfaceIdiom") == (id)3)
  {
    needsSwitch = self->_needsSwitch;

    if (!needsSwitch)
      return;
    (*((void (**)(void))self->_needsSwitch + 2))();
    v4 = self->_needsSwitch;
    self->_needsSwitch = 0;
  }

}

- (void)_performSwitchToNowPlayingForBundleID:(id)a3 showNowPlaying:(BOOL)a4
{
  _BOOL4 v4;
  NSString **p_displayedViewControllerKey;
  void *v8;
  id v9;
  void *v10;
  MCDPlayableContentViewController *v11;
  MCDPlayableContentViewController *nowPlayingViewController;
  void *v13;
  void *v14;
  void *v15;
  MCDPlayableContentViewController *v16;
  id v17;

  v4 = a4;
  p_displayedViewControllerKey = &self->_displayedViewControllerKey;
  v17 = a3;
  if (objc_msgSend(v17, "isEqualToString:", *p_displayedViewControllerKey))
  {
    if (v4)
      -[MCDPlayableContentViewController refreshNavigationStackForLaunch](self->_nowPlayingViewController, "refreshNavigationStackForLaunch");
  }
  else
  {
    -[MusicUIServiceCarDisplayBrowsableContentViewController saveCurrentStack](self, "saveCurrentStack");
    objc_storeStrong((id *)&self->_displayedViewControllerKey, a3);
    -[MCDPlayableContentViewController willMoveToParentViewController:](self->_nowPlayingViewController, "willMoveToParentViewController:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDPlayableContentViewController view](self->_nowPlayingViewController, "view"));
    objc_msgSend(v8, "removeFromSuperview");

    -[MCDPlayableContentViewController removeFromParentViewController](self->_nowPlayingViewController, "removeFromParentViewController");
    v9 = objc_alloc((Class)MCDPlayableContentViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_bundleIDsToStacks, "objectForKey:", *p_displayedViewControllerKey));
    v11 = (MCDPlayableContentViewController *)objc_msgSend(v9, "initWithBundleID:stack:", v17, v10);
    nowPlayingViewController = self->_nowPlayingViewController;
    self->_nowPlayingViewController = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceCarDisplayBrowsableContentViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDPlayableContentViewController view](self->_nowPlayingViewController, "view"));
    objc_msgSend(v13, "bounds");
    objc_msgSend(v14, "setFrame:");

    -[MusicUIServiceCarDisplayBrowsableContentViewController addChildViewController:](self, "addChildViewController:", self->_nowPlayingViewController);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDPlayableContentViewController view](self->_nowPlayingViewController, "view"));
    objc_msgSend(v13, "addSubview:", v15);

    v16 = self->_nowPlayingViewController;
    if (v4)
    {
      -[MCDPlayableContentViewController refreshNavigationStackForLaunch](v16, "refreshNavigationStackForLaunch");
    }
    else
    {
      -[MCDPlayableContentViewController didMoveToParentViewController:](v16, "didMoveToParentViewController:", self);
      if (!self->_firstLaunchCompleted)
        -[MCDPlayableContentViewController refreshNavigationStackForLaunch](self->_nowPlayingViewController, "refreshNavigationStackForLaunch");
      -[MusicUIServiceCarDisplayBrowsableContentViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    }
    self->_firstLaunchCompleted = 1;

  }
}

- (void)saveCurrentStack
{
  NSMutableDictionary *v3;
  NSMutableDictionary *bundleIDsToStacks;
  MCDPlayableContentViewController *nowPlayingViewController;
  uint64_t v6;
  NSMutableDictionary *v7;
  NSString *displayedViewControllerKey;
  id v9;

  if (!self->_bundleIDsToStacks)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bundleIDsToStacks = self->_bundleIDsToStacks;
    self->_bundleIDsToStacks = v3;

  }
  nowPlayingViewController = self->_nowPlayingViewController;
  if (nowPlayingViewController && self->_displayedViewControllerKey)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[MCDPlayableContentViewController currentStack](nowPlayingViewController, "currentStack"));
    v7 = self->_bundleIDsToStacks;
    displayedViewControllerKey = self->_displayedViewControllerKey;
    v9 = (id)v6;
    if (v6)
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v6, displayedViewControllerKey);
    else
      -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", displayedViewControllerKey);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  MCDPlayableContentViewController *nowPlayingViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicUIServiceCarDisplayBrowsableContentViewController;
  -[MusicUIServiceCarDisplayBrowsableContentViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  -[MCDPlayableContentViewController willMoveToParentViewController:](self->_nowPlayingViewController, "willMoveToParentViewController:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDPlayableContentViewController view](self->_nowPlayingViewController, "view"));
  objc_msgSend(v4, "removeFromSuperview");

  -[MCDPlayableContentViewController removeFromParentViewController](self->_nowPlayingViewController, "removeFromParentViewController");
  nowPlayingViewController = self->_nowPlayingViewController;
  self->_nowPlayingViewController = 0;

}

- (id)preferredFocusEnvironments
{
  void *v2;
  id v3;
  objc_super v5;
  MCDPlayableContentViewController *nowPlayingViewController;

  if (self->_nowPlayingViewController)
  {
    nowPlayingViewController = self->_nowPlayingViewController;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &nowPlayingViewController, 1));
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MusicUIServiceCarDisplayBrowsableContentViewController;
    v3 = -[MusicUIServiceCarDisplayBrowsableContentViewController preferredFocusEnvironments](&v5, "preferredFocusEnvironments");
    v2 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_needsSwitch, 0);
  objc_storeStrong((id *)&self->_bundleIDsToStacks, 0);
  objc_storeStrong((id *)&self->_displayedViewControllerKey, 0);
  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
}

@end

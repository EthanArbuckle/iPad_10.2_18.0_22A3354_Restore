@implementation OBWelcomeController

- (id)buddy_animationController:(id)a3 animatedStates:(id)a4 startAtFirstState:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  id location[2];
  OBWelcomeController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = a5;
  v16 = 0;
  if (a5)
  {
    v7 = objc_msgSend(v18, "firstObject");
    v8 = v16;
    v16 = v7;

  }
  v9 = objc_alloc((Class)OBAnimationController);
  v10 = -[OBWelcomeController bundleUrlForPackageName:](v20, "bundleUrlForPackageName:", location[0]);
  v11 = -[OBWelcomeController headerView](v20, "headerView");
  v12 = objc_msgSend(v11, "animationView");
  v15 = objc_msgSend(v9, "initWithUrlToPackage:animationView:animatedStates:startAtFirstState:", v10, v12, v18, v16);

  -[OBWelcomeController setStandardBuddyScaleForAnimation](v20, "setStandardBuddyScaleForAnimation");
  v13 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (id)buddy_animationController:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v7;
  id location[2];
  OBWelcomeController *v9;
  _QWORD v10[2];

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 1"), CFSTR("Dark 1"), 0.01, 1.0);
  v10[0] = v3;
  v4 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 2"), CFSTR("Dark 2"), 1.0, 0.5);
  v10[1] = v4;
  v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2);

  v5 = -[OBWelcomeController buddy_animationController:animatedStates:startAtFirstState:](v9, "buddy_animationController:animatedStates:startAtFirstState:", location[0], v7, 1);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)bundleUrlForPackageName:(id)a3
{
  NSBundle *v3;
  uint64_t v4;
  os_log_t oslog;
  id v7;
  id location[3];
  id v9;
  uint8_t buf[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = -[NSBundle URLForResource:withExtension:](v3, "URLForResource:withExtension:", location[0], CFSTR("ca"));

  if (v7)
  {
    v9 = v7;
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Unable to find url to package %@:", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v9 = 0;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (void)setStandardBuddyScaleForAnimation
{
  -[OBWelcomeController setAdditionalScaleForAnimation:](self, "setAdditionalScaleForAnimation:", 0.0666666667, a2, self);
}

- (void)setAdditionalScaleForAnimation:(double)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class(self);
  v4 = -[OBWelcomeController headerView](self, "headerView");
  objc_msgSend(v3, "setAdditionalScaleForAnimation:headerView:", v4, a3);

}

+ (void)setStandardBuddyScaleForAnimation:(id)a3
{
  id location[2];
  id v4;

  v4 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(v4, "setAdditionalScaleForAnimation:headerView:", location[0], 0.0666666667);
  objc_storeStrong(location, 0);
}

+ (void)setAdditionalScaleForAnimation:(double)a3 headerView:(id)a4
{
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;
  double v11;
  SEL v12;
  id v13;

  v13 = a1;
  v12 = a2;
  v11 = a3;
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v5 = objc_msgSend(v4, "size");

  if (v5 == (id)2)
    v11 = v11 / 2.0;
  v6 = objc_msgSend(v10, "animationView");
  objc_msgSend(v6, "defaultScale");
  v8 = v7 + v11;
  v9 = objc_msgSend(v10, "animationView");
  objc_msgSend(v9, "setScale:", v8);

  objc_storeStrong(&v10, 0);
}

- (void)markPaneToAnimateHeaderOnNextAppearance
{
  id v2;
  OBWelcomeController *v3;
  BOOL v4;
  char isKindOfClass;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  char v12;
  OBWelcomeController *v13;
  char v14;
  id v15;
  char v16;
  id v17;

  v2 = -[OBWelcomeController navigationController](self, "navigationController");
  v3 = (OBWelcomeController *)objc_msgSend(v2, "topViewController");
  v16 = 0;
  v14 = 0;
  v12 = 0;
  v4 = 0;
  if (v3 == self)
  {
    v17 = -[OBWelcomeController navigationController](self, "navigationController");
    v16 = 1;
    v15 = objc_msgSend(v17, "viewControllers");
    v14 = 1;
    v13 = (OBWelcomeController *)objc_msgSend(v15, "firstObject");
    v12 = 1;
    v4 = v13 == self;
  }
  if ((v12 & 1) != 0)

  if ((v14 & 1) != 0)
  if ((v16 & 1) != 0)

  if (!v4)
  {
    v10 = 0;
    isKindOfClass = 0;
    if ((objc_opt_respondsToSelector(self, "animationController") & 1) != 0)
    {
      v11 = -[OBWelcomeController navigationController](self, "navigationController");
      v10 = 1;
      v6 = objc_opt_class(BFFNavigationController);
      isKindOfClass = objc_opt_isKindOfClass(v11, v6);
    }
    if ((v10 & 1) != 0)

    if ((isKindOfClass & 1) != 0)
    {
      v7 = -[OBWelcomeController navigationController](self, "navigationController");
      objc_msgSend(v7, "addDelegateObserver:", self);

      v8 = -[OBWelcomeController headerView](self, "headerView");
      v9 = objc_msgSend(v8, "animationView");
      objc_msgSend(v9, "setAlpha:", 0.0);

    }
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  OBWelcomeController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  if (v14 == v12 && (objc_opt_respondsToSelector(v14, "animationController") & 1) != 0)
  {
    v7 = -[OBWelcomeController animationController](v14, "animationController");
    objc_msgSend(v7, "stopAnimation");

    v8 = -[OBWelcomeController headerView](v14, "headerView");
    v9 = objc_msgSend(v8, "animationView");
    objc_msgSend(v9, "setAlpha:", 1.0);

    v10 = -[OBWelcomeController animationController](v14, "animationController");
    objc_msgSend(v10, "startAnimation");

    v11 = -[OBWelcomeController navigationController](v14, "navigationController");
    objc_msgSend(v11, "removeDelegateObserver:", v14);

  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

@end

@implementation OBWelcomeController

- (id)animationController:(id)a3 animatedStates:(id)a4 startAtFirstState:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v5)
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  else
    v11 = 0;
  v12 = objc_alloc((Class)OBAnimationController);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OBWelcomeController bundleUrlForPackageName:](self, "bundleUrlForPackageName:", v8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OBWelcomeController headerView](self, "headerView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "animationView"));
  v16 = objc_msgSend(v12, "initWithUrlToPackage:animationView:animatedStates:startAtFirstState:", v13, v15, v10, v11);

  -[OBWelcomeController setStandardScaleForAnimation](self, "setStandardScaleForAnimation");
  return v16;
}

- (id)animationController:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 1"), CFSTR("Dark 1"), 0.01, 1.0);
  v10[0] = v5;
  v6 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 2"), CFSTR("Dark 2"), 1.0, 0.5);
  v10[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OBWelcomeController animationController:animatedStates:startAtFirstState:](self, "animationController:animatedStates:startAtFirstState:", v4, v7, 1));
  return v8;
}

- (id)bundleUrlForPackageName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForResource:withExtension:", v3, CFSTR("ca")));

  if (!v5)
    sub_100045254((uint64_t)v3);

  return v5;
}

- (void)setStandardScaleForAnimation
{
  -[OBWelcomeController setAdditionalScaleForAnimation:](self, "setAdditionalScaleForAnimation:", 0.0666666667);
}

- (void)setAdditionalScaleForAnimation:(double)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_opt_class(self, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[OBWelcomeController headerView](self, "headerView"));
  objc_msgSend(v5, "setAdditionalScaleForAnimation:headerView:", v6, a3);

}

+ (void)setStandardScaleForAnimation:(id)a3
{
  objc_msgSend(a1, "setAdditionalScaleForAnimation:headerView:", a3, 0.0666666667);
}

+ (void)setAdditionalScaleForAnimation:(double)a3 headerView:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "animationView"));
  objc_msgSend(v9, "defaultScale");
  v7 = v6 + a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "animationView"));

  objc_msgSend(v8, "setScale:", v7);
}

@end

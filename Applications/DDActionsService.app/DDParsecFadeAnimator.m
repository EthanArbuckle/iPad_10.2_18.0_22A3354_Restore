@implementation DDParsecFadeAnimator

- (double)transitionDuration:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0.2;
}

- (void)animateTransition:(id)a3
{
  double v3;
  id v4;
  id v5;
  id v6;
  double v7;
  void **v8;
  int v9;
  int v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location[2];
  DDParsecFadeAnimator *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = objc_msgSend(location[0], "viewControllerForKey:", UITransitionContextToViewControllerKey);
  v22 = objc_msgSend(location[0], "viewControllerForKey:", UITransitionContextFromViewControllerKey);
  v5 = objc_msgSend(location[0], "containerView");
  v4 = objc_msgSend(v23, "view");
  objc_msgSend(v5, "addSubview:");

  v6 = objc_msgSend(v23, "view");
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[DDParsecFadeAnimator transitionDuration:](v25, "transitionDuration:", location[0]);
  v7 = v3;
  v15 = _NSConcreteStackBlock;
  v16 = -1073741824;
  v17 = 0;
  v18 = sub_10000B3AC;
  v19 = &unk_1000208A8;
  v20 = v23;
  v21 = v22;
  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_10000B430;
  v12 = &unk_1000208D0;
  v13 = v22;
  v14 = location[0];
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v15, v7);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

@end

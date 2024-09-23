@implementation LUICrossFadeAnimationTransition

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "setFrame:");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v11, "setAlpha:", 0.0);

  -[LUICrossFadeAnimationTransition transitionDuration:](self, "transitionDuration:", v4);
  v13 = v12;
  v18 = v4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000D750;
  v19[3] = &unk_100068C30;
  v20 = v5;
  v21 = v6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000D7AC;
  v17[3] = &unk_100069018;
  v14 = v4;
  v15 = v6;
  v16 = v5;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v19, v17, v13);

}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

@end

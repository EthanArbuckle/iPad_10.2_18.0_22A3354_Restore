@implementation SVSTopDismissAnimator

- (void)animateTransition:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[SVSTopDismissAnimator transitionDuration:](self, "transitionDuration:", v4);
  v6 = v5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100114C60;
  v12[3] = &unk_10017E1F0;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100114CD8;
  v9[3] = &unk_10017DF50;
  v10 = v13;
  v11 = v4;
  v7 = v4;
  v8 = v13;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, v9, v6);

}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

@end

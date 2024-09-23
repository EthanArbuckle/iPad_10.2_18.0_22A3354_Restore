@implementation MFComposeNavigationBar

- (void)layoutSubviews
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFComposeNavigationBar;
  -[MFComposeNavigationBar layoutSubviews](&v10, "layoutSubviews");
  if (-[MFComposeNavigationBar docked](self, "docked"))
    v3 = 0.0;
  else
    v3 = 1.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFComposeNavigationBar topItem](self, "topItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftBarButtonItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "setAlpha:", v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFComposeNavigationBar topItem](self, "topItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightBarButtonItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v9, "setAlpha:", v3);

}

- (void)setDocked:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  v4 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D144;
  v7[3] = &unk_100018858;
  v7[4] = self;
  v8 = a3;
  v5 = objc_retainBlock(v7);
  v6 = v5;
  if (v4)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.2);
  else
    ((void (*)(_QWORD *))v5[2])(v5);

}

- (BOOL)docked
{
  return self->_docked;
}

- (void)setDocked:(BOOL)a3
{
  self->_docked = a3;
}

@end

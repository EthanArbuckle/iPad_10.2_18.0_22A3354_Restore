@implementation UIView

- (void)sss_setFrameUnanimatingIfChangingFromCGSizeZero:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  CGRect v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  if (!CGRectEqualToRect(v11, v12))
  {
    -[UIView frame](self, "frame");
    if (v9 == CGSizeZero.width && v8 == CGSizeZero.height)
      -[UIView sss_setFrameUnanimating:](self, "sss_setFrameUnanimating:", x, y, width, height);
    else
      -[UIView setFrame:](self, "setFrame:", x, y, width, height);
  }
}

- (void)sss_setFrameUnanimating:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD v8[9];
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001F1DC;
    v8[3] = &unk_100091F60;
    v8[4] = self;
    *(CGFloat *)&v8[5] = x;
    *(CGFloat *)&v8[6] = y;
    *(CGFloat *)&v8[7] = width;
    *(CGFloat *)&v8[8] = height;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
  }
}

- (void)sss_setFrameUnanimatingLayingOut:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD v8[9];
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001F298;
    v8[3] = &unk_100091F60;
    v8[4] = self;
    *(CGFloat *)&v8[5] = x;
    *(CGFloat *)&v8[6] = y;
    *(CGFloat *)&v8[7] = width;
    *(CGFloat *)&v8[8] = height;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
  }
}

+ (void)sss_animateWithAnimationParameters:(id)a3 animations:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  float minimum;
  float maximum;
  float preferred;
  unsigned __int16 v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  CAFrameRateRange v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002AF20;
  v21[3] = &unk_100092330;
  v10 = v7;
  v22 = v10;
  v11 = v8;
  v23 = v11;
  v12 = v9;
  v24 = v12;
  v13 = objc_retainBlock(v21);
  if (objc_msgSend(v10, "animationReason"))
  {
    v25 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    minimum = v25.minimum;
    maximum = v25.maximum;
    preferred = v25.preferred;
    v17 = (unsigned __int16)objc_msgSend(v10, "animationReason");
    *(float *)&v18 = minimum;
    *(float *)&v19 = maximum;
    *(float *)&v20 = preferred;
    +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v17 | 0x160000u, v13, v18, v19, v20);
  }
  else
  {
    ((void (*)(_QWORD *))v13[2])(v13);
  }

}

@end

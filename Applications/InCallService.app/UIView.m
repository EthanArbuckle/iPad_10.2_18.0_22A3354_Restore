@implementation UIView

- (int64_t)action
{
  return -[UIView tag](self, "tag");
}

- (void)setAction:(int64_t)a3
{
  -[UIView setTag:](self, "setTag:", a3);
}

+ (void)load
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000794B0;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC9F8 != -1)
    dispatch_once(&qword_1002DC9F8, block);
}

- (CGAffineTransform)transformToAbutToEdge:(SEL)a3 ofView:(unint64_t)a4
{
  id v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform *result;
  id v22;

  v8 = a5;
  v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (a4 == 8)
  {
    v22 = v8;
    -[UIView frame](self, "frame");
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0);
    v14 = v16;
    objc_msgSend(v22, "frame");
    v18 = v17;
    objc_msgSend(v22, "frame");
    v15 = v18 + v19;
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    v22 = v8;
    -[UIView frame](self, "frame");
    v11 = v10;
    -[UIView frame](self, "frame");
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v11 + v12, 0.0);
    v14 = v13;
    objc_msgSend(v22, "frame");
LABEL_5:
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v15, 0.0);
    *(float *)&v20 = v20 - v14;
    CGAffineTransformMakeTranslation(retstr, roundf(*(float *)&v20), 0.0);
    v8 = v22;
  }

  return result;
}

- (double)xOriginForCenterOfSuperview
{
  void *v3;
  double v4;
  double v5;
  double v6;
  float v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  objc_msgSend(v3, "bounds");
  v5 = v4 * 0.5;
  -[UIView bounds](self, "bounds");
  v7 = v5 - v6 * 0.5;
  v8 = floorf(v7);

  return v8;
}

- (double)yOriginForCenterOfSuperview
{
  void *v3;
  double v4;
  double v5;
  double v6;
  float v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  objc_msgSend(v3, "bounds");
  v5 = v4 * 0.5;
  -[UIView bounds](self, "bounds");
  v7 = v5 - v6 * 0.5;
  v8 = floorf(v7);

  return v8;
}

@end

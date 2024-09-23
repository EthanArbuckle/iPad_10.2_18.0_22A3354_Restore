@implementation SSSShadowView

+ (double)shadowRadius
{
  return 51.0;
}

+ (id)shadowColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.48));

  return v3;
}

+ (CGSize)shadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)shadowOpacity
{
  return 1.0;
}

- (SSSShadowView)initWithFrame:(CGRect)a3
{
  SSSShadowView *v3;
  _SSSShadowViewInnerViewWithShadow *v4;
  _SSSShadowViewInnerViewWithShadow *innerView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSSShadowView;
  v3 = -[SSSShadowView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SSSShadowView setClipsToBounds:](v3, "setClipsToBounds:", 0);
  v4 = objc_alloc_init(_SSSShadowViewInnerViewWithShadow);
  innerView = v3->_innerView;
  v3->_innerView = v4;

  -[SSSShadowView addSubview:](v3, "addSubview:", v3->_innerView);
  return v3;
}

- (void)layoutSubviews
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002F040;
  v2[3] = &unk_100091920;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (BOOL)_arrayOfRectValues:(id)a3 isEqualToArrayOfRectValues:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char v24;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v8 = 0;
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v8));
        objc_msgSend(v9, "CGRectValue");
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v19 = objc_msgSend(v10, "CGRectValue");
        v24 = SSRectEqualToRect(v19, v12, v14, v16, v18, v20, v21, v22, v23);

        if ((v24 & 1) == 0)
          break;
        ++v8;
      }
      while (v8 < (unint64_t)objc_msgSend(v5, "count"));
    }
    else
    {
      v24 = 1;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)setRectsForShadow:(id)a3
{
  id v5;
  id v6;
  void *v7;
  double v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  if (!-[SSSShadowView _arrayOfRectValues:isEqualToArrayOfRectValues:](self, "_arrayOfRectValues:isEqualToArrayOfRectValues:", self->_rectsForShadow, v5))
  {
    objc_storeStrong((id *)&self->_rectsForShadow, a3);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002F39C;
    v11[3] = &unk_1000923B0;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
    v6 = v12;
    -[SSSShadowView _enumerateAllShadowRectsWithBlock:](self, "_enumerateAllShadowRectsWithBlock:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSShadowView traitCollection](self, "traitCollection"));
    v8 = sub_100010068();

    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, v8, v8);
    v9 = v10;
    objc_msgSend(v6, "applyTransform:", &v9);
    -[_SSSShadowViewInnerViewWithShadow setShadowPath:](self->_innerView, "setShadowPath:", v6);
    -[SSSShadowView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_enumerateAllShadowRectsWithBlock:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void (**v11)(id, _QWORD);

  v11 = (void (**)(id, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSShadowView rectsForShadow](self, "rectsForShadow"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSShadowView rectsForShadow](self, "rectsForShadow"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v6));

      objc_msgSend(v8, "CGRectValue");
      v11[2](v11, v6);

      ++v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSShadowView rectsForShadow](self, "rectsForShadow"));
      v10 = objc_msgSend(v9, "count");

    }
    while (v6 < (unint64_t)v10);
  }

}

- (NSArray)rectsForShadow
{
  return self->_rectsForShadow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectsForShadow, 0);
  objc_storeStrong((id *)&self->_innerView, 0);
}

@end

@implementation IconAndSubIconHeaderViewController

- (IconAndSubIconHeaderViewController)initWithIconImage:(id)a3 andSubIconImage:(id)a4
{
  IconAndSubIconHeaderViewController *v4;
  id v5;
  UIImageView *v6;
  UIImageView *mainImageView;
  id v8;
  UIImageView *v9;
  UIImageView *subImageView;
  id v11;
  UIImageView *v12;
  UIImageView *subIconShadowView;
  IconAndSubIconHeaderViewController *v15;
  IconAndSubIconHeaderViewController *v17;
  objc_super v18;
  id v19;
  id location[2];
  IconAndSubIconHeaderViewController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v4 = v21;
  v21 = 0;
  v18.receiver = v4;
  v18.super_class = (Class)IconAndSubIconHeaderViewController;
  v17 = -[IconAndSubIconHeaderViewController init](&v18, "init");
  v21 = v17;
  objc_storeStrong((id *)&v21, v17);
  if (v17)
  {
    v5 = objc_alloc((Class)UIImageView);
    v6 = (UIImageView *)objc_msgSend(v5, "initWithImage:", location[0]);
    mainImageView = v21->_mainImageView;
    v21->_mainImageView = v6;

    if (v19)
    {
      v8 = objc_alloc((Class)UIImageView);
      v9 = (UIImageView *)objc_msgSend(v8, "initWithImage:", v19);
      subImageView = v21->_subImageView;
      v21->_subImageView = v9;

      v11 = objc_alloc((Class)UIImageView);
      v12 = (UIImageView *)objc_msgSend(v11, "initWithImage:", v19);
      subIconShadowView = v21->_subIconShadowView;
      v21->_subIconShadowView = v12;

    }
  }
  v15 = v21;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v15;
}

- (void)loadView
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  IconAndSubIconHeaderViewController *v17;
  id v18;
  id v19;
  CGColor *v20;
  id v21;
  UIColor *v22;
  id v23;
  id v24;
  id v25;
  double v26;
  double v27;
  CGRect v28;
  id v29;
  __int128 v30;
  __int128 v31;
  CGRect v32;
  CGSize v33;
  CGRect v34;
  SEL v35;
  IconAndSubIconHeaderViewController *v36;
  CGRect v37;

  v36 = self;
  v35 = a2;
  CGRectMake();
  v34.origin.x = v2;
  v34.origin.y = v3;
  v34.size.width = v4;
  v34.size.height = v5;
  v33 = (CGSize)0;
  if (v36->_subImageView)
  {
    CGSizeMake();
    v33.width = v6;
    v33.height = v7;
  }
  else
  {
    v33 = CGSizeZero;
  }
  CGRectGetMaxY(v34);
  CGRectMake();
  v32.origin.x = v8;
  v32.origin.y = v9;
  v32.size.width = v10;
  v32.size.height = v11;
  v37 = CGRectUnion(v34, v32);
  v30 = *(unint64_t *)&v37.origin.x;
  *(CGFloat *)&v31 = v37.size.width;
  *((_QWORD *)&v31 + 1) = CGRectGetMaxY(v37);
  v29 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v30, v31);
  objc_msgSend(v29, "setSize:", v31);
  objc_msgSend(v29, "setBackgroundColor:", 0);
  objc_msgSend(v29, "addSubview:", v36->_mainImageView);
  -[UIImageView setFrame:](v36->_mainImageView, "setFrame:", *(_OWORD *)&v34.origin, *(_OWORD *)&v34.size);
  if (v36->_subImageView)
  {
    v28 = CGRectOffset(v32, -v34.origin.x, -v34.origin.y);
    objc_msgSend(v29, "addSubview:", v36->_subImageView);
    -[UIImageView setFrame:](v36->_subImageView, "setFrame:", *(_OWORD *)&v32.origin, *(_OWORD *)&v32.size);
    -[UIImageView setSize:](v36->_subIconShadowView, "setSize:", v28.size.width, v28.size.height);
    -[UIImageView addSubview:](v36->_mainImageView, "addSubview:", v36->_subIconShadowView);
    v18 = -[UIImageView layer](v36->_mainImageView, "layer");
    objc_msgSend(v18, "setMasksToBounds:", 1);

    -[UIImageView setFrame:](v36->_subIconShadowView, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    v19 = -[UIImageView layer](v36->_subIconShadowView, "layer");
    objc_msgSend(v19, "setCornerRadius:", 20.0);

    v22 = +[UIColor blackColor](UIColor, "blackColor");
    v20 = -[UIColor CGColor](objc_retainAutorelease(v22), "CGColor");
    v21 = -[UIImageView layer](v36->_subIconShadowView, "layer");
    objc_msgSend(v21, "setShadowColor:", v20);

    v23 = -[UIImageView layer](v36->_subIconShadowView, "layer");
    LODWORD(v12) = 1045220557;
    objc_msgSend(v23, "setShadowOpacity:", v12);

    CGSizeMake();
    v26 = v13;
    v27 = v14;
    v24 = -[UIImageView layer](v36->_subIconShadowView, "layer");
    objc_msgSend(v24, "setShadowOffset:", v26, v27);

    v25 = -[UIImageView layer](v36->_subIconShadowView, "layer");
    objc_msgSend(v25, "setShadowRadius:", 8.0);

  }
  v17 = v36;
  objc_msgSend(v29, "size");
  -[IconAndSubIconHeaderViewController setPreferredContentSize:](v17, "setPreferredContentSize:", v15, v16);
  -[IconAndSubIconHeaderViewController setView:](v36, "setView:", v29);
  objc_storeStrong(&v29, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subIconShadowView, 0);
  objc_storeStrong((id *)&self->_subImageView, 0);
  objc_storeStrong((id *)&self->_mainImageView, 0);
}

@end

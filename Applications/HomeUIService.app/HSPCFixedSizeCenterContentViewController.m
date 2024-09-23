@implementation HSPCFixedSizeCenterContentViewController

- (HSPCFixedSizeCenterContentViewController)initWithCenterContentView:(id)a3
{
  return -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](self, "initWithCenterContentView:size:", a3, 115.0, 115.0);
}

- (HSPCFixedSizeCenterContentViewController)initWithCenterContentView:(id)a3 size:(CGSize)a4
{
  return -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:pinSides:](self, "initWithCenterContentView:size:pinSides:", a3, 0, a4.width, a4.height);
}

- (HSPCFixedSizeCenterContentViewController)initWithCenterContentView:(id)a3 size:(CGSize)a4 pinSides:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  HSPCFixedSizeCenterContentViewController *v11;
  HSPCFixedSizeCenterContentViewController *v12;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HSPCFixedSizeCenterContentViewController;
  v11 = -[HSPCFixedSizeCenterContentViewController init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_centerContentView, a3);
    v12->_contentSize.width = width;
    v12->_contentSize.height = height;
    v12->_pinSides = a5;
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[2];

  v42.receiver = self;
  v42.super_class = (Class)HSPCFixedSizeCenterContentViewController;
  -[HSPCFixedSizeCenterContentViewController viewDidLoad](&v42, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController contentView](self, "contentView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainContentGuide"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController centerContentView](self, "centerContentView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController centerContentView](self, "centerContentView"));
  objc_msgSend(v5, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController contentView](self, "contentView"));
  objc_msgSend(v7, "setClipsToBounds:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
  objc_msgSend(v9, "setClipsToBounds:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController centerContentView](self, "centerContentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
  -[HSPCFixedSizeCenterContentViewController contentSize](self, "contentSize");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", v12));
  v45[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController centerContentView](self, "centerContentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "widthAnchor"));
  -[HSPCFixedSizeCenterContentViewController contentSize](self, "contentSize");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:"));
  v45[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  LODWORD(v11) = -[HSPCFixedSizeCenterContentViewController pinSides](self, "pinSides");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController centerContentView](self, "centerContentView"));
  v40 = v18;
  if ((_DWORD)v11)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
    v39 = v19;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:"));
    v44[0] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController centerContentView](self, "centerContentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "topAnchor"));
    v35 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:"));
    v44[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController centerContentView](self, "centerContentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    v44[2] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController centerContentView](self, "centerContentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    v44[3] = v29;
    v30 = v44;
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerXAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "centerXAnchor"));
    v39 = v31;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:"));
    v43[0] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController centerContentView](self, "centerContentView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerYAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "centerYAnchor"));
    v35 = v32;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:"));
    v43[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController centerContentView](self, "centerContentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", v24, 0.0));
    v43[2] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCFixedSizeCenterContentViewController centerContentView](self, "centerContentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:constant:", v28, 0.0));
    v43[3] = v29;
    v30 = v43;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (UIView)centerContentView
{
  return self->_centerContentView;
}

- (void)setCenterContentView:(id)a3
{
  objc_storeStrong((id *)&self->_centerContentView, a3);
}

- (BOOL)pinSides
{
  return self->_pinSides;
}

- (void)setPinSides:(BOOL)a3
{
  self->_pinSides = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerContentView, 0);
}

@end

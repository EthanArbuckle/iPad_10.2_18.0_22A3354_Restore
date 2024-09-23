@implementation HUPageControlReusableView

- (HUPageControlReusableView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  HUPageControlReusableView *v7;
  uint64_t v8;
  UIPageControl *pageControl;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25[3] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)HUPageControlReusableView;
  v7 = -[HUPageControlReusableView initWithFrame:](&v24, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7E8]), "initWithFrame:", x, y, width, height);
    pageControl = v7->_pageControl;
    v7->_pageControl = (UIPageControl *)v8;

    -[UIPageControl setTranslatesAutoresizingMaskIntoConstraints:](v7->_pageControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUPageControlReusableView addSubview:](v7, "addSubview:", v7->_pageControl);
    -[HUPageControlReusableView pageControl](v7, "pageControl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPageControlReusableView centerXAnchor](v7, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v20;
    -[HUPageControlReusableView pageControl](v7, "pageControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPageControlReusableView topAnchor](v7, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v13;
    -[HUPageControlReusableView pageControl](v7, "pageControl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPageControlReusableView bottomAnchor](v7, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v18);
  }
  return v7;
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
}

@end

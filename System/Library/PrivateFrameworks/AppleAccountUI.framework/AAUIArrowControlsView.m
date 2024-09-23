@implementation AAUIArrowControlsView

+ (double)defaultHeightForOrientation:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  _AAUIImageForButtonDirection(-1, a3 != 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;

  return v5;
}

+ (double)defaultWidthForOrientation:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  _AAUIImageForButtonDirection(1, a3 != 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4 + v4;

  return v5;
}

- (AAUIArrowControlsView)initWithFrame:(CGRect)a3
{
  AAUIArrowControlsView *v3;
  uint64_t v4;
  UIButton *upButton;
  uint64_t v6;
  UIButton *downButton;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AAUIArrowControlsView;
  v3 = -[AAUIArrowControlsView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    upButton = v3->_upButton;
    v3->_upButton = (UIButton *)v4;

    -[UIButton setContentMode:](v3->_upButton, "setContentMode:", 4);
    -[UIButton addTarget:action:forControlEvents:](v3->_upButton, "addTarget:action:forControlEvents:", v3, sel__arrowButtonWasTapped_, 1);
    -[AAUIArrowControlsView addSubview:](v3, "addSubview:", v3->_upButton);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    downButton = v3->_downButton;
    v3->_downButton = (UIButton *)v6;

    -[UIButton setContentMode:](v3->_downButton, "setContentMode:", 4);
    -[UIButton addTarget:action:forControlEvents:](v3->_downButton, "addTarget:action:forControlEvents:", v3, sel__arrowButtonWasTapped_, 1);
    -[AAUIArrowControlsView addSubview:](v3, "addSubview:", v3->_downButton);
    v3->_interfaceOrientation = -1;
    -[AAUIArrowControlsView setInterfaceOrientation:](v3, "setInterfaceOrientation:", 1);
  }
  return v3;
}

- (void)_arrowButtonWasTapped:(id)a3
{
  UIButton *v4;
  UIButton *v5;
  char v6;
  char v7;
  UIButton *v8;

  v4 = (UIButton *)a3;
  v5 = v4;
  if (self->_upButton == v4)
  {
    v8 = v4;
    v7 = objc_opt_respondsToSelector();
    v5 = v8;
    if ((v7 & 1) != 0)
    {
      -[AAUIArrowControlsViewDelegate arrowControlsView:didTapUpButton:](self->_delegate, "arrowControlsView:didTapUpButton:", self, self->_upButton);
      goto LABEL_7;
    }
  }
  else if (self->_downButton == v4)
  {
    v8 = v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v8;
    if ((v6 & 1) != 0)
    {
      -[AAUIArrowControlsViewDelegate arrowControlsView:didTapDownButton:](self->_delegate, "arrowControlsView:didTapDownButton:", self, self->_upButton);
LABEL_7:
      v5 = v8;
    }
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double MaxX;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect v44;

  -[UIButton frame](self->_upButton, "frame");
  v4 = v3;
  v6 = v5;
  -[UIButton imageView](self->_upButton, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9 + 16.0;

  -[UIButton imageView](self->_upButton, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13 + 24.0;

  -[UIButton setFrame:](self->_upButton, "setFrame:", v4, v6, v10, v14);
  -[UIButton frame](self->_downButton, "frame");
  v16 = v15;
  -[UIButton imageView](self->_downButton, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "size");
  v20 = v19 + 16.0;

  -[UIButton imageView](self->_downButton, "imageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "image");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "size");
  v24 = v23 + 24.0;

  -[UIButton frame](self->_upButton, "frame");
  MaxX = CGRectGetMaxX(v44);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "userInterfaceIdiom");

  if ((v27 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v28 = 18.0;
  else
    v28 = 20.0;
  -[UIButton setFrame:](self->_downButton, "setFrame:", MaxX + v28 + -16.0, v16, v20, v24);
  -[AAUIArrowControlsView frame](self, "frame");
  v30 = v29;
  v32 = v31;
  -[UIButton frame](self->_upButton, "frame");
  v34 = v33;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "userInterfaceIdiom");

  if ((v36 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v37 = 18.0;
  else
    v37 = 20.0;
  v38 = v34 + v37;
  -[UIButton frame](self->_downButton, "frame");
  v40 = v38 + v39 + -24.0;
  -[UIButton frame](self->_upButton, "frame");
  v42 = v41;
  -[UIButton frame](self->_downButton, "frame");
  if (v42 >= v43)
    v43 = v42;
  -[AAUIArrowControlsView setFrame:](self, "setFrame:", v30, v32, v40, v43);
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  _BOOL4 v8;
  UIButton *upButton;
  void *v10;
  UIButton *downButton;
  void *v12;

  if (self->_interfaceOrientation != a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v8 = (unint64_t)(a3 - 3) < 2 && (v6 & 0xFFFFFFFFFFFFFFFBLL) != 1;
    upButton = self->_upButton;
    _AAUIImageForButtonDirection(1, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](upButton, "setImage:forState:", v10, 0);

    -[UIButton sizeToFit](self->_upButton, "sizeToFit");
    downButton = self->_downButton;
    _AAUIImageForButtonDirection(-1, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](downButton, "setImage:forState:", v12, 0);

    -[UIButton sizeToFit](self->_downButton, "sizeToFit");
    self->_interfaceOrientation = a3;
  }
  -[AAUIArrowControlsView layoutSubviews](self, "layoutSubviews");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  UIButton *v18;
  UIButton *v19;
  CGPoint v21;
  CGPoint v22;
  CGRect v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  -[UIButton frame](self->_downButton, "frame", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIButton frame](self->_upButton, "frame");
  v15 = v12 + 10.0;
  v23.origin.x = v16 + -10.0;
  v23.size.width = v17 + 10.0;
  v21.x = x;
  v21.y = y;
  if (CGRectContainsPoint(v23, v21))
    v18 = self->_upButton;
  else
    v18 = 0;
  v24.origin.x = v8;
  v24.origin.y = v10;
  v24.size.width = v15;
  v24.size.height = v14;
  v22.x = x;
  v22.y = y;
  if (CGRectContainsPoint(v24, v22))
  {
    v19 = self->_downButton;

    v18 = v19;
  }
  return v18;
}

- (AAUIArrowControlsViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AAUIArrowControlsViewDelegate *)a3;
}

- (UIButton)downButton
{
  return self->_downButton;
}

- (UIButton)upButton
{
  return self->_upButton;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downButton, 0);
  objc_storeStrong((id *)&self->_upButton, 0);
}

@end

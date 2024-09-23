@implementation SUUIInlineFlipContainerView

- (SUUIInlineFlipContainerView)initWithFrontView:(id)a3 backView:(id)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double x;
  double y;
  double width;
  double height;
  SUUIInlineFlipContainerView *v24;
  UIView *v25;
  void *v26;
  double v27;
  float v28;
  double v29;
  float v30;
  UIView *frontView;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "bounds");
  v36.origin.x = v16;
  v36.origin.y = v17;
  v36.size.width = v18;
  v36.size.height = v19;
  v34.origin.x = v9;
  v34.origin.y = v11;
  v34.size.width = v13;
  v34.size.height = v15;
  v35 = CGRectUnion(v34, v36);
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  v33.receiver = self;
  v33.super_class = (Class)SUUIInlineFlipContainerView;
  v24 = -[SUUIInlineFlipContainerView initWithFrame:](&v33, sel_initWithFrame_);
  if (v24)
  {
    v25 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", x, y, width, height);
    objc_msgSend(v6, "backgroundColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    objc_msgSend(v6, "frame");
    v28 = (width - v27) * 0.5;
    v30 = (height - v29) * 0.5;
    objc_msgSend(v6, "setFrame:", floorf(v28), floorf(v30));
    -[UIView addSubview:](v25, "addSubview:", v6);
    -[SUUIInlineFlipContainerView addSubview:](v24, "addSubview:", v25);
    objc_storeStrong((id *)&v24->_backView, a4);
    frontView = v24->_frontView;
    v24->_frontView = v25;

  }
  return v24;
}

- (void)flipToBackViewWithDuration:(double)a3 options:(unint64_t)a4 completionBlock:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  float v18;
  double v19;
  float v20;
  UIView *frontView;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v8 = a5;
  -[SUUIInlineFlipContainerView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v13, v14, v9, v11);
  -[UIView backgroundColor](self->_backView, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

  -[UIView frame](self->_backView, "frame");
  v18 = (v10 - v17) * 0.5;
  v20 = (v12 - v19) * 0.5;
  -[UIView setFrame:](self->_backView, "setFrame:", floorf(v18), floorf(v20));
  objc_msgSend(v15, "addSubview:", self->_backView);
  frontView = self->_frontView;
  v22 = (void *)MEMORY[0x24BEBDB00];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __82__SUUIInlineFlipContainerView_flipToBackViewWithDuration_options_completionBlock___block_invoke;
  v24[3] = &unk_2511F49A8;
  v25 = v8;
  v23 = v8;
  objc_msgSend(v22, "transitionFromView:toView:duration:options:completion:", frontView, v15, a4, v24, a3);

}

uint64_t __82__SUUIInlineFlipContainerView_flipToBackViewWithDuration_options_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontView, 0);
  objc_storeStrong((id *)&self->_backView, 0);
}

@end

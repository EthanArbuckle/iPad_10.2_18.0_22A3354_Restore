@implementation HULayoutContainerView

- (HULayoutContainerView)initWithContentView:(id)a3 layoutBlock:(id)a4
{
  id v7;
  id v8;
  HULayoutContainerView *v9;
  HULayoutContainerView *v10;
  void *v11;
  id layoutBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HULayoutContainerView;
  v9 = -[HULayoutContainerView init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentView, a3);
    if (v7)
    {
      -[HULayoutContainerView bounds](v10, "bounds");
      objc_msgSend(v7, "setFrame:");
      objc_msgSend(v7, "setAutoresizingMask:", 18);
      -[HULayoutContainerView addSubview:](v10, "addSubview:", v7);
    }
    v11 = _Block_copy(v8);
    layoutBlock = v10->_layoutBlock;
    v10->_layoutBlock = v11;

  }
  return v10;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  -[HULayoutContainerView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HULayoutContainerView contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intrinsicContentSize");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HULayoutContainerView;
    -[HULayoutContainerView intrinsicContentSize](&v13, sel_intrinsicContentSize);
    v6 = v9;
    v8 = v10;
  }

  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HULayoutContainerView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HULayoutContainerView contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v14 = a4;
    *(float *)&v15 = a5;
    objc_msgSend(v13, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v14, v15);
    v17 = v16;
    v19 = v18;

    v20 = v17;
    v21 = v19;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)HULayoutContainerView;
    *(float *)&v11 = a4;
    *(float *)&v12 = a5;
    -[HULayoutContainerView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v22, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  }
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)layoutSubviews
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HULayoutContainerView;
  -[HULayoutContainerView layoutSubviews](&v5, sel_layoutSubviews);
  -[HULayoutContainerView layoutBlock](self, "layoutBlock");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HULayoutContainerView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v3)[2](v3, v4);

}

- (UIView)contentView
{
  return self->_contentView;
}

- (id)layoutBlock
{
  return self->_layoutBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutBlock, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

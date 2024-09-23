@implementation HURemoteContextHostingView

- (UIView)contentView
{
  return self->_contentView;
}

- (HURemoteContextHostingView)initWithContentView:(id)a3
{
  id v4;
  HURemoteContextHostingView *v5;
  HURemoteContextHostingView *v6;
  void *v7;
  id v8;
  uint64_t v9;
  UIView *destinationOutContainerView;
  void *v11;
  id v12;
  uint64_t v13;
  UIView *destinationOutView;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  UIView *destinationOverView;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _QWORD v37[3];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)HURemoteContextHostingView;
  v5 = -[HURemoteContextHostingView init](&v36, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HURemoteContextHostingView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupBlending:", 0);

    v8 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[HURemoteContextHostingView bounds](v6, "bounds");
    v9 = objc_msgSend(v8, "initWithFrame:");
    destinationOutContainerView = v6->_destinationOutContainerView;
    v6->_destinationOutContainerView = (UIView *)v9;

    -[UIView layer](v6->_destinationOutContainerView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    -[HURemoteContextHostingView addSubview:](v6, "addSubview:", v6->_destinationOutContainerView);
    v12 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[HURemoteContextHostingView bounds](v6, "bounds");
    v13 = objc_msgSend(v12, "initWithFrame:");
    destinationOutView = v6->_destinationOutView;
    v6->_destinationOutView = (UIView *)v13;

    -[UIView setClipsToBounds:](v6->_destinationOutView, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6->_destinationOutView, "setBackgroundColor:", v15);

    v16 = *MEMORY[0x1E0CD2C50];
    -[UIView layer](v6->_destinationOutView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCompositingFilter:", v16);

    -[UIView addSubview:](v6->_destinationOutContainerView, "addSubview:", v6->_destinationOutView);
    v18 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[HURemoteContextHostingView bounds](v6, "bounds");
    v19 = objc_msgSend(v18, "initWithFrame:");
    destinationOverView = v6->_destinationOverView;
    v6->_destinationOverView = (UIView *)v19;

    v21 = *MEMORY[0x1E0CD2C58];
    -[UIView layer](v6->_destinationOverView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCompositingFilter:", v21);

    -[HURemoteContextHostingView addSubview:](v6, "addSubview:", v6->_destinationOverView);
    -[HURemoteContextHostingView setContentView:](v6, "setContentView:", v4);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[HURemoteContextHostingView destinationOutView](v6, "destinationOutView", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v23;
    -[HURemoteContextHostingView destinationOutContainerView](v6, "destinationOutContainerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v24;
    -[HURemoteContextHostingView destinationOverView](v6, "destinationOverView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v33;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v33 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v30++), "setAutoresizingMask:", 18);
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v28);
    }

  }
  return v6;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 & 0xF;
  -[HURemoteContextHostingView destinationOutView](self, "destinationOutView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", v3);

}

- (UIView)destinationOutView
{
  return self->_destinationOutView;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  void *v7;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  v9 = v5;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[HURemoteContextHostingView destinationOverView](self, "destinationOverView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v9);

    -[HURemoteContextHostingView bounds](self, "bounds");
    -[UIView setFrame:](v9, "setFrame:");
    -[UIView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v8);

  }
}

- (UIView)destinationOverView
{
  return self->_destinationOverView;
}

- (UIView)destinationOutContainerView
{
  return self->_destinationOutContainerView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HURemoteContextHostingView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HURemoteContextHostingView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (unint64_t)maskedCorners
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HURemoteContextHostingView destinationOutView](self, "destinationOutView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maskedCorners") & 0xF;

  return v4;
}

- (double)_cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[HURemoteContextHostingView destinationOutView](self, "destinationOutView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cornerRadius");
  v4 = v3;

  return v4;
}

- (void)_setCornerRadius:(double)a3
{
  id v4;

  -[HURemoteContextHostingView destinationOutView](self, "destinationOutView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setCornerRadius:", a3);

}

- (double)_continuousCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[HURemoteContextHostingView destinationOutView](self, "destinationOutView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_continuousCornerRadius");
  v4 = v3;

  return v4;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  id v4;

  -[HURemoteContextHostingView destinationOutView](self, "destinationOutView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setContinuousCornerRadius:", a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationOverView, 0);
  objc_storeStrong((id *)&self->_destinationOutView, 0);
  objc_storeStrong((id *)&self->_destinationOutContainerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

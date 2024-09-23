@implementation HUQuickControlCollectionViewCellContainerViewController

- (HUQuickControlCollectionViewCellContainerViewController)initWithContentViewController:(id)a3
{
  id v5;
  HUQuickControlCollectionViewCellContainerViewController *v6;
  HUQuickControlCollectionViewCellContainerViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlCollectionViewCellContainerViewController;
  v6 = -[HUQuickControlCollectionViewCellContainerViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentViewController, a3);
    v7->_titlePosition = 0;
  }

  return v7;
}

- (void)loadView
{
  void *v3;
  HUQuickControlCollectionViewCellContainerView *v4;
  unint64_t v5;
  HUQuickControlCollectionViewCellContainerView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;

  -[HUQuickControlCollectionViewCellContainerViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewCellContainerViewController addChildViewController:](self, "addChildViewController:", v3);

  v4 = [HUQuickControlCollectionViewCellContainerView alloc];
  v5 = -[HUQuickControlCollectionViewCellContainerViewController titlePosition](self, "titlePosition");
  v6 = -[HUQuickControlCollectionViewCellContainerView initWithFrame:titlePosition:](v4, "initWithFrame:titlePosition:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HUQuickControlCollectionViewCellContainerViewController setView:](self, "setView:", v6);

  -[HUQuickControlCollectionViewCellContainerViewController contentViewController](self, "contentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewCellContainerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentView:", v8);

  -[HUQuickControlCollectionViewCellContainerViewController title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewCellContainerViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v10);

  -[HUQuickControlCollectionViewCellContainerViewController preferredContentLayoutFrameInset](self, "preferredContentLayoutFrameInset");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[HUQuickControlCollectionViewCellContainerViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPreferredContentLayoutFrameInset:", v13, v15, v17, v19);

  -[HUQuickControlCollectionViewCellContainerViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preferredContentFrameLayoutGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewCellContainerViewController contentViewController](self, "contentViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPreferredFrameLayoutGuide:", v22);

  -[HUQuickControlCollectionViewCellContainerViewController contentViewController](self, "contentViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "didMoveToParentViewController:", self);

  v25 = *MEMORY[0x1E0CEB4B0];
  v26 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v27 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v28 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[HUQuickControlCollectionViewCellContainerViewController contentViewController](self, "contentViewController");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLayoutMargins:", v25, v26, v27, v28);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlCollectionViewCellContainerViewController;
  v4 = a3;
  -[HUQuickControlCollectionViewCellContainerViewController setTitle:](&v6, sel_setTitle_, v4);
  -[HUQuickControlCollectionViewCellContainerViewController viewIfLoaded](self, "viewIfLoaded", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)setTitlePosition:(unint64_t)a3
{
  void *v5;
  id v6;

  self->_titlePosition = a3;
  -[HUQuickControlCollectionViewCellContainerViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitlePosition:", a3);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    -[HUQuickControlCollectionViewCellContainerViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitlePosition:", a3);

  }
}

- (void)setPreferredContentLayoutFrameInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  self->_preferredContentLayoutFrameInset = a3;
  -[HUQuickControlCollectionViewCellContainerViewController viewIfLoaded](self, "viewIfLoaded");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredContentLayoutFrameInset:", top, left, bottom, right);

}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[HUQuickControlCollectionViewCellContainerViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicSizeDescriptorForControlSize:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "intrinsicSizeDescriptorControlSizeDescriptor:titlePosition:", v6, -[HUQuickControlCollectionViewCellContainerViewController titlePosition](self, "titlePosition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)intrinsicSizeDescriptorControlSizeDescriptor:(id)a3 titlePosition:(unint64_t)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = a3;
  objc_msgSend(v5, "intrinsicSize");
  v6 = v5;
  if (v7 != *MEMORY[0x1E0CEBDE0])
  {
    objc_msgSend(v5, "intrinsicSize");
    v9 = v8;
    v11 = v10;
    +[HUQuickControlCollectionViewCellContainerView preferredChromeHeightForTitlePosition:](HUQuickControlCollectionViewCellContainerView, "preferredChromeHeightForTitlePosition:", a4);
    +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", objc_msgSend(v5, "flexType"), v9, v11 + v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUQuickControlCollectionViewCellContainerViewController;
  v4 = a3;
  -[HUQuickControlCollectionViewCellContainerViewController preferredContentSizeDidChangeForChildContentContainer:](&v17, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  -[HUQuickControlCollectionViewCellContainerViewController contentViewController](self, "contentViewController", v17.receiver, v17.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[HUQuickControlCollectionViewCellContainerViewController preferredContentSize](self, "preferredContentSize");
    v8 = v7;
    v10 = v9;
    -[HUQuickControlCollectionViewCellContainerViewController contentViewController](self, "contentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSize");
    v13 = v12;
    v15 = v14;

    if (v8 != v13 || v10 != v15)
    {
      -[HUQuickControlCollectionViewCellContainerViewController contentViewController](self, "contentViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "preferredContentSize");
      -[HUQuickControlCollectionViewCellContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    }
  }
}

- (unint64_t)titlePosition
{
  return self->_titlePosition;
}

- (UIEdgeInsets)preferredContentLayoutFrameInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_preferredContentLayoutFrameInset.top;
  left = self->_preferredContentLayoutFrameInset.left;
  bottom = self->_preferredContentLayoutFrameInset.bottom;
  right = self->_preferredContentLayoutFrameInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (HUQuickControlViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end

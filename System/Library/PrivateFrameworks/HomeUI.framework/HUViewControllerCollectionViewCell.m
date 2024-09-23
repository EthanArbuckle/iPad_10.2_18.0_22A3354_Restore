@implementation HUViewControllerCollectionViewCell

- (void)setViewController:(id)a3
{
  UIViewController *v5;
  void *v6;
  UIViewController *viewController;
  void *v8;
  void *v9;
  UIViewController *v10;

  v5 = (UIViewController *)a3;
  if (self->_viewController != v5)
  {
    v10 = v5;
    -[HUViewControllerCollectionViewCell parentViewController](self, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      viewController = self->_viewController;

      if (viewController)
        -[HUViewControllerCollectionViewCell _removeFromParentViewControllerAndClearProperty:](self, "_removeFromParentViewControllerAndClearProperty:", 0);
    }
    objc_storeStrong((id *)&self->_viewController, a3);
    -[HUViewControllerCollectionViewCell parentViewController](self, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v10;
    if (v10 && v8)
    {
      -[HUViewControllerCollectionViewCell parentViewController](self, "parentViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUViewControllerCollectionViewCell addToParentViewController:](self, "addToParentViewController:", v9);

      v5 = v10;
    }
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  -[HUViewControllerCollectionViewCell setViewController:](self, "setViewController:", 0);
  -[HUViewControllerCollectionViewCell setParentViewController:](self, "setParentViewController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HUViewControllerCollectionViewCell;
  -[HUViewControllerCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  objc_super v45;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (!-[HUViewControllerCollectionViewCell allowSelfSizing](self, "allowSelfSizing"))
  {
    v45.receiver = self;
    v45.super_class = (Class)HUViewControllerCollectionViewCell;
    *(float *)&v10 = a4;
    *(float *)&v11 = a5;
    -[HUViewControllerCollectionViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v45, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
    v30 = v43;
    v32 = v44;
LABEL_6:
    v41 = v30;
    v42 = v32;
    goto LABEL_7;
  }
  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v15, v17, width, v21);

  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutIfNeeded");

  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v15, v17, v19, v21);

  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "preferredContentSize");
  v30 = v29;
  v32 = v31;

  if (*MEMORY[0x1E0C9D820] != v30 || *(double *)(MEMORY[0x1E0C9D820] + 8) != v32)
    goto LABEL_6;
  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v35 = a4;
  *(float *)&v36 = a5;
  objc_msgSend(v34, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v35, v36);
  v38 = v37;
  v40 = v39;

  v41 = v38;
  v42 = v40;
LABEL_7:
  result.height = v42;
  result.width = v41;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[HUViewControllerCollectionViewCell allowSelfSizing](self, "allowSelfSizing"))
  {
    v8.receiver = self;
    v8.super_class = (Class)HUViewControllerCollectionViewCell;
    -[HUViewControllerCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v8, sel_preferredLayoutAttributesFittingAttributes_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (void)addToParentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addChildViewController:", v4);

  if (-[HUViewControllerCollectionViewCell useDefaultCellBackgroundColor](self, "useDefaultCellBackgroundColor"))
    objc_msgSend(MEMORY[0x1E0CEA478], "tableCellGroupedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUViewControllerCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUViewControllerCollectionViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[HUViewControllerCollectionViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAutoresizingMask:", 18);

  -[HUViewControllerCollectionViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "insertSubview:atIndex:", v23, 0);

  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "didMoveToParentViewController:", v25);

  -[HUViewControllerCollectionViewCell setParentViewController:](self, "setParentViewController:", v25);
}

- (void)removeFromParentViewController
{
  -[HUViewControllerCollectionViewCell _removeFromParentViewControllerAndClearProperty:](self, "_removeFromParentViewControllerAndClearProperty:", 1);
}

- (void)_removeFromParentViewControllerAndClearProperty:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willMoveToParentViewController:", 0);

  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromParentViewController");

  if (v3)
    -[HUViewControllerCollectionViewCell setParentViewController:](self, "setParentViewController:", 0);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (BOOL)allowSelfSizing
{
  return self->_allowSelfSizing;
}

- (void)setAllowSelfSizing:(BOOL)a3
{
  self->_allowSelfSizing = a3;
}

- (BOOL)useDefaultCellBackgroundColor
{
  return self->_useDefaultCellBackgroundColor;
}

- (void)setUseDefaultCellBackgroundColor:(BOOL)a3
{
  self->_useDefaultCellBackgroundColor = a3;
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end

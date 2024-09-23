@implementation SUUIIPadChartsColumnView

- (UIViewController)selectedViewController
{
  unint64_t selectedViewControllerIndex;
  void *v4;

  selectedViewControllerIndex = self->_selectedViewControllerIndex;
  if (selectedViewControllerIndex >= -[NSArray count](self->_contentViewControllers, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_contentViewControllers, "objectAtIndex:", self->_selectedViewControllerIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIViewController *)v4;
}

- (void)setContentViewControllers:(id)a3
{
  NSArray *v5;
  void *v6;
  void *v7;
  NSArray *v8;

  v5 = (NSArray *)a3;
  if (self->_contentViewControllers != v5)
  {
    v8 = v5;
    -[SUUIIPadChartsColumnView selectedViewController](self, "selectedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isViewLoaded"))
    {
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

    }
    objc_storeStrong((id *)&self->_contentViewControllers, a3);
    self->_selectedViewControllerIndex = 0;
    -[SUUIIPadChartsColumnView _addSelectedViewController](self, "_addSelectedViewController");

    v5 = v8;
  }

}

- (void)setSelectedViewControllerIndex:(int64_t)a3
{
  void *v5;
  id v6;

  if (self->_selectedViewControllerIndex != a3)
  {
    -[SUUIIPadChartsColumnView selectedViewController](self, "selectedViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isViewLoaded"))
    {
      objc_msgSend(v6, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

    }
    self->_selectedViewControllerIndex = a3;
    -[SUUIIPadChartsColumnView _addSelectedViewController](self, "_addSelectedViewController");

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIIPadChartsColumnView;
  -[SUUIIPadChartsColumnView layoutSubviews](&v5, sel_layoutSubviews);
  -[SUUIIPadChartsColumnView selectedViewController](self, "selectedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIIPadChartsColumnView bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)_addSelectedViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIEdgeInsets *p_contentInset;
  double left;
  double top;
  double bottom;
  double right;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  -[SUUIIPadChartsColumnView selectedViewController](self, "selectedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v21 = v3;
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIIPadChartsColumnView addSubview:](self, "addSubview:", v4);

    objc_msgSend(v21, "contentScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      p_contentInset = &self->_contentInset;
      top = p_contentInset->top;
      left = p_contentInset->left;
      bottom = p_contentInset->bottom;
      right = p_contentInset->right;
      objc_msgSend(v5, "contentOffset");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v6, "scrollIndicatorInsets");
      v17 = v16;
      v19 = v18;
      v20 = top + 44.0;
      if (v15 == 0.0)
        v15 = v15 - (p_contentInset->top + 44.0);
      objc_msgSend(v6, "setContentInset:", v20, left, bottom, right);
      objc_msgSend(v6, "setContentOffset:", v13, v15);
      objc_msgSend(v6, "setScrollIndicatorInsets:", v20, v17, bottom, v19);
    }

    v3 = v21;
  }

}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (NSArray)contentViewControllers
{
  return self->_contentViewControllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewControllers, 0);
}

@end

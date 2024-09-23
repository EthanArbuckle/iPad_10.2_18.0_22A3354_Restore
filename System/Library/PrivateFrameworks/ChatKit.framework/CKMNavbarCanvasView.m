@implementation CKMNavbarCanvasView

- (CKMNavbarCanvasView)init
{
  CKMNavbarCanvasView *v2;
  CKMNavbarCanvasView *v3;
  UISearchBar *searchBarView;
  UIButton *composeButtonView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMNavbarCanvasView;
  v2 = -[CKMNavbarCanvasView init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    searchBarView = v2->_searchBarView;
    v2->_searchBarView = 0;

    composeButtonView = v3->_composeButtonView;
    v3->_composeButtonView = 0;

  }
  return v3;
}

- (CKMNavbarCanvasView)initWithFrame:(CGRect)a3
{
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  objc_super v11;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "marzNavigationBarHeight");
  v9 = v8;

  v11.receiver = self;
  v11.super_class = (Class)CKMNavbarCanvasView;
  return -[CKMNavbarCanvasView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, v9);
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMNavbarCanvasView;
  -[CKMNavbarCanvasView layoutSubviews](&v5, sel_layoutSubviews);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useMacToolbar");

  if (v4)
    -[CKMNavbarCanvasView _layoutForDisplayBelowToolbar](self, "_layoutForDisplayBelowToolbar");
  else
    -[CKMNavbarCanvasView _layoutForDisplayInNavbar](self, "_layoutForDisplayInNavbar");
}

- (void)_layoutForDisplayBelowToolbar
{
  UISearchBar *searchBarView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  id v40;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "useMacToolbar"))
  {
    searchBarView = self->_searchBarView;

    if (!searchBarView)
      return;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchNavbarCanvasInsets");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[CKMNavbarCanvasView bounds](self, "bounds");
    v14 = v13;
    v39 = v8 + v15;
    v17 = v6 + v16;
    v18 = v13 - (v8 + v12);
    v20 = v19 - (v6 + v10);
    -[CKMNavbarCanvasView composeButtonView](self, "composeButtonView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;
    v25 = v24;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "minConversationListWidthComposeButtonSize");
    v28 = v27;
    v30 = v29;

    if (-[CKMNavbarCanvasView shouldLayoutForCollapsedWidth](self, "shouldLayoutForCollapsedWidth"))
      v23 = v14 * 0.5 - v28 * 0.5;
    -[CKMNavbarCanvasView searchBarView](self, "searchBarView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setHidden:", -[CKMNavbarCanvasView shouldLayoutForCollapsedWidth](self, "shouldLayoutForCollapsedWidth"));

    -[CKMNavbarCanvasView composeButtonView](self, "composeButtonView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHidden:", -[CKMNavbarCanvasView shouldLayoutForCollapsedWidth](self, "shouldLayoutForCollapsedWidth") ^ 1);

    -[CKMNavbarCanvasView composeButtonView](self, "composeButtonView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFrame:", v23, v25, v28, v30);

    -[CKMNavbarCanvasView composeButtonView](self, "composeButtonView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMNavbarCanvasView composeButtonView](self, "composeButtonView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "center");
    v37 = v36;
    -[CKMNavbarCanvasView searchBarView](self, "searchBarView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "center");
    objc_msgSend(v34, "setCenter:", v37);

    -[CKMNavbarCanvasView searchBarView](self, "searchBarView");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFrame:", v39, v17, v18, v20);
  }

}

- (void)_layoutForDisplayInNavbar
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;

  if (self->_searchBarView && self->_composeButtonView)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchNavbarCanvasInsets");
    v49 = v4;
    v50 = v5;
    v51 = v6;
    v8 = v7;

    -[CKMNavbarCanvasView frame](self, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "marzNavigationBarHeight");
    v17 = v16;

    -[CKMNavbarCanvasView setFrame:](self, "setFrame:", v10, v12, v14, v17);
    -[CKMNavbarCanvasView bounds](self, "bounds");
    v19 = v18;
    v21 = v20;
    -[CKMNavbarCanvasView searchBarView](self, "searchBarView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v24 = v23;
    v52 = v25;
    v27 = v26;
    v55 = v28;

    -[CKMNavbarCanvasView composeButtonView](self, "composeButtonView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    v53 = v31;
    v54 = v30;
    v33 = v32;

    -[CKMNavbarCanvasView bounds](self, "bounds");
    v35 = v34;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "snapToMinConversationListWidth");
    v38 = v37;

    if (v35 >= v38)
    {
      -[UISearchBar sizeToFit](self->_searchBarView, "sizeToFit");
      v55 = v21 - v8 - v49;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "spaceBetweenSearchBarAndComposeButton");
      v42 = v41;

      v24 = v51;
      v27 = v19 - (v33 + v50 + v42);
      v39 = v42 + v51 + v27;
    }
    else
    {
      v39 = v19 * 0.5 - v33 * 0.5;
    }
    -[CKMNavbarCanvasView searchBarView](self, "searchBarView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setHidden:", v35 < v38);

    if (CKMainScreenScale_once_23 != -1)
      dispatch_once(&CKMainScreenScale_once_23, &__block_literal_global_54);
    -[CKMNavbarCanvasView searchBarView](self, "searchBarView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFrame:", v24, v52, v27, v55);

    -[CKMNavbarCanvasView searchBarView](self, "searchBarView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMNavbarCanvasView searchBarView](self, "searchBarView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "center");
    objc_msgSend(v45, "setCenter:");

    -[CKMNavbarCanvasView composeButtonView](self, "composeButtonView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFrame:", v39, v54, v33, v53);

    -[CKMNavbarCanvasView composeButtonView](self, "composeButtonView");
    v56 = (id)objc_claimAutoreleasedReturnValue();
    -[CKMNavbarCanvasView composeButtonView](self, "composeButtonView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "center");
    objc_msgSend(v56, "setCenter:");

  }
}

- (void)setSearchBarView:(id)a3
{
  UISearchBar *v5;
  UISearchBar **p_searchBarView;
  UISearchBar *v7;

  v5 = (UISearchBar *)a3;
  p_searchBarView = &self->_searchBarView;
  if (self->_searchBarView != v5)
  {
    v7 = v5;
    -[UISearchBar setAutoresizingMask:](v5, "setAutoresizingMask:", 0);
    -[UISearchBar removeFromSuperview](*p_searchBarView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_searchBarView, a3);
    v5 = v7;
    if (v7)
    {
      -[UISearchBar sizeToFit](*p_searchBarView, "sizeToFit");
      -[CKMNavbarCanvasView addSubview:](self, "addSubview:", *p_searchBarView);
      v5 = v7;
    }
  }

}

- (void)setComposeButtonView:(id)a3
{
  UIButton *v5;
  UIButton **p_composeButtonView;
  UIButton *v7;

  v5 = (UIButton *)a3;
  p_composeButtonView = &self->_composeButtonView;
  if (self->_composeButtonView != v5)
  {
    v7 = v5;
    -[UIButton setAutoresizingMask:](v5, "setAutoresizingMask:", 0);
    -[UIButton removeFromSuperview](*p_composeButtonView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_composeButtonView, a3);
    v5 = v7;
    if (v7)
    {
      -[UIButton sizeToFit](*p_composeButtonView, "sizeToFit");
      -[UIButton setBounds:](*p_composeButtonView, "setBounds:", 0.0, 0.0, 34.0, 21.0);
      -[CKMNavbarCanvasView addSubview:](self, "addSubview:", *p_composeButtonView);
      v5 = v7;
    }
  }

}

- (void)clearAllItemViews
{
  UISearchBar *searchBarView;
  UIButton *composeButtonView;

  searchBarView = self->_searchBarView;
  self->_searchBarView = 0;

  composeButtonView = self->_composeButtonView;
  self->_composeButtonView = 0;

}

- (UISearchBar)searchBarView
{
  return self->_searchBarView;
}

- (UIButton)composeButtonView
{
  return self->_composeButtonView;
}

- (BOOL)shouldLayoutForCollapsedWidth
{
  return self->_shouldLayoutForCollapsedWidth;
}

- (void)setShouldLayoutForCollapsedWidth:(BOOL)a3
{
  self->_shouldLayoutForCollapsedWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeButtonView, 0);
  objc_storeStrong((id *)&self->_searchBarView, 0);
}

@end

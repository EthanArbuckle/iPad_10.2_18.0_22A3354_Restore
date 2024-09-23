@implementation NUArticleBarButtonItemManager

- (NUArticleBarButtonItemManager)initWithViewController:(id)a3
{
  id v4;
  NUArticleBarButtonItemManager *v5;
  NUArticleBarButtonItemManager *v6;
  NUArticleNextButton *v7;
  uint64_t v8;
  NUArticleNextButton *nextButton;
  uint64_t v10;
  UIBarButtonItem *nextBarButtonItem;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NUArticleBarButtonItemManager;
  v5 = -[NUArticleBarButtonItemManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewController, v4);
    v7 = [NUArticleNextButton alloc];
    v8 = -[NUArticleNextButton initWithFrame:](v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    nextButton = v6->_nextButton;
    v6->_nextButton = (NUArticleNextButton *)v8;

    -[NUArticleNextButton setAutoresizingMask:](v6->_nextButton, "setAutoresizingMask:", 18);
    -[NUArticleNextButton addTarget:action:forControlEvents:](v6->_nextButton, "addTarget:action:forControlEvents:", v6, sel_doNext_, 64);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v6->_nextButton);
    nextBarButtonItem = v6->_nextBarButtonItem;
    v6->_nextBarButtonItem = (UIBarButtonItem *)v10;

  }
  return v6;
}

- (void)sizeBarButtonItemsForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v4 = a3;
  -[NUArticleBarButtonItemManager viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

  -[NUArticleBarButtonItemManager viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIfNeeded");

  -[NUArticleBarButtonItemManager adjustedFrameForNextArticleButtonForTraitCollection:](self, "adjustedFrameForNextArticleButtonForTraitCollection:", v4);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[NUArticleBarButtonItemManager nextButton](self, "nextButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[NUArticleBarButtonItemManager adjustedFrameForDoneBarButtonItemForTraitCollection:](self, "adjustedFrameForDoneBarButtonItemForTraitCollection:", v4);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[NUArticleBarButtonItemManager doneBarButtonItem](self, "doneBarButtonItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "nu_view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v21, v23, v25, v27);

  -[NUArticleBarButtonItemManager adjustedFrameForShareBarButtonItemForTraitCollection:](self, "adjustedFrameForShareBarButtonItemForTraitCollection:", v4);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  -[NUArticleBarButtonItemManager shareBarButtonItem](self, "shareBarButtonItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "nu_view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v31, v33, v35, v37);

  -[NUArticleBarButtonItemManager viewController](self, "viewController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "navigationController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setNeedsLayout");

  -[NUArticleBarButtonItemManager viewController](self, "viewController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "navigationController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layoutIfNeeded");

  -[NUArticleBarButtonItemManager nextButton](self, "nextButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setNeedsLayout");

  -[NUArticleBarButtonItemManager nextButton](self, "nextButton");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "layoutIfNeeded");

}

- (void)positionBarButtonItemsForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[3];
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NUArticleBarButtonItemManager doneBarButtonItem](self, "doneBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nu_view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[NUArticleBarButtonItemManager shareBarButtonItem](self, "shareBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nu_view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[NUArticleBarButtonItemManager createShareBarButtonItem](self, "createShareBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleBarButtonItemManager setShareBarButtonItem:](self, "setShareBarButtonItem:", v9);

  -[NUArticleBarButtonItemManager createDoneBarButtonItem](self, "createDoneBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleBarButtonItemManager setDoneBarButtonItem:](self, "setDoneBarButtonItem:", v10);

  v11 = objc_msgSend(v4, "horizontalSizeClass");
  -[NUArticleBarButtonItemManager viewController](self, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 == 1)
  {
    objc_msgSend(v12, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleBarButtonItemManager doneBarButtonItem](self, "doneBarButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItems:", v16);

    -[NUArticleBarButtonItemManager viewController](self, "viewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLeftBarButtonItems:", MEMORY[0x24BDBD1A8]);

    -[NUArticleBarButtonItemManager viewController](self, "viewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleBarButtonItemManager shareBarButtonItem](self, "shareBarButtonItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v20;
    -[NUArticleBarButtonItemManager createFlexibleSpacerBarButtonItem](self, "createFlexibleSpacerBarButtonItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v21;
    -[NUArticleBarButtonItemManager nextBarButtonItem](self, "nextBarButtonItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setToolbarItems:", v23);

    -[NUArticleBarButtonItemManager viewController](self, "viewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "navigationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setToolbarHidden:", 0);
  }
  else
  {
    objc_msgSend(v12, "navigationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setToolbarHidden:", 1);

    -[NUArticleBarButtonItemManager viewController](self, "viewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setToolbarItems:", MEMORY[0x24BDBD1A8]);

    -[NUArticleBarButtonItemManager viewController](self, "viewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "navigationItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleBarButtonItemManager doneBarButtonItem](self, "doneBarButtonItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v30;
    -[NUArticleBarButtonItemManager shareBarButtonItem](self, "shareBarButtonItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setLeftBarButtonItems:", v32);

    -[NUArticleBarButtonItemManager viewController](self, "viewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleBarButtonItemManager nextBarButtonItem](self, "nextBarButtonItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRightBarButtonItems:", v34);

  }
  -[NUArticleBarButtonItemManager doneBarButtonItem](self, "doneBarButtonItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "nu_view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "nu_supportViewDebugging");

  -[NUArticleBarButtonItemManager shareBarButtonItem](self, "shareBarButtonItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "nu_view");
  v38 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v38, "nu_supportViewDebugging");

  -[NUArticleBarButtonItemManager delegate](self, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v38) = objc_opt_respondsToSelector();

  if ((v38 & 1) != 0)
  {
    -[NUArticleBarButtonItemManager delegate](self, "delegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "articleBarButtonItemManagerDidLayoutBarButtonItems:", self);

  }
}

- (void)applyPageStyleToNextBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NUArticleBarButtonItemManager nextButton](self, "nextButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setNextLabelTitle:animated:", v5, 1);
}

- (void)doShare:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[NUArticleBarButtonItemManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NUArticleBarButtonItemManager delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NUArticleBarButtonItemManager shareBarButtonItem](self, "shareBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "articleBarButtonItemManager:performShareActionForBarButtonItem:", self, v6);

  }
}

- (void)doDone:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[NUArticleBarButtonItemManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NUArticleBarButtonItemManager delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NUArticleBarButtonItemManager doneBarButtonItem](self, "doneBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "articleBarButtonItemManager:performDoneActionForBarButtonItem:", self, v6);

  }
}

- (void)doNext:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[NUArticleBarButtonItemManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NUArticleBarButtonItemManager delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NUArticleBarButtonItemManager nextBarButtonItem](self, "nextBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "articleBarButtonItemManager:performNextActionForBarButtonItem:", self, v6);

  }
}

- (id)createShareBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 9, self, sel_doShare_);
}

- (id)createDoneBarButtonItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  NUBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_24D5A3F98, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 2, self, sel_doDone_);

  return v6;
}

- (id)createFlexibleSpacerBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
}

- (CGRect)adjustedFrameForDoneBarButtonItemForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double MaxX;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  v4 = a3;
  -[NUArticleBarButtonItemManager viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[NUArticleBarButtonItemManager doneBarButtonItem](self, "doneBarButtonItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "nu_view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = objc_msgSend(v4, "horizontalSizeClass");
  v25 = 16.0;
  if (v24 == 1)
  {
    v33.origin.x = v9;
    v33.origin.y = v11;
    v33.size.width = v13;
    v33.size.height = v15;
    MaxX = CGRectGetMaxX(v33);
    -[NUArticleBarButtonItemManager doneBarButtonItem](self, "doneBarButtonItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "nu_view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    v25 = MaxX - CGRectGetWidth(v34) + -16.0;

  }
  v29 = v25;
  v30 = v19;
  v31 = v21;
  v32 = v23;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)adjustedFrameForShareBarButtonItemForTraitCollection:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  if (objc_msgSend(a3, "horizontalSizeClass") == 1)
  {
    -[NUArticleBarButtonItemManager shareBarButtonItem](self, "shareBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nu_view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    objc_opt_class();
    -[NUArticleBarButtonItemManager shareBarButtonItem](self, "shareBarButtonItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nu_view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    FCDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NUArticleBarButtonItemManager shareBarButtonItem](self, "shareBarButtonItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nu_view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v9 = v18;
    v11 = v19;
    v13 = v20;

    -[NUArticleBarButtonItemManager doneBarButtonItem](self, "doneBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nu_view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v22 = CGRectGetMaxX(v28) + 16.0;
    objc_msgSend(v4, "imageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v7 = v22 - CGRectGetMinX(v29);

  }
  v24 = v7;
  v25 = v9;
  v26 = v11;
  v27 = v13;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)adjustedFrameForNextArticleButtonForTraitCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double MaxX;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  if (objc_msgSend(a3, "horizontalSizeClass") == 1)
  {
    -[NUArticleBarButtonItemManager shareBarButtonItem](self, "shareBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nu_view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NUArticleBarButtonItemManager shareBarButtonItem](self, "shareBarButtonItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nu_view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "frame");
      MaxX = CGRectGetMaxX(v24);

    }
    else
    {
      MaxX = 0.0;
    }

    -[NUArticleBarButtonItemManager viewController](self, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "toolbar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NUArticleBarButtonItemManager viewController](self, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    MaxX = CGRectGetMaxX(v25);

    -[NUArticleBarButtonItemManager viewController](self, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  objc_msgSend(v14, "bounds");
  v17 = v16;
  v19 = v18;

  v20 = MaxX + 30.0;
  v21 = v17 - MaxX + -30.0 + -12.0;
  v22 = 0.0;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v21;
  result.origin.y = v22;
  result.origin.x = v20;
  return result;
}

- (NUArticleBarButtonItemManagerDelegate)delegate
{
  return (NUArticleBarButtonItemManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (NUArticleNextButton)nextButton
{
  return self->_nextButton;
}

- (UIBarButtonItem)shareBarButtonItem
{
  return self->_shareBarButtonItem;
}

- (void)setShareBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_shareBarButtonItem, a3);
}

- (UIBarButtonItem)doneBarButtonItem
{
  return self->_doneBarButtonItem;
}

- (void)setDoneBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneBarButtonItem, a3);
}

- (UIBarButtonItem)nextBarButtonItem
{
  return self->_nextBarButtonItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

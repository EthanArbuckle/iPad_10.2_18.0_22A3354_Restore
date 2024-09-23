@implementation HUQuickControlButtonRowView

- (void)setPreferredContentAlignment:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  if (self->_preferredContentAlignment != a3)
  {
    self->_preferredContentAlignment = a3;
    -[HUQuickControlButtonRowView buttonViews](self, "buttonViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 == 1)
      -[HUQuickControlButtonRowView _clearButtonConstraints](self, "_clearButtonConstraints");
  }
}

- (HUQuickControlButtonRowView)initWithButtonViews:(id)a3
{
  id v4;
  HUQuickControlButtonRowView *v5;
  HUQuickControlButtonRowView *v6;
  UIScrollView *v7;
  UIScrollView *scrollView;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlButtonRowView;
  v5 = -[HUQuickControlButtonRowView init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_preferredContentAlignment = 3;
    v7 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0CEA970]);
    scrollView = v6->_scrollView;
    v6->_scrollView = v7;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v6->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView setAlwaysBounceHorizontal:](v6->_scrollView, "setAlwaysBounceHorizontal:", 1);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v6->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v6->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setDelaysContentTouches:](v6->_scrollView, "setDelaysContentTouches:", 1);
    -[HUQuickControlButtonRowView addSubview:](v6, "addSubview:", v6->_scrollView);
    v9 = (void *)objc_opt_new();
    -[HUQuickControlButtonRowView setMutableButtonViews:](v6, "setMutableButtonViews:", v9);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          -[HUQuickControlButtonRowView addButtonView:](v6, "addButtonView:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++), (_QWORD)v17);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v6;
}

- (void)addButtonView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUQuickControlButtonRowView mutableButtonViews](self, "mutableButtonViews");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlButtonRowView insertButtonView:atIndex:](self, "insertButtonView:atIndex:", v4, objc_msgSend(v5, "count"));

}

- (void)insertButtonView:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HUQuickControlButtonRowView mutableButtonViews](self, "mutableButtonViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v6, a4);

  -[HUQuickControlButtonRowView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v6);

  -[HUQuickControlButtonRowView _clearButtonConstraints](self, "_clearButtonConstraints");
}

- (void)removeButtonView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "removeFromSuperview");
  -[HUQuickControlButtonRowView mutableButtonViews](self, "mutableButtonViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[HUQuickControlButtonRowView _clearButtonConstraints](self, "_clearButtonConstraints");
}

- (void)updateConstraints
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  uint64_t v22;
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
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[4];
  id v42;
  HUQuickControlButtonRowView *v43;
  _QWORD v44[5];
  id v45;
  SEL v46;

  v4 = (void *)objc_opt_new();
  -[HUQuickControlButtonRowView scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlButtonRowView topAnchor](self, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  -[HUQuickControlButtonRowView scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlButtonRowView bottomAnchor](self, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  -[HUQuickControlButtonRowView scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlButtonRowView leadingAnchor](self, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

  -[HUQuickControlButtonRowView scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlButtonRowView trailingAnchor](self, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v20);

  -[HUQuickControlButtonRowView buttonViews](self, "buttonViews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  -[HUQuickControlButtonRowView buttonViews](self, "buttonViews");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22 == 1)
  {
    objc_msgSend(v23, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlButtonRowView widthAnchor](self, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v28);

    objc_msgSend(v25, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlButtonRowView topAnchor](self, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v31);

    objc_msgSend(v25, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlButtonRowView bottomAnchor](self, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v34);

    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __48__HUQuickControlButtonRowView_updateConstraints__block_invoke;
    v44[3] = &unk_1E6F57F78;
    v44[4] = self;
    v45 = v25;
    v46 = a2;
    v35 = v25;
    __48__HUQuickControlButtonRowView_updateConstraints__block_invoke((uint64_t)v44);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v36);

  }
  else
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __48__HUQuickControlButtonRowView_updateConstraints__block_invoke_2;
    v41[3] = &unk_1E6F57FA0;
    v42 = v4;
    v43 = self;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v41);

    v35 = v42;
  }

  -[HUQuickControlButtonRowView scrollView](self, "scrollView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "heightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToConstant:", 30.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v39);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
  -[HUQuickControlButtonRowView setButtonConstraints:](self, "setButtonConstraints:", v4);
  v40.receiver = self;
  v40.super_class = (Class)HUQuickControlButtonRowView;
  -[HUQuickControlButtonRowView updateConstraints](&v40, sel_updateConstraints);

}

id __48__HUQuickControlButtonRowView_updateConstraints__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "preferredContentAlignment");
  if (v2 == 4)
  {
    objc_msgSend(*(id *)(a1 + 40), "trailingAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "trailingAnchor");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v2 == 3)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "centerXAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "centerXAnchor");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v2 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "preferredContentAlignment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("HUQuickControlButtonRowView.m"), 116, CFSTR("Unsupported alignment %@"), v8);

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 40), "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leadingAnchor");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v9 = (void *)v4;
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __48__HUQuickControlButtonRowView_updateConstraints__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  id v30;

  v5 = a2;
  v30 = v5;
  if (!a3)
  {
    v19 = *(void **)(a1 + 32);
    objc_msgSend(v5, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v16, 16.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v17);
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "buttonViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") - 1;

  objc_msgSend(*(id *)(a1 + 40), "buttonViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3 - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v30, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:constant:", v12, 16.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  if (v7 == a3)
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v30, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:constant:", v17, -16.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

LABEL_5:
  }

  v20 = *(void **)(a1 + 32);
  objc_msgSend(v30, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v24);

  v25 = *(void **)(a1 + 32);
  objc_msgSend(v30, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "scrollView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v29);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  HUQuickControlButtonRowView *v6;
  void *v7;
  _QWORD v9[7];

  y = a3.y;
  x = a3.x;
  v6 = self;
  -[HUQuickControlButtonRowView buttonViews](self, "buttonViews", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HUQuickControlButtonRowView_pointInside_withEvent___block_invoke;
  v9[3] = &unk_1E6F57FC8;
  v9[4] = v6;
  *(CGFloat *)&v9[5] = x;
  *(CGFloat *)&v9[6] = y;
  LOBYTE(v6) = objc_msgSend(v7, "na_any:", v9);

  return (char)v6;
}

uint64_t __53__HUQuickControlButtonRowView_pointInside_withEvent___block_invoke(double *a1, void *a2)
{
  void *v2;
  double v3;
  double v4;
  id v5;
  uint64_t v6;

  v2 = (void *)*((_QWORD *)a1 + 4);
  v3 = a1[5];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v2, "convertPoint:toView:", v5, v3, v4);
  v6 = objc_msgSend(v5, "pointInside:withEvent:", 0);

  return v6;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlButtonRowView;
  -[HUQuickControlButtonRowView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[HUQuickControlButtonRowView _updateLayoutIfNecessary](self, "_updateLayoutIfNecessary");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlButtonRowView;
  -[HUQuickControlButtonRowView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[HUQuickControlButtonRowView _updateLayoutIfNecessary](self, "_updateLayoutIfNecessary");
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (BOOL)hasCenteredContent
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;

  -[HUQuickControlButtonRowView buttonViews](self, "buttonViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
    return -[HUQuickControlButtonRowView preferredContentAlignment](self, "preferredContentAlignment") == 3;
  -[HUQuickControlButtonRowView buttonViews](self, "buttonViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v6, "count") > 2;

  return v5;
}

- (void)_clearButtonConstraints
{
  void *v3;
  void *v4;
  void *v5;

  -[HUQuickControlButtonRowView buttonConstraints](self, "buttonConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUQuickControlButtonRowView buttonConstraints](self, "buttonConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[HUQuickControlButtonRowView setButtonConstraints:](self, "setButtonConstraints:", 0);
  }
  -[HUQuickControlButtonRowView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (int64_t)preferredContentAlignment
{
  return self->_preferredContentAlignment;
}

- (NSMutableArray)mutableButtonViews
{
  return self->_mutableButtonViews;
}

- (void)setMutableButtonViews:(id)a3
{
  objc_storeStrong((id *)&self->_mutableButtonViews, a3);
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConstraints, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_mutableButtonViews, 0);
}

@end

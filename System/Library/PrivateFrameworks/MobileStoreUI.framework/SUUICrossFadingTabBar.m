@implementation SUUICrossFadingTabBar

- (SUUICrossFadingTabBar)initWithFrame:(CGRect)a3
{
  SUUICrossFadingTabBar *v3;
  SUUICrossFadingTabBar *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  SUUIScrollingTabBarBackgroundView *v9;
  SUUIScrollingTabBarBackgroundView *backgroundView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUICrossFadingTabBar;
  v3 = -[SUUICrossFadingTabBar initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUICrossFadingTabBar bounds](v3, "bounds");
    v9 = -[SUUIScrollingTabBarBackgroundView initWithFrame:]([SUUIScrollingTabBarBackgroundView alloc], "initWithFrame:", v5, v6, v7, v8);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v9;

    -[SUUIScrollingTabBarBackgroundView setShowsBackdrop:](v4->_backgroundView, "setShowsBackdrop:", 1);
    -[SUUIScrollingTabBarBackgroundView setShowsTopHairline:](v4->_backgroundView, "setShowsTopHairline:", 1);
    -[SUUICrossFadingTabBar addSubview:](v4, "addSubview:", v4->_backgroundView);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *tabBarButtons;
  _QWORD v16[12];
  BOOL v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)SUUICrossFadingTabBar;
  -[SUUICrossFadingTabBar layoutSubviews](&v18, sel_layoutSubviews);
  -[SUUICrossFadingTabBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUIScrollingTabBarBackgroundView setFrame:](self->_backgroundView, "setFrame:");
  v11 = -[NSArray count](self->_tabBarButtons, "count");
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  CGRectGetWidth(v19);
  UICeilToViewScale();
  v13 = v12;
  v14 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[SUUICrossFadingTabBar semanticContentAttribute](self, "semanticContentAttribute"));
  tabBarButtons = self->_tabBarButtons;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __39__SUUICrossFadingTabBar_layoutSubviews__block_invoke;
  v16[3] = &__block_descriptor_97_e44_v32__0__SUUICrossFadingTabBarButton_8Q16_B24l;
  v17 = v14 == 0;
  v16[4] = v11;
  v16[5] = 0x4000000000000000;
  v16[6] = v13;
  v16[7] = 0x4010000000000000;
  *(CGFloat *)&v16[8] = v4;
  *(CGFloat *)&v16[9] = v6;
  *(CGFloat *)&v16[10] = v8;
  *(CGFloat *)&v16[11] = v10;
  -[NSArray enumerateObjectsUsingBlock:](tabBarButtons, "enumerateObjectsUsingBlock:", v16);
}

void __39__SUUICrossFadingTabBar_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double MaxY;
  id v13;
  CGRect v14;
  CGRect v15;

  v4 = *(double *)(MEMORY[0x24BDBF090] + 24);
  if (!*(_BYTE *)(a1 + 96))
    a3 = *(_QWORD *)(a1 + 32) + ~a3;
  v5 = *(double *)(a1 + 64);
  v6 = *(double *)(a1 + 40) + (*(double *)(a1 + 48) + *(double *)(a1 + 56)) * (double)a3;
  v7 = *(double *)(a1 + 72);
  v8 = *(double *)(a1 + 80);
  v9 = *(double *)(a1 + 88);
  v13 = a2;
  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v8;
  v14.size.height = v9;
  v10 = CGRectGetMinY(v14) + -1.0;
  v11 = *(double *)(a1 + 48);
  MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 64));
  v15.origin.x = v6;
  v15.origin.y = v10;
  v15.size.width = v11;
  v15.size.height = v4;
  objc_msgSend(v13, "setFrame:", v6, v10, v11, MaxY - CGRectGetMinY(v15));

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUICrossFadingTabBar;
  v4 = a3;
  -[SUUICrossFadingTabBar traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[SUUICrossFadingTabBar traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;

  if (vabdd_f64(v7, v9) > 0.00000011920929)
    -[SUUICrossFadingTabBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTabBarButtons:(id)a3
{
  NSArray *v4;
  NSArray *tabBarButtons;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  SUUICrossFadingTabBar *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)a3;
  tabBarButtons = self->_tabBarButtons;
  if (tabBarButtons != v4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = tabBarButtons;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (!-[NSArray containsObject:](v4, "containsObject:", v11))
            objc_msgSend(v11, "removeFromSuperview");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v8);
    }

    v12 = (NSArray *)-[NSArray copy](v4, "copy");
    v13 = self->_tabBarButtons;
    self->_tabBarButtons = v12;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = self->_tabBarButtons;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
          objc_msgSend(v19, "superview", (_QWORD)v21);
          v20 = (SUUICrossFadingTabBar *)objc_claimAutoreleasedReturnValue();

          if (v20 != self)
            -[SUUICrossFadingTabBar addSubview:](self, "addSubview:", v19);
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v16);
    }

    -[SUUICrossFadingTabBar setNeedsLayout](self, "setNeedsLayout");
  }

}

- (SUUIScrollingTabBarBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (NSArray)tabBarButtons
{
  return self->_tabBarButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarButtons, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end

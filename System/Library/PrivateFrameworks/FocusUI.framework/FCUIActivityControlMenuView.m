@implementation FCUIActivityControlMenuView

- (FCUIActivityControlMenuView)initWithFrame:(CGRect)a3
{
  FCUIActivityControlMenuView *v3;
  UIGestureRecognizer *v4;
  UIGestureRecognizer *pressGestureRecognizer;
  UIGestureRecognizer *v6;
  id v7;
  void *v8;
  uint64_t v9;
  UISelectionFeedbackGenerator *feedbackGenerator;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FCUIActivityControlMenuView;
  v3 = -[FCUIActivityControlMenuView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", v3, sel__handlePressGesture_);
    -[UIGestureRecognizer setDelegate:](v4, "setDelegate:", v3);
    -[UIGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v4, "setDelaysTouchesEnded:", 0);
    -[UIGestureRecognizer setMinimumPressDuration:](v4, "setMinimumPressDuration:", 0.0);
    -[UIGestureRecognizer _setKeepTouchesOnContinuation:](v4, "_setKeepTouchesOnContinuation:", 1);
    pressGestureRecognizer = v3->_pressGestureRecognizer;
    v3->_pressGestureRecognizer = v4;
    v6 = v4;

    -[FCUIActivityControlMenuView addGestureRecognizer:](v3, "addGestureRecognizer:", v6);
    v7 = objc_alloc(MEMORY[0x24BEBD940]);
    objc_msgSend(MEMORY[0x24BEBDD18], "lightConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithConfiguration:view:", v8, v3);
    feedbackGenerator = v3->_feedbackGenerator;
    v3->_feedbackGenerator = (UISelectionFeedbackGenerator *)v9;

  }
  return v3;
}

- (NSArray)menuItemActions
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_menuItemViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "defaultAction", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_newMenuItemView
{
  FCUIActivityControlMenuItemView *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(FCUIActivityControlMenuItemView);
  -[FCUIActivityControlMenuItemView setAdjustsFontForContentSizeCategory:](v3, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
  -[FCUIActivityControlMenuItemView setAlpha:](v3, "setAlpha:", 0.0);
  -[FCUIActivityControlMenuView addSubview:](self, "addSubview:", v3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[FCUIActivityControlMenuItemView requiredVisualStyleCategories](v3, "requiredVisualStyleCategories", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCUIActivityControlMenuItemView setVisualStylingProvider:forCategory:](v3, "setVisualStylingProvider:forCategory:", v10, objc_msgSend(v9, "integerValue"));

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)setMenuItemActions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  FCUIActivityControlMenuView *v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *outgoingMenuItemViews;
  NSMutableArray *v28;
  NSMutableArray *v29;
  id obj;
  uint64_t v31;
  FCUIActivityControlMenuView *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v6 = objc_msgSend(v4, "count");
  v7 = v5;
  v8 = self;
  v33 = (id)objc_msgSend(v7, "initWithCapacity:", v6);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v4;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v34)
  {
    v31 = *(_QWORD *)v45;
    v32 = self;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(obj);
        v35 = v9;
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v9);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v11 = v8->_menuItemViews;
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v41;
          while (2)
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v41 != v14)
                objc_enumerationMutation(v11);
              v16 = *(NSArray **)(*((_QWORD *)&v40 + 1) + 8 * v15);
              objc_msgSend(v10, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray defaultAction](v16, "defaultAction");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = BSEqualStrings();

              if ((v20 & 1) != 0)
              {
                v8 = v32;
                goto LABEL_16;
              }
              ++v15;
            }
            while (v13 != v15);
            v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
            if (v13)
              continue;
            break;
          }
        }

        v8 = v32;
        v16 = -[FCUIActivityControlMenuView _newMenuItemView](v32, "_newMenuItemView");
        v11 = v16;
LABEL_16:
        -[NSArray setDefaultAction:](v16, "setDefaultAction:", v10);
        objc_msgSend(v33, "addObject:", v16);

        v9 = v35 + 1;
      }
      while (v35 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v34);
  }

  v21 = (void *)-[NSArray mutableCopy](v8->_menuItemViews, "mutableCopy");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = v33;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v21, "removeObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v26++));
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v24);
  }

  objc_storeStrong((id *)&v8->_menuItemViews, v33);
  outgoingMenuItemViews = v8->_outgoingMenuItemViews;
  if (!outgoingMenuItemViews)
  {
    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v29 = v8->_outgoingMenuItemViews;
    v8->_outgoingMenuItemViews = v28;

    outgoingMenuItemViews = v8->_outgoingMenuItemViews;
  }
  -[NSMutableArray addObjectsFromArray:](outgoingMenuItemViews, "addObjectsFromArray:", v21);
  -[FCUIActivityControlMenuView setNeedsLayout](v8, "setNeedsLayout");

}

- (NSArray)menuItemElements
{
  return self->_menuItemViews;
}

- (NSString)menuAlternativeDescription
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_menuItemViews, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternativeDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setMenuAlternativeDescription:(id)a3
{
  NSArray *menuItemViews;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  menuItemViews = self->_menuItemViews;
  v5 = a3;
  -[NSArray firstObject](menuItemViews, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alternativeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[NSArray firstObject](self->_menuItemViews, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = -[FCUIActivityControlMenuView _newMenuItemView](self, "_newMenuItemView");
  }
  v9 = v8;

  objc_msgSend(v9, "setAlternativeDescription:", v5);
  -[NSArray firstObject](self->_menuItemViews, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v9)
  {
    -[FCUIActivityControlMenuView setMenuItemActions:](self, "setMenuItemActions:", 0);
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_menuItemViews;
    self->_menuItemViews = v11;

  }
  -[FCUIActivityControlMenuView setNeedsLayout](self, "setNeedsLayout");

}

- (UIAction)footerAction
{
  return -[_FCUIActivityControlMenuFooterView footerAction](self->_footerView, "footerAction");
}

- (void)setFooterAction:(id)a3
{
  void *v4;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  -[FCUIActivityControlMenuView footerAction](self, "footerAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    v6 = v7;
    if (v7)
    {
      -[FCUIActivityControlMenuView _configureFooterViewIfNecessary](self, "_configureFooterViewIfNecessary");
      v6 = v7;
    }
    -[_FCUIActivityControlMenuFooterView setFooterAction:](self->_footerView, "setFooterAction:", v6);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDBF148];
  v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_menuItemViews;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "sizeThatFits:", width, height, (_QWORD)v18);
        if (v6 < v13)
          v6 = v13;
        v7 = v7 + v14;
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  -[FCUIActivityControlMenuView _configureFooterViewIfNecessary](self, "_configureFooterViewIfNecessary");
  -[_FCUIActivityControlMenuFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
  v16 = v7 + v15;
  v17 = v6;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)layoutSubviews
{
  double width;
  double height;
  CGFloat v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  CGFloat v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id *p_purgeableMenuItemViews;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  NSMutableArray *outgoingMenuItemViews;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v47 = *MEMORY[0x24BDAC8D0];
  v44.receiver = self;
  v44.super_class = (Class)FCUIActivityControlMenuView;
  -[FCUIActivityControlMenuView layoutSubviews](&v44, sel_layoutSubviews);
  -[FCUIActivityControlMenuView bounds](self, "bounds");
  width = v48.size.width;
  height = v48.size.height;
  v5 = CGRectGetWidth(v48);
  v6 = -[NSArray count](self->_menuItemViews, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = v6 - 1;
    v10 = 0.0;
    v11 = MEMORY[0x24BDAC760];
    v12 = 0.0;
    v13 = 0.0;
    do
    {
      -[NSArray objectAtIndex:](self->_menuItemViews, "objectAtIndex:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sizeThatFits:", width, height);
      BSRectWithSize();
      v49.size.width = v5;
      v49.origin.x = v10;
      v49.origin.y = v12;
      v49.size.height = v13;
      CGRectGetMaxY(v49);
      UIRectIntegralWithScale();
      v10 = v15;
      v12 = v16;
      v5 = v17;
      v13 = v18;
      objc_msgSend(v14, "setFrame:");
      objc_msgSend(v14, "setSeparatorVisible:", v8 < v9);
      v19 = (void *)MEMORY[0x24BEBDB00];
      v42[0] = v11;
      v42[1] = 3221225472;
      v42[2] = __45__FCUIActivityControlMenuView_layoutSubviews__block_invoke;
      v42[3] = &unk_24D20A9C0;
      v43 = v14;
      v20 = v14;
      objc_msgSend(v19, "performWithoutAnimation:", v42);
      objc_msgSend(v20, "setAlpha:", 1.0);

      ++v8;
    }
    while (v7 != v8);
  }
  else
  {
    v13 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = self->_outgoingMenuItemViews;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "setAlpha:", 0.0);
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v23);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  p_purgeableMenuItemViews = (id *)&self->_purgeableMenuItemViews;
  v27 = self->_purgeableMenuItemViews;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "removeFromSuperview");
      }
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    }
    while (v29);
  }

  objc_storeStrong((id *)&self->_purgeableMenuItemViews, self->_outgoingMenuItemViews);
  outgoingMenuItemViews = self->_outgoingMenuItemViews;
  self->_outgoingMenuItemViews = 0;

  if (!objc_msgSend(*p_purgeableMenuItemViews, "count"))
  {
    v33 = *p_purgeableMenuItemViews;
    *p_purgeableMenuItemViews = 0;

  }
  -[_FCUIActivityControlMenuFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
  BSRectWithSize();
  v50.origin.x = v10;
  v50.origin.y = v12;
  v50.size.width = v5;
  v50.size.height = v13;
  CGRectGetMaxY(v50);
  UIRectIntegralWithScale();
  -[_FCUIActivityControlMenuFooterView setFrame:](self->_footerView, "setFrame:");
}

uint64_t __45__FCUIActivityControlMenuView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (double)_continuousCornerRadius
{
  double result;

  -[_FCUIActivityControlMenuFooterView _continuousCornerRadius](self->_footerView, "_continuousCornerRadius");
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[_FCUIActivityControlMenuFooterView _setContinuousCornerRadius:](self->_footerView, "_setContinuousCornerRadius:", a3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  char v4;
  id v5;
  char isKindOfClass;

  if (self->_pressGestureRecognizer == a3)
  {
    v5 = a4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v4 = isKindOfClass ^ 1;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (NSArray)requiredVisualStyleCategories
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", &unk_24D218FB0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_menuItemViews, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_menuItemViews;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "requiredVisualStyleCategories", (_QWORD)v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v9);

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }
  }
  else
  {
    v4 = objc_alloc_init(FCUIActivityControlMenuItemView);
    -[NSArray requiredVisualStyleCategories](v4, "requiredVisualStyleCategories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  -[FCUIActivityControlMenuView _configureFooterViewIfNecessary](self, "_configureFooterViewIfNecessary");
  -[_FCUIActivityControlMenuFooterView requiredVisualStyleCategories](self->_footerView, "requiredVisualStyleCategories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  objc_msgSend(v3, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  NSMutableDictionary *categoriesToVisualStylingProviders;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[FCUIActivityControlMenuView requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProviders, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = self->_categoriesToVisualStylingProviders;
    if (!v12)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v14 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = v13;

      v12 = self->_categoriesToVisualStylingProviders;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v16, v15);

    -[FCUIActivityControlMenuView _visualStylingProvider:didChangeForCategory:outgoingProvider:](self, "_visualStylingProvider:didChangeForCategory:outgoingProvider:", v16, a4, v11);
  }

}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_menuItemViews;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[_FCUIActivityControlMenuFooterView setAdjustsFontForContentSizeCategory:](self->_footerView, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
    -[FCUIActivityControlMenuView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[FCUIActivityControlMenuView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_menuItemViews;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v4);
          v7 |= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "adjustForContentSizeCategoryChange", (_QWORD)v11);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    else
    {
      LOBYTE(v7) = 0;
    }

    if (-[_FCUIActivityControlMenuFooterView adjustForContentSizeCategoryChange](self->_footerView, "adjustForContentSizeCategoryChange")|| (v7 & 1) != 0)
    {
      -[FCUIActivityControlMenuView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v11);
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_configureFooterViewIfNecessary
{
  _FCUIActivityControlMenuFooterView *v3;
  _FCUIActivityControlMenuFooterView *v4;
  _FCUIActivityControlMenuFooterView *footerView;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _FCUIActivityControlMenuFooterView *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!self->_footerView)
  {
    v3 = [_FCUIActivityControlMenuFooterView alloc];
    -[FCUIActivityControlMenuView bounds](self, "bounds");
    v4 = -[_FCUIActivityControlMenuFooterView initWithFrame:](v3, "initWithFrame:");
    footerView = self->_footerView;
    self->_footerView = v4;

    -[_FCUIActivityControlMenuFooterView setAdjustsFontForContentSizeCategory:](self->_footerView, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
    -[FCUIActivityControlMenuView addSubview:](self, "addSubview:", self->_footerView);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[_FCUIActivityControlMenuFooterView requiredVisualStyleCategories](self->_footerView, "requiredVisualStyleCategories", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = self->_footerView;
          -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_FCUIActivityControlMenuFooterView setVisualStylingProvider:forCategory:](v12, "setVisualStylingProvider:forCategory:", v13, objc_msgSend(v11, "integerValue"));

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  id v9;
  id v10;

  if (a3)
  {
    v9 = a5;
    v10 = a3;
    objc_msgSend(a6, "stopAutomaticallyUpdatingView:", v10);
    objc_msgSend(v9, "automaticallyUpdateView:withStyle:", v10, a4);

  }
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  FCUIActivityControlMenuView *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  v19 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v18->_menuItemViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "requiredVisualStyleCategories", v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "containsObject:", v13);

        if (v14)
          objc_msgSend(v11, "setVisualStylingProvider:forCategory:", v19, a4);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  -[_FCUIActivityControlMenuFooterView requiredVisualStyleCategories](v18->_footerView, "requiredVisualStyleCategories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "containsObject:", v16);

  if (v17)
    -[_FCUIActivityControlMenuFooterView setVisualStylingProvider:forCategory:](v18->_footerView, "setVisualStylingProvider:forCategory:", v19, a4);

}

- (BOOL)_toggleHighlightForMenuElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSArray arrayByAddingObject:](self->_menuItemViews, "arrayByAddingObject:", self->_footerView);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isHighlighted") != (v11 == v4))
        {
          objc_msgSend(v11, "setHighlighted:", v11 == v4);
          v8 = (v11 == v4) ^ objc_msgSend(v11, "isHighlighted") ^ 1;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (void)_handlePressGesture:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "locationInView:", self);
  -[FCUIActivityControlMenuView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  v6 = 0;
  if ((v5 & 1) != 0)
  {
    if (objc_msgSend(v4, "isMenuElement"))
      v6 = v4;
    else
      v6 = 0;
  }
  v7 = v6;
  if (-[FCUIActivityControlMenuView _toggleHighlightForMenuElement:](self, "_toggleHighlightForMenuElement:", v7))
    -[UISelectionFeedbackGenerator selectionChanged](self->_feedbackGenerator, "selectionChanged");
  if (v7 && objc_msgSend(v8, "state") == 3)
  {
    objc_msgSend(v7, "setHighlighted:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "setSelected:", objc_msgSend(v7, "isSelected") ^ 1);
    objc_msgSend(v7, "performAction");
  }

}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (UIGestureRecognizer)pressGestureRecognizer
{
  return self->_pressGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_purgeableMenuItemViews, 0);
  objc_storeStrong((id *)&self->_outgoingMenuItemViews, 0);
  objc_storeStrong((id *)&self->_menuItemViews, 0);
}

@end

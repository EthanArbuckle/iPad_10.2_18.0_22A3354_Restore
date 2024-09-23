@implementation HUIconListView

- (HUIconListView)init
{
  HUIconListView *v2;
  uint64_t v3;
  NSArray *iconDescriptors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUIconListView;
  v2 = -[HUIconListView init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    iconDescriptors = v2->_iconDescriptors;
    v2->_iconDescriptors = (NSArray *)v3;

  }
  return v2;
}

- (void)setIconDescriptors:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSArray isEqual:](self->_iconDescriptors, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_iconDescriptors, a3);
    -[HUIconListView _setUpIcons](self, "_setUpIcons");
  }

}

- (void)_setUpIcons
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HUIconListView _prepareIconArray](self, "_prepareIconArray");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[HUIconListView iconDescriptors](self, "iconDescriptors", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[HUIconListView _addIconWithDescriptor:](self, "_addIconWithDescriptor:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[HUIconListView setNeedsLayout](self, "setNeedsLayout");
  -[HUIconListView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUIconListView;
  -[HUIconListView layoutSubviews](&v3, sel_layoutSubviews);
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[HUIconListView semanticContentAttribute](self, "semanticContentAttribute")) == 1)-[HUIconListView _layoutRightToLeft](self, "_layoutRightToLeft");
  else
    -[HUIconListView _layoutLeftToRight](self, "_layoutLeftToRight");
}

- (void)_layoutLeftToRight
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGPoint v22;
  CGRect v23;

  v21 = *MEMORY[0x1E0C80C00];
  -[HUIconListView frame](self, "frame");
  v4 = v3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HUIconListView iconViews](self, "iconViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "intrinsicContentSize");
        v13 = v12;
        v15 = round(v14);
        -[HUIconListView bounds](self, "bounds");
        v22.x = v9 + v15;
        v22.y = 0.0;
        if (CGRectContainsPoint(v23, v22))
          objc_msgSend(v11, "setFrame:", v9, floor((v4 - v13) * 0.5), v15, v13);
        else
          objc_msgSend(v11, "removeFromSuperview");
        v9 = v9 + v15 + 12.0;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (void)_layoutRightToLeft
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGPoint v23;
  CGRect v24;

  v22 = *MEMORY[0x1E0C80C00];
  -[HUIconListView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HUIconListView iconViews](self, "iconViews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "intrinsicContentSize");
        v14 = v13;
        v16 = round(v15);
        -[HUIconListView bounds](self, "bounds");
        v23.y = 0.0;
        v23.x = v4 - v16;
        if (CGRectContainsPoint(v24, v23))
          objc_msgSend(v12, "setFrame:", v4 - v16, floor((v6 - v14) * 0.5), v16, v14);
        else
          objc_msgSend(v12, "removeFromSuperview");
        v4 = v4 - (v16 + 12.0);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)_addIconNamed:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0D31460];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithImageIdentifier:", v5);

  -[HUIconListView _addIconWithDescriptor:](self, "_addIconWithDescriptor:", v6);
}

- (void)_addIconWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  HUTriggerIconView *v6;

  v4 = a3;
  v6 = -[HUTriggerIconView initWithIconDescriptor:]([HUTriggerIconView alloc], "initWithIconDescriptor:", v4);

  -[HUTriggerIconView setContentMode:](v6, "setContentMode:", 1);
  -[HUIconListView iconViews](self, "iconViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  -[HUIconListView addSubview:](self, "addSubview:", v6);
}

- (void)_prepareIconArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HUIconListView iconViews](self, "iconViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[HUIconListView iconViews](self, "iconViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "removeFromSuperview");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    -[HUIconListView iconViews](self, "iconViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllObjects");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[HUIconListView setIconViews:](self, "setIconViews:");

  }
}

- (NSArray)iconDescriptors
{
  return self->_iconDescriptors;
}

- (NSMutableArray)iconViews
{
  return self->_iconViews;
}

- (void)setIconViews:(id)a3
{
  objc_storeStrong((id *)&self->_iconViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViews, 0);
  objc_storeStrong((id *)&self->_iconDescriptors, 0);
}

@end

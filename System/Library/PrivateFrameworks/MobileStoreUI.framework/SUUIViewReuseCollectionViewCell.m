@implementation SUUIViewReuseCollectionViewCell

- (SUUIViewReuseCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIViewReuseCollectionViewCell *v3;
  SUUIViewReusePool *v4;
  SUUIViewReusePool *viewPool;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIViewReuseCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[SUUIViewReusePool initWithParentView:]([SUUIViewReusePool alloc], "initWithParentView:", v3);
    viewPool = v3->_viewPool;
    v3->_viewPool = v4;

  }
  return v3;
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_allExistingViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)SUUIViewReuseCollectionViewCell;
  -[SUUIViewReuseCollectionViewCell dealloc](&v9, sel_dealloc);
}

- (void)enumerateExistingViewsForReuseIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t, char *);
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t, char *))a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_allExistingViews;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        SUUIReuseIdentifierForView(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 && objc_msgSend(v6, "isEqualToString:", v15))
        {
          v16 = 0;
          v7[2](v7, v14, v11, &v16);
          if (v16)
          {

            goto LABEL_14;
          }
          ++v11;
        }

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_14:

}

- (id)existingViewForIndex:(int64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_allExistingViews, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_allExistingViews, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)existingViewsForReuseIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_allExistingViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        SUUIReuseIdentifierForView(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && objc_msgSend(v4, "isEqualToString:", v12, (_QWORD)v14))
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)modifyUsingBlock:(id)a3
{
  void (**v4)(id, SUUIViewModification *);
  NSArray *allExistingViews;
  SUUIViewModification *v6;
  void *v7;
  void *v8;
  NSMapTable *v9;
  NSMapTable *allViewTextProperties;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, SUUIViewModification *))a3;
  if (self->_allExistingViews)
  {
    -[SUUIViewReusePool recycleReusableViews:](self->_viewPool, "recycleReusableViews:");
    allExistingViews = self->_allExistingViews;
    self->_allExistingViews = 0;

  }
  v6 = -[SUUIViewModification initWithViewReusePool:]([SUUIViewModification alloc], "initWithViewReusePool:", self->_viewPool);
  v4[2](v4, v6);
  -[SUUIViewReuseCollectionViewCell backgroundColor](self, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseCollectionViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewModification allViewTextProperties](v6, "allViewTextProperties");
  v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  allViewTextProperties = self->_allViewTextProperties;
  self->_allViewTextProperties = v9;

  -[SUUIViewModification views](v6, "views");
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v12 = self->_allExistingViews;
  self->_allExistingViews = v11;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_allExistingViews;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v18, "setBackgroundColor:", v7);
        objc_msgSend(v8, "addSubview:", v18);
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  -[SUUIViewReusePool hideUnusedViews](self->_viewPool, "hideUnusedViews");
  -[SUUIViewReuseCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)registerClass:(Class)a3 forViewWithReuseIdentifier:(id)a4
{
  -[SUUIViewReusePool registerClass:forViewWithReuseIdentifier:](self->_viewPool, "registerClass:forViewWithReuseIdentifier:", a3, a4);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIViewReuseCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)textPropertiesForView:(id)a3
{
  return -[NSMapTable objectForKey:](self->_allViewTextProperties, "objectForKey:", a3);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_allExistingViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "setBackgroundColor:", v5);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)SUUIViewReuseCollectionViewCell;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v11, sel_applyLayoutAttributes_, v4);

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_allExistingViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setBackgroundColor:", v4);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SUUIViewReuseCollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v10, sel_setBackgroundColor_, v4);

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

- (NSArray)allExistingViews
{
  return self->_allExistingViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allExistingViews, 0);
  objc_storeStrong((id *)&self->_viewPool, 0);
  objc_storeStrong((id *)&self->_allViewTextProperties, 0);
}

@end

@implementation SUUIViewReuseView

- (SUUIViewReuseView)initWithFrame:(CGRect)a3
{
  SUUIViewReuseView *v3;
  SUUIViewReusePool *v4;
  SUUIViewReusePool *viewReusePool;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIViewReuseView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[SUUIViewReusePool initWithParentView:]([SUUIViewReusePool alloc], "initWithParentView:", v3);
    viewReusePool = v3->_viewReusePool;
    v3->_viewReusePool = v4;

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
  v9.super_class = (Class)SUUIViewReuseView;
  -[SUUIViewReuseView dealloc](&v9, sel_dealloc);
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

- (void)modifyUsingBlock:(id)a3
{
  void (**v4)(id, SUUIViewModification *);
  NSArray *allExistingViews;
  SUUIViewModification *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, SUUIViewModification *))a3;
  if (self->_allExistingViews)
  {
    -[SUUIViewReusePool recycleReusableViews:](self->_viewReusePool, "recycleReusableViews:");
    allExistingViews = self->_allExistingViews;
    self->_allExistingViews = 0;

  }
  v6 = -[SUUIViewModification initWithViewReusePool:]([SUUIViewModification alloc], "initWithViewReusePool:", self->_viewReusePool);
  v4[2](v4, v6);
  -[SUUIViewReuseView backgroundColor](self, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewModification views](v6, "views");
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v9 = self->_allExistingViews;
  self->_allExistingViews = v8;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_allExistingViews;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v15, "setBackgroundColor:", v7, (_QWORD)v16);
        -[SUUIViewReuseView addSubview:](self, "addSubview:", v15);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  -[SUUIViewReusePool hideUnusedViews](self->_viewReusePool, "hideUnusedViews");
  -[SUUIViewReuseView setNeedsLayout](self, "setNeedsLayout");

}

- (void)registerClass:(Class)a3 forViewWithReuseIdentifier:(id)a4
{
  -[SUUIViewReusePool registerClass:forViewWithReuseIdentifier:](self->_viewReusePool, "registerClass:forViewWithReuseIdentifier:", a3, a4);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0.0;
  v19 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  v5 = v4;
  if (objc_msgSend(v4, "getHue:saturation:brightness:alpha:", &v19, &v18, &v17, &v16))
  {
    v5 = v4;
    if (v16 < 1.0)
    {
      v5 = v4;
      if (v19 != 0.0)
      {
        v5 = v4;
        if (v18 != 0.0)
        {
          v5 = v4;
          if (v17 != 0.0)
          {
            objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor", v17);
            v5 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
      }
    }
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_allExistingViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setBackgroundColor:", v5);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)SUUIViewReuseView;
  -[SUUIViewReuseView setBackgroundColor:](&v11, sel_setBackgroundColor_, v4);

}

- (NSArray)allExistingViews
{
  return self->_allExistingViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allExistingViews, 0);
  objc_storeStrong((id *)&self->_viewReusePool, 0);
}

@end

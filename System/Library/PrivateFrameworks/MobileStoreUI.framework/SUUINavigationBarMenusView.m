@implementation SUUINavigationBarMenusView

+ (void)requestLayoutWithMenus:(id)a3 width:(int64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "titleItem", (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_attributedStringWithMenuItem:context:", v16, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "requestLayoutForViewElement:attributedString:width:", v16, v17, a4);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

}

- (void)reloadWithMenus:(id)a3 width:(int64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  NSArray *v10;
  NSArray *menuViewElements;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SUUINavigationBarMenusView *v17;
  int64_t v18;

  v8 = a3;
  v9 = a5;
  v10 = (NSArray *)objc_msgSend(v8, "copy");
  menuViewElements = self->_menuViewElements;
  self->_menuViewElements = v10;

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__SUUINavigationBarMenusView_reloadWithMenus_width_context___block_invoke;
  v14[3] = &unk_2511F4AC8;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = a4;
  v12 = v9;
  v13 = v8;
  -[SUUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v14);

}

void __60__SUUINavigationBarMenusView_reloadWithMenus_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "titleItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addMenuButtonWithTitleItem:width:context:", v8, *(_QWORD *)(a1 + 40), (double)*(uint64_t *)(a1 + 56));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 440));
        objc_msgSend(v9, "addTarget:action:forControlEvents:", WeakRetained, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 432), 64);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)setButtonTarget:(id)a3 action:(SEL)a4
{
  self->_buttonAction = a4;
  objc_storeWeak(&self->_buttonTarget, a3);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUINavigationBarMenusView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets *p_contentInset;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  float v32;
  double v33;
  void *v34;
  double v35;
  double left;
  id v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  double v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  double v45;
  double v46;
  CGFloat v47;
  float v48;
  double v49;
  double v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;
  CGRect v63;

  v62 = *MEMORY[0x24BDAC8D0];
  -[SUUINavigationBarMenusView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  p_contentInset = &self->_contentInset;
  v8 = self->_contentInset.left + self->_contentInset.right;
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v57;
    v13 = *MEMORY[0x24BDBF090];
    v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v57 != v12)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v17, "sizeThatFits:", v4, v6);
        v19 = v18;
        v21 = v20;
        objc_msgSend(v17, "setFrame:", v13, v14, v18, v20);
        objc_msgSend(v17, "setHidden:", 0);
        if (v15 < v21)
          v15 = v21;
        v8 = v8 + v19;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v11);
  }
  else
  {
    v15 = 0.0;
  }
  v22 = objc_msgSend(v9, "count");
  if (v22 < 2)
  {
    v26 = 40.0;
  }
  else
  {
    v23 = v22;
    v24 = v22 - 1;
    v25 = (double)(v22 - 1);
    v26 = 40.0;
    v8 = v8 + v25 * 40.0;
    if (v8 > v4)
    {
      v26 = 40.0;
      do
      {
        v26 = v26 + -1.0;
        v8 = v8 - v25;
      }
      while (v26 > 20.0 && v8 > v4);
      if (v8 > v4)
      {
        objc_msgSend(v9, "sortedArrayWithOptions:usingComparator:", 0, &__block_literal_global_43);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 1;
        do
        {
          objc_msgSend(v28, "objectAtIndex:", v29 - 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "frame");
          v32 = v31 * 0.2;
          v33 = floorf(v32);
          objc_msgSend(v30, "setFrame:");
          v8 = v8 - v33;

          if (v29 >= v23)
            break;
          ++v29;
        }
        while (v8 > v4);

      }
    }
    while (v8 > v4)
    {
      objc_msgSend(v9, "objectAtIndex:", v24);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setHidden:", 1);
      objc_msgSend(v34, "frame");
      v8 = v8 - (v26 + v35);

      if (v24 < 2)
        break;
      --v24;
    }
  }
  left = p_contentInset->left;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v37 = v9;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v38)
  {
    v39 = v38;
    v40 = (v4 - v8) * 0.5;
    v41 = floorf(v40);
    if (left < v41)
      left = v41;
    v42 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v53 != v42)
          objc_enumerationMutation(v37);
        v44 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        objc_msgSend(v44, "frame", (_QWORD)v52);
        v47 = v46;
        v48 = (v15 - v46) * 0.5;
        v49 = floorf(v48);
        v50 = p_contentInset->top + v49;
        if (v45 >= v4)
          v51 = v4;
        else
          v51 = v45;
        objc_msgSend(v44, "setFrame:", left, p_contentInset->top + v49, v51);
        v63.origin.x = left;
        v63.origin.y = v50;
        v63.size.width = v51;
        v63.size.height = v47;
        left = v26 + CGRectGetMaxX(v63);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v39);
  }

}

uint64_t __44__SUUINavigationBarMenusView_layoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "frame");
  v6 = v5;
  objc_msgSend(v4, "frame");
  v8 = v7;

  if (v6 <= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v6 < v8)
    return 1;
  else
    return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double top;
  double left;
  double right;
  double bottom;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDBF148];
  v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "sizeThatFits:", width, height);
        if (v7 < v14)
          v7 = v14;
        v6 = v6 + v13;
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    v6 = v6 + (float)((float)(unint64_t)(objc_msgSend(v8, "count") - 1) * 40.0);
  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;

  v19 = v7 + top + bottom;
  v20 = v6 + left + right;
  result.height = v19;
  result.width = v20;
  return result;
}

+ (id)_attributedStringWithMenuItem:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "itemText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuViewElements, 0);
  objc_destroyWeak(&self->_buttonTarget);
}

@end

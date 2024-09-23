@implementation SUUIImageGridView

- (void)setColumnCount:(int64_t)a3
{
  if (self->_columnCount != a3)
  {
    self->_columnCount = a3;
    -[SUUIImageGridView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIImageGridView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImageViews:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_imageViews, "isEqualToArray:", v5))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_imageViews;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "removeFromSuperview");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v8);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          -[SUUIImageGridView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

    objc_storeStrong((id *)&self->_imageViews, a3);
    -[SUUIImageGridView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSize:(CGSize)a3
{
  if (self->_size.width != a3.width || self->_size.height != a3.height)
  {
    self->_size = a3;
    -[SUUIImageGridView setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIImageGridViewReuseView prefetchResourcesForViewElement:reason:context:](SUUIImageGridViewReuseView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[SUUIImageGridViewReuseView preferredSizeForViewElement:context:](SUUIImageGridViewReuseView, "preferredSizeForViewElement:context:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUIImageGridViewReuseView requestLayoutForViewElement:width:context:](SUUIImageGridViewReuseView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUIImageGridViewReuseView sizeThatFitsWidth:viewElement:context:](SUUIImageGridViewReuseView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  SUUIImageGridViewReuseView *reuseView;
  SUUIImageGridViewReuseView *v10;
  SUUIImageGridViewReuseView *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  reuseView = self->_reuseView;
  if (!reuseView)
  {
    v10 = objc_alloc_init(SUUIImageGridViewReuseView);
    v11 = self->_reuseView;
    self->_reuseView = v10;

    reuseView = self->_reuseView;
  }
  -[SUUIImageGridViewReuseView reloadWithViewElement:width:context:](reuseView, "reloadWithViewElement:width:context:", v13, v8, a4);
  -[SUUIImageGridView setColumnCount:](self, "setColumnCount:", objc_msgSend(v13, "columnCount"));
  objc_msgSend(v13, "contentInset");
  -[SUUIImageGridView setContentInset:](self, "setContentInset:");
  -[SUUIImageGridViewReuseView imageViews](self->_reuseView, "imageViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIImageGridView setImageViews:](self, "setImageViews:", v12);

  objc_msgSend(v13, "size");
  -[SUUIImageGridView setSize:](self, "setSize:");

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SUUIImageGridViewReuseView setImage:forArtworkRequest:context:](self->_reuseView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SUUIImageGridViewReuseView updateWithItemState:context:animated:](self->_reuseView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SUUIImageGridViewReuseView viewForElementIdentifier:](self->_reuseView, "viewForElementIdentifier:", a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4;
  size_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double height;
  double width;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  double v22;
  double v23;
  BOOL v24;
  uint64_t j;
  double *v26;
  double v27;
  double v28;
  double v29;
  SUUIImageGridView *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGSize result;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = -[SUUIImageGridView columnCount](self, "columnCount", a3.width, a3.height);
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  -[SUUIImageGridView imageViews](self, "imageViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") / v5;

  -[SUUIImageGridView imageViews](self, "imageViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") % v5;

  if (v9)
    v10 = v7 + 1;
  else
    v10 = v7;
  v11 = malloc_type_calloc(v5, 8uLL, 0x100004000313F17uLL);
  v12 = malloc_type_calloc(v10, 8uLL, 0x100004000313F17uLL);
  bzero(v11, 8 * v5);
  if (v10 >= 1)
    bzero(v12, 8 * v10);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v30 = self;
  -[SUUIImageGridView imageViews](self, "imageViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  width = *MEMORY[0x24BDBF148];
  height = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v14)
  {
    v17 = v14;
    v18 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "sizeThatFits:", width, height);
        if (*((double *)v11 + v18) < v22)
          *((double *)v11 + v18) = v22;
        if (*((double *)v12 + v19) < v23)
          *((double *)v12 + v19) = v23;
        v24 = v18 + 1 < (uint64_t)v5;
        if (v18 + 1 < (uint64_t)v5)
          ++v18;
        else
          v18 = 0;
        if (!v24)
          ++v19;
      }
      v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v17);
  }

  for (j = 0; j != v5; ++j)
    width = width + *((double *)v11 + j);
  if (v10 >= 1)
  {
    v26 = (double *)v12;
    do
    {
      v27 = *v26++;
      height = height + v27;
      --v10;
    }
    while (v10);
  }
  if (width < v30->_size.width)
    width = v30->_size.width;
  if (height < v30->_size.height)
    height = v30->_size.height;
  free(v11);
  free(v12);
  v28 = width;
  v29 = height;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  size_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t i;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t j;
  uint64_t v28;
  double *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float v39;
  double v40;
  float v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  double v57;
  double v58;
  double v59;
  SUUIImageGridView *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v69.receiver = self;
  v69.super_class = (Class)SUUIImageGridView;
  -[SUUIImageGridView layoutSubviews](&v69, sel_layoutSubviews);
  v3 = -[SUUIImageGridView columnCount](self, "columnCount");
  if (v3 <= 1)
    v4 = 1;
  else
    v4 = v3;
  -[SUUIImageGridView imageViews](self, "imageViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") / v4;

  v60 = self;
  -[SUUIImageGridView imageViews](self, "imageViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") % v4;

  if (v8)
    v9 = v6 + 1;
  else
    v9 = v6;
  v10 = malloc_type_calloc(v4, 8uLL, 0x100004000313F17uLL);
  v11 = malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
  bzero(v10, 8 * v4);
  if (v9 >= 1)
    bzero(v11, 8 * v9);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[SUUIImageGridView imageViews](v60, "imageViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v66;
    v18 = *MEMORY[0x24BDBF148];
    v19 = *(double *)(MEMORY[0x24BDBF148] + 8);
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v66 != v17)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "sizeThatFits:", v18, v19);
        if (*((double *)v10 + v16) < v21)
          *((double *)v10 + v16) = v21;
        if (*((double *)v11 + v15) < v22)
          *((double *)v11 + v15) = v22;
        if (v16 + 1 < (uint64_t)v4)
        {
          ++v16;
        }
        else
        {
          ++v15;
          v16 = 0;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v14);
  }

  -[SUUIImageGridView bounds](v60, "bounds");
  v24 = v23;
  -[SUUIImageGridView bounds](v60, "bounds");
  v26 = v25;
  for (j = 0; j != v4; ++j)
    v24 = v24 - *((double *)v10 + j);
  v28 = v9 - 1;
  if (v9 >= 1)
  {
    v29 = (double *)v11;
    do
    {
      v30 = *v29++;
      v26 = v26 - v30;
      --v9;
    }
    while (v9);
  }
  -[SUUIImageGridView contentInset](v60, "contentInset");
  v32 = v26 - v31;
  -[SUUIImageGridView contentInset](v60, "contentInset");
  v34 = v32 - v33;
  -[SUUIImageGridView contentInset](v60, "contentInset");
  v36 = v24 - v35;
  -[SUUIImageGridView contentInset](v60, "contentInset");
  v38 = v36 - v37;
  v39 = v34 / (double)v28;
  v40 = floorf(v39);
  v41 = v38 / (double)(uint64_t)(v4 - 1);
  v42 = floorf(v41);
  if (v40 >= 0.0)
    v43 = v40;
  else
    v43 = 0.0;
  if (v42 >= 0.0)
    v44 = v42;
  else
    v44 = 0.0;
  -[SUUIImageGridView contentInset](v60, "contentInset");
  v46 = v45;
  -[SUUIImageGridView contentInset](v60, "contentInset");
  v48 = v47;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[SUUIImageGridView imageViews](v60, "imageViews");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v50)
  {
    v51 = v50;
    v52 = 0;
    v53 = 0;
    v54 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v62 != v54)
          objc_enumerationMutation(v49);
        v56 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
        objc_msgSend(v56, "frame");
        objc_msgSend(v56, "sizeThatFits:", v38, 1.79769313e308);
        objc_msgSend(v56, "setFrame:", v46, v48, v57, v58);
        if (v53 + 1 >= (uint64_t)v4)
        {
          -[SUUIImageGridView contentInset](v60, "contentInset");
          v46 = v59;
          v53 = 0;
          v48 = v43 + v48 + *((double *)v11 + v52++);
        }
        else
        {
          v46 = v44 + v46 + *((double *)v10 + v53++);
        }
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v51);
  }

  free(v10);
  free(v11);
}

- (int64_t)columnCount
{
  return self->_columnCount;
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

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseView, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
}

@end

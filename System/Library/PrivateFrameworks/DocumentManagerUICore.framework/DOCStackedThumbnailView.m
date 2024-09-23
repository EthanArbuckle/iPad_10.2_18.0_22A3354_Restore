@implementation DOCStackedThumbnailView

- (DOCStackedThumbnailView)initWithTopThumbnailSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  DOCStackedThumbnailView *v5;
  DOCStackedThumbnailView *v6;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)DOCStackedThumbnailView;
  v5 = -[DOCStackedThumbnailView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_topThumbnailSize.width = width;
    v5->_topThumbnailSize.height = height;
    -[DOCStackedThumbnailView setClipsToBounds:](v5, "setClipsToBounds:", 1);
  }
  return v6;
}

- (void)setTopThumbnailSize:(CGSize)a3
{
  if (self->_topThumbnailSize.width != a3.width || self->_topThumbnailSize.height != a3.height)
  {
    self->_topThumbnailSize = a3;
    -[DOCStackedThumbnailView updateNodes](self, "updateNodes");
    -[DOCStackedThumbnailView updateURLs](self, "updateURLs");
  }
}

- (void)setNodes:(id)a3
{
  objc_storeStrong((id *)&self->_nodes, a3);
  -[DOCStackedThumbnailView updateNodes](self, "updateNodes");
}

- (void)updateNodes
{
  double v3;
  double v4;
  NSArray *v6;
  NSUInteger v7;
  NSArray *v8;
  _QWORD v9[5];
  NSArray *v10;

  if (self->_nodes)
  {
    -[DOCStackedThumbnailView topThumbnailSize](self, "topThumbnailSize");
    if (v4 != *MEMORY[0x24BDBF148] || v3 != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      v6 = self->_nodes;
      v7 = -[NSArray count](self->_nodes, "count");
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __38__DOCStackedThumbnailView_updateNodes__block_invoke;
      v9[3] = &unk_24D72AB28;
      v9[4] = self;
      v10 = v6;
      v8 = v6;
      -[DOCStackedThumbnailView createThumbnailViewsWithCount:createViewForIndex:](self, "createThumbnailViewsWithCount:createViewForIndex:", v7, v9);

    }
  }
}

DOCThumbnailFittingImageView *__38__DOCStackedThumbnailView_updateNodes__block_invoke(uint64_t a1, unint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  DOCThumbnailFittingImageView *v9;
  void *v10;
  DOCThumbnailFittingImageView *v11;

  v4 = (double)a2 * 4.0;
  objc_msgSend(*(id *)(a1 + 32), "topThumbnailSize");
  v6 = v5 - v4;
  objc_msgSend(*(id *)(a1 + 32), "topThumbnailSize");
  v8 = v7 - v4;
  v9 = [DOCThumbnailFittingImageView alloc];
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DOCThumbnailFittingImageView initWithSize:node:](v9, "initWithSize:node:", v10, v6, v8);

  -[DOCThumbnailFittingImageView _setContinuousCornerRadius:](v11, "_setContinuousCornerRadius:", 4.0);
  -[DOCThumbnailFittingImageView setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:](v11, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);
  return v11;
}

- (void)setURLs:(id)a3
{
  objc_storeStrong((id *)&self->_URLs, a3);
  -[DOCStackedThumbnailView updateURLs](self, "updateURLs");
}

- (void)updateURLs
{
  NSArray *URLs;
  double v4;
  double v5;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSArray *v13;
  _QWORD v14[4];
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;

  URLs = self->_URLs;
  if (URLs && -[NSArray count](URLs, "count"))
  {
    -[DOCStackedThumbnailView topThumbnailSize](self, "topThumbnailSize");
    if (v5 != *MEMORY[0x24BDBF148] || v4 != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      v7 = self->_URLs;
      -[DOCStackedThumbnailView topThumbnailSize](self, "topThumbnailSize");
      v9 = v8;
      v11 = v10;
      v12 = -[NSArray count](self->_URLs, "count");
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __37__DOCStackedThumbnailView_updateURLs__block_invoke;
      v14[3] = &unk_24D72AB50;
      v16 = v9;
      v17 = v11;
      v15 = v7;
      v13 = v7;
      -[DOCStackedThumbnailView createThumbnailViewsWithCount:createViewForIndex:](self, "createThumbnailViewsWithCount:createViewForIndex:", v12, v14);

    }
  }
}

id __37__DOCStackedThumbnailView_updateURLs__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DOCNewThumbnailFittingImageView(v3, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);
  return v4;
}

- (void)createThumbnailViewsWithCount:(unint64_t)a3 createViewForIndex:(id)a4
{
  void (**v7)(id, _QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, _QWORD))a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCStackedThumbnailView.m"), 255, CFSTR("Must have at least one thumbnail"));

  }
  v19 = 0u;
  v20 = 0u;
  if (a3 >= 2)
    a3 = 2;
  *((_QWORD *)&v17 + 1) = 0;
  v18 = 0uLL;
  -[DOCStackedThumbnailView thumbnailImageViews](self, "thumbnailImageViews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "removeFromSuperview");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v14 = 0;
    do
    {
      v7[2](v7, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v15);
      -[DOCStackedThumbnailView insertSubview:atIndex:](self, "insertSubview:atIndex:", v15, 0);

      ++v14;
    }
    while (a3 != v14);
  }
  -[DOCStackedThumbnailView setThumbnailImageViews:](self, "setThumbnailImageViews:", v13);
  -[DOCStackedThumbnailView setNeedsLayout](self, "setNeedsLayout");
  -[DOCStackedThumbnailView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)layoutSubviews
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCStackedThumbnailView;
  -[DOCStackedThumbnailView layoutSubviews](&v5, sel_layoutSubviews);
  -[DOCStackedThumbnailView thumbnailImageViews](self, "thumbnailImageViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__DOCStackedThumbnailView_layoutSubviews__block_invoke;
  v4[3] = &unk_24D72AB78;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __41__DOCStackedThumbnailView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Width;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double Height;
  id v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v5 = *MEMORY[0x24BDBEFB0];
  v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v21 = a2;
  objc_msgSend(v21, "intrinsicContentSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "frame");
  Width = CGRectGetWidth(v22);
  v23.origin.x = v5;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  v12 = (Width - CGRectGetWidth(v23)) * 0.5;
  v13 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v13, "thumbnailImageViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", a3 - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "frame");
    v17 = v16 + -4.0;
    objc_msgSend(*(id *)(a1 + 32), "topThumbnailSize");
    objc_msgSend(v21, "setFittingSize:", v17);
    objc_msgSend(v15, "frame");
    v19 = v18 + -2.0;

  }
  else
  {
    objc_msgSend(v13, "frame");
    Height = CGRectGetHeight(v24);
    v25.origin.x = v12;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    v19 = Height - CGRectGetHeight(v25);
  }
  objc_msgSend(v21, "setFrame:", v12, v19, v8, v10);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  -[DOCStackedThumbnailView thumbnailImageViews](self, "thumbnailImageViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "intrinsicContentSize");
  v6 = v5;
  v8 = v7;
  -[DOCStackedThumbnailView nodes](self, "nodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DOCStackedThumbnailView nodes](self, "nodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DOCStackedThumbnailView URLs](self, "URLs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v15 = 0.0;
      goto LABEL_8;
    }
    -[DOCStackedThumbnailView URLs](self, "URLs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v10;
  v13 = objc_msgSend(v10, "count") - 1;

  v14 = 2;
  if (v13 < 2)
    v14 = v13;
  v15 = (double)(unint64_t)(2 * v14);
LABEL_8:
  v16 = v8 + v15;

  v17 = v6;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (NSArray)URLs
{
  return self->_URLs;
}

- (CGSize)topThumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_topThumbnailSize.width;
  height = self->_topThumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)thumbnailImageViews
{
  return self->_thumbnailImageViews;
}

- (void)setThumbnailImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageViews, 0);
  objc_storeStrong((id *)&self->_URLs, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end

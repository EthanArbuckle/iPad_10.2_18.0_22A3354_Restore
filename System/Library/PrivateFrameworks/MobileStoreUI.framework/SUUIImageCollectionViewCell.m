@implementation SUUIImageCollectionViewCell

- (void)reloadWithCarouselItem:(id)a3 size:(CGSize)a4 context:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  SUUIImageCollectionViewCell *v16;
  CGFloat v17;
  CGFloat v18;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__SUUIImageCollectionViewCell_reloadWithCarouselItem_size_context___block_invoke;
  v13[3] = &unk_2511F8318;
  v17 = width;
  v18 = height;
  v14 = v9;
  v15 = v10;
  v16 = self;
  v11 = v10;
  v12 = v9;
  -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v13);

}

void __67__SUUIImageCollectionViewCell_reloadWithCarouselItem_size_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SUUIStyledImageDataConsumer *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  id v25;

  objc_msgSend(a2, "addReusableViewWithReuseIdentifier:", 0x25120BBE8);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAccessibilityLabel:", v3);

  objc_msgSend(v25, "setEnabled:", 0);
  objc_msgSend(v25, "setImageSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v4 = objc_alloc_init(SUUIStyledImageDataConsumer);
  v5 = 0.0;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStyledImageDataConsumer setBorderColor:](v4, "setBorderColor:", v6);

  objc_msgSend(*(id *)(a1 + 40), "aggregateValueForKey:", CFSTR("SUUICIBWK"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "UIEdgeInsetsValue");
    v5 = v12;
  }
  else
  {
    v10 = 1.0;
    v9 = 0.0;
    v11 = 0.0;
  }
  -[SUUIStyledImageDataConsumer setBorderWidths:](v4, "setBorderWidths:", v5, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "artworkForSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForArtwork:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(void **)(v15 + 832);
  *(_QWORD *)(v15 + 832) = v14;

  objc_msgSend(*(id *)(a1 + 40), "requestIdentifierForArtwork:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(a1 + 40);
  if (v17)
  {
    objc_msgSend(v18, "resourceLoader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cachedResourceForRequestIdentifier:", objc_msgSend(v17, "unsignedIntegerValue"));
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;

      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 40), "loadImageForArtwork:dataConsumer:reason:", v13, v4, 1);

  }
  else
  {
    objc_msgSend(v18, "loadImageForArtwork:dataConsumer:reason:", v13, v4, 1);
  }
  v22 = -[SUUIStyledImageDataConsumer isImagePlaceholderAvailable](v4, "isImagePlaceholderAvailable");
  v23 = *(void **)(a1 + 40);
  if (v22)
  {
    objc_msgSend(v23, "placeholderColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStyledImageDataConsumer imagePlaceholderForColor:](v4, "imagePlaceholderForColor:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v23, "placeholderImageForSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  objc_msgSend(v25, "setContents:", v21);

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "requestIdentifierForViewElement:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = v7;
    if (objc_msgSend(v10, "elementType") == 152)
    {
      objc_msgSend(v10, "thumbnailImage");
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v11;
    }
    objc_msgSend(v8, "loadImageForImageElement:reason:", v10, a4);

  }
  return v9 == 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a4, "sizeForViewElement:width:", a3, 1.79769313e308);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUIAdornedImageView requestLayoutForViewElement:width:context:](SUUIAdornedImageView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v6;
  double v7;
  float v8;
  double v9;
  CGSize result;

  objc_msgSend(a5, "sizeForViewElement:width:", a4);
  if (v6 > 0.00000011920929)
  {
    v8 = v7 * (a3 / v6);
    v7 = floorf(v8);
  }
  v9 = a3;
  result.height = v7;
  result.width = v9;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id imageRequestCacheKey;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  SUUIImageCollectionViewCell *v16;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "imageResourceCacheKeyForViewElement:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  imageRequestCacheKey = self->_imageRequestCacheKey;
  self->_imageRequestCacheKey = v9;

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__SUUIImageCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v13[3] = &unk_2511F6630;
  v14 = v7;
  v15 = v8;
  v16 = self;
  v11 = v8;
  v12 = v7;
  -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v13);

}

void __67__SUUIImageCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "elementType");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v3 == 152)
  {
    v6 = (id)objc_msgSend(v10, "addImageViewWithVideoElement:context:", v4, v5);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 840))
      v7 = (id)objc_msgSend(v10, "addImageViewWithVideoElement:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v8 = (id)objc_msgSend(v10, "addImageViewWithElement:context:", v4, v5);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 840))
      v9 = (id)objc_msgSend(v10, "addImageViewWithElement:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a5, "requestIdentifierForResourceCacheKey:", self->_imageRequestCacheKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (v12 = objc_msgSend(v10, "unsignedIntegerValue"), v12 == objc_msgSend(v9, "requestIdentifier")))
  {
    -[SUUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "setImage:", v8);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

    v18 = 1;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  void *v19;
  void *v20;
  CGAffineTransform v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SUUIImageCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v22, sel_layoutSubviews);
  -[SUUIImageCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SUUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[SUUIViewReuseCollectionViewCell contentInset](self, "contentInset");
    if (self->_showsReflectionImage)
    {
      v18 = v11 * 0.5;
      v14 = v14 + floorf(v18);
    }
    objc_msgSend(v13, "setFrame:", v5 + v15, v7 + v14, v9 - (v15 + v17), v11 - (v16 + v14));
  }
  if (objc_msgSend(v12, "count") == 2)
  {
    objc_msgSend(v12, "objectAtIndex:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (self->_showsReflectionImage)
    {
      objc_msgSend(v13, "frame");
      objc_msgSend(v20, "setFrame:");
      objc_msgSend(v20, "setHidden:", 0);
      CGAffineTransformMakeScale(&v21, -1.0, -1.0);
      objc_msgSend(v20, "setTransform:", &v21);
    }
    else
    {
      objc_msgSend(v19, "setHidden:", 1);
    }

  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIImageCollectionViewCell;
  -[SUUICollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SUUIImageCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIImageCollectionViewCell;
  -[SUUICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[SUUIImageCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)_reloadHighlightImageView
{
  void *v3;
  SUUIImageView *v4;
  SUUIImageView *v5;
  SUUIImageView *v6;
  SUUIImageView *v7;
  SUUIImageView *v8;
  void *v9;
  SUUIImageView *v10;
  SUUIImageView *v11;
  void *v12;
  void *v13;
  void *v14;
  SUUIImageView *v15;
  void *v16;
  SUUIImageView *highlightImageView;
  SUUIImageView *v18;
  SUUIImageView *v19;
  void *v20;
  _QWORD v21[4];
  SUUIImageView *v22;
  char v23[48];

  if ((-[SUUIImageCollectionViewCell isHighlighted](self, "isHighlighted") & 1) == 0
    && !-[SUUIImageCollectionViewCell isSelected](self, "isSelected"))
  {
    highlightImageView = self->_highlightImageView;
    if (!highlightImageView)
      return;
    v18 = highlightImageView;
    v19 = self->_highlightImageView;
    self->_highlightImageView = 0;

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v20 = (void *)MEMORY[0x24BDE57D8];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __56__SUUIImageCollectionViewCell__reloadHighlightImageView__block_invoke;
    v21[3] = &unk_2511F47C0;
    v22 = v18;
    v4 = v18;
    objc_msgSend(v20, "setCompletionBlock:", v21);
    -[SUUIImageView setAlpha:](v4, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    v16 = v22;
    goto LABEL_9;
  }
  -[SUUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (SUUIImageView *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = self->_highlightImageView;
    if (!v5)
    {
      v6 = objc_alloc_init(SUUIImageView);
      v7 = self->_highlightImageView;
      self->_highlightImageView = v6;

      -[SUUIImageView setAlpha:](self->_highlightImageView, "setAlpha:", 0.300000012);
      v8 = self->_highlightImageView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIImageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      v5 = self->_highlightImageView;
    }
    -[SUUIImageView bounds](v4, "bounds");
    -[SUUIImageView setBounds:](v5, "setBounds:");
    v10 = self->_highlightImageView;
    -[SUUIImageView center](v4, "center");
    -[SUUIImageView setCenter:](v10, "setCenter:");
    v11 = self->_highlightImageView;
    -[SUUIImageView image](v4, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_flatImageWithColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIImageView setImage:](v11, "setImage:", v14);

    v15 = self->_highlightImageView;
    -[SUUIImageView transform](v4, "transform");
    -[SUUIImageView setTransform:](v15, "setTransform:", v23);
    -[SUUIImageCollectionViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertSubview:aboveSubview:", self->_highlightImageView, v4);
LABEL_9:

  }
}

uint64_t __56__SUUIImageCollectionViewCell__reloadHighlightImageView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (BOOL)showsReflectionImage
{
  return self->_showsReflectionImage;
}

- (void)setShowsReflectionImage:(BOOL)a3
{
  self->_showsReflectionImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageRequestCacheKey, 0);
  objc_storeStrong((id *)&self->_highlightImageView, 0);
}

@end

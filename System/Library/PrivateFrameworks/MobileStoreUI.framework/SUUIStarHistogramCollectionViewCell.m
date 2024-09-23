@implementation SUUIStarHistogramCollectionViewCell

- (SUUIStarHistogramCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIStarHistogramCollectionViewCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIStarHistogramCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
    -[SUUIViewReuseCollectionViewCell registerClass:forViewWithReuseIdentifier:](v3, "registerClass:forViewWithReuseIdentifier:", objc_opt_class(), CFSTR("starBar"));
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  double v12;
  id v13;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__SUUIStarHistogramCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v10[3] = &unk_2511F6298;
  v12 = a4;
  v11 = v8;
  v13 = a1;
  v9 = v8;
  objc_msgSend(a3, "enumerateChildrenUsingBlock:", v10);

}

void __81__SUUIStarHistogramCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "elementType");
  if (v3 == 138)
  {
    objc_msgSend(*(id *)(a1 + 48), "_attributedStringForLabelViewElement:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "labelLayoutCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestLayoutForLabel:attributedString:width:", v6, v4, (uint64_t)*(double *)(a1 + 40));

  }
  else if (v3 == 135)
  {
    +[SUUIStarRatingViewElementView requestLayoutForViewElement:width:context:](SUUIStarRatingViewElementView, "requestLayoutForViewElement:width:context:", v6, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  }

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  double v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  const char *v24;
  double v25;
  uint64_t v26;
  CGSize result;

  v7 = a4;
  v8 = a5;
  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x3010000000;
  v24 = "";
  v26 = *(_QWORD *)(MEMORY[0x24BDBF148] + 8);
  v25 = a3;
  objc_msgSend(v8, "labelLayoutCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __77__SUUIStarHistogramCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v16[3] = &unk_2511F8268;
  v19 = &v21;
  v10 = v8;
  v17 = v10;
  v20 = a3;
  v11 = v9;
  v18 = v11;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v16);
  v12 = v22[4];
  v13 = v22[5];

  _Block_object_dispose(&v21, 8);
  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

void __77__SUUIStarHistogramCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "elementType");
  switch(v3)
  {
    case 138:
      objc_msgSend(*(id *)(a1 + 40), "estimatedSizeForLabel:width:", v11, *(double *)(a1 + 56));
LABEL_7:
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(double *)(v9 + 40);
      v5 = (double *)(v9 + 40);
      v8 = v10;
      goto LABEL_8;
    case 135:
      objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", v11, *(double *)(a1 + 56));
      goto LABEL_7;
    case 133:
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v6 = *(double *)(v4 + 40);
      v5 = (double *)(v4 + 40);
      v7 = v6;
      v8 = 14.0;
LABEL_8:
      *v5 = v7 + v8;
      break;
  }

}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  double v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__SUUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_2511F6EC8;
  v15 = a4;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v12);

}

void __75__SUUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __75__SUUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v6[3] = &unk_2511F8290;
  v7 = v3;
  v9 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v6);

}

void __75__SUUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  id v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "elementType");
  if (v3 == 138)
  {
    v9 = (id)objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithElement:width:context:", v10, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  }
  else
  {
    if (v3 == 135)
    {
      objc_msgSend(*(id *)(a1 + 32), "addStarRatingViewWithViewElement:width:context:", v10, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setElementSpacing:", 10);
    }
    else
    {
      v4 = v3 == 133;
      v5 = v10;
      if (!v4)
        goto LABEL_10;
      objc_msgSend(*(id *)(a1 + 32), "addReusableViewWithReuseIdentifier:", CFSTR("starBar"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "style");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setColoringUsingStyle:", v7);

      objc_msgSend(v6, "setNumberOfStars:", objc_msgSend(v10, "numberOfStars"));
      objc_msgSend(v10, "value");
      objc_msgSend(v6, "setValue:", v8);
    }

  }
  v5 = v10;
LABEL_10:

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
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
  CGFloat v8;
  double v9;
  CGFloat MaxY;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int ShouldReverseLayoutDirection;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double Width;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat x;
  CGFloat y;
  CGFloat v35;
  CGFloat height;
  CGFloat v37;
  CGFloat v38;
  double rect;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v46 = *MEMORY[0x24BDAC8D0];
  v44.receiver = self;
  v44.super_class = (Class)SUUIStarHistogramCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v44, sel_layoutSubviews);
  -[SUUIStarHistogramCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v37 = v5;
  v38 = v4;
  rect = v6;
  v8 = v7;

  -[SUUIViewReuseCollectionViewCell contentInset](self, "contentInset");
  MaxY = v9;
  v12 = v11;
  v14 = v13;
  -[SUUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    v21 = rect - v12 - v14;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v23, "sizeThatFits:", v21, 1.79769313e308);
        v25 = v24;
        v27 = v26;
        v28 = v12;
        if (ShouldReverseLayoutDirection)
        {
          v47.origin.y = v37;
          v47.origin.x = v38;
          v47.size.width = rect;
          v47.size.height = v8;
          Width = CGRectGetWidth(v47);
          v48.origin.x = 0.0;
          v48.origin.y = MaxY;
          v48.size.width = v25;
          v48.size.height = v27;
          v28 = Width - CGRectGetWidth(v48) - v12;
        }
        v30 = MaxY;
        v31 = v25;
        v32 = v27;
        v49 = CGRectIntegral(*(CGRect *)&v28);
        x = v49.origin.x;
        y = v49.origin.y;
        v35 = v49.size.width;
        height = v49.size.height;
        objc_msgSend(v23, "setFrame:");
        v50.origin.x = x;
        v50.origin.y = y;
        v50.size.width = v35;
        v50.size.height = height;
        MaxY = CGRectGetMaxY(v50);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v19);
  }

}

+ (id)_attributedStringForLabelViewElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedStringWithDefaultFont:foregroundColor:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

@implementation SUUIReviewCollectionViewCell

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
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__SUUIReviewCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v9[3] = &unk_2511F9898;
  v11 = a4;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a3, "enumerateChildrenUsingBlock:", v9);

}

void __74__SUUIReviewCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  __objc2_class **v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "elementType");
  if (v3 <= 134)
  {
    if (v3 != 102)
    {
      if (v3 == 105)
      {
        v4 = off_2511F2FF8;
LABEL_11:
        -[__objc2_class requestLayoutForViewElement:width:context:](*v4, "requestLayoutForViewElement:width:context:", v6, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
        goto LABEL_12;
      }
      goto LABEL_12;
    }
LABEL_10:
    v4 = off_2511F2FE8;
    goto LABEL_11;
  }
  if (v3 == 138)
  {
    if (objc_msgSend(v6, "labelViewStyle") == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "editorialLayoutForLabelElement:width:", v6, *(double *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "enqueueLayoutRequests");

    }
    goto LABEL_10;
  }
  if (v3 == 135)
  {
    v4 = off_2511F30F0;
    goto LABEL_11;
  }
LABEL_12:

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD *v18;
  double v19;
  _QWORD v20[4];
  _QWORD v21[4];
  uint64_t v22;
  double *v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  CGSize result;

  v7 = a4;
  v8 = a5;
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x3010000000;
  v25 = "";
  v26 = *MEMORY[0x24BDBF148];
  *(double *)&v26 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__SUUIReviewCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v14[3] = &unk_2511F62C0;
  v19 = a3;
  v9 = v8;
  v15 = v9;
  v16 = &v22;
  v17 = v21;
  v18 = v20;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v14);
  v10 = v23[4];
  v11 = v23[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);

  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

void __70__SUUIReviewCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(v12, "elementType") == 105)
  {
    +[SUUIReviewListTitleView sizeThatFitsWidth:viewElement:context:](SUUIReviewListTitleView, "sizeThatFitsWidth:viewElement:context:", v12, *(_QWORD *)(a1 + 32), *(double *)(a1 + 64));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v4 + *(double *)(v3 + 40);
LABEL_5:
    *(double *)(v3 + 40) = v5;
    goto LABEL_9;
  }
  if (objc_msgSend(v12, "elementType") == 102)
  {
    +[SUUIResponseView sizeThatFitsWidth:viewElement:context:](SUUIResponseView, "sizeThatFitsWidth:viewElement:context:", v12, *(_QWORD *)(a1 + 32), *(double *)(a1 + 64));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v6 + 10.0 + *(double *)(v3 + 40);
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", v12, *(double *)(a1 + 64));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v7
                                                              + 10.0
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40);
  objc_msgSend(*(id *)(a1 + 32), "textPropertiesForViewElement:width:", v12, *(double *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 1)
  {
    objc_msgSend(v8, "desiredOffsetTop");
    *(float *)&v10 = v10 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + fmax(roundf(*(float *)&v10), 0.0);
  }
  objc_msgSend(v9, "baselineOffsetFromBottom");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;

LABEL_9:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

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
  SUUIReviewCollectionViewCell *v15;
  double v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__SUUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_2511F4AC8;
  v16 = a4;
  v13 = v8;
  v14 = v9;
  v15 = self;
  v10 = v9;
  v11 = v8;
  -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v12);

}

void __68__SUUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__SUUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v8[3] = &unk_2511F62E8;
  v9 = v3;
  v12 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v8);
  objc_msgSend(*(id *)(a1 + 48), "_resetTapGestures");

}

void __68__SUUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "elementType");
  if (v3 > 134)
  {
    if (v3 != 135)
    {
      if (v3 == 138 && objc_msgSend(v7, "labelViewStyle") == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "addTextViewWithElement:width:context:", v7, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setDescriptionView:", v5);
        if (v5)
          goto LABEL_14;
      }
      goto LABEL_15;
    }
    objc_msgSend(*(id *)(a1 + 32), "addStarRatingViewWithViewElement:width:context:", v7, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 == 102)
    {
      objc_msgSend(*(id *)(a1 + 32), "addResponseViewWithViewElement:width:context:", v7, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setResponseView:", v5);
      if (!v5)
        goto LABEL_15;
      goto LABEL_14;
    }
    if (v3 != 105)
      goto LABEL_15;
    objc_msgSend(*(id *)(a1 + 32), "addReviewListTitleViewWithViewElement:width:context:", v7, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  if (v4)
  {
LABEL_14:
    objc_msgSend(*(id *)(a1 + 40), "textPropertiesForViewElement:width:", v7, *(double *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTextProperties:forView:", v6, v5);

  }
LABEL_15:

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

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIReviewCollectionViewCell;
  -[SUUICollectionViewCell setHighlighted:](&v9, sel_setHighlighted_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.9, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewReuseCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.9, 1.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewReuseCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReviewCollectionViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

}

- (void)layoutSubviews
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[16];
  char v24;
  _QWORD v25[4];
  _QWORD v26[4];
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SUUIReviewCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v27, sel_layoutSubviews);
  v3 = storeShouldReverseLayoutDirection() ^ 1;
  -[SUUIReviewCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v22 = v5;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SUUIViewReuseCollectionViewCell contentInset](self, "contentInset");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = v9 - v14 - v18;
  -[SUUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = v13;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __46__SUUIReviewCollectionViewCell_layoutSubviews__block_invoke;
  v23[3] = &unk_2511F6338;
  v23[4] = self;
  v23[5] = v25;
  v23[6] = v26;
  v24 = v3;
  *(double *)&v23[7] = v20;
  v23[8] = v13;
  *(double *)&v23[9] = v15;
  v23[10] = v17;
  *(double *)&v23[11] = v19;
  v23[12] = v22;
  v23[13] = v7;
  *(double *)&v23[14] = v9;
  v23[15] = v11;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v23);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);

}

void __46__SUUIReviewCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double Width;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat x;
  CGFloat y;
  CGFloat v21;
  CGFloat height;
  uint64_t v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24 = a2;
  objc_msgSend(*(id *)(a1 + 32), "textPropertiesForView:", v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "responseView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v24
    || (objc_msgSend(*(id *)(a1 + 32), "descriptionView"),
        v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v24))
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + 10.0;
  }
  v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (a3)
  {
    objc_msgSend(v5, "desiredOffsetTop");
    *(float *)&v9 = v9 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v8 = v8 + fmax(roundf(*(float *)&v9), 0.0);
  }
  objc_msgSend(v24, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
  v12 = v11;
  if (v10 >= *(double *)(a1 + 56))
    v13 = *(double *)(a1 + 56);
  else
    v13 = v10;
  if (*(_BYTE *)(a1 + 128))
  {
    v14 = *(double *)(a1 + 72);
  }
  else
  {
    Width = CGRectGetWidth(*(CGRect *)(a1 + 96));
    v25.origin.x = 0.0;
    v25.origin.y = v8;
    v25.size.width = v13;
    v25.size.height = v12;
    v14 = Width - CGRectGetWidth(v25) - *(double *)(a1 + 72);
  }
  v16 = v8;
  v17 = v13;
  v18 = v12;
  v26 = CGRectIntegral(*(CGRect *)&v14);
  x = v26.origin.x;
  y = v26.origin.y;
  v21 = v26.size.width;
  height = v26.size.height;
  objc_msgSend(v24, "setFrame:");
  objc_msgSend(v5, "baselineOffsetFromBottom");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v23;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = v21;
  v27.size.height = height;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v27);

}

- (void)contentViewTapped:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void (**v14)(void);
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void (**v27)(void);
  id v28;
  CGPoint v29;
  CGPoint v30;
  CGRect v31;
  CGRect v32;

  v28 = a3;
  -[SUUIReviewCollectionViewCell descriptionView](self, "descriptionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[SUUIReviewCollectionViewCell descriptionTapAction](self, "descriptionTapAction");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[SUUIReviewCollectionViewCell descriptionView](self, "descriptionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v29.x = v7;
    v29.y = v9;
    v13 = CGRectContainsPoint(v31, v29);

    if (v13)
    {
      -[SUUIReviewCollectionViewCell descriptionTapAction](self, "descriptionTapAction");
      v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v14[2]();

    }
  }
  -[SUUIReviewCollectionViewCell responseView](self, "responseView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "locationInView:", v17);
  v19 = v18;
  v21 = v20;

  -[SUUIReviewCollectionViewCell responseDescriptionTapAction](self, "responseDescriptionTapAction");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[SUUIReviewCollectionViewCell responseView](self, "responseView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "descriptionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v30.x = v19;
    v30.y = v21;
    v26 = CGRectContainsPoint(v32, v30);

    if (v26)
    {
      -[SUUIReviewCollectionViewCell responseDescriptionTapAction](self, "responseDescriptionTapAction");
      v27 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v27[2]();

    }
  }

}

+ (id)_attributedStringForTitleLabel:(id)a3 context:(id)a4
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
    SUUIFontPreferredFontForTextStyle(1);
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
  objc_msgSend(v5, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_attributedStringForDateLabel:(id)a3 context:(id)a4
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
    SUUIFontPreferredFontForTextStyle(21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_resetTapGestures
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[SUUIReviewCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SUUIReviewCollectionViewCell contentView](self, "contentView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gestureRecognizers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[SUUIReviewCollectionViewCell contentView](self, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeGestureRecognizer:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_contentViewTapped_);
  -[SUUIReviewCollectionViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addGestureRecognizer:", v12);

}

- (id)descriptionTapAction
{
  return self->_descriptionTapAction;
}

- (void)setDescriptionTapAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 824);
}

- (id)responseDescriptionTapAction
{
  return self->_responseDescriptionTapAction;
}

- (void)setResponseDescriptionTapAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (SUUITextBoxView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionView, a3);
}

- (SUUIResponseView)responseView
{
  return self->_responseView;
}

- (void)setResponseView:(id)a3
{
  objc_storeStrong((id *)&self->_responseView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseView, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong(&self->_responseDescriptionTapAction, 0);
  objc_storeStrong(&self->_descriptionTapAction, 0);
}

@end

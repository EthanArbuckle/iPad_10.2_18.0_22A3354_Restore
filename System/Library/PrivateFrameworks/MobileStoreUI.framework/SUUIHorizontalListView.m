@implementation SUUIHorizontalListView

- (SUUIHorizontalListView)initWithFrame:(CGRect)a3
{
  SUUIHorizontalListView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIHorizontalListView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
    -[SUUIViewReuseView registerClass:forViewWithReuseIdentifier:](v3, "registerClass:forViewWithReuseIdentifier:", objc_opt_class(), CFSTR("vlockup"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIHorizontalListView;
  -[SUUIViewReuseView dealloc](&v3, sel_dealloc);
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v7 = a3;
  v8 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__SUUIHorizontalListView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_2511F4A28;
  v9 = v8;
  v13 = &v15;
  v14 = a4;
  v12 = v9;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v11);
  LOBYTE(a4) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __73__SUUIHorizontalListView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = objc_msgSend(*(id *)(a1 + 32), "prefetchResourcesForViewElement:reason:", a2, *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = 1;
  else
    v5 = result;
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double *v13;
  double v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  const char *v32;
  __int128 v33;
  CGSize result;

  v5 = a3;
  v6 = a4;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x3010000000;
  v32 = "";
  v33 = *MEMORY[0x24BDBF148];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __62__SUUIHorizontalListView_preferredSizeForViewElement_context___block_invoke;
  v21[3] = &unk_2511F6E78;
  v7 = v6;
  v22 = v7;
  v23 = &v29;
  v24 = &v25;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v21);
  objc_msgSend(v5, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "elementPadding");
  v10 = v9;
  v12 = v11;

  v13 = v30;
  v14 = v10 + v12 + v30[5];
  v30[5] = v14;
  v15 = v26[3];
  v16 = v15 <= 1;
  v17 = v15 - 1;
  if (v16)
  {
    v18 = v13[4];
  }
  else
  {
    v18 = v13[4] + (float)((float)v17 * 5.0);
    v13[4] = v18;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  v19 = v18;
  v20 = v14;
  result.height = v20;
  result.width = v19;
  return result;
}

void __62__SUUIHorizontalListView_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  id v20;

  v20 = a2;
  v5 = objc_msgSend(v20, "elementType");
  if (v5 == 152)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v20, "thumbnailImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeForImageElement:", v13);
    v15 = v14;
    v17 = v16;

    v8 = v20;
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(double *)(v18 + 40);
    if (v19 < v17)
      v19 = v17;
    *(double *)(v18 + 40) = v19;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = v15 + *(double *)(v10 + 32);
  }
  else
  {
    if (v5 != 49)
    {
      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *MEMORY[0x24BDBF148];
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      *a3 = 1;
      v8 = v20;
      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 32), "sizeForImageElement:", v20);
    v8 = v20;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(double *)(v9 + 40) >= v7)
      v7 = *(double *)(v9 + 40);
    *(double *)(v9 + 40) = v7;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = v6 + *(double *)(v10 + 32);
  }
  *(double *)(v10 + 32) = v11;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
LABEL_11:

}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  double v16;
  id v17;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__SUUIHorizontalListView_requestLayoutForViewElement_width_context___block_invoke;
  v13[3] = &unk_2511F4A50;
  v16 = a4;
  v17 = a1;
  v14 = v10;
  v15 = v8;
  v11 = v8;
  v12 = v10;
  objc_msgSend(v9, "enumerateChildrenUsingBlock:", v13);

}

void __68__SUUIHorizontalListView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  double v5;
  __objc2_class *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "elementType");
  if (v3 > 68)
  {
    v4 = v9;
    switch(v3)
    {
      case 135:
        v6 = SUUIStarRatingControlView;
        goto LABEL_15;
      case 136:
      case 137:
      case 139:
      case 140:
      case 142:
      case 143:
        goto LABEL_18;
      case 138:
        objc_msgSend(*(id *)(a1 + 56), "_attributedStringForLabel:context:", v9, *(_QWORD *)(a1 + 40));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "requestLayoutForLabel:attributedString:width:", v9, v7, (uint64_t)*(double *)(a1 + 48));
        goto LABEL_13;
      case 141:
        goto LABEL_8;
      case 144:
        v6 = SUUITomatoRatingView;
LABEL_15:
        v5 = *(double *)(a1 + 48);
        goto LABEL_16;
      default:
        v4 = v9;
        if (v3 != 69)
          goto LABEL_18;
        objc_msgSend(v9, "titleItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "_attributedStringForMenuItem:context:", v7, *(_QWORD *)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "requestLayoutForViewElement:attributedString:width:", v7, v8, (uint64_t)*(double *)(a1 + 48));

        break;
    }
    goto LABEL_13;
  }
  if (v3 == 8)
  {
    objc_msgSend(*(id *)(a1 + 32), "requestLayoutForBadge:width:", v9, (uint64_t)*(double *)(a1 + 48));
LABEL_17:
    v4 = v9;
    goto LABEL_18;
  }
  v4 = v9;
  if (v3 == 12)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 56), "_attributedStringForButton:context:", v9, *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "requestLayoutForButton:attributedString:width:", v9, v7, (uint64_t)*(double *)(a1 + 48));
LABEL_13:

    goto LABEL_17;
  }
  if (v3 == 66)
  {
    objc_msgSend(*(id *)(a1 + 56), "_sizeForViewElement:width:context:", v9, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
    v6 = SUUIVerticalLockupView;
LABEL_16:
    -[__objc2_class requestLayoutForViewElement:width:context:](v6, "requestLayoutForViewElement:width:context:", v9, *(_QWORD *)(a1 + 40), v5);
    goto LABEL_17;
  }
LABEL_18:

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, unint64_t);
  void *v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  id v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  const char *v52;
  __int128 v53;
  CGSize result;

  v8 = a4;
  v9 = a5;
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x3010000000;
  v52 = "";
  v53 = *MEMORY[0x24BDBF148];
  v45 = 0;
  v46 = (double *)&v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0x7FFFFFFFFFFFFFFFLL;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  objc_msgSend(a1, "_linesWithViewElement:width:context:", v8, v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v25 = MEMORY[0x24BDAC760];
  v26 = 3221225472;
  v27 = __64__SUUIHorizontalListView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v28 = &unk_2511F6EA0;
  v30 = &v37;
  v34 = a1;
  v35 = a3;
  v12 = v9;
  v29 = v12;
  v31 = &v45;
  v32 = &v49;
  v33 = &v41;
  v36 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v25);
  if (v42[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v10, "objectAtIndex:", v25, v26, v27, v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 >= 2)
      v50[4] = v50[4] + (double)(v14 - 1) * v46[3];
  }
  if (*((_BYTE *)v38 + 24) && v50[4] < a3)
    v50[4] = a3;
  objc_msgSend(v8, "style", v25, v26, v27, v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "elementPadding");
  v17 = v16;
  v19 = v18;

  v20 = v17 + v19;
  v21 = v50[4];
  v22 = v20 + v50[5];
  v50[5] = v22;

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  v23 = v21;
  v24 = v22;
  result.height = v24;
  result.width = v23;
  return result;
}

void __64__SUUIHorizontalListView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v12, "elementType") == 127)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 72), "_sizeForViewElement:width:context:", v12, *(_QWORD *)(a1 + 32), *(double *)(a1 + 80));
          v14 = v13;
          v16 = v15;
          v17 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          objc_msgSend(*(id *)(a1 + 72), "_elementSpacingForViewElement:", v12);
          if (v17 >= v18)
            v18 = v17;
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v18;
          if (v10 < v16)
            v10 = v16;
          v9 = v9 + v14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
    v10 = 0.0;
  }
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (v9 > *(double *)(v19 + 32))
  {
    *(double *)(v19 + 32) = v9;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
  }
  if (*(_QWORD *)(a1 + 88) - 1 > a3)
  {
    objc_msgSend(*(id *)(a1 + 72), "_lineSpacingForLineElements:", v5);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v20
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 40);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v10
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 40);

}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  SUUIListViewElement *v8;
  id v9;
  NSArray *v10;
  NSArray *lines;
  SUUIListViewElement *listElement;
  id v13;
  UIEdgeInsets *p_bigHitInsets;
  __int128 v20;
  SUUIListViewElement *v21;
  _QWORD v22[5];
  id v23;
  double v24;

  v8 = (SUUIListViewElement *)a3;
  v9 = a5;
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_artworkRequestPassthroughViews, "removeAllObjects");
  self->_elementSpacing = 0.0;
  objc_msgSend((id)objc_opt_class(), "_linesWithViewElement:width:context:", v8, v9, a4);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lines = self->_lines;
  self->_lines = v10;

  listElement = self->_listElement;
  self->_listElement = v8;
  v21 = v8;

  self->_useBigHitTarget = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __62__SUUIHorizontalListView_reloadWithViewElement_width_context___block_invoke;
  v22[3] = &unk_2511F6EC8;
  v24 = a4;
  v22[4] = self;
  v23 = v9;
  v13 = v9;
  -[SUUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v22);
  p_bigHitInsets = &self->_bigHitInsets;
  if (self->_useBigHitTarget)
  {
    __asm { FMOV            V0.2D, #-15.0 }
    *(_OWORD *)&p_bigHitInsets->top = _Q0;
    *(_OWORD *)&self->_bigHitInsets.bottom = _Q0;
  }
  else
  {
    v20 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
    *(_OWORD *)&p_bigHitInsets->top = *MEMORY[0x24BEBE158];
    *(_OWORD *)&self->_bigHitInsets.bottom = v20;
  }

}

void __62__SUUIHorizontalListView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 528);
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v51;
    v4 = *MEMORY[0x24BEBE158];
    v5 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v6 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v7 = *(double *)(MEMORY[0x24BEBE158] + 24);
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v51 != v42)
          objc_enumerationMutation(obj);
        v44 = v8;
        v9 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v8);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v45 = v9;
        v10 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v47 != v12)
                objc_enumerationMutation(v45);
              v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              v15 = objc_msgSend(v14, "elementType");
              v16 = 0;
              if (v15 > 68)
              {
                v17 = 0;
                switch(v15)
                {
                  case 135:
                    v19 = v14;
                    v20 = objc_msgSend(v19, "starType");
                    v21 = *(double *)(a1 + 48);
                    v22 = *(_QWORD *)(a1 + 40);
                    if (v20 == 2)
                      objc_msgSend(v3, "addStarRatingControlViewWithViewElement:width:context:", v19, v22, v21);
                    else
                      objc_msgSend(v3, "addStarRatingViewWithViewElement:width:context:", v19, v22, v21);
                    v17 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_48;
                  case 136:
                  case 137:
                  case 139:
                  case 140:
                  case 142:
                  case 143:
                    goto LABEL_57;
                  case 138:
                    objc_msgSend(v3, "addLabelViewWithElement:width:context:", v14, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
                    v34 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_44;
                  case 141:
                    goto LABEL_23;
                  case 144:
                    objc_msgSend(v3, "addTomatoRatingViewWithViewElement:width:context:", v14, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
                    v34 = objc_claimAutoreleasedReturnValue();
LABEL_44:
                    v17 = (id)v34;
                    goto LABEL_49;
                  default:
                    if (v15 == 69)
                    {
                      objc_msgSend(v14, "titleItem");
                      v19 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v3, "addMenuButtonWithTitleItem:width:context:", v19, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
                      v17 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v17, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__menuButtonAction_, 64);
LABEL_48:

LABEL_49:
                      v16 = 0;
                      goto LABEL_50;
                    }
                    v17 = 0;
                    if (v15 != 152)
                      goto LABEL_57;
                    objc_msgSend(v3, "addImageViewWithVideoElement:context:", v14, *(_QWORD *)(a1 + 40));
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    break;
                }
LABEL_34:
                v26 = v25;
LABEL_36:
                v16 = v26;
                v17 = v26;
                if (!v26)
                  goto LABEL_50;
LABEL_37:
                objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v14);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                {
                  v30 = *(void **)(*(_QWORD *)(a1 + 32) + 520);
                  if (!v30)
                  {
                    v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
                    v32 = *(_QWORD *)(a1 + 32);
                    v33 = *(void **)(v32 + 520);
                    *(_QWORD *)(v32 + 520) = v31;

                    v30 = *(void **)(*(_QWORD *)(a1 + 32) + 520);
                  }
                  objc_msgSend(v30, "setObject:forKey:", v29, v16);
                }

                goto LABEL_50;
              }
              if (v15 <= 48)
              {
                if (v15 == 8)
                {
                  objc_msgSend(v3, "addBadgeViewWithElement:width:context:", v14, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_34;
                }
                v17 = 0;
                if (v15 != 12)
                  goto LABEL_57;
              }
              else
              {
                if (v15 == 49)
                {
                  objc_msgSend(v3, "addImageViewWithElement:context:", v14, *(_QWORD *)(a1 + 40));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "tapRecognizer");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "addTarget:action:", *(_QWORD *)(a1 + 32), sel__imageTapAction_);

                  v26 = v27;
                  goto LABEL_36;
                }
                if (v15 != 50)
                {
                  v17 = 0;
                  if (v15 != 66)
                    goto LABEL_57;
                  objc_msgSend(v3, "addReusableViewWithReuseIdentifier:", CFSTR("vlockup"));
                  v17 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setContentInset:", v4, v5, v6, v7);
                  v18 = 1;
                  objc_msgSend(v17, "setSizingStyle:", 1);
                  objc_msgSend((id)objc_opt_class(), "_sizeForViewElement:width:context:", v14, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
                  objc_msgSend(v17, "reloadWithViewElement:width:context:", v14, *(_QWORD *)(a1 + 40));
                  v16 = 0;
                  if (!v17)
                    goto LABEL_57;
                  goto LABEL_51;
                }
              }
LABEL_23:
              v23 = v14;
              if (objc_msgSend(v23, "isBigHitButton"))
                *(_BYTE *)(*(_QWORD *)(a1 + 32) + 552) = 1;
              objc_msgSend(v3, "addButtonWithElement:width:context:", v23, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__buttonAction_, 64);
              v17 = v24;
              if (objc_msgSend(v23, "elementType") == 50)
                v16 = v17;
              else
                v16 = 0;

              if (v16)
                goto LABEL_37;
LABEL_50:
              v18 = 0;
              if (!v17)
                goto LABEL_57;
LABEL_51:
              v35 = *(double *)(*(_QWORD *)(a1 + 32) + 504);
              objc_msgSend((id)objc_opt_class(), "_elementSpacingForViewElement:", v14);
              if (v35 >= v36)
                v36 = v35;
              *(double *)(*(_QWORD *)(a1 + 32) + 504) = v36;
              if (v18)
              {
                v37 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
                if (!v37)
                {
                  v38 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
                  v39 = *(_QWORD *)(a1 + 32);
                  v40 = *(void **)(v39 + 432);
                  *(_QWORD *)(v39 + 432) = v38;

                  v37 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
                }
                objc_msgSend(v37, "addObject:", v17);
              }
LABEL_57:

            }
            v11 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          }
          while (v11);
        }

        v8 = v44 + 1;
      }
      while (v44 + 1 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v43);
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
    -[SUUIHorizontalListView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t j;
  id v28;
  id v29;
  NSMapTable *obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v8 = a4;
  v9 = a5;
  v28 = v8;
  v31 = objc_msgSend(v8, "requestIdentifier");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "requestIdentifierForResourceCacheKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "unsignedIntegerValue") == v31)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "imageView");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setImage:", v29);

          }
          else
          {
            objc_msgSend(v15, "setImage:", v29);
          }
          v12 = 1;
        }

      }
      v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = self->_artworkRequestPassthroughViews;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    v25 = v28;
    v24 = v29;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        v12 |= objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "setImage:forArtworkRequest:context:", v29, v28, v9);
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v22);
  }
  else
  {
    v25 = v28;
    v24 = v29;
  }

  return v12 & 1;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  -[SUUIViewElement flattenedChildren](self->_listElement, "flattenedChildren");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__21;
  v19 = __Block_byref_object_dispose__21;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__SUUIHorizontalListView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_2511F5A20;
  v7 = v4;
  v12 = v7;
  v8 = v6;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __51__SUUIHorizontalListView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "itmlID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (v7)
  {
    objc_msgSend(v21, "itmlID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32)))
    {

    }
    else
    {
      objc_msgSend(v21, "elementID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32));

      v8 = v21;
      if (!v11)
        goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      objc_msgSend(v13, "imageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v13, "imageView");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

      }
    }
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(_QWORD *)(v18 + 40);
    v19 = (id *)(v18 + 40);
    if (v20 || (objc_storeStrong(v19, v12), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
      *a4 = 1;

    v8 = v21;
  }
LABEL_13:

}

- (CGRect)hitRect
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  objc_super v14;
  CGRect result;

  if (self->_useBigHitTarget)
  {
    v14.receiver = self;
    v14.super_class = (Class)SUUIHorizontalListView;
    -[SUUIHorizontalListView hitRect](&v14, sel_hitRect);
    top = self->_bigHitInsets.top;
    left = self->_bigHitInsets.left;
    v6 = v5 + left;
    v8 = v7 + top;
    v10 = v9 - (left + self->_bigHitInsets.right);
    v12 = v11 - (top + self->_bigHitInsets.bottom);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIHorizontalListView;
    -[SUUIHorizontalListView hitRect](&v13, sel_hitRect);
  }
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double top;
  double left;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double width;
  double height;
  CGFloat v36;
  BOOL v37;
  double v38;
  double v39;
  float v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  double MaxX;
  void *v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  void *v53;
  unint64_t v54;
  double v55;
  float v56;
  double v57;
  NSArray *obj;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v88 = *MEMORY[0x24BDAC8D0];
  v84.receiver = self;
  v84.super_class = (Class)SUUIHorizontalListView;
  -[SUUIHorizontalListView layoutSubviews](&v84, sel_layoutSubviews);
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIListViewElement style](self->_listElement, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v4, "elementAlignment");

  -[SUUIHorizontalListView bounds](self, "bounds");
  v69 = v6;
  v70 = v5;
  v71 = v7;
  v68 = v8;
  top = self->_contentInset.top;
  left = self->_contentInset.left;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = self->_lines;
  v63 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (v63)
  {
    v11 = 0;
    v61 = *(_QWORD *)v81;
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(_QWORD *)(MEMORY[0x24BDBF090] + 8);
    v66 = *(double *)(MEMORY[0x24BDBF028] + 24);
    v67 = *(double *)(MEMORY[0x24BDBF028] + 16);
    v59 = v13;
    v60 = *MEMORY[0x24BDBF090];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v81 != v61)
          objc_enumerationMutation(obj);
        v65 = v14;
        v15 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v14);
        v64 = objc_msgSend(v15, "count");
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
        if (v17)
        {
          v18 = v17;
          v19 = 0;
          v20 = *(_QWORD *)v77;
          v21 = 0.0;
          v22 = 0.0;
          v23 = v11;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v77 != v20)
                objc_enumerationMutation(v16);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "elementType") == 127)
              {
                ++v19;
              }
              else
              {
                objc_msgSend(v3, "objectAtIndex:", v23);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "sizeThatFits:", v67, v66);
                v27 = v26;
                v29 = v28;
                -[SUUIHorizontalListView bounds](self, "bounds");
                if (v27 < v30)
                  v30 = v27;
                v31 = v12;
                v32 = v13;
                v33 = v29;
                v89 = CGRectIntegral(*(CGRect *)(&v30 - 2));
                width = v89.size.width;
                height = v89.size.height;
                objc_msgSend(v25, "setFrame:", v89.origin.x, v89.origin.y);
                if (v22 < height)
                  v22 = height;
                v21 = v21 + width;
                ++v23;

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
          }
          while (v18);
        }
        else
        {
          v19 = 0;
          v21 = 0.0;
          v22 = 0.0;
        }

        if (v64 > 1)
          v21 = v21 + self->_elementSpacing * (double)(v64 - 1);
        if (v19 < 1)
        {
          v39 = 0.0;
        }
        else
        {
          -[SUUIHorizontalListView bounds](self, "bounds");
          v36 = CGRectGetWidth(v90) - self->_contentInset.left - self->_contentInset.right - v21;
          v37 = v36 <= 0.0;
          v38 = v36 / (double)v19;
          if (v37)
            v39 = 0.0;
          else
            v39 = v38;
        }
        if (v62 == 3)
        {
          left = v71 - v21 - self->_contentInset.right;
        }
        else if (v62 == 2)
        {
          v40 = (v71 - v21) * 0.5;
          left = floorf(v40);
        }
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v41 = v16;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v73;
          do
          {
            for (j = 0; j != v43; ++j)
            {
              if (*(_QWORD *)v73 != v44)
                objc_enumerationMutation(v41);
              v46 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
              if (objc_msgSend(v46, "elementType") == 127)
              {
                MaxX = v39 + left;
              }
              else
              {
                objc_msgSend(v3, "objectAtIndex:", v11);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "frame");
                v50 = v49;
                v52 = v51;
                objc_msgSend(v46, "style");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = objc_msgSend(v53, "elementPosition");

                v55 = top;
                if (v54 <= 9)
                {
                  if (((1 << v54) & 0x33) != 0)
                  {
                    v56 = top + (v22 - v52) * 0.5;
                    v55 = roundf(v56);
                  }
                  else
                  {
                    v55 = top;
                    if (((1 << v54) & 0x308) != 0)
                      v55 = top + v22 - v52;
                  }
                }
                objc_msgSend(v48, "setFrame:", SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(left, v55, v50, v52, v70, v69, v71, v68));
                v91.origin.x = left;
                v91.origin.y = v55;
                v91.size.width = v50;
                v91.size.height = v52;
                MaxX = CGRectGetMaxX(v91);
                ++v11;

              }
              left = MaxX + self->_elementSpacing;
            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
          }
          while (v43);
        }

        left = self->_contentInset.left;
        objc_msgSend((id)objc_opt_class(), "_lineSpacingForLineElements:", v41);
        top = top + v22 + v57;
        v14 = v65 + 1;
        v13 = v59;
        v12 = v60;
      }
      while (v65 + 1 != v63);
      v63 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    }
    while (v63);
  }

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  objc_super v7;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  if (self->_useBigHitTarget)
  {
    -[SUUIHorizontalListView hitRect](self, "hitRect", a4);
    v8.x = x;
    v8.y = y;
    return CGRectContainsPoint(v9, v8);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIHorizontalListView;
    return -[SUUIHorizontalListView pointInside:withEvent:](&v7, sel_pointInside_withEvent_, a4, a3.x, a3.y);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t i;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  SUUIHorizontalListView *v40;
  NSArray *obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;
  CGSize result;

  width = a3.width;
  v58 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_class();
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v40 = self;
  obj = self->_lines;
  v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  v7 = 0;
  v8 = 0;
  if (v43)
  {
    v9 = 0;
    v42 = *(_QWORD *)v53;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v53 != v42)
          objc_enumerationMutation(obj);
        v45 = v11;
        v46 = v8;
        v47 = v13;
        v44 = v14;
        v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v14);
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v49;
          v20 = 0.0;
          v21 = 0.0;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v49 != v19)
                objc_enumerationMutation(v16);
              v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              if (objc_msgSend(v23, "elementType", v40) == 127)
              {
                v7 = 1;
              }
              else
              {
                objc_msgSend(v6, "objectAtIndex:", v9);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "sizeThatFits:", width, 1.79769313e308);
                v26 = v25;
                v28 = v27;
                objc_msgSend(v5, "_elementSpacingForViewElement:", v23);
                if (v12 < v29)
                  v12 = v29;
                if (v21 < v28)
                  v21 = v28;
                v20 = v20 + v26;
                ++v9;

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          }
          while (v18);
        }
        else
        {
          v20 = 0.0;
          v21 = 0.0;
        }

        v13 = v47 + v45 + v21;
        objc_msgSend(v5, "_lineSpacingForLineElements:", v16);
        v11 = v30;
        v31 = objc_msgSend(v16, "count");
        v8 = v46;
        if (v31 > v46)
        {
          v10 = v20;
          v8 = v31;
        }
        v14 = v44 + 1;
      }
      while (v44 + 1 != v43);
      v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v43);
  }
  else
  {
    v10 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
  }

  v32 = v10 + (double)(v8 - 1) * v12;
  if (v8 <= 1)
    v32 = v10;
  if ((v7 & (v32 < width)) != 0)
    v32 = width;
  if (width >= v32)
    width = v32;
  -[SUUIListViewElement style](v40->_listElement, "style", v40);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "elementPadding");
  v35 = v34;
  v37 = v36;

  v38 = v13 + v35 + v37;
  v39 = width;
  result.height = v38;
  result.width = v39;
  return result;
}

- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
  id v6;

  if (self->_focusedMenuButton)
  {
    -[SUUIHorizontalListView _viewElementForView:](self, "_viewElementForView:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dispatchEventOfType:forItemAtIndex:", 2, a4);
    -[SUUIHorizontalListView _destroyMenuPopover](self, "_destroyMenuPopover");

  }
}

- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  -[UIControl frame](self->_focusedMenuButton, "frame", a3, a4, a5);
  a4->origin.x = v6;
  a4->origin.y = v7;
  a4->size.width = v8;
  a4->size.height = v9;
}

- (void)_buttonAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIViewElement flattenedChildren](self->_listElement, "flattenedChildren");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v4);

  if (v7 < objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (SUUIIKViewElementTypeIsButton(objc_msgSend(v8, "elementType")))
    {
      SUUICollectionViewCellForView(self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SUUICollectionViewForView(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(v10, "indexPathForCell:", v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v10, v8, 0, v20);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v9;
          v12 = v4;
          v13 = (void *)MEMORY[0x24BDBCED8];
          v22[0] = CFSTR("toggled");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "isToggled"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = v14;
          v23[1] = v8;
          v22[1] = CFSTR("target");
          v22[2] = CFSTR("count");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "count"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v23[2] = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dictionaryWithDictionary:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "toggleItemIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v12, "toggleItemIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("toggleId"));

          }
          v9 = v21;
        }
        else
        {
          v17 = 0;
        }
        objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, v17, 0, v21);

      }
    }

  }
}

- (void)_imageTapAction:(id)a3
{
  SUUIListViewElement *listElement;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;

  listElement = self->_listElement;
  v5 = a3;
  -[SUUIViewElement flattenedChildren](listElement, "flattenedChildren");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v7);
  if (v8 < objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

  }
}

- (void)_menuButtonAction:(id)a3
{
  SUUIMenuPopoverController *popoverController;
  UIControl *focusedMenuButton;
  SUUIMenuPopoverController *v7;
  void *v8;
  UIControl **p_focusedMenuButton;
  SUUIMenuPopoverController *v10;
  void *v11;
  SUUIMenuPopoverController *v12;
  SUUIMenuPopoverController *v13;
  SUUIMenuPopoverController *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  v24 = a3;
  popoverController = self->_popoverController;
  if (popoverController)
  {
    -[SUUIMenuPopoverController setDelegate:](popoverController, "setDelegate:", 0);
    -[SUUIMenuPopoverController dismissAnimated:](self->_popoverController, "dismissAnimated:", 1);
    focusedMenuButton = self->_focusedMenuButton;
    self->_focusedMenuButton = 0;

    v7 = self->_popoverController;
    self->_popoverController = 0;

  }
  -[SUUIHorizontalListView _viewElementForView:](self, "_viewElementForView:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    p_focusedMenuButton = &self->_focusedMenuButton;
    objc_storeStrong((id *)&self->_focusedMenuButton, a3);
    v10 = [SUUIMenuPopoverController alloc];
    objc_msgSend(v8, "menuItemTitles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SUUIMenuPopoverController initWithMenuTitles:selectedIndex:](v10, "initWithMenuTitles:selectedIndex:", v11, objc_msgSend(v8, "selectedItemIndex"));
    v13 = self->_popoverController;
    self->_popoverController = v12;

    -[SUUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", self);
    v14 = self->_popoverController;
    -[UIControl frame](*p_focusedMenuButton, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[UIControl superview](*p_focusedMenuButton, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMenuPopoverController presentFromRect:inView:permittedArrowDirections:animated:](v14, "presentFromRect:inView:permittedArrowDirections:animated:", v23, 15, 1, v16, v18, v20, v22);

  }
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "buttonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "buttonViewType");
  objc_msgSend(v6, "buttonTitleStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "_attributedStringForButtonText:type:style:context:", v8, v9, v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_attributedStringForButtonText:type:style:context:", v8, v9, v12, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)_attributedStringForButtonText:(id)a3 type:(int64_t)a4 style:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  SUUIViewElementFontWithStyle(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (a4)
      v13 = 5;
    else
      v13 = 1;
    SUUIFontPreferredFontForTextStyle(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "attributedStringWithDefaultFont:foregroundColor:style:", v12, v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
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
    SUUIFontPreferredFontForTextStyle(5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_attributedStringForMenuItem:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "itemText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_attributedStringForButtonText:type:style:context:", v8, 0, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (double)_elementSpacingForViewElement:(id)a3
{
  uint64_t v3;
  double result;
  char v5;

  v3 = objc_msgSend(a3, "elementType");
  result = 5.0;
  v5 = v3 - 8;
  if ((unint64_t)(v3 - 8) <= 0x3A)
  {
    if (((1 << v5) & 0x40000000030) != 0)
      return 20.0;
    if (((1 << v5) & 0x20000000001) != 0)
      return result;
    if (v3 == 66)
      return 10.0;
  }
  if (v3 == 152)
    return result;
  if (v3 == 141)
    return 20.0;
  return 8.0;
}

+ (double)_lineSpacingForLineElements:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "_lineSpacingForViewElement:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        if (v8 < v10)
          v8 = v10;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

+ (double)_lineSpacingForViewElement:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "elementType");
  if (v4 == 66)
  {
    objc_msgSend(v3, "firstChildForElementType:", 138);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v6 = 15.0;
    else
      v6 = 10.0;

  }
  else
  {
    v5 = 0.0;
    if (v4 == 8)
      v5 = 5.0;
    if (v4 == 49)
      v6 = 5.0;
    else
      v6 = v5;
  }

  return v6;
}

+ (id)_linesWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  SUUIViewElementHorizontalLayout *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  double v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(SUUIViewElementHorizontalLayout);
  -[SUUIViewElementHorizontalLayout setLayoutWidth:](v10, "setLayoutWidth:", a4);
  objc_msgSend(v8, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementHorizontalLayout setMaximumElementsPerLine:](v10, "setMaximumElementsPerLine:", objc_msgSend(v11, "columnCount"));
  -[SUUIViewElementHorizontalLayout setMaximumLines:](v10, "setMaximumLines:", objc_msgSend(v11, "maxTextLines"));
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x2020000000;
  v29 = 0;
  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __62__SUUIHorizontalListView__linesWithViewElement_width_context___block_invoke;
  v22[3] = &unk_2511F6388;
  v24 = &v26;
  v25 = a1;
  v14 = v12;
  v23 = v14;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v22);
  -[SUUIViewElementHorizontalLayout setElementSpacing:](v10, "setElementSpacing:", v27[3]);
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __62__SUUIHorizontalListView__linesWithViewElement_width_context___block_invoke_2;
  v18[3] = &unk_2511F6EF0;
  v20 = a1;
  v21 = a4;
  v15 = v9;
  v19 = v15;
  -[SUUIViewElementHorizontalLayout layoutViewElements:usingSizingBlock:](v10, "layoutViewElements:usingSizingBlock:", v14, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __62__SUUIHorizontalListView__linesWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 48);
  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = a2;
  objc_msgSend(v3, "_elementSpacingForViewElement:", v6);
  if (v4 >= v5)
    v5 = v4;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

uint64_t __62__SUUIHorizontalListView__linesWithViewElement_width_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_sizeForViewElement:width:context:", a2, *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
}

+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "elementType") == 66)
  {
    +[SUUIVerticalLockupView sizeThatFitsWidth:viewElement:context:](SUUIVerticalLockupView, "sizeThatFitsWidth:viewElement:context:", v7, v8, a4);
    v10 = v9;
    v12 = v11;
    objc_msgSend(v7, "firstChildForElementType:", 49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v8, "sizeForViewElement:width:", v13, a4);
      v10 = v14;
    }

  }
  else
  {
    objc_msgSend(v8, "sizeForViewElement:width:", v7, a4);
    v10 = v15;
    v12 = v16;
  }

  v17 = v10;
  v18 = v12;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)_destroyMenuPopover
{
  UIControl *focusedMenuButton;
  SUUIMenuPopoverController *popoverController;

  -[SUUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  focusedMenuButton = self->_focusedMenuButton;
  self->_focusedMenuButton = 0;

  popoverController = self->_popoverController;
  self->_popoverController = 0;

}

- (id)_viewElementForView:(id)a3
{
  SUUIListViewElement *listElement;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  listElement = self->_listElement;
  v5 = a3;
  -[SUUIViewElement flattenedChildren](listElement, "flattenedChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v5);

  if (v8 >= objc_msgSend(v6, "count"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_listElement, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_focusedMenuButton, 0);
  objc_storeStrong((id *)&self->_artworkRequestPassthroughViews, 0);
}

@end

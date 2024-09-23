@implementation SUUIStackItemView

- (unint64_t)numberOfLines
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SUUIStackItemView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfLines");

  return v4;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(a3, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v8);
        v11 |= objc_msgSend(v7, "prefetchResourcesForViewElement:reason:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), a4);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11 & 1;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v8 = a3;
  objc_msgSend(v12, "labelLayoutCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "_attributedStringForLabel:context:", v10, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestLayoutForLabel:attributedString:width:", v10, v11, (uint64_t)a4);

  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:numberOfLines:", a4, a5, 0, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5 numberOfLines:(unint64_t *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD v27[5];
  uint64_t v28;
  double *v29;
  uint64_t v30;
  const char *v31;
  __int128 v32;
  CGSize result;

  v10 = a4;
  v11 = a5;
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x3010000000;
  v31 = "";
  v32 = *MEMORY[0x24BDBF148];
  objc_msgSend(v10, "imageElements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __73__SUUIStackItemView_sizeThatFitsWidth_viewElement_context_numberOfLines___block_invoke;
  v27[3] = &unk_2511F6FD0;
  v27[4] = &v28;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v27);

  v29[4] = v29[4] + -4.0;
  objc_msgSend(v10, "textElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = v29[4] + 7.0;
    v29[4] = v14;
    objc_msgSend(a1, "_attributedStringForLabel:context:", v13, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_textViewLayoutWithWidth:string:", v15, a3 - v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v29[4];
    objc_msgSend(v16, "boundingSize");
    v19 = v29;
    v29[4] = v17 + v18;
    v20 = v19[5];
    objc_msgSend(v16, "boundingSize");
    if (v20 >= v21)
      v22 = v20;
    else
      v22 = v21;
    v29[5] = v22;
    if (a6)
      *a6 = objc_msgSend(v16, "numberOfLines");

  }
  v23 = v29[4];
  v24 = v29[5];

  _Block_object_dispose(&v28, 8);
  v25 = v23;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

void __73__SUUIStackItemView_sizeThatFitsWidth_viewElement_context_numberOfLines___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a2;
  objc_msgSend(v3, "size");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v4 + 4.0;
  v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v3, "size");
  v7 = v6;

  if (v5 >= v7)
    v8 = v5;
  else
    v8 = v7;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v8;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SUUIStackItemView *v15;
  id v16;
  double v17;

  v8 = a3;
  v9 = a5;
  -[SUUIStackItemView imageViewToImageResourceCacheKey](self, "imageViewToImageResourceCacheKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__SUUIStackItemView_reloadWithViewElement_width_context___block_invoke;
  v13[3] = &unk_2511F4AC8;
  v14 = v8;
  v15 = self;
  v17 = a4;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  -[SUUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v13);
  -[SUUIStackItemView setViewElement:](self, "setViewElement:", v12);
  -[SUUIStackItemView setLastContext:](self, "setLastContext:", v11);

}

void __57__SUUIStackItemView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "textElement");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "addLabelViewWithElement:width:context:", v10, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setTextView:", v5);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "imageElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__SUUIStackItemView_reloadWithViewElement_width_context___block_invoke_2;
  v11[3] = &unk_2511F6FF8;
  v12 = v3;
  v13 = *(id *)(a1 + 48);
  v14 = v6;
  v15 = *(_QWORD *)(a1 + 40);
  v8 = v6;
  v9 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  objc_msgSend(*(id *)(a1 + 40), "setImageViews:", v8);
}

void __57__SUUIStackItemView_reloadWithViewElement_width_context___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a1[4], "addImageViewWithElement:context:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1[6], "addObject:", v3);
    objc_msgSend(a1[5], "imageResourceCacheKeyForViewElement:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1[7], "imageViewToImageResourceCacheKey");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
        objc_msgSend(a1[7], "setImageViewToImageResourceCacheKey:", v6);

      }
      objc_msgSend(a1[7], "imageViewToImageResourceCacheKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v4, v3);

    }
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a4, "requestIdentifier");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[SUUIStackItemView imageViewToImageResourceCacheKey](self, "imageViewToImageResourceCacheKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v23 = v8;
    v14 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[SUUIStackItemView imageViewToImageResourceCacheKey](self, "imageViewToImageResourceCacheKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "requestIdentifierForResourceCacheKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19 && objc_msgSend(v19, "unsignedIntegerValue") == v10)
        {
          v8 = v23;
          objc_msgSend(v16, "setImage:", v23);

          v21 = 1;
          goto LABEL_13;
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
        continue;
      break;
    }
    v21 = 0;
    v8 = v23;
  }
  else
  {
    v21 = 0;
  }
LABEL_13:

  return v21;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  double MinX;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double MaxX;
  double v29;
  double v30;
  double v31;
  _QWORD v32[6];
  uint64_t v33;
  double *v34;
  uint64_t v35;
  const char *v36;
  double v37;
  uint64_t v38;
  CGSize result;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  width = a3.width;
  -[SUUIStackItemView contentInset](self, "contentInset", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x3010000000;
  v36 = "";
  v37 = v5;
  v38 = v11;
  -[SUUIStackItemView imageViews](self, "imageViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __34__SUUIStackItemView_sizeThatFits___block_invoke;
  v32[3] = &unk_2511F7020;
  v32[4] = &v33;
  *(double *)&v32[5] = width - v6 - v10;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v32);

  v40.size.width = *(CGFloat *)(MEMORY[0x24BDBF090] + 16);
  v40.size.height = *(CGFloat *)(MEMORY[0x24BDBF090] + 24);
  v13 = v34[5];
  v14 = v34[4] + -4.0 + 7.0;
  v40.origin.x = v14;
  v40.origin.y = v13;
  MinX = CGRectGetMinX(v40);
  v16 = (void *)objc_opt_class();
  -[SUUIStackItemView textView](self, "textView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "attributedString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = width - MinX - v10;
  objc_msgSend(v16, "_textViewLayoutWithWidth:string:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStackItemView textView](self, "textView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLayout:", v21);

  -[SUUIStackItemView textView](self, "textView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sizeThatFits:", v20, 1.79769313e308);
  v25 = v24;
  v27 = v26;

  v41.origin.x = v14;
  v41.origin.y = v13;
  v41.size.width = v25;
  v41.size.height = v27;
  MaxX = CGRectGetMaxX(v41);
  v42.origin.x = v14;
  v42.origin.y = v13;
  v42.size.width = v25;
  v42.size.height = v27;
  v29 = v8 + CGRectGetMaxY(v42);
  _Block_object_dispose(&v33, 8);
  v30 = v10 + MaxX;
  v31 = v29;
  result.height = v31;
  result.width = v30;
  return result;
}

CGFloat __34__SUUIStackItemView_sizeThatFits___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat result;
  CGRect v9;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(double *)(v3 + 32);
  v5 = *(double *)(v3 + 40);
  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 40) - v4, 1.79769313e308);
  v9.size.width = v6;
  v9.size.height = v7;
  v9.origin.x = v4;
  v9.origin.y = v5;
  result = CGRectGetMaxX(v9) + 4.0;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = result;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double Width;
  void *v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double Height;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CGFloat MidY;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  _QWORD v47[5];
  _QWORD v48[6];
  uint64_t v49;
  double *v50;
  uint64_t v51;
  const char *v52;
  double v53;
  double v54;
  objc_super v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v55.receiver = self;
  v55.super_class = (Class)SUUIStackItemView;
  -[SUUIStackItemView layoutSubviews](&v55, sel_layoutSubviews);
  -[SUUIStackItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUIStackItemView contentInset](self, "contentInset");
  v12 = v11;
  v14 = v13;
  v45 = v15;
  v17 = v16;
  v56.origin.x = v4;
  v56.origin.y = v6;
  v56.size.width = v8;
  v56.size.height = v10;
  Width = CGRectGetWidth(v56);
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x3010000000;
  v52 = "";
  v53 = v14;
  v54 = v12;
  v46 = v12;
  -[SUUIStackItemView imageViews](self, "imageViews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = Width - v14 - v17;
  v21 = MEMORY[0x24BDAC760];
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __35__SUUIStackItemView_layoutSubviews__block_invoke;
  v48[3] = &unk_2511F7020;
  v48[4] = &v49;
  *(double *)&v48[5] = v20;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v48);

  v22 = v50[4];
  v23 = v50[5];
  v57.origin.x = v4;
  v57.origin.y = v6;
  v57.size.width = v8;
  v57.size.height = v10;
  Height = CGRectGetHeight(v57);
  v25 = (void *)objc_opt_class();
  v26 = v22 + -4.0 + 7.0;
  v27 = v20 - v22;
  v28 = Height - v46 - v45;
  v58.origin.x = v26;
  v58.origin.y = v23;
  v58.size.width = v20 - v22;
  v58.size.height = v28;
  v29 = CGRectGetWidth(v58);
  -[SUUIStackItemView textView](self, "textView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layout");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "attributedString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_textViewLayoutWithWidth:string:", v32, v29);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStackItemView textView](self, "textView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setLayout:", v33);

  if (-[SUUIStackItemView numberOfLines](self, "numberOfLines") < 2)
  {
    -[SUUIStackItemView textView](self, "textView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layout");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "boundingSize");
    v40 = v39;

    -[SUUIStackItemView textView](self, "textView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layout");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "boundingSize");
    v43 = v42;
    v23 = (v28 - v40) * 0.5;

    v28 = v43;
  }
  else
  {
    v59.origin.x = v22 + -4.0 + 7.0;
    v59.origin.y = v23;
    v59.size.width = v20 - v22;
    v59.size.height = v28;
    MidY = CGRectGetMidY(v59);
    -[SUUIStackItemView imageViews](self, "imageViews");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v21;
    v47[1] = 3221225472;
    v47[2] = __35__SUUIStackItemView_layoutSubviews__block_invoke_2;
    v47[3] = &__block_descriptor_40_e23_v32__0__UIView_8Q16_B24l;
    *(CGFloat *)&v47[4] = MidY;
    objc_msgSend(v36, "enumerateObjectsUsingBlock:", v47);
  }

  -[SUUIStackItemView textView](self, "textView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v60.origin.x = v26;
  v60.origin.y = v23;
  v60.size.width = v27;
  v60.size.height = v28;
  v61 = CGRectIntegral(v60);
  objc_msgSend(v44, "setFrame:", v61.origin.x, v61.origin.y, v61.size.width, v61.size.height);

  _Block_object_dispose(&v49, 8);
}

CGFloat __35__SUUIStackItemView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat result;
  CGRect v13;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(double *)(v3 + 32);
  v5 = *(double *)(v3 + 40);
  v6 = *(double *)(a1 + 40) - v4;
  v7 = a2;
  objc_msgSend(v7, "sizeThatFits:", v6, 1.79769313e308);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "setFrame:", v4, v5, v8, v10);

  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v9;
  v13.size.height = v11;
  result = CGRectGetMaxX(v13) + 4.0;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = result;
  return result;
}

void __35__SUUIStackItemView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v13 = a2;
  objc_msgSend(v13, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(double *)(a1 + 32);
  objc_msgSend(v13, "frame");
  v12 = v11 - CGRectGetMidY(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  v16 = CGRectOffset(v15, 0.0, v12);
  objc_msgSend(v13, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);

}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;

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
    v11 = objc_msgSend(v5, "labelViewStyle") == 5;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, dbl_241EFBE70[v11]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v10, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_textViewLayoutWithWidth:(double)a3 string:(id)a4
{
  void *v5;
  id v6;
  SUUIAttributedStringLayoutRequest *v7;
  SUUIAttributedStringLayout *v8;

  v5 = (void *)objc_msgSend(a4, "mutableCopy");
  v6 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v6, "setLineSpacing:", -2.0);
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x24BEBB3A8], v6, 0, objc_msgSend(v5, "length"));
  v7 = -[SUUIAttributedStringLayoutRequest initWithAttributedString:]([SUUIAttributedStringLayoutRequest alloc], "initWithAttributedString:", v5);
  -[SUUIAttributedStringLayoutRequest setWidth:](v7, "setWidth:", a3);
  v8 = -[SUUIAttributedStringLayout initWithLayoutRequest:]([SUUIAttributedStringLayout alloc], "initWithLayoutRequest:", v7);

  return v8;
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

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (SUUIStackItemViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (SUUIViewElementLayoutContext)lastContext
{
  return self->_lastContext;
}

- (void)setLastContext:(id)a3
{
  objc_storeStrong((id *)&self->_lastContext, a3);
}

- (SUUIAttributedStringView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSMapTable)imageViewToImageResourceCacheKey
{
  return self->_imageViewToImageResourceCacheKey;
}

- (void)setImageViewToImageResourceCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_lastContext, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end

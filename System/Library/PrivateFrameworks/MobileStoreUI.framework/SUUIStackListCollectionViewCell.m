@implementation SUUIStackListCollectionViewCell

- (SUUIStackListCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIStackListCollectionViewCell *v3;
  uint64_t v4;
  NSMapTable *listViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIStackListCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    listViews = v3->_listViews;
    v3->_listViews = (NSMapTable *)v4;

  }
  return v3;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SUUIStackListCollectionViewCell *v17;
  double v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStackListCollectionViewCell setAlignment:](self, "setAlignment:", objc_msgSend(v10, "elementAlignment"));

  -[SUUIStackListCollectionViewCell listViews](self, "listViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__SUUIStackListCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v14[3] = &unk_2511F4AC8;
  v18 = a4;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v12 = v9;
  v13 = v8;
  -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v14);

}

void __71__SUUIStackListCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "elementType") == 59)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v3, "addStackItemViewWithElement:width:context:", v9, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
            v10 = objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              v11 = (void *)v10;
              objc_msgSend(*(id *)(a1 + 48), "listViews");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKey:", v9, v11);

            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

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
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(a3, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "elementType") == 59)
          +[SUUIStackItemView requestLayoutForViewElement:width:context:](SUUIStackItemView, "requestLayoutForViewElement:width:context:", v13, v7, a4);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  double MaxY;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  uint64_t i;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  double v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double MaxX;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  unint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;
  CGSize result;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v68 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a5;
  v9 = *MEMORY[0x24BDBF148];
  MaxY = *(double *)(MEMORY[0x24BDBF148] + 8);
  objc_msgSend(v6, "children");
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v62;
    v14 = 0.0;
    v15 = MaxY;
    v16 = v9;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v62 != v13)
          objc_enumerationMutation(v10);
        v18 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SUUIStackItemView sizeThatFitsWidth:viewElement:context:numberOfLines:](SUUIStackItemView, "sizeThatFitsWidth:viewElement:context:numberOfLines:", v18, v7, 0, a3);
          v21 = v14 + 17.0;
          if (v14 <= 0.0)
            v21 = v14;
          v14 = v21 + v19;
          if (v21 + v19 > a3)
          {

            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v23 = v10;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
            if (v24)
            {
              v25 = v24;
              v26 = a3 * 0.5 + -8.5;
              v27 = floorf(v26);
              v28 = *(_QWORD *)v58;
              while (2)
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v58 != v28)
                    objc_enumerationMutation(v23);
                  v30 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v56 = 0;
                    +[SUUIStackItemView sizeThatFitsWidth:viewElement:context:numberOfLines:](SUUIStackItemView, "sizeThatFitsWidth:viewElement:context:numberOfLines:", v30, v7, &v56, v27);
                    if (MaxY < v31)
                      MaxY = v31;
                    if (v56 > 2)
                    {

                      v33 = *MEMORY[0x24BDBF090];
                      v32 = *(double *)(MEMORY[0x24BDBF090] + 8);
                      v34 = *(double *)(MEMORY[0x24BDBF090] + 16);
                      v35 = *(double *)(MEMORY[0x24BDBF090] + 24);
                      v54 = 0u;
                      v55 = 0u;
                      v52 = 0u;
                      v53 = 0u;
                      v36 = v23;
                      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
                      if (v37)
                      {
                        v38 = v37;
                        v39 = *(_QWORD *)v53;
                        do
                        {
                          for (k = 0; k != v38; ++k)
                          {
                            if (*(_QWORD *)v53 != v39)
                              objc_enumerationMutation(v36);
                            v41 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * k);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              +[SUUIStackItemView sizeThatFitsWidth:viewElement:context:numberOfLines:](SUUIStackItemView, "sizeThatFitsWidth:viewElement:context:numberOfLines:", v41, v7, 0, a3);
                              v44 = v43;
                              if (v42 >= 16.0)
                                v45 = v42;
                              else
                                v45 = 16.0;
                              v70.origin.x = v33;
                              v70.origin.y = v32;
                              v70.size.width = v34;
                              v70.size.height = v35;
                              if (v44 + CGRectGetMaxX(v70) <= a3)
                              {
                                v33 = v33 + v44;
                              }
                              else
                              {
                                v71.origin.x = v33;
                                v71.origin.y = v32;
                                v71.size.width = v34;
                                v71.size.height = v35;
                                v32 = v32 + CGRectGetHeight(v71) + 6.0;
                                v33 = 0.0;
                              }
                              v72.origin.x = v33;
                              v72.origin.y = v32;
                              v72.size.width = v44;
                              v72.size.height = v45;
                              MaxX = CGRectGetMaxX(v72);
                              if (v9 < MaxX)
                                v9 = MaxX;
                              v34 = v44;
                              v35 = v45;
                            }
                          }
                          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
                        }
                        while (v38);
                      }

                      v73.origin.x = v33;
                      v73.origin.y = v32;
                      v73.size.width = v34;
                      v73.size.height = v35;
                      MaxY = CGRectGetMaxY(v73);
                      goto LABEL_51;
                    }
                  }
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
                if (v25)
                  continue;
                break;
              }
            }

            goto LABEL_54;
          }
          if (v20 >= 16.0)
            v22 = v20;
          else
            v22 = 16.0;
          if (v15 < v22)
            v15 = v22;
          if (v16 < v14)
            v16 = v14;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      if (v12)
        continue;
      break;
    }

    v9 = v16;
    MaxY = v15;
  }
  else
  {

  }
LABEL_51:
  objc_msgSend(v6, "style");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "elementAlignment");

  if (v48 == 3)
    MaxY = MaxY + 6.0;
  a3 = v9;
LABEL_54:

  v49 = a3;
  v50 = MaxY;
  result.height = v50;
  result.width = v49;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SUUIStackListCollectionViewCell listViews](self, "listViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "nextObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = 0;
    do
    {
      if ((v15 & 1) != 0)
        v15 = 1;
      else
        v15 = objc_msgSend(v14, "setImage:forArtworkRequest:context:", v8, v9, v10);
      objc_msgSend(v12, "nextObject");
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    while (v16);
  }
  else
  {
    v15 = 0;
  }

  return v15;
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
  double height;
  double width;
  double v6;
  double v7;
  __int128 v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v8 = *MEMORY[0x24BDBF148];
  if (!-[SUUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", &v8, 0.0, 0.0, a3.width, a3.height))
  {
    if (-[SUUIStackListCollectionViewCell layoutSubviewsWithFixedWidth:size:](self, "layoutSubviewsWithFixedWidth:size:", &v8, 0.0, 0.0, width, height))
    {
      goto LABEL_6;
    }
    -[SUUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", &v8, 0.0, 0.0, width, height);
  }
  if (-[SUUIStackListCollectionViewCell alignment](self, "alignment") == 3)
    *((double *)&v8 + 1) = *((double *)&v8 + 1) + 6.0;
LABEL_6:
  v7 = *((double *)&v8 + 1);
  v6 = *(double *)&v8;
  result.height = v7;
  result.width = v6;
  return result;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUIStackListCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[SUUIStackListCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (!-[SUUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", 0, v5, v7, v9, v11)&& !-[SUUIStackListCollectionViewCell layoutSubviewsWithFixedWidth:size:](self, "layoutSubviewsWithFixedWidth:size:", 0, v5, v7, v9, v11))
  {
    -[SUUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", 0, v5, v7, v9, v11);
  }
}

- (BOOL)layoutSubviewsWithFlowLayout:(CGRect)a3 size:(CGSize *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  CGFloat v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  _BOOL4 v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MinX;
  double v43;
  double v44;
  BOOL v45;
  _BOOL4 v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double MaxX;
  double v52;
  _BOOL4 v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat MaxY;
  CGRect v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  CGFloat rect;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v76 = *MEMORY[0x24BDAC8D0];
  -[SUUIViewReuseCollectionViewCell contentInset](self, "contentInset");
  rect = v10;
  v12 = v11;
  v14 = v13;
  v77.origin.x = x;
  v77.origin.y = y;
  v77.size.width = width;
  v77.size.height = height;
  v15 = CGRectGetWidth(v77);
  v61.origin.x = x;
  v61.origin.y = y;
  v78.origin.x = x;
  v78.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  v78.size.width = width;
  v78.size.height = height;
  v16 = CGRectGetWidth(v78);
  v18 = *MEMORY[0x24BDBF090];
  v17 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v19 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v20 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v21 = -[SUUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned");
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[SUUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  v68 = v18;
  v69 = v17;
  if (!v23)
  {
    v26 = 1;
    v27 = 0.0;
    goto LABEL_32;
  }
  v24 = v23;
  v70 = v15 - v12 - v14;
  v65 = v12;
  v62 = v16 - v14;
  v63 = v18;
  if (v21)
    v12 = v16 - v14;
  v25 = *(_QWORD *)v72;
  v26 = 1;
  v27 = 0.0;
  v28 = rect;
  v64 = v17;
  do
  {
    v29 = 0;
    v30 = v20;
    v31 = v19;
    do
    {
      v67 = v30;
      if (*(_QWORD *)v72 != v25)
        objc_enumerationMutation(v22);
      v32 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v29);
      objc_msgSend(v32, "sizeThatFits:", v70, 1.79769313e308, *(_QWORD *)&v61.origin.x, *(_QWORD *)&v61.origin.y, *(_QWORD *)&v61.size.width, *(_QWORD *)&v61.size.height);
      v19 = v33;
      v79.size.height = v34;
      v79.origin.x = v63;
      v79.origin.y = v17;
      v79.size.width = v19;
      v35 = fmax(CGRectGetHeight(v79), 16.0);
      if (-[SUUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned"))
      {
        v80.origin.x = v63;
        v80.origin.y = v17;
        v80.size.width = v19;
        v36 = v35;
        v80.size.height = v35;
        v12 = v12 - CGRectGetWidth(v80);
      }
      else
      {
        v36 = v35;
      }
      v37 = -[SUUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned");
      v38 = v12;
      v39 = v28;
      v40 = v19;
      v20 = v36;
      v41 = v36;
      if (v37)
      {
        MinX = CGRectGetMinX(*(CGRect *)&v38);
        if (MinX >= v65 + CGRectGetMinX(v61))
          goto LABEL_13;
      }
      else if (CGRectGetMaxX(*(CGRect *)&v38) <= v62)
      {
LABEL_13:
        v43 = v12;
        v44 = v12;
        goto LABEL_20;
      }
      if (v70 < v27)
        v27 = v70;
      objc_msgSend(v32, "setFrame:", v12, v28, v19, v20);
      objc_msgSend(v32, "layoutIfNeeded");
      v45 = (unint64_t)objc_msgSend(v32, "numberOfLines") > 1;
      v43 = v65;
      if (-[SUUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned"))
      {
        v81.origin.x = v12;
        v81.origin.y = rect;
        v81.size.width = v19;
        v81.size.height = v20;
        v43 = v62 - CGRectGetWidth(v81);
      }
      v26 &= v45;
      v82.origin.x = v68;
      v82.origin.y = v69;
      v82.size.width = v31;
      v82.size.height = v67;
      v28 = CGRectGetMaxY(v82) + 6.0;
      v44 = v43;
LABEL_20:
      objc_msgSend(v32, "setFrame:", v43, v28, v19, v20);
      v46 = -[SUUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned");
      v47 = v43;
      v48 = v28;
      v49 = v19;
      v50 = v20;
      if (v46)
      {
        MaxX = CGRectGetMinX(*(CGRect *)&v47);
        v52 = -17.0;
      }
      else
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v47);
        v52 = 17.0;
      }
      v12 = MaxX + v52;
      v53 = -[SUUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned");
      v68 = v44;
      v69 = v28;
      v54 = v43;
      v55 = v28;
      v56 = v19;
      v57 = v20;
      if (v53)
        v58 = v70 - CGRectGetMinX(*(CGRect *)&v54);
      else
        v58 = CGRectGetMaxX(*(CGRect *)&v54);
      if (v27 < v58)
        v27 = v58;
      ++v29;
      v30 = v20;
      v31 = v19;
      v28 = rect;
      v17 = v64;
    }
    while (v24 != v29);
    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v75, 16, v20);
  }
  while (v24);
LABEL_32:

  if (a4)
  {
    v83.origin.x = v68;
    v83.origin.y = v69;
    v83.size.width = v19;
    v83.size.height = v20;
    MaxY = CGRectGetMaxY(v83);
    a4->width = v27;
    a4->height = MaxY;
  }
  return v26 & 1;
}

- (BOOL)layoutSubviewsWithFixedWidth:(CGRect)a3 size:(CGSize *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  char v22;
  double v23;
  uint64_t i;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MaxX;
  double v31;
  CGFloat v32;
  CGFloat MaxY;
  double v35;
  double v36;
  CGRect v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v43 = *MEMORY[0x24BDAC8D0];
  -[SUUIViewReuseCollectionViewCell contentInset](self, "contentInset");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v37.origin.x = x;
  v37.origin.y = y;
  v44.origin.x = x;
  v44.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v44.size.width = width;
  v44.size.height = height;
  v38 = 0u;
  v39 = 0u;
  v36 = v15;
  v16 = CGRectGetWidth(v44) - v13 - v15;
  v40 = 0u;
  v41 = 0u;
  -[SUUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = v16 * 0.5 + -8.5;
    v35 = floorf(v20);
    v21 = *(_QWORD *)v39;
    v22 = 1;
    v23 = v13;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v17);
        v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v25, "sizeThatFits:", v35, 1.79769313e308);
        v27 = v26;
        v29 = v28;
        v45.origin.x = v23;
        v45.origin.y = v11;
        v45.size.width = v27;
        v45.size.height = v29;
        MaxX = CGRectGetMaxX(v45);
        if (MaxX <= CGRectGetMaxX(v37) - v36)
        {
          v31 = v11;
          v32 = v23;
        }
        else
        {
          v46.origin.x = v13;
          v46.origin.y = v11;
          v46.size.width = v27;
          v46.size.height = v29;
          v31 = CGRectGetMaxY(v46) + 6.0;
          v23 = v13;
          v32 = v13;
        }
        objc_msgSend(v25, "setFrame:", v23, v31, v27, v29);
        objc_msgSend(v25, "layoutIfNeeded");
        v22 &= (unint64_t)objc_msgSend(v25, "numberOfLines") < 3;
        v47.origin.x = v23;
        v47.origin.y = v31;
        v47.size.width = v27;
        v47.size.height = v29;
        v23 = CGRectGetMaxX(v47) + 17.0;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v19);
  }
  else
  {
    v32 = *MEMORY[0x24BDBF090];
    v31 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v27 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v29 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v22 = 1;
  }

  if (a4)
  {
    v48.origin.x = v32;
    v48.origin.y = v31;
    v48.size.width = v27;
    v48.size.height = v29;
    MaxY = CGRectGetMaxY(v48);
    a4->width = v16;
    a4->height = MaxY;
  }
  return v22;
}

- (BOOL)_isRightAligned
{
  return -[SUUIStackListCollectionViewCell alignment](self, "alignment") == 3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (NSMapTable)listViews
{
  return self->_listViews;
}

- (void)setListViews:(id)a3
{
  objc_storeStrong((id *)&self->_listViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listViews, 0);
}

@end

@implementation AVCustomStackLayout

- (id)itemsThatFitSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  CGFloat v13;
  CGFloat v14;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCustomStackLayout rowHeads](self, "rowHeads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__AVCustomStackLayout_itemsThatFitSize___block_invoke;
  v11[3] = &unk_1E5BB3390;
  v13 = width;
  v14 = height;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __40__AVCustomStackLayout_itemsThatFitSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v6;
  id v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  int v14;
  void *v15;
  int v16;
  char v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;

  v6 = *(double *)(a1 + 40);
  objc_msgSend(a2, "firstAttributesInPriorityOrder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v40 = v7;
    v11 = v7;
    do
    {
      v12 = objc_msgSend(v11, "canSubstituteOtherAttributes");
      if (objc_msgSend(v11, "canOnlyAppearInControlOverflowMenu"))
        v9 |= objc_msgSend(v11, "isIncluded");
      if (objc_msgSend(v11, "canOverflowToAuxiliaryMenu"))
        v10 |= objc_msgSend(v11, "isIncluded");
      v8 |= v12;
      objc_msgSend(v11, "nextAttributesInLayoutOrder");
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    while (v13);
    v14 = v8 & (v9 | v10);
    v15 = v40;
    while (1)
    {
      if (*a4)
      {
LABEL_32:

        return;
      }
      v41 = v15;
      if ((objc_msgSend(v15, "canSubstituteOtherAttributes") & v14 & 1) != 0)
      {
        v16 = 1;
        if ((v14 & 1) == 0)
          goto LABEL_15;
      }
      else if ((objc_msgSend(v41, "canSubstituteOtherAttributes") & 1) != 0)
      {
        v16 = 0;
        if ((v14 & 1) == 0)
          goto LABEL_15;
      }
      else
      {
        v16 = objc_msgSend(v41, "isIncluded");
        if ((v14 & 1) == 0)
        {
LABEL_15:
          v17 = 0;
          if (!v16)
            goto LABEL_31;
          goto LABEL_20;
        }
      }
      if ((objc_msgSend(v41, "canOverflowToAuxiliaryMenu") & 1) != 0)
        goto LABEL_31;
      v17 = objc_msgSend(v41, "canOnlyAppearInControlOverflowMenu");
      if (!v16)
        goto LABEL_31;
LABEL_20:
      if ((v17 & 1) == 0
        && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v41) & 1) == 0
        && (objc_msgSend(v41, "canOnlyAppearInControlOverflowMenu") & 1) == 0)
      {
        objc_msgSend(v41, "minimumSize");
        v19 = v18;
        objc_msgSend(v41, "trailingInterItemSpace");
        v21 = v19 + v20;
        objc_msgSend(v41, "displayPartnerAttributes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v41, "displayPartnerAttributes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "minimumSize");
          v25 = v24;

          objc_msgSend(v41, "displayPartnerAttributes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "trailingInterItemSpace");
          v21 = v21 + v25 + v27;

        }
        else
        {
          v25 = 0.0;
        }
        v28 = v21 + -0.00000011920929;
        if (v21 + -0.00000011920929 > v6)
        {
          objc_msgSend(v41, "displayPartnerAttributes", v28);
          v33 = objc_claimAutoreleasedReturnValue();
          if (v33
            && (v34 = (void *)v33,
                objc_msgSend(v41, "trailingInterItemSpace"),
                v36 = v25 + v19 + v35,
                v34,
                v36 <= v6))
          {
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v41);
            v38 = *(void **)(a1 + 32);
            objc_msgSend(v41, "displayPartnerAttributes");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObject:", v39);

          }
          else
          {
            objc_msgSend(v41, "displayPartnerAttributes");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v37 && v19 <= v6)
              objc_msgSend(*(id *)(a1 + 32), "addObject:", v41);
          }
          *a4 = 1;
          v15 = v41;
          goto LABEL_32;
        }
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v41, v28);
        objc_msgSend(v41, "displayPartnerAttributes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v30 = *(void **)(a1 + 32);
          objc_msgSend(v41, "displayPartnerAttributes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v31);

        }
        v6 = v6 - v21;
      }
LABEL_31:
      objc_msgSend(v41, "nextAttributesInPriorityOrder");
      v32 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v32;
      if (!v32)
        goto LABEL_32;
    }
  }
}

void __50__AVCustomStackLayout_layoutFramesInBoundingSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  float v38;
  id v39;

  objc_msgSend(a2, "firstAttributesInLayoutOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_heightForRow:startingFrom:inBoundingSize:", a3, v5, *(double *)(a1 + 64), *(double *)(a1 + 72) - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v7 = v6;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);
  objc_msgSend(*(id *)(a1 + 32), "rowSpacing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v38 = v10;

  objc_msgSend(*(id *)(a1 + 32), "_lastVisibleLayoutItemAttributesFrom:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_flexibleWidthMapForLayoutItemsBeginningWithLayoutItem:endingWithItem:withAvailableSize:", v5, v11, *(double *)(a1 + 64), *(double *)(a1 + 72));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v5;
  if (v39)
  {
    v13 = 0.0;
    v14 = 0.0;
    v15 = v39;
    do
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      objc_msgSend(v15, "trailingInterItemSpace");
      v20 = v19;
      v21 = objc_msgSend(v15, "hasFlexibleContentSize");
      objc_msgSend(v15, "minimumSize");
      if (v18 >= v22)
        v23 = v18;
      else
        v23 = v22;
      if (v21)
        v24 = v23;
      else
        v24 = v22;
      v25 = v7;
      if (*(_QWORD *)(a1 + 80) == 1)
      {
        objc_msgSend(v15, "minimumSize");
        v25 = v26;
      }
      v27 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      objc_msgSend(v15, "minimumSize");
      if (*(_QWORD *)(a1 + 80) == 1)
        v29 = (v7 + v27) * 0.5 - v28 * 0.5;
      else
        v29 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v30 = objc_msgSend(v15, "isCollapsedOrExcluded");
      v31 = -0.0;
      if (v15 == v11)
        v32 = -0.0;
      else
        v32 = v20;
      v33 = v32 + v24;
      if (v30)
        v34 = v14;
      else
        v34 = v33;
      if (!v30)
        v31 = v14;
      v13 = v13 + v31;
      v35 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v13, v29, v24, v25);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v36);

      objc_msgSend(v15, "nextAttributesInLayoutOrder");
      v37 = objc_claimAutoreleasedReturnValue();

      v14 = v34;
      v15 = (void *)v37;
    }
    while (v37);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + v38;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7
                                                              + v38
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);

}

- (NSMutableArray)rowSpacing
{
  return self->_rowSpacing;
}

- (id)layoutFramesInBoundingSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  CGFloat v18;
  CGFloat v19;
  uint64_t v20;
  _QWORD v21[4];
  _QWORD v22[4];

  height = a3.height;
  width = a3.width;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCustomStackLayout rowHeads](self, "rowHeads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[AVCustomStackLayout rowHeads](self, "rowHeads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__AVCustomStackLayout_layoutFramesInBoundingSize___block_invoke;
  v14[3] = &unk_1E5BB3368;
  v18 = width;
  v19 = height;
  v14[4] = self;
  v16 = v21;
  v20 = v8;
  v17 = v22;
  v10 = v6;
  v15 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

  v11 = v15;
  v12 = v10;

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  return v12;
}

- (NSArray)rowHeads
{
  return self->_rowHeads;
}

- (id)_lastVisibleLayoutItemAttributesFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  v3 = a3;
  v4 = v3;
  v5 = 0;
  if (v3)
  {
    v6 = v3;
    do
    {
      if ((objc_msgSend(v6, "isCollapsedOrExcluded") & 1) == 0)
      {
        v7 = v6;

        v5 = v7;
      }
      objc_msgSend(v6, "nextAttributesInLayoutOrder");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    while (v8);
  }

  return v5;
}

- (double)_heightForRow:(unint64_t)a3 startingFrom:(id)a4 inBoundingSize:(CGSize)a5
{
  double height;
  id v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  height = a5.height;
  v8 = a4;
  v9 = v8;
  v10 = 0.0;
  if (v8)
  {
    v11 = v8;
    do
    {
      if ((objc_msgSend(v11, "isCollapsedOrExcluded") & 1) == 0)
      {
        objc_msgSend(v11, "minimumSize");
        if (v10 >= v12)
          v13 = v10;
        else
          v13 = v12;
        if (v13 >= height)
          v10 = height;
        else
          v10 = v13;
      }
      objc_msgSend(v11, "nextAttributesInLayoutOrder");
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
    while (v14);
  }
  -[AVCustomStackLayout rowHeads](self, "rowHeads");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count") - 1;

  if (v16 != a3)
    height = v10;

  return height;
}

- (id)_flexibleWidthMapForLayoutItemsBeginningWithLayoutItem:(id)a3 endingWithItem:(id)a4 withAvailableSize:(CGSize)a5
{
  double width;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  void *v31;
  double v32;
  double v33;
  double v34;

  width = a5.width;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v12 = v11;
  if (v11)
  {
    v13 = 0.0;
    v14 = v11;
    v15 = 0.0;
    do
    {
      if (!objc_msgSend(v14, "hasFlexibleContentSize")
        || objc_msgSend(v10, "count")
        || (objc_msgSend(v14, "isCollapsedOrExcluded") & 1) != 0)
      {
        if (objc_msgSend(v14, "hasFlexibleContentSize")
          && objc_msgSend(v10, "count")
          && (objc_msgSend(v14, "isCollapsedOrExcluded") & 1) == 0)
        {
          if (v14 != v8)
          {
            objc_msgSend(v14, "trailingInterItemSpace");
            width = width - v18;
          }
          width = width - v13;
          v13 = 0.0;
        }
        else if ((objc_msgSend(v14, "hasFlexibleContentSize") & 1) == 0
               && (objc_msgSend(v14, "isCollapsedOrExcluded") & 1) == 0)
        {
          objc_msgSend(v14, "minimumSize");
          v13 = v13 + v16;
          if (v14 != v8)
          {
            objc_msgSend(v14, "trailingInterItemSpace");
            v13 = v13 + v17;
          }
        }
      }
      else
      {
        objc_msgSend(v14, "nextAttributesInLayoutOrder");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v14, "trailingInterItemSpace");
          v21 = v20;
        }
        else
        {
          v21 = 0.0;
        }

        v15 = v13;
        v13 = v21;
      }
      if (objc_msgSend(v14, "hasFlexibleContentSize")
        && (objc_msgSend(v14, "isCollapsedOrExcluded") & 1) == 0)
      {
        objc_msgSend(v10, "addObject:", v14);
      }
      objc_msgSend(v14, "nextAttributesInLayoutOrder");
      v22 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v22;
    }
    while (v22);
  }
  else
  {
    v15 = 0.0;
    v13 = 0.0;
  }
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
    v23 = width - v13;
  else
    v23 = width / (double)(unint64_t)objc_msgSend(v10, "count");
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __111__AVCustomStackLayout__flexibleWidthMapForLayoutItemsBeginningWithLayoutItem_endingWithItem_withAvailableSize___block_invoke;
  v29[3] = &unk_1E5BB33E0;
  v24 = v9;
  v32 = v23;
  v33 = v15;
  v30 = v24;
  v31 = v10;
  v34 = v13;
  v25 = v10;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v29);
  v26 = v31;
  v27 = v24;

  return v27;
}

- (id)prioritizedSizeThatFitsSize:(CGSize)a3
{
  void *v3;
  AVPrioritizedSize *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[AVCustomStackLayout itemsThatFitSize:](self, "itemsThatFitSize:", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(AVPrioritizedSize);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "minimumSize", (_QWORD)v18);
        v12 = v11;
        objc_msgSend(v5, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v13)
          v14 = 0.0;
        else
          objc_msgSend(v10, "trailingInterItemSpace");
        v15 = v12 + v14;

        objc_msgSend(v10, "minimumSize");
        -[AVPrioritizedSize addSize:withPriority:](v4, "addSize:withPriority:", objc_msgSend(v10, "displayPriority"), v15, v16);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowSpacing, 0);
  objc_storeStrong((id *)&self->_rowHeads, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
}

- (AVCustomStackLayout)initWithLayoutRowHeads:(id)a3
{
  id v4;
  AVCustomStackLayout *v5;
  uint64_t v6;
  NSArray *rowHeads;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *rowSpacing;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVCustomStackLayout;
  v5 = -[AVCustomStackLayout init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    rowHeads = v5->_rowHeads;
    v5->_rowHeads = (NSArray *)v6;

    v8 = objc_msgSend(v4, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    rowSpacing = v5->_rowSpacing;
    v5->_rowSpacing = (NSMutableArray *)v9;

    for (; v8; --v8)
      -[NSMutableArray addObject:](v5->_rowSpacing, "addObject:", &unk_1E5BF38A0);
  }

  return v5;
}

- (AVCustomStackLayout)init
{
  return -[AVCustomStackLayout initWithLayoutRowHeads:](self, "initWithLayoutRowHeads:", MEMORY[0x1E0C9AA60]);
}

- (void)setDebugIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setRowSpacing:(double)a3 afterRow:(unint64_t)a4
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AVCustomStackLayout rowSpacing](self, "rowSpacing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:atIndexedSubscript:", v7, a4);

}

- (double)layoutHeightThatFitsRowsStartingWithRow:(unint64_t)a3
{
  void *v5;
  double v6;
  _QWORD v8[7];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[AVCustomStackLayout rowHeads](self, "rowHeads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__AVCustomStackLayout_layoutHeightThatFitsRowsStartingWithRow___block_invoke;
  v8[3] = &unk_1E5BB33B8;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setRowHeads:(id)a3
{
  objc_storeStrong((id *)&self->_rowHeads, a3);
}

- (void)setRowSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_rowSpacing, a3);
}

void __111__AVCustomStackLayout__flexibleWidthMapForLayoutItemsBeginningWithLayoutItem_endingWithItem_withAvailableSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a2;
  if (!a3)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = *(double *)(a1 + 48);
    v8 = *(double *)(a1 + 56);
    goto LABEL_5;
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "count") - 1;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = *(double *)(a1 + 48);
  if (v5 == a3)
  {
    v8 = *(double *)(a1 + 64);
LABEL_5:
    v7 = v7 - v8;
  }
  objc_msgSend(v6, "numberWithDouble:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);

}

void __63__AVCustomStackLayout_layoutHeightThatFitsRowsStartingWithRow___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  float v11;
  id v12;

  if (*(_QWORD *)(a1 + 48) <= a3)
  {
    objc_msgSend(a2, "firstAttributesInLayoutOrder");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = 0.0;
      do
      {
        if ((objc_msgSend(v6, "isCollapsedOrExcluded") & 1) == 0)
        {
          objc_msgSend(v6, "minimumSize");
          if (v7 < v8)
            v7 = v8;
        }
        objc_msgSend(v6, "nextAttributesInLayoutOrder");
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v9;
      }
      while (v9);
    }
    else
    {
      v7 = 0.0;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
    objc_msgSend(*(id *)(a1 + 32), "rowSpacing");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + v11;

  }
}

@end

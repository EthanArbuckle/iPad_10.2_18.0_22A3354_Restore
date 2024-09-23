@implementation AVLayoutView

uint64_t __36__AVLayoutView_setArrangedSubviews___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)reevaluateHiddenStateOfAllItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[AVLayoutView flattenedArrangedSubviewsInLayoutOrder](self, "flattenedArrangedSubviewsInLayoutOrder", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "avkit_reevaluateHiddenStateOfItem:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setArrangedSubviews:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  AVLayoutView *v27;
  _QWORD v28[4];
  id v29;
  AVLayoutView *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_arrangedSubviews, a3);
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[AVLayoutView flattenedArrangedSubviewsInLayoutOrder](self, "flattenedArrangedSubviewsInLayoutOrder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v25 = objc_claimAutoreleasedReturnValue();

  v27 = self;
  if (-[AVLayoutView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    v8 = 2 * (-[AVLayoutView semanticContentAttribute](self, "semanticContentAttribute", v25) != 1);
  else
    v8 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v35[0] = v12;
        v35[1] = 3221225472;
        v35[2] = __36__AVLayoutView_setArrangedSubviews___block_invoke;
        v35[3] = &unk_1E5BB4A90;
        v36 = v9;
        objc_msgSend(v16, "enumerateObjectsWithOptions:usingBlock:", v8, v35);

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = v26;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        if ((objc_msgSend(v17, "containsObject:", v23) & 1) == 0)
          -[AVLayoutView _removeArrangedSubview:](v27, "_removeArrangedSubview:", v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v20);
  }

  v28[0] = v12;
  v28[1] = 3221225472;
  v28[2] = __36__AVLayoutView_setArrangedSubviews___block_invoke_2;
  v28[3] = &unk_1E5BB4AB8;
  v29 = v18;
  v30 = v27;
  v24 = v18;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v28);

}

- (id)_includedItemsFromSubviews:(id)a3 inStackLayout:(id)a4 thatFitSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  char v51;
  char v52;
  NSObject *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[16];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  height = a5.height;
  width = a5.width;
  v86 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "itemsThatFitSize:", width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v11 = v8;
  v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
  if (v12)
  {
    v13 = v12;
    v54 = v9;
    v14 = 0;
    v15 = *(_QWORD *)v77;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v77 != v15)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "layoutAttributes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "canSubstituteOtherAttributes") & 1) != 0)
        {

          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v19 = v10;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v72;
            while (1)
            {
              if (*(_QWORD *)v72 != v22)
                objc_enumerationMutation(v19);
              if (!--v21)
              {
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
                if (!v21)
                  break;
              }
            }
          }
          v51 = v14;

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v53 = v11;
          v25 = v11;
          v26 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
          if (v26)
          {
            v27 = v26;
            v28 = 0;
            v29 = *(_QWORD *)v68;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v68 != v29)
                  objc_enumerationMutation(v25);
                objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "layoutAttributes");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v19, "containsObject:", v31) & 1) == 0
                  && objc_msgSend(v31, "isIncluded"))
                {
                  objc_msgSend(v23, "addObject:", v31);
                }
                if (objc_msgSend(v19, "containsObject:", v31)
                  && objc_msgSend(v31, "isIncluded")
                  && objc_msgSend(v31, "canOverflowToAuxiliaryMenu"))
                {
                  objc_msgSend(v24, "addObject:", v31);
                }
                if (objc_msgSend(v31, "canSubstituteOtherAttributes"))
                {
                  v32 = v31;

                  v28 = v32;
                }

              }
              v27 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
            }
            while (v27);
          }
          else
          {
            v28 = 0;
          }

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v18 = v23;
          v34 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v64;
            do
            {
              for (k = 0; k != v35; ++k)
              {
                if (*(_QWORD *)v64 != v36)
                  objc_enumerationMutation(v18);
                v38 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
                if (objc_msgSend(v38, "canOverflowToAuxiliaryMenu"))
                  objc_msgSend(v33, "addObject:", v38);
              }
              v35 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
            }
            while (v35);
          }

          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v39 = v33;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v60;
            while (1)
            {
              if (*(_QWORD *)v60 != v42)
                objc_enumerationMutation(v39);
              if (!--v41)
              {
                v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
                if (!v41)
                  break;
              }
            }
          }

          v43 = (objc_msgSend(v39, "count") != 0) | v51;
          if ((v43 & 1) != 0)
          {
            v52 = v43;
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v44 = v24;
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v55, v80, 16);
            if (v45)
            {
              v46 = v45;
              v47 = *(_QWORD *)v56;
              do
              {
                for (m = 0; m != v46; ++m)
                {
                  if (*(_QWORD *)v56 != v47)
                    objc_enumerationMutation(v44);
                  v49 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * m);
                  if ((unint64_t)objc_msgSend(v49, "displayPriority") <= 1)
                    objc_msgSend(v49, "setIncluded:", 0);
                }
                v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v55, v80, 16);
              }
              while (v46);
            }

            v43 = v52;
          }
          objc_msgSend(v28, "setIncluded:", v43 & 1);
          v9 = v54;
          objc_msgSend(v54, "itemsThatFitSize:", width, height);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v53;
          goto LABEL_66;
        }
        if (objc_msgSend(v17, "canOnlyAppearInControlOverflowMenu"))
          v14 |= objc_msgSend(v17, "isIncluded");

      }
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
      if (v13)
        continue;
      break;
    }

    if ((v14 & 1) == 0)
    {
      v9 = v54;
      goto LABEL_67;
    }
    _AVLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v9 = v54;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_ERROR, "Has control that can only overflow, but no layout views can substitute others.", buf, 2u);
    }
  }
  else
  {
    v18 = v11;
  }
LABEL_66:

LABEL_67:
  return v10;
}

void __36__AVLayoutView_setArrangedSubviews___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  v6 = *(void **)(a1 + 40);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v6, "flattenedArrangedSubviewsInLayoutOrder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v10);

  v9 = v10;
  if (v8 != a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_removeArrangedSubview:", v10);
    v6 = *(void **)(a1 + 40);
LABEL_4:
    objc_msgSend(v6, "_insertArrangedSubview:atIndex:", v10, a3);
    v9 = v10;
  }

}

void __30__AVLayoutView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  BOOL v30;
  int v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "flattenedArrangedSubviewsInLayoutOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "flattenedArrangedSubviewsInLayoutOrder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "CGRectValue");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(*(id *)(a1 + 32), "contentLayoutMargins");
    v19 = v11 + v18;
    objc_msgSend(*(id *)(a1 + 32), "contentLayoutMargins");
    v21 = v13 + v20;
    objc_msgSend(v9, "frame");
    v40.origin.x = v19;
    v40.origin.y = v21;
    v40.size.width = v15;
    v40.size.height = v17;
    if (!CGRectEqualToRect(v38, v40))
      objc_msgSend(v9, "setFrame:", v19, v21, v15, v17);
    objc_msgSend(v9, "layoutAttributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "prefersSecondaryMaterialOverlay"))
    {
      objc_msgSend(v9, "layoutAttributes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "isCollapsedOrExcluded"))
      {

      }
      else
      {
        v27 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

        if (v27)
          goto LABEL_8;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        objc_msgSend(*(id *)(a1 + 32), "secondaryMaterialOverlayView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setHidden:", 0);

        objc_msgSend(*(id *)(a1 + 32), "secondaryMaterialOverlayView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "frame");
        v41.origin.x = v19;
        v41.origin.y = v21;
        v41.size.width = v15;
        v41.size.height = v17;
        v30 = CGRectEqualToRect(v39, v41);

        if (v30)
          goto LABEL_8;
        objc_msgSend(*(id *)(a1 + 32), "secondaryMaterialOverlayView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFrame:", v19, v21, v15, v17);
      }
    }

LABEL_8:
    goto LABEL_12;
  }
  _AVLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "debugIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "flattenedArrangedSubviewsInLayoutOrder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412802;
    v32 = v25;
    v33 = 2048;
    v34 = objc_msgSend(v26, "count");
    v35 = 2048;
    v36 = a3;
    _os_log_impl(&dword_1AC4B1000, v24, OS_LOG_TYPE_DEFAULT, "%@ - Computed more frames than we have arranged subviews. Number of arranged subviews: %ld -- current frame index: %ld", (uint8_t *)&v31, 0x20u);

  }
LABEL_12:

}

- (NSMutableArray)flattenedArrangedSubviewsInLayoutOrder
{
  return self->_flattenedArrangedSubviewsInLayoutOrder;
}

- (void)_insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[AVLayoutView flattenedArrangedSubviewsInLayoutOrder](self, "flattenedArrangedSubviewsInLayoutOrder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v6, a4);

  -[AVLayoutView insertSubview:atIndex:](self, "insertSubview:atIndex:", v6, a4 + 1);
  -[AVLayoutView setStackLayoutNeedsUpdate:](self, "setStackLayoutNeedsUpdate:", 1);
  -[AVLayoutView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setStackLayoutNeedsUpdate:(BOOL)a3
{
  self->_stackLayoutNeedsUpdate = a3;
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
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  _QWORD v42[6];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)AVLayoutView;
  -[AVView layoutSubviews](&v51, sel_layoutSubviews);
  -[AVLayoutView backdropLayerView](self, "backdropLayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVLayoutView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  if (-[AVLayoutView isLayoutDirty](self, "isLayoutDirty"))
  {
    -[AVLayoutView _updateStackLayoutIfNeeded](self, "_updateStackLayoutIfNeeded");
    -[AVLayoutView frame](self, "frame");
    v5 = v4;
    v7 = v6;
    -[AVLayoutView contentLayoutMargins](self, "contentLayoutMargins");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = -[AVLayoutView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    if (v16 == 1)
      v17 = v15;
    else
      v17 = v11;
    if (v16 != 1)
      v11 = v15;
    -[AVLayoutView flattenedArrangedSubviewsInLayoutOrder](self, "flattenedArrangedSubviewsInLayoutOrder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutView currentStackLayout](self, "currentStackLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v5 - (v17 + v11);
    v21 = v7 - (v9 + v13);
    -[AVLayoutView _includedItemsFromSubviews:inStackLayout:thatFitSize:](self, "_includedItemsFromSubviews:inStackLayout:thatFitSize:", v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[AVLayoutView flattenedArrangedSubviewsInLayoutOrder](self, "flattenedArrangedSubviewsInLayoutOrder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v48 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v27, "layoutAttributes");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setCollapsed:", objc_msgSend(v22, "containsObject:", v28) ^ 1);
          objc_msgSend(v27, "layoutAttributesDidChange");

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v24);
    }

    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    -[AVLayoutView currentStackLayout](self, "currentStackLayout");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutFramesInBoundingSize:", v20, v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __30__AVLayoutView_layoutSubviews__block_invoke;
    v42[3] = &unk_1E5BB4A68;
    v42[4] = self;
    v42[5] = &v43;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v42);
    if (!*((_BYTE *)v44 + 24))
    {
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "CGRectValue");
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      -[AVLayoutView secondaryMaterialOverlayView](self, "secondaryMaterialOverlayView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

      -[AVLayoutView secondaryMaterialOverlayView](self, "secondaryMaterialOverlayView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setHidden:", 1);

    }
    -[AVLayoutView setLayoutDirty:](self, "setLayoutDirty:", 0);

    _Block_object_dispose(&v43, 8);
  }
  -[AVLayoutView _applyShapeStyle](self, "_applyShapeStyle");
}

- (AVCustomStackLayout)currentStackLayout
{
  return self->_currentStackLayout;
}

- (void)setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVLayoutView;
  -[AVLayoutView setNeedsLayout](&v3, sel_setNeedsLayout);
  -[AVLayoutView setLayoutDirty:](self, "setLayoutDirty:", 1);
}

- (void)setLayoutDirty:(BOOL)a3
{
  self->_layoutDirty = a3;
}

- (void)_updateStackLayoutIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  AVLayoutViewRowHead *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  AVLayoutViewRowHead *v20;
  AVCustomStackLayout *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  void *v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (-[AVLayoutView stackLayoutNeedsUpdate](self, "stackLayoutNeedsUpdate"))
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    -[AVLayoutView arrangedSubviews](self, "arrangedSubviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[AVLayoutView arrangedSubviews](self, "arrangedSubviews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v5)
    {
      v25 = *(_QWORD *)v41;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v41 != v25)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v6);
          v34 = 0;
          v35 = &v34;
          v36 = 0x3032000000;
          v37 = __Block_byref_object_copy__23443;
          v38 = __Block_byref_object_dispose__23444;
          v39 = 0;
          v28 = 0;
          v29 = &v28;
          v30 = 0x3032000000;
          v31 = __Block_byref_object_copy__23443;
          v32 = __Block_byref_object_dispose__23444;
          v33 = 0;
          if (-[AVLayoutView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
            v8 = 2 * (-[AVLayoutView semanticContentAttribute](self, "semanticContentAttribute") != 1);
          else
            v8 = 0;
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __42__AVLayoutView__updateStackLayoutIfNeeded__block_invoke;
          v27[3] = &unk_1E5BB4AE0;
          v27[4] = &v28;
          v27[5] = &v34;
          objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", v8, v27);
          objc_msgSend((id)v29[5], "setNextAttributesInLayoutOrder:", 0);
          objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_23445);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "layoutAttributes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          for (i = 1; i < objc_msgSend(v7, "count"); ++i)
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", i);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "layoutAttributes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setNextAttributesInPriorityOrder:", v14);

            objc_msgSend(v13, "layoutAttributes");
            v15 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v15;
          }
          objc_msgSend(v11, "setNextAttributesInPriorityOrder:", 0);
          v16 = [AVLayoutViewRowHead alloc];
          v17 = v35[5];
          objc_msgSend(v9, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "layoutAttributes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[AVLayoutViewRowHead initWithFirstAttributesInLayoutOrder:firstAttributesInPriorityOrder:](v16, "initWithFirstAttributesInLayoutOrder:firstAttributesInPriorityOrder:", v17, v19);

          objc_msgSend(v26, "addObject:", v20);
          _Block_object_dispose(&v28, 8);

          _Block_object_dispose(&v34, 8);
          ++v6;
        }
        while (v6 != v5);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v5);
    }

    v21 = -[AVCustomStackLayout initWithLayoutRowHeads:]([AVCustomStackLayout alloc], "initWithLayoutRowHeads:", v26);
    -[AVLayoutView setCurrentStackLayout:](self, "setCurrentStackLayout:", v21);

    -[AVLayoutView debugIdentifier](self, "debugIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutView currentStackLayout](self, "currentStackLayout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDebugIdentifier:", v22);

    -[AVLayoutView setStackLayoutNeedsUpdate:](self, "setStackLayoutNeedsUpdate:", 0);
  }
}

- (BOOL)stackLayoutNeedsUpdate
{
  return self->_stackLayoutNeedsUpdate;
}

- (void)_applyShapeStyle
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  uint64_t v11;
  double Width;
  double Height;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = -[AVLayoutView shapeStyle](self, "shapeStyle");
  if (v6 == 1)
  {
    -[AVLayoutView bounds](self, "bounds");
    Width = CGRectGetWidth(v33);
    -[AVLayoutView bounds](self, "bounds");
    Height = CGRectGetHeight(v34);
    v11 = 0;
    if (Width >= Height)
      Height = Width;
    v10 = Height * 0.5;
  }
  else if (v6)
  {
    v11 = 0;
    v10 = 0.0;
  }
  else
  {
    if (v5 == 5)
      v7 = 0.77;
    else
      v7 = 1.0;
    -[AVLayoutView bounds](self, "bounds");
    v8 = CGRectGetHeight(v32) <= v7 * 40.0;
    v9 = 8.0;
    if (!v8)
      v9 = 16.0;
    v10 = v7 * v9;
    v11 = 1;
  }
  -[AVLayoutView backdropLayerView](self, "backdropLayerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v10);

  -[AVLayoutView backdropLayerView](self, "backdropLayerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaskedCorners:", 15);

  -[AVLayoutView backdropLayerView](self, "backdropLayerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = (_QWORD *)MEMORY[0x1E0CD2A68];
  if (!(_DWORD)v11)
    v21 = (_QWORD *)MEMORY[0x1E0CD2A60];
  objc_msgSend(v19, "setCornerCurve:", *v21);

  if (-[AVLayoutView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    v22 = 10;
  else
    v22 = 5;
  -[AVLayoutView secondaryMaterialOverlayView](self, "secondaryMaterialOverlayView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v25 = v24;
  v27 = v26;
  -[AVLayoutView frame](self, "frame");
  if (v27 == v29 && v25 == v28)
    v22 = 15;

  -[AVLayoutView secondaryMaterialOverlayView](self, "secondaryMaterialOverlayView");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_setCornerRadius:continuous:maskedCorners:", v11, v22, v10);

}

- (AVCABackdropLayerView)backdropLayerView
{
  return self->_backdropLayerView;
}

- (UIVisualEffectView)secondaryMaterialOverlayView
{
  return self->_secondaryMaterialOverlayView;
}

- (unint64_t)shapeStyle
{
  return self->_shapeStyle;
}

- (BOOL)isLayoutDirty
{
  return self->_layoutDirty;
}

- (void)setContentLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  -[AVLayoutView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", a3.top, a3.leading, a3.bottom, a3.trailing);
  -[AVLayoutView setNeedsLayout](self, "setNeedsLayout");
}

- (NSArray)arrangedSubviews
{
  return self->_arrangedSubviews;
}

- (void)setCurrentStackLayout:(id)a3
{
  objc_storeStrong((id *)&self->_currentStackLayout, a3);
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setShapeStyle:(unint64_t)a3
{
  if (self->_shapeStyle != a3)
  {
    self->_shapeStyle = a3;
    -[AVLayoutView _applyShapeStyle](self, "_applyShapeStyle");
  }
}

- (void)setPrefersLowQualityEffects:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_prefersLowQualityEffects != a3)
  {
    v3 = a3;
    self->_prefersLowQualityEffects = a3;
    -[AVLayoutView backdropLayerView](self, "backdropLayerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setForceLowQualityEffect:", v3);

    -[AVLayoutView backdropLayerView](self, "backdropLayerView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateActiveBackdropEffectIfGroupLeader");

  }
}

- (BOOL)hasVisibleArrangedSubview
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AVLayoutView flattenedArrangedSubviewsInLayoutOrder](self, "flattenedArrangedSubviewsInLayoutOrder", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "_isInAWindow")
          && !objc_msgSend(v6, "avkit_isCompletelyTransparent"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
  }
}

- (id)prioritizedSizeThatFitsSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;

  height = a3.height;
  width = a3.width;
  -[AVLayoutView _updateStackLayoutIfNeeded](self, "_updateStackLayoutIfNeeded");
  -[AVLayoutView currentStackLayout](self, "currentStackLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prioritizedSizeThatFitsSize:", width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __42__AVLayoutView__updateStackLayoutIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "layoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "displayPriority");
  objc_msgSend(v5, "layoutAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "displayPriority");

  if (v7 <= v9)
  {
    objc_msgSend(v4, "layoutAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "displayPriority");
    objc_msgSend(v5, "layoutAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12 < objc_msgSend(v13, "displayPriority");

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
  }
}

void __42__AVLayoutView__updateStackLayoutIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a2;
  objc_msgSend(v4, "layoutAttributes");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setNextAttributesInLayoutOrder:", v5);

  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v5;

  }
  objc_msgSend(v4, "layoutAttributes");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (BOOL)isCollapsedOrExcluded
{
  return -[AVLayoutView isCollapsed](self, "isCollapsed")
      || !-[AVLayoutView isIncluded](self, "isIncluded")
      || -[AVLayoutView isRemoved](self, "isRemoved");
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (AVLayoutView)initWithFrame:(CGRect)a3
{
  AVLayoutView *v3;
  AVLayoutView *v4;
  uint64_t v5;
  NSMutableArray *flattenedArrangedSubviewsInLayoutOrder;
  AVCustomStackLayout *v7;
  AVCustomStackLayout *currentStackLayout;
  AVCABackdropLayerView *v9;
  uint64_t v10;
  AVCABackdropLayerView *backdropLayerView;
  void *v12;
  UIVisualEffectView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIVisualEffectView *secondaryMaterialOverlayView;
  UIVisualEffectView *v19;
  void *v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)AVLayoutView;
  v3 = -[AVView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_collapsed = 0;
    v3->_included = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    flattenedArrangedSubviewsInLayoutOrder = v4->_flattenedArrangedSubviewsInLayoutOrder;
    v4->_flattenedArrangedSubviewsInLayoutOrder = (NSMutableArray *)v5;

    v7 = objc_alloc_init(AVCustomStackLayout);
    currentStackLayout = v4->_currentStackLayout;
    v4->_currentStackLayout = v7;

    -[AVView setHasBackdropView:](v4, "setHasBackdropView:", 1);
    v9 = [AVCABackdropLayerView alloc];
    -[AVLayoutView bounds](v4, "bounds");
    v10 = -[AVCABackdropLayerView initWithFrame:](v9, "initWithFrame:");
    backdropLayerView = v4->_backdropLayerView;
    v4->_backdropLayerView = (AVCABackdropLayerView *)v10;

    -[AVCABackdropLayerView layer](v4->_backdropLayerView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMasksToBounds:", 1);

    -[AVLayoutView addSubview:](v4, "addSubview:", v4->_backdropLayerView);
    v13 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
    -[UIVisualEffectView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
    v14 = (void *)MEMORY[0x1E0DC3F50];
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "effectCompositingColor:withMode:alpha:", v15, 23, 0.06);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](v13, "setBackgroundEffects:", v17);

    secondaryMaterialOverlayView = v4->_secondaryMaterialOverlayView;
    v4->_secondaryMaterialOverlayView = v13;
    v19 = v13;

    -[UIVisualEffectView setHidden:](v4->_secondaryMaterialOverlayView, "setHidden:", 1);
    -[AVLayoutView secondaryMaterialOverlayView](v4, "secondaryMaterialOverlayView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutView addSubview:](v4, "addSubview:", v20);

    -[AVLayoutView setInsetsLayoutMarginsFromSafeArea:](v4, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[AVLayoutView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  }
  return v4;
}

- (void)setDebugIdentifier:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_debugIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_debugIdentifier, a3);
    -[AVLayoutView currentStackLayout](self, "currentStackLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDebugIdentifier:", v6);

  }
}

- (AVLayoutView)init
{
  return -[AVLayoutView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (double)layoutHeightThatFitsRowsStartingWithRow:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[AVLayoutView currentStackLayout](self, "currentStackLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutHeightThatFitsRowsStartingWithRow:", a3);
  v7 = v6;
  -[AVLayoutView contentLayoutMargins](self, "contentLayoutMargins");
  v9 = v7 + v8;

  return v9;
}

- (id)backgroundColor
{
  void *v2;
  void *v3;

  -[AVLayoutView backdropLayerView](self, "backdropLayerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVLayoutView backdropLayerView](self, "backdropLayerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomBackgroundColor:", v4);

}

- (void)setRowSpacing:(double)a3 afterRow:(unint64_t)a4
{
  id v6;

  -[AVLayoutView currentStackLayout](self, "currentStackLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRowSpacing:afterRow:", a4, a3);

}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AVLayoutView debugIdentifier](self, "debugIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> - %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)_removeArrangedSubview:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVLayoutView flattenedArrangedSubviewsInLayoutOrder](self, "flattenedArrangedSubviewsInLayoutOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v7);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[AVLayoutView flattenedArrangedSubviewsInLayoutOrder](self, "flattenedArrangedSubviewsInLayoutOrder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", v5);

    objc_msgSend(v7, "removeFromSuperview");
    -[AVLayoutView setStackLayoutNeedsUpdate:](self, "setStackLayoutNeedsUpdate:", 1);
    -[AVLayoutView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (CGSize)extrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_extrinsicContentSize.width;
  height = self->_extrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  self->_extrinsicContentSize = a3;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  self->_hasFullScreenAppearance = a3;
}

- (BOOL)prefersLowQualityEffects
{
  return self->_prefersLowQualityEffects;
}

- (void)setFlattenedArrangedSubviewsInLayoutOrder:(id)a3
{
  objc_storeStrong((id *)&self->_flattenedArrangedSubviewsInLayoutOrder, a3);
}

- (void)setBackdropLayerView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropLayerView, a3);
}

- (void)setSecondaryMaterialOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryMaterialOverlayView, a3);
}

- (AVLayoutViewItem)targetViewForSecondaryMaterialOverlayView
{
  return self->_targetViewForSecondaryMaterialOverlayView;
}

- (void)setTargetViewForSecondaryMaterialOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_targetViewForSecondaryMaterialOverlayView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetViewForSecondaryMaterialOverlayView, 0);
  objc_storeStrong((id *)&self->_secondaryMaterialOverlayView, 0);
  objc_storeStrong((id *)&self->_backdropLayerView, 0);
  objc_storeStrong((id *)&self->_currentStackLayout, 0);
  objc_storeStrong((id *)&self->_flattenedArrangedSubviewsInLayoutOrder, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_arrangedSubviews, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

@end

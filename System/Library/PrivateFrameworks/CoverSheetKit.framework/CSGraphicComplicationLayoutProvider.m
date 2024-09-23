@implementation CSGraphicComplicationLayoutProvider

+ (int64_t)sidebarGridHeight
{
  unint64_t v2;

  v2 = +[CSDeviceDetermination baseCategory](CSDeviceDetermination, "baseCategory");
  if (v2 - 24 > 7)
    return 8;
  else
    return qword_1A9D46428[v2 - 24];
}

+ (double)gridUnitSize
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double height;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGAffineTransform v28;
  CGRect v29;
  CGRect v30;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceClass");

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fixedCoordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v11 = v10;
  if (v4 == 2)
  {
    v12 = v7;
    v13 = v8;
    v14 = v9;

    CGAffineTransformMakeRotation(&v28, 1.57079633);
    v29.origin.x = v12;
    v29.origin.y = v13;
    v29.size.width = v11;
    v29.size.height = v14;
    v30 = CGRectApplyAffineTransform(v29, &v28);
    height = v30.size.height;
    +[CSProminentLayoutController landscapePadSubtitleElementBoundingTopY](CSProminentLayoutController, "landscapePadSubtitleElementBoundingTopY", v30.origin.x, v30.origin.y, v30.size.width);
    v17 = height + v16 * -2.0;
    v18 = (double)(objc_msgSend(a1, "sidebarGridHeight") - 1);
    objc_msgSend(a1, "interComplicationSpacing");
    v20 = v19 * v18;
    objc_msgSend(a1, "complicationEdgeInset");
    return (v17 - v20 - (v21 + v21)) / (double)objc_msgSend(a1, "sidebarGridHeight");
  }
  else
  {

    objc_msgSend(a1, "containerEdgeInset");
    v24 = v23;
    objc_msgSend(a1, "complicationEdgeInset");
    v26 = v24 + v25;
    objc_msgSend(a1, "interComplicationSpacing");
    return (v11 - (v27 * 3.0 + v26 * 2.0)) * 0.25;
  }
}

+ (double)complicationContainerHeight
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "gridUnitSize");
  v4 = v3;
  objc_msgSend(a1, "complicationEdgeInset");
  return v4 + v5 * 2.0;
}

+ (double)interComplicationSpacing
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "interComplicationSpacingExcludingInnerInset");
  v4 = v3;
  objc_msgSend(a1, "complicationEdgeInset");
  return v4 + v5 * 2.0;
}

+ (double)interComplicationSpacingExcludingInnerInset
{
  unint64_t v2;
  double result;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = 10.0;
  if (v2 - 1 <= 0x1F)
    return dbl_1A9D46468[v2 - 1];
  return result;
}

+ (double)containerEdgeInset
{
  double result;

  +[CSProminentLayoutController leadingPortraitLayoutInset](CSProminentLayoutController, "leadingPortraitLayoutInset");
  return result;
}

+ (double)complicationEdgeInset
{
  unint64_t v2;
  double result;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  result = 7.0;
  if (v2 <= 0x20)
    return dbl_1A9D46568[v2];
  return result;
}

+ (id)complicationLayoutForElements:(id)a3 containerSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "complicationLayoutForElements:layoutStyle:containerSize:", a3, 0, a4.width, a4.height);
}

+ (id)complicationLayoutForElements:(id)a3 layoutStyle:(int64_t)a4 containerSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  CSComplicationLayout *v10;
  void *v11;
  id v12;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = [CSComplicationLayout alloc];
  objc_msgSend(a1, "_framesForLayoutElements:layoutStyle:containerSize:", v9, a4, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CSComplicationLayout _initWithFramesByElement:draggedItemInsertionIndex:](v10, "_initWithFramesByElement:draggedItemInsertionIndex:", v11, 0x7FFFFFFFFFFFFFFFLL);
  return v12;
}

+ (id)complicationLayoutForElements:(id)a3 containerSize:(CGSize)a4 draggedElement:(id)a5 draggedElementPosition:(CGPoint)a6
{
  return (id)objc_msgSend(a1, "complicationLayoutForElements:layoutStyle:containerSize:draggedElement:draggedElementPosition:", a3, 0, a5, a4.width, a4.height, a6.x, a6.y);
}

+ (id)complicationLayoutForElements:(id)a3 layoutStyle:(int64_t)a4 containerSize:(CGSize)a5 draggedElement:(id)a6 draggedElementPosition:(CGPoint)a7
{
  CGFloat y;
  double x;
  double height;
  double width;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double MidX;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  _QWORD v38[6];
  CGRect v39;

  y = a7.y;
  x = a7.x;
  height = a5.height;
  width = a5.width;
  v14 = a3;
  v15 = a6;
  if (v15 && (objc_msgSend(a1, "canAddElement:toElements:layoutStyle:", v15, v14, a4) & 1) != 0)
  {
    objc_msgSend(a1, "_framesForLayoutElements:layoutStyle:containerSize:", v14, a4, width, height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __133__CSGraphicComplicationLayoutProvider_complicationLayoutForElements_layoutStyle_containerSize_draggedElement_draggedElementPosition___block_invoke;
    v38[3] = &__block_descriptor_48_e29_q24__0__NSValue_8__NSValue_16l;
    *(double *)&v38[4] = x;
    *(CGFloat *)&v38[5] = y;
    objc_msgSend(v16, "keysSortedByValueUsingComparator:", v38);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = objc_msgSend(v14, "indexOfObject:", v18);
      objc_msgSend(v16, "objectForKeyedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "CGRectValue");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      v39.origin.x = v22;
      v39.origin.y = v24;
      v39.size.width = v26;
      v39.size.height = v28;
      MidX = CGRectGetMidX(v39);
      v30 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
      if (x >= MidX)
        v31 = v30 != 1;
      else
        v31 = v30 == 1;
      v32 = v19 + v31;
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v14);
      v34 = objc_msgSend(a1, "_insertionIndexForElement:withExistingElements:proposedInsertionIndex:", v15, v14, v32);
      objc_msgSend(v33, "insertObject:atIndex:", v15, v34);
      objc_msgSend(a1, "_framesForLayoutElements:layoutStyle:containerSize:", v33, a4, width, height);
      v35 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v35;
    }
    else
    {
      v34 = 0;
    }
    v36 = -[CSComplicationLayout _initWithFramesByElement:draggedItemInsertionIndex:]([CSComplicationLayout alloc], "_initWithFramesByElement:draggedItemInsertionIndex:", v16, v34);

  }
  else
  {
    objc_msgSend(a1, "complicationLayoutForElements:layoutStyle:containerSize:", v14, a4, width, height);
    v36 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v36;
}

uint64_t __133__CSGraphicComplicationLayoutProvider_complicationLayoutForElements_layoutStyle_containerSize_draggedElement_draggedElementPosition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  CGRect v20;
  CGRect v21;

  v5 = a3;
  objc_msgSend(a2, "CGRectValue");
  v6 = vabdd_f64(CGRectGetMidX(v20), *(double *)(a1 + 32));
  objc_msgSend(v5, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  v15 = vabdd_f64(CGRectGetMidX(v21), *(double *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "compare:", v17);

  return v18;
}

+ (BOOL)canAddElement:(id)a3 toElements:(id)a4
{
  return objc_msgSend(a1, "canAddElement:toElements:layoutStyle:", a3, a4, 0);
}

+ (BOOL)canAddElement:(id)a3 toElements:(id)a4 layoutStyle:(int64_t)a5
{
  BOOL v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5)
  {
    if (a5 == 1)
      v5 = (unint64_t)objc_msgSend(v9, "count") < 0x14;
  }
  else
  {
    objc_msgSend(v9, "arrayByAddingObject:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v11);
          v14 += objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "gridWidth");
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
      v5 = v14 < 5;
    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

+ (int64_t)insertionIndexForElement:(id)a3 withExistingElements:(id)a4
{
  id v6;
  id v7;
  int64_t v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "_insertionIndexForElement:withExistingElements:proposedInsertionIndex:", v7, v6, objc_msgSend(v6, "count"));

  return v8;
}

+ (int64_t)_insertionIndexForElement:(id)a3 withExistingElements:(id)a4 proposedInsertionIndex:(int64_t)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithArray:", v9);

  objc_msgSend(v10, "insertObject:atIndex:", v7, a5);
  objc_msgSend(v10, "bs_filter:", &__block_literal_global);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v12);
    objc_msgSend(v10, "insertObject:atIndex:", v12, 0);
    a5 = objc_msgSend(v10, "indexOfObject:", v7);

  }
  return a5;
}

BOOL __109__CSGraphicComplicationLayoutProvider__insertionIndexForElement_withExistingElements_proposedInsertionIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "complicationFamily") == 1;
}

+ (id)_framesForLayoutElements:(id)a3 layoutStyle:(int64_t)a4 containerSize:(CGSize)a5
{
  void *v5;
  double height;
  double width;
  id v10;
  uint64_t v11;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  if (a4 == 1)
  {
    objc_msgSend(a1, "_sidebarFramesForLayoutElements:containerSize:", v10, width, height);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a4)
  {
    objc_msgSend(a1, "_rowFramesForLayoutElements:containerSize:", v10, width, height);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v11;
  }

  return v5;
}

+ (id)_rowFramesForLayoutElements:(id)a3 containerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  double v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id *v39;
  uint64_t v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  double v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  double v56;
  id *v57;
  uint64_t j;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  double v66;
  void *v67;
  double v68;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  height = a4.height;
  width = a4.width;
  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a1, "interComplicationSpacingExcludingInnerInset");
  v9 = v8;
  v10 = objc_msgSend(v7, "count");
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v76;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v76 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "size");
        v15 = v15 + v17;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 0.0;
  }

  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "complicationFamily") == 1;

  }
  else
  {
    v19 = 0;
  }
  if (objc_msgSend(v11, "count") == 2)
  {
    objc_msgSend(v11, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "complicationFamily") == 1)
    {
      objc_msgSend(v11, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "complicationFamily") == 0;

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v19 || v22)
  {
    objc_msgSend(a1, "interComplicationSpacingExcludingInnerInset");
    v25 = v24 * 3.0;
    objc_msgSend(a1, "gridUnitSize");
    v27 = v26;
    objc_msgSend(a1, "complicationEdgeInset");
    v29 = fmax((width - (v25 + (v27 + v28 * 2.0) * 4.0)) * 0.5, 0.0);
    objc_msgSend(v11, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "size");
    v32 = v31;

    v33 = height * 0.5 - v32 * 0.5;
    objc_msgSend(v11, "firstObject");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "size");
    v36 = v35;
    v38 = v37;
    v39 = (id *)MEMORY[0x1E0DC4730];
    v40 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
    v41 = width - v29;
    v42 = width - v29 - v36;
    if (v40 != 1)
      v42 = v29;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v42, v33, v36, v38);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v43, v34);

    if (v22)
    {
      objc_msgSend(v11, "lastObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "size");
      v46 = v45;
      v48 = v47;
      v49 = objc_msgSend(*v39, "userInterfaceLayoutDirection");
      v50 = v41 - v46;
      if (v49 == 1)
        v50 = v29;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v50, v33, v46, v48);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v51, v44);

    }
  }
  else
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v34 = v11;
    v52 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    if (v52)
    {
      v53 = v52;
      v70 = v11;
      v54 = width * 0.5 - (v9 * (double)(unint64_t)(v10 - 1) + v15) * 0.5;
      v55 = *(_QWORD *)v72;
      v56 = height * 0.5;
      v57 = (id *)MEMORY[0x1E0DC4730];
      do
      {
        for (j = 0; j != v53; ++j)
        {
          if (*(_QWORD *)v72 != v55)
            objc_enumerationMutation(v34);
          v59 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
          objc_msgSend(v59, "size");
          v61 = v60;
          v63 = v62;
          v64 = v56 + v62 * -0.5;
          v65 = objc_msgSend(*v57, "userInterfaceLayoutDirection");
          v66 = width - v54 - v61;
          if (v65 != 1)
            v66 = v54;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v66, v64, v61, v63);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v67, v59);

          objc_msgSend(a1, "interComplicationSpacingExcludingInnerInset");
          v54 = v54 + v61 + v68;
        }
        v53 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      }
      while (v53);
      v11 = v70;
    }
  }

  return v23;
}

+ (id)_sidebarFramesForLayoutElements:(id)a3 containerSize:(CGSize)a4
{
  CGFloat height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  double v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;

  height = a4.height;
  width = a4.width;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a1, "complicationEdgeInset");
  v9 = v8;
  objc_msgSend(a1, "complicationEdgeInset");
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    v17 = (id *)MEMORY[0x1E0DC4730];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v19, "size", (_QWORD)v35);
        v21 = v20;
        v23 = v22;
        if (objc_msgSend(*v17, "userInterfaceLayoutDirection") == 1)
          v24 = width - v9 - v21;
        else
          v24 = v9;
        v41.origin.x = 0.0;
        v41.origin.y = 0.0;
        v41.size.width = width;
        v41.size.height = height;
        v42.origin.x = v24;
        v42.origin.y = v11;
        v42.size.width = v21;
        v42.size.height = v23;
        if (CGRectContainsRect(v41, v42))
        {
          v25 = (void *)MEMORY[0x1E0CB3B18];
          v26 = v24;
        }
        else
        {
          objc_msgSend(a1, "complicationEdgeInset");
          v9 = v27;
          objc_msgSend(a1, "gridUnitSize");
          v29 = v28;
          objc_msgSend(a1, "interComplicationSpacing");
          v11 = v11 + v29 + v30;
          v31 = objc_msgSend(*v17, "userInterfaceLayoutDirection");
          v26 = width - v9 - v21;
          if (v31 != 1)
            v26 = v9;
          v25 = (void *)MEMORY[0x1E0CB3B18];
        }
        objc_msgSend(v25, "valueWithCGRect:", v26, v11, v21, v23);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v32, v19);

        objc_msgSend(a1, "interComplicationSpacing");
        v9 = v9 + v21 + v33;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v15);
  }

  return v12;
}

@end

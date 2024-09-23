@implementation CAMControlStatusBar

- (CAMControlStatusBar)initWithFrame:(CGRect)a3
{
  CAMControlStatusBar *v3;
  uint64_t v4;
  NSMutableDictionary *statusIndicatorsByType;
  NSArray *primaryDesiredIndicatorTypes;
  NSArray *v7;
  NSArray *secondaryDesiredIndicatorTypes;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMControlStatusBar;
  v3 = -[CAMControlStatusBar initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    statusIndicatorsByType = v3->__statusIndicatorsByType;
    v3->__statusIndicatorsByType = (NSMutableDictionary *)v4;

    primaryDesiredIndicatorTypes = v3->_primaryDesiredIndicatorTypes;
    v7 = (NSArray *)MEMORY[0x1E0C9AA60];
    v3->_primaryDesiredIndicatorTypes = (NSArray *)MEMORY[0x1E0C9AA60];

    secondaryDesiredIndicatorTypes = v3->_secondaryDesiredIndicatorTypes;
    v3->_secondaryDesiredIndicatorTypes = v7;

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double MinX;
  void *v19;
  void *v20;
  double MaxX;
  void *v22;
  void *v23;
  double x;
  double y;
  double width;
  double height;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  CGFloat v51;
  CGFloat rect;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v60 = *MEMORY[0x1E0C80C00];
  -[CAMControlStatusBar primaryDesiredIndicatorTypes](self, "primaryDesiredIndicatorTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusBar _layoutAllDesiredTypes:atOrigin:](self, "_layoutAllDesiredTypes:atOrigin:", v3, 0);

  -[CAMControlStatusBar secondaryDesiredIndicatorTypes](self, "secondaryDesiredIndicatorTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusBar _layoutAllDesiredTypes:atOrigin:](self, "_layoutAllDesiredTypes:atOrigin:", v4, 1);

  -[CAMControlStatusBar bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusBar secondaryDesiredIndicatorTypes](self, "secondaryDesiredIndicatorTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = objc_claimAutoreleasedReturnValue();

  -[CAMControlStatusBar primaryDesiredIndicatorTypes](self, "primaryDesiredIndicatorTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastObject");
  v17 = objc_claimAutoreleasedReturnValue();

  MinX = v10;
  if (v15)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    MinX = CGRectGetMinX(v61);

  }
  v54 = (void *)v15;
  if (v17)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    MaxX = CGRectGetMaxX(v62);

  }
  else
  {
    MaxX = 0.0;
  }
  v53 = (void *)v17;
  -[CAMControlStatusBar directionIndicator](self, "directionIndicator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "intrinsicContentSize");
    UIRectCenteredXInRectScale();
    v51 = v6;
    rect = v12;
    x = v63.origin.x;
    y = v63.origin.y;
    width = v63.size.width;
    height = v63.size.height;
    v50 = CGRectGetMaxX(v63);
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v49 = CGRectGetMinX(v64);
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    v28 = CGRectGetWidth(v65);
    v29 = v28;
    if (MinX - MaxX >= v28)
    {
      v36 = MinX - width;
      if (MinX >= v50)
        v36 = x;
      if (MaxX <= v49)
        v32 = v36;
      else
        v32 = MaxX;
    }
    else
    {
      v66.origin.y = v8;
      v30 = v28;
      v66.size.width = v10;
      v66.origin.x = v51;
      v66.size.height = rect;
      CGRectGetMidY(v66);
      UIRectCenteredAboutPointScale();
      v32 = v31;
      y = v33;
      width = v34;
      v29 = v30;
      height = v35;
    }
    -[CAMControlStatusBar _setDirectionIndicatorHiddenForSpace:](self, "_setDirectionIndicatorHiddenForSpace:", MinX - MaxX < v29, MinX - MaxX, 0);
    objc_msgSend(v23, "setFrame:", v32, y, width, height);
  }
  -[CAMControlStatusBar _allDesiredTypes](self, "_allDesiredTypes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "mutableCopy");

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[CAMControlStatusBar secondaryDesiredIndicatorTypes](self, "secondaryDesiredIndicatorTypes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "reverseObjectEnumerator");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v56;
LABEL_17:
    v44 = 0;
    while (1)
    {
      if (*(_QWORD *)v56 != v43)
        objc_enumerationMutation(v40);
      v45 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v44);
      objc_msgSend(v13, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "frame");
      v47 = CGRectGetMinX(v67);

      if (MaxX < v47)
        break;
      objc_msgSend(v38, "removeObject:", v45);
      if (v42 == ++v44)
      {
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        if (v42)
          goto LABEL_17;
        break;
      }
    }
  }

  v48 = (void *)objc_msgSend(v38, "copy");
  -[CAMControlStatusBar _setAllVisibleTypes:](self, "_setAllVisibleTypes:", v48);

  -[CAMControlStatusBar _updateIndicatorsVisibilityAnimated:](self, "_updateIndicatorsVisibilityAnimated:", 0);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double MidY;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CAMControlStatusBar bounds](self, "bounds");
  MidY = CGRectGetMidY(v15);
  v9 = MidY + -40.0;
  v10 = fmax(y, MidY);
  if (y >= v9)
    v11 = v10;
  else
    v11 = y;
  v14.receiver = self;
  v14.super_class = (Class)CAMControlStatusBar;
  -[CAMControlStatusBar hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_layoutAllDesiredTypes:(id)a3 atOrigin:(int64_t)a4
{
  -[CAMControlStatusBar _layoutDesiredViewsForTypes:inDesiredTypes:atOrigin:](self, "_layoutDesiredViewsForTypes:inDesiredTypes:atOrigin:", 0, a3, a4);
}

- (void)_layoutDesiredViewsForTypes:(id)a3 inDesiredTypes:(id)a4 atOrigin:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double (**v16)(void *, void *, double);
  void *v17;
  double v18;
  double v19;
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
  double v31;
  double v32;
  double (**v33)(void *, void *, double);
  id v34;
  _QWORD v35[5];
  id v36;
  double (**v37)(void *, void *, double);
  _QWORD aBlock[10];
  _QWORD v39[3];
  double v40;

  v8 = a3;
  v9 = a4;
  -[CAMControlStatusBar bounds](self, "bounds");
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0.0;
  if (a5)
  {
    if (a5 != 1)
      goto LABEL_6;
    v14 = v12 + -12.0;
  }
  else
  {
    v14 = 12.0;
  }
  v40 = v14;
LABEL_6:
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CAMControlStatusBar__layoutDesiredViewsForTypes_inDesiredTypes_atOrigin___block_invoke;
  aBlock[3] = &unk_1EA32E0B0;
  aBlock[5] = v10;
  aBlock[6] = v11;
  *(double *)&aBlock[7] = v12;
  aBlock[8] = v13;
  aBlock[9] = a5;
  aBlock[4] = v39;
  v16 = (double (**)(void *, void *, double))_Block_copy(aBlock);
  if (a5 == 1)
  {
    -[CAMControlStatusBar secondaryAccessoryControl](self, "secondaryAccessoryControl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v16[2](v16, v17, 16.0);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[CAMControlStatusBar secondaryAccessoryControl](self, "secondaryAccessoryControl");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v26, v28, v30, v32);
    goto LABEL_10;
  }
  if (!a5)
  {
    -[CAMControlStatusBar primaryAccessoryControl](self, "primaryAccessoryControl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16[2](v16, v17, 16.0);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[CAMControlStatusBar primaryAccessoryControl](self, "primaryAccessoryControl");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);
LABEL_10:

  }
  v35[0] = v15;
  v35[1] = 3221225472;
  v35[2] = __75__CAMControlStatusBar__layoutDesiredViewsForTypes_inDesiredTypes_atOrigin___block_invoke_2;
  v35[3] = &unk_1EA32E0D8;
  v35[4] = self;
  v33 = v16;
  v37 = v33;
  v34 = v8;
  v36 = v34;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v35);

  _Block_object_dispose(v39, 8);
}

double __75__CAMControlStatusBar__layoutDesiredViewsForTypes_inDesiredTypes_atOrigin___block_invoke(uint64_t a1, void *a2, double a3)
{
  CGFloat v3;
  double v4;
  double v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  double v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v4 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  if (a2)
  {
    objc_msgSend(a2, "intrinsicContentSize");
    v8 = v7;
    v9 = *(double *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 72);
    if (v10)
    {
      if (v10 != 1)
      {
LABEL_8:
        v15.origin.x = v4;
        v15.origin.y = v3;
        v15.size.width = v8;
        v15.size.height = v9;
        *(_QWORD *)&v4 = (unint64_t)CGRectInset(v15, a3 * -0.5, 0.0);
        return v4;
      }
      v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) - v7;
      v13.origin.x = v4;
      v13.origin.y = v3;
      v13.size.width = v8;
      v13.size.height = *(CGFloat *)(a1 + 64);
      v11 = CGRectGetMinX(v13) - a3;
    }
    else
    {
      v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v14.origin.x = v4;
      v14.origin.y = v3;
      v14.size.width = v8;
      v14.size.height = *(CGFloat *)(a1 + 64);
      v11 = CGRectGetMaxX(v14) + a3;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11;
    goto LABEL_8;
  }
  return v4;
}

void __75__CAMControlStatusBar__layoutDesiredViewsForTypes_inDesiredTypes_atOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_statusIndicatorsByType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (*(double (**)(double))(*(_QWORD *)(a1 + 48) + 16))(12.0);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = *(void **)(a1 + 40);
  if (!v12 || objc_msgSend(v12, "containsObject:", v13))
    objc_msgSend(v4, "setFrame:", v5, v7, v9, v11);

}

- (void)_prelayoutForNewTypes:(id)a3 oldTypes:(id)a4 atOrigin:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  int64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "removeObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  v16 = (void *)MEMORY[0x1E0DC3F10];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__CAMControlStatusBar__prelayoutForNewTypes_oldTypes_atOrigin___block_invoke;
  v19[3] = &unk_1EA3292E8;
  v19[4] = self;
  v20 = v10;
  v21 = v8;
  v22 = a5;
  v17 = v8;
  v18 = v10;
  objc_msgSend(v16, "performWithoutAnimation:", v19);

}

void __63__CAMControlStatusBar__prelayoutForNewTypes_oldTypes_atOrigin___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_layoutDesiredViewsForTypes:inDesiredTypes:atOrigin:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "_statusIndicatorsByType", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "layoutIfNeeded");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)_updateExpandingInsetsForControl:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  void *v8;
  id v9;
  CGRect v10;
  CGRect v11;

  v9 = a3;
  objc_msgSend(v9, "frame");
  objc_msgSend(v9, "alignmentRectForFrame:");
  -[CAMControlStatusBar bounds](self, "bounds");
  v11 = CGRectInset(v10, 12.0, 0.0);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  objc_msgSend(v9, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusBar convertRect:toView:](self, "convertRect:toView:", v8, x, y, width, height);

  CEKRectInsetsInRect();
  objc_msgSend(v9, "setExpansionInsets:");

}

- (id)_createIndicatorForType:(unint64_t)a3
{
  __objc2_class **v5;
  CAMVideoConfigurationStatusIndicator *v6;

  v5 = off_1EA325FF0;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_19;
    case 1uLL:
      v5 = off_1EA3261C0;
      goto LABEL_19;
    case 2uLL:
      v5 = off_1EA326098;
      goto LABEL_19;
    case 3uLL:
      v5 = off_1EA326908;
      goto LABEL_19;
    case 4uLL:
      v5 = off_1EA325FC8;
      goto LABEL_19;
    case 5uLL:
      v5 = off_1EA325C10;
      goto LABEL_19;
    case 6uLL:
      v5 = off_1EA326108;
      goto LABEL_19;
    case 7uLL:
      v5 = off_1EA325F50;
      goto LABEL_19;
    case 8uLL:
      v6 = objc_alloc_init(CAMVideoConfigurationStatusIndicator);
      -[CAMControlStatusIndicator setControlStatusType:](v6, "setControlStatusType:", 8);
      goto LABEL_21;
    case 9uLL:
      v5 = off_1EA3261F8;
      goto LABEL_19;
    case 0xAuLL:
      v5 = off_1EA326620;
      goto LABEL_19;
    case 0xBuLL:
      v5 = off_1EA326728;
      goto LABEL_19;
    case 0xCuLL:
      v5 = off_1EA326560;
      goto LABEL_19;
    case 0xDuLL:
      v5 = off_1EA326528;
      goto LABEL_19;
    case 0xEuLL:
      v5 = off_1EA326688;
      goto LABEL_19;
    case 0xFuLL:
      v5 = off_1EA326A48;
      goto LABEL_19;
    case 0x10uLL:
      v5 = off_1EA326428;
LABEL_19:
      v6 = (CAMVideoConfigurationStatusIndicator *)objc_alloc_init(*v5);
      break;
    default:
      v6 = 0;
      break;
  }
  -[CAMControlStatusIndicator setControlStatusType:](v6, "setControlStatusType:", a3);
  -[CAMVideoConfigurationStatusIndicator addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel__handleStatusIndicatorTapped_, 64);
LABEL_21:
  -[CAMVideoConfigurationStatusIndicator setAlpha:](v6, "setAlpha:", 0.0);
  return v6;
}

- (id)indicatorForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CAMFlashExpandableStatusIndicator)flashIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B10D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMFlashExpandableStatusIndicator *)v3;
}

- (CAMLivePhotoStatusIndicator)livePhotoIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B10F0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMLivePhotoStatusIndicator *)v3;
}

- (CAMHDRStatusIndicator)hdrIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1108);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMHDRStatusIndicator *)v3;
}

- (CAMTimerStatusIndicator)timerIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1120);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMTimerStatusIndicator *)v3;
}

- (CAMFilterStatusIndicator)filterIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1138);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMFilterStatusIndicator *)v3;
}

- (CAMApertureStatusIndicator)apertureIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1150);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMApertureStatusIndicator *)v3;
}

- (CAMIntensityStatusIndicator)intensityIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1168);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMIntensityStatusIndicator *)v3;
}

- (CAMExposureBiasStatusIndicator)exposureBiasIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1180);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMExposureBiasStatusIndicator *)v3;
}

- (CAMVideoConfigurationStatusIndicator)videoConfigurationIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1198);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMVideoConfigurationStatusIndicator *)v3;
}

- (CAMLowLightStatusIndicator)lowLightIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B11B0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMLowLightStatusIndicator *)v3;
}

- (CAMSemanticStyleStatusIndicator)semanticStyleIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B11C8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMSemanticStyleStatusIndicator *)v3;
}

- (CAMSmartStyleStatusIndicator)smartStyleIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B11E0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMSmartStyleStatusIndicator *)v3;
}

- (CAMRAWStatusIndicator)rawIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B11F8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMRAWStatusIndicator *)v3;
}

- (CAMPhotoFormatStatusIndicator)photoFormatStatusIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1210);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMPhotoFormatStatusIndicator *)v3;
}

- (CAMProResStatusIndicator)proResIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1228);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMProResStatusIndicator *)v3;
}

- (CAMSharedLibraryStatusIndicator)sharedLibraryIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1240);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMSharedLibraryStatusIndicator *)v3;
}

- (CAMVideoStabilizationStatusIndicator)videoStabilizationIndicator
{
  void *v2;
  void *v3;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B1258);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMVideoStabilizationStatusIndicator *)v3;
}

- (void)_handleStatusIndicatorTapped:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[CAMControlStatusBar delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "controlStatusType");

  objc_msgSend(v6, "controlStatusBar:didReceiveTapInIndicatorForType:", self, v5);
}

- (void)setPrimaryDesiredIndicatorTypes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMControlStatusBar secondaryDesiredIndicatorTypes](self, "secondaryDesiredIndicatorTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusBar setPrimaryDesiredIndicatorTypes:secondaryDesiredIndicatorTypes:animated:](self, "setPrimaryDesiredIndicatorTypes:secondaryDesiredIndicatorTypes:animated:", v4, v5, 0);

}

- (void)setSecondaryDesiredIndicatorTypes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMControlStatusBar primaryDesiredIndicatorTypes](self, "primaryDesiredIndicatorTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusBar setPrimaryDesiredIndicatorTypes:secondaryDesiredIndicatorTypes:animated:](self, "setPrimaryDesiredIndicatorTypes:secondaryDesiredIndicatorTypes:animated:", v5, v4, 0);

}

- (void)setPrimaryDesiredIndicatorTypes:(id)a3 secondaryDesiredIndicatorTypes:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isEqual:", self->_primaryDesiredIndicatorTypes)
    || (objc_msgSend(v9, "isEqual:", self->_secondaryDesiredIndicatorTypes) & 1) == 0)
  {
    v10 = self->_primaryDesiredIndicatorTypes;
    v11 = self->_secondaryDesiredIndicatorTypes;
    v12 = (void *)objc_msgSend(v8, "copy");
    v13 = (void *)objc_msgSend(v9, "copy");
    objc_storeStrong((id *)&self->_primaryDesiredIndicatorTypes, v12);
    objc_storeStrong((id *)&self->_secondaryDesiredIndicatorTypes, v13);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v12);
    -[CAMControlStatusBar _setAllDesiredTypes:](self, "_setAllDesiredTypes:", v14);
    -[CAMControlStatusBar _ensureDesiredIndicators](self, "_ensureDesiredIndicators");
    if (v5)
    {
      -[CAMControlStatusBar _prelayoutForNewTypes:oldTypes:atOrigin:](self, "_prelayoutForNewTypes:oldTypes:atOrigin:", v12, v10, 0);
      -[CAMControlStatusBar _prelayoutForNewTypes:oldTypes:atOrigin:](self, "_prelayoutForNewTypes:oldTypes:atOrigin:", v13, v11, 1);
      -[CAMControlStatusBar setNeedsLayout](self, "setNeedsLayout");
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __95__CAMControlStatusBar_setPrimaryDesiredIndicatorTypes_secondaryDesiredIndicatorTypes_animated___block_invoke;
      v15[3] = &unk_1EA328868;
      v15[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v15, 0, 0.5, 0.0, 1.0, 1.0);
    }
    else
    {
      -[CAMControlStatusBar setNeedsLayout](self, "setNeedsLayout");
    }

  }
}

uint64_t __95__CAMControlStatusBar_setPrimaryDesiredIndicatorTypes_secondaryDesiredIndicatorTypes_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)isIndicatorDesiredForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[CAMControlStatusBar _allDesiredTypes](self, "_allDesiredTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (void)collapseExpandedIndicatorAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMControlStatusBar _expandedControl](self, "_expandedControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpanded:animated:", 0, v3);

}

- (BOOL)isControlExpanded
{
  void *v2;
  BOOL v3;

  -[CAMControlStatusBar _expandedControl](self, "_expandedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setDirectionIndicatorVisible:(BOOL)a3
{
  -[CAMControlStatusBar setDirectionIndicatorVisible:animated:](self, "setDirectionIndicatorVisible:animated:", a3, 0);
}

- (void)setDirectionIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  CAMDirectionalIndicator *v7;
  CAMDirectionalIndicator *directionIndicator;

  if (self->_directionIndicatorVisible != a3)
  {
    v4 = a4;
    self->_directionIndicatorVisible = a3;
    if (a3)
    {
      -[CAMControlStatusBar directionIndicator](self, "directionIndicator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = objc_alloc_init(CAMDirectionalIndicator);
        directionIndicator = self->_directionIndicator;
        self->_directionIndicator = v7;

        -[CAMControlStatusBar addSubview:](self, "addSubview:", self->_directionIndicator);
        if (v4)
          -[CAMDirectionalIndicator setAlpha:](self->_directionIndicator, "setAlpha:", 0.0);
      }
    }
    -[CAMControlStatusBar _updateDirectionIndicatorAlphaAnimated:](self, "_updateDirectionIndicatorAlphaAnimated:", v4);
  }
}

- (void)_setDirectionIndicatorHiddenForSpace:(BOOL)a3
{
  if (self->__directionIndicatorHiddenForSpace != a3)
  {
    self->__directionIndicatorHiddenForSpace = a3;
    -[CAMControlStatusBar _updateDirectionIndicatorAlphaAnimated:](self, "_updateDirectionIndicatorAlphaAnimated:", 0);
  }
}

- (void)_updateDirectionIndicatorAlphaAnimated:(BOOL)a3
{
  BOOL v4;
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  if (-[CAMControlStatusBar isDirectionIndicatorVisible](self, "isDirectionIndicatorVisible", a3)
    && !-[CAMControlStatusBar _isDirectionIndicatorHiddenForSpace](self, "_isDirectionIndicatorHiddenForSpace"))
  {
    -[CAMControlStatusBar _expandedControl](self, "_expandedControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  else
  {
    v4 = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__CAMControlStatusBar__updateDirectionIndicatorAlphaAnimated___block_invoke;
  v6[3] = &unk_1EA328908;
  v6[4] = self;
  v7 = v4;
  +[CAMView animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](CAMView, "animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v6, 0, 0.5, 1.0, 1.0);
}

void __62__CAMControlStatusBar__updateDirectionIndicatorAlphaAnimated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "directionIndicator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)setPrimaryAccessoryControl:(id)a3
{
  UIView *v5;
  UIView **p_primaryAccessoryControl;
  CAMControlStatusBar *v7;
  CAMControlStatusBar *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_primaryAccessoryControl = &self->_primaryAccessoryControl;
  if (self->_primaryAccessoryControl != v5)
  {
    v9 = v5;
    v7 = self;
    -[UIView superview](*p_primaryAccessoryControl, "superview");
    v8 = (CAMControlStatusBar *)objc_claimAutoreleasedReturnValue();

    if (v8 == v7)
      -[UIView removeFromSuperview](*p_primaryAccessoryControl, "removeFromSuperview");
    objc_storeStrong((id *)p_primaryAccessoryControl, a3);
    -[CAMControlStatusBar addSubview:](v7, "addSubview:", *p_primaryAccessoryControl);

    v5 = v9;
  }

}

- (void)setSecondaryAccessoryControl:(id)a3
{
  -[CAMControlStatusBar setSecondaryAccessoryControl:animated:](self, "setSecondaryAccessoryControl:animated:", a3, 0);
}

- (void)setSecondaryAccessoryControl:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIView *v7;
  UIView **p_secondaryAccessoryControl;
  CAMControlStatusBar *v9;
  CAMControlStatusBar *v10;
  _QWORD v11[5];

  v4 = a4;
  v7 = (UIView *)a3;
  p_secondaryAccessoryControl = &self->_secondaryAccessoryControl;
  if (self->_secondaryAccessoryControl == v7)
    goto LABEL_10;
  v9 = self;
  -[UIView superview](*p_secondaryAccessoryControl, "superview");
  v10 = (CAMControlStatusBar *)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    -[UIView removeFromSuperview](*p_secondaryAccessoryControl, "removeFromSuperview");
    if (!v4)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (v4)
LABEL_4:
    -[CAMControlStatusBar layoutIfNeeded](v9, "layoutIfNeeded");
LABEL_5:
  objc_storeStrong((id *)p_secondaryAccessoryControl, a3);
  if (v7)
    -[CAMControlStatusBar addSubview:](v9, "addSubview:", *p_secondaryAccessoryControl);
  -[CAMControlStatusBar setNeedsLayout](v9, "setNeedsLayout");
  if (v4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__CAMControlStatusBar_setSecondaryAccessoryControl_animated___block_invoke;
    v11[3] = &unk_1EA328868;
    v11[4] = v9;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v11, 0, 0.5, 0.0, 1.0, 1.0);
  }

LABEL_10:
}

uint64_t __61__CAMControlStatusBar_setSecondaryAccessoryControl_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMControlStatusBar setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v12, "supportsOrientations"))
            objc_msgSend(v12, "setOrientation:animated:", a3, v4);
          else
            +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v12, a3, v4);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)_ensureDesiredIndicators
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CAMControlStatusBar _allDesiredTypes](self, "_allDesiredTypes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "integerValue");
        -[CAMControlStatusBar _loadIndicatorIfNeededForType:](self, "_loadIndicatorIfNeededForType:", v8);
        -[CAMControlStatusBar _installIndicatorIfNeededForType:](self, "_installIndicatorIfNeededForType:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_loadIndicatorIfNeededForType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CAMControlStatusBar _createIndicatorForType:](self, "_createIndicatorForType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOrientation:", -[CAMControlStatusBar orientation](self, "orientation"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v7);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "setDelegate:", self);
    -[CAMControlStatusBar delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "controlStatusBar:didCreateIndicatorForType:", self, a3);

  }
}

- (void)_installIndicatorIfNeededForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  CAMControlStatusBar *v7;
  CAMControlStatusBar *v8;

  v8 = self;
  -[CAMControlStatusBar _statusIndicatorsByType](v8, "_statusIndicatorsByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "superview");
    v7 = (CAMControlStatusBar *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
      -[CAMControlStatusBar addSubview:](v8, "addSubview:", v6);
  }

}

- (void)_updateIndicatorsVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = a3;
  -[CAMControlStatusBar _allVisibleTypes](self, "_allVisibleTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = 0.5;
  else
    v6 = 0.0;
  -[CAMControlStatusBar _expandedControl](self, "_expandedControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__CAMControlStatusBar__updateIndicatorsVisibilityAnimated___block_invoke;
  v10[3] = &unk_1EA329360;
  v10[4] = self;
  v11 = v5;
  v12 = v7;
  v8 = v7;
  v9 = v5;
  +[CAMView animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](CAMView, "animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v10, 0, v6, 1.0, 1.0);

}

void __59__CAMControlStatusBar__updateIndicatorsVisibilityAnimated___block_invoke(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "_statusIndicatorsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__CAMControlStatusBar__updateIndicatorsVisibilityAnimated___block_invoke_2;
  v3[3] = &unk_1EA32E100;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __59__CAMControlStatusBar__updateIndicatorsVisibilityAnimated___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  int v6;
  double v7;
  id v8;
  double v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v10 = a3;
  v6 = objc_msgSend(v5, "containsObject:", a2);
  v7 = 0.0;
  if (v6)
  {
    v8 = *(id *)(a1 + 40);
    v7 = 1.0;
    v9 = 0.0;
    if (v8 == v10)
      v9 = 1.0;
    if (v8)
      v7 = v9;
  }
  objc_msgSend(v10, "setAlpha:", v7);

}

- (void)controlStatusIndicatorDidChangeIntrinsicContentSize:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  v4 = a4;
  -[CAMControlStatusBar setNeedsLayout](self, "setNeedsLayout", a3);
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__CAMControlStatusBar_controlStatusIndicatorDidChangeIntrinsicContentSize_animated___block_invoke;
    v6[3] = &unk_1EA328868;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v6, 0, 0.5, 0.0, 1.0, 1.0);
  }
}

uint64_t __84__CAMControlStatusBar_controlStatusIndicatorDidChangeIntrinsicContentSize_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)expandingControl:(id)a3 willChangeExpanded:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a3;
  -[CAMControlStatusBar delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controlStatusBar:willChangeExpandingControl:expanded:", self, v8, v5);

  if (v5)
    -[CAMControlStatusBar _updateExpandingInsetsForControl:](self, "_updateExpandingInsetsForControl:", v8);

}

- (void)expandingControl:(id)a3 didChangeExpanded:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v6 = a4;
  v13 = a3;
  -[CAMControlStatusBar _expandedControl](self, "_expandedControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    -[CAMControlStatusBar _setExpandedControl:](self, "_setExpandedControl:", v13);
    objc_msgSend(v9, "setExpanded:animated:", 0, v5);
    objc_msgSend(v13, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bringSubviewToFront:", v13);

LABEL_6:
    -[CAMControlStatusBar _updateIndicatorsVisibilityAnimated:](self, "_updateIndicatorsVisibilityAnimated:", v5);
    -[CAMControlStatusBar _updateDirectionIndicatorAlphaAnimated:](self, "_updateDirectionIndicatorAlphaAnimated:", v5);
    goto LABEL_7;
  }

  if (v9 == v13)
    -[CAMControlStatusBar _setExpandedControl:](self, "_setExpandedControl:", 0);
  -[CAMControlStatusBar _expandedControl](self, "_expandedControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_6;
LABEL_7:
  -[CAMControlStatusBar delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "controlStatusBar:didChangeExpandingControl:expanded:", self, v13, v6);

}

- (void)_iterateViewsForHUDManager:(id)a3 withItemFoundBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  _BOOL4 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGPoint v35;
  CGPoint v36;
  CGPoint v37;
  CGPoint v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[CAMControlStatusBar _expandedControl](self, "_expandedControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CAMControlStatusBar _expandedControl](self, "_expandedControl");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v10 = (void *)v9;
    v7[2](v7, v9);

    goto LABEL_23;
  }
  objc_msgSend(v6, "locationOfAccessibilityGestureInView:", self);
  v12 = v11;
  v14 = v13;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CAMControlStatusBar _allVisibleTypes](self, "_allVisibleTypes", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    while (2)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v19);
        -[CAMControlStatusBar _statusIndicatorsByType](self, "_statusIndicatorsByType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "frame");
        v35.x = v12;
        v35.y = v14;
        if (CGRectContainsPoint(v39, v35))
        {
          v7[2](v7, (uint64_t)v22);

          goto LABEL_22;
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v17)
        continue;
      break;
    }
  }

  if (-[CAMControlStatusBar isDirectionIndicatorVisible](self, "isDirectionIndicatorVisible"))
  {
    -[CAMControlStatusBar directionIndicator](self, "directionIndicator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v36.x = v12;
    v36.y = v14;
    v24 = CGRectContainsPoint(v40, v36);

    if (v24)
    {
      -[CAMControlStatusBar directionIndicator](self, "directionIndicator");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
  -[CAMControlStatusBar primaryAccessoryControl](self, "primaryAccessoryControl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusBar secondaryAccessoryControl](self, "secondaryAccessoryControl");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "conformsToProtocol:", &unk_1F03116F0))
  {
    objc_msgSend(v15, "frame");
    v37.x = v12;
    v37.y = v14;
    v26 = CGRectContainsPoint(v41, v37);
    v27 = (uint64_t)v15;
    if (v26)
      goto LABEL_20;
  }
  if (objc_msgSend(v25, "conformsToProtocol:", &unk_1F03116F0))
  {
    objc_msgSend(v25, "frame");
    v38.x = v12;
    v38.y = v14;
    v28 = CGRectContainsPoint(v42, v38);
    v27 = (uint64_t)v25;
    if (v28)
LABEL_20:
      v7[2](v7, v27);
  }

LABEL_22:
LABEL_23:

}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__19;
  v15 = __Block_byref_object_dispose__19;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__CAMControlStatusBar_hudItemForAccessibilityHUDManager___block_invoke;
  v8[3] = &unk_1EA328A90;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[CAMControlStatusBar _iterateViewsForHUDManager:withItemFoundBlock:](self, "_iterateViewsForHUDManager:withItemFoundBlock:", v5, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __57__CAMControlStatusBar_hudItemForAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "hudItemForAccessibilityHUDManager:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CAMControlStatusBar_selectedByAccessibilityHUDManager___block_invoke;
  v6[3] = &unk_1EA328AB8;
  v7 = v4;
  v5 = v4;
  -[CAMControlStatusBar _iterateViewsForHUDManager:withItemFoundBlock:](self, "_iterateViewsForHUDManager:withItemFoundBlock:", v5, v6);

}

uint64_t __57__CAMControlStatusBar_selectedByAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectedByAccessibilityHUDManager:", *(_QWORD *)(a1 + 32));
}

- (CAMControlStatusBarDelegate)delegate
{
  return (CAMControlStatusBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)primaryDesiredIndicatorTypes
{
  return self->_primaryDesiredIndicatorTypes;
}

- (NSArray)secondaryDesiredIndicatorTypes
{
  return self->_secondaryDesiredIndicatorTypes;
}

- (BOOL)isDirectionIndicatorVisible
{
  return self->_directionIndicatorVisible;
}

- (CAMDirectionalIndicator)directionIndicator
{
  return self->_directionIndicator;
}

- (UIView)primaryAccessoryControl
{
  return self->_primaryAccessoryControl;
}

- (UIView)secondaryAccessoryControl
{
  return self->_secondaryAccessoryControl;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSMutableDictionary)_statusIndicatorsByType
{
  return self->__statusIndicatorsByType;
}

- (NSSet)_allVisibleTypes
{
  return self->__allVisibleTypes;
}

- (void)_setAllVisibleTypes:(id)a3
{
  objc_storeStrong((id *)&self->__allVisibleTypes, a3);
}

- (NSSet)_allDesiredTypes
{
  return self->__allDesiredTypes;
}

- (void)_setAllDesiredTypes:(id)a3
{
  objc_storeStrong((id *)&self->__allDesiredTypes, a3);
}

- (BOOL)_isDirectionIndicatorHiddenForSpace
{
  return self->__directionIndicatorHiddenForSpace;
}

- (CAMExpandingControl)_expandedControl
{
  return self->__expandedControl;
}

- (void)_setExpandedControl:(id)a3
{
  objc_storeStrong((id *)&self->__expandedControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__expandedControl, 0);
  objc_storeStrong((id *)&self->__allDesiredTypes, 0);
  objc_storeStrong((id *)&self->__allVisibleTypes, 0);
  objc_storeStrong((id *)&self->__statusIndicatorsByType, 0);
  objc_storeStrong((id *)&self->_secondaryAccessoryControl, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryControl, 0);
  objc_storeStrong((id *)&self->_directionIndicator, 0);
  objc_storeStrong((id *)&self->_secondaryDesiredIndicatorTypes, 0);
  objc_storeStrong((id *)&self->_primaryDesiredIndicatorTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

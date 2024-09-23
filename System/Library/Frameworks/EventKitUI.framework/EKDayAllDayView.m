@implementation EKDayAllDayView

- (void)setShowsBorderLines:(BOOL)a3
{
  _BOOL4 v3;
  UIView *dividerLineViewBottom;
  UIView *v6;
  UIView *v7;
  id v8;

  if (self->_showsBorderLines != a3)
  {
    v3 = a3;
    self->_showsBorderLines = a3;
    -[UIView setHidden:](self->_dividerLineViewTop, "setHidden:", 1);
    dividerLineViewBottom = self->_dividerLineViewBottom;
    if (v3)
    {
      if (!dividerLineViewBottom)
      {
        v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v7 = self->_dividerLineViewBottom;
        self->_dividerLineViewBottom = v6;

        if (self->_dividerLineVisualEffectColor)
        {
          -[UIView setBackgroundColor:](self->_dividerLineViewBottom, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
          v8 = (id)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](self->_dividerLineViewBottom, "setBackgroundColor:", v8);

        }
      }
    }
    else
    {
      -[UIView setHidden:](dividerLineViewBottom, "setHidden:", 1);
    }
  }
}

- (void)setShowsLabel:(BOOL)a3
{
  if (self->_showsLabel != a3)
  {
    self->_showsLabel = a3;
    -[UILabel setHidden:](self->_allDay, "setHidden:", !a3);
  }
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
  if (!self->_smallTextSettingLocked)
  {
    self->_usesSmallText = (unint64_t)(a3 - 3) < 2;
    -[EKDayAllDayView _smallTextSettingChanged](self, "_smallTextSettingChanged");
  }
}

- (void)_smallTextSettingChanged
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;

  v3 = -[NSMutableArray count](self->_occurrenceViews, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_occurrenceViews, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUsesSmallText:", self->_usesSmallText);

    }
  }
  -[EKDayAllDayView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double occurrenceInset;
  double v4;
  double v5;
  double v6;
  double v7;
  EKDayAllDayView *v8;
  EKDayAllDayView *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  UIScrollView *scroller;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  int IsLeftToRight;
  double v29;
  uint64_t v30;
  UIScrollView *v31;
  UIScrollView *v32;
  void *v33;
  float v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *v43;
  void *v44;
  int v45;
  double v46;
  void *v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  void *v53;
  UIScrollView *v54;
  _BOOL4 v55;
  _BOOL4 v56;
  _BOOL4 v57;
  char v58;
  double v59;
  _BOOL4 v60;
  double v61;
  double v62;
  int v63;
  int v64;
  void *v65;
  float v66;
  float v67;
  double v68;
  double v69;
  double v70;
  double v71;
  _BOOL4 IsRegularInViewHierarchy;
  double v73;
  id WeakRetained;
  id v75;
  int v76;
  uint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  UIScrollView *v84;
  double v85;
  double v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  id v93;
  void *v94;
  UIScrollView *v95;
  UIScrollView *v96;
  double v97;
  double v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  float v103;
  id v104;
  char v105;
  id v106;
  double v107;
  EKUIVisualEffectView *dividerLineSuperview;
  EKDayAllDayView *v109;
  EKDayAllDayView *v110;
  void *v111;
  UIView *dividerLineViewTop;
  void *v113;
  UIView *dividerLineViewBottom;
  CGFloat v115;
  EKUIVisualEffectView *v116;
  unint64_t v117;
  unint64_t v118;
  double v119;
  double v120;
  double v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  NSMutableArray *v126;
  UIScrollView *v127;
  CGRect v128;

  occurrenceInset = self->_occurrenceInset;
  +[EKDayOccurrenceView minimumHeightForSizeClass:orientation:isAllDay:](EKDayOccurrenceView, "minimumHeightForSizeClass:orientation:isAllDay:", -[EKDayAllDayView _sizeClass](self, "_sizeClass"), self->_orientation, 1);
  v5 = v4;
  -[EKDayAllDayView bounds](self, "bounds");
  v7 = v6;
  v8 = self;
  v9 = v8;
  if (v8->_showBirthdayCount && v8->_birthdayCountOccurrenceView)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8->_occurrenceViews;
  }
  v11 = v10;
  v12 = v7 - occurrenceInset;
  v13 = -[NSMutableArray count](v10, "count");
  -[EKDayAllDayView bounds](v9, "bounds");
  scroller = v9->_scroller;
  v117 = v13 + 1;
  v118 = (unint64_t)(v13 + 1) >> 1;
  v124 = v13;
  if (v118 <= v9->_maxVisibleRows)
  {
    if (!scroller)
    {
      v127 = (UIScrollView *)v9;
      goto LABEL_17;
    }
    -[UIScrollView removeFromSuperview](scroller, "removeFromSuperview");
    v24 = v9->_scroller;
    v9->_scroller = 0;
    v127 = (UIScrollView *)v9;
  }
  else
  {
    v17 = v15;
    if (scroller)
    {
      -[UIScrollView frame](scroller, "frame");
      v19 = v18;
      v21 = v20;
      v22 = v17 - self->_occurrenceInset;
      v23 = 0.0;
      if (CalInterfaceIsLeftToRight())
        v23 = self->_occurrenceInset;
      -[UIScrollView setFrame:](v9->_scroller, "setFrame:", v23, v19, v22, v21);
    }
    else
    {
      -[EKDayAllDayView _allDayAreaHeightForEventCount:](v9, "_allDayAreaHeightForEventCount:", v13);
      v26 = v25;
      v27 = objc_alloc(MEMORY[0x1E0DC3C28]);
      IsLeftToRight = CalInterfaceIsLeftToRight();
      v29 = 0.0;
      if (IsLeftToRight)
        v29 = self->_occurrenceInset;
      v30 = objc_msgSend(v27, "initWithFrame:", v29, 0.0, v17 - self->_occurrenceInset, v26);
      v31 = v9->_scroller;
      v9->_scroller = (UIScrollView *)v30;

      v32 = v9->_scroller;
      -[EKDayAllDayView backgroundColor](v9, "backgroundColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView setBackgroundColor:](v32, "setBackgroundColor:", v33);

    }
    -[EKDayAllDayView addSubview:](v9, "addSubview:", v9->_scroller);
    v127 = v9->_scroller;
    occurrenceInset = 0.0;
    v24 = v9;
  }

LABEL_17:
  v34 = v5;
  *(float *)&v14 = v34;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_opt_new();
  CalRoundToScreenScale(v12 * 0.5);
  v38 = v37;
  -[EKDayAllDayView _selectedCopyView](v9, "_selectedCopyView");
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v39;
  v126 = v11;
  if (!v13)
  {
    v94 = 0;
    if (!v39)
      goto LABEL_84;
    goto LABEL_81;
  }
  v125 = (void *)v39;
  v41 = 0;
  v42 = v38 + -2.0;
  do
  {
    -[NSMutableArray objectAtIndex:](v11, "objectAtIndex:", v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "currentImageState");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "requiresLanguageAwarePadding");

    if (v45)
    {
      v47 = (void *)MEMORY[0x1E0CB37E8];
      -[EKDayAllDayView _languageAwareAllDayEventHeight:](v9, "_languageAwareAllDayEventHeight:", v43);
      *(float *)&v48 = v48;
      objc_msgSend(v47, "numberWithFloat:", v48);
      v49 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "addObject:", v49);
      if ((v41 & 1) != 0)
        objc_msgSend(v36, "replaceObjectAtIndex:withObject:", v41 - 1, v49);
      v35 = (void *)v49;
    }
    else
    {
      if ((v41 & 1) == 0)
      {
        *(float *)&v46 = v34;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
        v50 = objc_claimAutoreleasedReturnValue();

        v35 = (void *)v50;
      }
      objc_msgSend(v36, "addObject:", v35);
    }

    ++v41;
  }
  while (v13 != v41);
  v123 = 0;
  v51 = 0;
  v120 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v121 = occurrenceInset + 2.0;
  v119 = v12 + -4.0;
  v122 = v13 - 1;
  v52 = 4.0;
  do
  {
    -[NSMutableArray objectAtIndex:](v11, "objectAtIndex:", v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "superview");
    v54 = (UIScrollView *)objc_claimAutoreleasedReturnValue();

    if (v54 != v127)
      -[UIScrollView addSubview:](v127, "addSubview:", v53);
    v55 = -[EKDayAllDayView forceSingleColumnLayout](v9, "forceSingleColumnLayout");
    v56 = v55;
    v57 = (v51 & 1) == 0 && v122 == v51;
    v58 = (v51 & 1) == 0 || v55;
    if (CalInterfaceIsLeftToRight())
    {
      if ((v51 & 1) != 0)
        v59 = v42;
      else
        v59 = 0.0;
      v60 = -[EKDayAllDayView forceSingleColumnLayout](v9, "forceSingleColumnLayout");
      v61 = -0.0;
      if (!v60)
        v61 = v59;
      v62 = v121 + v61;
    }
    else
    {
      v63 = -[EKDayAllDayView forceSingleColumnLayout](v9, "forceSingleColumnLayout");
      if ((v51 & 1) != 0)
        v64 = v63;
      else
        v64 = 1;
      if (v64)
        v62 = 0.0;
      else
        v62 = v42;
    }
    objc_msgSend(v36, "objectAtIndex:", v51);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "floatValue");
    v67 = v66;

    v68 = 0.0;
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v9))
      v68 = CalFloorToScreenScale(-0.5);
    v69 = v67;
    v70 = v42 + -1.0;
    if (((((v51 & 1) == 0) ^ v57) & ~v56 & 1) != 0)
      goto LABEL_56;
    if ((v58 & 1) != 0)
    {
      if (v56 || v57)
        v70 = v119;
      else
        v70 = v120;
LABEL_56:
      if ((v51 & 1) == 0)
      {
        v71 = v52;
        if (!-[EKDayAllDayView forceSingleColumnLayout](v9, "forceSingleColumnLayout"))
          goto LABEL_63;
      }
      goto LABEL_62;
    }
    IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v9);
    v73 = 0.0;
    if (IsRegularInViewHierarchy)
      v73 = 1.0;
    v62 = v62 + v73;
    v70 = v42 + -1.0 + v68;
LABEL_62:
    v71 = v52 + v69 + 2.0;
LABEL_63:
    objc_msgSend(v53, "setFrame:", v62, v52, v70, v69);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v75 = objc_loadWeakRetained((id *)&v9->_delegate);
      v76 = objc_msgSend(v75, "allDayViewContentShouldDrawSynchronously:", v9);

      if (v76)
        v77 = 16;
      else
        v77 = 0;
    }
    else
    {

      v77 = 0;
    }
    objc_msgSend(v53, "requestContentIfNeeded:completion:", v77, 0);
    if (!v51)
    {
      -[UILabel frame](v9->_allDay, "frame");
      v79 = v78;
      v81 = v80;
      v83 = v82;
      v84 = v9->_scroller;
      if (v84)
        -[UIScrollView frame](v84, "frame");
      else
        v85 = 0.0;
      CalRoundToScreenScale(v52 + (v69 - v83) * 0.5 + v85 + 0.5);
      -[UILabel setFrame:](v9->_allDay, "setFrame:", v79, v86, v81, v83);
    }
    objc_msgSend(v53, "occurrence");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "isEqual:", v9->_dimmedOccurrence);

    if (v88)
    {
      -[EKDayAllDayView occurrenceViewForEvent:](v9, "occurrenceViewForEvent:", v9->_dimmedOccurrence);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "setDimmed:", 1);

    }
    objc_msgSend(v53, "occurrence");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "occurrence");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (v92)
    {
      v93 = v53;

      v123 = v93;
    }

    ++v51;
    v52 = v71;
  }
  while (v124 != v51);
  v40 = v125;
  v94 = v123;
  if (!v125)
    goto LABEL_84;
LABEL_81:
  objc_msgSend(v40, "superview");
  v95 = (UIScrollView *)objc_claimAutoreleasedReturnValue();

  if (v95 != v127)
  {
    -[UIScrollView addSubview:](v127, "addSubview:", v40);
    if (!v94)
      goto LABEL_84;
    goto LABEL_83;
  }
  -[UIScrollView bringSubviewToFront:](v127, "bringSubviewToFront:", v40);
  if (v94)
  {
LABEL_83:
    objc_msgSend(v94, "frame");
    objc_msgSend(v40, "setFrame:");
  }
LABEL_84:
  v96 = v9->_scroller;
  if (v96)
  {
    -[UIScrollView bounds](v96, "bounds");
    v98 = v97;
    v99 = 0.0;
    if (v117 >= 2)
    {
      v100 = 0;
      if (v118 <= 1)
        v101 = 1;
      else
        v101 = v118;
      do
      {
        objc_msgSend(v36, "objectAtIndex:", v100);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "floatValue");
        v99 = v99 + v103;

        v100 += 2;
        --v101;
      }
      while (v101);
    }
    -[UIScrollView setContentSize:](v9->_scroller, "setContentSize:", v98, v99 + (double)(v118 - 1) * 2.0 + 4.0 + 4.0);
  }
  v104 = objc_loadWeakRetained((id *)&v9->_delegate);
  v105 = objc_opt_respondsToSelector();

  if ((v105 & 1) != 0)
  {
    v106 = objc_loadWeakRetained((id *)&v9->_delegate);
    objc_msgSend(v106, "allDayViewDidLayoutSubviews:", v9);

  }
  v107 = EKUISeparatorLineThickness();
  dividerLineSuperview = v9->_dividerLineSuperview;
  if (dividerLineSuperview)
  {
    -[EKUIVisualEffectView contentView](dividerLineSuperview, "contentView");
    v109 = (EKDayAllDayView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v109 = v9;
  }
  v110 = v109;
  -[UIView superview](v9->_dividerLineViewTop, "superview");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v111)
  {
    -[EKDayAllDayView addSubview:](v110, "addSubview:", v9->_dividerLineViewTop);
    -[UIView setAutoresizingMask:](v9->_dividerLineViewTop, "setAutoresizingMask:", 34);
    dividerLineViewTop = v9->_dividerLineViewTop;
    -[EKDayAllDayView frame](v9, "frame");
    -[UIView setFrame:](dividerLineViewTop, "setFrame:", 0.0, 0.0);
  }
  -[UIView superview](v9->_dividerLineViewBottom, "superview");
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v113)
  {
    -[EKDayAllDayView addSubview:](v110, "addSubview:", v9->_dividerLineViewBottom);
    -[UIView setAutoresizingMask:](v9->_dividerLineViewBottom, "setAutoresizingMask:", 10);
    dividerLineViewBottom = v9->_dividerLineViewBottom;
    -[EKDayAllDayView bounds](v9, "bounds");
    v115 = CGRectGetMaxY(v128) - v107;
    -[EKDayAllDayView frame](v9, "frame");
    -[UIView setFrame:](dividerLineViewBottom, "setFrame:", 0.0, v115);
  }
  v116 = v9->_dividerLineSuperview;
  if (!v116)
  {
    -[EKDayAllDayView bringSubviewToFront:](v9, "bringSubviewToFront:", v9->_dividerLineViewTop);
    v116 = (EKUIVisualEffectView *)v9->_dividerLineViewBottom;
  }
  -[EKDayAllDayView bringSubviewToFront:](v9, "bringSubviewToFront:", v116);

}

- (int64_t)_sizeClass
{
  void *v3;

  -[EKDayAllDayView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return EKUIWidthSizeClassForViewHierarchy(self);
  else
    return self->_targetSizeClass;
}

- (id)_selectedCopyView
{
  void *v3;

  -[EKDayAllDayView _findSelectedCopySubviewOfView:](self, "_findSelectedCopySubviewOfView:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKDayAllDayView _findSelectedCopySubviewOfView:](self, "_findSelectedCopySubviewOfView:", self->_scroller);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_findSelectedCopySubviewOfView:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          if ((objc_msgSend(v9, "isSelectedCopyView") & 1) != 0)
            goto LABEL_12;

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAllowsOccurrenceSelection:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;

  if (self->_allowSelection != a3)
  {
    v3 = a3;
    self->_allowSelection = a3;
    v5 = -[NSMutableArray count](self->_occurrenceViews, "count");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_occurrenceViews, "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setEnabled:", v3);

      }
    }
  }
}

- (void)setOccurrences:(id)a3
{
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  NSMutableArray *occurrenceViews;
  NSMutableArray *v32;
  NSMutableArray *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  EKEvent *selectedEvent;
  _BOOL8 v42;
  void *v43;
  void *v44;
  id v45;

  v45 = a3;
  -[EKDayAllDayView _saveTemporaryViews](self, "_saveTemporaryViews");
  -[EKDayAllDayView removeAllOccurrenceViews](self, "removeAllOccurrenceViews");
  v4 = objc_msgSend(v45, "count");
  self->_birthdayCount = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "allDayViewRequestsCurrentDisplayDate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "calendarDateForDay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteTime");
  v9 = v8;

  objc_msgSend(v6, "calendarDateForEndOfDay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteTime");
  v12 = v11;

  v13 = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_opt_respondsToSelector();

  v43 = v6;
  if ((v14 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    v16 = objc_msgSend(v15, "allDayViewShouldAnnotateAppEntities:", self);

    if (!v4)
      goto LABEL_19;
  }
  else
  {
    v16 = 0;
    if (!v4)
      goto LABEL_19;
  }
  v17 = 0;
  v18 = v12 + 1.0;
  v19 = *MEMORY[0x1E0C9D648];
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  do
  {
    objc_msgSend(v45, "objectAtIndexedSubscript:", v17, v43);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "calendarItemIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_temporaryViewCache, "objectForKeyedSubscript:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      -[NSMutableDictionary removeObjectForKey:](self->_temporaryViewCache, "removeObjectForKey:", v24);
    }
    else
    {
      +[EKDayOccurrenceView occurrenceViewWithFrame:](EKDayOccurrenceView, "occurrenceViewWithFrame:", v19, v20, v21, v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v26, "setOccurrence:", v23);
    objc_msgSend(v26, "setUsesSmallText:", self->_usesSmallText);
    objc_msgSend(v26, "setAllDayDrawingStyle:", 1);
    objc_msgSend(v26, "setDelegate:", self);
    objc_msgSend(v26, "setIsSelectedCopyView:", 0);
    objc_msgSend(v23, "startDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceReferenceDate");
    objc_msgSend(v26, "setHasPrecedingDuration:", v28 < v9);

    objc_msgSend(v23, "endDateUnadjustedForLegacyClients");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    objc_msgSend(v26, "setHasTrailingDuration:", v30 > v18);

    objc_msgSend(v26, "setMultiAllDayRoundCorners:", 1);
    objc_msgSend(v26, "setShouldAnnotateAppEntities:", v16);
    if (-[EKDayAllDayView hideOccurrenceBackground](self, "hideOccurrenceBackground"))
      objc_msgSend(v26, "setHideBackgroundImage:", 1);
    else
      objc_msgSend(v26, "setOpaque:", 1);
    -[EKDayAllDayView _configureOccurrenceViewMarginAndPadding:](self, "_configureOccurrenceViewMarginAndPadding:", v26);
    if (!self->_showBirthdayCount)
      -[EKDayAllDayView addSubview:](self, "addSubview:", v26);
    occurrenceViews = self->_occurrenceViews;
    if (!occurrenceViews)
    {
      v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v33 = self->_occurrenceViews;
      self->_occurrenceViews = v32;

      occurrenceViews = self->_occurrenceViews;
    }
    -[NSMutableArray addObject:](occurrenceViews, "addObject:", v26);
    if (objc_msgSend(v26, "isBirthday"))
      ++self->_birthdayCount;

    ++v17;
  }
  while (v4 != v17);
LABEL_19:
  -[EKDayAllDayView _clearTemporaryViews](self, "_clearTemporaryViews", v43);
  -[EKDayAllDayView frame](self, "frame");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[EKDayAllDayView _height](self, "_height");
  -[EKDayAllDayView setFrame:](self, "setFrame:", v35, v37, v39, v40);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scroller, "setShowsHorizontalScrollIndicator:", 0);
  if (self->_selectedEvent && !-[EKDayAllDayView containsEvent:](self, "containsEvent:"))
  {
    selectedEvent = self->_selectedEvent;
    self->_selectedEvent = 0;

  }
  if (v4)
    v42 = !self->_showsLabel;
  else
    v42 = 1;
  -[UILabel setHidden:](self->_allDay, "setHidden:", v42);
  -[EKDayAllDayView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[EKDayAllDayView _height](self, "_height", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (double)_height
{
  double v3;
  double result;

  -[EKDayAllDayView fixedHeight](self, "fixedHeight");
  if (v3 >= 0.0)
    -[EKDayAllDayView fixedHeight](self, "fixedHeight");
  else
    -[EKDayAllDayView naturalHeight](self, "naturalHeight");
  return result;
}

- (double)fixedHeight
{
  return self->_fixedHeight;
}

- (double)naturalHeight
{
  uint64_t v3;
  double result;

  if (self->_showBirthdayCount)
    v3 = 1;
  else
    v3 = -[NSMutableArray count](self->_occurrenceViews, "count");
  -[EKDayAllDayView _allDayAreaHeightForEventCount:](self, "_allDayAreaHeightForEventCount:", v3);
  return result;
}

- (double)_allDayAreaHeightForEventCount:(int64_t)a3
{
  double v5;
  double v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  int64_t v10;
  double v11;
  void *v12;
  double v13;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;

  if (a3 < 1)
    return 0.0;
  +[EKDayOccurrenceView minimumHeightForSizeClass:orientation:isAllDay:](EKDayOccurrenceView, "minimumHeightForSizeClass:orientation:isAllDay:", -[EKDayAllDayView _sizeClass](self, "_sizeClass"), self->_orientation, 1);
  v6 = v5;
  if (-[EKDayAllDayView forceSingleColumnLayout](self, "forceSingleColumnLayout"))
    v7 = a3;
  else
    v7 = (unint64_t)(a3 + 1) >> 1;
  v8 = -[EKDayAllDayView forceSingleColumnLayout](self, "forceSingleColumnLayout");
  v9 = 0;
  if (a3 >= 4)
    v10 = 4;
  else
    v10 = a3;
  v11 = 0.0;
  do
  {
    -[NSMutableArray objectAtIndex:](self->_occurrenceViews, "objectAtIndex:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EKDayAllDayView forceSingleColumnLayout](self, "forceSingleColumnLayout"))
    {
LABEL_10:
      -[EKDayAllDayView _languageAwareAllDayEventHeight:](self, "_languageAwareAllDayEventHeight:", v12);
      v11 = v11 + v13;
      goto LABEL_24;
    }
    if ((v9 & 1) != 0)
    {
      -[NSMutableArray objectAtIndex:](self->_occurrenceViews, "objectAtIndex:", v9 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKDayAllDayView _languageAwareAllDayEventHeight:](self, "_languageAwareAllDayEventHeight:", v12);
      v18 = v17;
      -[EKDayAllDayView _languageAwareAllDayEventHeight:](self, "_languageAwareAllDayEventHeight:", v16);
      if (v18 >= v19)
        v19 = v18;
      v11 = v11 + v19;

    }
    else
    {
      v15 = a3 == 3 && v9 == 2;
      if (a3 == 1 || v15)
        goto LABEL_10;
    }
LABEL_24:

    ++v9;
  }
  while (v10 != v9);
  v20 = 2;
  if ((unint64_t)(a3 + 1) >> 1 < 2)
    v20 = (unint64_t)(a3 + 1) >> 1;
  if (v8)
    v20 = a3;
  v21 = floor(v11) + 4.0 + (double)(v20 - 1) * 2.0;
  v22 = v21 + 4.0;
  v23 = floor(v6 * 0.5) + 2.0 + v21;
  if (v7 >= 3)
    v24 = v23;
  else
    v24 = v22;
  if (-[EKDayAllDayView showsBorderLines](self, "showsBorderLines"))
    return v24 + EKUISeparatorLineThickness();
  return v24;
}

- (EKDayAllDayView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4
{
  EKDayAllDayView *v5;
  void *v6;
  uint64_t v7;
  UILabel *allDay;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *temporaryViewCache;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)EKDayAllDayView;
  v5 = -[EKDayAllDayView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    if (a4 == 1)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    else
      CUIKAllDayBackgroundColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayAllDayView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
    allDay = v5->_allDay;
    v5->_allDay = (UILabel *)v7;

    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_allDay, "setAdjustsFontSizeToFitWidth:", 1);
    v9 = v5->_allDay;
    EventKitUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("all-day"), &stru_1E601DFA8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9, "setText:", v11);

    -[UILabel setTextAlignment:](v5->_allDay, "setTextAlignment:", 2);
    v12 = v5->_allDay;
    objc_msgSend((id)objc_opt_class(), "allDayLabelFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

    v14 = v5->_allDay;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    -[UILabel sizeToFit](v5->_allDay, "sizeToFit");
    -[EKDayAllDayView addSubview:](v5, "addSubview:", v5->_allDay);
    v5->_allowSelection = 1;
    v5->_maxVisibleRows = 2;
    v5->_showsLabel = 1;
    v5->_fixedHeight = -1.0;
    v5->_targetSizeClass = a4;
    -[EKDayAllDayView setClipsToBounds:](v5, "setClipsToBounds:", 1);
    v16 = objc_opt_new();
    temporaryViewCache = v5->_temporaryViewCache;
    v5->_temporaryViewCache = (NSMutableDictionary *)v16;

  }
  return v5;
}

- (void)setOccurrenceInset:(double)a3 labelInset:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MaxX;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  self->_occurrenceInset = a3;
  -[UILabel frame](self->_allDay, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (CalInterfaceIsLeftToRight())
  {
    v12 = a4 - v9 + -1.0;
    if (v12 < 0.0)
    {
      v9 = v9 + v12;
      v12 = 0.0;
    }
  }
  else
  {
    -[EKDayAllDayView bounds](self, "bounds");
    v12 = CGRectGetWidth(v15) - a4 + 1.0;
    v16.origin.x = v12;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    MaxX = CGRectGetMaxX(v16);
    -[EKDayAllDayView bounds](self, "bounds");
    if (MaxX > CGRectGetMaxX(v17))
    {
      v18.origin.x = v12;
      v18.origin.y = v7;
      v18.size.width = v9;
      v18.size.height = v11;
      v14 = CGRectGetMaxX(v18);
      -[EKDayAllDayView bounds](self, "bounds");
      v9 = v9 - (v14 - CGRectGetMaxX(v19));
    }
  }
  -[UILabel setFrame:](self->_allDay, "setFrame:", v12, v7, v9, v11);
}

+ (id)allDayLabelFont
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;

  CalRoundToScreenScale(v5);
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", fmin(v6, 28.0));
}

- (void)removeAllOccurrenceViews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *occurrenceViews;

  v3 = -[NSMutableArray count](self->_occurrenceViews, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_occurrenceViews, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "occurrence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "calendarItemIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8
        || (-[NSMutableDictionary objectForKeyedSubscript:](self->_temporaryViewCache, "objectForKeyedSubscript:", v8),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            !v9))
      {
        objc_msgSend(v6, "removeFromSuperview");
      }

    }
  }
  occurrenceViews = self->_occurrenceViews;
  self->_occurrenceViews = 0;

}

- (void)_saveTemporaryViews
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_occurrenceViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "occurrence", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "calendarItemIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_temporaryViewCache, "setObject:forKeyedSubscript:", v8, v10);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)didMoveToWindow
{
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scroller, "setShowsHorizontalScrollIndicator:", 0);
}

- (void)setDimmedOccurrence:(id)a3
{
  EKEvent *v5;
  EKEvent *dimmedOccurrence;
  void *v7;
  void *v8;
  EKEvent *v9;

  v5 = (EKEvent *)a3;
  dimmedOccurrence = self->_dimmedOccurrence;
  v9 = v5;
  if (dimmedOccurrence != v5)
  {
    if (dimmedOccurrence)
    {
      -[EKDayAllDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDimmed:", 0);

    }
    objc_storeStrong((id *)&self->_dimmedOccurrence, a3);
    if (self->_dimmedOccurrence)
    {
      -[EKDayAllDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDimmed:", 1);

    }
  }

}

+ (id)allDayLabelBoldFont
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;

  CalRoundToScreenScale(v5);
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", fmin(v6, 28.0));
}

- (void)_clearTemporaryViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  -[NSMutableDictionary allValues](self->_temporaryViewCache, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_temporaryViewCache, "removeAllObjects");
}

+ (id)unscaledAllDayFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 11.0);
}

- (EKDayAllDayView)initWithFrame:(CGRect)a3
{
  return -[EKDayAllDayView initWithFrame:sizeClass:](self, "initWithFrame:sizeClass:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "allDayView:didSelectEvent:userInitiated:", self, 0, 1);

      }
    }
  }
  else
  {
    v5 = 0;
  }

}

- (double)firstEventYOffset
{
  return 4.0;
}

- (id)occurrenceViewForEvent:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_occurrenceViews;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "occurrence", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (double)nextAvailableOccurrenceViewYOrigin
{
  double v3;
  double v4;
  void *v5;
  CGRect v7;

  -[EKDayAllDayView firstEventYOffset](self, "firstEventYOffset");
  v4 = v3;
  if (-[NSMutableArray count](self->_occurrenceViews, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_occurrenceViews, "objectAtIndex:", -[NSMutableArray count](self->_occurrenceViews, "count") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v4 = CGRectGetMaxY(v7) + 2.0;

  }
  return v4;
}

- (void)addViewToScroller:(id)a3
{
  id v4;
  UIScrollView *v5;
  UIScrollView *scroller;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v4 = a3;
  if (self->_scroller)
  {
    v16 = v4;
    objc_msgSend(v4, "superview");
    v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
    scroller = self->_scroller;

    v4 = v16;
    if (v5 != scroller)
    {
      objc_msgSend(v16, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      objc_msgSend(v7, "convertRect:toView:", self->_scroller);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;

      -[UIScrollView addSubview:](self->_scroller, "addSubview:", v16);
      objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
      v4 = v16;
    }
  }

}

- (BOOL)containsEvent:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_occurrenceViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "occurrence", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)selectedEvent
{
  return self->_selectedEvent;
}

- (void)selectEvent:(id)a3
{
  EKEvent *v6;
  void *v7;
  EKEvent *v8;

  v6 = (EKEvent *)a3;
  if (self->_selectedEvent != v6)
  {
    v8 = v6;
    if (v6 && !-[EKDayAllDayView containsEvent:](self, "containsEvent:", v6))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKDayAllDayView.m"), 421, CFSTR("Attempt to select an event not contained by this all-day view"));

    }
    objc_storeStrong((id *)&self->_selectedEvent, a3);
    v6 = v8;
  }

}

- (void)lockUseOfSmallTextToState:(BOOL)a3
{
  self->_usesSmallText = a3;
  self->_smallTextSettingLocked = 1;
  -[EKDayAllDayView _smallTextSettingChanged](self, "_smallTextSettingChanged");
}

- (double)_languageAwareAllDayEventHeight:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  void *v9;
  double v10;

  v4 = a3;
  +[EKDayOccurrenceView minimumHeightForSizeClass:orientation:isAllDay:](EKDayOccurrenceView, "minimumHeightForSizeClass:orientation:isAllDay:", -[EKDayAllDayView _sizeClass](self, "_sizeClass"), self->_orientation, 1);
  v6 = v5;
  objc_msgSend(v4, "currentImageState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "requiresLanguageAwarePadding");

  if (v8)
  {
    objc_msgSend(v4, "currentImageState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "totalLanguageAwareHeightPadding");
    v6 = v6 + v10;

  }
  return v6;
}

- (void)configureOccurrenceViewForGestureController:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  id v19;

  v19 = a3;
  -[EKDayAllDayView _configureOccurrenceViewMarginAndPadding:](self, "_configureOccurrenceViewMarginAndPadding:", v19);
  objc_msgSend(v19, "occurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "allDayViewRequestsCurrentDisplayDate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "calendarDateForDay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteTime");
    v9 = v8;

    objc_msgSend(v6, "calendarDateForEndOfDay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteTime");
    v12 = v11 + 1.0;

    objc_msgSend(v19, "occurrence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    objc_msgSend(v19, "setHasPrecedingDuration:", v15 < v9);

    objc_msgSend(v19, "occurrence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endDateUnadjustedForLegacyClients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    objc_msgSend(v19, "setHasTrailingDuration:", v18 > v12);

  }
}

- (void)_configureOccurrenceViewMarginAndPadding:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  void *v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  +[EKDayOccurrenceView defaultPadding](EKDayOccurrenceView, "defaultPadding");
  v5 = v4;
  v7 = v6;
  v8 = objc_msgSend(v14, "hasIcon");
  -[EKDayAllDayView window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self))
    {
LABEL_3:
      v10 = (unint64_t)(self->_orientation - 3) >= 2;
      v11 = 2.0;
      v12 = 3.0;
      goto LABEL_6;
    }
  }
  else if (self->_targetSizeClass == 2)
  {
    goto LABEL_3;
  }
  v10 = (unint64_t)(self->_orientation - 3) >= 2;
  v11 = 1.5;
  v12 = 1.0;
LABEL_6:
  if (!v10)
    v11 = v12;
  v13 = 0.5;
  if (v8)
    v13 = 1.5;
  objc_msgSend(v14, "setPadding:", v11, v13, v5, v7);

}

- (void)_setUpBirthdayCountViewIfNeeded
{
  EKDayOccurrenceView *birthdayCountOccurrenceView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  EKDayOccurrenceView *v13;
  EKDayOccurrenceView *v14;
  EKDayOccurrenceView *v15;

  birthdayCountOccurrenceView = self->_birthdayCountOccurrenceView;
  if (!birthdayCountOccurrenceView)
  {
    if (-[NSMutableArray count](self->_occurrenceViews, "count"))
    {
      -[NSMutableArray firstObject](self->_occurrenceViews, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "frame");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;

    }
    else
    {
      v6 = *MEMORY[0x1E0C9D648];
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    v13 = -[EKDayOccurrenceView initWithFrame:]([EKDayOccurrenceView alloc], "initWithFrame:", v6, v8, v10, v12);
    -[EKDayOccurrenceView setUsesSmallText:](v13, "setUsesSmallText:", self->_usesSmallText);
    -[EKDayOccurrenceView setAllDayDrawingStyle:](v13, "setAllDayDrawingStyle:", 1);
    -[EKDayOccurrenceView setDelegate:](v13, "setDelegate:", self);
    -[EKDayOccurrenceView setIsSelectedCopyView:](v13, "setIsSelectedCopyView:", 0);
    if (-[EKDayAllDayView hideOccurrenceBackground](self, "hideOccurrenceBackground"))
      -[EKDayOccurrenceView setHideBackgroundImage:](v13, "setHideBackgroundImage:", 1);
    else
      -[EKDayOccurrenceView setOpaque:](v13, "setOpaque:", 1);
    -[EKDayAllDayView _configureOccurrenceViewMarginAndPadding:](self, "_configureOccurrenceViewMarginAndPadding:", v13);
    -[EKDayOccurrenceView setBirthday:](v13, "setBirthday:", 1);
    v14 = self->_birthdayCountOccurrenceView;
    self->_birthdayCountOccurrenceView = v13;
    v15 = v13;

    -[EKDayAllDayView addSubview:](self, "addSubview:", self->_birthdayCountOccurrenceView);
    birthdayCountOccurrenceView = self->_birthdayCountOccurrenceView;
  }
  -[EKDayOccurrenceView setBirthdayCount:](birthdayCountOccurrenceView, "setBirthdayCount:", self->_birthdayCount);
}

- (void)setShowBirthdayCountInsteadOfEvents:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_showBirthdayCount != a3)
  {
    v3 = a3;
    self->_showBirthdayCount = a3;
    if (a3)
    {
      v21 = 0uLL;
      v22 = 0uLL;
      v19 = 0uLL;
      v20 = 0uLL;
      v5 = self->_occurrenceViews;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v20 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "setHidden:", 1);
          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v7);
      }

      -[EKDayAllDayView _setUpBirthdayCountViewIfNeeded](self, "_setUpBirthdayCountViewIfNeeded");
    }
    else
    {
      v17 = 0uLL;
      v18 = 0uLL;
      v15 = 0uLL;
      v16 = 0uLL;
      v10 = self->_occurrenceViews;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "setHidden:", 0, (_QWORD)v15);
          }
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        }
        while (v12);
      }

    }
    -[EKDayOccurrenceView setHidden:](self->_birthdayCountOccurrenceView, "setHidden:", !v3, (_QWORD)v15);
    -[EKDayAllDayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)showBirthdayCountInsteadOfEvents
{
  return self->_showBirthdayCount;
}

- (id)occurrenceViews
{
  return self->_occurrenceViews;
}

- (BOOL)allowsOccurrenceSelection
{
  return self->_allowSelection;
}

- (void)setShowsSelection:(BOOL)a3
{
  if (self->_showSelection != a3)
    self->_showSelection = a3;
}

- (BOOL)showsSelection
{
  return self->_showSelection;
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "occurrence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allDayView:didSelectEvent:userInitiated:", self, v9, a4 == 0);

  }
}

- (id)presentationControllerForEditMenu
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationControllerForEditMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "selectedEventsForEditMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)attemptDisplayReviewPrompt
{
  void *v3;
  char v4;
  id v5;

  -[EKDayAllDayView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[EKDayAllDayView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attemptDisplayReviewPrompt");

  }
}

- (void)shouldAnnotateAppEntitiesChanged
{
  EKDayAllDayViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_msgSend(v6, "allDayViewShouldAnnotateAppEntities:", self);

  }
  else
  {
    v7 = 0;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_occurrenceViews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setShouldAnnotateAppEntities:", v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)setFixedHeight:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  self->_fixedHeight = a3;
  -[EKDayAllDayView frame](self, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[EKDayAllDayView _height](self, "_height");
  -[EKDayAllDayView setFrame:](self, "setFrame:", v5, v7, v9, v10);
}

- (void)setAllDayLabelHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  UILabel **p_allDay;
  void *v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  if (self->_allDayLabelHighlighted != a3)
  {
    v3 = a3;
    self->_allDayLabelHighlighted = a3;
    v5 = (void *)objc_opt_class();
    if (v3)
    {
      objc_msgSend(v5, "allDayLabelBoldFont");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      p_allDay = &self->_allDay;
      -[UILabel setFont:](*p_allDay, "setFont:", v6);

      -[UILabel frame](*p_allDay, "frame");
      v10 = CGRectOffset(v9, -1.0, 0.0);
      v11 = CGRectInset(v10, -1.0, 0.0);
    }
    else
    {
      objc_msgSend(v5, "allDayLabelFont");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      p_allDay = &self->_allDay;
      -[UILabel setFont:](*p_allDay, "setFont:", v8);

      -[UILabel frame](*p_allDay, "frame");
      v13 = CGRectInset(v12, 1.0, 0.0);
      v11 = CGRectOffset(v13, 1.0, 0.0);
    }
    -[UILabel setFrame:](*p_allDay, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  }
}

- (BOOL)isAllDayLabelHighlighted
{
  return self->_allDayLabelHighlighted;
}

- (void)setAllDayLabelColor:(id)a3
{
  -[UILabel setTextColor:](self->_allDay, "setTextColor:", a3);
}

- (void)setBorderColor:(id)a3
{
  UIView *dividerLineViewTop;
  id v5;

  dividerLineViewTop = self->_dividerLineViewTop;
  v5 = a3;
  -[UIView setBackgroundColor:](dividerLineViewTop, "setBackgroundColor:", v5);
  -[UIView setBackgroundColor:](self->_dividerLineViewBottom, "setBackgroundColor:", v5);

}

- (void)setTopBorderLineHidden:(BOOL)a3
{
  -[UIView setHidden:](self->_dividerLineViewTop, "setHidden:", a3);
}

- (void)updateLabelFont
{
  UILabel *allDay;
  void *v4;

  allDay = self->_allDay;
  objc_msgSend((id)objc_opt_class(), "allDayLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](allDay, "setFont:", v4);

  -[UILabel sizeToFit](self->_allDay, "sizeToFit");
  -[EKDayAllDayView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDividerLineVisualEffect:(id)a3
{
  EKUIVisualEffectView *dividerLineSuperview;
  EKUIVisualEffectView *v5;
  EKUIVisualEffectView *v6;
  EKUIVisualEffectView *v7;
  void *v8;
  EKUIVisualEffectView *v9;
  UIColor *dividerLineVisualEffectColor;
  id v11;

  v11 = a3;
  -[UIView removeFromSuperview](self->_dividerLineViewTop, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_dividerLineViewBottom, "removeFromSuperview");
  -[EKDayAllDayView setNeedsLayout](self, "setNeedsLayout");
  dividerLineSuperview = self->_dividerLineSuperview;
  if (v11)
  {
    if (!dividerLineSuperview)
    {
      v5 = [EKUIVisualEffectView alloc];
      -[EKDayAllDayView bounds](self, "bounds");
      v6 = -[EKUIVisualEffectView initWithFrame:](v5, "initWithFrame:");
      v7 = self->_dividerLineSuperview;
      self->_dividerLineSuperview = v6;

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIVisualEffectView setBackgroundColor:](self->_dividerLineSuperview, "setBackgroundColor:", v8);

      -[EKUIVisualEffectView setUserInteractionEnabled:](self->_dividerLineSuperview, "setUserInteractionEnabled:", 0);
      -[EKUIVisualEffectView setAutoresizingMask:](self->_dividerLineSuperview, "setAutoresizingMask:", 18);
      -[EKUIVisualEffectView setTintColorDelegate:](self->_dividerLineSuperview, "setTintColorDelegate:", self);
      -[EKDayAllDayView addSubview:](self, "addSubview:", self->_dividerLineSuperview);
      dividerLineSuperview = self->_dividerLineSuperview;
    }
    -[EKUIVisualEffectView setEffect:](dividerLineSuperview, "setEffect:", v11);
    if (self->_dividerLineVisualEffectColor)
      -[EKDayAllDayView setBorderColor:](self, "setBorderColor:");
  }
  else if (dividerLineSuperview)
  {
    -[EKUIVisualEffectView removeFromSuperview](dividerLineSuperview, "removeFromSuperview");
    v9 = self->_dividerLineSuperview;
    self->_dividerLineSuperview = 0;

    dividerLineVisualEffectColor = self->_dividerLineVisualEffectColor;
    self->_dividerLineVisualEffectColor = 0;

  }
}

- (void)viewTintColorDidChangeForView:(id)a3 toColor:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_dividerLineVisualEffectColor, a4);
  v6 = a4;
  -[EKDayAllDayView setBorderColor:](self, "setBorderColor:", v6);

}

- (EKDayAllDayViewDelegate)delegate
{
  return (EKDayAllDayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)showsBorderLines
{
  return self->_showsBorderLines;
}

- (BOOL)showsLabel
{
  return self->_showsLabel;
}

- (BOOL)hideOccurrenceBackground
{
  return self->_hideOccurrenceBackground;
}

- (void)setHideOccurrenceBackground:(BOOL)a3
{
  self->_hideOccurrenceBackground = a3;
}

- (BOOL)forceSingleColumnLayout
{
  return self->_forceSingleColumnLayout;
}

- (void)setForceSingleColumnLayout:(BOOL)a3
{
  self->_forceSingleColumnLayout = a3;
}

- (int)maxVisibleRows
{
  return self->_maxVisibleRows;
}

- (void)setMaxVisibleRows:(int)a3
{
  self->_maxVisibleRows = a3;
}

- (EKEvent)dimmedOccurrence
{
  return self->_dimmedOccurrence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmedOccurrence, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_temporaryViewCache, 0);
  objc_storeStrong((id *)&self->_birthdayCountOccurrenceView, 0);
  objc_storeStrong((id *)&self->_dividerLineVisualEffectColor, 0);
  objc_storeStrong((id *)&self->_dividerLineSuperview, 0);
  objc_storeStrong((id *)&self->_dividerLineViewBottom, 0);
  objc_storeStrong((id *)&self->_dividerLineViewTop, 0);
  objc_storeStrong((id *)&self->_selectedEvent, 0);
  objc_storeStrong((id *)&self->_scroller, 0);
  objc_storeStrong((id *)&self->_allDay, 0);
  objc_storeStrong((id *)&self->_occurrenceViews, 0);
}

@end

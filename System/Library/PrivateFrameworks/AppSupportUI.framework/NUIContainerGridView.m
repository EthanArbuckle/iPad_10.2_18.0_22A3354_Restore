@implementation NUIContainerGridView

- (id)insertRowAtIndex:(int64_t)a3 withArrangedSubviews:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && -[NSMutableArray count](self->_rows, "count") < (unint64_t)a3)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v14)
      v15 = (const __CFString *)v14;
    else
      v15 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row <= _rows.count"));
  }
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached()) && !objc_msgSend(a4, "count"))
  {
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v16)
      v17 = (const __CFString *)v16;
    else
      v17 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v17, 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arrangedViews.count > 0"));
  }
  *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
  v8 = -[NSMutableArray count](self->_columns, "count");
  if (v8 >= 2 && (v9 = v8, objc_msgSend(a4, "count") == 1))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
    do
    {
      objc_msgSend(v10, "addObject:", objc_msgSend(a4, "firstObject"));
      --v9;
    }
    while (v9);
  }
  else
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a4);
  }
  v11 = objc_msgSend(v10, "count");
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && v11
    && v11 != objc_msgSend(v10, "count"))
  {
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v18)
      v19 = (const __CFString *)v18;
    else
      v19 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v19, 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfColumns == 0 || numberOfColumns == copy.count"));
  }
  -[NSMutableArray insertObject:atIndex:](self->_viewRows, "insertObject:atIndex:", v10, a3);
  v12 = -[NUIGridDimension initWithContainerGridView:isRow:]([NUIGridDimension alloc], (uint64_t)self, 1);
  -[NSMutableArray insertObject:atIndex:](self->_rows, "insertObject:atIndex:", v12, a3);
  while (-[NSMutableArray count](self->_columns, "count") < v11)
    -[NSMutableArray addObject:](self->_columns, "addObject:", -[NUIGridDimension initWithContainerGridView:isRow:]([NUIGridDimension alloc], (uint64_t)self, 0));
  -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  return v12;
}

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
  _NUIGridArrangement *p_arrangement;

  p_arrangement = &self->_arrangement;
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, a3);
  _NUIGridArrangement::resetForInvalidation(p_arrangement, a3);
  if (a3)
  {
    -[NUIContainerGridView ensureArrangedSubviewsAreValid](self, "ensureArrangedSubviewsAreValid");
    if (_NUIIsDebuggerAttached())
      -[NUIContainerGridView _verifyInternalGridConsistencyWarningOnly:]((uint64_t)self, 0);
  }
}

- (void)ensureArrangedSubviewsAreValid
{
  $7C9949954A3843EED5620E8235AAC90E gridViewFlags;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *rows;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSMutableArray *columns;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  NSArray *v19;
  uint64_t v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  unint64_t v35;
  NUIContainerGridView *v36;
  uint64_t v37;
  char *v38;
  size_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  unint64_t v47;
  char *v48;
  char *v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  unint64_t v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  const __CFString *v58;
  NUIContainerGridView *v59;
  unint64_t v60;
  NSMutableArray *viewRows;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  objc_super v66;
  _QWORD v67[9];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
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
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  gridViewFlags = self->_gridViewFlags;
  if ((*(_DWORD *)&gridViewFlags & 0x20000) != 0)
  {
    self->_gridViewFlags = ($7C9949954A3843EED5620E8235AAC90E)(*(_DWORD *)&gridViewFlags & 0xFFFDFFFF);
    if (_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    {
      v5 = -[NSMutableArray count](self->_rows, "count");
      if (v5 != -[NSMutableArray count](self->_viewRows, "count"))
      {
        v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
        if (v55)
          v56 = (const __CFString *)v55;
        else
          v56 = CFSTR("<Unknown File>");
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v56, 187, CFSTR("Row count mismatch"));
      }
    }
    if (_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    {
      v6 = -[NSMutableArray count](self->_columns, "count");
      if (v6 != objc_msgSend((id)-[NSMutableArray firstObject](self->_viewRows, "firstObject"), "count"))
      {
        v57 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
        if (v57)
          v58 = (const __CFString *)v57;
        else
          v58 = CFSTR("<Unknown File>");
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v58, 188, CFSTR("Column count mismatch"));
      }
    }
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v65 = 720;
    rows = self->_rows;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rows, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v85 != v10)
            objc_enumerationMutation(rows);
          v12 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
          if (v12)
          {

            *(_QWORD *)(v12 + 16) = 0;
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rows, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
      }
      while (v9);
    }
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    columns = self->_columns;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v81 != v16)
            objc_enumerationMutation(columns);
          v18 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
          if (v18)
          {

            *(_QWORD *)(v18 + 16) = 0;
          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
      }
      while (v15);
    }
    std::__tree<UIView *>::destroy((uint64_t)&self->_viewRanges, (_QWORD *)self->_viewRanges.__tree_.__pair1_.__value_.__left_);
    self->_viewRanges.__tree_.__begin_node_ = &self->_viewRanges.__tree_.__pair1_;
    self->_viewRanges.__tree_.__pair3_.__value_ = 0;
    self->_viewRanges.__tree_.__pair1_.__value_.__left_ = 0;
    v59 = self;
    v19 = -[NUIContainerView arrangedSubviews](self, "arrangedSubviews");
    -[NSArray count](v19, "count");
    MEMORY[0x1E0C80A78]();
    v62 = (char *)&v59 - v20;
    bzero((char *)&v59 - v20, v21);
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
    if (!v22)
    {
      v60 = 0;
      goto LABEL_47;
    }
    v23 = v22;
    v60 = 0;
    v24 = *(_QWORD *)v77;
    while (1)
    {
      v25 = 0;
      v26 = v62;
      v27 = v60;
      do
      {
        if (*(_QWORD *)v77 != v24)
        {
          objc_enumerationMutation(v19);
          v26 = v62;
        }
        v28 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v25);
        v29 = &v26[8 * v27];
        if (!v27)
        {
          v30 = v26;
LABEL_42:
          *(_QWORD *)v30 = v28;
          ++v27;
          goto LABEL_43;
        }
        v30 = v26;
        v31 = v27;
        do
        {
          v32 = v31 >> 1;
          v33 = &v30[8 * (v31 >> 1)];
          v35 = *(_QWORD *)v33;
          v34 = v33 + 8;
          v31 += ~(v31 >> 1);
          if (v35 < v28)
            v30 = v34;
          else
            v31 = v32;
        }
        while (v31);
        if (v30 == v29 || *(_QWORD *)v30 != v28)
        {
          if (v29 > v30)
          {
            memmove(v30 + 8, v30, v29 - v30);
            v26 = v62;
          }
          goto LABEL_42;
        }
LABEL_43:
        ++v25;
      }
      while (v25 != v23);
      v60 = v27;
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
      if (!v23)
      {
LABEL_47:
        v36 = v59;
        objc_msgSend(*(id *)((char *)&v59->super.super.super.super.isa + v65), "count");
        -[NSMutableArray count](v36->_columns, "count");
        MEMORY[0x1E0C80A78]();
        v38 = (char *)&v59 - v37;
        bzero((char *)&v59 - v37, v39);
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        viewRows = v36->_viewRows;
        v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewRows, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
        v40 = 0;
        if (!v64)
          goto LABEL_73;
        v63 = *(_QWORD *)v73;
        while (1)
        {
          v41 = 0;
          do
          {
            if (*(_QWORD *)v73 != v63)
              objc_enumerationMutation(viewRows);
            v65 = v41;
            v42 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v41);
            v68 = 0u;
            v69 = 0u;
            v70 = 0u;
            v71 = 0u;
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v68, v88, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v69;
              do
              {
                for (k = 0; k != v44; ++k)
                {
                  if (*(_QWORD *)v69 != v45)
                    objc_enumerationMutation(v42);
                  v47 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k);
                  v48 = &v38[8 * v40];
                  if (!v40)
                  {
                    v49 = v38;
LABEL_68:
                    *(_QWORD *)v49 = v47;
                    ++v40;
                    continue;
                  }
                  v49 = v38;
                  v50 = v40;
                  do
                  {
                    v51 = v50 >> 1;
                    v52 = &v49[8 * (v50 >> 1)];
                    v54 = *(_QWORD *)v52;
                    v53 = v52 + 8;
                    v50 += ~(v50 >> 1);
                    if (v54 < v47)
                      v49 = v53;
                    else
                      v50 = v51;
                  }
                  while (v50);
                  if (v49 == v48 || *(_QWORD *)v49 != v47)
                  {
                    if (v48 > v49)
                      memmove(v49 + 8, v49, v48 - v49);
                    goto LABEL_68;
                  }
                }
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v68, v88, 16);
              }
              while (v44);
            }
            v41 = v65 + 1;
          }
          while (v65 + 1 != v64);
          v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewRows, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
          if (!v64)
          {
LABEL_73:
            v67[0] = MEMORY[0x1E0C809B0];
            v67[1] = 3221225472;
            v67[2] = __54__NUIContainerGridView_ensureArrangedSubviewsAreValid__block_invoke;
            v67[3] = &unk_1E57C6AC0;
            v67[4] = v59;
            v67[5] = v60;
            v67[6] = v62;
            v67[7] = v40;
            v67[8] = v38;
            v66.receiver = v59;
            v66.super_class = (Class)NUIContainerGridView;
            -[NUIContainerView performBatchUpdates:](&v66, sel_performBatchUpdates_, v67);
            return;
          }
        }
      }
    }
  }
}

uint64_t __55__NUIContainerGridView_layoutArrangedSubviewsInBounds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUntransformedFrame:");
}

- (void)didInsertArrangedSubview:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  objc_class *v9;

  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && (*((_BYTE *)&self->_gridViewFlags + 2) & 1) == 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm", a4);
    if (v6)
      v7 = (const __CFString *)v6;
    else
      v7 = CFSTR("<Unknown File>");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (objc_class *)objc_opt_class();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 802, CFSTR("-[%1$@ insertArrangedSubview:atIndex:] not supported, use -[%1$@ insert{Row|Column}AtIndex:withArrangedSubviews:] to insert arranged subviews."), NSStringFromClass(v9));
  }
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = -[NUIContainerGridView _calculateArrangedSizeFittingSize:forLayout:]((_NUIGridArrangement *)self, 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5
{
  int64_t v9;
  $C125A01A7EEDA62CE9060793D5E4A593 *p_height;
  int *v11;
  size_t v12;
  __n128 v13;
  int64_t v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  uint64_t v18;
  double *p_responderFlags;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  double v39;
  _QWORD *v40;
  _QWORD *v41;
  NUIContainerGridView *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  _BOOL4 IsSystem;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  _BOOL4 v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  _BOOL4 v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  double v73;
  _BOOL4 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int64_t v79;
  int64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int64_t v90;
  int64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  id v96;
  double v97;
  uint64_t v98;
  double *v99;
  NUIContainerGridView *v100;
  int64_t v101;
  uint64_t v102;
  uint64_t v103;
  double v104;
  int64_t *v105;
  uint64_t v106;
  int64_t v107;
  char *v108;
  int64_t v109;
  char *v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v9 = -[NUIContainerGridView numberOfRows](self, "numberOfRows");
    p_height = ($C125A01A7EEDA62CE9060793D5E4A593 *)&self->_visibleCount.height;
    v11 = &OBJC_IVAR___NUIContainerGridView__rows;
  }
  else
  {
    v9 = -[NUIContainerGridView numberOfColumns](self, "numberOfColumns");
    p_height = &self->_visibleCount;
    v11 = &OBJC_IVAR___NUIContainerGridView__columns;
  }
  v102 = *v11;
  v103 = 672;
  std::vector<_NUIGridArrangementDimension>::reserve((void **)a3, p_height->width);
  v12 = (unint64_t)(8 * v9 + 504) >> 6;
  MEMORY[0x1E0C80A78](v13);
  v14 = v9;
  v15 = (v12 + 15) & 0x7FFFFFFFFFFFFF0;
  v109 = v14;
  v110 = (char *)&v98 - v15;
  bzero((char *)&v98 - v15, v12);
  MEMORY[0x1E0C80A78](v16);
  v107 = v14;
  v108 = (char *)&v98 - v15;
  bzero((char *)&v98 - v15, v12);
  v101 = v14;
  if (v14)
  {
    v17 = 0;
    v18 = 0;
    p_responderFlags = (double *)&self->super.super.super._responderFlags;
    v100 = (NUIContainerGridView *)(v101 - 1);
    if (!a5)
      p_responderFlags = (double *)self;
    v98 = (uint64_t)a3 + 16;
    v99 = p_responderFlags;
    do
    {
      if ((*(_WORD *)(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v102), "objectAtIndexedSubscript:", v18, v98)+ 40) & 0x200) == 0)
      {
        if (a5)
          v20 = -[NUIContainerGridView _heightOfRowAtIndex:]((uint64_t)self, v18);
        else
          v20 = -[NUIContainerGridView _widthOfColumnAtIndex:]((uint64_t)self, v18);
        v21 = v20;
        v23 = *((_QWORD *)a3 + 1);
        v22 = *((_QWORD *)a3 + 2);
        if (v23 >= v22)
        {
          v25 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v23 - *(_QWORD *)a3) >> 3);
          v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) > 0x492492492492492)
            abort();
          v27 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v22 - *(_QWORD *)a3) >> 3);
          if (2 * v27 > v26)
            v26 = 2 * v27;
          if (v27 >= 0x249249249249249)
            v28 = 0x492492492492492;
          else
            v28 = v26;
          if (v28)
          {
            v29 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>(v98, v28);
            v31 = v30;
          }
          else
          {
            v29 = 0;
            v31 = 0;
          }
          _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v29[56 * v25], v18, v21);
          v34 = *(char **)a3;
          v33 = (char *)*((_QWORD *)a3 + 1);
          v35 = v32;
          if (v33 != *(char **)a3)
          {
            do
            {
              v36 = *(_OWORD *)(v33 - 56);
              v37 = *(_OWORD *)(v33 - 40);
              v38 = *(_OWORD *)(v33 - 24);
              *(_QWORD *)(v35 - 8) = *((_QWORD *)v33 - 1);
              *(_OWORD *)(v35 - 24) = v38;
              *(_OWORD *)(v35 - 40) = v37;
              *(_OWORD *)(v35 - 56) = v36;
              v35 -= 56;
              v33 -= 56;
            }
            while (v33 != v34);
            v33 = *(char **)a3;
          }
          v24 = v32 + 56;
          *(_QWORD *)a3 = v35;
          *((_QWORD *)a3 + 1) = v32 + 56;
          *((_QWORD *)a3 + 2) = &v29[56 * v31];
          if (v33)
            operator delete(v33);
        }
        else
        {
          _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), v18, v20);
          v24 = v23 + 56;
          *((_QWORD *)a3 + 1) = v23 + 56;
        }
        *((_QWORD *)a3 + 1) = v24;
        v39 = 0.0;
        if (v17 < (uint64_t)v100)
        {
          v39 = v99[88];
          if (NUIContainerViewLengthIsSystem(0, v39))
            *(_QWORD *)&v110[((unint64_t)v17 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v17;
        }
        *(double *)(*(_QWORD *)a3 + 56 * v17++) = v39;
      }
      ++v18;
    }
    while (v18 != v101);
  }
  v40 = *(_QWORD **)a4;
  v41 = (_QWORD *)*((_QWORD *)a4 + 1);
  if (*(_QWORD **)a4 != v41)
  {
    v98 = (int)v103;
    v99 = (double *)((char *)&self->super.super.super.super.isa + 2);
    if (a5)
      v42 = (NUIContainerGridView *)((char *)&self->super.super.super.super.isa + 2);
    else
      v42 = self;
    v100 = v42;
    do
    {
      v43 = 10;
      if (!a5)
        v43 = 8;
      v44 = 9;
      if (!a5)
        v44 = 7;
      v45 = v40[v44];
      v46 = v40[v43] + v45;
      if (*(unsigned __int16 *)((char *)&v100->super.super.super.super.isa + (int)v103) - 1 > (unsigned __int16)(v46 - 1))
      {
        v47 = (unsigned __int16)(v46 - 1);
        v48 = *(double *)(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v102), "objectAtIndexedSubscript:", *(unsigned __int16 *)(*(_QWORD *)a3 + 56 * v47 + 48))+ 32);
        if (!NUIContainerViewLengthIsDefault(v48))
        {
          if (NUIContainerViewLengthIsSystem(0, v48))
            *(_QWORD *)&v110[(v47 >> 3) & 0x1FF8] |= 1 << (v46 - 1);
          *(double *)(*(_QWORD *)a3 + 56 * v47) = v48;
        }
      }
      -[NUIContainerView minimumSpacingAdjacentToView:](self, "minimumSpacingAdjacentToView:", *v40);
      if (a5)
      {
        v53 = v51;
        if (v45)
        {
          v54 = v49;
          if (!NUIContainerViewLengthIsDefault(v49))
          {
            IsSystem = NUIContainerViewLengthIsSystem(0, v54);
            v56 = v45 - 1;
            if (IsSystem)
            {
              v57 = 1 << v56;
              v58 = (v56 >> 3) & 0x1FFFFFFFFFFFFFF8;
              *(_QWORD *)&v108[v58] |= v57;
              *(_QWORD *)&v110[v58] &= ~v57;
            }
            else
            {
              v65 = 56 * v56;
              v66 = *(double *)(*(_QWORD *)a3 + v65);
              if (v66 <= v54)
                v66 = v54;
              *(double *)(*(_QWORD *)a3 + v65) = v66;
            }
          }
        }
        if (v46 >= *(unsigned __int16 *)((char *)v99 + (int)v103) || NUIContainerViewLengthIsDefault(v53))
          goto LABEL_75;
        v67 = NUIContainerViewLengthIsSystem(0, v53);
        v68 = (unsigned __int16)(v46 - 1);
        if (!v67)
        {
          v69 = *(char **)a3;
          v70 = 56 * (unsigned __int16)(v46 - 1);
          v71 = *(double *)(*(_QWORD *)a3 + v70);
          if (v71 <= v53)
            v71 = v53;
LABEL_74:
          *(double *)&v69[v70] = v71;
          goto LABEL_75;
        }
      }
      else
      {
        v59 = v52;
        if (v45)
        {
          v60 = v50;
          if (!NUIContainerViewLengthIsDefault(v50))
          {
            v61 = NUIContainerViewLengthIsSystem(0, v60);
            v62 = v45 - 1;
            if (v61)
            {
              v63 = 1 << v62;
              v64 = (v62 >> 3) & 0x1FFFFFFFFFFFFFF8;
              *(_QWORD *)&v108[v64] |= v63;
              *(_QWORD *)&v110[v64] &= ~v63;
            }
            else
            {
              v72 = 56 * v62;
              v73 = *(double *)(*(_QWORD *)a3 + v72);
              if (v73 <= v60)
                v73 = v60;
              *(double *)(*(_QWORD *)a3 + v72) = v73;
            }
          }
        }
        if (v46 >= *(unsigned __int16 *)((char *)&self->super.super.super.super.isa + v98)
          || NUIContainerViewLengthIsDefault(v59))
        {
          goto LABEL_75;
        }
        v74 = NUIContainerViewLengthIsSystem(0, v59);
        v68 = (unsigned __int16)(v46 - 1);
        if (!v74)
        {
          v69 = *(char **)a3;
          v70 = 56 * (unsigned __int16)(v46 - 1);
          v71 = *(double *)(*(_QWORD *)a3 + v70);
          if (v71 <= v59)
            v71 = v59;
          goto LABEL_74;
        }
      }
      v75 = 1 << v68;
      v76 = (v68 >> 3) & 0x1FF8;
      *(_QWORD *)&v108[v76] |= v75;
      *(_QWORD *)&v110[v76] &= ~v75;
LABEL_75:
      v40 += 14;
    }
    while (v40 != v41);
  }
  LODWORD(v103) = -[NUIContainerView isBaselineRelativeArrangement](self, "isBaselineRelativeArrangement", v98);
  nui::stack_bitset::begin((nui::stack_bitset *)&v109);
  v78 = v77;
  v105 = &v109;
  v106 = v77;
  v79 = v109;
  if (v77 != v109)
  {
    v80 = v101 - 1;
    v102 = *MEMORY[0x1E0C99768];
    while (1)
    {
      v81 = *(_QWORD *)a3 + 56 * v78;
      v82 = *(unsigned __int16 *)(v81 + 48);
      if (v80 > v82)
        break;
LABEL_89:
      nui::stack_bitset::iterator::operator++((uint64_t)&v105);
      v78 = v106;
      if (v106 == v79 && v105 == &v109)
        goto LABEL_91;
    }
    if (a5)
    {
      v83 = -[NUIContainerGridView viewForLastBaselineLayoutInRowAtIndex:](self, "viewForLastBaselineLayoutInRowAtIndex:", *(unsigned __int16 *)(v81 + 48));
      if (!v83)
        v83 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", v82), "firstObject");
      v84 = v82 + 1;
      v85 = -[NUIContainerGridView viewForFirstBaselineLayoutInRowAtIndex:](self, "viewForFirstBaselineLayoutInRowAtIndex:", v82 + 1);
      if (v85)
        goto LABEL_86;
      v86 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", v84), "firstObject");
    }
    else
    {
      v83 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", 0), "objectAtIndex:", v82);
      v86 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", 0), "objectAtIndex:", v82 + 1);
    }
    v85 = (id)v86;
LABEL_86:
    v104 = 0.0;
    if (!NUIContainerViewLengthIsSystem(&v104, *(double *)(*(_QWORD *)a3 + 56 * v78)))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v102, CFSTR("Invalid system spacing"));
    objc_msgSend(v83, "systemSpacingToAdjecentSiblingView:axis:baselineRelative:multiplier:", v85, a5, v103, v104);
    *(_QWORD *)(*(_QWORD *)a3 + 56 * v78) = v87;
    goto LABEL_89;
  }
LABEL_91:
  nui::stack_bitset::begin((nui::stack_bitset *)&v107);
  v89 = v88;
  v105 = &v107;
  v106 = v88;
  v90 = v107;
  if (v88 != v107)
  {
    v91 = v101 - 1;
    v102 = *MEMORY[0x1E0C99768];
    do
    {
      v92 = *(_QWORD *)a3 + 56 * v89;
      v93 = *(unsigned __int16 *)(v92 + 48);
      if (v91 > v93)
      {
        if (a5)
        {
          v94 = -[NUIContainerGridView viewForLastBaselineLayoutInRowAtIndex:](self, "viewForLastBaselineLayoutInRowAtIndex:", *(unsigned __int16 *)(v92 + 48));
          v95 = -[NUIContainerGridView viewForFirstBaselineLayoutInRowAtIndex:](self, "viewForFirstBaselineLayoutInRowAtIndex:", v93 + 1);
        }
        else
        {
          v94 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", 0), "objectAtIndex:", v93);
          v95 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", 0), "objectAtIndex:", v93 + 1);
        }
        v96 = v95;
        v104 = 0.0;
        if (!NUIContainerViewLengthIsSystem(&v104, *(double *)(*(_QWORD *)a3 + 56 * v89)))
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v102, CFSTR("Invalid system spacing"));
        objc_msgSend(v94, "systemSpacingToAdjecentSiblingView:axis:baselineRelative:multiplier:", v96, a5, v103, v104);
        if (*(double *)(*(_QWORD *)a3 + 56 * v89) > v97)
          v97 = *(double *)(*(_QWORD *)a3 + 56 * v89);
        *(double *)(*(_QWORD *)a3 + 56 * v89) = v97;
      }
      nui::stack_bitset::iterator::operator++((uint64_t)&v105);
      v89 = v106;
    }
    while (v106 != v90 || v105 != &v107);
  }
}

- (double)_widthOfColumnAtIndex:(uint64_t)a1
{
  double v3;

  if (!a1)
    return 0.0;
  v3 = *(double *)(objc_msgSend(*(id *)(a1 + 728), "objectAtIndexedSubscript:", a2) + 24);
  if (NUIContainerViewLengthIsDefault(v3))
    return *(double *)(a1 + 752);
  return v3;
}

- (double)_heightOfRowAtIndex:(uint64_t)a1
{
  double v3;

  if (!a1)
    return 0.0;
  v3 = *(double *)(objc_msgSend(*(id *)(a1 + 720), "objectAtIndexedSubscript:", a2) + 24);
  if (NUIContainerViewLengthIsDefault(v3))
    return *(double *)(a1 + 744);
  return v3;
}

- (int64_t)numberOfColumns
{
  return -[NSMutableArray count](self->_columns, "count");
}

- (id).cxx_construct
{
  _NUIGridArrangement::_NUIGridArrangement(&self->_arrangement);
  self->_viewRanges.__tree_.__pair3_.__value_ = 0;
  self->_viewRanges.__tree_.__pair1_.__value_.__left_ = 0;
  self->_viewRanges.__tree_.__begin_node_ = &self->_viewRanges.__tree_.__pair1_;
  return self;
}

_QWORD *__54__NUIContainerGridView_ensureArrangedSubviewsAreValid__block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t *v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t *v23;
  _QWORD *v24;
  unint64_t v25;
  objc_super v26;
  objc_super v27;

  v1 = result;
  *(_DWORD *)(result[4] + 736) |= 0x10000u;
  v2 = result[5];
  if (v2)
  {
    v3 = (unint64_t *)result[6];
    v4 = &v3[v2];
    do
    {
      v5 = *v3;
      v6 = v1[7];
      v7 = v1[8];
      if (!v6)
        goto LABEL_11;
      v8 = (_QWORD *)v1[8];
      v9 = v1[7];
      do
      {
        v10 = v9 >> 1;
        v11 = &v8[v9 >> 1];
        v13 = *v11;
        v12 = v11 + 1;
        v9 += ~(v9 >> 1);
        if (v13 < v5)
          v8 = v12;
        else
          v9 = v10;
      }
      while (v9);
      if (v8 == (_QWORD *)(v7 + 8 * v6) || *v8 != v5)
LABEL_11:
        v8 = (_QWORD *)(v7 + 8 * v6);
      if (v8 == (_QWORD *)(v7 + 8 * v6))
      {
        v27.receiver = (id)v1[4];
        v27.super_class = (Class)NUIContainerGridView;
        result = objc_msgSendSuper2(&v27, sel_removeArrangedSubview_, v5);
      }
      ++v3;
    }
    while (v3 != v4);
  }
  v14 = v1[7];
  if (v14)
  {
    v15 = (unint64_t *)v1[8];
    v16 = &v15[v14];
    do
    {
      v17 = *v15;
      v18 = v1[5];
      v19 = v1[6];
      if (!v18)
        goto LABEL_25;
      v20 = (_QWORD *)v1[6];
      v21 = v1[5];
      do
      {
        v22 = v21 >> 1;
        v23 = &v20[v21 >> 1];
        v25 = *v23;
        v24 = v23 + 1;
        v21 += ~(v21 >> 1);
        if (v25 < v17)
          v20 = v24;
        else
          v21 = v22;
      }
      while (v21);
      if (v20 == (_QWORD *)(v19 + 8 * v18) || *v20 != v17)
LABEL_25:
        v20 = (_QWORD *)(v19 + 8 * v18);
      if (v20 == (_QWORD *)(v19 + 8 * v18))
      {
        v26.receiver = (id)v1[4];
        v26.super_class = (Class)NUIContainerGridView;
        result = objc_msgSendSuper2(&v26, sel_addArrangedSubview_, v17);
      }
      ++v15;
    }
    while (v15 != v16);
  }
  *(_DWORD *)(v1[4] + 736) |= 0x10000u;
  return result;
}

- (void)setArrangedSubviewRows:(id)a3
{
  NSArray *v5;
  _QWORD v6[7];

  v5 = -[NUIContainerView arrangedSubviews](self, "arrangedSubviews");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__NUIContainerGridView_setArrangedSubviewRows___block_invoke;
  v6[3] = &unk_1E57C6AE8;
  v6[4] = self;
  v6[5] = v5;
  v6[6] = a3;
  -[NUIContainerView performBatchUpdates:](self, "performBatchUpdates:", v6);
}

- (NUIContainerGridView)initWithArrangedSubviewRows:(id)a3
{
  NUIContainerGridView *v4;
  NUIContainerGridView *v5;
  _QWORD v7[6];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUIContainerGridView;
  v4 = -[NUIContainerView initWithArrangedSubviews:](&v8, sel_initWithArrangedSubviews_, 0);
  v5 = v4;
  if (v4)
  {
    _NUIContainerGridViewCommonInit(v4);
    if (a3)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __52__NUIContainerGridView_initWithArrangedSubviewRows___block_invoke;
      v7[3] = &unk_1E57C6A10;
      v7[4] = a3;
      v7[5] = v5;
      -[NUIContainerView performBatchUpdates:](v5, "performBatchUpdates:", v7);
    }
  }
  return v5;
}

- (NUIContainerGridView)initWithFrame:(CGRect)a3
{
  NUIContainerGridView *v3;
  NUIContainerGridView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUIContainerGridView;
  v3 = -[NUIContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    _NUIContainerGridViewCommonInit(v3);
  return v4;
}

uint64_t __47__NUIContainerGridView_setArrangedSubviewRows___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  uint64_t result;
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
  for (i = *(_QWORD *)(a1 + 32); objc_msgSend(*(id *)(i + 720), "count"); i = *(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 32), "removeRowAtIndex:", 0);
  objc_msgSend(*(id *)(a1 + 40), "makeObjectsPerformSelector:", sel_removeFromSuperview);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(void **)(a1 + 48);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "addRowWithArrangedSubviews:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __52__NUIContainerGridView_initWithArrangedSubviewRows___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
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
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "addRowWithArrangedSubviews:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (id)addRowWithArrangedSubviews:(id)a3
{
  return -[NUIContainerGridView insertRowAtIndex:withArrangedSubviews:](self, "insertRowAtIndex:withArrangedSubviews:", -[NUIContainerGridView numberOfRows](self, "numberOfRows"), a3);
}

- (int64_t)numberOfRows
{
  return -[NSMutableArray count](self->_rows, "count");
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NUIContainerGridView _calculateArrangedSizeFittingSize:forLayout:]((_NUIGridArrangement *)self, 1, a3.size.width, a3.size.height);
  _NUIGridArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)&__block_literal_global_2, x, y, width, height);
}

- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:(CGFloat)a4
{
  double v8;
  double v9;
  CGSize v11;

  if (!a1)
    return 0.0;
  do
  {
    _NUIGridArrangement::resetForInvalidation(a1 + 5, 0);
    v11.width = a3;
    v11.height = a4;
    _NUIGridArrangement::measureCells(a1 + 5, a2, v11);
    v9 = v8;
  }
  while ((-[_NUIGridArrangement mustRestartMeasurement](a1, "mustRestartMeasurement") & 1) != 0);
  return v9;
}

uint64_t __48__NUIContainerGridView__setupViewRangesIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD v4[5];
  __int128 v5;
  uint64_t v6;
  int v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__NUIContainerGridView__setupViewRangesIfNeeded__block_invoke_2;
  v4[3] = &unk_1E57C6B80;
  v7 = *(_DWORD *)(a1 + 48);
  v4[4] = a2;
  v6 = a3;
  v5 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);
}

- (id)insertColumnAtIndex:(int64_t)a3 withArrangedSubviews:(id)a4
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  NSMutableArray *viewRows;
  id v19;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  const char *v27;
  _QWORD v28[6];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  v8 = 0x1ECE68000uLL;
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && -[NSMutableArray count](self->_columns, "count") < (unint64_t)a3)
  {
    v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v21)
      v22 = (const __CFString *)v21;
    else
      v22 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v22, 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("column <= _columns.count"));
  }
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached()) && !objc_msgSend(a4, "count"))
  {
    v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v23)
      v24 = (const __CFString *)v23;
    else
      v24 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v24, 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arrangedViews.count > 0"));
  }
  *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
  v9 = -[NSMutableArray count](self->_rows, "count");
  v10 = v9;
  if (v9 < 2)
  {
    if (!v9)
    {
      v27 = a2;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v30;
        while (1)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(a4);
          -[NSMutableArray addObject:](self->_viewRows, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
          if (!--v15)
          {
            v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            if (!v15)
              break;
          }
        }
      }
      v10 = objc_msgSend(a4, "count");
      a2 = v27;
    }
  }
  else if (objc_msgSend(a4, "count") == 1)
  {
    v11 = a2;
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
    v13 = v10;
    do
    {
      objc_msgSend(v12, "addObject:", objc_msgSend(a4, "firstObject"));
      --v13;
    }
    while (v13);
    a4 = v12;
    a2 = v11;
    v8 = 0x1ECE68000;
  }
  if ((*(_BYTE *)(v8 + 1824) || _NUIIsDebuggerAttached()) && v10 && v10 != objc_msgSend(a4, "count"))
  {
    v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v25)
      v26 = (const __CFString *)v25;
    else
      v26 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v26, 414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfRows == 0 || numberOfRows == copy.count"));
  }
  v17 = objc_msgSend(a4, "count");
  viewRows = self->_viewRows;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __65__NUIContainerGridView_insertColumnAtIndex_withArrangedSubviews___block_invoke;
  v28[3] = &unk_1E57C6B10;
  v28[4] = a4;
  v28[5] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](viewRows, "enumerateObjectsUsingBlock:", v28);
  v19 = -[NUIGridDimension initWithContainerGridView:isRow:]([NUIGridDimension alloc], (uint64_t)self, 0);
  -[NSMutableArray insertObject:atIndex:](self->_columns, "insertObject:atIndex:", v19, a3);
  while (-[NSMutableArray count](self->_rows, "count") < v17)
    -[NSMutableArray addObject:](self->_rows, "addObject:", -[NUIGridDimension initWithContainerGridView:isRow:]([NUIGridDimension alloc], (uint64_t)self, 1));
  -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  return v19;
}

- (void)getColumnRange:(_NSRange *)a3 rowRange:(_NSRange *)a4 forArrangedSubview:(id)a5
{
  uint64_t v10;
  const __CFString *v11;
  char v12;
  char *left;
  _NSRange v14;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, const std::pair<_NSRange, _NSRange>>, void *>>> *p_pair1;
  unint64_t v16;
  BOOL v17;
  char **v18;
  _NSRange v19;
  uint64_t v20;
  const __CFString *v21;

  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && !((unint64_t)a3 | (unint64_t)a4))
  {
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v20)
      v21 = (const __CFString *)v20;
    else
      v21 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v21, 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("colRangeOut != NULL || rowRangeOut != NULL"));
  }
  if (_NUIEnableAPIMisuseAssertions)
  {
    if (!a5)
      goto LABEL_6;
  }
  else
  {
    v12 = _NUIIsDebuggerAttached();
    if (!a5 && (v12 & 1) != 0)
    {
LABEL_6:
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
      if (v10)
        v11 = (const __CFString *)v10;
      else
        v11 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("findView != nil"));
    }
  }
  -[NUIContainerGridView _setupViewRangesIfNeeded]((uint64_t)self);
  left = (char *)self->_viewRanges.__tree_.__pair1_.__value_.__left_;
  v14 = (_NSRange)xmmword_1AA837850;
  if (!left)
    goto LABEL_24;
  p_pair1 = &self->_viewRanges.__tree_.__pair1_;
  do
  {
    v16 = *((_QWORD *)left + 4);
    v17 = v16 >= (unint64_t)a5;
    if (v16 >= (unint64_t)a5)
      v18 = (char **)left;
    else
      v18 = (char **)(left + 8);
    if (v17)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, const std::pair<_NSRange, _NSRange>>, void *>>> *)left;
    left = *v18;
  }
  while (*v18);
  if (p_pair1 == &self->_viewRanges.__tree_.__pair1_)
  {
LABEL_24:
    v19 = (_NSRange)xmmword_1AA837850;
  }
  else
  {
    v19 = (_NSRange)xmmword_1AA837850;
    if (p_pair1[4].__value_.__left_ <= a5)
    {
      v19 = *(_NSRange *)&p_pair1[5].__value_.__left_;
      v14 = *(_NSRange *)&p_pair1[7].__value_.__left_;
    }
  }
  if (a3)
    *a3 = v19;
  if (a4)
    *a4 = v14;
}

- (void)_setupViewRangesIfNeeded
{
  uint64_t v2;
  BOOL v3;
  __int16 v4;
  __int16 v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  size_t v9;
  void *v10;
  _QWORD v11[6];
  __int16 v12;
  __int16 v13;
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 728), "count");
    if (*(_QWORD *)(a1 + 696))
      v3 = 1;
    else
      v3 = v2 == 0;
    if (!v3)
    {
      v4 = v2;
      v5 = objc_msgSend(*(id *)(a1 + 720), "count");
      v14[0] = 0;
      v14[1] = v14;
      v6.n128_u64[0] = 0x4012000000;
      v14[2] = 0x4012000000;
      v14[3] = __Block_byref_object_copy__1;
      v14[4] = __Block_byref_object_dispose__1;
      v14[5] = 0;
      MEMORY[0x1E0C80A78](v6);
      v8 = (char *)v11 - v7;
      bzero((char *)v11 - v7, v9);
      v14[6] = 0;
      v14[7] = v8;
      v10 = *(void **)(a1 + 552);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __48__NUIContainerGridView__setupViewRangesIfNeeded__block_invoke;
      v11[3] = &unk_1E57C6BA8;
      v12 = v4;
      v13 = v5;
      v11[4] = a1;
      v11[5] = v14;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
      _Block_object_dispose(v14, 8);
    }
  }
}

_QWORD *__48__NUIContainerGridView__setupViewRangesIfNeeded__block_invoke_2(_QWORD *result, unint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t **v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t *v27;
  unint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;

  v5 = result;
  v32 = a2;
  v6 = *(_QWORD *)(result[6] + 8);
  v7 = *(_QWORD *)(v6 + 48);
  v8 = *(_QWORD **)(v6 + 56);
  if (!v7)
    goto LABEL_9;
  v9 = v8;
  v10 = v7;
  do
  {
    v11 = v10 >> 1;
    v12 = &v9[v10 >> 1];
    v14 = *v12;
    v13 = v12 + 1;
    v10 += ~(v10 >> 1);
    if (v14 < a2)
      v9 = v13;
    else
      v10 = v11;
  }
  while (v10);
  if (v9 == &v8[v7] || *v9 != a2)
LABEL_9:
    v9 = &v8[v7];
  if (v9 == &v8[v7])
  {
    v15 = 1;
    if (a3 + 1 < (unint64_t)*((unsigned __int16 *)result + 32))
    {
      do
      {
        if (objc_msgSend((id)v5[4], "objectAtIndex:", a3 + v15) != a2)
          break;
        ++v15;
      }
      while (a3 + v15 < (unint64_t)*((unsigned __int16 *)v5 + 32));
    }
    v16 = v5[7];
    for (i = 1; v16 + i < (unint64_t)*((unsigned __int16 *)v5 + 33); ++i)
    {
      v18 = objc_msgSend((id)objc_msgSend(*(id *)(v5[5] + 552), "objectAtIndex:"), "objectAtIndex:", a3);
      v16 = v5[7];
      if (v18 != a2)
        break;
    }
    v19 = (uint64_t **)(v5[5] + 680);
    *(_QWORD *)&v29 = a3;
    *((_QWORD *)&v29 + 1) = v15;
    v30 = v16;
    v31 = i;
    result = std::__tree<std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>,std::__map_value_compare<UIView *,std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>>>::__emplace_unique_key_args<UIView *,UIView * const&,std::pair<_NSRange,_NSRange>>(v19, &v32, &v32, &v29);
    v20 = *(_QWORD *)(v5[6] + 8);
    v21 = *(_QWORD *)(v20 + 48);
    v22 = *(unint64_t **)(v20 + 56);
    v23 = &v22[v21];
    v24 = v32;
    if (!v21)
      goto LABEL_26;
    do
    {
      v25 = v21 >> 1;
      v26 = &v22[v21 >> 1];
      v28 = *v26;
      v27 = v26 + 1;
      v21 += ~(v21 >> 1);
      if (v28 < v32)
        v22 = v27;
      else
        v21 = v25;
    }
    while (v21);
    if (v22 == v23 || *v22 != v32)
    {
      if (v23 > v22)
      {
        result = memmove(v22 + 1, v22, (char *)v23 - (char *)v22);
        v24 = v32;
      }
LABEL_26:
      *v22 = v24;
      ++*(_QWORD *)(v20 + 48);
    }
  }
  return result;
}

- (NSArray)arrangedSubviewRows
{
  uint64_t v3;
  uint64_t v4;
  void **v5;
  uint64_t i;
  NSArray *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_viewRows, "count");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (void **)((char *)v10 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  for (i = 0; i != v4; ++i)
    v5[i] = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", i), "copy");
  v7 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, v4);
  do
  {
    v8 = *v5++;

    --v4;
  }
  while (v4);
  return v7;
}

- (void)populateGridArrangementCells:(void *)a3
{
  unsigned __int16 v4;
  unsigned __int16 v5;
  NSMutableArray *columns;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __n128 v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t *v25;
  char *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id *v35;
  void **v36;
  char *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t *v43;
  unint64_t *v44;
  unint64_t v45;
  NSMutableArray *viewRows;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void **v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  id v64;
  uint64_t v65;
  id *v66;
  id *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  unint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v54 = (void **)a3;
  v93 = *MEMORY[0x1E0C80C00];
  v4 = -[NSMutableArray count](self->_columns, "count");
  v60 = 720;
  v5 = -[NSMutableArray count](self->_rows, "count");
  self->_visibleCount.width = v4;
  self->_visibleCount.height = v5;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v65 = 728;
  columns = self->_columns;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v86 != v8)
          objc_enumerationMutation(columns);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "isHidden"))
          --self->_visibleCount.width;
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
    }
    while (v7);
  }
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v10 = *(Class *)((char *)&self->super.super.super.super.isa + v60);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v82;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v82 != v12)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * j), "isHidden"))
          --self->_visibleCount.height;
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
    }
    while (v11);
  }
  std::vector<_NUIGridArrangementCell>::reserve(v54, self->_visibleCount.height * (unint64_t)self->_visibleCount.width);
  v62 = v5;
  v63 = v4;
  MEMORY[0x1E0C80A78](v14);
  v55 = (char *)&viewRows - v15;
  bzero((char *)&viewRows - v15, v16);
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v61 = 552;
  viewRows = self->_viewRows;
  v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewRows, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
  if (v48)
  {
    v59 = 0;
    v52 = 0;
    v53 = 0;
    v47 = *(_QWORD *)v78;
    do
    {
      v49 = 0;
      v50 = v53 + 1;
      do
      {
        if (*(_QWORD *)v78 != v47)
          objc_enumerationMutation(viewRows);
        v64 = *(id *)(*((_QWORD *)&v77 + 1) + 8 * v49);
        if ((*(_WORD *)(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v60), "objectAtIndexedSubscript:", v53)+ 40) & 0x200) == 0)
        {
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v57 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
          if (!v57)
            goto LABEL_76;
          v58 = 0;
          v17 = 0;
          v56 = *(_QWORD *)v73;
          v51 = v53 + 1;
          while (1)
          {
            v18 = 0;
            v19 = v17 + 1;
            do
            {
              if (*(_QWORD *)v73 != v56)
                objc_enumerationMutation(v64);
              v76 = 0;
              v76 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v18);
              if ((*(_WORD *)(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v65), "objectAtIndexedSubscript:", v17)+ 40) & 0x200) == 0)
              {
                v20 = v55;
                v21 = v59;
                if (!v59)
                  goto LABEL_39;
                v22 = v55;
                v23 = v59;
                do
                {
                  v24 = v23 >> 1;
                  v25 = (unint64_t *)&v22[8 * (v23 >> 1)];
                  v27 = *v25;
                  v26 = (char *)(v25 + 1);
                  v23 += ~(v23 >> 1);
                  if (v27 < v76)
                    v22 = v26;
                  else
                    v23 = v24;
                }
                while (v23);
                v20 = v55;
                v21 = v59;
                if (v22 == &v55[8 * v59] || *(_QWORD *)v22 != v76)
LABEL_39:
                  v22 = &v20[8 * v21];
                v28 = (unint64_t *)&v20[8 * v21];
                if (v22 == (char *)v28)
                {
                  if (v17 + 1 >= v63)
                  {
                    v30 = 1;
                  }
                  else
                  {
                    v29 = v19;
                    v30 = 1;
                    do
                    {
                      v31 = objc_msgSend(v64, "objectAtIndex:", v29);
                      if (v31 != v76)
                        break;
                      if ((*(_WORD *)(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v65), "objectAtIndexedSubscript:", v29)+ 40) & 0x200) == 0)++v30;
                      ++v29;
                    }
                    while (v29 < v63);
                  }
                  if (v51 >= v62)
                  {
                    v33 = 1;
                  }
                  else
                  {
                    v32 = v50;
                    v33 = 1;
                    do
                    {
                      v34 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v61), "objectAtIndex:", v32), "objectAtIndex:", v17);
                      if (v34 != v76)
                        break;
                      if ((*(_WORD *)(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v60), "objectAtIndexedSubscript:", v32)+ 40) & 0x200) == 0)++v33;
                      ++v32;
                    }
                    while (v32 < v62);
                  }
                  v70 = v58;
                  v71 = v30;
                  v68 = v52;
                  v69 = v33;
                  v67 = -[NUIContainerGridView _horizontalAlignmentOfView:inColumn:]((id *)&self->super.super.super.super.isa, v76, v17);
                  v35 = -[NUIContainerGridView _verticalAlignmentOfView:row:]((id *)&self->super.super.super.super.isa, v76, v53);
                  v66 = v35;
                  v36 = v54;
                  v37 = (char *)v54[1];
                  if (v37 >= v54[2])
                  {
                    v38 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView  {__kindof}*&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>(v54, (uint64_t *)&v76, &v70, &v68, &v67, &v66);
                    v36 = v54;
                  }
                  else
                  {
                    _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)v54[1], v76, v70, v71, v68, v69, v67, (__int16)v35);
                    v38 = v37 + 112;
                    v36[1] = v37 + 112;
                  }
                  v36[1] = v38;
                  v39 = v76;
                  v40 = v59;
                  if (!v59)
                  {
                    v41 = v28;
                    goto LABEL_72;
                  }
                  v41 = (unint64_t *)v55;
                  do
                  {
                    v42 = v40 >> 1;
                    v43 = &v41[v40 >> 1];
                    v45 = *v43;
                    v44 = v43 + 1;
                    v40 += ~(v40 >> 1);
                    if (v45 < v76)
                      v41 = v44;
                    else
                      v40 = v42;
                  }
                  while (v40);
                  if (v41 == v28 || *v41 != v76)
                  {
                    if (v28 > v41)
                      memmove(v41 + 1, v41, (char *)v28 - (char *)v41);
                    v40 = v59;
LABEL_72:
                    *v41 = v39;
                    v59 = v40 + 1;
                  }
                }
                ++v58;
              }
              ++v17;
              ++v18;
              ++v19;
            }
            while (v18 != v57);
            v57 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
            if (!v57)
            {
LABEL_76:
              ++v52;
              break;
            }
          }
        }
        ++v53;
        ++v49;
        ++v50;
      }
      while (v49 != v48);
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewRows, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
    }
    while (v48);
  }
}

- (id)_horizontalAlignmentOfView:(uint64_t)a3 inColumn:
{
  id *v4;
  int v5;

  if (result)
  {
    v4 = result;
    result = (id *)objc_msgSend(result, "alignmentForView:inAxis:", a2, 0);
    if (result == (id *)-1)
    {
      v5 = *(unsigned __int16 *)(objc_msgSend(v4[91], "objectAtIndexedSubscript:", a3) + 40);
      if ((~(v5 << 8) & 0xFF00) != 0)
        return (id *)(char)v5;
      else
        return (id *)*((char *)v4 + 736);
    }
  }
  return result;
}

- (id)_verticalAlignmentOfView:(uint64_t)a3 row:
{
  id *v4;
  int v5;

  if (result)
  {
    v4 = result;
    result = (id *)objc_msgSend(result, "alignmentForView:inAxis:", a2, 1);
    if (result == (id *)-1)
    {
      v5 = *(unsigned __int16 *)(objc_msgSend(v4[90], "objectAtIndexedSubscript:", a3) + 40);
      if ((~(v5 << 8) & 0xFF00) != 0)
        return (id *)(char)v5;
      else
        return (id *)((uint64_t)(int)(*((_DWORD *)v4 + 184) << 16) >> 24);
    }
  }
  return result;
}

uint64_t __65__NUIContainerGridView_insertColumnAtIndex_withArrangedSubviews___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "insertObject:atIndex:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:"), *(_QWORD *)(a1 + 40));
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUIContainerGridView;
  -[NUIContainerView setBaselineRelativeArrangement:](&v5, sel_setBaselineRelativeArrangement_);
  self->_arrangement.baselineRelative = a3;
}

- (void)setColumnSpacing:(double)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_spacing.width != a3)
  {
    self->_spacing.width = a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (void)setRowSpacing:(double)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_spacing.height != a3)
  {
    self->_spacing.height = a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (void)setVerticalAlignment:(int64_t)a3
{
  int64_t v5;
  $7C9949954A3843EED5620E8235AAC90E gridViewFlags;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1)
    v5 = 1;
  else
    v5 = a3;
  gridViewFlags = self->_gridViewFlags;
  if (v5 != *(_WORD *)&gridViewFlags >> 8)
  {
    self->_gridViewFlags = ($7C9949954A3843EED5620E8235AAC90E)(*(_DWORD *)&gridViewFlags & 0xFFFF00FF | (v5 << 8));
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 1);
  }
}

- (id)columnAtIndex:(int64_t)a3
{
  uint64_t v7;
  const __CFString *v8;

  if ((_NUIEnableAPIMisuseAssertions || (_NUIIsDebuggerAttached() & 1) != 0)
    && -[NSMutableArray count](self->_columns, "count") <= (unint64_t)a3)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v7)
      v8 = (const __CFString *)v7;
    else
      v8 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 382, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("column < _columns.count"));
  }
  return (id)-[NSMutableArray objectAtIndex:](self->_columns, "objectAtIndex:", a3);
}

- (void)setHorizontalDistribution:(int64_t)a3
{
  int64_t v5;
  __int16 v6;
  uint64_t v8;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1)
    v5 = 0;
  else
    v5 = a3;
  v6 = *((_WORD *)&self->_arrangement + 4);
  if (v5 != (char)v6)
  {
    if ((unsigned __int16)(v6 << 8) == 256 || v5 == 1)
      v8 = 3;
    else
      v8 = 1;
    *((_WORD *)&self->_arrangement + 4) = v6 & 0xFF00 | v5;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", v8);
  }
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  int64_t v5;
  $7C9949954A3843EED5620E8235AAC90E gridViewFlags;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1)
    v5 = 1;
  else
    v5 = a3;
  gridViewFlags = self->_gridViewFlags;
  if (v5 != gridViewFlags)
  {
    self->_gridViewFlags = ($7C9949954A3843EED5620E8235AAC90E)(*(_DWORD *)&gridViewFlags & 0xFFFFFF00 | v5);
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 1);
  }
}

- (void)setVerticalDistribution:(int64_t)a3
{
  int64_t v5;
  uint64_t v7;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1)
    v5 = 0;
  else
    v5 = a3;
  if (v5 != *((__int16 *)&self->_arrangement + 4) >> 8)
  {
    if (*((_WORD *)&self->_arrangement + 4) == 1 || v5 == 1)
      v7 = 3;
    else
      v7 = 1;
    *((_WORD *)&self->_arrangement + 4) = *((_WORD *)&self->_arrangement + 4) | (unsigned __int16)((_WORD)v5 << 8);
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", v7);
  }
}

+ (id)containerGridViewWithArrangedSubviewRows:(id)a3
{
  void *v3;
  _QWORD v5[5];

  v3 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArrangedSubviewRows:", a3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__NUIContainerGridView_containerGridViewWithArrangedSubviewRows___block_invoke;
  v5[3] = &unk_1E57C68C8;
  v5[4] = v3;
  objc_msgSend(v3, "performBatchUpdates:", v5);
  return v3;
}

uint64_t __65__NUIContainerGridView_containerGridViewWithArrangedSubviewRows___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBaselineRelativeArrangement:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setColumnSpacing:", -1.79769313e308);
  objc_msgSend(*(id *)(a1 + 32), "setRowSpacing:", -1.79769313e308);
  objc_msgSend(*(id *)(a1 + 32), "setHorizontalAlignment:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setVerticalAlignment:", 2);
}

- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3
{
  id *v5;
  _BOOL4 v7;
  objc_super v9;
  uint64_t v10[2];

  -[NUIContainerGridView getColumnRange:rowRange:forArrangedSubview:](self, "getColumnRange:rowRange:forArrangedSubview:", 0, v10, a3);
  v9.receiver = self;
  v9.super_class = (Class)NUIContainerGridView;
  if (-[NUIContainerView needsBaselineDebugBoundingBoxesForArrangedSubview:](&v9, sel_needsBaselineDebugBoundingBoxesForArrangedSubview_, a3))
  {
    goto LABEL_7;
  }
  v5 = -[NUIContainerGridView _verticalAlignmentOfView:row:]((id *)&self->super.super.super.super.isa, (uint64_t)a3, v10[0]);
  if (v5 == (id *)2 || v5 == (id *)5)
    goto LABEL_7;
  v7 = -[NUIContainerView isBaselineRelativeArrangement](self, "isBaselineRelativeArrangement");
  if (v7)
  {
    if (-[NUIContainerGridView viewForFirstBaselineLayoutInRowAtIndex:](self, "viewForFirstBaselineLayoutInRowAtIndex:", v10[0]) != a3)
    {
      LOBYTE(v7) = -[NUIContainerGridView viewForLastBaselineLayoutInRowAtIndex:](self, "viewForLastBaselineLayoutInRowAtIndex:", v10[0] + v10[1] - 1) == a3;
      return v7;
    }
LABEL_7:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (NUIContainerGridView)initWithArrangedSubviews:(id)a3
{
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  objc_class *v8;
  NSString *v9;
  objc_class *v10;

  if (a3 && (_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached()))
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v5)
      v6 = (const __CFString *)v5;
    else
      v6 = CFSTR("<Unknown File>");
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = (objc_class *)objc_opt_class();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v6, 97, CFSTR("Use -[%@ initWithArrangedSubviewRows:] or -[%@ init]"), v9, NSStringFromClass(v10));
  }
  return -[NUIContainerGridView initWithArrangedSubviewRows:](self, "initWithArrangedSubviewRows:", 0);
}

- (void)dealloc
{
  objc_super v3;

  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, -1);
  *(_DWORD *)&self->_gridViewFlags |= 0x10000u;

  self->_viewRows = 0;
  self->_columns = 0;

  self->_rows = 0;
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerGridView;
  -[NUIContainerView dealloc](&v3, sel_dealloc);
}

- (uint64_t)_verifyInternalGridConsistencyWarningOnly:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend((id)result, "arrangedSubviews"));
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = *(void **)(v3 + 552);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    if ((objc_msgSend(v4, "isEqualToSet:", v5) & 1) != 0)
    {
      return 1;
    }
    else
    {
      v11 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v11, "minusSet:", v4);
      objc_msgSend(v4, "minusSet:", v5);
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      if (objc_msgSend(v11, "count"))
        objc_msgSend(v12, "appendFormat:", CFSTR("Views managed by grid missing from arranged subviews: %@\n"), v11);
      if (objc_msgSend(v4, "count"))
        objc_msgSend(v12, "appendFormat:", CFSTR("Arranged subviews not being managed by grid: %@\n"), v4);
      if (a2)
      {
        v13 = _NUILog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[UIView(NUIPrivate) calculateLayoutSizeFittingSize:].cold.1((uint64_t)v12, v13);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@"), v12);
      }

      return 0;
    }
  }
  return result;
}

- (id)arrangedSubviewInColumnAtIndex:(int64_t)a3 rowAtIndex:(int64_t)a4
{
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;

  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && -[NSMutableArray count](self->_columns, "count") <= (unint64_t)a3)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v9)
      v10 = (const __CFString *)v9;
    else
      v10 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("column < _columns.count"));
  }
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && -[NSMutableArray count](self->_rows, "count") <= (unint64_t)a4)
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v11)
      v12 = (const __CFString *)v11;
    else
      v12 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row < _rows.count"));
  }
  return (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_viewRows, "objectAtIndexedSubscript:", a4), "objectAtIndexedSubscript:", a3);
}

- (int64_t)rowIndexForArrangedSubview:(id)a3
{
  int64_t v4;
  _BYTE v5[16];

  -[NUIContainerGridView getColumnRange:rowRange:forArrangedSubview:](self, "getColumnRange:rowRange:forArrangedSubview:", v5, &v4, a3);
  return v4;
}

- (int64_t)columnIndexForArrangedSubview:(id)a3
{
  uint64_t v4;
  int64_t v5;

  -[NUIContainerGridView getColumnRange:rowRange:forArrangedSubview:](self, "getColumnRange:rowRange:forArrangedSubview:", &v5, &v4, a3);
  return v5;
}

- (id)rowAtIndex:(int64_t)a3
{
  uint64_t v7;
  const __CFString *v8;

  if ((_NUIEnableAPIMisuseAssertions || (_NUIIsDebuggerAttached() & 1) != 0)
    && -[NSMutableArray count](self->_rows, "count") <= (unint64_t)a3)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v7)
      v8 = (const __CFString *)v7;
    else
      v8 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row < _rows.count"));
  }
  return (id)-[NSMutableArray objectAtIndex:](self->_rows, "objectAtIndex:", a3);
}

- (void)moveRowAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  id v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;

  if (a3 != a4)
  {
    -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
    if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
      && -[NSMutableArray count](self->_rows, "count") <= (unint64_t)a3)
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
      if (v10)
        v11 = (const __CFString *)v10;
      else
        v11 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromRow < _rows.count"));
    }
    if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
      && -[NSMutableArray count](self->_rows, "count") <= (unint64_t)a4)
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
      if (v12)
        v13 = (const __CFString *)v12;
      else
        v13 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toRow < _rows.count"));
    }
    *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
    v8 = (id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", a3);
    -[NSMutableArray removeObjectAtIndex:](self->_viewRows, "removeObjectAtIndex:", a3);
    -[NSMutableArray insertObject:atIndex:](self->_viewRows, "insertObject:atIndex:", v8, a4);

    v9 = (id)-[NSMutableArray objectAtIndex:](self->_rows, "objectAtIndex:", a3);
    -[NSMutableArray removeObjectAtIndex:](self->_rows, "removeObjectAtIndex:", a3);
    -[NSMutableArray insertObject:atIndex:](self->_rows, "insertObject:atIndex:", v9, a4);

    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  }
}

- (void)removeRowAtIndex:(int64_t)a3
{
  unint64_t v6;
  NSMutableArray *viewRows;
  NSMutableArray *columns;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if ((_NUIEnableAPIMisuseAssertions || (_NUIIsDebuggerAttached() & 1) != 0)
    && -[NSMutableArray count](self->_rows, "count") <= (unint64_t)a3)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v14)
      v15 = (const __CFString *)v14;
    else
      v15 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row < _rows.count"));
  }
  *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
  v6 = -[NSMutableArray count](self->_rows, "count");
  viewRows = self->_viewRows;
  if (v6 < 2)
  {
    -[NSMutableArray removeAllObjects](viewRows, "removeAllObjects");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    columns = self->_columns;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(columns);
          *(_WORD *)(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i) + 40) |= 0x400u;
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    -[NSMutableArray removeAllObjects](self->_columns, "removeAllObjects");
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](viewRows, "removeObjectAtIndex:", a3);
  }
  v13 = -[NSMutableArray objectAtIndex:](self->_rows, "objectAtIndex:", a3);
  *(_WORD *)(v13 + 40) |= 0x400u;
  -[NSMutableArray removeObjectAtIndex:](self->_rows, "removeObjectAtIndex:", a3);
  -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
}

- (id)addColumnWithArrangedSubviews:(id)a3
{
  return -[NUIContainerGridView insertColumnAtIndex:withArrangedSubviews:](self, "insertColumnAtIndex:withArrangedSubviews:", -[NUIContainerGridView numberOfColumns](self, "numberOfColumns"), a3);
}

- (void)moveColumnAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  NSMutableArray *viewRows;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3 != a4)
  {
    -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
    if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
      && -[NSMutableArray count](self->_columns, "count") <= (unint64_t)a3)
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
      if (v16)
        v17 = (const __CFString *)v16;
      else
        v17 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v17, 433, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromCol < _columns.count"));
    }
    if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
      && -[NSMutableArray count](self->_columns, "count") <= (unint64_t)a4)
    {
      v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
      if (v18)
        v19 = (const __CFString *)v18;
      else
        v19 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v19, 434, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toCol < _columns.count"));
    }
    *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    viewRows = self->_viewRows;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewRows, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(viewRows);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "objectAtIndex:", a3);
          objc_msgSend(v13, "removeObjectAtIndex:", a3);
          objc_msgSend(v13, "insertObject:atIndex:", v14, a4);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewRows, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }
    v15 = (id)-[NSMutableArray objectAtIndex:](self->_columns, "objectAtIndex:", a3);
    -[NSMutableArray removeObjectAtIndex:](self->_columns, "removeObjectAtIndex:", a3);
    -[NSMutableArray insertObject:atIndex:](self->_columns, "insertObject:atIndex:", v15, a4);

    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  }
}

- (void)removeColumnAtIndex:(int64_t)a3
{
  NSMutableArray *viewRows;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  NSMutableArray *rows;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if ((_NUIEnableAPIMisuseAssertions || (_NUIIsDebuggerAttached() & 1) != 0)
    && -[NSMutableArray count](self->_columns, "count") <= (unint64_t)a3)
  {
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v17)
      v18 = (const __CFString *)v17;
    else
      v18 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("column < _columns.count"));
  }
  *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
  if ((unint64_t)-[NSMutableArray count](self->_columns, "count") < 2)
  {
    -[NSMutableArray removeAllObjects](self->_viewRows, "removeAllObjects");
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    rows = self->_rows;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rows, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(rows);
          *(_WORD *)(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i) + 40) |= 0x400u;
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rows, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v13);
    }
    -[NSMutableArray removeAllObjects](self->_rows, "removeAllObjects");
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    viewRows = self->_viewRows;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewRows, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v8; ++j)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(viewRows);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "removeObjectAtIndex:", a3);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewRows, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }
  }
  v16 = -[NSMutableArray objectAtIndex:](self->_columns, "objectAtIndex:", a3);
  *(_WORD *)(v16 + 40) |= 0x400u;
  -[NSMutableArray removeObjectAtIndex:](self->_columns, "removeObjectAtIndex:", a3);
  -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
}

- (void)replaceArrangedSubview:(id)a3 inColumnAtIndex:(int64_t)a4 rowAtIndex:(int64_t)a5
{
  id v10;
  unint64_t i;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && -[NSMutableArray count](self->_columns, "count") <= (unint64_t)a4)
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v15)
      v16 = (const __CFString *)v15;
    else
      v16 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 472, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("column < _columns.count"));
  }
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && -[NSMutableArray count](self->_rows, "count") <= (unint64_t)a5)
  {
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm");
    if (v17)
      v18 = (const __CFString *)v17;
    else
      v18 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row < _rows.count"));
  }
  v10 = -[NUIContainerGridView arrangedSubviewInColumnAtIndex:rowAtIndex:](self, "arrangedSubviewInColumnAtIndex:rowAtIndex:", a4, a5);
  if (v10 != a3)
  {
    *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
    -[NUIContainerGridView getColumnRange:rowRange:forArrangedSubview:](self, "getColumnRange:rowRange:forArrangedSubview:", &v21, &v19, v10);
    for (i = v19; i < v20 + v19; ++i)
    {
      v12 = -[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", i);
      v13 = v21;
      if (v21 < v22 + v21)
      {
        v14 = (void *)v12;
        do
          objc_msgSend(v14, "replaceObjectAtIndex:withObject:", v13++, a3);
        while (v13 < v22 + v21);
      }
    }
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  }
}

- (void)replaceArrangedSubviewAtIndex:(unint64_t)a3 withView:(id)a4
{
  id v6;
  unint64_t i;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v6 = -[NSArray objectAtIndex:](-[NUIContainerView arrangedSubviews](self, "arrangedSubviews"), "objectAtIndex:", a3);
  if (v6 != a4)
  {
    *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
    -[NUIContainerGridView getColumnRange:rowRange:forArrangedSubview:](self, "getColumnRange:rowRange:forArrangedSubview:", &v13, &v11, v6);
    for (i = v11; i < v12 + v11; ++i)
    {
      v8 = -[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", i);
      v9 = v13;
      if (v13 < v14 + v13)
      {
        v10 = (void *)v8;
        do
          objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v9++, a4);
        while (v9 < v14 + v13);
      }
    }
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  }
}

- (int64_t)horizontalAlignment
{
  return (int64_t)self->_gridViewFlags;
}

- (int64_t)verticalAlignment
{
  return (uint64_t)(int)(*(_DWORD *)&self->_gridViewFlags << 16) >> 24;
}

- (int64_t)horizontalDistribution
{
  return *((char *)&self->_arrangement + 8);
}

- (int64_t)verticalDistribution
{
  return *((char *)&self->_arrangement + 9);
}

- (double)rowSpacing
{
  return self->_spacing.height;
}

- (double)columnSpacing
{
  return self->_spacing.width;
}

- (void)setRowHeight:(double)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_rowHeight != a3)
  {
    self->_rowHeight = a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (void)setColumnWidth:(double)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_columnWidth != a3)
  {
    self->_columnWidth = a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (void)_baselineViewVendForFirstBaseline:(void *)a3 fromViews:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v16;
  v10 = 0.0;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(a3);
      v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (v12 != v8)
      {
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isHidden") & 1) == 0)
        {
          if (a2)
            objc_msgSend(v12, "effectiveFirstBaselineOffsetFromTop");
          else
            objc_msgSend(v12, "effectiveBaselineOffsetFromBottom");
          if (v13 > v10)
          {
            v7 = v12;
            v10 = v13;
          }
        }
        v8 = v12;
      }
    }
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v6);
  return v7;
}

- (id)calculateViewForFirstBaselineLayout
{
  id result;
  id v4;
  uint64_t v5;

  result = (id)-[NSMutableArray count](self->_rows, "count");
  if (result)
  {
    v4 = result;
    v5 = 0;
    while ((*(_WORD *)(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", v5) + 40) & 0x200) != 0)
    {
      if (v4 == (id)++v5)
      {
        result = 0;
        goto LABEL_7;
      }
    }
    result = -[NUIContainerGridView viewForFirstBaselineLayoutInRowAtIndex:](self, "viewForFirstBaselineLayoutInRowAtIndex:", v5);
  }
LABEL_7:
  if (!result)
    return self;
  return result;
}

- (id)calculateViewForLastBaselineLayout
{
  uint64_t v3;
  id result;

  v3 = -[NSMutableArray count](self->_rows, "count");
  do
    --v3;
  while ((*(_WORD *)(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", v3) + 40) & 0x200) != 0);
  result = -[NUIContainerGridView viewForLastBaselineLayoutInRowAtIndex:](self, "viewForLastBaselineLayoutInRowAtIndex:", v3);
  if (!result)
    return self;
  return result;
}

- (id)viewForFirstBaselineLayoutInRowAtIndex:(int64_t)a3
{
  if ((*(_WORD *)(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:") + 40) & 0x200) != 0)
    return 0;
  else
    return -[NUIContainerGridView _baselineViewVendForFirstBaseline:fromViews:]((uint64_t)self, 1, (void *)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", a3));
}

- (id)viewForLastBaselineLayoutInRowAtIndex:(int64_t)a3
{
  if ((*(_WORD *)(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:") + 40) & 0x200) != 0)
    return 0;
  else
    return -[NUIContainerGridView _baselineViewVendForFirstBaseline:fromViews:]((uint64_t)self, 0, (void *)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", a3));
}

- (id)arrangedDebugDescription
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  _QWORD v8[5];
  _NUIGridArrangement v9;
  objc_super v10;
  CGSize v11;

  v10.receiver = self;
  v10.super_class = (Class)NUIContainerGridView;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ size = {%ld, %ld} cells = "), -[NUIContainerView arrangedDebugDescription](&v10, sel_arrangedDebugDescription), -[NUIContainerGridView numberOfColumns](self, "numberOfColumns"), -[NUIContainerGridView numberOfRows](self, "numberOfRows"));
  _NUIGridArrangement::_NUIGridArrangement(&v9);
  v9.container = (_NUIGridArrangementContainer *)self;
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, -1);
  -[NUIContainerGridView bounds](self, "bounds");
  v11.width = v4;
  v11.height = v5;
  _NUIGridArrangement::measureCells(&v9, 1, v11);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__NUIContainerGridView_arrangedDebugDescription__block_invoke;
  v8[3] = &unk_1E57C6B58;
  v8[4] = v3;
  _NUIGridArrangement::enumerateCells((uint64_t)&v9, (uint64_t)v8);
  v6 = (void *)objc_msgSend(v3, "stringByAppendingString:", CFSTR(";"));
  if (v9.viewFrames.__begin_)
  {
    v9.viewFrames.__end_ = v9.viewFrames.__begin_;
    operator delete(v9.viewFrames.__begin_);
  }
  if (v9.rows.__begin_)
  {
    v9.rows.__end_ = v9.rows.__begin_;
    operator delete(v9.rows.__begin_);
  }
  if (v9.columns.__begin_)
  {
    v9.columns.__end_ = v9.columns.__begin_;
    operator delete(v9.columns.__begin_);
  }
  if (v9.cells.__begin_)
  {
    v9.cells.__end_ = v9.cells.__begin_;
    operator delete(v9.cells.__begin_);
  }
  return v6;
}

uint64_t __48__NUIContainerGridView_arrangedDebugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = *(_QWORD *)(a2 + 64);
  if (v5 == 1)
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(a2 + 56), v16);
  else
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu"), *(_QWORD *)(a2 + 56), v5);
  v7 = v6;
  v8 = *(_QWORD *)(a2 + 80);
  if (v8 == 1)
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(a2 + 72), v17);
  else
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu"), *(_QWORD *)(a2 + 72), v8);
  v10 = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@:%@]"), v7, v9);
  v11 = *(char *)(a2 + 104);
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_313);
  v12 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11));
  if (!v12)
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v11);
  v13 = *(char *)(a2 + 105);
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_313);
  v14 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13));
  if (!v14)
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v13);
  objc_msgSend(v10, "appendFormat:", CFSTR("(%@|%@)"), v12, v14);
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", v10);
}

- (id)debugDictionaryForVisibleArrangedSubview:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  _QWORD v10[2];
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NUIContainerGridView;
  v5 = -[NUIContainerView debugDictionaryForVisibleArrangedSubview:](&v11, sel_debugDictionaryForVisibleArrangedSubview_);
  -[NUIContainerGridView getColumnRange:rowRange:forArrangedSubview:](self, "getColumnRange:rowRange:forArrangedSubview:", v10, v9, a3);
  v12[0] = CFSTR("column");
  if (v10[1] < 2uLL)
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10[0]);
  else
    v6 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10[0]);
  v13[0] = v6;
  v12[1] = CFSTR("row");
  if (v9[1] < 2uLL)
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9[0]);
  else
    v7 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v9[0]);
  v13[1] = v7;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2), CFSTR("span"));
  return v5;
}

- (void)debugDictionaryForDimensionConfiguration:(uint64_t)a1
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (!a1)
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(a2, "length");
  if (!NUIContainerViewLengthIsDefault(v4))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a2, "length");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v5, "numberWithDouble:"), CFSTR("length"));
  }
  objc_msgSend(a2, "spacingAfter");
  if (!NUIContainerViewLengthIsDefault(v6))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a2, "spacingAfter");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v7, "numberWithDouble:"), CFSTR("spacingAfter"));
  }
  if ((objc_msgSend(a2, "alignment") & 0x8000000000000000) == 0)
  {
    v8 = objc_msgSend(a2, "alignment");
    if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
      dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_313);
    v9 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8));
    if (!v9)
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v8);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("alignment"));
  }
  return v3;
}

- (uint64_t)debugArrayForDimension:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  const __CFString *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a2);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isHidden"))
        {
          v10 = (void *)v4;
          v11 = CFSTR("hidden");
        }
        else
        {
          v11 = (const __CFString *)-[NUIContainerGridView debugDictionaryForDimensionConfiguration:](a1, v9);
          v10 = (void *)v4;
        }
        objc_msgSend(v10, "addObject:", v11);
      }
      v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)debugDictionary
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUIContainerGridView;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[NUIContainerView debugDictionary](&v5, sel_debugDictionary));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NUIContainerGridView debugArrayForDimension:]((uint64_t)self, self->_columns), CFSTR("columns"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NUIContainerGridView debugArrayForDimension:]((uint64_t)self, self->_rows), CFSTR("rows"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", _NUIGridArrangement::debugDictionary(&self->_arrangement), CFSTR("arrangement"));
  return v3;
}

- (void)didRemoveArrangedSubview:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  objc_class *v9;

  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && (*((_BYTE *)&self->_gridViewFlags + 2) & 1) == 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm", a4);
    if (v6)
      v7 = (const __CFString *)v6;
    else
      v7 = CFSTR("<Unknown File>");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (objc_class *)objc_opt_class();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 811, CFSTR("-[%1$@ removeArrangedSubview:] not supported, use -[%1$@ remove{Row|Column}AtIndex:] to remove arranged subviews."), NSStringFromClass(v9));
  }
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (double)columnWidth
{
  return self->_columnWidth;
}

- (void).cxx_destruct
{
  _NUIGridArrangement *p_arrangement;
  CGRect *begin;
  _NUIGridArrangementDimension *v5;
  _NUIGridArrangementDimension *v6;
  _NUIGridArrangementCell *v7;

  std::__tree<UIView *>::destroy((uint64_t)&self->_viewRanges, (_QWORD *)self->_viewRanges.__tree_.__pair1_.__value_.__left_);
  p_arrangement = &self->_arrangement;
  begin = p_arrangement->viewFrames.__begin_;
  if (begin)
  {
    p_arrangement->viewFrames.__end_ = begin;
    operator delete(begin);
  }
  v5 = p_arrangement->rows.__begin_;
  if (v5)
  {
    p_arrangement->rows.__end_ = v5;
    operator delete(v5);
  }
  v6 = p_arrangement->columns.__begin_;
  if (v6)
  {
    p_arrangement->columns.__end_ = v6;
    operator delete(v6);
  }
  v7 = p_arrangement->cells.__begin_;
  if (v7)
  {
    p_arrangement->cells.__end_ = v7;
    operator delete(v7);
  }
}

@end

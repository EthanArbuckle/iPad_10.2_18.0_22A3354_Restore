@implementation PKTextInputGestureFeedbackView

- (PKTextInputGestureFeedbackView)initWithFrame:(CGRect)a3
{
  PKTextInputGestureFeedbackView *v3;
  PKTextInputGestureFeedbackView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKTextInputGestureFeedbackView;
  v3 = -[PKTextInputGestureFeedbackView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKTextInputGestureFeedbackView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputGestureFeedbackView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)setNeedsRefreshFeedbackViews
{
  id WeakRetained;
  uint64_t v3;

  if (a1 && !*(_BYTE *)(a1 + 416))
  {
    *(_BYTE *)(a1 + 416) = 1;
    objc_msgSend((id)a1, "setNeedsLayout");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 424));
    v3 = objc_msgSend(WeakRetained, "feedbackType");

    if (v3 != 3)
      -[PKTextInputGestureFeedbackView cancelShowingReserveSpaceIntro]((id *)a1);
  }
}

- (id)dataSourceController
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 53);
  return WeakRetained;
}

- (void)cancelShowingReserveSpaceIntro
{
  id v2;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id *v13;

  if (a1)
  {
    v2 = a1[55];
    objc_msgSend(v2, "superview");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    if (v3 == a1)
    {
      objc_msgSend(v2, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "animationKeys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0DC3F10];
        v8 = MEMORY[0x1E0C809B0];
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __64__PKTextInputGestureFeedbackView_cancelShowingReserveSpaceIntro__block_invoke;
        v11[3] = &unk_1E7777C20;
        v12 = v2;
        v13 = a1;
        v9[0] = v8;
        v9[1] = 3221225472;
        v9[2] = __64__PKTextInputGestureFeedbackView_cancelShowingReserveSpaceIntro__block_invoke_2;
        v9[3] = &unk_1E7778650;
        v10 = v12;
        objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 131076, v11, v9, 0.15, 0.0);

      }
    }
    else
    {

    }
  }
}

- (void)layoutSubviews
{
  void *v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double x;
  double y;
  double height;
  double width;
  id WeakRetained;
  _QWORD *v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t i;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  double v54;
  uint64_t v55;
  CGFloat v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  void *v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  NSArray *highlightViews;
  NSArray *v68;
  NSArray *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  NSArray *v76;
  id v77;
  id v78;
  void *v79;
  double v80;
  uint64_t v81;
  void *v82;
  NSArray *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  void *v88;
  unint64_t v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  NSArray *v101;
  void *v102;
  id *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  id *v108;
  double v109;
  double v110;
  objc_super v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  uint64_t v117;
  CGRect v118;
  CGRect v119;

  v117 = *MEMORY[0x1E0C80C00];
  v111.receiver = self;
  v111.super_class = (Class)PKTextInputGestureFeedbackView;
  -[PKTextInputGestureFeedbackView layoutSubviews](&v111, sel_layoutSubviews);
  -[PKTextInputGestureFeedbackView dataSourceController]((id *)&self->super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "referenceElementContent");
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  -[PKTextInputGestureFeedbackView dataSourceController]((id *)&self->super.super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "referenceTextRange");
  v8 = v7;

  -[PKTextInputGestureFeedbackView dataSourceController]((id *)&self->super.super.super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "feedbackType");

  v108 = v4;
  if (!self)
  {
    v103 = v4;
    v15 = 0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    goto LABEL_57;
  }
  if (v10 == 5)
  {
    v11 = 1.0;
    if (!v4)
    {
      v15 = 0;
      v12 = 1.0;
      v13 = 1.0;
      v14 = 1.0;
      goto LABEL_57;
    }
    v12 = 1.0;
    v13 = 1.0;
    v14 = 1.0;
  }
  else
  {
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v11 = *MEMORY[0x1E0DC49E8];
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v15 = 0;
    if (!v4 || v6 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_57;
  }
  v16 = v4[1];
  -[PKTextInputElement coordinateSpace]((uint64_t)v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v10 == 5)
    {
      v104 = v14;
      v18 = v13;
      x = self->__reserveSpaceCaretRect.origin.x;
      y = self->__reserveSpaceCaretRect.origin.y;
      width = self->__reserveSpaceCaretRect.size.width;
      height = self->__reserveSpaceCaretRect.size.height;
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceController);
      objc_msgSend(WeakRetained, "referenceElementContent");
      v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      v109 = y;
      v110 = x;
      v118.origin.x = x;
      v118.origin.y = y;
      v25 = width;
      v118.size.width = width;
      v118.size.height = height;
      if (!CGRectIsNull(v118))
      {
        v26 = v24 ? (void *)v24[1] : 0;
        v27 = v26;
        -[PKTextInputElement coordinateSpace]((uint64_t)v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          if (v24)
            v29 = (void *)v24[1];
          else
            v29 = 0;
          v30 = v29;
          -[PKTextInputElement coordinateSpace]((uint64_t)v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(self, v31, x, y, width, height);
          v109 = v33;
          v110 = v32;
          v25 = v34;
          height = v35;

        }
      }
      v105 = v18;
      v106 = v12;
      v107 = v11;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_loadWeakRetained((id *)&self->_dataSourceController);
      objc_msgSend(v37, "reserveSpacePlaceholder");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      objc_msgSend(v38, "rects");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v112, v116, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v113;
        v43 = height * 0.6;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v113 != v42)
              objc_enumerationMutation(v39);
            v45 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
            objc_msgSend(v45, "rect");
            v46 = v119.origin.x;
            v47 = v119.origin.y;
            v48 = v119.size.width;
            v49 = v119.size.height;
            if (!CGRectIsNull(v119))
            {
              v50 = objc_msgSend(v38, "shouldIgnoreOrigin");
              if (v50)
                v51 = v110;
              else
                v51 = v46;
              if (v50)
                v52 = v109;
              else
                v52 = v47;
              if (v48 <= v25)
              {
                if (v49 >= v43)
                  v54 = -0.0;
                else
                  v54 = v49;
                v55 = objc_msgSend(v45, "writingDirection");
                v56 = 0.0;
                if (v55 != 1)
                {
                  -[PKTextInputGestureFeedbackView bounds](self, "bounds", 0.0);
                  v56 = v51;
                  v51 = v57;
                }
                +[PKTextInputFeedbackRect rectWithFrame:](v56, v52, v51, height + v54);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "addObject:", v58);

                v59 = height + v52;
                do
                {
                  if (height >= v49)
                    v60 = v49;
                  else
                    v60 = height;
                  if (v49 - v60 >= v43)
                    v61 = v60;
                  else
                    v61 = v49;
                  if (v61 >= v43)
                  {
                    -[PKTextInputGestureFeedbackView bounds](self, "bounds");
                    +[PKTextInputFeedbackRect rectWithFrame:](0.0, v59, v62, v61);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "addObject:", v63);

                  }
                  v49 = v49 - v61;
                  v59 = v59 + v61;
                }
                while (v49 > 0.0);
              }
              else if (v49 >= height)
              {
                objc_msgSend(v36, "addObject:", v45);
              }
              else
              {
                if (objc_msgSend(v45, "writingDirection") == 1)
                  v53 = v51 - v48;
                else
                  v53 = v51;
                +[PKTextInputFeedbackRect rectWithFrame:](v53, v52, v48, height);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "addObject:", v64);

              }
            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v112, v116, 16);
        }
        while (v41);
      }

      v4 = v108;
      -[PKTextInputElementContent rectValuesForSelectionRects:inCoordinateSpace:visibleOnly:](v108, v36, self, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v106;
      v11 = v107;
      v14 = v104;
      v13 = v105;
      v10 = 5;
    }
    else
    {
      -[PKTextInputElementContent selectionRectsForRange:inCoordinateSpace:visibleOnly:]((uint64_t)v4, v6, v8, self, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_57:

  v65 = objc_msgSend(v15, "count");
  if (self)
  {
    v66 = v65;
    highlightViews = self->__highlightViews;
    if (highlightViews)
    {
      v68 = highlightViews;
      v69 = (NSArray *)-[NSArray mutableCopy](v68, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v65);
      v69 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }

    while (-[NSArray count](v69, "count") > v66)
    {
      -[NSArray lastObject](v69, "lastObject");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "removeFromSuperview");

      -[NSArray removeLastObject](v69, "removeLastObject");
    }
    if (-[NSArray count](v69, "count") < v66)
    {
      v71 = *MEMORY[0x1E0C9D648];
      v72 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v73 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v74 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v71, v72, v73, v74);
        -[PKTextInputGestureFeedbackView addSubview:](self, "addSubview:", v75);
        -[NSArray addObject:](v69, "addObject:", v75);

      }
      while (-[NSArray count](v69, "count") < v66);
    }
    v76 = self->__highlightViews;
    self->__highlightViews = v69;

  }
  if (v4)
    v77 = v4[1];
  else
    v77 = 0;
  v78 = v77;
  v79 = v78;
  if (self)
  {
    if (v10 == 5)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "pk_textInputReserveSpaceColor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = 5.0;
    }
    else
    {
      v80 = 0.0;
      if (v10 == 2)
      {
        objc_msgSend(v78, "selectionHighlightColor");
        v81 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v10 != 1)
        {
          v82 = 0;
          goto LABEL_79;
        }
        objc_msgSend(MEMORY[0x1E0DC3658], "pk_textInputDeletionPreviewColor");
        v81 = objc_claimAutoreleasedReturnValue();
      }
      v82 = (void *)v81;
    }
LABEL_79:
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v83 = self->__highlightViews;
    v84 = -[NSArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v112, v116, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v113;
      do
      {
        for (j = 0; j != v85; ++j)
        {
          if (*(_QWORD *)v113 != v86)
            objc_enumerationMutation(v83);
          v88 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
          objc_msgSend(v88, "setBackgroundColor:", v82);
          objc_msgSend(v88, "_setCornerRadius:", v80);
        }
        v85 = -[NSArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v112, v116, 16);
      }
      while (v85);
    }

    v4 = v108;
  }

  if (objc_msgSend(v15, "count"))
  {
    v89 = 0;
    v90 = v12 + v14;
    v91 = v11 + v13;
    do
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v89);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "CGRectValue");
      v94 = v93;
      v96 = v95;
      v98 = v97;
      v100 = v99;

      if (self)
        v101 = self->__highlightViews;
      else
        v101 = 0;
      -[NSArray objectAtIndexedSubscript:](v101, "objectAtIndexedSubscript:", v89);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setFrame:", v12 + v94, v11 + v96, v98 - v90, v100 - v91);

      ++v89;
    }
    while (v89 < objc_msgSend(v15, "count"));
  }
  if (self)
    self->__needsRefresh = 0;

}

void __67__PKTextInputGestureFeedbackView__prepareForReserveSpaceAnimations__block_invoke(uint64_t a1)
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = *(double **)(a1 + 32);
  if (v2)
  {
    v3 = v2[56];
    v4 = v2[57];
    v5 = v2[58];
    v6 = v2[59];
    v7 = (void *)*((_QWORD *)v2 + 55);
  }
  else
  {
    v7 = 0;
    v6 = 0.0;
    v5 = 0.0;
    v4 = 0.0;
    v3 = 0.0;
  }
  objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 440);
  else
    v9 = 0;
  objc_msgSend(v9, "_setCornerRadius:", 0.0);
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(void **)(v10 + 440);
  else
    v11 = 0;
  objc_msgSend(v11, "setAlpha:", 1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "pk_textInputReserveSpaceColor");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    v14 = *(void **)(v13 + 440);
  else
    v14 = 0;
  v15 = (id)v12;
  objc_msgSend(v14, "setBackgroundColor:", v12);

}

- (void)beginShowingReserveSpaceIntro
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id WeakRetained;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  double v31;
  CGFloat x;
  double v33;
  CGFloat y;
  double v35;
  CGFloat width;
  double v37;
  CGFloat height;
  id v39;
  _QWORD *v40;
  void *v41;
  id v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[4];
  id v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  _QWORD v70[5];
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

  v76 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(void **)(a1 + 440);
    if (!v2)
    {
      v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v5 = *(void **)(a1 + 440);
      *(_QWORD *)(a1 + 440) = v4;

      v2 = *(void **)(a1 + 440);
    }
    v6 = v2;
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != (void *)a1)
      objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 440));
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v8 = *(id *)(a1 + 432);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v72 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "removeFromSuperview");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 440), "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllAnimations");

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 424));
    objc_msgSend(WeakRetained, "referenceElementContent");
    v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    v16 = objc_loadWeakRetained((id *)(a1 + 424));
    v17 = objc_msgSend(v16, "referenceTextRange");

    v18 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v20 = v19;
    v21 = *MEMORY[0x1E0C9D628];
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v23 = v18;
    v24 = v22;
    v25 = *MEMORY[0x1E0C9D628];
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v26 = v15 ? (void *)v15[1] : 0;
      v27 = v26;
      -[PKTextInputElement coordinateSpace]((uint64_t)v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v19;
      v23 = v18;
      v24 = v22;
      v25 = v21;
      if (v28)
        v25 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:]((uint64_t)v15, v17, (void *)a1);
    }
    *(double *)(a1 + 448) = v25;
    *(CGFloat *)(a1 + 456) = v24;
    *(CGFloat *)(a1 + 464) = v23;
    *(CGFloat *)(a1 + 472) = v20;
    v29 = MEMORY[0x1E0C809B0];
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __67__PKTextInputGestureFeedbackView__prepareForReserveSpaceAnimations__block_invoke;
    v70[3] = &unk_1E7778020;
    v70[4] = a1;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v70);

    v30 = *(id *)(a1 + 440);
    objc_msgSend(v30, "frame");
    UIRectInset();
    x = v31;
    y = v33;
    width = v35;
    height = v37;
    v39 = objc_loadWeakRetained((id *)(a1 + 424));
    objc_msgSend(v39, "referenceElementContent");
    v40 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v40)
      v41 = (void *)v40[1];
    else
      v41 = 0;
    v42 = v41;
    v43 = v42;
    if (v42)
    {
      objc_msgSend(v42, "selectionClipRectInCoordinateSpace:", a1);
      v21 = v44;
      v22 = v45;
      v18 = v46;
      v19 = v47;
    }

    v77.origin.x = v21;
    v77.origin.y = v22;
    v77.size.width = v18;
    v77.size.height = v19;
    if (!CGRectIsNull(v77))
    {
      v78.origin.x = x;
      v78.origin.y = y;
      v78.size.width = width;
      v78.size.height = height;
      v80.origin.x = v21;
      v80.origin.y = v22;
      v80.size.width = v18;
      v80.size.height = v19;
      v79 = CGRectIntersection(v78, v80);
      x = v79.origin.x;
      y = v79.origin.y;
      width = v79.size.width;
      height = v79.size.height;
    }
    UIRectInset();
    v57 = v48;
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v55 = (void *)MEMORY[0x1E0DC3F10];
    v64[0] = v29;
    v64[1] = 3221225472;
    v64[2] = __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke;
    v64[3] = &unk_1E777D718;
    v65 = v30;
    v66 = x;
    v67 = y;
    v68 = width;
    v69 = height;
    v58[0] = v29;
    v58[1] = 3221225472;
    v58[2] = __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_2;
    v58[3] = &unk_1E777D740;
    v59 = v65;
    v60 = v57;
    v61 = v50;
    v62 = v52;
    v63 = v54;
    v56 = v65;
    objc_msgSend(v55, "animateWithDuration:delay:options:animations:completion:", 0x20000, v64, v58, 0.4, 0.0);

  }
}

uint64_t __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_setCornerRadius:", 5.0);
}

void __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  __int128 v11;

  if (a2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = (void *)MEMORY[0x1E0DC3F10];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_3;
    v8[3] = &unk_1E777D718;
    v9 = *(id *)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 56);
    v10 = *(_OWORD *)(a1 + 40);
    v11 = v5;
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_4;
    v6[3] = &unk_1E7778650;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "animateWithDuration:delay:options:animations:completion:", 0x20000, v8, v6, 0.1, 0.0);

  }
}

uint64_t __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __63__PKTextInputGestureFeedbackView_beginShowingReserveSpaceIntro__block_invoke_4(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "_setCornerRadius:", 0.0);
    objc_msgSend(*(id *)(v2 + 32), "setAlpha:", 1.0);
    return objc_msgSend(*(id *)(v2 + 32), "removeFromSuperview");
  }
  return result;
}

uint64_t __64__PKTextInputGestureFeedbackView_cancelShowingReserveSpaceIntro__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = (double *)(v2 + 448);
    v4 = *v3;
    v5 = v3[1];
    v6 = v3[2];
    v7 = v3[3];
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    v4 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v4, v5, v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "_setCornerRadius:", 0.0);
}

uint64_t __64__PKTextInputGestureFeedbackView_cancelShowingReserveSpaceIntro__block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "setAlpha:", 1.0);
    objc_msgSend(*(id *)(v2 + 32), "_setCornerRadius:", 0.0);
    return objc_msgSend(*(id *)(v2 + 32), "removeFromSuperview");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reserveSpaceView, 0);
  objc_storeStrong((id *)&self->__highlightViews, 0);
  objc_destroyWeak((id *)&self->_dataSourceController);
}

@end

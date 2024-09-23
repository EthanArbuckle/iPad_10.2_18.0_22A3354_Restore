@implementation _MKStackView

- (_MKStackView)initWithFrame:(CGRect)a3
{
  _MKStackView *v3;
  uint64_t v4;
  NSHashTable *viewsNeedingWidthConstraints;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKStackView;
  v3 = -[_MKStackView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    viewsNeedingWidthConstraints = v3->_viewsNeedingWidthConstraints;
    v3->_viewsNeedingWidthConstraints = (NSHashTable *)v4;

  }
  return v3;
}

- (void)setStackedSubviews:(id)a3
{
  -[_MKStackView setStackedSubviews:animated:](self, "setStackedSubviews:animated:", a3, 0);
}

- (void)setStackedSubviews:(id)a3 animated:(BOOL)a4
{
  -[_MKStackView setStackedSubviews:animated:isNeedLayout:](self, "setStackedSubviews:animated:isNeedLayout:", a3, a4, 1);
}

- (void)setStackedSubviews:(id)a3 animated:(BOOL)a4 isNeedLayout:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  NSArray *stackConstraints;
  NSArray *v12;
  NSArray *v13;
  NSArray *stackedSubviews;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSArray *v20;
  NSArray *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  void *v26;
  void *v27;
  _MKStackViewDelegate **p_stackDelegate;
  id WeakRetained;
  id v30;
  char v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  double Width;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double MaxY;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  void *v57;
  id v58;
  double v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  unint64_t v80;
  double v81;
  void *v82;
  uint64_t v83;
  id v84;
  char v85;
  NSArray *v86;
  NSArray *v87;
  void *v88;
  id v89;
  id obj;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  _BOOL4 v96;
  _MKStackView *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[4];
  id v103;
  _MKStackView *v104;
  char v105;
  _QWORD v106[5];
  id v107;
  id v108;
  objc_super v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _QWORD v123[4];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;

  v5 = a5;
  v6 = a4;
  v127 = *MEMORY[0x1E0C80C00];
  v8 = (NSArray *)a3;
  v9 = v8;
  if (self->_stackedSubviews != v8 && (-[NSArray isEqual:](v8, "isEqual:") & 1) == 0)
  {
    if (v6)
    {
      -[_MKStackView window](self, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v10 != 0;

    }
    else
    {
      v96 = 0;
    }
    if (self->_stackConstraints)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
      stackConstraints = self->_stackConstraints;
      self->_stackConstraints = 0;

    }
    v12 = self->_stackedSubviews;
    v13 = (NSArray *)-[NSArray copy](v9, "copy");
    stackedSubviews = self->_stackedSubviews;
    self->_stackedSubviews = v13;

    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v15 = self->_stackedSubviews;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v119;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v119 != v18)
            objc_enumerationMutation(v15);
          -[_MKStackView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i));
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
      }
      while (v17);
    }

    v20 = (NSArray *)MEMORY[0x1E0C9AA60];
    if (v12)
      v21 = v12;
    else
      v21 = (NSArray *)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "minusSet:", v23);

    if (v96)
    {
      v88 = v22;
      if (v5)
      {
        -[_MKStackView stackAnimationDelegate](self, "stackAnimationDelegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stackViewNeedsLayout:", self);

      }
      v87 = v9;
      if (v9)
        v25 = v9;
      else
        v25 = v20;
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "minusSet:", v27);

      v85 = -[_MKStackView clipsToBounds](self, "clipsToBounds");
      -[_MKStackView setClipsToBounds:](self, "setClipsToBounds:", 1);
      p_stackDelegate = &self->_stackDelegate;
      WeakRetained = objc_loadWeakRetained((id *)&self->_stackDelegate);
      v86 = v12;
      if (WeakRetained)
      {
        v30 = objc_loadWeakRetained((id *)&self->_stackDelegate);
        v31 = objc_opt_respondsToSelector();

      }
      else
      {
        v31 = 0;
      }

      v97 = self;
      -[_MKStackView bounds](self, "bounds");
      Width = CGRectGetWidth(v128);
      v114 = 0u;
      v115 = 0u;
      v116 = 0u;
      v117 = 0u;
      obj = v26;
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v115;
        v42 = *MEMORY[0x1E0C9D538];
        v43 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        do
        {
          v44 = 0;
          do
          {
            if (*(_QWORD *)v115 != v41)
              objc_enumerationMutation(obj);
            v45 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v44);
            objc_msgSend(v45, "widthAnchor");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "constraintEqualToConstant:", Width);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v47, "setActive:", 1);
            objc_msgSend(v45, "_mapkit_layoutIfNeeded");
            objc_msgSend(v47, "setActive:", 0);
            objc_msgSend(v45, "frame");
            v49 = v48;
            MaxY = v50;
            v53 = v52;
            v55 = v54;
            v56 = -[NSArray indexOfObject:](v97->_stackedSubviews, "indexOfObject:", v45);
            if (!v56)
            {
              v57 = 0;
              MaxY = v43;
              v49 = v42;
              if ((v31 & 1) == 0)
                goto LABEL_46;
LABEL_45:
              v58 = objc_loadWeakRetained((id *)p_stackDelegate);
              objc_msgSend(v58, "stackView:distanceBetweenUpperView:andLowerView:", v97, v57, v45);
              MaxY = MaxY + v59;

              goto LABEL_46;
            }
            if (v56 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v57 = 0;
              if ((v31 & 1) != 0)
                goto LABEL_45;
            }
            else
            {
              -[NSArray objectAtIndexedSubscript:](v97->_stackedSubviews, "objectAtIndexedSubscript:", v56 - 1);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "frame");
              MaxY = CGRectGetMaxY(v129);
              v49 = 0.0;
              if ((v31 & 1) != 0)
                goto LABEL_45;
            }
LABEL_46:
            objc_msgSend(v45, "setFrame:", v49, MaxY, v53, v55);
            objc_msgSend(v45, "setAlpha:", 0.0);

            ++v44;
          }
          while (v40 != v44);
          v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
          v40 = v60;
        }
        while (v60);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4 * objc_msgSend(v88, "count"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = 0u;
      v111 = 0u;
      v112 = 0u;
      v113 = 0u;
      v89 = v88;
      v93 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
      if (v93)
      {
        v91 = *(_QWORD *)v111;
        do
        {
          for (j = 0; j != v93; ++j)
          {
            if (*(_QWORD *)v111 != v91)
              objc_enumerationMutation(v89);
            v62 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
            objc_msgSend(v62, "frame");
            v64 = v63;
            v66 = v65;
            v68 = v67;
            v70 = v69;
            objc_msgSend(v62, "removeFromSuperview");
            v109.receiver = v97;
            v109.super_class = (Class)_MKStackView;
            -[_MKStackView addSubview:](&v109, sel_addSubview_, v62);
            objc_msgSend(v62, "topAnchor");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MKStackView topAnchor](v97, "topAnchor");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v130.origin.x = v64;
            v130.origin.y = v66;
            v130.size.width = v68;
            v130.size.height = v70;
            objc_msgSend(v95, "constraintEqualToAnchor:constant:", v94, CGRectGetMinY(v130));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v123[0] = v71;
            objc_msgSend(v62, "leftAnchor");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MKStackView leftAnchor](v97, "leftAnchor");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v131.origin.x = v64;
            v131.origin.y = v66;
            v131.size.width = v68;
            v131.size.height = v70;
            objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, CGRectGetMinX(v131));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v123[1] = v74;
            objc_msgSend(v62, "widthAnchor");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v132.origin.x = v64;
            v132.origin.y = v66;
            v132.size.width = v68;
            v132.size.height = v70;
            objc_msgSend(v75, "constraintEqualToConstant:", CGRectGetWidth(v132));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v123[2] = v76;
            objc_msgSend(v62, "heightAnchor");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v133.origin.x = v64;
            v133.origin.y = v66;
            v133.size.width = v68;
            v133.size.height = v70;
            objc_msgSend(v77, "constraintEqualToConstant:", CGRectGetHeight(v133));
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v123[3] = v78;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 4);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "addObjectsFromArray:", v79);

          }
          v93 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
        }
        while (v93);
      }

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v92);
      -[_MKStackView _createConstraints](v97, "_createConstraints");
      v80 = objc_msgSend(obj, "count");
      v81 = dbl_18B2A96F0[v80 < objc_msgSend(v89, "count")];
      v82 = (void *)MEMORY[0x1E0CEABB0];
      v83 = MEMORY[0x1E0C809B0];
      v106[0] = MEMORY[0x1E0C809B0];
      v106[1] = 3221225472;
      v106[2] = __57___MKStackView_setStackedSubviews_animated_isNeedLayout___block_invoke;
      v106[3] = &unk_1E20D7E80;
      v106[4] = v97;
      v107 = obj;
      v108 = v89;
      v102[0] = v83;
      v102[1] = 3221225472;
      v102[2] = __57___MKStackView_setStackedSubviews_animated_isNeedLayout___block_invoke_2;
      v102[3] = &unk_1E20D9308;
      v103 = v108;
      v104 = v97;
      v105 = v85;
      v84 = obj;
      objc_msgSend(v82, "_mapkit_animateWithDuration:animations:completion:", v106, v102, v81);

      v12 = v86;
      v9 = v87;
      v34 = v88;
    }
    else
    {
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v32 = v22;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
      v34 = v22;
      if (v33)
      {
        v35 = v33;
        v36 = *(_QWORD *)v99;
        do
        {
          for (k = 0; k != v35; ++k)
          {
            if (*(_QWORD *)v99 != v36)
              objc_enumerationMutation(v32);
            objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * k), "removeFromSuperview");
          }
          v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
        }
        while (v35);
      }

      -[_MKStackView _createConstraints](self, "_createConstraints");
    }

  }
}

- (void)_createConstraints
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _MKStackView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id WeakRetained;
  id v21;
  char v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  id v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  id v38;
  double v39;
  _BOOL4 bottomConstraintShouldBeGreaterThanOrEqual;
  void *v41;
  void *v42;
  double v43;
  objc_class *v44;
  void *v45;
  uint64_t v46;
  id *location;
  NSArray *obj;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000;
  if (-[NSHashTable count](self->_viewsNeedingWidthConstraints, "count"))
  {
    -[NSHashTable allObjects](self->_viewsNeedingWidthConstraints, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSHashTable removeAllObjects](self->_viewsNeedingWidthConstraints, "removeAllObjects");
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v55 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v11, "superview");
          v12 = (_MKStackView *)objc_claimAutoreleasedReturnValue();

          if (v12 == self)
          {
            objc_msgSend(v11, "leadingAnchor");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MKStackView leadingAnchor](self, "leadingAnchor");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "constraintEqualToAnchor:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v15);

            -[_MKStackView trailingAnchor](self, "trailingAnchor");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "trailingAnchor");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "constraintEqualToAnchor:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v18);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v8);
    }

    v3 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);

  }
  v19 = 416;
  if (!-[NSArray count](self->_stackConstraints, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_stackDelegate);
    location = (id *)&self->_stackDelegate;
    if (WeakRetained)
    {
      v21 = objc_loadWeakRetained((id *)&self->_stackDelegate);
      v22 = objc_opt_respondsToSelector();

    }
    else
    {
      v22 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_stackedSubviews, "count") + 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v23 = self->_stackedSubviews;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v24)
    {
      v25 = v24;
      v46 = 416;
      v26 = 0;
      v27 = *(_QWORD *)v51;
      obj = v23;
      do
      {
        v28 = 0;
        v29 = v26;
        do
        {
          if (*(_QWORD *)v51 != v27)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v28);
          v31 = 0.0;
          if ((v22 & 1) != 0)
          {
            v32 = objc_loadWeakRetained(location);
            objc_msgSend(v32, "stackView:distanceBetweenUpperView:andLowerView:", self, v29, v30);
            v31 = v33;

          }
          objc_msgSend(v30, "topAnchor", v46);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            objc_msgSend(v29, "bottomAnchor");
          else
            -[_MKStackView topAnchor](self, "topAnchor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, v31);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v36);

          v26 = v30;
          ++v28;
          v29 = v26;
        }
        while (v25 != v28);
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v25);

      if (!v26)
      {
        v3 = 0x1E0CB3000;
        v19 = v46;
LABEL_38:
        v44 = (objc_class *)objc_msgSend(v49, "copy");
        v45 = *(Class *)((char *)&self->super.super.super.isa + v19);
        *(Class *)((char *)&self->super.super.super.isa + v19) = v44;

        objc_msgSend(*(id *)(v3 + 1816), "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + v19));
        return;
      }
      v37 = 0.0;
      v3 = 0x1E0CB3000uLL;
      v19 = v46;
      if ((v22 & 1) != 0)
      {
        v38 = objc_loadWeakRetained(location);
        objc_msgSend(v38, "stackView:distanceBetweenUpperView:andLowerView:", self, v26, 0);
        v37 = v39;

      }
      bottomConstraintShouldBeGreaterThanOrEqual = self->_bottomConstraintShouldBeGreaterThanOrEqual;
      -[_MKStackView bottomAnchor](self, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bottomAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (bottomConstraintShouldBeGreaterThanOrEqual)
        objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:constant:", v42, v37);
      else
        objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, v37);
      v23 = (NSArray *)objc_claimAutoreleasedReturnValue();

      LODWORD(v43) = 1132068864;
      -[NSArray setPriority:](v23, "setPriority:", v43);
      objc_msgSend(v49, "addObject:", v23);
    }
    else
    {
      v26 = 0;
    }

    goto LABEL_38;
  }
}

- (void)addSubview:(id)a3
{
  id v4;
  _MKStackView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat Height;
  double v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (_MKStackView *)objc_claimAutoreleasedReturnValue();

  if (v5 != self)
  {
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKStackView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    if (objc_msgSend(v4, "_hostsLayoutEngineAllowsTAMIC_NO"))
      objc_msgSend(v4, "_setHostsLayoutEngine:", 1);
    objc_msgSend(v4, "bounds");
    Height = CGRectGetHeight(v15);
    v13 = 1.0;
    if (Height > 1.0)
    {
      objc_msgSend(v4, "bounds");
      v13 = CGRectGetHeight(v16);
    }
    objc_msgSend(v4, "setFrame:", v7, v9, v11, v13);
    -[NSHashTable addObject:](self->_viewsNeedingWidthConstraints, "addObject:", v4);
    v14.receiver = self;
    v14.super_class = (Class)_MKStackView;
    -[_MKStackView addSubview:](&v14, sel_addSubview_, v4);
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
  }

}

- (_MKStackViewDelegate)stackDelegate
{
  return (_MKStackViewDelegate *)objc_loadWeakRetained((id *)&self->_stackDelegate);
}

- (void)setStackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stackDelegate, a3);
}

- (NSArray)stackedSubviews
{
  return self->_stackedSubviews;
}

- (_MKAnimationStackViewDelegate)stackAnimationDelegate
{
  return (_MKAnimationStackViewDelegate *)objc_loadWeakRetained((id *)&self->_stackAnimationDelegate);
}

- (void)setStackAnimationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stackAnimationDelegate, a3);
}

- (BOOL)bottomConstraintShouldBeGreaterThanOrEqual
{
  return self->_bottomConstraintShouldBeGreaterThanOrEqual;
}

- (void)setBottomConstraintShouldBeGreaterThanOrEqual:(BOOL)a3
{
  self->_bottomConstraintShouldBeGreaterThanOrEqual = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stackAnimationDelegate);
  objc_storeStrong((id *)&self->_stackedSubviews, 0);
  objc_destroyWeak((id *)&self->_stackDelegate);
  objc_storeStrong((id *)&self->_viewsNeedingWidthConstraints, 0);
  objc_storeStrong((id *)&self->_stackConstraints, 0);
}

@end

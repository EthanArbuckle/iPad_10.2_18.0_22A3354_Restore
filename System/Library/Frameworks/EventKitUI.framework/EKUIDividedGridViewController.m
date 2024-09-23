@implementation EKUIDividedGridViewController

+ (id)dividerColor
{
  if (dividerColor_onceToken != -1)
    dispatch_once(&dividerColor_onceToken, &__block_literal_global_65);
  return (id)dividerColor___dividerColor;
}

void __45__EKUIDividedGridViewController_dividerColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dividerColor___dividerColor;
  dividerColor___dividerColor = v0;

}

- (EKUIDividedGridViewController)initWithType:(int64_t)a3 buttonTitles:(id)a4 cellBackgroundColor:(id)a5
{
  id v9;
  id v10;
  EKUIDividedGridViewController *v11;
  EKUIDividedGridViewController *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EKUIDividedGridViewController;
  v11 = -[EKUIDividedGridViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_buttonTitles, a4);
    objc_storeStrong((id *)&v12->_cellBackgroundColor, a5);
  }

  return v12;
}

- (void)loadView
{
  EKUIDividedGridViewController *v2;
  int64_t type;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  EKUIDividedGridViewCell *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  EKUIDividedGridViewCell *v22;
  EKUIDividedGridViewCell *v23;
  EKUIDividedGridViewCell *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  EKUIDividedGridViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  unint64_t v37;
  id v38;
  void *v39;
  void *v40;
  EKUIDividedGridViewCell *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  BOOL v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  unint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  EKUIDividedGridViewCell *firstValue;
  id firstValuea;
  EKUIDividedGridViewController *v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  const __CFString *v97;
  _QWORD v98[3];

  v2 = self;
  v98[1] = *MEMORY[0x1E0C80C00];
  type = self->_type;
  v4 = 7;
  if (type != 1)
    v4 = 0;
  v5 = type == 0;
  v6 = 4;
  if (!v5)
    v6 = v4;
  v84 = v6;
  v82 = (void *)objc_opt_new();
  v81 = (void *)objc_opt_new();
  v97 = CFSTR("dividerWidth");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  objc_msgSend(v7, "numberWithDouble:", 1.0 / v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, &v97, 1);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIDividedGridViewController buttonTitles](v2, "buttonTitles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  v13 = 0x1E0CB3000uLL;
  v90 = v2;
  if (v12)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    while (1)
    {
      -[EKUIDividedGridViewController buttonTitles](v2, "buttonTitles");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (!(v17 % v84))
      {
        v20 = objc_opt_new();

        v21 = objc_opt_new();
        objc_msgSend(v81, "addObject:", v20);
        v15 = (void *)v21;
        v14 = (void *)v20;
      }
      v86 = v14;
      v22 = [EKUIDividedGridViewCell alloc];
      v23 = v22;
      firstValue = v16;
      v83 = v19;
      if (v2->_cellBackgroundColor)
      {
        v24 = -[EKUIDividedGridViewCell initWithBackgroundColor:](v22, "initWithBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[EKUIDividedGridViewCell initWithBackgroundColor:](v23, "initWithBackgroundColor:", v25);

      }
      v26 = v17 + 1;
      -[EKUIDividedGridViewCell setViewController:](v24, "setViewController:", v2);
      -[EKUIDividedGridViewCell setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[EKUIDividedGridViewController buttonTitles](v2, "buttonTitles");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIDividedGridViewCell label](v24, "label");
      v29 = v2;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setText:", v28);

      objc_msgSend(v82, "addObject:", v24);
      v14 = v86;
      objc_msgSend(v86, "addSubview:", v24);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 8, 0, v86, 8, 1.0, 0.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v31);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 3, 0, v86, 3, 1.0, 0.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v32);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 7, 0, 0, 0, 1.0, 0.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIDividedGridViewCell setWidthConstraint:](v24, "setWidthConstraint:", v33);

      -[EKUIDividedGridViewCell widthConstraint](v24, "widthConstraint");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = 1148829696;
      objc_msgSend(v34, "setPriority:", v35);

      -[EKUIDividedGridViewCell widthConstraint](v24, "widthConstraint");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "addConstraint:", v36);

      if (!(v17 % v84))
        break;
      v37 = v26 % v84;
      v38 = -[EKUIDividedGridViewController _newDividerView](v29, "_newDividerView");
      objc_msgSend(v86, "addSubview:", v38);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v38, 8, 0, v86, 8, 1.0, 0.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v39);

      v40 = (void *)MEMORY[0x1E0CB3718];
      v41 = firstValue;
      _NSDictionaryOfVariableBindings(CFSTR("previousButton, dividerView, buttonView"), firstValue, v38, v24, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[previousButton][dividerView(==dividerWidth)][buttonView]"), 1024, v91, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v43);

      if (v17 == v83 - 1 && v37)
      {
        v44 = -[EKUIDividedGridViewController _newDividerView](v90, "_newDividerView");
        objc_msgSend(v86, "addSubview:", v44);
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v44, 8, 0, v86, 8, 1.0, 0.0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v45);

        v46 = (void *)MEMORY[0x1E0CB3718];
        _NSDictionaryOfVariableBindings(CFSTR("buttonView, endOfWeekDivider"), v24, v44, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[buttonView][endOfWeekDivider(==dividerWidth)]|"), 1024, v91, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObjectsFromArray:", v48);

        goto LABEL_19;
      }
      v14 = v86;
      if (!v37)
      {
        v50 = (void *)MEMORY[0x1E0CB3718];
        _NSDictionaryOfVariableBindings(CFSTR("previousButton, dividerView, buttonView"), firstValue, v38, v24, 0);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[buttonView]|"), 1024, v91, v44);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObjectsFromArray:", v47);
LABEL_19:

        v14 = v86;
LABEL_20:

      }
      v2 = v90;

      objc_msgSend(v14, "buttonViews");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addObject:", v24);

      objc_msgSend(v14, "addConstraints:", v15);
      -[EKUIDividedGridViewController buttonTitles](v90, "buttonTitles");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "count");

      v16 = v24;
      ++v17;
      v54 = v26 >= v53;
      v13 = 0x1E0CB3000;
      if (v54)
      {

        goto LABEL_25;
      }
    }
    v49 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("buttonView"), v24, 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[buttonView]"), 1024, v91, v38);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v44);
    v41 = firstValue;
    goto LABEL_20;
  }
  v15 = 0;
  v14 = 0;
LABEL_25:
  v85 = v15;
  v87 = v14;
  v55 = (void *)objc_opt_new();
  objc_msgSend(v55, "setViewController:", v2);
  v56 = (void *)objc_opt_new();
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  firstValuea = v81;
  v57 = objc_msgSend(firstValuea, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
  if (v57)
  {
    v58 = v57;
    v59 = 0;
    v60 = *(_QWORD *)v93;
    do
    {
      v61 = 0;
      v62 = v59;
      do
      {
        if (*(_QWORD *)v93 != v60)
          objc_enumerationMutation(firstValuea);
        v63 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v61);
        objc_msgSend(v63, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(*(id *)(v13 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v63, 8, 0, 0, 0, 1.0, 43.5);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setHeightConstraint:", v64);

        objc_msgSend(v63, "heightConstraint");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "addConstraint:", v65);

        objc_msgSend(v55, "addSubview:", v63);
        v66 = *(void **)(v13 + 1816);
        _NSDictionaryOfVariableBindings(CFSTR("weekView"), v63, 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[weekView]"), 0, 0, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addObjectsFromArray:", v68);

        objc_msgSend(*(id *)(v13 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v55, 7, 1, v63, 7, 1.0, 0.0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addObject:", v69);

        if (v62)
        {
          v70 = -[EKUIDividedGridViewController _newDividerView](v90, "_newDividerView");
          objc_msgSend(v55, "addSubview:", v70);
          v71 = *(void **)(v13 + 1816);
          _NSDictionaryOfVariableBindings(CFSTR("dividerView"), v70, 0);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[dividerView]|"), 0, 0, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObjectsFromArray:", v73);

          v74 = (void *)MEMORY[0x1E0CB3718];
          _NSDictionaryOfVariableBindings(CFSTR("previousView, weekView, dividerView"), v62, v63, v70, 0);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[previousView][dividerView(==dividerWidth)][weekView]"), 0, v91, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObjectsFromArray:", v76);

          v13 = 0x1E0CB3000;
        }
        v59 = v63;

        ++v61;
        v62 = v59;
      }
      while (v58 != v61);
      v58 = objc_msgSend(firstValuea, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
    }
    while (v58);
  }
  else
  {
    v59 = 0;
  }

  v77 = *(void **)(v13 + 1816);
  objc_msgSend(firstValuea, "objectAtIndexedSubscript:", 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v55, 3, 0, v78, 3, 1.0, 0.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addObject:", v79);

  objc_msgSend(*(id *)(v13 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v55, 4, 0, v59, 4, 1.0, 0.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addObject:", v80);

  objc_msgSend(v55, "addConstraints:", v56);
  -[EKUIDividedGridViewController setView:](v90, "setView:", v55);
  -[EKUIDividedGridViewController setAllCells:](v90, "setAllCells:", v82);
  -[EKUIDividedGridViewController setWeekViews:](v90, "setWeekViews:", firstValuea);

}

- (id)_newDividerView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  +[EKUIDividedGridViewController dividerColor](EKUIDividedGridViewController, "dividerColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (void)cellTapped:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[EKUIDividedGridViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[EKUIDividedGridViewController allCells](self, "allCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dividedGridViewController:didSelectCell:atIndex:", self, v4, objc_msgSend(v5, "indexOfObject:", v4));

}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  int64_t type;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  -[EKUIDividedGridViewController preferredWidth](self, "preferredWidth");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = 1.0 / v6;

  type = self->_type;
  if (type == 1)
  {
    v9 = v4 + v7 * -6.0;
    v10 = 7.0;
  }
  else if (type)
  {
    v10 = 0.0;
    v9 = v4;
  }
  else
  {
    v9 = v4 + v7 * -3.0;
    v10 = 4.0;
  }
  -[EKUIDividedGridViewController preferredInset](self, "preferredInset");
  v12 = (v4 - v11) / v10;
  v13 = CalFloorToScreenScale(v12);
  v14 = CalCeilToScreenScale(v12);
  v15 = (void *)objc_opt_new();
  if (v10 > 0.0)
  {
    v16 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v17);

      v18 = (double)v16++;
    }
    while (v10 > v18);
  }
  objc_msgSend(v15, "valueForKeyPath:", CFSTR("@sum.self"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  if (v21 < v9)
  {
    v22 = 0;
    v23 = 0;
    v24 = (uint64_t)(v10 + -1.0);
    do
    {
      if (v10 <= (double)v23 || v24 < 1 || v23 >= v24)
        break;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v22 & 1) != 0)
      {
        objc_msgSend(v15, "setObject:atIndexedSubscript:", v27, v23);

        ++v23;
      }
      else
      {
        objc_msgSend(v15, "setObject:atIndexedSubscript:", v27, v24);

        --v24;
      }
      v22 ^= 1u;
      objc_msgSend(v15, "valueForKeyPath:", CFSTR("@sum.self"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v30 = v29;

    }
    while (v30 < v9);
  }
  -[EKUIDividedGridViewController _rowHeightForWidth:](self, "_rowHeightForWidth:", v14);
  v32 = v31;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[EKUIDividedGridViewController weekViews](self, "weekViews", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v38, "buttonViews");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");

        if (v40)
        {
          v41 = 0;
          do
          {
            objc_msgSend(v38, "buttonViews");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectAtIndexedSubscript:", v41);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "objectAtIndexedSubscript:", v41);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "doubleValue");
            v46 = v45;
            objc_msgSend(v43, "widthConstraint");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setConstant:", v46);

            ++v41;
            objc_msgSend(v38, "buttonViews");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "count");

          }
          while (v49 > v41);
        }
        objc_msgSend(v38, "heightConstraint");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setConstant:", v32);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v35);
  }

}

- (void)viewDidLayoutSubviews
{
  id v3;

  -[EKUIDividedGridViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dividedGridViewControllerDidLayout:", self);

}

- (double)_neededHeight
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[EKUIDividedGridViewController weekViews](self, "weekViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (double)v4;
    -[EKUIDividedGridViewController weekViews](self, "weekViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heightConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constant");
    v10 = v9;
    v11 = (double)(v4 + 1);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v14 = 1.0 / v13 * v11 + v5 * v10;

  }
  else
  {
    -[EKUIDividedGridViewController preferredWidth](self, "preferredWidth");
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v14 = v16 + 1.0 / v17 * 2.0;
  }

  return v14;
}

- (double)_rowHeightForWidth:(double)a3
{
  double result;

  CalRoundToScreenScale(43.5);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[EKUIDividedGridViewController preferredWidth](self, "preferredWidth");
  v4 = v3;
  -[EKUIDividedGridViewController _neededHeight](self, "_neededHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)setPreferredWidth:(double)a3
{
  void *v4;
  id v5;

  if (self->_preferredWidth != a3)
  {
    self->_preferredWidth = a3;
    -[EKUIDividedGridViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    -[EKUIDividedGridViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateIntrinsicContentSize");

  }
}

- (NSArray)buttonTitles
{
  return self->_buttonTitles;
}

- (void)setButtonTitles:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTitles, a3);
}

- (NSArray)allCells
{
  return (NSArray *)objc_getProperty(self, a2, 992, 1);
}

- (void)setAllCells:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (EKUIDividedGridViewControllerDelegate)delegate
{
  return (EKUIDividedGridViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)weekViews
{
  return (NSArray *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setWeekViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (double)preferredInset
{
  return self->_preferredInset;
}

- (void)setPreferredInset:(double)a3
{
  self->_preferredInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allCells, 0);
  objc_storeStrong((id *)&self->_buttonTitles, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
}

@end

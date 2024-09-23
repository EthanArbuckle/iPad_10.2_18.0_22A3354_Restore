@implementation EKUIEventStatusButtonsView

- (EKUIEventStatusButtonsView)initWithFrame:(CGRect)a3 actions:(id)a4 delegate:(id)a5
{
  return -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](self, "initWithFrame:actions:delegate:options:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (EKUIEventStatusButtonsView)initWithFrame:(CGRect)a3 actions:(id)a4 delegate:(id)a5 options:(unint64_t)a6
{
  char v6;
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  EKUIEventStatusButtonsView *v16;
  EKUIEventStatusButtonsView *v17;
  double v18;
  objc_super v20;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)EKUIEventStatusButtonsView;
  v16 = -[EKUIEventStatusButtonsView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v15);
    v17->_textSizeMode = 0;
    objc_storeStrong((id *)&v17->_actions, a4);
    v17->_outsideMargin = 0.0;
    v17->_forcesSingleButtonToCenter = v6 & 1;
    v17->_inboxStyle = (v6 & 2) != 0;
    v17->_allowAppliesToAll = (v6 & 4) != 0;
    LODWORD(v18) = 1144750080;
    -[EKUIEventStatusButtonsView setContentCompressionResistancePriority:forAxis:](v17, "setContentCompressionResistancePriority:forAxis:", 0, v18);
    -[EKUIEventStatusButtonsView _setupButtons](v17, "_setupButtons");
  }

  return v17;
}

- (id)_newToolbarButton
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;

  +[CalWideStatusButton buttonWithType:](CalWideStatusButton, "buttonWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
  objc_msgSend(v3, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventStatusButtonsView _buttonFontSizeFromDelegate](self, "_buttonFontSizeFromDelegate");
  -[EKUIEventStatusButtonsView _fontWithSize:selected:](self, "_fontWithSize:selected:", objc_msgSend(v3, "isSelected"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v6);

  objc_msgSend(v3, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineBreakMode:", 4);

  return v3;
}

- (void)findPointerInteractionWithButton:(id)a3 actions:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  objc_msgSend(a3, "interactions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__EKUIEventStatusButtonsView_findPointerInteractionWithButton_actions___block_invoke;
  v9[3] = &unk_1E6018D58;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

void __71__EKUIEventStatusButtonsView_findPointerInteractionWithButton_actions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v11;
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);

    if (v9 == v10)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      *a4 = 1;
    }

    v7 = v11;
  }

}

- (void)_setupButtons
{
  NSUInteger v3;
  NSArray *buttons;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  NSUInteger v31;
  void *v32;
  _BOOL4 v33;
  id v34;
  void *v35;
  void *v36;
  id *v37;
  NSUInteger v38;
  unint64_t v39;
  id obj;
  _QWORD v41[5];
  _QWORD v42[5];
  id location;
  id *p_location;
  uint64_t v45;
  char v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id from;
  _QWORD v54[4];

  v54[2] = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->_actions, "count");
  buttons = self->_buttons;
  if (buttons)
  {
    v5 = (void *)-[NSArray mutableCopy](buttons, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  obj = v5;
  v38 = v3;
  v39 = objc_msgSend(v5, "count", &self->_buttons);
  if (v3)
  {
    v6 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_actions, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

      if (v6 >= v39)
      {
        v9 = -[EKUIEventStatusButtonsView _newToolbarButton](self, "_newToolbarButton");
        objc_msgSend(obj, "addObject:", v9);
        -[EKUIEventStatusButtonsView addSubview:](self, "addSubview:", v9);
      }
      else
      {
        objc_msgSend(obj, "objectAtIndexedSubscript:", v6);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "setSelected:", 0);
      objc_msgSend((id)objc_opt_class(), "buttonTitleForAction:orb:", v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:forState:", v10, 0);
      objc_msgSend(v9, "setTag:", v8);
      objc_msgSend((id)objc_opt_class(), "_appliesToAllTitleForAction:", v8);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (self->_allowAppliesToAll && v11)
      {
        objc_initWeak(&location, self);
        objc_initWeak(&from, v9);
        v13 = (void *)MEMORY[0x1E0DC39D0];
        v14 = (void *)MEMORY[0x1E0DC3428];
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __43__EKUIEventStatusButtonsView__setupButtons__block_invoke;
        v50[3] = &unk_1E6018D80;
        objc_copyWeak(&v51, &location);
        objc_copyWeak(&v52, &from);
        objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v50);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v15;
        v16 = (void *)MEMORY[0x1E0DC3428];
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_2;
        v47[3] = &unk_1E6018D80;
        objc_copyWeak(&v48, &location);
        objc_copyWeak(&v49, &from);
        objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v12, 0, 0, v47);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "menuWithChildren:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setMenu:", v19);

        objc_destroyWeak(&v49);
        objc_destroyWeak(&v48);
        objc_destroyWeak(&v52);
        objc_destroyWeak(&v51);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitleColor:forState:", v20, 4);

      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v21) = 1148829696;
      objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v21);
      LODWORD(v22) = 1148846080;
      objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 1, v22);
      if (-[EKUIEventStatusButtonsView shouldUseVerticalLayout](self, "shouldUseVerticalLayout"))
        v23 = 4;
      else
        v23 = 0;
      objc_msgSend(v9, "setContentHorizontalAlignment:", v23);
      LODWORD(v24) = 1144750080;
      objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v24);
      objc_msgSend(v9, "titleLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v26) = 1148846080;
      objc_msgSend(v25, "setContentHuggingPriority:forAxis:", 1, v26);

      LODWORD(v27) = 1148846080;
      objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 0, v27);
      objc_msgSend(v9, "titleLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = 1148846080;
      objc_msgSend(v28, "setContentHuggingPriority:forAxis:", 0, v29);

      ++v6;
    }
    while (v38 != v6);
  }
  v30 = (void *)objc_msgSend(obj, "copy");
  if (v38 < v39)
  {
    v31 = v38;
    do
    {
      objc_msgSend(v30, "objectAtIndexedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeFromSuperview");
      objc_msgSend(obj, "removeObject:", v32);

      ++v31;
    }
    while (v39 != v31);
  }
  objc_storeStrong(v37, obj);
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_buttonsTouchInsets.top, *MEMORY[0x1E0DC49E8]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_buttonsTouchInsets.bottom, *(float64x2_t *)(MEMORY[0x1E0DC49E8] + 16)))), 0xFuLL))) & 1) != 0)-[EKUIEventStatusButtonsView setButtonsTouchInsets:](self, "setButtonsTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  if (v38 != v39)
    -[EKUIEventStatusButtonsView _setupConstraints](self, "_setupConstraints");
  v33 = -[EKUIEventStatusButtonsView _shouldCenterButton](self, "_shouldCenterButton");
  v34 = *v37;
  if (v33)
  {
    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    p_location = &location;
    v45 = 0x2020000000;
    v46 = 0;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_3;
    v42[3] = &unk_1E6018DA8;
    v42[4] = &location;
    -[EKUIEventStatusButtonsView findPointerInteractionWithButton:actions:](self, "findPointerInteractionWithButton:actions:", v35, v42);
    if (!*((_BYTE *)p_location + 24))
    {
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
      objc_msgSend(v35, "addInteraction:", v36);

    }
    _Block_object_dispose(&location, 8);

  }
  else
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_4;
    v41[3] = &unk_1E6018DF8;
    v41[4] = self;
    objc_msgSend(v34, "enumerateObjectsUsingBlock:", v41);
  }
  -[EKUIEventStatusButtonsView setNeedsLayout](self, "setNeedsLayout");

}

void __43__EKUIEventStatusButtonsView__setupButtons__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_buttonTapped:", v2);

}

void __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_appliesToAllButtonTapped:", v2);

}

uint64_t __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_5;
  v6[3] = &unk_1E6018DD0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "findPointerInteractionWithButton:actions:", v5, v6);

}

uint64_t __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeInteraction:", a2);
}

- (void)_setupConstraints
{
  EKUIEventStatusButtonsView *v2;
  unint64_t v3;
  NSArray *currentConstraints;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;
  NSArray *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *leadingMarginConstraint;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *trailingMarginConstraint;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSArray *v35;
  _BOOL4 v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSLayoutConstraint *v65;
  uint64_t v66;
  NSLayoutConstraint *v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id firstValue;
  void *v92;
  NSArray *obj;
  EKUIEventStatusButtonsView *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  const char *v100;
  __int16 v101;
  NSArray *v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  uint64_t v106;

  v2 = self;
  v106 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000uLL;
  if (-[NSArray count](self->_currentConstraints, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v2->_currentConstraints);
    currentConstraints = v2->_currentConstraints;
    v2->_currentConstraints = 0;

  }
  v5 = -[NSArray count](v2->_buttons, "count");
  if (v2->_buttons)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = v5;
    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[EKUIEventStatusButtonsView _shouldCenterButton](v2, "_shouldCenterButton"))
    {
      -[NSArray firstObject](v2->_buttons, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3718];
      _NSDictionaryOfVariableBindings(CFSTR("button"), v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[button]"), 0, 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
      leadingMarginConstraint = v2->_leadingMarginConstraint;
      v2->_leadingMarginConstraint = (NSLayoutConstraint *)v13;

      -[NSArray addObject:](v8, "addObject:", v2->_leadingMarginConstraint);
      v15 = (void *)MEMORY[0x1E0CB3718];
      _NSDictionaryOfVariableBindings(CFSTR("button"), v9, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[button]|"), 0, 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = objc_claimAutoreleasedReturnValue();
      trailingMarginConstraint = v2->_trailingMarginConstraint;
      v2->_trailingMarginConstraint = (NSLayoutConstraint *)v18;

      -[NSArray addObject:](v8, "addObject:", v2->_trailingMarginConstraint);
      v20 = (void *)MEMORY[0x1E0CB3718];
      _NSDictionaryOfVariableBindings(CFSTR("button"), v9, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[button]|"), 0, 0, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v22);

    }
    else
    {
      if (v7 != 1)
      {
        v36 = -[EKUIEventStatusButtonsView shouldUseVerticalLayout](v2, "shouldUseVerticalLayout");
        -[NSArray firstObject](v2->_buttons, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray lastObject](v2->_buttons, "lastObject");
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)MEMORY[0x1E0CB3718];
        v94 = v2;
        v92 = (void *)v38;
        if (v36)
        {
          v40 = (void *)v38;
          firstValue = v37;
          _NSDictionaryOfVariableBindings(CFSTR("topButton"), v37, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[topButton]"), 0, 0, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v42);

          v43 = (void *)MEMORY[0x1E0CB3718];
          _NSDictionaryOfVariableBindings(CFSTR("bottomButton"), v40, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[bottomButton]|"), 0, 0, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v45);

          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          obj = v2->_buttons;
          v46 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
          if (v46)
          {
            v47 = v46;
            v48 = 0;
            v49 = *(_QWORD *)v96;
            do
            {
              v50 = 0;
              v51 = v48;
              do
              {
                if (*(_QWORD *)v96 != v49)
                  objc_enumerationMutation(obj);
                v52 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v50);
                objc_msgSend(*(id *)(v3 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v52, 5, 0, v2, 5, 1.0, 0.0);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSArray addObject:](v8, "addObject:", v53);

                objc_msgSend(*(id *)(v3 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2, 6, 1, v52, 6, 1.0, 0.0);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSArray addObject:](v8, "addObject:", v54);

                if (v51)
                {
                  objc_msgSend(v52, "firstBaselineAnchor");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "lastBaselineAnchor");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v56, 1.0);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                  LODWORD(v58) = 1144750080;
                  objc_msgSend(v57, "setPriority:", v58);
                  -[NSArray addObject:](v8, "addObject:", v57);
                  objc_msgSend(v52, "firstBaselineAnchor");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "lastBaselineAnchor");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "constraintGreaterThanOrEqualToAnchor:constant:", v60, 40.0);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSArray addObject:](v8, "addObject:", v61);

                  v2 = v94;
                  v3 = 0x1E0CB3000;

                }
                v48 = v52;

                ++v50;
                v51 = v48;
              }
              while (v47 != v50);
              v47 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
            }
            while (v47);
          }
          else
          {
            v48 = 0;
          }

        }
        else
        {
          _NSDictionaryOfVariableBindings(CFSTR("leadingButton"), v37, 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[leadingButton]|"), 0, 0, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v63);

          if (v7 < 3)
          {
            v78 = (void *)MEMORY[0x1E0CB3718];
            v79 = v92;
            if (v2->_inboxStyle)
            {
              objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v92, 9, 0, v2, 9, 1.0, 0.0);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v80) = 1144750080;
              objc_msgSend(v69, "setPriority:", v80);
              -[NSArray addObject:](v8, "addObject:", v69);
              v81 = (void *)MEMORY[0x1E0CB3718];
              _NSDictionaryOfVariableBindings(CFSTR("leadingButton, trailingButton"), v37, v92, 0);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[leadingButton]-(>=minInboxStylePadding)-[trailingButton]"), 24, &unk_1E606FB10, v70);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v82);

            }
            else
            {
              _NSDictionaryOfVariableBindings(CFSTR("leadingButton, trailingButton"), v37, v92, 0);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(==minPadding)-[leadingButton]-(>=minPadding)-[trailingButton]-(==minPadding)-|"), 24, &unk_1E606FB10, v69);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v70);
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v37, 5, 0, v2, 5, 1.0, 0.0);
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = v2->_leadingMarginConstraint;
            v2->_leadingMarginConstraint = (NSLayoutConstraint *)v64;

            -[NSArray addObject:](v8, "addObject:", v2->_leadingMarginConstraint);
            objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v92, 6, 0, v2, 6, 1.0, 0.0);
            v66 = objc_claimAutoreleasedReturnValue();
            v67 = v2->_trailingMarginConstraint;
            v2->_trailingMarginConstraint = (NSLayoutConstraint *)v66;

            -[NSArray addObject:](v8, "addObject:", v2->_trailingMarginConstraint);
            v68 = v7 - 2;
            -[NSArray objectAtIndexedSubscript:](v2->_buttons, "objectAtIndexedSubscript:", 1);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray objectAtIndexedSubscript:](v2->_buttons, "objectAtIndexedSubscript:", v68);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = (void *)MEMORY[0x1E0CB3718];
            _NSDictionaryOfVariableBindings(CFSTR("firstMiddleButton"), v69, 0);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[firstMiddleButton]|"), 0, &unk_1E606FB10, v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v73);

            if (v2->_inboxStyle)
            {
              objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v69, 9, 0, v2, 9, 1.0, 0.0);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObject:](v8, "addObject:", v74);

              v75 = (void *)MEMORY[0x1E0CB3718];
              _NSDictionaryOfVariableBindings(CFSTR("leadingButton, trailingButton,firstMiddleButton"), v37, v92, v69, 0);
              v76 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[leadingButton]-(>=minInboxStylePadding)-[firstMiddleButton]-(>=minInboxStylePadding)-[trailingButton]|"), 2048, &unk_1E606FB10, v76);
              v77 = (id)objc_claimAutoreleasedReturnValue();
              -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v77);
            }
            else
            {
              v76 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
              -[EKUIEventStatusButtonsView addLayoutGuide:](v2, "addLayoutGuide:", v76);
              objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v76, 9, 0, v2, 9, 1.0, 0.0);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObject:](v8, "addObject:", v83);

              v84 = (void *)MEMORY[0x1E0CB3718];
              _NSDictionaryOfVariableBindings(CFSTR("leadingButton, trailingButton, centerGuide"), v37, v92, v76, 0);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[leadingButton]-(>=minPadding)-[centerGuide]-(>=minPadding)-[trailingButton]"), 24, &unk_1E606FB10, v85);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v86);

              v77 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              -[EKUIEventStatusButtonsView _horizontalConstraintStringForMiddleButtonsStartingAt:endingAt:resultingViews:](v2, "_horizontalConstraintStringForMiddleButtonsStartingAt:endingAt:resultingViews:", 1, v68, v77);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v87, 24, &unk_1E606FB10, v77);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v88);

              objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v69, 5, 0, v76, 5, 1.0, 0.0);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObject:](v8, "addObject:", v89);

              objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v70, 6, 0, v76, 6, 1.0, 0.0);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObject:](v8, "addObject:", v90);

            }
            v79 = v92;
          }

        }
        goto LABEL_12;
      }
      -[NSArray firstObject](v2->_buttons, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 5, 0, v2, 5, 1.0, 0.0);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v2->_leadingMarginConstraint;
      v2->_leadingMarginConstraint = (NSLayoutConstraint *)v23;

      -[NSArray addObject:](v8, "addObject:", v2->_leadingMarginConstraint);
      v25 = v2->_trailingMarginConstraint;
      v2->_trailingMarginConstraint = 0;

      -[EKUIEventStatusButtonsView trailingAnchor](v2, "trailingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "trailingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v27, 1.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v8, "addObject:", v28);

      v29 = (void *)MEMORY[0x1E0CB3718];
      _NSDictionaryOfVariableBindings(CFSTR("theOnlyButton"), v9, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[theOnlyButton]|"), 0, 0, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v31);

    }
LABEL_12:
    v32 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v33 = v32;
      -[EKUIEventStatusButtonsView delegate](v2, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v100 = "-[EKUIEventStatusButtonsView _setupConstraints]";
      v101 = 2112;
      v102 = v8;
      v103 = 2112;
      v104 = v34;
      _os_log_impl(&dword_1AF84D000, v33, OS_LOG_TYPE_DEBUG, "%s: Activating constraints [%@] for status button view with delegate [%@]", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v8);
    v35 = v2->_currentConstraints;
    v2->_currentConstraints = v8;

  }
}

- (id)_horizontalConstraintStringForMiddleButtonsStartingAt:(unint64_t)a3 endingAt:(unint64_t)a4 resultingViews:(id)a5
{
  id v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint8_t buf[2];
  __int16 v17;

  v8 = a5;
  if (a3 > a4)
  {
    v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v17 = 0;
      v10 = "endIndex was greater than startIndex when trying to generate the constraint string for the event status buttons";
      v11 = (uint8_t *)&v17;
LABEL_12:
      _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (-[NSArray count](self->_buttons, "count") <= a4)
  {
    v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "endIndex was greater than the number of buttons when trying to generate the constraint string for the event status buttons";
      v11 = buf;
      goto LABEL_12;
    }
LABEL_13:
    v12 = &stru_1E601DFA8;
    goto LABEL_14;
  }
  v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("H:"));
  do
  {
    -[NSArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("button%lu"), a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v13, v14);
    -[__CFString appendFormat:](v12, "appendFormat:", CFSTR("[%@]"), v14);
    if (a4 != a3)
      -[__CFString appendString:](v12, "appendString:", CFSTR("-(>=minPadding)-"));

    ++a3;
  }
  while (a3 <= a4);
LABEL_14:

  return v12;
}

- (void)_buttonTapped:(id)a3
{
  -[EKUIEventStatusButtonsView _buttonTappedInternal:appliesToAll:](self, "_buttonTappedInternal:appliesToAll:", a3, 0);
}

- (void)_appliesToAllButtonTapped:(id)a3
{
  -[EKUIEventStatusButtonsView _buttonTappedInternal:appliesToAll:](self, "_buttonTappedInternal:appliesToAll:", a3, 1);
}

- (void)_buttonTappedInternal:(id)a3 appliesToAll:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "isSelected") & 1) == 0
    && -[NSArray indexOfObject:](self->_buttons, "indexOfObject:", v7) != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EKUIEventStatusButtonsView setSelectedAction:](self, "setSelectedAction:", -[EKUIEventStatusButtonsView _actionForButton:](self, "_actionForButton:", v7));
    v8 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = v8;
      objc_msgSend(v9, "numberWithInteger:", -[EKUIEventStatusButtonsView selectedAction](self, "selectedAction"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_DEFAULT, "Selected action: [%{public}@], appliesToAll: %{public}@.", buf, 0x16u);

    }
    -[EKUIEventStatusButtonsView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[EKUIEventStatusButtonsView selectedAction](self, "selectedAction");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__EKUIEventStatusButtonsView__buttonTappedInternal_appliesToAll___block_invoke;
    v15[3] = &unk_1E6018688;
    v15[4] = self;
    objc_msgSend(v13, "eventStatusButtonsView:didSelectAction:appliesToAll:ifCancelled:", self, v14, v4, v15);

  }
}

uint64_t __65__EKUIEventStatusButtonsView__buttonTappedInternal_appliesToAll___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedAction:", 0);
}

- (void)_updateSelectionToButton:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[EKUIEventStatusButtonsView disableButtonHighlights](self, "disableButtonHighlights"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_buttons;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v9);
          if (v10 == v4)
          {
            v10 = v4;
            v11 = 1;
          }
          else
          {
            v11 = 0;
          }
          objc_msgSend(v10, "setSelected:", v11, (_QWORD)v12);
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (int64_t)_actionForButton:(id)a3
{
  return objc_msgSend(a3, "tag");
}

- (int64_t)_buttonIndexForAction:(int64_t)a3
{
  int64_t v5;
  void *v6;
  uint64_t v7;

  if (!-[NSArray count](self->_buttons, "count"))
    return -1;
  v5 = 0;
  while (1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "tag");

    if (v7 == a3)
      break;
    if (++v5 >= -[NSArray count](self->_buttons, "count"))
      return -1;
  }
  return v5;
}

- (id)buttonForAction:(int64_t)a3
{
  int64_t v4;
  void *v5;

  v4 = -[EKUIEventStatusButtonsView _buttonIndexForAction:](self, "_buttonIndexForAction:", a3);
  if (v4 < 0)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)buttonTitleForAction:(int64_t)a3 orb:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v5 = 0;
  v17 = *MEMORY[0x1E0C80C00];
  if (a3 <= 511)
  {
    if (a3 <= 31)
    {
      switch(a3)
      {
        case 0:
        case 7:
          return v5;
        case 1:
          goto LABEL_31;
        case 2:
          EventKitUIBundle();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          v8 = CFSTR("Maybe");
          goto LABEL_44;
        case 4:
          EventKitUIBundle();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          v8 = CFSTR("Decline");
          v9 = CFSTR("Decline");
          goto LABEL_45;
        case 8:
          EventKitUIBundle();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          v8 = CFSTR("Add To Calendar");
          goto LABEL_44;
        case 16:
          EventKitUIBundle();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          v8 = CFSTR("Delete Event");
          goto LABEL_44;
        default:
          goto LABEL_48;
      }
    }
    if (a3 > 127)
    {
      if (a3 == 128)
      {
        EventKitUIBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("Ignore");
      }
      else
      {
        if (a3 != 256)
          goto LABEL_48;
        EventKitUIBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("View Comment");
      }
    }
    else if (a3 == 32)
    {
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("OK");
    }
    else
    {
      if (a3 != 64)
        goto LABEL_48;
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Join Calendar");
    }
    goto LABEL_44;
  }
  if (a3 >= 0x4000)
  {
    if (a3 >= 0x20000)
    {
      switch(a3)
      {
        case 0x20000:
          EventKitUIBundle();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          v8 = CFSTR("DeclineSharedCalendar");
          v9 = CFSTR("Decline");
          goto LABEL_45;
        case 0x40000:
          EventKitUIBundle();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          v8 = CFSTR("Unsubscribe from This Calendar");
          break;
        case 0x80000:
          EventKitUIBundle();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          v8 = CFSTR("Delete Reminder");
          break;
        default:
          goto LABEL_48;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x4000:
          EventKitUIBundle();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          v8 = CFSTR("Reply");
          break;
        case 0x8000:
          EventKitUIBundle();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          v8 = CFSTR("Cancel Proposed Time");
          break;
        case 0x10000:
          EventKitUIBundle();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          v8 = CFSTR("Report Junk");
          break;
        default:
          goto LABEL_48;
      }
    }
LABEL_44:
    v9 = &stru_1E601DFA8;
    goto LABEL_45;
  }
  if (a3 <= 2047)
  {
    switch(a3)
    {
      case 512:
        EventKitUIBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("View Comments");
        break;
      case 1024:
        EventKitUIBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("View Event");
        break;
      case 1792:
        return v5;
      default:
        goto LABEL_48;
    }
    goto LABEL_44;
  }
  switch(a3)
  {
    case 0x800:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Update Event");
      goto LABEL_44;
    case 0x1000:
LABEL_31:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Accept");
      goto LABEL_44;
    case 0x2000:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Ignore Proposed Time");
      v9 = CFSTR("Ignore");
LABEL_45:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, v9, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
  }
LABEL_48:
  v11 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = v11;
    objc_msgSend(v12, "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v14;
    _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_ERROR, "invalid action passed to buttonTitleForAction: %@", (uint8_t *)&v15, 0xCu);

  }
  return 0;
}

+ (id)_appliesToAllTitleForAction:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v4 = 0;
  v16 = *MEMORY[0x1E0C80C00];
  if (a3 <= 511)
  {
    if (a3 <= 31)
    {
      switch(a3)
      {
        case 0:
        case 7:
        case 8:
          return v4;
        case 1:
          EventKitUIBundle();
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v5;
          v7 = CFSTR("Accept All");
          goto LABEL_38;
        case 2:
          EventKitUIBundle();
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v5;
          v7 = CFSTR("Maybe All");
          goto LABEL_38;
        case 4:
          EventKitUIBundle();
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v5;
          v7 = CFSTR("Decline All");
          goto LABEL_38;
        case 16:
          EventKitUIBundle();
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v5;
          v7 = CFSTR("Delete All - inbox button");
          v13 = CFSTR("Delete All");
          goto LABEL_39;
        default:
          goto LABEL_30;
      }
    }
    if (a3 > 127)
    {
      if (a3 != 128)
      {
        if (a3 != 256)
          goto LABEL_30;
        return v4;
      }
      EventKitUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Ignore All");
    }
    else
    {
      if (a3 != 32)
      {
        if (a3 != 64)
          goto LABEL_30;
        return v4;
      }
      EventKitUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("OK All");
    }
LABEL_38:
    v13 = &stru_1E601DFA8;
LABEL_39:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v13, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  if (a3 >= 0x4000)
  {
    if (a3 >= 0x20000)
    {
      if (a3 == 0x20000 || a3 == 0x40000 || a3 == 0x80000)
        return v4;
    }
    else if (a3 == 0x4000 || a3 == 0x8000 || a3 == 0x10000)
    {
      return v4;
    }
  }
  else
  {
    if (a3 <= 2047)
    {
      if (a3 != 512 && a3 != 1024 && a3 != 1792)
        goto LABEL_30;
      return v4;
    }
    if (a3 == 2048 || a3 == 4096 || a3 == 0x2000)
      return v4;
  }
LABEL_30:
  v8 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = v8;
    objc_msgSend(v9, "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_ERROR, "invalid action passed to buttonTitleForAction: %@", (uint8_t *)&v14, 0xCu);

  }
  return 0;
}

+ (id)imageForAction:(int64_t)a3 selected:(BOOL)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v5 = 0;
  v15 = *MEMORY[0x1E0C80C00];
  if (a3 <= 511)
  {
    if (a3 <= 31)
    {
      switch(a3)
      {
        case 0:
        case 7:
          return v5;
        case 1:
          v6 = (void *)MEMORY[0x1E0DC3870];
          if (a4)
            v7 = CFSTR("checkmark.circle.fill");
          else
            v7 = CFSTR("checkmark.circle");
          goto LABEL_45;
        case 2:
          v6 = (void *)MEMORY[0x1E0DC3870];
          if (a4)
            v7 = CFSTR("questionmark.circle.fill");
          else
            v7 = CFSTR("questionmark.circle");
          goto LABEL_45;
        case 4:
          goto LABEL_36;
        case 8:
          v6 = (void *)MEMORY[0x1E0DC3870];
          v7 = CFSTR("plus");
          goto LABEL_45;
        case 16:
          goto LABEL_28;
        default:
          goto LABEL_32;
      }
    }
    if (a3 > 127)
    {
      if (a3 != 128)
      {
        if (a3 != 256)
          goto LABEL_32;
        return v5;
      }
      goto LABEL_35;
    }
    if (a3 == 32 || a3 == 64)
      goto LABEL_29;
  }
  else
  {
    if (a3 < 0x4000)
    {
      if (a3 <= 2047)
      {
        if (a3 != 512 && a3 != 1024 && a3 != 1792)
          goto LABEL_32;
        return v5;
      }
      if (a3 == 2048)
      {
        v6 = (void *)MEMORY[0x1E0DC3870];
        v7 = CFSTR("square.and.arrow.down");
        goto LABEL_45;
      }
      if (a3 != 4096)
      {
        if (a3 != 0x2000)
          goto LABEL_32;
LABEL_35:
        v6 = (void *)MEMORY[0x1E0DC3870];
        v7 = CFSTR("xmark");
        goto LABEL_45;
      }
LABEL_29:
      v6 = (void *)MEMORY[0x1E0DC3870];
      v7 = CFSTR("checkmark");
      goto LABEL_45;
    }
    if (a3 < 0x20000)
    {
      if (a3 == 0x4000)
        return v5;
      if (a3 != 0x8000)
      {
        if (a3 != 0x10000)
          goto LABEL_32;
        v6 = (void *)MEMORY[0x1E0DC3870];
        v7 = CFSTR("bin.xmark");
        goto LABEL_45;
      }
      goto LABEL_35;
    }
    if (a3 == 0x20000)
    {
LABEL_36:
      v6 = (void *)MEMORY[0x1E0DC3870];
      if (a4)
        v7 = CFSTR("xmark.circle.fill");
      else
        v7 = CFSTR("xmark.circle");
      goto LABEL_45;
    }
    if (a3 == 0x40000 || a3 == 0x80000)
    {
LABEL_28:
      v6 = (void *)MEMORY[0x1E0DC3870];
      v7 = CFSTR("trash");
LABEL_45:
      objc_msgSend(v6, "systemImageNamed:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
  }
LABEL_32:
  v8 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = v8;
    objc_msgSend(v9, "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_ERROR, "invalid action passed to imageForAction: %@", (uint8_t *)&v13, 0xCu);

  }
  return 0;
}

+ (BOOL)isActionDestructive:(int64_t)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LOBYTE(v4) = 1;
  if (a3 <= 1023)
  {
    if (a3 <= 127)
    {
      if ((unint64_t)(a3 - 4) <= 0x3C)
      {
        if (((1 << (a3 - 4)) & 0x1000000010000019) != 0)
          goto LABEL_30;
        if (a3 == 16)
          return v4;
      }
      if ((unint64_t)a3 < 3)
        goto LABEL_30;
    }
    else
    {
      if (a3 == 128)
        return v4;
      if (a3 == 256 || a3 == 512)
        goto LABEL_30;
    }
    goto LABEL_6;
  }
  if (a3 < 0x4000)
  {
    if (a3 <= 2047)
    {
      if (a3 == 1024 || a3 == 1792)
        goto LABEL_30;
    }
    else if (a3 == 2048 || a3 == 4096 || a3 == 0x2000)
    {
      goto LABEL_30;
    }
    goto LABEL_6;
  }
  if (a3 >= 0x20000)
  {
    if (a3 == 0x80000 || a3 == 0x40000)
      return v4;
    if (a3 == 0x20000)
      goto LABEL_30;
    goto LABEL_6;
  }
  if (a3 == 0x4000)
    goto LABEL_30;
  if (a3 != 0x8000 && a3 != 0x10000)
  {
LABEL_6:
    v5 = (void *)kEKUILogHandle;
    v4 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = v5;
      objc_msgSend(v6, "numberWithInteger:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, "invalid action passed to isActionDestructive: %@", (uint8_t *)&v10, 0xCu);

LABEL_30:
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  NSArray *buttons;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  CGPoint v23;
  CGRect v24;

  buttons = self->_buttons;
  v6 = a4;
  -[NSArray firstObject](buttons, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v6, "location");
  v18 = v17;
  v20 = v19;

  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  v23.x = v18;
  v23.y = v20;
  if (CGRectContainsPoint(v24, v23))
  {
    objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", 0, v10, v12, v14, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  double x;
  double y;
  double width;
  double height;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGRect v15;
  CGRect v16;

  -[NSArray firstObject](self->_buttons, "firstObject", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v16 = CGRectInset(v15, -6.0, -6.0);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v5);
  objc_msgSend(MEMORY[0x1E0DC3B00], "effectWithPreview:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:", x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setTextSizeMode:(int64_t)a3
{
  if (self->_textSizeMode != a3)
  {
    self->_textSizeMode = a3;
    -[EKUIEventStatusButtonsView _defaultFontSizeForButtons](self, "_defaultFontSizeForButtons");
    -[EKUIEventStatusButtonsView _updateButtonFontsWithSize:](self, "_updateButtonFontsWithSize:");
    -[EKUIEventStatusButtonsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIButton)leadingButton
{
  void *v3;

  v3 = -[NSArray count](self->_buttons, "count");
  if (v3)
  {
    -[NSArray objectAtIndex:](self->_buttons, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIButton *)v3;
}

- (UIButton)centerButton
{
  void *v3;

  if (-[NSArray count](self->_buttons, "count") < 2)
  {
    v3 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_buttons, "objectAtIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIButton *)v3;
}

- (UIButton)trailingButton
{
  void *v3;

  v3 = -[NSArray count](self->_buttons, "count");
  if (v3)
  {
    -[NSArray lastObject](self->_buttons, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIButton *)v3;
}

- (void)setActions:(id)a3
{
  id v5;
  NSObject *v6;
  NSArray *actions;
  int v8;
  const char *v9;
  __int16 v10;
  EKUIEventStatusButtonsView *v11;
  __int16 v12;
  NSArray *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToArray:", self->_actions) & 1) == 0)
  {
    v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      actions = self->_actions;
      v8 = 136315906;
      v9 = "-[EKUIEventStatusButtonsView setActions:]";
      v10 = 2112;
      v11 = self;
      v12 = 2112;
      v13 = actions;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "%s: Action set on status buttons [%@] changed from old actions [%@] to new actions [%@]", (uint8_t *)&v8, 0x2Au);
    }
    objc_storeStrong((id *)&self->_actions, a3);
    -[EKUIEventStatusButtonsView _setupButtons](self, "_setupButtons");
  }

}

- (void)setButtonsTouchInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets *p_buttonsTouchInsets;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_buttonsTouchInsets = &self->_buttonsTouchInsets;
  if (self->_buttonsTouchInsets.left != a3.left
    || self->_buttonsTouchInsets.top != a3.top
    || self->_buttonsTouchInsets.right != a3.right
    || self->_buttonsTouchInsets.bottom != a3.bottom)
  {
    p_buttonsTouchInsets->top = a3.top;
    self->_buttonsTouchInsets.left = a3.left;
    self->_buttonsTouchInsets.bottom = a3.bottom;
    self->_buttonsTouchInsets.right = a3.right;
    -[EKUIEventStatusButtonsView _setTouchInsets:](self, "_setTouchInsets:");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_buttons;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "_setTouchInsets:", p_buttonsTouchInsets->top, p_buttonsTouchInsets->left, p_buttonsTouchInsets->bottom, p_buttonsTouchInsets->right, (_QWORD)v13);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)setSelectedAction:(int64_t)a3
{
  void *v4;

  if (self->_selectedAction != a3)
  {
    self->_selectedAction = a3;
    -[EKUIEventStatusButtonsView buttonForAction:](self, "buttonForAction:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIEventStatusButtonsView _updateSelectionToButton:](self, "_updateSelectionToButton:", v4);

    -[EKUIEventStatusButtonsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDisableButtonHighlights:(BOOL)a3
{
  NSArray *v3;
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
  if (self->_disableButtonHighlights != a3)
  {
    self->_disableButtonHighlights = a3;
    if (a3)
    {
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      v3 = self->_buttons;
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
            objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setSelected:", 0, (_QWORD)v8);
          }
          while (v5 != v7);
          v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        }
        while (v5);
      }

    }
  }
}

- (void)setShouldUseVerticalLayout:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_shouldUseVerticalLayout != a3)
  {
    v3 = a3;
    self->_shouldUseVerticalLayout = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_buttons;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      if (v3)
        v9 = 4;
      else
        v9 = 0;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setContentHorizontalAlignment:", v9, (_QWORD)v11);
        }
        while (v7 != v10);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    -[EKUIEventStatusButtonsView _setupConstraints](self, "_setupConstraints");
  }
}

- (BOOL)_shouldCenterButton
{
  return -[NSArray count](self->_buttons, "count") == 1 && self->_forcesSingleButtonToCenter;
}

- (void)_updateButtonFontsWithSize:(double)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_buttons;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "titleLabel", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIEventStatusButtonsView _fontWithSize:selected:](self, "_fontWithSize:selected:", objc_msgSend(v10, "isSelected"), a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFont:", v12);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_updateButtonFonts:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_buttons;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "titleLabel", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setFont:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_updateButtonFontsWithOverrideSize:(double)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  -[EKUIEventStatusButtonsView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[EKUIEventStatusButtonsView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventStatusButtonsViewButtonFont:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontWithSize:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[EKUIEventStatusButtonsView _updateButtonFonts:](self, "_updateButtonFonts:", v9);
  }
  else
  {
    -[EKUIEventStatusButtonsView _updateButtonFontsWithSize:](self, "_updateButtonFontsWithSize:", a3);
  }
}

- (double)_defaultFontSizeForButtons
{
  double result;

  result = 17.0;
  if (!self->_textSizeMode)
    return 13.0;
  return result;
}

- (double)_minimumFontSize
{
  return 13.0;
}

- (id)_fontWithSize:(double)a3 selected:(BOOL)a4
{
  if (a4)
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", a3);
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)_updateFontFromDelegate
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  char v10;
  void *v11;
  double v12;
  double v13;

  -[EKUIEventStatusButtonsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[EKUIEventStatusButtonsView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "eventStatusButtonsViewButtonFont:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUIEventStatusButtonsView _updateButtonFonts:](self, "_updateButtonFonts:", v7);
    objc_msgSend(v7, "pointSize");
    v9 = v8;

  }
  else
  {
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0
      || (-[EKUIEventStatusButtonsView delegate](self, "delegate"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "eventStatusButtonsViewButtonFontSize:", self),
          v9 = v12,
          v11,
          v9 == 0.0))
    {
      -[EKUIEventStatusButtonsView _defaultFontSizeForButtons](self, "_defaultFontSizeForButtons");
      v9 = v13;
    }
    -[EKUIEventStatusButtonsView _updateButtonFontsWithSize:](self, "_updateButtonFontsWithSize:", v9);
  }
  return v9;
}

- (double)_buttonFontSizeFromDelegate
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  char v10;
  void *v11;
  double v12;
  double result;

  -[EKUIEventStatusButtonsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[EKUIEventStatusButtonsView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "eventStatusButtonsViewButtonFont:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "pointSize");
    v9 = v8;

    return v9;
  }
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[EKUIEventStatusButtonsView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventStatusButtonsViewButtonFontSize:", self);
    v9 = v12;

    return v9;
  }
  -[EKUIEventStatusButtonsView _defaultFontSizeForButtons](self, "_defaultFontSizeForButtons");
  return result;
}

- (void)updateConstraints
{
  NSLayoutConstraint *leadingMarginConstraint;
  NSLayoutConstraint *trailingMarginConstraint;
  objc_super v5;

  leadingMarginConstraint = self->_leadingMarginConstraint;
  if (leadingMarginConstraint)
    -[NSLayoutConstraint setConstant:](leadingMarginConstraint, "setConstant:", self->_outsideMargin);
  trailingMarginConstraint = self->_trailingMarginConstraint;
  if (trailingMarginConstraint)
    -[NSLayoutConstraint setConstant:](trailingMarginConstraint, "setConstant:", -self->_outsideMargin);
  v5.receiver = self;
  v5.super_class = (Class)EKUIEventStatusButtonsView;
  -[EKUIEventStatusButtonsView updateConstraints](&v5, sel_updateConstraints);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  unint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  CGFloat Width;
  double v20;
  double v21;
  double v22;
  double v23;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  void *v29;
  double v30;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;
  CGRect v38;

  v37.receiver = self;
  v37.super_class = (Class)EKUIEventStatusButtonsView;
  -[EKUIEventStatusButtonsView layoutSubviews](&v37, sel_layoutSubviews);
  -[EKUIEventStatusButtonsView _updateFontFromDelegate](self, "_updateFontFromDelegate");
  v4 = v3;
  v5 = -[NSArray count](self->_buttons, "count");
  if (!-[EKUIEventStatusButtonsView shouldUseVerticalLayout](self, "shouldUseVerticalLayout"))
  {
    v12 = (double)v5;
    while (1)
    {
      if (self->_inboxStyle)
      {
        if (-[NSArray count](self->_buttons, "count") != 3)
          break;
        -[EKUIEventStatusButtonsView leadingButton](self, "leadingButton");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = _CachedSizeForButton(v13);

        -[EKUIEventStatusButtonsView centerButton](self, "centerButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = _CachedSizeForButton(v15);

        -[EKUIEventStatusButtonsView trailingButton](self, "trailingButton");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = _CachedSizeForButton(v17);

        -[EKUIEventStatusButtonsView bounds](self, "bounds");
        Width = CGRectGetWidth(v38);
        v20 = v16 * 0.5 + 12.0;
        v21 = v14 + v20;
        v22 = Width * 0.5;
        v23 = v20 + v18;
        if (v21 <= v22 && v23 <= v22)
          break;
        v25 = v4 + -1.0;
        -[EKUIEventStatusButtonsView _minimumFontSize](self, "_minimumFontSize");
        if (v4 + -1.0 < v26)
          break;
      }
      else
      {
        if (v5)
        {
          v27 = 0;
          v28 = 0.0;
          do
          {
            -[NSArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v28 + _CachedSizeForButton(v29);

            ++v27;
          }
          while (v5 != v27);
        }
        else
        {
          v28 = 0.0;
        }
        -[EKUIEventStatusButtonsView bounds](self, "bounds");
        if (v28 + v12 * 46.0 < v30 && v5 > 2)
        {
          -[EKUIEventStatusButtonsView bounds](self, "bounds");
          CalRoundToScreenScale((v35 - v28 + v12 * -46.0) * 0.5);
          v6 = v36;
          goto LABEL_3;
        }
        v32 = v28 + v12 * 20.0;
        -[EKUIEventStatusButtonsView bounds](self, "bounds");
        v6 = 0.0;
        if (v32 <= v33)
          goto LABEL_3;
        v25 = v4 + -1.0;
        -[EKUIEventStatusButtonsView _minimumFontSize](self, "_minimumFontSize");
        if (v4 + -1.0 < v34)
          goto LABEL_3;
      }
      -[EKUIEventStatusButtonsView _updateButtonFontsWithOverrideSize:](self, "_updateButtonFontsWithOverrideSize:", v25);
      v4 = v25;
    }
  }
  v6 = 0.0;
LABEL_3:
  if (self->_outsideMargin != v6 && !self->_inboxStyle)
  {
    self->_outsideMargin = v6;
    -[EKUIEventStatusButtonsView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
  -[EKUIEventStatusButtonsView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventStatusButtonsView:calculatedFontSizeToFit:", self, v4);

  if (v5)
  {
    -[NSArray firstObject](self->_buttons, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

  }
  -[EKUIEventStatusButtonsView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[EKUIEventStatusButtonsView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusButtonsDidLayout");

  }
}

- (void)updateForMiniBarState:(BOOL)a3
{
  -[EKUIEventStatusButtonsView setTextSizeMode:](self, "setTextSizeMode:", !a3);
}

- (EKUIEventStatusButtonsViewDelegate)delegate
{
  return (EKUIEventStatusButtonsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)selectedAction
{
  return self->_selectedAction;
}

- (NSArray)actions
{
  return self->_actions;
}

- (UIEdgeInsets)buttonsTouchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_buttonsTouchInsets.top;
  left = self->_buttonsTouchInsets.left;
  bottom = self->_buttonsTouchInsets.bottom;
  right = self->_buttonsTouchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)textSizeMode
{
  return self->_textSizeMode;
}

- (BOOL)disableButtonHighlights
{
  return self->_disableButtonHighlights;
}

- (BOOL)shouldUseVerticalLayout
{
  return self->_shouldUseVerticalLayout;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end

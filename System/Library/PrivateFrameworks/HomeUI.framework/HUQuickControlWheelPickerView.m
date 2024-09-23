@implementation HUQuickControlWheelPickerView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlWheelPickerView)initWithProfile:(id)a3
{
  id v5;
  HUQuickControlWheelPickerView *v6;
  HUQuickControlWheelPickerView *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HUQuickControlWheelPickerView *v24;
  id v25;
  void (**v26)(void *, void *);
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  HUQuickControlWheelPickerView *v34;
  objc_super v35;

  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)HUQuickControlWheelPickerView;
  v6 = -[HUQuickControlWheelPickerView init](&v35, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    v8 = objc_alloc_init(MEMORY[0x1E0CEA838]);
    -[HUQuickControlWheelPickerView setPickerView:](v7, "setPickerView:", v8);

    -[HUQuickControlWheelPickerView pickerView](v7, "pickerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v7);

    -[HUQuickControlWheelPickerView pickerView](v7, "pickerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataSource:", v7);

    -[HUQuickControlWheelPickerView pickerView](v7, "pickerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUQuickControlWheelPickerView pickerView](v7, "pickerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlWheelPickerView addSubview:](v7, "addSubview:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[HUQuickControlWheelPickerView setTopGradientView:](v7, "setTopGradientView:", v13);

    -[HUQuickControlWheelPickerView topGradientView](v7, "topGradientView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUserInteractionEnabled:", 0);

    -[HUQuickControlWheelPickerView topGradientView](v7, "topGradientView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlWheelPickerView addSubview:](v7, "addSubview:", v15);

    v16 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[HUQuickControlWheelPickerView setBottomGradientView:](v7, "setBottomGradientView:", v16);

    -[HUQuickControlWheelPickerView bottomGradientView](v7, "bottomGradientView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUserInteractionEnabled:", 0);

    -[HUQuickControlWheelPickerView bottomGradientView](v7, "bottomGradientView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlWheelPickerView addSubview:](v7, "addSubview:", v18);

    -[HUQuickControlWheelPickerView bottomGradientView](v7, "bottomGradientView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);

    v20 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[HUQuickControlWheelPickerView setSelectedRowSurroundingView:](v7, "setSelectedRowSurroundingView:", v20);

    -[HUQuickControlWheelPickerView selectedRowSurroundingView](v7, "selectedRowSurroundingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setUserInteractionEnabled:", 0);

    -[HUQuickControlWheelPickerView selectedRowSurroundingView](v7, "selectedRowSurroundingView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlWheelPickerView addSubview:](v7, "addSubview:", v22);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __49__HUQuickControlWheelPickerView_initWithProfile___block_invoke;
    v32 = &unk_1E6F4EC90;
    v33 = v23;
    v24 = v7;
    v34 = v24;
    v25 = v23;
    v26 = (void (**)(void *, void *))_Block_copy(&v29);
    -[HUQuickControlWheelPickerView pickerView](v24, "pickerView", v29, v30, v31, v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2](v26, v27);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v25);
  }

  return v7;
}

void __49__HUQuickControlWheelPickerView_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v4, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v11);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v4, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v15);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(v4, "bottomAnchor");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v18);

}

- (void)setItems:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToArray:", self->_items) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_items, a3);
    -[HUQuickControlWheelPickerView setNeedsLayout](self, "setNeedsLayout");
    -[HUQuickControlWheelPickerView setMaxTextWidth:](self, "setMaxTextWidth:", 0.0);
    -[UIPickerView reloadAllComponents](self->_pickerView, "reloadAllComponents");
  }
  -[HUQuickControlWheelPickerView _updateUI](self, "_updateUI");

}

- (void)setSelectedRow:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSNumber *v14;

  v14 = (NSNumber *)a3;
  if (self->_selectedRow != v14)
  {
    objc_storeStrong((id *)&self->_selectedRow, a3);
    -[HUQuickControlWheelPickerView items](self, "items");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[HUQuickControlWheelPickerView items](self, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      v9 = -[NSNumber integerValue](v14, "integerValue");

      if (v8 > v9)
      {
        -[HUQuickControlWheelPickerView setUserInteractionActive:](self, "setUserInteractionActive:", 1);
        -[HUQuickControlWheelPickerView items](self, "items");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", -[NSNumber integerValue](v14, "integerValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUQuickControlWheelPickerView interactionDelegate](self, "interactionDelegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "controlView:valueDidChange:", self, v13);

        -[HUQuickControlWheelPickerView setUserInteractionActive:](self, "setUserInteractionActive:", 0);
        -[HUQuickControlWheelPickerView setNeedsLayout](self, "setNeedsLayout");

      }
    }
  }

}

- (void)_updateUI
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlWheelPickerView items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 1)
  {
    v5 = 0;
    while (1)
    {
      -[HUQuickControlWheelPickerView items](self, "items");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "isSelected"))
        break;

      ++v5;
      -[HUQuickControlWheelPickerView items](self, "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v5 >= v9)
        goto LABEL_13;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v5);
    -[HUQuickControlWheelPickerView setSelectedRow:](self, "setSelectedRow:", v10);

    -[HUQuickControlWheelPickerView pickerView](self, "pickerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "numberOfRowsInComponent:", 0);

    -[HUQuickControlWheelPickerView selectedRow](self, "selectedRow");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13
      && (v14 = (void *)v13,
          -[HUQuickControlWheelPickerView selectedRow](self, "selectedRow"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "integerValue"),
          v15,
          v14,
          v16 < v12))
    {
      -[HUQuickControlWheelPickerView pickerView](self, "pickerView");
      v17 = objc_claimAutoreleasedReturnValue();
      -[HUQuickControlWheelPickerView selectedRow](self, "selectedRow");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject selectRow:inComponent:animated:](v17, "selectRow:inComponent:animated:", objc_msgSend(v18, "integerValue"), 0, 0);
    }
    else
    {
      HFLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        goto LABEL_13;
      }
      -[HUQuickControlWheelPickerView selectedRow](self, "selectedRow");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 134217984;
      v22 = objc_msgSend(v18, "integerValue");
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Unable to select row %ld as it exceeds number of rows in component", (uint8_t *)&v21, 0xCu);
    }

    goto LABEL_12;
  }
LABEL_13:
  -[HUQuickControlWheelPickerView pickerView](self, "pickerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setMagnifierLineColor:", v20);

}

- (void)_updateSelectedRowBorderView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HUQuickControlWheelPickerView selectedRowSurroundingView](self, "selectedRowSurroundingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "colorWithAlphaComponent:", 0.1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlWheelPickerView selectedRowSurroundingView](self, "selectedRowSurroundingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = objc_msgSend(objc_retainAutorelease(v10), "CGColor");
    -[HUQuickControlWheelPickerView selectedRowSurroundingView](self, "selectedRowSurroundingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBorderColor:", v7);

  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlWheelPickerView;
  -[HUQuickControlWheelPickerView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  v5 = 0.5;
  if (v3)
    v5 = 1.0;
  -[HUQuickControlWheelPickerView setAlpha:](self, "setAlpha:", v5);
}

- (void)tintColorDidChange
{
  void *v3;
  id v4;

  -[HUQuickControlWheelPickerView profile](self, "profile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlWheelPickerView _updateSelectedRowBorderView:](self, "_updateSelectedRowBorderView:", v3);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[HUQuickControlWheelPickerView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlWheelPickerView intrinsicSizeDescriptorForControlSize:](self, "intrinsicSizeDescriptorForControlSize:", objc_msgSend(v3, "controlSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intrinsicSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  double v59;
  void *v60;
  id v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  id v74;
  double v75;
  void *v76;
  id v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  int v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  objc_super v113;
  uint8_t buf[4];
  uint64_t v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  uint64_t v119;
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[4];

  v123[2] = *MEMORY[0x1E0C80C00];
  v113.receiver = self;
  v113.super_class = (Class)HUQuickControlWheelPickerView;
  -[HUQuickControlWheelPickerView layoutSubviews](&v113, sel_layoutSubviews);
  -[HUQuickControlWheelPickerView pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfRowsInComponent:", 0);

  -[HUQuickControlWheelPickerView selectedRow](self, "selectedRow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[HUQuickControlWheelPickerView selectedRow](self, "selectedRow"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "integerValue"),
        v7,
        v6,
        v8 >= v4))
  {
    HFLogForCategory();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      -[HUQuickControlWheelPickerView selectedRow](self, "selectedRow");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "integerValue");
      -[HUQuickControlWheelPickerView items](self, "items");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "count");
      *(_DWORD *)buf = 134218496;
      v115 = v85;
      v116 = 2048;
      v117 = v4;
      v118 = 2048;
      v119 = v87;
      _os_log_impl(&dword_1B8E1E000, v72, OS_LOG_TYPE_DEFAULT, "Selected row is %ld but number of rows in component is %ld. Number of wheel picker items is %ld.", buf, 0x20u);

    }
    goto LABEL_14;
  }
  -[HUQuickControlWheelPickerView pickerView](self, "pickerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlWheelPickerView selectedRow](self, "selectedRow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_contentSizeForRow:inComponent:", objc_msgSend(v10, "integerValue"), 0);
  v12 = v11;
  v14 = v13;

  -[HUQuickControlWheelPickerView selectedRowSurroundingView](self, "selectedRowSurroundingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;

  -[HUQuickControlWheelPickerView selectedRowSurroundingView](self, "selectedRowSurroundingView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v17, v19, v12, v14);

  -[HUQuickControlWheelPickerView pickerView](self, "pickerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "center");
  v23 = v22;
  v25 = v24;
  -[HUQuickControlWheelPickerView selectedRowSurroundingView](self, "selectedRowSurroundingView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCenter:", v23, v25);

  -[HUQuickControlWheelPickerView profile](self, "profile");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "selectedRowBorderWidth");
  v29 = v28;
  -[HUQuickControlWheelPickerView selectedRowSurroundingView](self, "selectedRowSurroundingView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBorderWidth:", v29);

  -[HUQuickControlWheelPickerView profile](self, "profile");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "selectedRowCornerRadius");
  v34 = v33;
  -[HUQuickControlWheelPickerView selectedRowSurroundingView](self, "selectedRowSurroundingView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCornerRadius:", v34);

  -[HUQuickControlWheelPickerView profile](self, "profile");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "style");

  if (v38 != 1)
    goto LABEL_15;
  -[HUQuickControlWheelPickerView bounds](self, "bounds");
  v40 = v39;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "colorWithAlphaComponent:", 0.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlWheelPickerView profile](self, "profile");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "sizeToFitTextWidth"))
  {
    -[HUQuickControlWheelPickerView maxTextWidth](self, "maxTextWidth");
    if (v45 > 0.0)
    {
      -[HUQuickControlWheelPickerView maxTextWidth](self, "maxTextWidth");
      v12 = v46;
    }
  }

  -[HUQuickControlWheelPickerView pickerView](self, "pickerView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "frame");
  v49 = (v48 - v12) * 0.5;

  -[HUQuickControlWheelPickerView topGradientView](self, "topGradientView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFrame:", v49, 0.0, v12, v40 / 2.5);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlWheelPickerView topGradientView](self, "topGradientView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setBackgroundColor:", v51);

  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlWheelPickerView topGradientView](self, "topGradientView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bounds");
  objc_msgSend(v53, "setFrame:");

  v55 = objc_retainAutorelease(v41);
  v123[0] = objc_msgSend(v55, "CGColor");
  v56 = objc_retainAutorelease(v43);
  v123[1] = objc_msgSend(v56, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setColors:", v57);

  v58 = objc_alloc(MEMORY[0x1E0CB37E8]);
  LODWORD(v59) = 1058642330;
  v60 = (void *)objc_msgSend(v58, "initWithFloat:", v59);
  v122[0] = v60;
  v61 = objc_alloc(MEMORY[0x1E0CB37E8]);
  LODWORD(v62) = 1.0;
  v63 = (void *)objc_msgSend(v61, "initWithFloat:", v62);
  v122[1] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setLocations:", v64);

  -[HUQuickControlWheelPickerView topGradientView](self, "topGradientView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "layer");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setMask:", v53);

  -[HUQuickControlWheelPickerView bottomGradientView](self, "bottomGradientView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setFrame:", v49, v40 - v40 / 10.0 + 20.0, v12, v40 / 10.0);

  -[HUQuickControlWheelPickerView bottomGradientView](self, "bottomGradientView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setBackgroundColor:", v55);

  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlWheelPickerView bottomGradientView](self, "bottomGradientView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bounds");
  objc_msgSend(v69, "setFrame:");

  v71 = objc_retainAutorelease(v56);
  v121[0] = objc_msgSend(v71, "CGColor");
  v72 = objc_retainAutorelease(v55);
  v121[1] = -[NSObject CGColor](v72, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setColors:", v73);

  v74 = objc_alloc(MEMORY[0x1E0CB37E8]);
  LODWORD(v75) = 0;
  v76 = (void *)objc_msgSend(v74, "initWithFloat:", v75);
  v120[0] = v76;
  v77 = objc_alloc(MEMORY[0x1E0CB37E8]);
  LODWORD(v78) = 1.0;
  v79 = (void *)objc_msgSend(v77, "initWithFloat:", v78);
  v120[1] = v79;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 2);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setLocations:", v80);

  -[HUQuickControlWheelPickerView bottomGradientView](self, "bottomGradientView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "layer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setMask:", v69);

  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v83, "hostProcess") == 3)
  {

LABEL_12:
    -[HUQuickControlWheelPickerView topGradientView](self, "topGradientView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setHidden:", 1);

    -[HUQuickControlWheelPickerView bottomGradientView](self, "bottomGradientView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setHidden:", 1);

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "hostProcess");

  if (v89 == 100)
    goto LABEL_12;
LABEL_13:
  -[HUQuickControlWheelPickerView selectedRowSurroundingView](self, "selectedRowSurroundingView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "layer");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setCornerRadius:", v14 * 0.5);

LABEL_14:
LABEL_15:
  -[HUQuickControlWheelPickerView profile](self, "profile");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "borderWidth");
  v96 = v95;
  -[HUQuickControlWheelPickerView pickerView](self, "pickerView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "layer");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setBorderWidth:", v96);

  v99 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials");
  -[HUQuickControlWheelPickerView profile](self, "profile");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "borderColor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v101;
  v103 = v101;
  if (v99)
  {
    objc_msgSend(v101, "colorWithAlphaComponent:", 0.7);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v104 = objc_msgSend(objc_retainAutorelease(v103), "CGColor");
  -[HUQuickControlWheelPickerView pickerView](self, "pickerView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "layer");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setBorderColor:", v104);

  if (v99)
  -[HUQuickControlWheelPickerView profile](self, "profile");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "cornerRadius");
  v109 = v108;
  -[HUQuickControlWheelPickerView pickerView](self, "pickerView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "layer");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setCornerRadius:", v109);

  -[HUQuickControlWheelPickerView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", -[HUQuickControlWheelPickerView reachabilityState](self, "reachabilityState"));
  -[HUQuickControlWheelPickerView profile](self, "profile");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlWheelPickerView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", objc_msgSend(v112, "showOffState") ^ 1);

}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlWheelPickerView setSelectedRow:](self, "setSelectedRow:", v6);

  -[HUQuickControlWheelPickerView _prepareForTapticFeedback](self, "_prepareForTapticFeedback");
  -[HUQuickControlWheelPickerView _actuateSelectionTapticFeedback](self, "_actuateSelectionTapticFeedback");
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HUQuickControlWheelPickerView items](self, "items", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;

  v8 = a6;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlWheelPickerView items](self, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlWheelPickerView profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "uppercaseRowTitles");

  if (v14)
  {
    v15 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v15, "localizedUppercaseString");
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 14.0);
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v16;
    v9 = (void *)v17;
  }
  objc_opt_class();
  v18 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  v21 = v18;
  if (!v20)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(v21, "setTextAlignment:", 1);
    objc_msgSend(v21, "setFont:", v9);
  }
  objc_msgSend(v21, "setText:", v12);
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setValue:forKey:", v9, *MEMORY[0x1E0CEA098]);
  objc_msgSend(v12, "sizeWithAttributes:", v22);
  v24 = v23;
  -[HUQuickControlWheelPickerView maxTextWidth](self, "maxTextWidth");
  if (v25 < v24)
    -[HUQuickControlWheelPickerView setMaxTextWidth:](self, "setMaxTextWidth:", v24);

  return v21;
}

- (void)setProfile:(id)a3
{
  HUQuickControlWheelPickerViewProfile *v4;
  unint64_t v5;
  uint64_t v6;
  HUQuickControlWheelPickerViewProfile *profile;

  v4 = (HUQuickControlWheelPickerViewProfile *)a3;
  v5 = -[HUQuickControlViewProfile controlSize](self->_profile, "controlSize");
  v6 = -[HUQuickControlViewProfile controlSize](v4, "controlSize");
  profile = self->_profile;
  self->_profile = v4;

  -[HUQuickControlWheelPickerView setNeedsLayout](self, "setNeedsLayout");
  if (v5 != v6)
    -[HUQuickControlWheelPickerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;

  HUQuickControlSliderMetricsForControlSize(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicSize");
  v7 = v6;
  v9 = v8;

  v10 = v7 * 2.5;
  -[HUQuickControlWheelPickerView profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v11, "sizeToFitTextWidth");

  if ((_DWORD)v5)
  {
    -[HUQuickControlWheelPickerView maxTextWidth](self, "maxTextWidth");
    if (v12 == 0.0)
    {
      v14 = 150.0;
    }
    else
    {
      -[HUQuickControlWheelPickerView maxTextWidth](self, "maxTextWidth");
      v14 = v13 + 60.0;
    }
    v15 = fmax(v14, 100.0);
    if (v15 < v10)
      v10 = v15;
    -[HUQuickControlWheelPickerView profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "style");

    if (v17 == 1)
      v9 = v9 * 0.5;
  }
  return +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 2, v10, v9);
}

- (id)value
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[HUQuickControlWheelPickerView pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRowInComponent:", 0);

  -[HUQuickControlWheelPickerView items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  v7 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v7;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    -[HUQuickControlWheelPickerView setItems:](self, "setItems:", v6);

}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlWheelPickerView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 <= 2)
    -[HUQuickControlWheelPickerView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", (a3 & 7) == 2);
}

- (void)_prepareForTapticFeedback
{
  id v3;
  id v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA998]);
  -[HUQuickControlWheelPickerView setSelectionFeedbackGenerator:](self, "setSelectionFeedbackGenerator:", v3);

  -[HUQuickControlWheelPickerView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (void)_actuateSelectionTapticFeedback
{
  void *v3;
  id v4;

  -[HUQuickControlWheelPickerView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionChanged");

  -[HUQuickControlWheelPickerView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (HUQuickControlViewInteractionDelegate)interactionDelegate
{
  return (HUQuickControlViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (HUQuickControlWheelPickerViewProfile)profile
{
  return self->_profile;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerView, a3);
}

- (UIView)topGradientView
{
  return self->_topGradientView;
}

- (void)setTopGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_topGradientView, a3);
}

- (UIView)bottomGradientView
{
  return self->_bottomGradientView;
}

- (void)setBottomGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomGradientView, a3);
}

- (UIView)selectedRowSurroundingView
{
  return self->_selectedRowSurroundingView;
}

- (void)setSelectedRowSurroundingView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRowSurroundingView, a3);
}

- (NSNumber)selectedRow
{
  return self->_selectedRow;
}

- (double)maxTextWidth
{
  return self->_maxTextWidth;
}

- (void)setMaxTextWidth:(double)a3
{
  self->_maxTextWidth = a3;
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, a3);
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectedRow, 0);
  objc_storeStrong((id *)&self->_selectedRowSurroundingView, 0);
  objc_storeStrong((id *)&self->_bottomGradientView, 0);
  objc_storeStrong((id *)&self->_topGradientView, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end

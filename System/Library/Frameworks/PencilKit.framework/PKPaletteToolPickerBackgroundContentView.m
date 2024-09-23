@implementation PKPaletteToolPickerBackgroundContentView

- (PKPaletteToolPickerBackgroundContentView)init
{
  PKPaletteToolPickerBackgroundContentView *v2;
  PKPaletteToolPickerEdgeView *v3;
  PKPaletteToolPickerEdgeView *topOrLeadingEdgeView;
  PKPaletteToolPickerEdgeView *v5;
  PKPaletteToolPickerEdgeView *bottomOrTrailingEdgeView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *horizontalLayoutConstraints;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *verticalLayoutConstraints;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;
  _QWORD v57[8];
  _QWORD v58[10];

  v58[8] = *MEMORY[0x1E0C80C00];
  v56.receiver = self;
  v56.super_class = (Class)PKPaletteToolPickerBackgroundContentView;
  v2 = -[PKPaletteToolPickerBackgroundContentView init](&v56, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PKPaletteToolPickerEdgeView);
    topOrLeadingEdgeView = v2->_topOrLeadingEdgeView;
    v2->_topOrLeadingEdgeView = v3;

    -[PKPaletteToolPickerEdgeView setTranslatesAutoresizingMaskIntoConstraints:](v2->_topOrLeadingEdgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteToolPickerBackgroundContentView addSubview:](v2, "addSubview:", v2->_topOrLeadingEdgeView);
    v5 = objc_alloc_init(PKPaletteToolPickerEdgeView);
    bottomOrTrailingEdgeView = v2->_bottomOrTrailingEdgeView;
    v2->_bottomOrTrailingEdgeView = v5;

    -[PKPaletteToolPickerEdgeView setTranslatesAutoresizingMaskIntoConstraints:](v2->_bottomOrTrailingEdgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteToolPickerBackgroundContentView addSubview:](v2, "addSubview:", v2->_bottomOrTrailingEdgeView);
    -[PKPaletteToolPickerEdgeView topAnchor](v2->_topOrLeadingEdgeView, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView topAnchor](v2, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v52);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v50;
    -[PKPaletteToolPickerEdgeView leadingAnchor](v2->_topOrLeadingEdgeView, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView leadingAnchor](v2, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v46);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v44;
    -[PKPaletteToolPickerEdgeView bottomAnchor](v2->_topOrLeadingEdgeView, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView bottomAnchor](v2, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v38;
    -[PKPaletteToolPickerEdgeView widthAnchor](v2->_topOrLeadingEdgeView, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToConstant:", 15.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v34;
    -[PKPaletteToolPickerEdgeView topAnchor](v2->_bottomOrTrailingEdgeView, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView topAnchor](v2, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v28;
    -[PKPaletteToolPickerEdgeView bottomAnchor](v2->_bottomOrTrailingEdgeView, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView bottomAnchor](v2, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v58[5] = v8;
    -[PKPaletteToolPickerEdgeView trailingAnchor](v2->_bottomOrTrailingEdgeView, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView trailingAnchor](v2, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v58[6] = v11;
    -[PKPaletteToolPickerEdgeView widthAnchor](v2->_bottomOrTrailingEdgeView, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 15.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v58[7] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 8);
    v14 = objc_claimAutoreleasedReturnValue();
    horizontalLayoutConstraints = v2->_horizontalLayoutConstraints;
    v2->_horizontalLayoutConstraints = (NSArray *)v14;

    -[PKPaletteToolPickerEdgeView topAnchor](v2->_topOrLeadingEdgeView, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView topAnchor](v2, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v53);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v51;
    -[PKPaletteToolPickerEdgeView leadingAnchor](v2->_topOrLeadingEdgeView, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView leadingAnchor](v2, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v47);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v45;
    -[PKPaletteToolPickerEdgeView trailingAnchor](v2->_topOrLeadingEdgeView, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView trailingAnchor](v2, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v41);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v39;
    -[PKPaletteToolPickerEdgeView heightAnchor](v2->_topOrLeadingEdgeView, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToConstant:", 15.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v35;
    -[PKPaletteToolPickerEdgeView leadingAnchor](v2->_bottomOrTrailingEdgeView, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView leadingAnchor](v2, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v57[4] = v29;
    -[PKPaletteToolPickerEdgeView bottomAnchor](v2->_bottomOrTrailingEdgeView, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView bottomAnchor](v2, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v57[5] = v18;
    -[PKPaletteToolPickerEdgeView trailingAnchor](v2->_bottomOrTrailingEdgeView, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerBackgroundContentView trailingAnchor](v2, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v57[6] = v21;
    -[PKPaletteToolPickerEdgeView heightAnchor](v2->_bottomOrTrailingEdgeView, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", 15.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v57[7] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 8);
    v24 = objc_claimAutoreleasedReturnValue();
    verticalLayoutConstraints = v2->_verticalLayoutConstraints;
    v2->_verticalLayoutConstraints = (NSArray *)v24;

    -[PKPaletteToolPickerBackgroundContentView _updateUI]((uint64_t)v2);
  }
  return v2;
}

- (uint64_t)_updateUI
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;

  if (result)
  {
    v1 = result;
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(_QWORD *)(result + 432));
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(_QWORD *)(v1 + 440));
    v2 = *(_QWORD *)(v1 + 456);
    v3 = 3;
    if (!v2)
      v3 = 2;
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(_QWORD *)(v1 + OBJC_IVAR___PKPaletteToolPickerBackgroundContentView__topOrLeadingEdgeView[v3]));
    v4 = *(_QWORD *)(v1 + 456);
    v5 = *(_QWORD *)(v1 + 416);
    if (v5 && *(_QWORD *)(v5 + 440) != v4)
    {
      *(_QWORD *)(v5 + 440) = v4;
      -[PKPaletteToolPickerEdgeView _updateUI](v5);
      v4 = *(_QWORD *)(v1 + 456);
    }
    v6 = *(_QWORD *)(v1 + 424);
    if (v6 && *(_QWORD *)(v6 + 440) != v4)
    {
      *(_QWORD *)(v6 + 440) = v4;
      -[PKPaletteToolPickerEdgeView _updateUI](v6);
      v4 = *(_QWORD *)(v1 + 456);
    }
    v7 = v4 == 1 && *(_BYTE *)(v1 + 448) == 0;
    v8 = *(_QWORD *)(v1 + 416);
    if (v8 && *(unsigned __int8 *)(v8 + 432) != v7)
    {
      *(_BYTE *)(v8 + 432) = v7;
      -[PKPaletteToolPickerEdgeView _updateUI](v8);
    }
    if (v2)
      v9 = v7;
    else
      v9 = 1;
    v10 = *(_QWORD *)(v1 + 424);
    if (v10)
    {
      if (*(unsigned __int8 *)(v10 + 432) == v9
        || (*(_BYTE *)(v10 + 432) = v9, -[PKPaletteToolPickerEdgeView _updateUI](v10),
                                        (v10 = *(_QWORD *)(v1 + 424)) != 0))
      {
        v11 = v4 == 1;
        if (*(unsigned __int8 *)(v10 + 433) != v11)
        {
          *(_BYTE *)(v10 + 433) = v11;
          -[PKPaletteToolPickerEdgeView _updateUI](v10);
        }
      }
    }
    objc_msgSend(*(id *)(v1 + 416), "setHidden:", *(_BYTE *)(v1 + 449) == 0);
    return objc_msgSend(*(id *)(v1 + 424), "setHidden:", *(_BYTE *)(v1 + 450) == 0);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_horizontalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_bottomOrTrailingEdgeView, 0);
  objc_storeStrong((id *)&self->_topOrLeadingEdgeView, 0);
}

@end

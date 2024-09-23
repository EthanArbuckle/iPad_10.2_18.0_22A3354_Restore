@implementation PKPaletteErasingAttributesView

- (PKPaletteErasingAttributesView)initWithFrame:(CGRect)a3
{
  PKPaletteErasingAttributesView *v3;
  UISegmentedControl *v4;
  UISegmentedControl *segmentedControl;
  _PKInkThicknessPicker *v6;
  _PKInkThicknessPicker *thicknessPicker;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *hiddenThicknessPickerConstraints;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *visibleThicknessPickerConstraints;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UISegmentedControl *v34;
  void *v35;
  UISegmentedControl *v36;
  void *v37;
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
  objc_super v54;
  _QWORD v55[3];
  _QWORD v56[6];
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)PKPaletteErasingAttributesView;
  v3 = -[PKPaletteErasingAttributesView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E0DC3C58]);
    segmentedControl = v3->_segmentedControl;
    v3->_segmentedControl = v4;

    -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](v3->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteErasingAttributesView addSubview:](v3, "addSubview:", v3->_segmentedControl);
    +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:](PKToolConfiguration, "defaultConfigurationForToolWithIdentifier:", CFSTR("com.apple.ink.objectEraser"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_PKInkThicknessPicker *)-[_PKInkThicknessPicker initWithToolConfiguration:]([_PKInkThicknessPicker alloc], v53);
    thicknessPicker = v3->_thicknessPicker;
    v3->_thicknessPicker = v6;

    -[_PKInkThicknessPicker setTranslatesAutoresizingMaskIntoConstraints:](v3->_thicknessPicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteErasingAttributesView addSubview:](v3, "addSubview:", v3->_thicknessPicker);
    -[UISegmentedControl bottomAnchor](v3->_segmentedControl, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteErasingAttributesView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -10.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    hiddenThicknessPickerConstraints = v3->_hiddenThicknessPickerConstraints;
    v3->_hiddenThicknessPickerConstraints = (NSArray *)v12;

    -[UISegmentedControl bottomAnchor](v3->_segmentedControl, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKInkThicknessPicker topAnchor](v3->_thicknessPicker, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v49, -10.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v47;
    -[_PKInkThicknessPicker widthAnchor](v3->_thicknessPicker, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", 280.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v43;
    -[_PKInkThicknessPicker centerXAnchor](v3->_thicknessPicker, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl centerXAnchor](v3->_segmentedControl, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v40;
    -[_PKInkThicknessPicker leadingAnchor](v3->_thicknessPicker, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl leadingAnchor](v3->_segmentedControl, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v15;
    -[_PKInkThicknessPicker trailingAnchor](v3->_thicknessPicker, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl trailingAnchor](v3->_segmentedControl, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v56[4] = v18;
    -[_PKInkThicknessPicker bottomAnchor](v3->_thicknessPicker, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteErasingAttributesView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, -10.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v56[5] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 6);
    v23 = objc_claimAutoreleasedReturnValue();
    visibleThicknessPickerConstraints = v3->_visibleThicknessPickerConstraints;
    v3->_visibleThicknessPickerConstraints = (NSArray *)v23;

    v44 = (void *)MEMORY[0x1E0CB3718];
    -[UISegmentedControl topAnchor](v3->_segmentedControl, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteErasingAttributesView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v48, 10.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v46;
    -[UISegmentedControl leadingAnchor](v3->_segmentedControl, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteErasingAttributesView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 10.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v28;
    -[UISegmentedControl trailingAnchor](v3->_segmentedControl, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteErasingAttributesView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, -10.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v33);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3->_visibleThicknessPickerConstraints);
    v34 = v3->_segmentedControl;
    PKPaletteEraserNameForEraserType(0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](v34, "insertSegmentWithTitle:atIndex:animated:", v35, 0, 0);

    v36 = v3->_segmentedControl;
    PKPaletteEraserNameForEraserType(1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](v36, "insertSegmentWithTitle:atIndex:animated:", v37, 1, 0);

    -[PKPaletteErasingAttributesView setEraserType:](v3, "setEraserType:", 1);
  }
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setHideWeightPicker:(BOOL)a3
{
  int *v4;

  if (self->_hideWeightPicker != a3)
  {
    self->_hideWeightPicker = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_visibleThicknessPickerConstraints);
      -[_PKInkThicknessPicker removeFromSuperview](self->_thicknessPicker, "removeFromSuperview");
      v4 = &OBJC_IVAR___PKPaletteErasingAttributesView__hiddenThicknessPickerConstraints;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_hiddenThicknessPickerConstraints);
      -[PKPaletteErasingAttributesView addSubview:](self, "addSubview:", self->_thicknessPicker);
      v4 = &OBJC_IVAR___PKPaletteErasingAttributesView__visibleThicknessPickerConstraints;
    }
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + *v4));
    -[PKPaletteErasingAttributesView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setEraserType:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if ((a3 & 0x8000000000000000) == 0)
  {
    -[PKPaletteErasingAttributesView segmentedControl](self, "segmentedControl");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "numberOfSegments") <= (unint64_t)a3)
    {

    }
    else
    {
      -[PKPaletteErasingAttributesView segmentedControl](self, "segmentedControl");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "selectedSegmentIndex");

      if (v6 != a3)
      {
        -[PKPaletteErasingAttributesView segmentedControl](self, "segmentedControl");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSelectedSegmentIndex:", a3);

        -[PKPaletteErasingAttributesView _updateThicknessPickerToolConfiguration](self, "_updateThicknessPickerToolConfiguration");
      }
    }
  }
}

- (void)_updateThicknessPickerToolConfiguration
{
  int64_t v3;
  __CFString **v4;
  id v5;

  v3 = -[PKPaletteErasingAttributesView eraserType](self, "eraserType");
  v4 = PKInkIdentifierObjectEraser;
  if (v3 != 1)
    v4 = PKInkIdentifierEraser;
  +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:](PKToolConfiguration, "defaultConfigurationForToolWithIdentifier:", *v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_PKInkThicknessPicker setToolConfiguration:]((uint64_t)self->_thicknessPicker, v5);
  -[_PKInkThicknessPicker setUserInteractionEnabled:](self->_thicknessPicker, "setUserInteractionEnabled:", -[PKPaletteErasingAttributesView eraserType](self, "eraserType") == 0);

}

- (int64_t)eraserType
{
  void *v2;
  int64_t v3;

  -[PKPaletteErasingAttributesView segmentedControl](self, "segmentedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedSegmentIndex");

  return v3;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
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
  double v16;
  CGSize result;

  -[PKPaletteErasingAttributesView segmentedControl](self, "segmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E0C9D820], v5);
  v7 = v6;
  v9 = v8;

  if (-[PKPaletteErasingAttributesView hideWeightPicker](self, "hideWeightPicker"))
  {
    v10 = v9 + 20.0;
  }
  else
  {
    -[PKPaletteErasingAttributesView thicknessPicker](self, "thicknessPicker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeThatFits:", v4, v5);
    v13 = v12;
    v15 = v14;

    if (v7 < v13)
      v7 = v13;
    v10 = v9 + 30.0 + v15;
  }
  v16 = v7 + 20.0;
  result.height = v10;
  result.width = v16;
  return result;
}

- (BOOL)hideWeightPicker
{
  return self->_hideWeightPicker;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (_PKInkThicknessPicker)thicknessPicker
{
  return self->_thicknessPicker;
}

- (void)setThicknessPicker:(id)a3
{
  objc_storeStrong((id *)&self->_thicknessPicker, a3);
}

- (NSArray)hiddenThicknessPickerConstraints
{
  return self->_hiddenThicknessPickerConstraints;
}

- (void)setHiddenThicknessPickerConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenThicknessPickerConstraints, a3);
}

- (NSArray)visibleThicknessPickerConstraints
{
  return self->_visibleThicknessPickerConstraints;
}

- (void)setVisibleThicknessPickerConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_visibleThicknessPickerConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleThicknessPickerConstraints, 0);
  objc_storeStrong((id *)&self->_hiddenThicknessPickerConstraints, 0);
  objc_storeStrong((id *)&self->_thicknessPicker, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end

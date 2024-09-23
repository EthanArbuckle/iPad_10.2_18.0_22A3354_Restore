@implementation AKFontSizePicker

- (AKFontSizePicker)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  AKFontSizePicker *v5;
  AKFontSizePicker *v6;
  NSArray *sizeListValues;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKFontSizePicker;
  v5 = -[AKFontSizePicker initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    sizeListValues = v5->_sizeListValues;
    v5->_sizeListValues = (NSArray *)&unk_24F1CF480;

    -[AKFontSizePicker setStyle:](v6, "setStyle:", a4);
  }
  return v6;
}

- (AKFontSizePicker)initWithFrame:(CGRect)a3
{
  return -[AKFontSizePicker initWithFrame:style:](self, "initWithFrame:style:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id firstValue;
  id firstValuea;
  _QWORD v70[6];

  v70[4] = *MEMORY[0x24BDAC8D0];
  if (self->_style != a3)
  {
    -[AKFontSizePicker label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[AKFontSizePicker stepper](self, "stepper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[AKFontSizePicker sizeList](self, "sizeList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    switch(a3)
    {
      case 3:
        objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("textformat.size.smaller"));
        firstValuea = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("textformat.size.larger"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_alloc(MEMORY[0x24BDF6DA8]);
        v25 = (void *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        LODWORD(v26) = 9.0;
        objc_msgSend(v25, "setMinimumValue:", v26);
        LODWORD(v27) = 1125122048;
        objc_msgSend(v25, "setMaximumValue:", v27);
        -[AKFontSizePicker value](self, "value");
        *(float *)&v28 = v28;
        objc_msgSend(v25, "setValue:", v28);
        objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__handleValueChanged_, 4096);
        objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__sliderTouchUp_, 64);
        objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__sliderTouchUp_, 128);
        objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__sliderTouchUp_, 256);
        objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__sliderTouchDown_, 1);
        -[AKFontSizePicker setSlider:](self, "setSlider:", v25);
        objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setTintColor:", v30);

        objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v29, "setImage:forState:", firstValuea, 0);
        v66 = v29;
        objc_msgSend(v29, "addTarget:action:forControlEvents:", self, sel__decreaseSize_, 64);
        objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setTintColor:", v32);

        objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v31, "setImage:forState:", v67, 0);
        v65 = v31;
        objc_msgSend(v31, "addTarget:action:forControlEvents:", self, sel__increaseSize_, 64);
        v33 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
        objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[AKFontSizePicker addSubview:](self, "addSubview:", v33);
        objc_msgSend(v33, "addArrangedSubview:", v29);
        objc_msgSend(v33, "addArrangedSubview:", v25);
        objc_msgSend(v33, "addArrangedSubview:", v31);
        objc_msgSend(v33, "setSpacing:", 10.0);
        objc_msgSend(v33, "setAxis:", 0);
        objc_msgSend(v33, "setAlignment:", 3);
        v59 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(v33, "topAnchor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKFontSizePicker topAnchor](self, "topAnchor");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "constraintEqualToAnchor:", v63);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = v62;
        objc_msgSend(v33, "bottomAnchor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKFontSizePicker bottomAnchor](self, "bottomAnchor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "constraintEqualToAnchor:", v60);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v70[1] = v34;
        objc_msgSend(v33, "trailingAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKFontSizePicker trailingAnchor](self, "trailingAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, -10.0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v70[2] = v37;
        objc_msgSend(v33, "leadingAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKFontSizePicker leadingAnchor](self, "leadingAnchor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 10.0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v70[3] = v40;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 4);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "activateConstraints:", v41);

        return;
      case 2:
        firstValue = (id)objc_opt_new();
        objc_msgSend(firstValue, "setScrollDirection:", 1);
        objc_msgSend(firstValue, "setMinimumInteritemSpacing:", 0.0);
        objc_msgSend(firstValue, "setMinimumLineSpacing:", 0.0);
        -[AKFontSizePicker _itemSizeInContainer](self, "_itemSizeInContainer");
        objc_msgSend(firstValue, "setItemSize:");
        v42 = objc_alloc(MEMORY[0x24BDF68D8]);
        -[AKFontSizePicker bounds](self, "bounds");
        v43 = (void *)objc_msgSend(v42, "initWithFrame:collectionViewLayout:", firstValue);
        -[AKFontSizePicker setSizeList:](self, "setSizeList:", v43);

        -[AKFontSizePicker sizeList](self, "sizeList");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[AKFontSizePicker sizeList](self, "sizeList");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setDelegate:", self);

        -[AKFontSizePicker sizeList](self, "sizeList");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setDataSource:", self);

        -[AKFontSizePicker sizeList](self, "sizeList");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setPagingEnabled:", 1);

        -[AKFontSizePicker sizeList](self, "sizeList");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setShowsHorizontalScrollIndicator:", 0);

        -[AKFontSizePicker sizeList](self, "sizeList");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setShowsVerticalScrollIndicator:", 0);

        objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKFontSizePicker sizeList](self, "sizeList");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setBackgroundColor:", v50);

        -[AKFontSizePicker sizeList](self, "sizeList");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("AnnotationKit.fontSizePickerIdentifier"));

        -[AKFontSizePicker sizeList](self, "sizeList");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKFontSizePicker addSubview:](self, "addSubview:", v53);

        _NSDictionaryOfVariableBindings(CFSTR("_sizeList"), self->_sizeList, 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_sizeList]|"), 0, 0, v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "activateConstraints:", v56);

        v57 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_sizeList]|"), 0, 0, v54);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "activateConstraints:", v58);

        break;
      case 1:
        v8 = objc_alloc(MEMORY[0x24BDF6B68]);
        v9 = *MEMORY[0x24BDBF090];
        v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
        v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
        v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
        firstValue = (id)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], v10, v11, v12);
        objc_msgSend(firstValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(firstValue, "setUserInteractionEnabled:", 0);
        +[AKTextAttributesViewController fontSizeNumberFormatter](AKTextAttributesViewController, "fontSizeNumberFormatter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x24BDD16E0];
        -[AKFontSizePicker value](self, "value");
        objc_msgSend(v14, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringFromNumber:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(firstValue, "setText:", v16);

        -[AKFontSizePicker setLabel:](self, "setLabel:", firstValue);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DF8]), "initWithFrame:", v9, v10, v11, v12);
        objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v17, "setMinimumValue:", 4.0);
        objc_msgSend(v17, "setMaximumValue:", 200.0);
        -[AKFontSizePicker value](self, "value");
        objc_msgSend(v17, "setValue:");
        objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel__handleValueChanged_, 4096);
        -[AKFontSizePicker setStepper:](self, "setStepper:", v17);
        -[AKFontSizePicker addSubview:](self, "addSubview:", firstValue);
        -[AKFontSizePicker addSubview:](self, "addSubview:", v17);
        _NSDictionaryOfVariableBindings(CFSTR("label, stepper"), firstValue, v17, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[label]|"), 0, 0, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "activateConstraints:", v20);

        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 10, 0, firstValue, 10, 1.0, 0.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setActive:", 1);

        v22 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(16)-[label]-(8)-[stepper]-(16)-|"), 0, 0, v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "activateConstraints:", v23);

        break;
      default:
        return;
    }

  }
}

- (void)setValue:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double value;
  void *v8;
  void *v9;
  double v10;
  id v11;

  if (self->_value != a3)
  {
    self->_value = a3;
    +[AKTextAttributesViewController fontSizeNumberFormatter](AKTextAttributesViewController, "fontSizeNumberFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_value);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[AKFontSizePicker label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v11);

    value = self->_value;
    -[AKFontSizePicker stepper](self, "stepper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:", value);

    *(float *)&value = self->_value;
    -[AKFontSizePicker slider](self, "slider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = LODWORD(value);
    objc_msgSend(v9, "setValue:", v10);

    -[AKFontSizePicker _selectSizeInList](self, "_selectSizeInList");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  uint64_t v17;
  void *v18;
  objc_super v20;
  CGPoint v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[AKFontSizePicker style](self, "style") == 1)
  {
    -[AKFontSizePicker stepper](self, "stepper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v22.origin.x = v10;
    v22.origin.y = v12;
    v22.size.width = v14;
    v22.size.height = v16;
    v21.x = x;
    v21.y = y;
    if (!CGRectContainsPoint(v22, v21))
    {
      v18 = 0;
      goto LABEL_7;
    }
    -[AKFontSizePicker stepper](self, "stepper");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)AKFontSizePicker;
    -[AKFontSizePicker hitTest:withEvent:](&v20, sel_hitTest_withEvent_, v7, x, y);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
LABEL_7:

  return v18;
}

- (void)_handleValueChanged:(id)a3
{
  float v4;

  objc_msgSend(a3, "value");
  -[AKFontSizePicker setValue:](self, "setValue:", v4);
  -[AKFontSizePicker sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)_sliderTouchDown:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[AKFontSizePicker willBeginTrackingUpdates](self, "willBeginTrackingUpdates", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKFontSizePicker willBeginTrackingUpdates](self, "willBeginTrackingUpdates");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)_sliderTouchUp:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[AKFontSizePicker didEndTrackingUpdates](self, "didEndTrackingUpdates", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKFontSizePicker didEndTrackingUpdates](self, "didEndTrackingUpdates");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)_decreaseSize:(id)a3
{
  double v4;
  double v5;
  double v6;

  -[AKFontSizePicker value](self, "value", a3);
  v5 = fmax(v4 + -1.0, 4.0);
  -[AKFontSizePicker value](self, "value");
  if (v5 != v6)
  {
    -[AKFontSizePicker setValue:](self, "setValue:", v5);
    -[AKFontSizePicker sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (void)_increaseSize:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  -[AKFontSizePicker value](self, "value", a3);
  v5 = v4 + 1.0;
  if (v5 <= 200.0)
    v6 = v5;
  else
    v6 = 200.0;
  -[AKFontSizePicker value](self, "value");
  if (v6 != v7)
  {
    -[AKFontSizePicker setValue:](self, "setValue:", v6);
    -[AKFontSizePicker sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (CGSize)_itemSizeInContainer
{
  void *v3;
  void *v4;
  unint64_t v5;
  CGFloat v6;
  double Height;
  double v8;
  CGSize result;
  CGRect v10;
  CGRect v11;

  -[AKFontSizePicker sizeListValues](self, "sizeListValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[AKFontSizePicker frame](self, "frame");
  v6 = (CGRectGetWidth(v10) + (double)v5 * -30.0) / (double)v5 + 30.0;
  -[AKFontSizePicker frame](self, "frame");
  Height = CGRectGetHeight(v11);
  v8 = v6;
  result.height = Height;
  result.width = v8;
  return result;
}

- (void)_selectSizeInList
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  -[AKFontSizePicker sizeList](self, "sizeList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKFontSizePicker sizeListValues](self, "sizeListValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = 0;
      do
      {
        -[AKFontSizePicker sizeListValues](self, "sizeListValues");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (void *)MEMORY[0x24BDD16E0];
        -[AKFontSizePicker value](self, "value");
        objc_msgSend(v9, "numberWithDouble:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "indexOfObject:", v10);

        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v11, v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKFontSizePicker sizeList](self, "sizeList");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "selectItemAtIndexPath:animated:scrollPosition:", v12, 1, 0);

        }
        ++v6;
        -[AKFontSizePicker sizeListValues](self, "sizeListValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

      }
      while (v6 < v15);
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[AKFontSizePicker sizeListValues](self, "sizeListValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  -[AKFontSizePicker setValue:](self, "setValue:");

  -[AKFontSizePicker sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "cellForItemAtIndexPath:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewWithTag:", 1001);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHighlighted:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[AKFontSizePicker sizeListValues](self, "sizeListValues", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[AKFontSizePicker sizeListValues](self, "sizeListValues", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("AnnotationKit.fontSizePickerIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFontSizePicker sizeListValues](self, "sizeListValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "row");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewWithTag:", 1001);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend(v7, "bounds");
    v15 = (void *)objc_msgSend(v14, "initWithFrame:");
    -[AKFontSizePicker tintColor](self, "tintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v16);

    objc_msgSend(v7, "setSelectedBackgroundView:", v15);
    v17 = objc_alloc(MEMORY[0x24BDF6B68]);
    v13 = (void *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "setTextAlignment:", 1);
    objc_msgSend(v13, "setUserInteractionEnabled:", 0);
    objc_msgSend(v13, "setTag:", 1001);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHighlightedTextColor:", v18);

    objc_msgSend(v7, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v13);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v20);

  _NSDictionaryOfVariableBindings(CFSTR("label"), v13, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[label]|"), 0, 0, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v23);

  v24 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[label]|"), 0, 0, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v25);

  return v7;
}

- (double)value
{
  return self->_value;
}

- (id)willBeginTrackingUpdates
{
  return self->_willBeginTrackingUpdates;
}

- (void)setWillBeginTrackingUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (id)didEndTrackingUpdates
{
  return self->_didEndTrackingUpdates;
}

- (void)setDidEndTrackingUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (int64_t)style
{
  return self->_style;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIStepper)stepper
{
  return self->_stepper;
}

- (void)setStepper:(id)a3
{
  objc_storeStrong((id *)&self->_stepper, a3);
}

- (UISlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (UICollectionView)sizeList
{
  return self->_sizeList;
}

- (void)setSizeList:(id)a3
{
  objc_storeStrong((id *)&self->_sizeList, a3);
}

- (NSArray)sizeListValues
{
  return self->_sizeListValues;
}

- (void)setSizeListValues:(id)a3
{
  objc_storeStrong((id *)&self->_sizeListValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeListValues, 0);
  objc_storeStrong((id *)&self->_sizeList, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_stepper, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_didEndTrackingUpdates, 0);
  objc_storeStrong(&self->_willBeginTrackingUpdates, 0);
}

@end

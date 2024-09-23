@implementation AKFillableShapeStylePicker

- (AKFillableShapeStylePicker)initWithFrame:(CGRect)a3 controller:(id)a4
{
  AKFillableShapeStylePicker *v4;
  AKFillableShapeStylePicker *v5;
  NSArray *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  AKToggleButton *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *buttons;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)AKFillableShapeStylePicker;
  v4 = -[AKModernToolbarPicker initWithFrame:controller:](&v24, sel_initWithFrame_controller_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_showFill = 1;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(&unk_24F1CF030, "count"))
    {
      v7 = 0;
      v8 = *MEMORY[0x24BDBF090];
      v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
      do
      {
        objc_msgSend(&unk_24F1CF030, "objectAtIndexedSubscript:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");

        v14 = -[AKToggleButton initWithFrame:templateImage:autoUpdatesColor:]([AKToggleButton alloc], "initWithFrame:templateImage:autoUpdatesColor:", 0, 1, v8, v9, v10, v11);
        -[NSArray addObject:](v6, "addObject:", v14);
        -[AKToggleButton layer](v14, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCornerRadius:", 3.0);

        objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.784313725, 0.780392157, 0.8, 1.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKToggleButton setTintColor:](v14, "setTintColor:", v16);

        -[AKToggleButton setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[AKToggleButton widthAnchor](v14, "widthAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "constraintEqualToConstant:", 36.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setActive:", 1);

        -[AKToggleButton heightAnchor](v14, "heightAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToConstant:", 36.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setActive:", 1);

        -[AKToggleButton addTarget:action:forControlEvents:](v14, "addTarget:action:forControlEvents:", v5, sel__styleButtonPressed_, 64);
        -[AKToggleButton setTag:](v14, "setTag:", v13);
        -[AKModernToolbarPicker stackview](v5, "stackview");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addArrangedSubview:", v14);

        ++v7;
      }
      while (v7 < objc_msgSend(&unk_24F1CF030, "count"));
    }
    buttons = v5->_buttons;
    v5->_buttons = v6;

  }
  return v5;
}

- (void)setShowFill:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  self->_showFill = a3;
  -[AKModernToolbarPicker stackview](self, "stackview");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", !self->_showFill);

}

- (void)_styleButtonPressed:(id)a3
{
  objc_msgSend(a3, "tag");
  MEMORY[0x24BEDD108](self, sel_setCurrentTag_);
}

- (void)revalidateItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AKModernToolbarPicker controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFillableShapeStylePicker _updateImagesForAnnotationType:](self, "_updateImagesForAnnotationType:", v7);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[AKModernToolbarPicker stackview](self, "stackview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "setSelected:", 0);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v11);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (!v15)
  {

LABEL_23:
    -[AKModernToolbarPicker stackview](self, "stackview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "arrangedSubviews");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndex:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKModernToolbarPicker stackview](self, "stackview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrangedSubviews");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndex:", 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKModernToolbarPicker stackview](self, "stackview");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "arrangedSubviews");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndex:", 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "validateSender:", v25);
    objc_msgSend(v5, "validateSender:", v30);
    objc_msgSend(v5, "validateSender:", v33);

    goto LABEL_24;
  }
  v16 = v15;
  v34 = v5;
  v17 = 0;
  v18 = *(_QWORD *)v36;
  do
  {
    for (j = 0; j != v16; ++j)
    {
      if (*(_QWORD *)v36 != v18)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v20, "fillColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21 && CGColorGetAlpha((CGColorRef)objc_msgSend(objc_retainAutorelease(v21), "CGColor")) != 0.0)
          v17 = 1;

      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  }
  while (v16);

  v5 = v34;
  if ((v17 & 1) == 0)
    goto LABEL_23;
  -[AKModernToolbarPicker stackview](self, "stackview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "arrangedSubviews");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndex:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setSelected:", 1);
LABEL_24:

}

- (void)_updateImagesForAnnotationType:(id)a3
{
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
  void **v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[4];
  _QWORD v47[4];
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDF6F30];
  -[AKFillableShapeStylePicker traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v43 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Arrow_Stroke_Thin"), v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v10;
    v11 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Arrow_Stroke_Thin"), v12, v7);
    v49 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Arrow_Stroke_Medium"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v14;
    v15 = (void *)MEMORY[0x24BDF6AC8];
    v16 = (void *)v49;
    +[AKController akBundle](AKController, "akBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Arrow_Stroke_Thick"), v17, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v18;
    v19 = &v48;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v20 = (void *)MEMORY[0x24BDF6AC8];
      +[AKController akBundle](AKController, "akBundle");
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Circle_Filled"), v21, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v10;
      v22 = (void *)MEMORY[0x24BDF6AC8];
      +[AKController akBundle](AKController, "akBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Circle_Stroke_Thin"), v12, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v16;
      v23 = (void *)MEMORY[0x24BDF6AC8];
      +[AKController akBundle](AKController, "akBundle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Circle_Stroke_Medium"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47[2] = v14;
      v24 = (void *)MEMORY[0x24BDF6AC8];
      v9 = (void *)v21;
      +[AKController akBundle](AKController, "akBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Circle_Stroke_Thick"), v17, v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v47[3] = v18;
      v19 = (void **)v47;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v25 = (void *)MEMORY[0x24BDF6AC8];
        +[AKController akBundle](AKController, "akBundle");
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Bubble_Filled"), v26, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = v10;
        v27 = (void *)MEMORY[0x24BDF6AC8];
        +[AKController akBundle](AKController, "akBundle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Bubble_Stroke_Thin"), v12, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v46[1] = v16;
        v28 = (void *)MEMORY[0x24BDF6AC8];
        +[AKController akBundle](AKController, "akBundle");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Bubble_Stroke_Medium"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v46[2] = v14;
        v29 = (void *)MEMORY[0x24BDF6AC8];
        v9 = (void *)v26;
        +[AKController akBundle](AKController, "akBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Bubble_Stroke_Thick"), v17, v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v46[3] = v18;
        v19 = (void **)v46;
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v35 = (void *)MEMORY[0x24BDF6AC8];
        +[AKController akBundle](AKController, "akBundle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v35, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Triangle_Filled"), v9, v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = v10;
          v36 = (void *)MEMORY[0x24BDF6AC8];
          +[AKController akBundle](AKController, "akBundle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Triangle_Stroke_Thin"), v12, v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v45[1] = v16;
          v37 = (void *)MEMORY[0x24BDF6AC8];
          +[AKController akBundle](AKController, "akBundle");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Triangle_Stroke_Medium"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v45[2] = v14;
          v38 = (void *)MEMORY[0x24BDF6AC8];
          +[AKController akBundle](AKController, "akBundle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Triangle_Stroke_Thick"), v17, v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v45[3] = v18;
          v19 = (void **)v45;
        }
        else
        {
          objc_msgSend(v35, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Square_Filled"), v9, v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = v10;
          v39 = (void *)MEMORY[0x24BDF6AC8];
          +[AKController akBundle](AKController, "akBundle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Square_Stroke_Thin"), v12, v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v44[1] = v16;
          v40 = (void *)MEMORY[0x24BDF6AC8];
          +[AKController akBundle](AKController, "akBundle");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Square_Stroke_Medium"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v44[2] = v14;
          v41 = (void *)MEMORY[0x24BDF6AC8];
          +[AKController akBundle](AKController, "akBundle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Square_Stroke_Thick"), v17, v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v44[3] = v18;
          v19 = (void **)v44;
        }
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSArray count](self->_buttons, "count"))
  {
    v31 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setImage:forState:", v33, 0);
      objc_msgSend(v32, "setTemplateImage:", v33);

      ++v31;
    }
    while (v31 < -[NSArray count](self->_buttons, "count"));
  }

}

- (BOOL)showFill
{
  return self->_showFill;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end

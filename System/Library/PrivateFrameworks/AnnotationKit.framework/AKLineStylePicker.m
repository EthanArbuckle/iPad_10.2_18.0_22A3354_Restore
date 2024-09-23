@implementation AKLineStylePicker

- (AKLineStylePicker)initWithFrame:(CGRect)a3 lineType:(unint64_t)a4 controller:(id)a5
{
  AKLineStylePicker *v6;
  AKLineStylePicker *v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  AKToggleButton *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)AKLineStylePicker;
  v6 = -[AKModernToolbarPicker initWithFrame:controller:](&v26, sel_initWithFrame_controller_, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6)
  {
    v6->_lineType = a4;
    v6->_lineStyle = -[AKLineStylePicker _shapeTagForType:](v6, "_shapeTagForType:", a4);
    -[AKLineStylePicker _buttonImagesForType:](v7, "_buttonImagesForType:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
      v10 = *MEMORY[0x24BDBF090];
      v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_24F1CF018, "objectAtIndexedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        v17 = -[AKToggleButton initWithFrame:templateImage:autoUpdatesColor:]([AKToggleButton alloc], "initWithFrame:templateImage:autoUpdatesColor:", v14, 1, v10, v11, v12, v13);
        -[AKToggleButton layer](v17, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setCornerRadius:", 3.0);

        objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.784313725, 0.780392157, 0.8, 1.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKToggleButton setTintColor:](v17, "setTintColor:", v19);

        -[AKToggleButton setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[AKToggleButton widthAnchor](v17, "widthAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "constraintEqualToConstant:", 36.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setActive:", 1);

        -[AKToggleButton heightAnchor](v17, "heightAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constraintEqualToConstant:", 36.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setActive:", 1);

        -[AKToggleButton addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", v7, sel__styleButtonPressed_, 64);
        -[AKToggleButton setImage:forState:](v17, "setImage:forState:", v14, 0);
        -[AKToggleButton setTag:](v17, "setTag:", v16);
        -[AKModernToolbarPicker stackview](v7, "stackview");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addArrangedSubview:", v17);

        ++v9;
      }
      while (v9 < objc_msgSend(v8, "count"));
    }

  }
  return v7;
}

- (void)_styleButtonPressed:(id)a3
{
  objc_msgSend(a3, "tag");
  MEMORY[0x24BEDD108](self, sel_setCurrentTag_);
}

- (int64_t)_shapeTagForType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return qword_229092850[a3];
}

- (id)_buttonImagesForType:(unint64_t)a3
{
  void *v4;
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
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDF6F30];
  -[AKLineStylePicker traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    v17 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_ArrowDouble_Stroke_Thin"), v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_ArrowDouble_Stroke_Medium"), v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v12;
    v19 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_ArrowDouble_Stroke_Thick"), v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v15;
    v16 = v25;
  }
  else if (a3 == 1)
  {
    v20 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Arrow_Stroke_Thin"), v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v9;
    v21 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Arrow_Stroke_Medium"), v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v12;
    v22 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Arrow_Stroke_Thick"), v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v15;
    v16 = v26;
  }
  else
  {
    if (a3)
    {
      v23 = 0;
      goto LABEL_9;
    }
    v7 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Line_Stroke_Thin"), v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v9;
    v10 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Line_Stroke_Medium"), v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v12;
    v13 = (void *)MEMORY[0x24BDF6AC8];
    +[AKController akBundle](AKController, "akBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("AK_Attribute_Line_Stroke_Thick"), v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v15;
    v16 = v27;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v23;
}

- (void)revalidateItems:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;

  -[AKModernToolbarPicker controller](self, "controller", a3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTag:", self->_lineStyle);
  objc_msgSend(v16, "validateSender:", v4);
  v5 = objc_msgSend(v4, "isSelected");
  -[AKModernToolbarPicker stackview](self, "stackview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    do
    {
      -[AKModernToolbarPicker stackview](self, "stackview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setSelected:", 0);
      objc_msgSend(v16, "validateSender:", v12);
      objc_msgSend(v12, "setSelected:", objc_msgSend(v12, "isSelected") & v5);

      ++v9;
      -[AKModernToolbarPicker stackview](self, "stackview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "subviews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

    }
    while (v9 < v15);
  }

}

- (unint64_t)lineType
{
  return self->_lineType;
}

- (int64_t)lineStyle
{
  return self->_lineStyle;
}

@end

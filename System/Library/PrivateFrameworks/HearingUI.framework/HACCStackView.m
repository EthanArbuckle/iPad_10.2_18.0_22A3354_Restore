@implementation HACCStackView

+ (double)separatorHeight
{
  return 0.5;
}

- (void)addArrangedSubview:(id)a3 withSeparator:(BOOL)a4
{
  -[HACCStackView addArrangedSubview:andSeparator:withIndent:withDarkBackground:](self, "addArrangedSubview:andSeparator:withIndent:withDarkBackground:", a3, a4, 0, 0.0);
}

- (void)addArrangedSubview:(id)a3 withPartialSeparator:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  CCUILayoutGutter();
  -[HACCStackView addArrangedSubview:andSeparator:withIndent:withDarkBackground:](self, "addArrangedSubview:andSeparator:withIndent:withDarkBackground:", v6, v4, 0);

}

- (void)addArrangedSubview:(id)a3 withPartialSeparator:(BOOL)a4 withDarkBackground:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  v7 = a3;
  CCUILayoutGutter();
  -[HACCStackView addArrangedSubview:andSeparator:withIndent:withDarkBackground:](self, "addArrangedSubview:andSeparator:withIndent:withDarkBackground:", v7, v5, 1);

}

- (void)addArrangedSubview:(id)a3 andSeparator:(BOOL)a4 withIndent:(double)a5 withDarkBackground:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;
  id v11;

  v6 = a6;
  v8 = a4;
  v10 = a3;
  -[HACCStackView arrangedSubviews](self, "arrangedSubviews");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HACCStackView insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:](self, "insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:", v10, objc_msgSend(v11, "count"), v8, v6, a5);

}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 withSeparator:(BOOL)a5
{
  -[HACCStackView insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:](self, "insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:", a3, a4, a5, 0, 0.0);
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 withPartialSeparator:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = a3;
  CCUILayoutGutter();
  -[HACCStackView insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:](self, "insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:", v8, a4, v5, 0);

}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 withPartialSeparator:(BOOL)a5 withDarkBackground:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  CCUILayoutGutter();
  -[HACCStackView insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:](self, "insertArrangedSubview:atIndex:andSeparator:withIndent:withDarkBackground:", v10, a4, v7, v6);

}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4 andSeparator:(BOOL)a5 withIndent:(double)a6 withDarkBackground:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v9;
  id v12;
  void *v13;
  void *v14;
  id v15;
  HACCCapsuleDarkBackground *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HACCStackView *v40;
  unint64_t v41;
  void *v42;
  objc_super v43;
  objc_super v44;
  objc_super v45;
  _QWORD v46[7];

  v7 = a7;
  v9 = a5;
  v46[5] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v45.receiver = self;
  v45.super_class = (Class)HACCStackView;
  -[HACCStackView insertArrangedSubview:atIndex:](&v45, sel_insertArrangedSubview_atIndex_, v12, a4);
  if (v9)
  {
    v42 = v12;
    objc_getAssociatedObject(v12, &HearingUISeparatorViewKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "removeFromSuperview");
      v44.receiver = self;
      v44.super_class = (Class)HACCStackView;
      -[HACCStackView removeArrangedSubview:](&v44, sel_removeArrangedSubview_, v14);
    }
    v40 = self;
    v41 = a4;
    v15 = objc_alloc_init(MEMORY[0x24BEBDB00]);

    objc_msgSend(v15, "setAutoresizingMask:", 18);
    if (v7)
    {
      v16 = objc_alloc_init(HACCCapsuleDarkBackground);
      -[HACCCapsuleDarkBackground setAutoresizingMask:](v16, "setAutoresizingMask:", 18);
      objc_msgSend(v15, "addSubview:", v16);
      -[HACCCapsuleDarkBackground setupBackgroundVisualStyle](v16, "setupBackgroundVisualStyle");

    }
    v17 = objc_alloc(MEMORY[0x24BEBDB38]);
    objc_msgSend(MEMORY[0x24BEBDAF0], "controlCenterKeyLineOnDarkVibrancyEffect");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithEffect:", v18);

    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "addSubview:", v19);
    v20 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v20;
    objc_msgSend(v20, "setBackgroundColor:", v21);

    objc_msgSend(v19, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v20);

    objc_msgSend(v20, "setAutoresizingMask:", 18);
    v32 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v19, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, a6);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v36;
    objc_msgSend(v19, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v33;
    objc_msgSend(v19, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v24;
    objc_msgSend(v19, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v27;
    objc_msgSend(v15, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[HACCStackView separatorHeight](HACCStackView, "separatorHeight");
    objc_msgSend(v28, "constraintEqualToConstant:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v30);

    v12 = v42;
    objc_msgSend(v15, "setTag:", objc_msgSend(v42, "tag") - 1);
    v43.receiver = v40;
    v43.super_class = (Class)HACCStackView;
    -[HACCStackView insertArrangedSubview:atIndex:](&v43, sel_insertArrangedSubview_atIndex_, v15, v41);
    objc_setAssociatedObject(v42, &HearingUISeparatorViewKey, v15, (void *)1);

  }
}

- (void)removeArrangedSubview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  objc_getAssociatedObject(v4, &HearingUISeparatorViewKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "removeFromSuperview");
    v8.receiver = self;
    v8.super_class = (Class)HACCStackView;
    -[HACCStackView removeArrangedSubview:](&v8, sel_removeArrangedSubview_, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)HACCStackView;
  -[HACCStackView removeArrangedSubview:](&v7, sel_removeArrangedSubview_, v4);

}

@end

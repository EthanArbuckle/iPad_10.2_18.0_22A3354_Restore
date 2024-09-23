@implementation FMBorderedField

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (FMBorderedField)initWithFrame:(CGRect)a3
{
  FMBorderedField *v3;
  FMBorderedField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMBorderedField;
  v3 = -[FMBorderedField initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[FMBorderedField commonSetup](v3, "commonSetup");
  return v4;
}

- (FMBorderedField)initWithCoder:(id)a3
{
  FMBorderedField *v3;
  FMBorderedField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMBorderedField;
  v3 = -[FMBorderedField initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[FMBorderedField commonSetup](v3, "commonSetup");
  return v4;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMBorderedField;
  -[FMBorderedField awakeFromNib](&v3, sel_awakeFromNib);
  -[FMBorderedField commonSetup](self, "commonSetup");
}

- (void)prepareForInterfaceBuilder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMBorderedField;
  -[FMBorderedField prepareForInterfaceBuilder](&v3, sel_prepareForInterfaceBuilder);
  -[FMBorderedField commonSetup](self, "commonSetup");
  -[FMBorderedField setNeedsLayout](self, "setNeedsLayout");
}

- (void)commonSetup
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  FMHorizontalRule *v9;
  FMHorizontalRule *topRule;
  FMHorizontalRule *v11;
  FMHorizontalRule *bottomRule;
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

  if (!self->_isConfigured)
  {
    -[FMBorderedField bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v9 = -[FMRule initWithFrame:]([FMHorizontalRule alloc], "initWithFrame:", v3, v5, v7, 1.0);
    topRule = self->_topRule;
    self->_topRule = v9;

    v11 = -[FMRule initWithFrame:]([FMHorizontalRule alloc], "initWithFrame:", v4, v6, v8, 1.0);
    bottomRule = self->_bottomRule;
    self->_bottomRule = v11;

    -[FMHorizontalRule setTranslatesAutoresizingMaskIntoConstraints:](self->_topRule, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FMHorizontalRule setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomRule, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMHorizontalRule setBackgroundColor:](self->_topRule, "setBackgroundColor:", v13);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMHorizontalRule setBackgroundColor:](self->_bottomRule, "setBackgroundColor:", v14);

    -[FMBorderedField addSubview:](self, "addSubview:", self->_topRule);
    -[FMBorderedField addSubview:](self, "addSubview:", self->_bottomRule);
    -[FMRule setLeading:](self->_topRule, "setLeading:", 1);
    -[FMHorizontalRule topAnchor](self->_topRule, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMBorderedField topAnchor](self, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[FMHorizontalRule leftAnchor](self->_topRule, "leftAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMBorderedField leftAnchor](self, "leftAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    -[FMHorizontalRule rightAnchor](self->_topRule, "rightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMBorderedField rightAnchor](self, "rightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[FMHorizontalRule heightAnchor](self->_topRule, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToConstant:", 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    -[FMHorizontalRule bottomAnchor](self->_bottomRule, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMBorderedField bottomAnchor](self, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActive:", 1);

    -[FMHorizontalRule leftAnchor](self->_bottomRule, "leftAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMBorderedField leftAnchor](self, "leftAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[FMHorizontalRule rightAnchor](self->_bottomRule, "rightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMBorderedField rightAnchor](self, "rightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[FMHorizontalRule heightAnchor](self->_bottomRule, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", 1.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setActive:", 1);

    self->_isConfigured = 1;
  }
}

- (void)setBorderColor:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_borderColor, a3);
  v5 = a3;
  -[FMBorderedField topRule](self, "topRule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v5);

  -[FMBorderedField bottomRule](self, "bottomRule");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v5);

}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (BOOL)isConfigured
{
  return self->_isConfigured;
}

- (void)setIsConfigured:(BOOL)a3
{
  self->_isConfigured = a3;
}

- (FMHorizontalRule)topRule
{
  return self->_topRule;
}

- (void)setTopRule:(id)a3
{
  objc_storeStrong((id *)&self->_topRule, a3);
}

- (FMHorizontalRule)bottomRule
{
  return self->_bottomRule;
}

- (void)setBottomRule:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomRule, 0);
  objc_storeStrong((id *)&self->_topRule, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end

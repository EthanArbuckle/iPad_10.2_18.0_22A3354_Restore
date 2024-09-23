@implementation HACCBatteryGroupView

- (HACCBatteryGroupView)initWithFrame:(CGRect)a3
{
  HACCBatteryGroupView *v3;
  HACCBatteryView *v4;
  HACCBatteryView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HACCBatteryGroupView;
  v3 = -[HACCBatteryGroupView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(HACCBatteryView);
    -[HACCBatteryGroupView addSubview:](v3, "addSubview:", v4);
    -[HACCBatteryView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HACCBatteryGroupView setTopBatteryView:](v3, "setTopBatteryView:", v4);
    v5 = objc_alloc_init(HACCBatteryView);
    -[HACCBatteryGroupView addSubview:](v3, "addSubview:", v5);
    -[HACCBatteryView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HACCBatteryGroupView setBottomBatteryView:](v3, "setBottomBatteryView:", v5);

  }
  return v3;
}

- (void)updateValueForDevice:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "leftBatteryLevel");
  v6 = v5;
  objc_msgSend(v4, "rightBatteryLevel");
  v8 = v7;
  v9 = objc_msgSend(v4, "availableEars");

  -[HACCBatteryGroupView updateValueForLeft:right:andAvailableEars:](self, "updateValueForLeft:right:andAvailableEars:", v9, v6, v8);
}

- (void)updateValueForLeft:(double)a3 right:(double)a4 andAvailableEars:(int)a5
{
  double v6;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  if (a5 == 6)
  {
    if (vabdd_f64(a3, a4) >= 0.05)
    {
      -[HACCBatteryGroupView topBatteryView](self, "topBatteryView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forEar:", 2, a3);

      -[HACCBatteryGroupView bottomBatteryView](self, "bottomBatteryView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setValue:forEar:", 4, v6);

      -[HACCBatteryGroupView bottomBatteryView](self, "bottomBatteryView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHidden:", 0);

      -[HACCBatteryGroupView topBatteryView](self, "topBatteryView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0;
      goto LABEL_9;
    }
  }
  else if (!a5)
  {
    -[HACCBatteryGroupView topBatteryView](self, "topBatteryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    -[HACCBatteryGroupView bottomBatteryView](self, "bottomBatteryView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 1;
LABEL_9:
    objc_msgSend(v10, "setHidden:", v12);
    goto LABEL_10;
  }
  -[HACCBatteryGroupView topBatteryView](self, "topBatteryView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 0);

  -[HACCBatteryGroupView bottomBatteryView](self, "bottomBatteryView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  if (a5 == 2)
    v6 = a3;
  -[HACCBatteryGroupView topBatteryView](self, "topBatteryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forEar:", 6, v6);
LABEL_10:

  -[HACCBatteryGroupView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  void *v3;
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
  int v16;
  const __CFString *v17;
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
  objc_super v30;

  -[HACCBatteryGroupView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCBatteryGroupView removeConstraints:](self, "removeConstraints:", v3);

  v30.receiver = self;
  v30.super_class = (Class)HACCBatteryGroupView;
  -[HACCBatteryGroupView updateConstraints](&v30, sel_updateConstraints);
  -[HACCBatteryGroupView topBatteryView](self, "topBatteryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCBatteryGroupView bottomBatteryView](self, "bottomBatteryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEBE068]) & 1) != 0
     || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEBE060]))
    && (objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsSmallPhone") & 1) == 0)
  {
    v22 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("topView"), v4, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[topView]|"), 0, 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCBatteryGroupView addConstraints:](self, "addConstraints:", v24);

    v25 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("bottomView"), v5, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[bottomView]|"), 0, 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCBatteryGroupView addConstraints:](self, "addConstraints:", v27);

    v28 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("topView, bottomView"), v4, v5, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(0.0)-[topView]-[bottomView]-(0.0)-|"), 0, 0, v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCBatteryGroupView addConstraints:](self, "addConstraints:", v29);

    goto LABEL_9;
  }
  v8 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("topView"), v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[topView]|"), 0, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCBatteryGroupView addConstraints:](self, "addConstraints:", v10);

  v11 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("bottomView"), v5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[bottomView]|"), 0, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCBatteryGroupView addConstraints:](self, "addConstraints:", v13);

  v14 = (void *)MEMORY[0x24BDD1628];
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = objc_msgSend(v5, "isHidden");
  v17 = &stru_24DD62430;
  if (v16)
    v17 = CFSTR("(0.0)");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("V:|[topView]-(0.0)-[bottomView%@]|"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("topView, bottomView"), v4, v5, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", v18, 0, 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCBatteryGroupView addConstraints:](self, "addConstraints:", v20);

  if ((objc_msgSend(v5, "isHidden") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 8, 0, v5, 8, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCBatteryGroupView addConstraint:](self, "addConstraint:", v21);
LABEL_9:

  }
}

- (HACCBatteryView)topBatteryView
{
  return self->_topBatteryView;
}

- (void)setTopBatteryView:(id)a3
{
  objc_storeStrong((id *)&self->_topBatteryView, a3);
}

- (HACCBatteryView)bottomBatteryView
{
  return self->_bottomBatteryView;
}

- (void)setBottomBatteryView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBatteryView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomBatteryView, 0);
  objc_storeStrong((id *)&self->_topBatteryView, 0);
}

@end

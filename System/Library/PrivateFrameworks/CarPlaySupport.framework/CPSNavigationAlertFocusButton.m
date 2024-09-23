@implementation CPSNavigationAlertFocusButton

+ (CPSNavigationAlertFocusButton)buttonWithAction:(id)a3 progressView:(id)a4 isPrimary:(BOOL)a5
{
  id v5;
  id v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  BOOL v44;
  id v45;
  id location[2];
  id v47;
  _QWORD v48[4];
  uint64_t v49;
  id v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v47 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = 0;
  objc_storeStrong(&v45, a4);
  v44 = a5;
  v43 = (id)objc_msgSend(v47, "buttonWithType:");
  v26 = CPSBackgroundColorForAlertAction(location[0], a5);
  objc_msgSend(v43, "setBackgroundColor:");

  v27 = CPSLabelColorForAlertAction(location[0], a5);
  objc_msgSend(v43, "setTitleColor:forState:");

  v28 = CPSLabelColorForAlertAction(location[0], a5);
  objc_msgSend(v43, "setTitleColor:forState:");

  v29 = (id)objc_msgSend(location[0], "title");
  objc_msgSend(v43, "setTitle:forState:");

  v42 = (id)objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77B8], 2, 1);
  v51 = *MEMORY[0x24BDF78A0];
  v30 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7868]);
  v52[0] = v30;
  v41 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);

  v49 = *MEMORY[0x24BDF7770];
  v50 = v41;
  v31 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
  v5 = (id)objc_msgSend(v42, "fontDescriptorByAddingAttributes:");
  v6 = v42;
  v42 = v5;

  v33 = (id)objc_msgSend(v43, "titleLabel");
  v32 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v42, 0.0);
  objc_msgSend(v33, "setFont:");

  v34 = (id)objc_msgSend(v43, "titleLabel");
  objc_msgSend(v34, "setAdjustsFontSizeToFitWidth:", 1);

  v35 = (id)objc_msgSend(v43, "titleLabel");
  objc_msgSend(v35, "setMinimumScaleFactor:", 0.899999976);

  objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v43, "setAlertAction:", location[0]);
  objc_msgSend(v43, "setIsPrimary:", a5);
  v36 = (id)objc_msgSend(v43, "layer");
  objc_msgSend(v36, "setCornerRadius:", 6.0);

  v37 = (id)objc_msgSend(v43, "layer");
  objc_msgSend(v37, "setMaskedCorners:", 15);

  v38 = *MEMORY[0x24BDE58E8];
  v39 = (id)objc_msgSend(v43, "layer");
  objc_msgSend(v39, "setCornerCurve:", v38);

  v40 = (id)objc_msgSend(v43, "layer");
  objc_msgSend(v40, "setMasksToBounds:", 1);

  if (v45)
  {
    objc_msgSend(v43, "setProgressView:", v45);
    objc_msgSend(v43, "addSubview:", v45);
    v9 = (id)objc_msgSend(v43, "titleLabel");
    objc_msgSend(v43, "bringSubviewToFront:");

    v10 = (void *)MEMORY[0x24BDD1628];
    v23 = (id)objc_msgSend(v45, "leadingAnchor");
    v22 = (id)objc_msgSend(v43, "leadingAnchor");
    v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
    v48[0] = v21;
    v20 = (id)objc_msgSend(v45, "trailingAnchor");
    v19 = (id)objc_msgSend(v43, "trailingAnchor");
    v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
    v48[1] = v18;
    v17 = (id)objc_msgSend(v45, "topAnchor");
    v16 = (id)objc_msgSend(v43, "topAnchor");
    v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v48[2] = v15;
    v14 = (id)objc_msgSend(v45, "bottomAnchor");
    v13 = (id)objc_msgSend(v43, "bottomAnchor");
    v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v48[3] = v12;
    v11 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 4);
    objc_msgSend(v10, "activateConstraints:");

  }
  v8 = v43;
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  return (CPSNavigationAlertFocusButton *)v8;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  CPSNavigationAlertFocusButton *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSNavigationAlertFocusButton;
  -[CPSNavigationAlertFocusButton pressesBegan:withEvent:](&v5, sel_pressesBegan_withEvent_, location[0], v6);
  if ((_pressesContainsPressType(location[0], 4) & 1) != 0)
    -[CPSNavigationAlertFocusButton setHighlighted:](v8, "setHighlighted:", 1);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  CPSNavigationAlertFocusButton *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSNavigationAlertFocusButton;
  -[CPSNavigationAlertFocusButton pressesEnded:withEvent:](&v5, sel_pressesEnded_withEvent_, location[0], v6);
  if ((_pressesContainsPressType(location[0], 4) & 1) != 0)
    -[CPSNavigationAlertFocusButton setHighlighted:](v8, "setHighlighted:", 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  CPSNavigationAlertFocusButton *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSNavigationAlertFocusButton;
  -[CPSNavigationAlertFocusButton pressesCancelled:withEvent:](&v5, sel_pressesCancelled_withEvent_, location[0], v6);
  if ((_pressesContainsPressType(location[0], 4) & 1) != 0)
    -[CPSNavigationAlertFocusButton setHighlighted:](v8, "setHighlighted:", 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  CGSizeMake_11();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CPAlertAction)alertAction
{
  return (CPAlertAction *)objc_loadWeakRetained((id *)&self->_alertAction);
}

- (void)setAlertAction:(id)a3
{
  objc_storeWeak((id *)&self->_alertAction, a3);
}

- (CPSNavigationAlertProgressView)progressView
{
  return (CPSNavigationAlertProgressView *)objc_loadWeakRetained((id *)&self->_progressView);
}

- (void)setProgressView:(id)a3
{
  objc_storeWeak((id *)&self->_progressView, a3);
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progressView);
  objc_destroyWeak((id *)&self->_alertAction);
}

@end

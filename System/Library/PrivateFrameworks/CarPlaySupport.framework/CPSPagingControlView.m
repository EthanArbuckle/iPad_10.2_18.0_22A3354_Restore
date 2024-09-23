@implementation CPSPagingControlView

- (CPSPagingControlView)initWithFrame:(CGRect)a3
{
  CPSPagingControlView *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
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
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  CPSPagingControlButton *v49;
  CPSPagingControlButton *v50;
  objc_super v51;
  SEL v52;
  CPSPagingControlView *v53;
  CGRect v54;
  _QWORD v55[11];
  _QWORD v56[2];
  _QWORD v57[3];

  v57[2] = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  v52 = a2;
  v53 = 0;
  v51.receiver = self;
  v51.super_class = (Class)CPSPagingControlView;
  v53 = -[CPSPagingControlView initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v53, v53);
  if (v53)
  {
    -[CPSPagingControlView setTranslatesAutoresizingMaskIntoConstraints:](v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v53->_pageIndex = 0;
    v53->_pageCount = 0;
    v50 = +[CPSPagingControlButton buttonWithType:](CPSPagingControlButton, "buttonWithType:");
    -[CPSPagingControlButton setTranslatesAutoresizingMaskIntoConstraints:](v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSPagingControlButton addTarget:action:forControlEvents:](v50, "addTarget:action:forControlEvents:", v53, sel__handlePreviousButton_);
    v7 = CPSLocalizedStringForKey(CFSTR("MAPS_PREVIOUS"));
    v57[0] = v7;
    v6 = CPSLocalizedStringForKey(CFSTR("MAPS_LEFT"));
    v57[1] = v6;
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57);
    -[CPSPagingControlButton setAccessibilityUserInputLabels:](v50, "setAccessibilityUserInputLabels:");

    -[CPSPagingControlView setPreviousButton:](v53, "setPreviousButton:", v50);
    -[CPSPagingControlView addSubview:](v53, "addSubview:", v50);
    v49 = +[CPSPagingControlButton buttonWithType:](CPSPagingControlButton, "buttonWithType:", 0);
    -[CPSPagingControlButton setTranslatesAutoresizingMaskIntoConstraints:](v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSPagingControlButton addTarget:action:forControlEvents:](v49, "addTarget:action:forControlEvents:", v53, sel__handleNextButton_, 0x2000);
    v10 = CPSLocalizedStringForKey(CFSTR("MAPS_NEXT"));
    v56[0] = v10;
    v9 = CPSLocalizedStringForKey(CFSTR("MAPS_RIGHT"));
    v56[1] = v9;
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
    -[CPSPagingControlButton setAccessibilityUserInputLabels:](v49, "setAccessibilityUserInputLabels:");

    -[CPSPagingControlView setNextButton:](v53, "setNextButton:", v49);
    -[CPSPagingControlView addSubview:](v53, "addSubview:", v49);
    v48 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = v48;
    v12 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "monospacedDigitSystemFontOfSize:weight:", 12.0, *MEMORY[0x24BDF7888]);
    objc_msgSend(v11, "setFont:");

    v13 = v48;
    v14 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    objc_msgSend(v13, "setTextColor:");

    objc_msgSend(v48, "setTextAlignment:");
    -[CPSPagingControlView setPositionLabel:](v53, "setPositionLabel:", v48);
    -[CPSPagingControlView addSubview:](v53, "addSubview:", v48);
    v15 = (void *)MEMORY[0x24BDD1628];
    v46 = (id)-[CPSPagingControlView heightAnchor](v53, "heightAnchor");
    v45 = (id)objc_msgSend(v46, "constraintEqualToConstant:");
    v55[0] = v45;
    v44 = (id)-[CPSPagingControlButton centerYAnchor](v50, "centerYAnchor");
    v43 = (id)-[CPSPagingControlView centerYAnchor](v53, "centerYAnchor");
    v42 = (id)objc_msgSend(v44, "constraintEqualToAnchor:");
    v55[1] = v42;
    v41 = (id)objc_msgSend(v48, "centerYAnchor");
    v40 = (id)-[CPSPagingControlView centerYAnchor](v53, "centerYAnchor");
    v39 = (id)objc_msgSend(v41, "constraintEqualToAnchor:");
    v55[2] = v39;
    v38 = (id)-[CPSPagingControlButton centerYAnchor](v49, "centerYAnchor");
    v37 = (id)-[CPSPagingControlView centerYAnchor](v53, "centerYAnchor");
    v36 = (id)objc_msgSend(v38, "constraintEqualToAnchor:");
    v55[3] = v36;
    v35 = (id)-[CPSPagingControlButton leftAnchor](v50, "leftAnchor");
    v34 = (id)-[CPSPagingControlView leftAnchor](v53, "leftAnchor");
    v33 = (id)objc_msgSend(v35, "constraintEqualToAnchor:constant:");
    v55[4] = v33;
    v32 = (id)-[CPSPagingControlView rightAnchor](v53, "rightAnchor");
    v31 = (id)-[CPSPagingControlButton rightAnchor](v49, "rightAnchor");
    v30 = (id)objc_msgSend(v32, "constraintEqualToAnchor:constant:", 20.0);
    v55[5] = v30;
    v29 = (id)objc_msgSend(v48, "centerXAnchor");
    v28 = (id)-[CPSPagingControlView centerXAnchor](v53, "centerXAnchor");
    v27 = (id)objc_msgSend(v29, "constraintEqualToAnchor:");
    v55[6] = v27;
    v26 = (id)-[CPSPagingControlButton rightAnchor](v50, "rightAnchor");
    v25 = (id)objc_msgSend(v48, "leftAnchor");
    v24 = (id)objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:constant:", -2.0);
    v55[7] = v24;
    v23 = (id)-[CPSPagingControlButton leftAnchor](v49, "leftAnchor");
    v22 = (id)objc_msgSend(v48, "rightAnchor");
    v21 = (id)objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", 2.0);
    v55[8] = v21;
    v20 = (id)-[CPSPagingControlButton widthAnchor](v50, "widthAnchor");
    v19 = (id)objc_msgSend(v20, "constraintEqualToConstant:", 22.0);
    v55[9] = v19;
    v18 = (id)-[CPSPagingControlButton widthAnchor](v49, "widthAnchor");
    v17 = (id)objc_msgSend(v18, "constraintEqualToConstant:", 22.0);
    v55[10] = v17;
    v16 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 11);
    objc_msgSend(v15, "activateConstraints:");

    v47 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v47, "setNumberStyle:", 1);
    objc_msgSend(v47, "setUsesGroupingSeparator:", 1);
    -[CPSPagingControlView setNumberFormatter:](v53, "setNumberFormatter:", v47);
    -[CPSPagingControlView _updateImages](v53, "_updateImages");
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v48, 0);
    objc_storeStrong((id *)&v49, 0);
    objc_storeStrong((id *)&v50, 0);
  }
  v4 = v53;
  objc_storeStrong((id *)&v53, 0);
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSPagingControlView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPagingControlView;
  -[CPSPagingControlView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSPagingControlView _updateImages](v5, "_updateImages");
  objc_storeStrong(location, 0);
}

- (void)_updateImages
{
  void *v2;
  id v3;
  id v4;
  UIButton *v5;
  UIButton *v6;
  id v7;
  id v8[2];
  CPSPagingControlView *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = (void *)MEMORY[0x24BDF6AC8];
  v4 = CPSFrameworkBundle();
  v3 = (id)-[CPSPagingControlView traitCollection](v9, "traitCollection");
  v8[0] = (id)objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("LeftChevron"), v4);

  v5 = -[CPSPagingControlView previousButton](v9, "previousButton");
  -[UIButton setImage:forState:](v5, "setImage:forState:", v8[0]);

  v7 = (id)objc_msgSend(v8[0], "imageWithHorizontallyFlippedOrientation");
  v6 = -[CPSPagingControlView nextButton](v9, "nextButton");
  -[UIButton setImage:forState:](v6, "setImage:forState:", v7, 0);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
}

- (void)_update
{
  UIButton *v2;
  int v3;
  UIButton *v4;
  int v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  UILabel *v10;
  UIButton *v11;
  UIButton *v12;
  BOOL v13;
  char v14;
  UIButton *v15;
  char v16;
  UIButton *v17;
  unint64_t v18;
  unint64_t v19;
  id location;
  uint64_t v21;
  int v22;
  int v23;
  id (*v24)(uint64_t, uint64_t);
  void *v25;
  CPSPagingControlView *v26;
  id v27[2];
  CPSPagingControlView *v28;

  v28 = self;
  v27[1] = (id)a2;
  v21 = MEMORY[0x24BDAC760];
  v22 = -1073741824;
  v23 = 0;
  v24 = __31__CPSPagingControlView__update__block_invoke;
  v25 = &unk_24E271070;
  v26 = self;
  v27[0] = (id)MEMORY[0x2207AE654](&v21);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v9 = CPSLocalizedStringForKey(CFSTR("POSITION_IN_TRIP_PREVIEWS_FORMAT_%@_%@"));
  v8 = (id)(*((uint64_t (**)(id, unint64_t))v27[0] + 2))(v27[0], -[CPSPagingControlView pageIndex](v28, "pageIndex") + 1);
  v7 = (id)(*((uint64_t (**)(id, unint64_t))v27[0] + 2))(v27[0], -[CPSPagingControlView pageCount](v28, "pageCount"));
  location = (id)objc_msgSend(v6, "localizedStringWithFormat:", v9, v8, v7);

  v10 = -[CPSPagingControlView positionLabel](v28, "positionLabel");
  -[UILabel setText:](v10, "setText:", location);

  v19 = -[CPSPagingControlView pageIndex](v28, "pageIndex");
  v18 = -[CPSPagingControlView pageCount](v28, "pageCount");
  v11 = -[CPSPagingControlView previousButton](v28, "previousButton");
  -[UIButton setEnabled:](v11, "setEnabled:", v19 != 0);

  v12 = -[CPSPagingControlView nextButton](v28, "nextButton");
  v13 = 0;
  if (v18 > 1)
    v13 = v19 < v18 - 1;
  -[UIButton setEnabled:](v12, "setEnabled:", v13);

  v4 = -[CPSPagingControlView previousButton](v28, "previousButton");
  v16 = 0;
  LOBYTE(v5) = 0;
  if ((-[UIButton isFocused](v4, "isFocused") & 1) != 0)
  {
    v17 = -[CPSPagingControlView previousButton](v28, "previousButton");
    v16 = 1;
    v5 = -[UIButton isEnabled](v17, "isEnabled") ^ 1;
  }
  if ((v16 & 1) != 0)

  if ((v5 & 1) != 0)
    -[CPSPagingControlView setNeedsFocusUpdate](v28, "setNeedsFocusUpdate");
  v2 = -[CPSPagingControlView nextButton](v28, "nextButton");
  v14 = 0;
  LOBYTE(v3) = 0;
  if ((-[UIButton isFocused](v2, "isFocused") & 1) != 0)
  {
    v15 = -[CPSPagingControlView nextButton](v28, "nextButton");
    v14 = 1;
    v3 = -[UIButton isEnabled](v15, "isEnabled") ^ 1;
  }
  if ((v14 & 1) != 0)

  if ((v3 & 1) != 0)
    -[CPSPagingControlView setNeedsFocusUpdate](v28, "setNeedsFocusUpdate");
  objc_storeStrong(&location, 0);
  objc_storeStrong(v27, 0);
  objc_storeStrong((id *)&v26, 0);
}

id __31__CPSPagingControlView__update__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  id v5;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "numberFormatter");
  v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v5 = (id)objc_msgSend(v4, "stringFromNumber:");

  return v5;
}

- (void)enablePageControlsIfNecessary
{
  UIButton *v2;
  UIButton *v3;
  BOOL v4;
  unint64_t v5;
  unint64_t v6;

  v6 = -[CPSPagingControlView pageIndex](self, "pageIndex");
  v5 = -[CPSPagingControlView pageCount](self, "pageCount");
  v2 = -[CPSPagingControlView previousButton](self, "previousButton");
  -[UIButton setEnabled:](v2, "setEnabled:", v6 != 0);

  v3 = -[CPSPagingControlView nextButton](self, "nextButton");
  v4 = 0;
  if (v5 > 1)
    v4 = v6 < v5 - 1;
  -[UIButton setEnabled:](v3, "setEnabled:", v4, v2);

}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
  -[CPSPagingControlView _update](self, "_update");
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
  -[CPSPagingControlView _update](self, "_update");
}

- (void)_handlePreviousButton:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id location[2];
  CPSPagingControlView *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSPagingControlView pageIndex](v6, "pageIndex");
  if (v4)
    v3 = v4 - 1;
  else
    v3 = 0;
  -[CPSPagingControlView setPageIndex:](v6, "setPageIndex:", v3);
  -[CPSPagingControlView _invokeDelegateForPageIndex:](v6, "_invokeDelegateForPageIndex:", v3);
  objc_storeStrong(location, 0);
}

- (void)_handleNextButton:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id location[2];
  CPSPagingControlView *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSPagingControlView pageIndex](v7, "pageIndex");
  if (v5 >= -[CPSPagingControlView pageCount](v7, "pageCount") - 1)
    v3 = v5;
  else
    v3 = v5 + 1;
  v4 = v3;
  -[CPSPagingControlView setPageIndex:](v7, "setPageIndex:", v3, v3);
  -[CPSPagingControlView _invokeDelegateForPageIndex:](v7, "_invokeDelegateForPageIndex:", v4);
  objc_storeStrong(location, 0);
}

- (void)_invokeDelegateForPageIndex:(unint64_t)a3
{
  CPSPageControlling *v3;
  CPSPageControlling *v4;
  char v5;

  v4 = -[CPSPagingControlView pagingDelegate](self, "pagingDelegate");
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSPagingControlView pagingDelegate](self, "pagingDelegate");
    -[CPSPageControlling pagingControlView:didSelectPageIndex:](v3, "pagingControlView:didSelectPageIndex:", self, a3);

  }
}

- (id)_linearFocusItems
{
  id v3;
  UIButton *v4;
  UIButton *v5;
  char v6;
  UIButton *v7;
  UIButton *v8;
  char v9;
  id v10[2];
  CPSPagingControlView *v11;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = -[CPSPagingControlView previousButton](v11, "previousButton");
  v9 = -[UIButton isEnabled](v8, "isEnabled");

  if ((v9 & 1) != 0)
  {
    v7 = -[CPSPagingControlView previousButton](v11, "previousButton");
    objc_msgSend(v10[0], "addObject:");

  }
  v5 = -[CPSPagingControlView nextButton](v11, "nextButton");
  v6 = -[UIButton isEnabled](v5, "isEnabled");

  if ((v6 & 1) != 0)
  {
    v4 = -[CPSPagingControlView nextButton](v11, "nextButton");
    objc_msgSend(v10[0], "addObject:");

  }
  v3 = v10[0];
  objc_storeStrong(v10, 0);
  return v3;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (UIButton)previousButton
{
  return self->_previousButton;
}

- (void)setPreviousButton:(id)a3
{
  objc_storeStrong((id *)&self->_previousButton, a3);
}

- (UIButton)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextButton, a3);
}

- (CPSPageControlling)pagingDelegate
{
  return (CPSPageControlling *)objc_loadWeakRetained((id *)&self->_pagingDelegate);
}

- (void)setPagingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pagingDelegate, a3);
}

- (UILabel)positionLabel
{
  return self->_positionLabel;
}

- (void)setPositionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_positionLabel, a3);
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_positionLabel, 0);
  objc_destroyWeak((id *)&self->_pagingDelegate);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_previousButton, 0);
}

@end

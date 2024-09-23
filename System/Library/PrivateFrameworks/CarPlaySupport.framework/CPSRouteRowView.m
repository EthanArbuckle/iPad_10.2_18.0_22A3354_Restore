@implementation CPSRouteRowView

- (CPSRouteRowView)initWithFrame:(CGRect)a3
{
  id v3;
  double v4;
  id v5;
  double v6;
  CPSRouteRowView *v8;
  id v9;
  id v10;
  id v11;
  CPSAbridgableLabel *v12;
  id v13;
  CPSAbridgableLabel *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
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
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id obj;
  CPSAbridgableLabel *v69;
  id v70;
  id v71;
  CPSInvisibleButton *v72;
  id v73;
  objc_super v74;
  SEL v75;
  CPSRouteRowView *v76;
  CGRect v77;
  _QWORD v78[17];

  v78[16] = *MEMORY[0x24BDAC8D0];
  v77 = a3;
  v75 = a2;
  v76 = 0;
  v74.receiver = self;
  v74.super_class = (Class)CPSRouteRowView;
  v76 = -[CPSRouteRowView initWithFrame:](&v74, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v76, v76);
  if (v76)
  {
    -[CPSRouteRowView setTranslatesAutoresizingMaskIntoConstraints:](v76, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSRouteRowView setClipsToBounds:](v76, "setClipsToBounds:", 1);
    v3 = objc_alloc(MEMORY[0x24BDF6F90]);
    v73 = (id)objc_msgSend(v3, "initWithFrame:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
    objc_msgSend(v73, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = v73;
    v10 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    objc_msgSend(v9, "setBackgroundColor:");

    -[CPSRouteRowView addSubview:](v76, "addSubview:", v73);
    objc_msgSend(v73, "setHidden:", 1);
    objc_storeStrong((id *)&v76->_focusBackground, v73);
    v72 = +[CPSInvisibleButton buttonWithType:](CPSInvisibleButton, "buttonWithType:");
    -[CPSInvisibleButton setTranslatesAutoresizingMaskIntoConstraints:](v72, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSInvisibleButton addTarget:action:forControlEvents:](v72, "addTarget:action:forControlEvents:", v76, sel_handleRowSelection_, 0x2000);
    objc_storeStrong((id *)&v76->_rowButton, v72);
    v71 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    objc_msgSend(v71, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&v76->_checkmarkView, v71);
    objc_msgSend(v71, "setUserInteractionEnabled:", 0);
    v11 = (id)objc_msgSend(v71, "layer");
    objc_msgSend(v11, "setCornerRadius:", 11.0);

    objc_msgSend(v71, "setContentCompressionResistancePriority:forAxis:");
    LODWORD(v4) = 1148846080;
    objc_msgSend(v71, "setContentCompressionResistancePriority:forAxis:", 0, v4);
    objc_msgSend(v71, "setContentMode:");
    -[CPSInvisibleButton addSubview:](v72, "addSubview:", v71);
    v5 = objc_alloc(MEMORY[0x24BDF6DD0]);
    v70 = (id)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v70, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v70, "setAxis:", 1);
    objc_msgSend(v70, "setSpacing:", -1.0);
    objc_msgSend(v70, "setAlignment:", 1);
    -[CPSInvisibleButton addSubview:](v72, "addSubview:", v70);
    objc_storeStrong((id *)&v76->_labelStackView, v70);
    v69 = objc_alloc_init(CPSAbridgableLabel);
    v12 = v69;
    v13 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 16.0, *MEMORY[0x24BDF7890]);
    -[CPSAbridgableLabel setFont:](v12, "setFont:");

    -[CPSAbridgableLabel setTextAlignment:](v69, "setTextAlignment:", 4);
    v14 = v69;
    v15 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    -[CPSAbridgableLabel setTextColor:](v14, "setTextColor:");

    -[CPSAbridgableLabel setTranslatesAutoresizingMaskIntoConstraints:](v69, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v6) = 1148846080;
    -[CPSAbridgableLabel setContentCompressionResistancePriority:forAxis:](v69, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    objc_storeStrong((id *)&v76->_title, v69);
    objc_msgSend(v70, "addArrangedSubview:", v76->_title);
    obj = objc_alloc_init(CPSAbridgableLabel);
    v16 = obj;
    v17 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BDF7888]);
    objc_msgSend(v16, "setFont:");

    objc_msgSend(obj, "setTextAlignment:", 4);
    v18 = obj;
    v19 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    objc_msgSend(v18, "setTextColor:");

    objc_msgSend(obj, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(obj, "setNumberOfLines:", 0);
    objc_storeStrong((id *)&v76->_detail, obj);
    objc_msgSend(v70, "addArrangedSubview:", v76->_detail);
    -[CPSRouteRowView addSubview:](v76, "addSubview:", v72);
    v20 = (void *)MEMORY[0x24BDD1628];
    v67 = (id)-[CPSInvisibleButton leadingAnchor](v72, "leadingAnchor");
    v66 = (id)-[CPSRouteRowView leadingAnchor](v76, "leadingAnchor");
    v65 = (id)objc_msgSend(v67, "constraintEqualToAnchor:");
    v78[0] = v65;
    v64 = (id)-[CPSInvisibleButton trailingAnchor](v72, "trailingAnchor");
    v63 = (id)-[CPSRouteRowView trailingAnchor](v76, "trailingAnchor");
    v62 = (id)objc_msgSend(v64, "constraintEqualToAnchor:");
    v78[1] = v62;
    v61 = (id)-[CPSInvisibleButton topAnchor](v72, "topAnchor");
    v60 = (id)-[CPSRouteRowView topAnchor](v76, "topAnchor");
    v59 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
    v78[2] = v59;
    v58 = (id)-[CPSInvisibleButton bottomAnchor](v72, "bottomAnchor");
    v57 = (id)-[CPSRouteRowView bottomAnchor](v76, "bottomAnchor");
    v56 = (id)objc_msgSend(v58, "constraintEqualToAnchor:");
    v78[3] = v56;
    v55 = (id)objc_msgSend(v71, "trailingAnchor");
    v54 = (id)-[CPSInvisibleButton trailingAnchor](v72, "trailingAnchor");
    v53 = (id)objc_msgSend(v55, "constraintEqualToAnchor:constant:");
    v78[4] = v53;
    v52 = (id)objc_msgSend(v71, "centerYAnchor");
    v51 = (id)-[CPSInvisibleButton centerYAnchor](v72, "centerYAnchor");
    v50 = (id)objc_msgSend(v52, "constraintEqualToAnchor:");
    v78[5] = v50;
    v49 = (id)objc_msgSend(v71, "heightAnchor");
    v48 = (id)objc_msgSend(v49, "constraintEqualToConstant:");
    v78[6] = v48;
    v47 = (id)objc_msgSend(v71, "widthAnchor");
    v46 = (id)objc_msgSend(v47, "constraintEqualToConstant:", 22.0);
    v78[7] = v46;
    v45 = (id)objc_msgSend(v70, "centerYAnchor");
    v44 = (id)-[CPSRouteRowView centerYAnchor](v76, "centerYAnchor");
    v43 = (id)objc_msgSend(v45, "constraintEqualToAnchor:");
    v78[8] = v43;
    v42 = (id)objc_msgSend(v70, "trailingAnchor");
    v41 = (id)objc_msgSend(v71, "leadingAnchor");
    v40 = (id)objc_msgSend(v42, "constraintEqualToAnchor:constant:", -8.0);
    v78[9] = v40;
    v39 = (id)objc_msgSend(v70, "leadingAnchor");
    v38 = (id)-[CPSRouteRowView leadingAnchor](v76, "leadingAnchor");
    v37 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:", 8.0);
    v78[10] = v37;
    v36 = (id)objc_msgSend(v70, "heightAnchor");
    v35 = (id)-[CPSRouteRowView heightAnchor](v76, "heightAnchor");
    v34 = (id)objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:multiplier:", 1.0);
    v78[11] = v34;
    v33 = (id)objc_msgSend(v73, "topAnchor");
    v32 = (id)-[CPSRouteRowView topAnchor](v76, "topAnchor");
    v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
    v78[12] = v31;
    v30 = (id)objc_msgSend(v73, "bottomAnchor");
    v29 = (id)-[CPSRouteRowView bottomAnchor](v76, "bottomAnchor");
    v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
    v78[13] = v28;
    v27 = (id)objc_msgSend(v73, "leftAnchor");
    v26 = (id)-[CPSRouteRowView leftAnchor](v76, "leftAnchor");
    v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
    v78[14] = v25;
    v24 = (id)objc_msgSend(v73, "rightAnchor");
    v23 = (id)-[CPSRouteRowView rightAnchor](v76, "rightAnchor");
    v22 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v78[15] = v22;
    v21 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 16);
    objc_msgSend(v20, "activateConstraints:");

    objc_storeStrong(&obj, 0);
    objc_storeStrong((id *)&v69, 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
    objc_storeStrong((id *)&v72, 0);
    objc_storeStrong(&v73, 0);
  }
  -[CPSRouteRowView _updateAppearance](v76, "_updateAppearance");
  v8 = v76;
  objc_storeStrong((id *)&v76, 0);
  return v8;
}

- (void)traitCollectionDidChange:(id)a3
{
  id location[2];
  CPSRouteRowView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSRouteRowView _updateAppearance](v4, "_updateAppearance");
  objc_storeStrong(location, 0);
}

- (void)handleRowSelection:(id)a3
{
  CPSRouteRowView *v3;
  CPRouteChoice *v4;
  id v5;
  id location[2];
  CPSRouteRowView *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSRouteRowView interactionDelegate](v7, "interactionDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = v7;
    v4 = -[CPSRouteRowView representedRouteChoice](v7, "representedRouteChoice");
    objc_msgSend(v5, "didSelectRow:representingRouteChoice:", v3);

  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setRepresentedRouteChoice:(id)a3
{
  id v3;
  CPSAbridgableLabel *v4;
  id v5;
  BOOL v6;
  id v7;
  CPSAbridgableLabel *v8;
  id v9;
  CPSAbridgableLabel *v10;
  id v11;
  BOOL v12;
  char v13;
  id v14;
  char v15;
  id v16;
  id location[2];
  CPSRouteRowView *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v18->_representedRouteChoice, location[0]);
  v10 = -[CPSRouteRowView title](v18, "title");
  v9 = (id)objc_msgSend(location[0], "summaryVariants");
  -[CPSAbridgableLabel setTextVariants:](v10, "setTextVariants:");

  v11 = (id)objc_msgSend(location[0], "selectionSummaryVariants");
  v15 = 0;
  v12 = 0;
  if (v11)
  {
    v16 = (id)objc_msgSend(location[0], "selectionSummaryVariants");
    v15 = 1;
    v12 = objc_msgSend(v16, "count") != 0;
  }
  if ((v15 & 1) != 0)

  if (v12)
  {
    v8 = -[CPSRouteRowView detail](v18, "detail");
    v7 = (id)objc_msgSend(location[0], "selectionSummaryVariants");
    -[CPSAbridgableLabel setTextVariants:](v8, "setTextVariants:");

  }
  else
  {
    v5 = (id)objc_msgSend(location[0], "additionalInformationVariants");
    v13 = 0;
    v6 = 0;
    if (v5)
    {
      v14 = (id)objc_msgSend(location[0], "additionalInformationVariants");
      v13 = 1;
      v6 = objc_msgSend(v14, "count") != 0;
    }
    if ((v13 & 1) != 0)

    if (v6)
    {
      v4 = -[CPSRouteRowView detail](v18, "detail");
      v3 = (id)objc_msgSend(location[0], "additionalInformationVariants");
      -[CPSAbridgableLabel setTextVariants:](v4, "setTextVariants:");

    }
  }
  objc_storeStrong(location, 0);
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[CPSRouteRowView _updateAppearance](self, "_updateAppearance");
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5;
  id location[2];
  CPSRouteRowView *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[CPSRouteRowView _updateAppearance](v7, "_updateAppearance");
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateAppearance
{
  UIImageView *v2;
  id v3;
  UIImageView *v4;
  uint64_t v5;
  id v6;
  UIImageView *v7;
  uint64_t v8;
  id v9;
  UIImageView *v10;
  id v11;
  UIImageView *v12;
  id v13;
  BOOL v14;
  void *v15;
  UIImageView *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  UIImageView *v22;
  id v23;
  UIImageView *v24;
  id v25;
  UIImageView *v26;
  UIView *v27;
  id v28;
  CPSAbridgableLabel *v29;
  id v30;
  CPSAbridgableLabel *v31;
  UIView *v32;
  id v33;
  CPSAbridgableLabel *v34;
  id v35;
  CPSAbridgableLabel *v36;
  CPSInvisibleButton *v37;
  char v38;
  char v39;
  id v40;
  char v41;
  id v42;
  char v43;
  id v44;
  char v45;
  id v46;
  char v47;
  id v48;
  char v49;
  id v50;
  char v51;
  id v52;
  char v53;
  id v54;

  v37 = -[CPSRouteRowView rowButton](self, "rowButton");
  v38 = -[CPSInvisibleButton isFocused](v37, "isFocused");

  if ((v38 & 1) != 0)
  {
    v32 = -[CPSRouteRowView focusBackground](self, "focusBackground");
    -[UIView setHidden:](v32, "setHidden:", 0);

    v34 = -[CPSRouteRowView title](self, "title");
    v33 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    -[CPSAbridgableLabel setTextColor:](v34, "setTextColor:");

    v36 = -[CPSRouteRowView detail](self, "detail");
    v35 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    -[CPSAbridgableLabel setTextColor:](v36, "setTextColor:");

  }
  else
  {
    v27 = -[CPSRouteRowView focusBackground](self, "focusBackground");
    -[UIView setHidden:](v27, "setHidden:", 1);

    v29 = -[CPSRouteRowView title](self, "title");
    v28 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    -[CPSAbridgableLabel setTextColor:](v29, "setTextColor:");

    v31 = -[CPSRouteRowView detail](self, "detail");
    v30 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    -[CPSAbridgableLabel setTextColor:](v31, "setTextColor:");

  }
  if (-[CPSRouteRowView isSelected](self, "isSelected"))
  {
    v26 = -[CPSRouteRowView checkmarkView](self, "checkmarkView");
    v53 = 0;
    v51 = 0;
    if ((v38 & 1) != 0)
    {
      v54 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
      v53 = 1;
      v25 = v54;
    }
    else
    {
      v52 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
      v51 = 1;
      v25 = v52;
    }
    -[UIImageView setBackgroundColor:](v26, "setBackgroundColor:", v25);
    if ((v51 & 1) != 0)

    if ((v53 & 1) != 0)
    v24 = -[CPSRouteRowView checkmarkView](self, "checkmarkView");
    v49 = 0;
    v47 = 0;
    if ((v38 & 1) != 0)
    {
      v50 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
      v49 = 1;
      v23 = v50;
    }
    else
    {
      v48 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
      v47 = 1;
      v23 = v48;
    }
    -[UIImageView setTintColor:](v24, "setTintColor:", v23);
    if ((v47 & 1) != 0)

    if ((v49 & 1) != 0)
    v15 = (void *)MEMORY[0x24BDF6AC8];
    v20 = CPSFrameworkBundle();
    v19 = (id)-[CPSRouteRowView traitCollection](self, "traitCollection");
    v18 = (id)objc_msgSend(v15, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("checkmark"), v20);
    v17 = (id)objc_msgSend(v18, "imageWithRenderingMode:", 2);
    v16 = -[CPSRouteRowView checkmarkView](self, "checkmarkView");
    -[UIImageView setImage:](v16, "setImage:", v17);

    v22 = -[CPSRouteRowView checkmarkView](self, "checkmarkView");
    v21 = (id)-[UIImageView layer](v22, "layer");
    objc_msgSend(v21, "setBorderWidth:", 0.0);

  }
  else
  {
    v10 = -[CPSRouteRowView checkmarkView](self, "checkmarkView");
    v9 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    -[UIImageView setBackgroundColor:](v10, "setBackgroundColor:");

    v12 = -[CPSRouteRowView checkmarkView](self, "checkmarkView");
    v11 = (id)-[UIImageView layer](v12, "layer");
    objc_msgSend(v11, "setBorderWidth:", 1.0);

    v13 = (id)-[CPSRouteRowView traitCollection](self, "traitCollection");
    v14 = objc_msgSend(v13, "userInterfaceStyle") != 1;

    if (v14)
    {
      v41 = 0;
      v39 = 0;
      if ((v38 & 1) != 0)
      {
        v42 = (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v41 = 1;
        v5 = objc_msgSend(objc_retainAutorelease(v42), "CGColor");
      }
      else
      {
        v40 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_externalSystemGrayColor");
        v39 = 1;
        v5 = objc_msgSend(objc_retainAutorelease(v40), "CGColor");
      }
      v4 = -[CPSRouteRowView checkmarkView](self, "checkmarkView");
      v3 = (id)-[UIImageView layer](v4, "layer");
      objc_msgSend(v3, "setBorderColor:", v5);

      if ((v39 & 1) != 0)
      if ((v41 & 1) != 0)

    }
    else
    {
      v45 = 0;
      v43 = 0;
      if ((v38 & 1) != 0)
      {
        v46 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
        v45 = 1;
        v8 = objc_msgSend(objc_retainAutorelease(v46), "CGColor");
      }
      else
      {
        v44 = (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v43 = 1;
        v8 = objc_msgSend(objc_retainAutorelease(v44), "CGColor");
      }
      v7 = -[CPSRouteRowView checkmarkView](self, "checkmarkView");
      v6 = (id)-[UIImageView layer](v7, "layer");
      objc_msgSend(v6, "setBorderColor:", v8);

      if ((v43 & 1) != 0)
      if ((v45 & 1) != 0)

    }
    v2 = -[CPSRouteRowView checkmarkView](self, "checkmarkView");
    -[UIImageView setImage:](v2, "setImage:", 0);

  }
}

- (CPRouteChoice)representedRouteChoice
{
  return self->_representedRouteChoice;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (CPSAbridgableLabel)title
{
  return self->_title;
}

- (CPSAbridgableLabel)detail
{
  return self->_detail;
}

- (UIView)focusBackground
{
  return self->_focusBackground;
}

- (void)setFocusBackground:(id)a3
{
  objc_storeStrong((id *)&self->_focusBackground, a3);
}

- (CPSInvisibleButton)rowButton
{
  return self->_rowButton;
}

- (void)setRowButton:(id)a3
{
  objc_storeStrong((id *)&self->_rowButton, a3);
}

- (CPSRouteRowInteracting)interactionDelegate
{
  return (CPSRouteRowInteracting *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_rowButton, 0);
  objc_storeStrong((id *)&self->_focusBackground, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_representedRouteChoice, 0);
}

@end

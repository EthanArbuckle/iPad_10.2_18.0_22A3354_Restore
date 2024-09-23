@implementation CPSDashboardManeuversCardView

- (CPSDashboardManeuversCardView)initWithFrame:(CGRect)a3
{
  CPSDashboardManeuversCardView *v4;
  objc_super v5;
  SEL v6;
  CPSDashboardManeuversCardView *v7;
  CGRect v8;

  v8 = a3;
  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CPSDashboardManeuversCardView;
  v7 = -[CPSDashboardManeuversCardView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v7, v7);
  if (v7)
    -[CPSDashboardManeuversCardView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CPSPrimaryManeuverView *v9;
  char v10;
  CPSDashboardSecondaryManeuverView *v11;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;
  CGRect v18;

  -[CPSDashboardManeuversCardView bounds](self, "bounds");
  CGRectGetWidth(v18);
  CGSizeMake_4();
  v13 = v2;
  v14 = v3;
  v9 = -[CPSDashboardManeuversCardView primaryManeuverView](self, "primaryManeuverView");
  -[CPSPrimaryManeuverView bounds](v9, "bounds");
  v15 = v14 + v4;

  v10 = 0;
  if (-[CPSDashboardManeuversCardView showSecondaryManeuverView](self, "showSecondaryManeuverView"))
  {
    v11 = -[CPSDashboardManeuversCardView secondaryManeuverView](self, "secondaryManeuverView");
    v10 = 1;
    -[CPSDashboardSecondaryManeuverView bounds](v11, "bounds");
    v8 = v5;
  }
  else
  {
    v8 = 0.0;
  }
  v16 = v15 + v8;
  if ((v10 & 1) != 0)

  v6 = v13;
  v7 = v16;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_updateConstraints
{
  id *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  CPSPrimaryManeuverView *v7;
  id v8;
  NSArray *v9;
  id v10;
  id v11;
  id v12;
  CPSDashboardSecondaryManeuverView *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CPSDashboardSecondaryManeuverView *v18;
  id v19;
  id v20;
  id v21;
  CPSDashboardSecondaryManeuverView *v22;
  id v23;
  id v24;
  id v25;
  CPSDashboardSecondaryManeuverView *v26;
  id v27;
  id v28;
  CPSDashboardSecondaryManeuverView *v29;
  id v30;
  CPSPrimaryManeuverView *v31;
  void *v32;
  NSArray *v33;
  NSArray *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  CPSPrimaryManeuverView *v39;
  id v40;
  id v41;
  id v42;
  CPSPrimaryManeuverView *v43;
  id v44;
  id v45;
  id v46;
  CPSPrimaryManeuverView *v47;
  CPSDashboardSecondaryManeuverView *v48;
  CPSPrimaryManeuverView *v49;
  id v50;
  id v51[2];
  CPSDashboardManeuversCardView *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  _QWORD v56[4];

  v56[3] = *MEMORY[0x24BDAC8D0];
  v52 = self;
  v51[1] = (id)a2;
  v49 = -[CPSDashboardManeuversCardView primaryManeuverView](self, "primaryManeuverView");

  if (v49)
  {
    v51[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v47 = -[CPSDashboardManeuversCardView primaryManeuverView](v52, "primaryManeuverView");
    v46 = (id)-[CPSPrimaryManeuverView topAnchor](v47, "topAnchor");
    v45 = (id)-[CPSDashboardManeuversCardView topAnchor](v52, "topAnchor");
    v44 = (id)objc_msgSend(v46, "constraintEqualToAnchor:constant:", 0.0);
    v56[0] = v44;
    v43 = -[CPSDashboardManeuversCardView primaryManeuverView](v52, "primaryManeuverView");
    v42 = (id)-[CPSPrimaryManeuverView leadingAnchor](v43, "leadingAnchor");
    v41 = (id)-[CPSDashboardManeuversCardView leadingAnchor](v52, "leadingAnchor");
    v40 = (id)objc_msgSend(v42, "constraintEqualToAnchor:");
    v56[1] = v40;
    v39 = -[CPSDashboardManeuversCardView primaryManeuverView](v52, "primaryManeuverView");
    v38 = (id)-[CPSPrimaryManeuverView trailingAnchor](v39, "trailingAnchor");
    v37 = (id)-[CPSDashboardManeuversCardView trailingAnchor](v52, "trailingAnchor");
    v36 = (id)objc_msgSend(v38, "constraintEqualToAnchor:");
    v56[2] = v36;
    v35 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 3);
    objc_msgSend(v51[0], "addObjectsFromArray:");

    v48 = -[CPSDashboardManeuversCardView secondaryManeuverView](v52, "secondaryManeuverView");
    if (v48)
    {
      v34 = -[CPSDashboardManeuversCardView secondaryManeveuverConstraints](v52, "secondaryManeveuverConstraints");

      if (v34)
      {
        v32 = (void *)MEMORY[0x24BDD1628];
        v33 = -[CPSDashboardManeuversCardView secondaryManeveuverConstraints](v52, "secondaryManeveuverConstraints");
        objc_msgSend(v32, "deactivateConstraints:");

        -[CPSDashboardManeuversCardView setSecondaryManeveuverConstraints:](v52, "setSecondaryManeveuverConstraints:", 0);
      }
      v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v31 = -[CPSDashboardManeuversCardView primaryManeuverView](v52, "primaryManeuverView");
      v30 = (id)-[CPSPrimaryManeuverView bottomAnchor](v31, "bottomAnchor");
      v29 = -[CPSDashboardManeuversCardView secondaryManeuverView](v52, "secondaryManeuverView");
      v28 = (id)-[CPSDashboardSecondaryManeuverView topAnchor](v29, "topAnchor");
      v27 = (id)objc_msgSend(v30, "constraintEqualToAnchor:constant:", 0.0);
      v55[0] = v27;
      v26 = -[CPSDashboardManeuversCardView secondaryManeuverView](v52, "secondaryManeuverView");
      v25 = (id)-[CPSDashboardSecondaryManeuverView leadingAnchor](v26, "leadingAnchor");
      v24 = (id)-[CPSDashboardManeuversCardView leadingAnchor](v52, "leadingAnchor");
      v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
      v55[1] = v23;
      v22 = -[CPSDashboardManeuversCardView secondaryManeuverView](v52, "secondaryManeuverView");
      v21 = (id)-[CPSDashboardSecondaryManeuverView trailingAnchor](v22, "trailingAnchor");
      v20 = (id)-[CPSDashboardManeuversCardView trailingAnchor](v52, "trailingAnchor");
      v19 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
      v55[2] = v19;
      v18 = -[CPSDashboardManeuversCardView secondaryManeuverView](v52, "secondaryManeuverView");
      v17 = (id)-[CPSDashboardSecondaryManeuverView bottomAnchor](v18, "bottomAnchor");
      v16 = (id)-[CPSDashboardManeuversCardView bottomAnchor](v52, "bottomAnchor");
      v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
      v55[3] = v15;
      v14 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 4);
      objc_msgSend(v50, "addObjectsFromArray:");

      if (!-[CPSDashboardManeuversCardView showSecondaryManeuverView](v52, "showSecondaryManeuverView"))
      {
        v13 = -[CPSDashboardManeuversCardView secondaryManeuverView](v52, "secondaryManeuverView");
        v12 = (id)-[CPSDashboardSecondaryManeuverView heightAnchor](v13, "heightAnchor");
        v11 = (id)objc_msgSend(v12, "constraintEqualToConstant:", 0.0);
        v54 = v11;
        v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
        objc_msgSend(v50, "addObjectsFromArray:");

      }
      -[CPSDashboardManeuversCardView setSecondaryManeveuverConstraints:](v52, "setSecondaryManeveuverConstraints:", v50);
      v8 = v51[0];
      v9 = -[CPSDashboardManeuversCardView secondaryManeveuverConstraints](v52, "secondaryManeveuverConstraints");
      objc_msgSend(v8, "addObjectsFromArray:");

      objc_storeStrong(&v50, 0);
    }
    else
    {
      v7 = -[CPSDashboardManeuversCardView primaryManeuverView](v52, "primaryManeuverView");
      v6 = (id)-[CPSPrimaryManeuverView bottomAnchor](v7, "bottomAnchor");
      v5 = (id)-[CPSDashboardManeuversCardView bottomAnchor](v52, "bottomAnchor");
      v4 = (id)objc_msgSend(v6, "constraintEqualToAnchor:constant:", 0.0);
      v53 = v4;
      v3 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
      objc_msgSend(v51[0], "addObjectsFromArray:");

    }
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v51[0], v51);
    objc_storeStrong(v2, 0);
  }
}

- (void)_updateStyleOverridesForSubviews
{
  id v2;
  UIColor *v3;
  CPManeuver *v4;
  CPSPrimaryManeuverView *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  CPSDashboardSecondaryManeuverView *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  CPSPrimaryManeuverView *v16;
  CPManeuver *v17;
  UIColor *v18;
  BOOL allowsCustomBackgroundColorForManeuver;
  uint64_t v20;
  int v21;
  int v22;
  void (*v23)(_QWORD *, void *);
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id location[2];
  CPSDashboardManeuversCardView *v28;

  v28 = self;
  location[1] = (id)a2;
  v16 = -[CPSDashboardManeuversCardView primaryManeuverView](self, "primaryManeuverView");
  v17 = -[CPSPrimaryManeuverView maneuver](v16, "maneuver");
  v18 = -[CPManeuver cardBackgroundColor](v17, "cardBackgroundColor");
  allowsCustomBackgroundColorForManeuver = 0;
  if (v18)
    allowsCustomBackgroundColorForManeuver = v28->_allowsCustomBackgroundColorForManeuver;

  if (allowsCustomBackgroundColorForManeuver)
  {
    v5 = -[CPSDashboardManeuversCardView primaryManeuverView](v28, "primaryManeuverView");
    v4 = -[CPSPrimaryManeuverView maneuver](v5, "maneuver");
    v3 = -[CPManeuver cardBackgroundColor](v4, "cardBackgroundColor");
    -[CPSDashboardManeuversCardView setBackgroundColor:](v28, "setBackgroundColor:");

    v10 = -[CPSDashboardManeuversCardView secondaryManeuverView](v28, "secondaryManeuverView");
    v6 = (void *)MEMORY[0x24BDF6950];
    v9 = CPSFrameworkBundle();
    v8 = (id)-[CPSDashboardManeuversCardView traitCollection](v28, "traitCollection");
    v7 = (id)objc_msgSend(v6, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("GuidanceColor30AlphaLightWhiteDarkBlack"), v9);
    -[CPSDashboardSecondaryManeuverView setBackgroundColor:](v10, "setBackgroundColor:");

    v12 = (id)-[CPSDashboardManeuversCardView backgroundColor](v28, "backgroundColor");
    v11 = (id)-[CPSDashboardManeuversCardView traitCollection](v28, "traitCollection");
    location[0] = (id)objc_msgSend(v12, "resolvedColorWithTraitCollection:");

    v26 = 1;
    v14 = (id)CPContrastingColorForColor();
    v13 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v15 = objc_msgSend(v14, "isEqual:");

    if ((v15 & 1) != 0)
      v26 = 2;
    v2 = (id)-[CPSDashboardManeuversCardView subviews](v28, "subviews");
    v20 = MEMORY[0x24BDAC760];
    v21 = -1073741824;
    v22 = 0;
    v23 = __65__CPSDashboardManeuversCardView__updateStyleOverridesForSubviews__block_invoke;
    v24 = &__block_descriptor_40_e23_v32__0__UIView_8Q16_B24l;
    v25 = v26;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v20);

    objc_storeStrong(location, 0);
  }
}

void __65__CPSDashboardManeuversCardView__updateStyleOverridesForSubviews__block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setOverrideUserInterfaceStyle:", a1[4]);
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CPSDashboardSecondaryManeuverView *v26;
  CPSDashboardSecondaryManeuverView *v27;
  CPSDashboardSecondaryManeuverView *v28;
  double v29;
  CPSPrimaryManeuverView *v30;
  CPSPrimaryManeuverView *v31;
  id v32;
  NSArray *v33;
  id v34;
  CPSDashboardSecondaryManeuverView *v35;
  double v36;
  CPSDashboardSecondaryManeuverView *v37;
  CPSDashboardSecondaryManeuverView *v38;
  CPSDashboardSecondaryManeuverView *v39;
  CPSPrimaryManeuverView *v40;
  CPSPrimaryManeuverView *v41;
  id v42;
  NSArray *v43;
  id v44;
  CPSDashboardSecondaryManeuverView *v45;
  id v46;
  CPSDashboardSecondaryManeuverView *v47;
  BOOL v48;
  CPSDashboardPrimaryManeuverView *v49;
  id v50;
  NSArray *v51;
  CPSPrimaryManeuverView *v52;
  BOOL v53;
  uint64_t v54;
  int v55;
  int v56;
  uint64_t (*v57)(uint64_t);
  void *v58;
  id v59[5];
  id v60[7];
  __int128 v61;
  __int128 v62;
  double v63;
  id v64[3];
  __int128 v65;
  __int128 v66;
  CPSDashboardSecondaryManeuverView *v67;
  char v68;
  NSArray *v69;
  CPSDashboardPrimaryManeuverView *v70;
  char v71;
  NSArray *v72;
  objc_super v73;
  SEL v74;
  CPSDashboardManeuversCardView *v75;

  v75 = self;
  v74 = a2;
  v73.receiver = self;
  v73.super_class = (Class)CPSDashboardManeuversCardView;
  -[CPSDashboardManeuversCardView layoutSubviews](&v73, sel_layoutSubviews);
  v52 = -[CPSDashboardManeuversCardView primaryManeuverView](v75, "primaryManeuverView");
  v71 = 0;
  v53 = 0;
  if (!v52)
  {
    v72 = -[CPSDashboardManeuversCardView maneuvers](v75, "maneuvers");
    v71 = 1;
    v53 = -[NSArray count](v72, "count") != 0;
  }
  if ((v71 & 1) != 0)

  if (v53)
  {
    v49 = [CPSDashboardPrimaryManeuverView alloc];
    v51 = -[CPSDashboardManeuversCardView maneuvers](v75, "maneuvers");
    v50 = -[NSArray firstObject](v51, "firstObject");
    v70 = -[CPSPrimaryManeuverView initWithManeuver:](v49, "initWithManeuver:");

    -[CPSDashboardManeuversCardView addSubview:](v75, "addSubview:", v70);
    -[CPSDashboardManeuversCardView setPrimaryManeuverView:](v75, "setPrimaryManeuverView:", v70);
    objc_storeStrong((id *)&v70, 0);
  }
  v47 = -[CPSDashboardManeuversCardView secondaryManeuverView](v75, "secondaryManeuverView");
  v68 = 0;
  v48 = 0;
  if (!v47)
  {
    v69 = -[CPSDashboardManeuversCardView maneuvers](v75, "maneuvers");
    v68 = 1;
    v48 = -[NSArray count](v69, "count") > 1;
  }
  if ((v68 & 1) != 0)

  if (v48)
  {
    v45 = [CPSDashboardSecondaryManeuverView alloc];
    v46 = -[NSArray objectAtIndex:](v75->_maneuvers, "objectAtIndex:", 1);
    v67 = -[CPSDashboardSecondaryManeuverView initWithManeuver:](v45, "initWithManeuver:");

    -[CPSDashboardManeuversCardView addSubview:](v75, "addSubview:", v67);
    -[CPSDashboardManeuversCardView setSecondaryManeuverView:](v75, "setSecondaryManeuverView:", v67);
    objc_storeStrong((id *)&v67, 0);
  }
  -[CPSDashboardManeuversCardView _updateStyleOverridesForSubviews](v75, "_updateStyleOverridesForSubviews");
  -[CPSDashboardManeuversCardView bounds](v75, "bounds");
  v64[1] = v2;
  v64[2] = v3;
  *(_QWORD *)&v65 = v4;
  *((_QWORD *)&v65 + 1) = v5;
  v66 = v65;
  v64[0] = 0;
  v43 = -[CPSDashboardManeuversCardView maneuvers](v75, "maneuvers");
  v42 = -[NSArray firstObject](v43, "firstObject");
  v44 = (id)objc_msgSend(v42, "junctionImage");

  if (v44)
  {
    v41 = -[CPSDashboardManeuversCardView primaryManeuverView](v75, "primaryManeuverView");
    v6 = -[CPSPrimaryManeuverView shortestJunctionViewlayoutConfigurationForSize:](v41, "shortestJunctionViewlayoutConfigurationForSize:", v66);
    v7 = v64[0];
    v64[0] = v6;

  }
  if (!v64[0])
  {
    v40 = -[CPSDashboardManeuversCardView primaryManeuverView](v75, "primaryManeuverView");
    v64[0] = -[CPSPrimaryManeuverView layoutConfigurationForSize:](v40, "layoutConfigurationForSize:", v66);

  }
  v63 = 0.0;
  v39 = -[CPSDashboardManeuversCardView secondaryManeuverView](v75, "secondaryManeuverView");

  if (v39)
  {
    v37 = -[CPSDashboardManeuversCardView secondaryManeuverView](v75, "secondaryManeuverView");
    -[CPSDashboardManeuversCardView bounds](v75, "bounds");
    v60[5] = v8;
    v60[6] = v9;
    *(double *)&v61 = v10;
    *((double *)&v61 + 1) = v11;
    v62 = v61;
    -[CPSSecondaryManeuverView generateLayoutConfigurationsForSizeIfNecessary:force:](v37, "generateLayoutConfigurationsForSizeIfNecessary:force:", 0, v10, v11);

    v38 = -[CPSDashboardManeuversCardView secondaryManeuverView](v75, "secondaryManeuverView");
    -[CPSSecondaryManeuverView generatedHeight](v38, "generatedHeight");
    v63 = v12;

  }
  objc_msgSend(v64[0], "height");
  v36 = v13 + v63;
  -[CPSDashboardManeuversCardView bounds](v75, "bounds");
  v60[1] = v14;
  v60[2] = v15;
  v60[3] = v16;
  v60[4] = v17;
  if (v36 <= *(double *)&v17)
  {
    v26 = -[CPSDashboardManeuversCardView secondaryManeuverView](v75, "secondaryManeuverView", v36);
    -[CPSDashboardManeuversCardView setShowSecondaryManeuverView:](v75, "setShowSecondaryManeuverView:", v26 != 0);

  }
  else
  {
    v35 = -[CPSDashboardManeuversCardView secondaryManeuverView](v75, "secondaryManeuverView", v36);

    if (v35)
    {
      v60[0] = 0;
      v33 = -[CPSDashboardManeuversCardView maneuvers](v75, "maneuvers");
      v32 = -[NSArray firstObject](v33, "firstObject");
      v34 = (id)objc_msgSend(v32, "junctionImage");

      if (v34)
      {
        v31 = -[CPSDashboardManeuversCardView primaryManeuverView](v75, "primaryManeuverView");
        v18 = -[CPSPrimaryManeuverView shortestJunctionViewlayoutConfigurationForSize:](v31, "shortestJunctionViewlayoutConfigurationForSize:", v66);
        v19 = v60[0];
        v60[0] = v18;

      }
      if (!v60[0])
      {
        v30 = -[CPSDashboardManeuversCardView primaryManeuverView](v75, "primaryManeuverView");
        v60[0] = -[CPSPrimaryManeuverView shortestInstructionlayoutConfigurationForSize:](v30, "shortestInstructionlayoutConfigurationForSize:", v66);

      }
      if (v60[0]
        && (objc_msgSend(v60[0], "height"),
            v29 = v20 + v63,
            -[CPSDashboardManeuversCardView bounds](v75, "bounds"),
            v59[1] = v21,
            v59[2] = v22,
            v59[3] = v23,
            v59[4] = v24,
            v29 <= *(double *)&v24))
      {
        -[CPSDashboardManeuversCardView setShowSecondaryManeuverView:](v75, "setShowSecondaryManeuverView:", 1, v29);
        v27 = -[CPSDashboardManeuversCardView secondaryManeuverView](v75, "secondaryManeuverView");
        -[CPSDashboardSecondaryManeuverView setHidden:](v27, "setHidden:", 0);

      }
      else
      {
        -[CPSDashboardManeuversCardView setShowSecondaryManeuverView:](v75, "setShowSecondaryManeuverView:", 0);
        v28 = -[CPSDashboardManeuversCardView secondaryManeuverView](v75, "secondaryManeuverView");
        -[CPSDashboardSecondaryManeuverView setHidden:](v28, "setHidden:", 1);

      }
      objc_storeStrong(v60, 0);
    }
  }
  v25 = (void *)MEMORY[0x24BDF6F90];
  v54 = MEMORY[0x24BDAC760];
  v55 = -1073741824;
  v56 = 0;
  v57 = __47__CPSDashboardManeuversCardView_layoutSubviews__block_invoke;
  v58 = &unk_24E26F1B8;
  v59[0] = v75;
  objc_msgSend(v25, "performWithoutAnimation:", &v54);
  objc_storeStrong(v59, 0);
  objc_storeStrong(v64, 0);
}

uint64_t __47__CPSDashboardManeuversCardView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateConstraints");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  os_log_t oslog;
  id v6;
  id location[2];
  CPSDashboardManeuversCardView *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)location[0], (uint64_t)v6);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "showManeuvers: %@ usingDisplayStyles: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong((id *)&v8->_maneuvers, location[0]);
  -[CPSDashboardManeuversCardView setNeedsLayout](v8, "setNeedsLayout");
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  CPSPrimaryManeuverView *v4;
  id v6;
  id v7;
  CPManeuver *v8;
  CPSPrimaryManeuverView *v9;
  char v10;
  id v11;
  id location[2];
  CPSDashboardManeuversCardView *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v9 = -[CPSDashboardManeuversCardView primaryManeuverView](v13, "primaryManeuverView");
  v8 = -[CPSPrimaryManeuverView maneuver](v9, "maneuver");
  v7 = (id)-[CPManeuver identifier](v8, "identifier");
  v6 = (id)objc_msgSend(v11, "identifier");
  v10 = objc_msgSend(v7, "isEqual:");

  if ((v10 & 1) != 0)
  {
    v4 = -[CPSDashboardManeuversCardView primaryManeuverView](v13, "primaryManeuverView");
    -[CPSPrimaryManeuverView setCurrentTravelEstimates:](v4, "setCurrentTravelEstimates:", location[0]);

    -[CPSDashboardManeuversCardView setNeedsLayout](v13, "setNeedsLayout");
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)wantsLargeSize
{
  uint64_t v2;
  double v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  CPSPrimaryManeuverView *v9;
  id v10;
  NSArray *v11;
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  double v16;
  id v17[2];
  CPSDashboardManeuversCardView *v18;
  BOOL v19;

  v18 = self;
  v17[1] = (id)a2;
  v11 = -[CPSDashboardManeuversCardView maneuvers](self, "maneuvers");
  v10 = -[NSArray firstObject](v11, "firstObject");
  v12 = (id)objc_msgSend(v10, "junctionImage");

  if (v12)
  {
    v5 = (void *)objc_opt_class();
    v6 = (id)-[CPSDashboardManeuversCardView window](v18, "window");
    v17[0] = CPSSafeCast_8(v5, v6);

    v8 = (id)objc_msgSend(v17[0], "widgetSizes");
    v7 = (id)objc_msgSend(v8, "lastObject");
    objc_msgSend(v7, "CGSizeValue");
    v15 = v2;
    v16 = v3;

    *(_QWORD *)&v14 = v15;
    *((double *)&v14 + 1) = v16 - 12.0;
    v9 = -[CPSDashboardManeuversCardView primaryManeuverView](v18, "primaryManeuverView");
    v13 = -[CPSPrimaryManeuverView shortestJunctionViewlayoutConfigurationForSize:](v9, "shortestJunctionViewlayoutConfigurationForSize:", v14);

    v19 = v13 != 0;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v17, 0);
  }
  else
  {
    return 0;
  }
  return v19;
}

- (BOOL)allowsCustomBackgroundColorForManeuver
{
  return self->_allowsCustomBackgroundColorForManeuver;
}

- (void)setAllowsCustomBackgroundColorForManeuver:(BOOL)a3
{
  self->_allowsCustomBackgroundColorForManeuver = a3;
}

- (NSArray)maneuvers
{
  return self->_maneuvers;
}

- (void)setManeuvers:(id)a3
{
  objc_storeStrong((id *)&self->_maneuvers, a3);
}

- (CPSPrimaryManeuverView)primaryManeuverView
{
  return self->_primaryManeuverView;
}

- (void)setPrimaryManeuverView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryManeuverView, a3);
}

- (CPSDashboardSecondaryManeuverView)secondaryManeuverView
{
  return self->_secondaryManeuverView;
}

- (void)setSecondaryManeuverView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryManeuverView, a3);
}

- (NSArray)secondaryManeveuverConstraints
{
  return self->_secondaryManeveuverConstraints;
}

- (void)setSecondaryManeveuverConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryManeveuverConstraints, a3);
}

- (BOOL)showSecondaryManeuverView
{
  return self->_showSecondaryManeuverView;
}

- (void)setShowSecondaryManeuverView:(BOOL)a3
{
  self->_showSecondaryManeuverView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryManeveuverConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryManeuverView, 0);
  objc_storeStrong((id *)&self->_primaryManeuverView, 0);
  objc_storeStrong((id *)&self->_maneuvers, 0);
}

@end

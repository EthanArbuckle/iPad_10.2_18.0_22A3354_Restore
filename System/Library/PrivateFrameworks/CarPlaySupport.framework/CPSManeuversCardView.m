@implementation CPSManeuversCardView

- (CPSManeuversCardView)initWithManeuvers:(id)a3
{
  CPSManeuversCardView *v3;
  uint64_t v4;
  NSMutableArray *activeConstraints;
  CPSManeuversCardView *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  objc_super v20;
  id location[2];
  CPSManeuversCardView *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v22;
  v22 = 0;
  v20.receiver = v3;
  v20.super_class = (Class)CPSManeuversCardView;
  v22 = -[CPSManeuversCardView init](&v20, sel_init);
  objc_storeStrong((id *)&v22, v22);
  if (v22)
  {
    objc_storeStrong((id *)&v22->_maneuvers, location[0]);
    -[CPSManeuversCardView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = (id)objc_msgSend((id)objc_opt_class(), "createPlatterView");
    objc_storeStrong((id *)&v22->_cardPlatterView, v19);
    -[CPSManeuversCardView addSubview:](v22, "addSubview:", v19);
    v8 = (void *)MEMORY[0x24BDD1628];
    v18 = (id)objc_msgSend(v19, "leadingAnchor");
    v17 = (id)-[CPSManeuversCardView leadingAnchor](v22, "leadingAnchor");
    v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v23[0] = v16;
    v15 = (id)objc_msgSend(v19, "topAnchor");
    v14 = (id)-[CPSManeuversCardView topAnchor](v22, "topAnchor");
    v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
    v23[1] = v13;
    v12 = (id)objc_msgSend(v19, "trailingAnchor");
    v11 = (id)-[CPSManeuversCardView trailingAnchor](v22, "trailingAnchor");
    v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
    v23[2] = v10;
    v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
    objc_msgSend(v8, "activateConstraints:");

    v4 = objc_opt_new();
    activeConstraints = v22->_activeConstraints;
    v22->_activeConstraints = (NSMutableArray *)v4;

    objc_msgSend(v19, "setClipsToBounds:", 1);
    objc_storeStrong(&v19, 0);
  }
  v7 = v22;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v7;
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
  CPSSecondaryManeuverView *v11;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;
  CGRect v18;

  -[CPSManeuversCardView bounds](self, "bounds");
  CGRectGetWidth(v18);
  CGSizeMake_13();
  v13 = v2;
  v14 = v3;
  v9 = -[CPSManeuversCardView primaryManeuverView](self, "primaryManeuverView");
  -[CPSPrimaryManeuverView intrinsicContentSize](v9, "intrinsicContentSize");
  v15 = v14 + v4;

  v10 = 0;
  if (-[CPSManeuversCardView showSecondaryManeuverView](self, "showSecondaryManeuverView"))
  {
    v11 = -[CPSManeuversCardView secondaryManeuverView](self, "secondaryManeuverView");
    v10 = 1;
    -[CPSSecondaryManeuverView bounds](v11, "bounds");
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
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id *v8;
  id v9;
  CPSPrimaryManeuverView *v10;
  id v11;
  CPSCardPlatterView *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CPSPrimaryManeuverView *v17;
  id v18;
  id v19;
  CPSHairlineView *v20;
  id v21;
  id v22;
  CPSSecondaryManeuverView *v23;
  id v24;
  CPSSecondaryManeuverView *v25;
  id v26;
  CPSCardPlatterView *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  CPSSecondaryManeuverView *v32;
  id v33;
  id v34;
  id v35;
  CPSHairlineView *v36;
  id v37;
  id v38;
  id v39;
  CPSHairlineView *v40;
  id v41;
  id v42;
  id v43;
  CPSSecondaryManeuverView *v44;
  id v45;
  id v46;
  id v47;
  CPSSecondaryManeuverView *v48;
  id v49;
  id v50;
  CPSSecondaryManeuverView *v51;
  id v52;
  CPSHairlineView *v53;
  id v54;
  id v55;
  CPSHairlineView *v56;
  id v57;
  CPSPrimaryManeuverView *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  CPSPrimaryManeuverView *v63;
  id v64;
  id v65;
  id v66;
  CPSPrimaryManeuverView *v67;
  id v68;
  id v69;
  id v70;
  CPSPrimaryManeuverView *v71;
  CPSSecondaryManeuverView *v72;
  CPSPrimaryManeuverView *v73;
  id location;
  id v75;
  id v76[2];
  CPSManeuversCardView *v77;
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[8];
  _QWORD v81[4];

  v81[3] = *MEMORY[0x24BDAC8D0];
  v77 = self;
  v76[1] = (id)a2;
  v73 = -[CPSManeuversCardView primaryManeuverView](self, "primaryManeuverView");

  if (v73)
  {
    v76[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (-[NSMutableArray count](v77->_activeConstraints, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", v77->_activeConstraints);
      -[NSMutableArray removeAllObjects](v77->_activeConstraints, "removeAllObjects");
    }
    v71 = -[CPSManeuversCardView primaryManeuverView](v77, "primaryManeuverView");
    v70 = (id)-[CPSPrimaryManeuverView topAnchor](v71, "topAnchor");
    v69 = (id)-[CPSManeuversCardView topAnchor](v77, "topAnchor");
    v68 = (id)objc_msgSend(v70, "constraintEqualToAnchor:constant:", 0.0);
    v81[0] = v68;
    v67 = -[CPSManeuversCardView primaryManeuverView](v77, "primaryManeuverView");
    v66 = (id)-[CPSPrimaryManeuverView leadingAnchor](v67, "leadingAnchor");
    v65 = (id)-[CPSManeuversCardView leadingAnchor](v77, "leadingAnchor");
    v64 = (id)objc_msgSend(v66, "constraintEqualToAnchor:");
    v81[1] = v64;
    v63 = -[CPSManeuversCardView primaryManeuverView](v77, "primaryManeuverView");
    v62 = (id)-[CPSPrimaryManeuverView trailingAnchor](v63, "trailingAnchor");
    v61 = (id)-[CPSManeuversCardView trailingAnchor](v77, "trailingAnchor");
    v60 = (id)objc_msgSend(v62, "constraintEqualToAnchor:");
    v81[2] = v60;
    v59 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 3);
    objc_msgSend(v76[0], "addObjectsFromArray:");

    v75 = 0;
    v72 = -[CPSManeuversCardView secondaryManeuverView](v77, "secondaryManeuverView");

    if (v72)
    {
      location = 0;
      v27 = -[CPSManeuversCardView cardPlatterView](v77, "cardPlatterView");
      v26 = (id)-[CPSCardPlatterView bottomAnchor](v27, "bottomAnchor");
      v25 = -[CPSManeuversCardView secondaryManeuverView](v77, "secondaryManeuverView");
      v24 = (id)-[CPSSecondaryManeuverView bottomAnchor](v25, "bottomAnchor");
      v2 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
      v3 = v75;
      v75 = v2;

      v58 = -[CPSManeuversCardView primaryManeuverView](v77, "primaryManeuverView");
      v57 = (id)-[CPSPrimaryManeuverView bottomAnchor](v58, "bottomAnchor");
      v56 = -[CPSManeuversCardView hairlineView](v77, "hairlineView");
      v55 = (id)-[CPSHairlineView topAnchor](v56, "topAnchor");
      v54 = (id)objc_msgSend(v57, "constraintEqualToAnchor:constant:");
      v80[0] = v54;
      v53 = -[CPSManeuversCardView hairlineView](v77, "hairlineView");
      v52 = (id)-[CPSHairlineView bottomAnchor](v53, "bottomAnchor");
      v51 = -[CPSManeuversCardView secondaryManeuverView](v77, "secondaryManeuverView");
      v50 = (id)-[CPSSecondaryManeuverView topAnchor](v51, "topAnchor");
      v49 = (id)objc_msgSend(v52, "constraintEqualToAnchor:constant:", 0.0);
      v80[1] = v49;
      v48 = -[CPSManeuversCardView secondaryManeuverView](v77, "secondaryManeuverView");
      v47 = (id)-[CPSSecondaryManeuverView leadingAnchor](v48, "leadingAnchor");
      v46 = (id)-[CPSManeuversCardView leadingAnchor](v77, "leadingAnchor");
      v45 = (id)objc_msgSend(v47, "constraintEqualToAnchor:");
      v80[2] = v45;
      v44 = -[CPSManeuversCardView secondaryManeuverView](v77, "secondaryManeuverView");
      v43 = (id)-[CPSSecondaryManeuverView trailingAnchor](v44, "trailingAnchor");
      v42 = (id)-[CPSManeuversCardView trailingAnchor](v77, "trailingAnchor");
      v41 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
      v80[3] = v41;
      v40 = -[CPSManeuversCardView hairlineView](v77, "hairlineView");
      v39 = (id)-[CPSHairlineView leadingAnchor](v40, "leadingAnchor");
      v38 = (id)-[CPSManeuversCardView leadingAnchor](v77, "leadingAnchor");
      v37 = (id)objc_msgSend(v39, "constraintEqualToAnchor:");
      v80[4] = v37;
      v36 = -[CPSManeuversCardView hairlineView](v77, "hairlineView");
      v35 = (id)-[CPSHairlineView trailingAnchor](v36, "trailingAnchor");
      v34 = (id)-[CPSManeuversCardView trailingAnchor](v77, "trailingAnchor");
      v33 = (id)objc_msgSend(v35, "constraintEqualToAnchor:");
      v80[5] = v33;
      v32 = -[CPSManeuversCardView secondaryManeuverView](v77, "secondaryManeuverView");
      v31 = (id)-[CPSSecondaryManeuverView bottomAnchor](v32, "bottomAnchor");
      v30 = (id)-[CPSManeuversCardView bottomAnchor](v77, "bottomAnchor");
      v29 = (id)objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:");
      v80[6] = v29;
      v80[7] = v75;
      v28 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 8);
      objc_msgSend(v76[0], "addObjectsFromArray:");

      if (!-[CPSManeuversCardView showSecondaryManeuverView](v77, "showSecondaryManeuverView"))
      {
        v23 = -[CPSManeuversCardView secondaryManeuverView](v77, "secondaryManeuverView");
        v22 = (id)-[CPSSecondaryManeuverView heightAnchor](v23, "heightAnchor");
        v21 = (id)objc_msgSend(v22, "constraintEqualToConstant:");
        v79[0] = v21;
        v20 = -[CPSManeuversCardView hairlineView](v77, "hairlineView");
        v19 = (id)-[CPSHairlineView heightAnchor](v20, "heightAnchor");
        v18 = (id)objc_msgSend(v19, "constraintEqualToConstant:", 0.0);
        v79[1] = v18;
        v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 2);
        v5 = location;
        location = v4;

        objc_msgSend(v76[0], "addObjectsFromArray:", location);
      }
      objc_storeStrong(&location, 0);
    }
    else
    {
      v12 = -[CPSManeuversCardView cardPlatterView](v77, "cardPlatterView");
      v11 = (id)-[CPSCardPlatterView bottomAnchor](v12, "bottomAnchor");
      v10 = -[CPSManeuversCardView primaryManeuverView](v77, "primaryManeuverView");
      v9 = (id)-[CPSPrimaryManeuverView bottomAnchor](v10, "bottomAnchor");
      v6 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
      v7 = v75;
      v75 = v6;

      v17 = -[CPSManeuversCardView primaryManeuverView](v77, "primaryManeuverView");
      v16 = (id)-[CPSPrimaryManeuverView bottomAnchor](v17, "bottomAnchor");
      v15 = (id)-[CPSManeuversCardView bottomAnchor](v77, "bottomAnchor");
      v14 = (id)objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
      v78[0] = v14;
      v78[1] = v75;
      v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 2);
      objc_msgSend(v76[0], "addObjectsFromArray:");

    }
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v76[0], v76);
    -[NSMutableArray addObjectsFromArray:](v77->_activeConstraints, "addObjectsFromArray:", v76[0]);
    objc_storeStrong(&v75, 0);
    objc_storeStrong(v8, 0);
  }
}

- (void)layoutSubviews
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  CPSPrimaryManeuverView *v22;
  CPSPrimaryManeuverView *v23;
  CPSSecondaryManeuverView *v24;
  CPSSecondaryManeuverView *v25;
  double v26;
  CPSPrimaryManeuverView *v27;
  BOOL v28;
  BOOL v29;
  CPSPrimaryManeuverView *v30;
  id v31;
  NSArray *v32;
  id v33;
  CPSSecondaryManeuverView *v34;
  double v35;
  CPSSecondaryManeuverView *v36;
  CPSSecondaryManeuverView *v37;
  CPSPrimaryManeuverView *v38;
  CPSSecondaryManeuverView *v39;
  CPSSecondaryManeuverView *v40;
  id v41;
  CPSCardPlatterView *v42;
  CPSCardPlatterView *v43;
  CPSSecondaryManeuverView *v44;
  BOOL v45;
  void *v46;
  id v47;
  NSArray *v48;
  CPSCardPlatterView *v49;
  CPSPrimaryManeuverView *v50;
  BOOL v51;
  char v52;
  id v53;
  char v54;
  id v55;
  id v56[7];
  __int128 v57;
  __int128 v58;
  double v59;
  id v60[3];
  __int128 v61;
  __int128 v62;
  id v63;
  CPSSecondaryManeuverView *v64;
  char v65;
  NSArray *v66;
  id v67;
  char v68;
  NSArray *v69;
  objc_super v70;
  SEL v71;
  CPSManeuversCardView *v72;

  v72 = self;
  v71 = a2;
  v70.receiver = self;
  v70.super_class = (Class)CPSManeuversCardView;
  -[CPSManeuversCardView layoutSubviews](&v70, sel_layoutSubviews);
  v50 = -[CPSManeuversCardView primaryManeuverView](v72, "primaryManeuverView");
  v68 = 0;
  v51 = 0;
  if (!v50)
  {
    v69 = -[CPSManeuversCardView maneuvers](v72, "maneuvers");
    v68 = 1;
    v51 = -[NSArray count](v69, "count") != 0;
  }
  if ((v68 & 1) != 0)

  if (v51)
  {
    v46 = (void *)objc_opt_class();
    v48 = -[CPSManeuversCardView maneuvers](v72, "maneuvers");
    v47 = -[NSArray firstObject](v48, "firstObject");
    v67 = (id)objc_msgSend(v46, "maneuverViewWithManeuver:");

    objc_msgSend(v67, "setUsesCustomBackgroundColor:", -[CPSManeuversCardView usesCustomBackgroundColor](v72, "usesCustomBackgroundColor"));
    v49 = -[CPSManeuversCardView cardPlatterView](v72, "cardPlatterView");
    -[CPSCardPlatterView addSubview:](v49, "addSubview:", v67);

    -[CPSManeuversCardView setPrimaryManeuverView:](v72, "setPrimaryManeuverView:", v67);
    objc_storeStrong(&v67, 0);
  }
  v44 = -[CPSManeuversCardView secondaryManeuverView](v72, "secondaryManeuverView");
  v65 = 0;
  v45 = 0;
  if (!v44)
  {
    v66 = -[CPSManeuversCardView maneuvers](v72, "maneuvers");
    v65 = 1;
    v45 = -[NSArray count](v66, "count") > 1;
  }
  if ((v65 & 1) != 0)

  if (v45)
  {
    v40 = [CPSSecondaryManeuverView alloc];
    v41 = -[NSArray objectAtIndex:](v72->_maneuvers, "objectAtIndex:", 1);
    v64 = -[CPSSecondaryManeuverView initWithManeuver:](v40, "initWithManeuver:");

    v42 = -[CPSManeuversCardView cardPlatterView](v72, "cardPlatterView");
    -[CPSCardPlatterView addSubview:](v42, "addSubview:", v64);

    -[CPSManeuversCardView setSecondaryManeuverView:](v72, "setSecondaryManeuverView:", v64);
    v63 = +[CPSHairlineView grayHairlineViewAlongAxis:](CPSHairlineView, "grayHairlineViewAlongAxis:", 0);
    v43 = -[CPSManeuversCardView cardPlatterView](v72, "cardPlatterView");
    -[CPSCardPlatterView addSubview:](v43, "addSubview:", v63);

    -[CPSManeuversCardView setHairlineView:](v72, "setHairlineView:", v63);
    -[CPSManeuversCardView _updateSecondaryManeuverBackgroundColor](v72, "_updateSecondaryManeuverBackgroundColor");
    -[CPSManeuversCardView _updateHairlineBackgroundColor](v72, "_updateHairlineBackgroundColor");
    objc_storeStrong(&v63, 0);
    objc_storeStrong((id *)&v64, 0);
  }
  -[CPSManeuversCardView bounds](v72, "bounds");
  v60[1] = v2;
  v60[2] = v3;
  *(_QWORD *)&v61 = v4;
  *((_QWORD *)&v61 + 1) = v5;
  v62 = v61;
  v38 = -[CPSManeuversCardView primaryManeuverView](v72, "primaryManeuverView");
  v60[0] = -[CPSPrimaryManeuverView layoutConfigurationForSize:](v38, "layoutConfigurationForSize:", *(double *)&v61, *((double *)&v61 + 1));

  v59 = 0.0;
  v39 = -[CPSManeuversCardView secondaryManeuverView](v72, "secondaryManeuverView");

  if (v39)
  {
    v36 = -[CPSManeuversCardView secondaryManeuverView](v72, "secondaryManeuverView");
    -[CPSManeuversCardView bounds](v72, "bounds");
    v56[5] = v6;
    v56[6] = v7;
    *(double *)&v57 = v8;
    *((double *)&v57 + 1) = v9;
    v58 = v57;
    -[CPSSecondaryManeuverView generateLayoutConfigurationsForSizeIfNecessary:force:](v36, "generateLayoutConfigurationsForSizeIfNecessary:force:", 0, v8, v9);

    v37 = -[CPSManeuversCardView secondaryManeuverView](v72, "secondaryManeuverView");
    -[CPSSecondaryManeuverView generatedHeight](v37, "generatedHeight");
    v59 = v10 + 1.0;

  }
  objc_msgSend(v60[0], "height");
  v35 = v11 + v59;
  -[CPSManeuversCardView bounds](v72, "bounds");
  v56[1] = v12;
  v56[2] = v13;
  v56[3] = v14;
  v56[4] = v15;
  if (v35 <= *(double *)&v15)
  {
    v24 = -[CPSManeuversCardView secondaryManeuverView](v72, "secondaryManeuverView", v35);
    -[CPSManeuversCardView setShowSecondaryManeuverView:](v72, "setShowSecondaryManeuverView:", v24 != 0);

  }
  else
  {
    v34 = -[CPSManeuversCardView secondaryManeuverView](v72, "secondaryManeuverView", v35);

    if (v34)
    {
      v56[0] = 0;
      v32 = -[CPSManeuversCardView maneuvers](v72, "maneuvers");
      v31 = -[NSArray firstObject](v32, "firstObject");
      v33 = (id)objc_msgSend(v31, "junctionImage");

      if (v33)
      {
        v30 = -[CPSManeuversCardView primaryManeuverView](v72, "primaryManeuverView");
        v16 = -[CPSPrimaryManeuverView shortestJunctionViewlayoutConfigurationForSize:](v30, "shortestJunctionViewlayoutConfigurationForSize:", *(double *)&v62, *((double *)&v62 + 1));
        v17 = v56[0];
        v56[0] = v16;

      }
      v54 = 0;
      v52 = 0;
      v29 = 0;
      if (!v56[0])
      {
        v55 = (id)objc_msgSend(v60[0], "instruction");
        v54 = 1;
        v28 = 1;
        if (!v55)
        {
          v53 = (id)objc_msgSend(v60[0], "attributedInstruction");
          v52 = 1;
          v28 = v53 != 0;
        }
        v29 = v28;
      }
      if ((v52 & 1) != 0)

      if ((v54 & 1) != 0)
      if (v29)
      {
        v27 = -[CPSManeuversCardView primaryManeuverView](v72, "primaryManeuverView");
        v18 = -[CPSPrimaryManeuverView shortestInstructionlayoutConfigurationForSize:](v27, "shortestInstructionlayoutConfigurationForSize:", *(double *)&v62, *((double *)&v62 + 1));
        v19 = v56[0];
        v56[0] = v18;

      }
      if (v56[0]
        && (objc_msgSend(v56[0], "height"), v26 = v20 + v59, -[CPSManeuversCardView bounds](v72, "bounds"), v26 <= v21))
      {
        objc_storeStrong(v60, v56[0]);
        -[CPSManeuversCardView setShowSecondaryManeuverView:](v72, "setShowSecondaryManeuverView:", 1);
      }
      else
      {
        -[CPSManeuversCardView setShowSecondaryManeuverView:](v72, "setShowSecondaryManeuverView:", 0);
      }
      v25 = -[CPSManeuversCardView secondaryManeuverView](v72, "secondaryManeuverView");
      -[CPSSecondaryManeuverView setHidden:](v25, "setHidden:", !-[CPSManeuversCardView showSecondaryManeuverView](v72, "showSecondaryManeuverView"));

      objc_storeStrong(v56, 0);
    }
  }
  v22 = -[CPSManeuversCardView primaryManeuverView](v72, "primaryManeuverView");
  -[CPSPrimaryManeuverView setLayoutConfigurationForIntrinsicSizing:](v22, "setLayoutConfigurationForIntrinsicSizing:", v60[0]);

  v23 = -[CPSManeuversCardView primaryManeuverView](v72, "primaryManeuverView");
  -[CPSPrimaryManeuverView invalidateIntrinsicContentSize](v23, "invalidateIntrinsicContentSize");

  -[CPSManeuversCardView _updateConstraints](v72, "_updateConstraints");
  objc_storeStrong(v60, 0);
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  os_log_t oslog;
  id v6;
  id location[2];
  CPSManeuversCardView *v8;
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
  -[CPSManeuversCardView setNeedsLayout](v8, "setNeedsLayout");
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
  CPSManeuversCardView *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v9 = -[CPSManeuversCardView primaryManeuverView](v13, "primaryManeuverView");
  v8 = -[CPSPrimaryManeuverView maneuver](v9, "maneuver");
  v7 = (id)-[CPManeuver identifier](v8, "identifier");
  v6 = (id)objc_msgSend(v11, "identifier");
  v10 = objc_msgSend(v7, "isEqual:");

  if ((v10 & 1) != 0)
  {
    v4 = -[CPSManeuversCardView primaryManeuverView](v13, "primaryManeuverView");
    -[CPSPrimaryManeuverView setCurrentTravelEstimates:](v4, "setCurrentTravelEstimates:", location[0]);

    -[CPSManeuversCardView setNeedsLayout](v13, "setNeedsLayout");
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)canFitSize:(CGSize)a3
{
  CPSPrimaryManeuverView *v4;
  BOOL v5;
  id v6[3];
  CGSize v7;

  v7 = a3;
  v6[2] = self;
  v6[1] = (id)a2;
  v4 = -[CPSManeuversCardView primaryManeuverView](self, "primaryManeuverView");
  v6[0] = -[CPSPrimaryManeuverView layoutConfigurationForSize:](v4, "layoutConfigurationForSize:", v7.width, v7.height);

  v5 = v6[0] != 0;
  objc_storeStrong(v6, 0);
  return v5;
}

- (void)setUsesCustomBackgroundColor:(BOOL)a3
{
  CPSPrimaryManeuverView *v3;
  BOOL v4;

  v4 = a3;
  if (self->_usesCustomBackgroundColor != a3)
  {
    self->_usesCustomBackgroundColor = a3;
    v3 = -[CPSManeuversCardView primaryManeuverView](self, "primaryManeuverView");
    -[CPSPrimaryManeuverView setUsesCustomBackgroundColor:](v3, "setUsesCustomBackgroundColor:", v4);

    -[CPSManeuversCardView _updateHairlineBackgroundColor](self, "_updateHairlineBackgroundColor");
    -[CPSManeuversCardView _updateSecondaryManeuverBackgroundColor](self, "_updateSecondaryManeuverBackgroundColor");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSManeuversCardView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSManeuversCardView;
  -[CPSManeuversCardView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSManeuversCardView _updateHairlineBackgroundColor](v5, "_updateHairlineBackgroundColor");
  -[CPSManeuversCardView _updateSecondaryManeuverBackgroundColor](v5, "_updateSecondaryManeuverBackgroundColor");
  objc_storeStrong(location, 0);
}

- (void)_updateHairlineBackgroundColor
{
  id v2;
  CPSHairlineView *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  CPSHairlineView *v8;

  if (-[CPSManeuversCardView usesCustomBackgroundColor](self, "usesCustomBackgroundColor"))
  {
    v8 = -[CPSManeuversCardView hairlineView](self, "hairlineView");
    v4 = (void *)MEMORY[0x24BDF6950];
    v7 = CPSFrameworkBundle();
    v6 = (id)-[CPSManeuversCardView traitCollection](self, "traitCollection");
    v5 = (id)objc_msgSend(v4, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("GuidanceColor30AlphaLightBlackDarkWhite"), v7);
    -[CPSHairlineView setBackgroundColor:](v8, "setBackgroundColor:");

  }
  else
  {
    v3 = -[CPSManeuversCardView hairlineView](self, "hairlineView");
    v2 = (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.4, 0.4, 0.4, 1.0);
    -[CPSHairlineView setBackgroundColor:](v3, "setBackgroundColor:");

  }
}

- (void)_updateSecondaryManeuverBackgroundColor
{
  id v2;
  CPSSecondaryManeuverView *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  CPSSecondaryManeuverView *v8;

  if (-[CPSManeuversCardView usesCustomBackgroundColor](self, "usesCustomBackgroundColor"))
  {
    v8 = -[CPSManeuversCardView secondaryManeuverView](self, "secondaryManeuverView");
    v4 = (void *)MEMORY[0x24BDF6950];
    v7 = CPSFrameworkBundle();
    v6 = (id)-[CPSManeuversCardView traitCollection](self, "traitCollection");
    v5 = (id)objc_msgSend(v4, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("GuidanceColor30AlphaLightWhiteDarkBlack"), v7);
    -[CPSSecondaryManeuverView setBackgroundColor:](v8, "setBackgroundColor:");

  }
  else
  {
    v3 = -[CPSManeuversCardView secondaryManeuverView](self, "secondaryManeuverView");
    v2 = (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.247058824, 1.0);
    -[CPSSecondaryManeuverView setBackgroundColor:](v3, "setBackgroundColor:");

  }
}

- (void)invalidate
{
  CPSPrimaryManeuverView *v2;
  CPSPrimaryManeuverView *v3;
  CPSPrimaryManeuverView *v4;

  v2 = -[CPSManeuversCardView primaryManeuverView](self, "primaryManeuverView");
  -[CPSPrimaryManeuverView setActiveLayoutConfiguration:](v2, "setActiveLayoutConfiguration:");

  v3 = -[CPSManeuversCardView primaryManeuverView](self, "primaryManeuverView");
  -[CPSPrimaryManeuverView setLayoutConfigurationForIntrinsicSizing:](v3, "setLayoutConfigurationForIntrinsicSizing:", 0);

  v4 = -[CPSManeuversCardView primaryManeuverView](self, "primaryManeuverView");
  -[CPSPrimaryManeuverView invalidateIntrinsicContentSize](v4, "invalidateIntrinsicContentSize");

}

+ (id)maneuverViewWithManeuver:(id)a3
{
  CPSPrimaryManeuverView *v3;
  CPSPrimaryManeuverView *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [CPSPrimaryManeuverView alloc];
  v5 = -[CPSPrimaryManeuverView initWithManeuver:](v3, "initWithManeuver:", location[0]);
  objc_storeStrong(location, 0);
  return v5;
}

+ (id)createPlatterView
{
  return objc_alloc_init(CPSCardPlatterView);
}

- (CPSCardPlatterView)cardPlatterView
{
  return self->_cardPlatterView;
}

- (void)setCardPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_cardPlatterView, a3);
}

- (BOOL)usesCustomBackgroundColor
{
  return self->_usesCustomBackgroundColor;
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

- (CPSSecondaryManeuverView)secondaryManeuverView
{
  return self->_secondaryManeuverView;
}

- (void)setSecondaryManeuverView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryManeuverView, a3);
}

- (NSMutableArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (BOOL)showSecondaryManeuverView
{
  return self->_showSecondaryManeuverView;
}

- (void)setShowSecondaryManeuverView:(BOOL)a3
{
  self->_showSecondaryManeuverView = a3;
}

- (CPSHairlineView)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryManeuverView, 0);
  objc_storeStrong((id *)&self->_primaryManeuverView, 0);
  objc_storeStrong((id *)&self->_maneuvers, 0);
  objc_storeStrong((id *)&self->_cardPlatterView, 0);
}

@end

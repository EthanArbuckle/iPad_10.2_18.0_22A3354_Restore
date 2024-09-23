@implementation CPSSecondaryManeuverView

- (id)accessibilityName:(id)a3
{
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  void *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  id v13;
  uint64_t v14;
  id location[2];
  CPSSecondaryManeuverView *v16;
  id v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = (id)-[CPSSecondaryManeuverView traitCollection](v16, "traitCollection");
  v14 = objc_msgSend(v13, "userInterfaceStyle");

  if (v14 == 1)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v3 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v3);
    v17 = (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@-Light"), v12, location[0]);

  }
  else if (v14 == 2)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    v4 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v4);
    v17 = (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@-Dark"), v10, location[0]);

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v5 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v5);
    v17 = (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, location[0]);

  }
  objc_storeStrong(location, 0);
  return v17;
}

- (CPSSecondaryManeuverView)initWithManeuver:(id)a3
{
  CPSSecondaryManeuverView *v3;
  uint64_t v4;
  double v5;
  double v6;
  id v7;
  double v8;
  CPSSecondaryManeuverView *v10;
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
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  CPSSecondaryManeuverView *v87;
  double v88;
  unint64_t v89;
  id v90;
  id v91;
  uint64_t v92;
  int v93;
  int v94;
  void (*v95)(uint64_t);
  void *v96;
  id v97;
  CPSSecondaryManeuverView *v98;
  id v99[2];
  id v100[2];
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  int v105;
  int v106;
  void (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  id v110;
  objc_super v111;
  id location[2];
  CPSSecondaryManeuverView *v113;

  v113 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v113;
  v113 = 0;
  v111.receiver = v3;
  v111.super_class = (Class)CPSSecondaryManeuverView;
  v113 = -[CPSSecondaryManeuverView init](&v111, sel_init);
  objc_storeStrong((id *)&v113, v113);
  if (v113)
  {
    objc_storeStrong((id *)&v113->_maneuver, location[0]);
    v4 = objc_msgSend(location[0], "displayStyle");
    v113->_style = v4;
    v113->_guidanceStyle = 2;
    -[CPSSecondaryManeuverView setTranslatesAutoresizingMaskIntoConstraints:](v113, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSSecondaryManeuverView setContentCompressionResistancePriority:forAxis:](v113, "setContentCompressionResistancePriority:forAxis:");
    LODWORD(v5) = 1148846080;
    -[CPSSecondaryManeuverView setContentHuggingPriority:forAxis:](v113, "setContentHuggingPriority:forAxis:", 1, v5);
    v110 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v103 = 0;
    v104 = &v103;
    v105 = 838860800;
    v106 = 48;
    v107 = __Block_byref_object_copy__6;
    v108 = __Block_byref_object_dispose__6;
    v109 = 0;
    v87 = v113;
    v102 = -[CPSSecondaryManeuverView style](v113, "style");
    v101 = 4;
    if (v102 >= 4)
      v86 = (void *)v101;
    else
      v86 = (void *)v102;
    v100[1] = v86;
    -[CPSSecondaryManeuverView setStyle:](v87, "setStyle:", v86);
    v92 = MEMORY[0x24BDAC760];
    v93 = -1073741824;
    v94 = 0;
    v95 = __45__CPSSecondaryManeuverView_initWithManeuver___block_invoke;
    v96 = &unk_24E271500;
    v99[1] = &v103;
    v97 = location[0];
    v98 = v113;
    v99[0] = v110;
    v100[0] = (id)MEMORY[0x2207AE654](&v92);
    v91 = (id)objc_msgSend(location[0], "symbolImage");
    v90 = 0;
    v89 = objc_msgSend(location[0], "displayStyle");
    -[CPSSecondaryManeuverView horizontalInset](v113, "horizontalInset");
    v88 = v6;
    if (!v91 || v89 == 4)
    {
      (*((void (**)(void))v100[0] + 2))();
      v18 = v110;
      v17 = (id)objc_msgSend((id)v104[5], "leadingAnchor");
      v16 = (id)-[CPSSecondaryManeuverView leadingAnchor](v113, "leadingAnchor");
      v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:", v88);
      objc_msgSend(v18, "addObject:");

      v14 = v110;
      v13 = (id)objc_msgSend((id)v104[5], "trailingAnchor");
      v12 = (id)-[CPSSecondaryManeuverView trailingAnchor](v113, "trailingAnchor");
      v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:constant:", -v88);
      objc_msgSend(v14, "addObject:");

    }
    else
    {
      v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v91);
      v7 = v90;
      v90 = v85;

      objc_msgSend(v85, "setContentMode:", 1);
      objc_msgSend(v85, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v84 = -[CPSSecondaryManeuverView accessibilityName:](v113, "accessibilityName:", CFSTR("Symbol"));
      objc_msgSend(v85, "setAccessibilityLabel:");

      -[CPSSecondaryManeuverView addSubview:](v113, "addSubview:", v85);
      v83 = v110;
      v82 = (id)objc_msgSend(v85, "topAnchor");
      v81 = (id)-[CPSSecondaryManeuverView topAnchor](v113, "topAnchor");
      v80 = (id)objc_msgSend(v82, "constraintEqualToAnchor:constant:", 6.0);
      objc_msgSend(v83, "addObject:");

      v79 = v110;
      v78 = (id)objc_msgSend(v85, "bottomAnchor");
      v77 = (id)-[CPSSecondaryManeuverView bottomAnchor](v113, "bottomAnchor");
      v76 = (id)objc_msgSend(v78, "constraintLessThanOrEqualToAnchor:constant:", -6.0);
      objc_msgSend(v79, "addObject:");

      v75 = v110;
      v74 = (id)objc_msgSend(v85, "heightAnchor");
      v73 = (id)objc_msgSend(v74, "constraintLessThanOrEqualToConstant:", 18.0);
      objc_msgSend(v75, "addObject:");

      if (v89 == 3)
      {
        v72 = v110;
        v71 = (id)objc_msgSend(v90, "leadingAnchor");
        v70 = (id)-[CPSSecondaryManeuverView leadingAnchor](v113, "leadingAnchor");
        v69 = (id)objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:constant:", v88);
        objc_msgSend(v72, "addObject:");

        v68 = v110;
        v67 = (id)objc_msgSend(v90, "trailingAnchor");
        v66 = (id)-[CPSSecondaryManeuverView trailingAnchor](v113, "trailingAnchor");
        v65 = (id)objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:constant:", -v88);
        objc_msgSend(v68, "addObject:");

        v64 = v110;
        v63 = (id)objc_msgSend(v90, "centerXAnchor");
        v62 = (id)-[CPSSecondaryManeuverView centerXAnchor](v113, "centerXAnchor");
        v61 = (id)objc_msgSend(v63, "constraintEqualToAnchor:");
        objc_msgSend(v64, "addObject:");

        v60 = v110;
        v59 = (id)objc_msgSend(v90, "widthAnchor");
        v58 = (id)objc_msgSend(v59, "constraintLessThanOrEqualToConstant:", 120.0);
        objc_msgSend(v60, "addObject:");

        v57 = v110;
        v56 = (id)objc_msgSend(v90, "topAnchor");
        v55 = (id)-[CPSSecondaryManeuverView topAnchor](v113, "topAnchor");
        v54 = (id)objc_msgSend(v56, "constraintEqualToAnchor:constant:", 6.0);
        objc_msgSend(v57, "addObject:");

        v53 = v110;
        v52 = (id)objc_msgSend(v90, "bottomAnchor");
        v51 = (id)-[CPSSecondaryManeuverView bottomAnchor](v113, "bottomAnchor");
        v50 = (id)objc_msgSend(v52, "constraintEqualToAnchor:constant:", -6.0);
        objc_msgSend(v53, "addObject:");

      }
      else
      {
        (*((void (**)(void))v100[0] + 2))();
        v49 = v110;
        v48 = (id)objc_msgSend(v90, "widthAnchor");
        v47 = (id)objc_msgSend(v48, "constraintLessThanOrEqualToConstant:", 18.0);
        objc_msgSend(v49, "addObject:");

        v46 = v110;
        v45 = (id)objc_msgSend((id)v104[5], "lastBaselineAnchor");
        v44 = (id)objc_msgSend(v90, "bottomAnchor");
        v43 = (id)objc_msgSend(v45, "constraintEqualToAnchor:");
        objc_msgSend(v46, "addObject:");

        if (v89 > 1)
        {
          if (v89 == 2)
          {
            v30 = v110;
            v29 = (id)objc_msgSend((id)v104[5], "leadingAnchor");
            v28 = (id)-[CPSSecondaryManeuverView leadingAnchor](v113, "leadingAnchor");
            v27 = (id)objc_msgSend(v29, "constraintEqualToAnchor:constant:", v88);
            objc_msgSend(v30, "addObject:");

            v26 = v110;
            v25 = (id)objc_msgSend(v90, "leadingAnchor");
            v24 = (id)objc_msgSend((id)v104[5], "trailingAnchor");
            v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:constant:", v88);
            objc_msgSend(v26, "addObject:");

            v22 = v110;
            v21 = (id)objc_msgSend(v90, "trailingAnchor");
            v20 = (id)-[CPSSecondaryManeuverView trailingAnchor](v113, "trailingAnchor");
            v19 = (id)objc_msgSend(v21, "constraintEqualToAnchor:constant:", -v88);
            objc_msgSend(v22, "addObject:");

          }
        }
        else
        {
          v42 = v110;
          v41 = (id)objc_msgSend(v90, "leadingAnchor");
          v40 = (id)-[CPSSecondaryManeuverView leadingAnchor](v113, "leadingAnchor");
          v39 = (id)objc_msgSend(v41, "constraintEqualToAnchor:constant:", v88);
          objc_msgSend(v42, "addObject:");

          v38 = v110;
          v37 = (id)objc_msgSend((id)v104[5], "leadingAnchor");
          v36 = (id)objc_msgSend(v90, "trailingAnchor");
          v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:constant:", v88);
          objc_msgSend(v38, "addObject:");

          v34 = v110;
          v33 = (id)objc_msgSend((id)v104[5], "trailingAnchor");
          v32 = (id)-[CPSSecondaryManeuverView trailingAnchor](v113, "trailingAnchor");
          v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:constant:", -v88);
          objc_msgSend(v34, "addObject:");

        }
      }
      objc_storeStrong((id *)&v113->_symbolView, v90);
      LODWORD(v8) = 1148846080;
      -[UIImageView setContentCompressionResistancePriority:forAxis:](v113->_symbolView, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    }
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v110);
    objc_storeStrong(&v90, 0);
    objc_storeStrong(&v91, 0);
    objc_storeStrong(v100, 0);
    objc_storeStrong(v99, 0);
    objc_storeStrong((id *)&v98, 0);
    objc_storeStrong(&v97, 0);
    _Block_object_dispose(&v103, 8);
    objc_storeStrong(&v109, 0);
    objc_storeStrong(&v110, 0);
  }
  v10 = v113;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v113, 0);
  return v10;
}

void __45__CPSSecondaryManeuverView_initWithManeuver___block_invoke(uint64_t a1)
{
  CPSAbridgableLabel *v1;
  uint64_t v2;
  void *v3;
  double v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v22;

  v1 = objc_alloc_init(CPSAbridgableLabel);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

  LODWORD(v4) = 1148846080;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setContentHuggingPriority:forAxis:", 1, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setNumberOfLines:", 0);
  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v18 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  objc_msgSend(v17, "setTextColor:");

  v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v20 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BDF7888]);
  objc_msgSend(v19, "setFont:");

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (id)objc_msgSend(*(id *)(a1 + 32), "attributedInstructionVariants");

  if (v22)
  {
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v16 = (id)objc_msgSend(*(id *)(a1 + 32), "attributedInstructionVariants");
    objc_msgSend(v15, "setAttributedTextVariants:");

  }
  else
  {
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v14 = (id)objc_msgSend(*(id *)(a1 + 32), "instructionVariants");
    objc_msgSend(v13, "setTextVariants:");

  }
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v5 = *(void **)(a1 + 48);
  v8 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "topAnchor");
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "topAnchor");
  v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:constant:", 6.0);
  objc_msgSend(v5, "addObject:");

  v9 = *(void **)(a1 + 48);
  v12 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "bottomAnchor");
  v11 = (id)objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
  v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:constant:", -6.0);
  objc_msgSend(v9, "addObject:");

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 464), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

- (void)generateLayoutConfigurationsForSizeIfNecessary:(CGSize)a3 force:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CPSSecondaryManeuverView *v9;
  CPManeuver *v10;
  CPSSecondaryManeuverView *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  CPSSecondaryManeuverView *v18;
  char v19;
  char v20;
  BOOL v21;
  BOOL v22;
  SEL v23;
  CPSSecondaryManeuverView *v24;
  CGSize v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v24 = self;
  v23 = a2;
  v22 = a4;
  v16 = (id)objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v17 = objc_msgSend(v16, "userInterfaceIdiom") == 3;

  v21 = v17;
  v20 = BSFloatIsZero() & 1;
  -[CPSSecondaryManeuverView generatedWidth](v24, "generatedWidth");
  v19 = BSFloatEqualToFloat() & 1;
  if (v17 && (v20 & 1) == 0 && (v19 & 1) == 0 || v22)
  {
    -[CPSSecondaryManeuverView setGeneratedWidth:](v24, "setGeneratedWidth:", v25.width);
    v9 = [CPSSecondaryManeuverView alloc];
    v10 = -[CPSSecondaryManeuverView maneuver](v24, "maneuver");
    v18 = -[CPSSecondaryManeuverView initWithManeuver:](v9, "initWithManeuver:");

    v11 = v18;
    CGRectMake_7();
    -[CPSSecondaryManeuverView setFrame:](v11, "setFrame:", v4, v5, v6, v7);
    v12 = (void *)MEMORY[0x24BDD1628];
    v15 = (id)-[CPSSecondaryManeuverView widthAnchor](v18, "widthAnchor");
    v14 = (id)objc_msgSend(v15, "constraintEqualToConstant:", v25.width);
    v26[0] = v14;
    v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    objc_msgSend(v12, "activateConstraints:");

    -[CPSSecondaryManeuverView layoutIfNeeded](v18, "layoutIfNeeded");
    -[CPSSecondaryManeuverView bounds](v18, "bounds");
    -[CPSSecondaryManeuverView setGeneratedHeight:](v24, "setGeneratedHeight:", v8);
    objc_storeStrong((id *)&v18, 0);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  double v3;
  double v4;
  UIImage *v5;
  CPManeuver *v6;
  UIImageView *v7;
  id v8;
  UIImageView *v9;
  CPSSecondaryManeuverView *v10;
  objc_super v11;
  id location[2];
  CPSSecondaryManeuverView *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11.receiver = v13;
  v11.super_class = (Class)CPSSecondaryManeuverView;
  -[CPSSecondaryManeuverView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, location[0]);
  v7 = -[CPSSecondaryManeuverView symbolView](v13, "symbolView");
  v6 = -[CPSSecondaryManeuverView maneuver](v13, "maneuver");
  v5 = -[CPManeuver symbolImage](v6, "symbolImage");
  -[UIImageView setImage:](v7, "setImage:");

  v9 = -[CPSSecondaryManeuverView symbolView](v13, "symbolView");
  v8 = -[CPSSecondaryManeuverView accessibilityName:](v13, "accessibilityName:", CFSTR("Symbol"));
  -[UIImageView setAccessibilityLabel:](v9, "setAccessibilityLabel:");

  v10 = v13;
  -[CPSSecondaryManeuverView bounds](v13, "bounds");
  -[CPSSecondaryManeuverView generateLayoutConfigurationsForSizeIfNecessary:force:](v10, "generateLayoutConfigurationsForSizeIfNecessary:force:", 1, v3, v4);
  objc_storeStrong(location, 0);
}

- (double)horizontalInset
{
  return 9.0;
}

- (CPManeuver)maneuver
{
  return self->_maneuver;
}

- (double)generatedHeight
{
  return self->_generatedHeight;
}

- (void)setGeneratedHeight:(double)a3
{
  self->_generatedHeight = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (CPTravelEstimates)currentTravelEstimates
{
  return self->_currentTravelEstimates;
}

- (void)setCurrentTravelEstimates:(id)a3
{
  id location[2];
  CPSSecondaryManeuverView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_currentTravelEstimates, location[0]);
  objc_storeStrong(location, 0);
}

- (unint64_t)guidanceStyle
{
  return self->_guidanceStyle;
}

- (void)setGuidanceStyle:(unint64_t)a3
{
  self->_guidanceStyle = a3;
}

- (UIImageView)symbolView
{
  return self->_symbolView;
}

- (void)setSymbolView:(id)a3
{
  objc_storeStrong((id *)&self->_symbolView, a3);
}

- (CPSAbridgableLabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionLabel, a3);
}

- (double)generatedWidth
{
  return self->_generatedWidth;
}

- (void)setGeneratedWidth:(double)a3
{
  self->_generatedWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_symbolView, 0);
  objc_storeStrong((id *)&self->_currentTravelEstimates, 0);
  objc_storeStrong((id *)&self->_maneuver, 0);
}

@end

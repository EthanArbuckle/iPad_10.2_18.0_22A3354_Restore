@implementation CPSPagingTripPreviewsCardView

- (CPSPagingTripPreviewsCardView)initWithTripDelegate:(id)a3 trips:(id)a4 textConfiguration:(id)a5
{
  CPSPagingTripPreviewsCardView *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *estimatesForTripIdentifiers;
  id v8;
  id v9;
  double v10;
  NSLayoutConstraint *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  NSString *v17;
  CPSHairlineBorderedView *v18;
  id v19;
  id v20;
  CPSHairlineBorderedView *v21;
  CPSPagingTripPreviewsCardView *v23;
  NSString *v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  NSString *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  CPSCardPlatterView *v38;
  CPSPagingTripPreviewsCardView *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  NSLayoutConstraint *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  CPSCardPlatterView *v53;
  void *v54;
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
  CPSPagingTripPreviewsCardView *v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  CPSCardPlatterView *v79;
  CPSPagingTripPreviewsCardView *v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  NSLayoutConstraint *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  CPTripPreviewTextConfiguration *v94;
  NSString *v95;
  CPSCardPlatterView *v96;
  id v97;
  CPSPagingControlView *v98;
  id v99;
  BOOL v100;
  CPSCardPlatterView *v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  char v119;
  id v120;
  NSString *v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  objc_super v131;
  id v132;
  id v133;
  id location[2];
  CPSPagingTripPreviewsCardView *v135;
  _QWORD v136[5];
  _QWORD v137[4];
  _QWORD v138[2];
  _QWORD v139[2];
  _QWORD v140[2];
  _QWORD v141[2];
  _QWORD v142[3];
  _QWORD v143[3];
  _QWORD v144[4];

  v144[3] = *MEMORY[0x24BDAC8D0];
  v135 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v133 = 0;
  objc_storeStrong(&v133, a4);
  v132 = 0;
  objc_storeStrong(&v132, a5);
  v5 = v135;
  v135 = 0;
  v131.receiver = v5;
  v131.super_class = (Class)CPSPagingTripPreviewsCardView;
  v135 = -[CPSTripPreviewsCardView initWithTripDelegate:trips:textConfiguration:](&v131, sel_initWithTripDelegate_trips_textConfiguration_, location[0], v133, v132);
  objc_storeStrong((id *)&v135, v135);
  if (v135)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    estimatesForTripIdentifiers = v135->_estimatesForTripIdentifiers;
    v135->_estimatesForTripIdentifiers = v6;

    v130 = (id)-[CPSPagingTripPreviewsCardView topAnchor](v135, "topAnchor");
    if ((unint64_t)objc_msgSend(v133, "count") > 1)
    {
      v129 = objc_alloc_init(CPSPagingControlView);
      objc_msgSend(v129, "setPageCount:", objc_msgSend(v133, "count"));
      objc_msgSend(v129, "setPagingDelegate:", v135);
      v101 = -[CPSTripPreviewsCardView platterView](v135, "platterView");
      -[CPSCardPlatterView addSubview:](v101, "addSubview:", v129);

      objc_storeStrong((id *)&v135->_pageControl, v129);
      v102 = (id)objc_msgSend(v129, "topAnchor");
      v128 = (id)objc_msgSend(v102, "constraintEqualToAnchor:constant:", v130, 6.0);

      v103 = (void *)MEMORY[0x24BDD1628];
      v144[0] = v128;
      v110 = (id)objc_msgSend(v129, "leadingAnchor");
      v109 = (id)-[CPSPagingTripPreviewsCardView leadingAnchor](v135, "leadingAnchor");
      v108 = (id)objc_msgSend(v110, "constraintEqualToAnchor:");
      v144[1] = v108;
      v107 = (id)objc_msgSend(v129, "trailingAnchor");
      v106 = (id)-[CPSPagingTripPreviewsCardView trailingAnchor](v135, "trailingAnchor");
      v105 = (id)objc_msgSend(v107, "constraintEqualToAnchor:");
      v144[2] = v105;
      v104 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v144, 3);
      objc_msgSend(v103, "activateConstraints:");

      -[CPSPagingTripPreviewsCardView setContentTopConstraint:](v135, "setContentTopConstraint:", v128);
      v8 = (id)objc_msgSend(v129, "bottomAnchor");
      v9 = v130;
      v130 = v8;

      objc_storeStrong(&v128, 0);
      objc_storeStrong(&v129, 0);
    }
    v127 = objc_alloc_init(CPSRouteOverviewView);
    objc_storeStrong((id *)&v135->_overviewView, v127);
    v96 = -[CPSTripPreviewsCardView platterView](v135, "platterView");
    -[CPSCardPlatterView addSubview:](v96, "addSubview:", v127);

    v99 = (id)objc_msgSend(v127, "topAnchor");
    v97 = v130;
    v98 = -[CPSPagingTripPreviewsCardView pageControl](v135, "pageControl");
    v10 = 0.0;
    if (!v98)
      v10 = 5.0;
    v126 = (id)objc_msgSend(v99, "constraintEqualToAnchor:constant:", v97, v10);

    v11 = -[CPSPagingTripPreviewsCardView contentTopConstraint](v135, "contentTopConstraint");
    v100 = v11 != 0;

    if (!v100)
      -[CPSPagingTripPreviewsCardView setContentTopConstraint:](v135, "setContentTopConstraint:", v126);
    v71 = (void *)MEMORY[0x24BDD1628];
    v78 = (id)objc_msgSend(v127, "leadingAnchor");
    v77 = (id)-[CPSPagingTripPreviewsCardView leadingAnchor](v135, "leadingAnchor");
    v76 = (id)objc_msgSend(v78, "constraintEqualToAnchor:");
    v143[0] = v76;
    v75 = (id)objc_msgSend(v127, "trailingAnchor");
    v74 = (id)-[CPSPagingTripPreviewsCardView trailingAnchor](v135, "trailingAnchor");
    v73 = (id)objc_msgSend(v75, "constraintEqualToAnchor:");
    v143[1] = v73;
    v143[2] = v126;
    v72 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v143);
    objc_msgSend(v71, "activateConstraints:");

    v12 = (id)objc_msgSend(v127, "bottomAnchor");
    v13 = v130;
    v130 = v12;

    v125 = objc_alloc_init(CPSAlternateRoutesView);
    objc_msgSend(v125, "setSelectionDelegate:", v135);
    v124 = -[CPSHairlineBorderedView initWithContentView:borderEdges:]([CPSHairlineBorderedView alloc], "initWithContentView:borderEdges:", v125);
    objc_storeStrong((id *)&v135->_borderedAlternatesView, v124);
    objc_msgSend(v124, "setClipsToBounds:", 1);
    v79 = -[CPSTripPreviewsCardView platterView](v135, "platterView");
    -[CPSCardPlatterView addSubview:](v79, "addSubview:", v124);

    v80 = v135;
    v82 = (id)objc_msgSend(v124, "heightAnchor");
    v81 = (id)objc_msgSend(v82, "constraintEqualToConstant:", 0.0);
    -[CPSPagingTripPreviewsCardView setAlternateRoutesHeightConstraint:](v80, "setAlternateRoutesHeightConstraint:");

    v83 = (void *)MEMORY[0x24BDD1628];
    v91 = (id)objc_msgSend(v124, "leadingAnchor");
    v90 = (id)-[CPSPagingTripPreviewsCardView leadingAnchor](v135, "leadingAnchor");
    v89 = (id)objc_msgSend(v91, "constraintEqualToAnchor:");
    v142[0] = v89;
    v88 = (id)objc_msgSend(v124, "trailingAnchor");
    v87 = (id)-[CPSPagingTripPreviewsCardView trailingAnchor](v135, "trailingAnchor");
    v86 = (id)objc_msgSend(v88, "constraintEqualToAnchor:");
    v142[1] = v86;
    v85 = -[CPSPagingTripPreviewsCardView alternateRoutesHeightConstraint](v135, "alternateRoutesHeightConstraint");
    v142[2] = v85;
    v84 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v142, 3);
    objc_msgSend(v83, "activateConstraints:");

    v92 = v130;
    v93 = (id)objc_msgSend(v124, "topAnchor");
    v123 = (id)objc_msgSend(v92, "constraintEqualToAnchor:");

    -[CPSPagingTripPreviewsCardView setContentBottomConstraint:](v135, "setContentBottomConstraint:", v123);
    -[CPSPagingTripPreviewsCardView addConstraint:](v135, "addConstraint:", v123);
    v14 = (id)objc_msgSend(v124, "bottomAnchor");
    v15 = v130;
    v130 = v14;

    v122 = (id)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
    objc_msgSend(v122, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v16) = 1148846080;
    objc_msgSend(v122, "setContentHuggingPriority:forAxis:", 1, v16);
    objc_storeStrong((id *)&v135->_moreRoutesButton, v122);
    v94 = -[CPSTripPreviewsCardView textConfiguration](v135, "textConfiguration");
    v95 = -[CPTripPreviewTextConfiguration additionalRoutesButtonTitle](v94, "additionalRoutesButtonTitle");
    v119 = 0;
    if (v95)
    {
      v17 = v95;
    }
    else
    {
      v120 = CPSLocalizedStringForKey(CFSTR("MORE_ROUTES"));
      v119 = 1;
      v17 = (NSString *)v120;
    }
    v121 = v17;
    if ((v119 & 1) != 0)

    v118 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 16.0);
    v25 = objc_alloc(MEMORY[0x24BDD1458]);
    v24 = v121;
    v28 = (_QWORD *)MEMORY[0x24BDF65F8];
    v140[0] = *MEMORY[0x24BDF65F8];
    v141[0] = v118;
    v29 = (_QWORD *)MEMORY[0x24BDF6600];
    v140[1] = *MEMORY[0x24BDF6600];
    v27 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    v141[1] = v27;
    v26 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v141, v140);
    v117 = (id)objc_msgSend(v25, "initWithString:attributes:", v24);

    objc_msgSend(v122, "setAttributedTitle:forState:", v117);
    v31 = objc_alloc(MEMORY[0x24BDD1458]);
    v30 = v121;
    v138[0] = *v28;
    v139[0] = v118;
    v138[1] = *v29;
    v33 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    v139[1] = v33;
    v32 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v139, v138, 2);
    v116 = (id)objc_msgSend(v31, "initWithString:attributes:", v30);

    objc_msgSend(v122, "setAttributedTitle:forState:", v116);
    v34 = v122;
    v35 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    objc_msgSend(v34, "cps_setBackgroundColor:forState:");

    objc_msgSend(v122, "setContentHorizontalAlignment:", 0);
    objc_msgSend(v122, "setOpaque:", 1);
    v36 = v122;
    v37 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
    objc_msgSend(v36, "cps_setBackgroundColor:forState:");

    objc_msgSend(v122, "addTarget:action:forControlEvents:", v135, sel__toggleMoreRoutesButtonPressed_, 0x2000);
    v18 = [CPSHairlineBorderedView alloc];
    v115 = -[CPSHairlineBorderedView initWithContentView:borderEdges:](v18, "initWithContentView:borderEdges:", v122);
    objc_storeStrong((id *)&v135->_borderedMoreRoutesButton, v115);
    v38 = -[CPSTripPreviewsCardView platterView](v135, "platterView");
    -[CPSCardPlatterView addSubview:](v38, "addSubview:", v115);

    objc_msgSend(v115, "setClipsToBounds:", 1);
    v39 = v135;
    v41 = (id)objc_msgSend(v115, "heightAnchor");
    v40 = (id)objc_msgSend(v41, "constraintEqualToConstant:");
    -[CPSPagingTripPreviewsCardView setToggleRoutesButtonHeightConstraint:](v39, "setToggleRoutesButtonHeightConstraint:");

    v42 = (void *)MEMORY[0x24BDD1628];
    v52 = (id)objc_msgSend(v115, "leadingAnchor");
    v51 = (id)-[CPSPagingTripPreviewsCardView leadingAnchor](v135, "leadingAnchor");
    v50 = (id)objc_msgSend(v52, "constraintEqualToAnchor:");
    v137[0] = v50;
    v49 = (id)objc_msgSend(v115, "trailingAnchor");
    v48 = (id)-[CPSPagingTripPreviewsCardView trailingAnchor](v135, "trailingAnchor");
    v47 = (id)objc_msgSend(v49, "constraintEqualToAnchor:");
    v137[1] = v47;
    v46 = (id)objc_msgSend(v115, "topAnchor");
    v45 = (id)objc_msgSend(v46, "constraintEqualToAnchor:", v130);
    v137[2] = v45;
    v44 = -[CPSPagingTripPreviewsCardView toggleRoutesButtonHeightConstraint](v135, "toggleRoutesButtonHeightConstraint");
    v137[3] = v44;
    v43 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v137, 4);
    objc_msgSend(v42, "activateConstraints:");

    v19 = (id)objc_msgSend(v115, "bottomAnchor");
    v20 = v130;
    v130 = v19;

    v114 = -[CPSTripPreviewsCardView setupGoButton](v135, "setupGoButton");
    v21 = [CPSHairlineBorderedView alloc];
    v113 = -[CPSHairlineBorderedView initWithContentView:borderEdges:](v21, "initWithContentView:borderEdges:", v114, 1);
    objc_storeStrong((id *)&v135->_borderedGoButton, v113);
    v53 = -[CPSTripPreviewsCardView platterView](v135, "platterView");
    -[CPSCardPlatterView addSubview:](v53, "addSubview:", v113);

    v54 = (void *)MEMORY[0x24BDD1628];
    v68 = (id)objc_msgSend(v113, "leadingAnchor");
    v67 = (id)-[CPSPagingTripPreviewsCardView leadingAnchor](v135, "leadingAnchor");
    v66 = (id)objc_msgSend(v68, "constraintEqualToAnchor:");
    v136[0] = v66;
    v65 = (id)objc_msgSend(v113, "trailingAnchor");
    v64 = (id)-[CPSPagingTripPreviewsCardView trailingAnchor](v135, "trailingAnchor");
    v63 = (id)objc_msgSend(v65, "constraintEqualToAnchor:");
    v136[1] = v63;
    v62 = (id)objc_msgSend(v113, "topAnchor");
    v61 = (id)objc_msgSend(v62, "constraintEqualToAnchor:", v130);
    v136[2] = v61;
    v60 = (id)objc_msgSend(v113, "heightAnchor");
    v59 = (id)objc_msgSend(v60, "constraintEqualToConstant:", 29.0);
    v136[3] = v59;
    v58 = (id)objc_msgSend(v113, "bottomAnchor");
    v57 = (id)-[CPSPagingTripPreviewsCardView bottomAnchor](v135, "bottomAnchor");
    v56 = (id)objc_msgSend(v58, "constraintEqualToAnchor:");
    v136[4] = v56;
    v55 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v136, 5);
    objc_msgSend(v54, "activateConstraints:");

    v69 = v135;
    v70 = (id)objc_msgSend(v133, "firstObject");
    -[CPSPagingTripPreviewsCardView setSelectedTrip:](v69, "setSelectedTrip:");

    objc_storeStrong(&v113, 0);
    objc_storeStrong(&v114, 0);
    objc_storeStrong(&v115, 0);
    objc_storeStrong(&v116, 0);
    objc_storeStrong(&v117, 0);
    objc_storeStrong(&v118, 0);
    objc_storeStrong((id *)&v121, 0);
    objc_storeStrong(&v122, 0);
    objc_storeStrong(&v123, 0);
    objc_storeStrong(&v124, 0);
    objc_storeStrong(&v125, 0);
    objc_storeStrong(&v126, 0);
    objc_storeStrong(&v127, 0);
    objc_storeStrong(&v130, 0);
  }
  v23 = v135;
  objc_storeStrong(&v132, 0);
  objc_storeStrong(&v133, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v135, 0);
  return v23;
}

- (void)_updateButtonColors
{
  id v2;
  UIButton *v3;
  id v4;
  UIButton *v5;
  objc_super v6;
  SEL v7;
  CPSPagingTripPreviewsCardView *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)CPSPagingTripPreviewsCardView;
  -[CPSTripPreviewsCardView _updateButtonColors](&v6, sel__updateButtonColors);
  v3 = -[CPSPagingTripPreviewsCardView moreRoutesButton](v8, "moreRoutesButton");
  v2 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  -[UIButton cps_setBackgroundColor:forState:](v3, "cps_setBackgroundColor:forState:");

  v5 = -[CPSPagingTripPreviewsCardView moreRoutesButton](v8, "moreRoutesButton");
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  -[UIButton cps_setBackgroundColor:forState:](v5, "cps_setBackgroundColor:forState:");

}

- (void)setSelectedTrip:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  CPSRouteOverviewView *v7;
  NSLayoutConstraint *v8;
  id v9;
  NSMutableDictionary *v10;
  CPSHairlineBorderedView *v11;
  id v12;
  CPSHairlineBorderedView *v13;
  id v14;
  CPSRouteOverviewView *v15;
  CPSHairlineBorderedView *v16;
  id v17;
  id v18;
  id v19;
  CPSRouteOverviewView *v20;
  NSArray *v21;
  CPSPagingControlView *v22;
  CPSRouteOverviewView *v23;
  CPSHairlineBorderedView *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  id location[2];
  CPSPagingTripPreviewsCardView *v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29.receiver = v31;
  v29.super_class = (Class)CPSPagingTripPreviewsCardView;
  -[CPSTripPreviewsCardView setSelectedTrip:](&v29, sel_setSelectedTrip_, location[0]);
  v22 = -[CPSPagingTripPreviewsCardView pageControl](v31, "pageControl");
  v21 = -[CPSTripPreviewsCardView trips](v31, "trips");
  -[CPSPagingControlView setPageIndex:](v22, "setPageIndex:", -[NSArray indexOfObject:](v21, "indexOfObject:", location[0]));

  v23 = -[CPSPagingTripPreviewsCardView overviewView](v31, "overviewView");
  -[CPSRouteOverviewView setRepresentedTrip:](v23, "setRepresentedTrip:", location[0]);

  v28 = (id)objc_msgSend(location[0], "routeChoices");
  v27 = 0;
  v24 = -[CPSPagingTripPreviewsCardView borderedAlternatesView](v31, "borderedAlternatesView");
  v26 = -[CPSHairlineBorderedView contentView](v24, "contentView");

  if ((unint64_t)objc_msgSend(v28, "count") <= 1)
  {
    v11 = -[CPSPagingTripPreviewsCardView borderedMoreRoutesButton](v31, "borderedMoreRoutesButton");
    -[CPSHairlineBorderedView setHidden:](v11, "setHidden:", 1);

    objc_msgSend(v26, "setHidden:", 1);
    v15 = -[CPSPagingTripPreviewsCardView overviewView](v31, "overviewView");
    v14 = (id)-[CPSRouteOverviewView bottomAnchor](v15, "bottomAnchor");
    v13 = -[CPSPagingTripPreviewsCardView borderedGoButton](v31, "borderedGoButton");
    v12 = (id)-[CPSHairlineBorderedView topAnchor](v13, "topAnchor");
    v5 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v6 = v27;
    v27 = v5;

  }
  else
  {
    v16 = -[CPSPagingTripPreviewsCardView borderedMoreRoutesButton](v31, "borderedMoreRoutesButton");
    -[CPSHairlineBorderedView setHidden:](v16, "setHidden:", 0);

    objc_msgSend(v26, "setHidden:", 0);
    objc_msgSend(v26, "setIndexForSelectedRoute:", 0);
    v17 = (id)objc_msgSend(location[0], "routeChoices");
    objc_msgSend(v26, "setAvailableRouteChoices:");

    v20 = -[CPSPagingTripPreviewsCardView overviewView](v31, "overviewView");
    v19 = (id)-[CPSRouteOverviewView bottomAnchor](v20, "bottomAnchor");
    v18 = (id)objc_msgSend(v26, "topAnchor");
    v3 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v4 = v27;
    v27 = v3;

  }
  v8 = -[CPSPagingTripPreviewsCardView contentBottomConstraint](v31, "contentBottomConstraint");
  -[NSLayoutConstraint setActive:](v8, "setActive:", 0);

  -[CPSPagingTripPreviewsCardView setContentBottomConstraint:](v31, "setContentBottomConstraint:", v27);
  -[CPSPagingTripPreviewsCardView addConstraint:](v31, "addConstraint:", v27);
  v10 = -[CPSPagingTripPreviewsCardView estimatesForTripIdentifiers](v31, "estimatesForTripIdentifiers");
  v9 = (id)objc_msgSend(location[0], "identifier");
  v25 = (id)-[NSMutableDictionary objectForKey:](v10, "objectForKey:");

  if (v25)
  {
    v7 = -[CPSPagingTripPreviewsCardView overviewView](v31, "overviewView");
    -[CPSRouteOverviewView setCurrentTravelEstimates:](v7, "setCurrentTravelEstimates:", v25);

  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)_setOverviewCollapsed:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CPSPagingControlView *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  CPSPagingControlView *v23;
  void *v24;
  UIView *v25;
  CPSHairlineBorderedView *v26;
  CPSRouteOverviewView *v27;
  double MaxY;
  double v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *v31;
  UIButton *v32;
  CPSPagingControlView *v33;
  UIButton *v34;
  CPSPagingControlView *v35;
  uint64_t v36;
  int v37;
  int v38;
  void (*v39)(uint64_t);
  void *v40;
  CPSPagingTripPreviewsCardView *v41;
  BOOL v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t (*v46)(uint64_t);
  void *v47;
  CPSPagingTripPreviewsCardView *v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t (*v52)(uint64_t);
  void *v53;
  CPSPagingTripPreviewsCardView *v54;
  id v55[5];
  id v56[14];
  CPSHairlineBorderedView *v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  BOOL v63;
  SEL v64;
  CPSPagingTripPreviewsCardView *v65;

  v65 = self;
  v64 = a2;
  v63 = a3;
  v62 = 0.0;
  v61 = 0.0;
  v60 = 0.0;
  v59 = 0;
  v58 = 0.0;
  v57 = -[CPSPagingTripPreviewsCardView borderedAlternatesView](self, "borderedAlternatesView");
  if (v63)
  {
    v27 = -[CPSPagingTripPreviewsCardView overviewView](v65, "overviewView");
    -[CPSRouteOverviewView frame](v27, "frame");
    v56[9] = v3;
    v56[10] = v4;
    v56[11] = v5;
    v56[12] = v6;
    MaxY = UIRectGetMaxY(*(double *)&v3, *(double *)&v4, *(double *)&v5, *(double *)&v6);
    -[CPSPagingTripPreviewsCardView bounds](v65, "bounds");
    v56[5] = v7;
    v56[6] = v8;
    v56[7] = v9;
    v56[8] = v10;
    v29 = MaxY - UIRectGetMinY(*(double *)&v7, *(double *)&v8);

    v56[13] = *(id *)&v29;
    v30 = -[CPSPagingTripPreviewsCardView contentTopConstraint](v65, "contentTopConstraint");
    -[NSLayoutConstraint constant](v30, "constant");
    v62 = v11 - v29;

    v61 = v29 + 1.0;
    v31 = -[CPSPagingTripPreviewsCardView toggleRoutesButtonHeightConstraint](v65, "toggleRoutesButtonHeightConstraint");
    -[NSLayoutConstraint constant](v31, "constant");
    v58 = v12;

    v60 = v29 + 1.0;
    v59 = 0;
    v33 = -[CPSPagingTripPreviewsCardView pageControl](v65, "pageControl");
    v32 = -[CPSPagingControlView previousButton](v33, "previousButton");
    -[UIButton setEnabled:](v32, "setEnabled:", 0);

    v35 = -[CPSPagingTripPreviewsCardView pageControl](v65, "pageControl");
    v34 = -[CPSPagingControlView nextButton](v35, "nextButton");
    -[UIButton setEnabled:](v34, "setEnabled:", 0);

  }
  else
  {
    v13 = -[CPSPagingTripPreviewsCardView pageControl](v65, "pageControl");
    v14 = 6.0;
    if (!v13)
      v14 = 5.0;
    v62 = v14;

    v61 = 0.0;
    v60 = 0.0;
    -[CPSHairlineBorderedView bounds](v57, "bounds");
    v56[1] = v15;
    v56[2] = v16;
    v56[3] = v17;
    v56[4] = v18;
    v59 = v18;
    v23 = -[CPSPagingTripPreviewsCardView pageControl](v65, "pageControl");
    -[CPSPagingControlView enablePageControlsIfNecessary](v23, "enablePageControlsIfNecessary");

    v24 = (void *)objc_opt_class();
    v26 = -[CPSPagingTripPreviewsCardView borderedMoreRoutesButton](v65, "borderedMoreRoutesButton");
    v25 = -[CPSHairlineBorderedView contentView](v26, "contentView");
    v56[0] = CPSSafeCast_21(v24, v25);

    objc_msgSend(v56[0], "setEnabled:", 1);
    v58 = 29.0;
    objc_storeStrong(v56, 0);
  }
  v19 = -[CPSHairlineBorderedView bottomConstraint](v57, "bottomConstraint");
  -[NSLayoutConstraint setConstant:](v19, "setConstant:", v60);

  -[CPSPagingTripPreviewsCardView layoutIfNeeded](v65, "layoutIfNeeded");
  v20 = (void *)MEMORY[0x24BDF6F90];
  v21 = MEMORY[0x24BDAC760];
  v49 = MEMORY[0x24BDAC760];
  v50 = -1073741824;
  v51 = 0;
  v52 = __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke;
  v53 = &unk_24E271178;
  v54 = v65;
  v55[1] = *(id *)&v62;
  v55[2] = *(id *)&v61;
  v55[0] = v57;
  v55[3] = v59;
  v55[4] = *(id *)&v58;
  v43 = v21;
  v44 = -1073741824;
  v45 = 0;
  v46 = __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke_2;
  v47 = &unk_24E26F168;
  v48 = v65;
  objc_msgSend(v20, "animateWithDuration:animations:completion:", &v49, &v43, 0.3);
  v22 = (void *)MEMORY[0x24BDF6F90];
  v36 = v21;
  v37 = -1073741824;
  v38 = 0;
  v39 = __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke_3;
  v40 = &unk_24E26FF88;
  v42 = v63;
  v41 = v65;
  objc_msgSend(v22, "performWithoutAnimation:", &v36);
  objc_storeStrong((id *)&v41, 0);
  objc_storeStrong((id *)&v48, 0);
  objc_storeStrong(v55, 0);
  objc_storeStrong((id *)&v54, 0);
  objc_storeStrong((id *)&v57, 0);
}

uint64_t __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "contentTopConstraint");
  objc_msgSend(v2, "setConstant:", *(double *)(a1 + 48));

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "alternateRoutesHeightConstraint");
  objc_msgSend(v3, "setConstant:", *(double *)(a1 + 56));

  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "bottomConstraint");
  objc_msgSend(v4, "setConstant:", *(double *)(a1 + 64));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "toggleRoutesButtonHeightConstraint");
  objc_msgSend(v5, "setConstant:", *(double *)(a1 + 72));

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __55__CPSPagingTripPreviewsCardView__setOverviewCollapsed___block_invoke_3(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  id location[3];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = 0;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    v14 = (id)objc_msgSend(*(id *)(a1 + 32), "textConfiguration");
    v15 = (id)objc_msgSend(v14, "overviewButtonTitle");
    v23 = 0;
    if (v15)
    {
      objc_storeStrong(location, v15);
    }
    else
    {
      v24 = CPSLocalizedStringForKey(CFSTR("OVERVIEW"));
      v23 = 1;
      objc_storeStrong(location, v24);
    }
    if ((v23 & 1) != 0)

  }
  else
  {
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "textConfiguration");
    v13 = (id)objc_msgSend(v12, "additionalRoutesButtonTitle");
    v21 = 0;
    if (v13)
    {
      objc_storeStrong(location, v13);
    }
    else
    {
      v22 = CPSLocalizedStringForKey(CFSTR("MORE_ROUTES"));
      v21 = 1;
      objc_storeStrong(location, v22);
    }
    if ((v21 & 1) != 0)

  }
  v20 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 16.0);
  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "borderedMoreRoutesButton");
  v19 = (id)objc_msgSend(v1, "contentView");

  v3 = objc_alloc(MEMORY[0x24BDD1458]);
  v2 = location[0];
  v6 = (_QWORD *)MEMORY[0x24BDF65F8];
  v28[0] = *MEMORY[0x24BDF65F8];
  v29[0] = v20;
  v7 = (_QWORD *)MEMORY[0x24BDF6600];
  v28[1] = *MEMORY[0x24BDF6600];
  v5 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  v29[1] = v5;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28);
  v18 = (id)objc_msgSend(v3, "initWithString:attributes:", v2);

  objc_msgSend(v19, "setAttributedTitle:forState:", v18, 0);
  v9 = objc_alloc(MEMORY[0x24BDD1458]);
  v8 = location[0];
  v26[0] = *v6;
  v27[0] = v20;
  v26[1] = *v7;
  v11 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
  v27[1] = v11;
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v17 = (id)objc_msgSend(v9, "initWithString:attributes:", v8);

  objc_msgSend(v19, "setAttributedTitle:forState:", v17, 8);
  objc_msgSend(v19, "layoutIfNeeded");
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)_toggleMoreRoutesButtonPressed:(id)a3
{
  id location[2];
  CPSPagingTripPreviewsCardView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSPagingTripPreviewsCardView setShowMoreRoutes:](v4, "setShowMoreRoutes:", !-[CPSPagingTripPreviewsCardView showMoreRoutes](v4, "showMoreRoutes"));
  -[CPSPagingTripPreviewsCardView _setOverviewCollapsed:](v4, "_setOverviewCollapsed:", -[CPSPagingTripPreviewsCardView showMoreRoutes](v4, "showMoreRoutes"));
  objc_storeStrong(location, 0);
}

- (void)setSelectedRouteChoice:(id)a3
{
  id v3;
  id v4;
  CPSRouteOverviewView *v5;
  objc_super v6;
  id location[2];
  CPSPagingTripPreviewsCardView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)CPSPagingTripPreviewsCardView;
  -[CPSTripPreviewsCardView setSelectedRouteChoice:](&v6, sel_setSelectedRouteChoice_, location[0]);
  v5 = -[CPSPagingTripPreviewsCardView overviewView](v8, "overviewView");
  v4 = (id)objc_msgSend(location[0], "additionalInformationVariants");
  v3 = (id)objc_msgSend(v4, "firstObject");
  -[CPSRouteOverviewView setRouteNote:](v5, "setRouteNote:");

  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forTripIdentifier:(id)a4
{
  CPSRouteOverviewView *v4;
  NSMutableDictionary *v6;
  id v7;
  CPTrip *v8;
  char v9;
  objc_super v10;
  id v11;
  id location[2];
  CPSPagingTripPreviewsCardView *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10.receiver = v13;
  v10.super_class = (Class)CPSPagingTripPreviewsCardView;
  -[CPSTripPreviewsCardView updateEstimates:forTripIdentifier:](&v10, sel_updateEstimates_forTripIdentifier_, location[0], v11);
  v6 = -[CPSPagingTripPreviewsCardView estimatesForTripIdentifiers](v13, "estimatesForTripIdentifiers");
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", location[0], v11);

  v8 = -[CPSTripPreviewsCardView selectedTrip](v13, "selectedTrip");
  v7 = (id)-[CPTrip identifier](v8, "identifier");
  v9 = objc_msgSend(v7, "isEqual:", v11);

  if ((v9 & 1) != 0)
  {
    v4 = -[CPSPagingTripPreviewsCardView overviewView](v13, "overviewView");
    -[CPSRouteOverviewView setCurrentTravelEstimates:](v4, "setCurrentTravelEstimates:", location[0]);

  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)alternateRoutesView:(id)a3 didSelectRouteChoice:(id)a4
{
  id v5;
  id location[2];
  CPSPagingTripPreviewsCardView *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[CPSPagingTripPreviewsCardView setSelectedRouteChoice:](v7, "setSelectedRouteChoice:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)pagingControlView:(id)a3 didSelectPageIndex:(unint64_t)a4
{
  CPSPagingTripPreviewsCardView *v5;
  id v6;
  NSArray *v7;
  id location[2];
  CPSPagingTripPreviewsCardView *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v9;
  v7 = -[CPSTripPreviewsCardView trips](v9, "trips");
  v6 = -[NSArray objectAtIndex:](v7, "objectAtIndex:", a4);
  -[CPSPagingTripPreviewsCardView setSelectedTrip:](v5, "setSelectedTrip:");

  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  UIView *v3;
  CPSHairlineBorderedView *v4;
  CPSHairlineBorderedView *v5;
  id location[2];
  CPSPagingTripPreviewsCardView *v7;
  id v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v7 = self;
  location[1] = (id)a2;
  v5 = -[CPSPagingTripPreviewsCardView borderedGoButton](self, "borderedGoButton");
  location[0] = -[CPSHairlineBorderedView contentView](v5, "contentView");

  if (-[CPSPagingTripPreviewsCardView showMoreRoutes](v7, "showMoreRoutes"))
  {
    v4 = -[CPSPagingTripPreviewsCardView borderedAlternatesView](v7, "borderedAlternatesView");
    v3 = -[CPSHairlineBorderedView contentView](v4, "contentView");
    v10[0] = v3;
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);

  }
  else if (location[0])
  {
    v9 = location[0];
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  }
  else
  {
    v8 = MEMORY[0x24BDBD1A8];
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_linearFocusItems
{
  id v3;
  CPSHairlineBorderedView *v4;
  UIView *v5;
  CPSHairlineBorderedView *v6;
  CPSHairlineBorderedView *v7;
  UIView *v8;
  int v9;
  id v10;
  void *v11;
  UIView *v12;
  CPSHairlineBorderedView *v13;
  id v14;
  CPSPagingControlView *v15;
  CPSPagingControlView *v16;
  id location;
  char v18;
  CPSHairlineBorderedView *v19;
  id v20;
  id v21[2];
  CPSPagingTripPreviewsCardView *v22;

  v22 = self;
  v21[1] = (id)a2;
  v21[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = -[CPSPagingTripPreviewsCardView pageControl](v22, "pageControl");

  if (v16)
  {
    v15 = -[CPSPagingTripPreviewsCardView pageControl](v22, "pageControl");
    v14 = -[CPSPagingControlView _linearFocusItems](v15, "_linearFocusItems");
    objc_msgSend(v21[0], "addObjectsFromArray:");

  }
  v11 = (void *)objc_opt_class();
  v13 = -[CPSPagingTripPreviewsCardView borderedAlternatesView](v22, "borderedAlternatesView");
  v12 = -[CPSHairlineBorderedView contentView](v13, "contentView");
  v20 = CPSSafeCast_21(v11, v12);

  if (v20 && -[CPSPagingTripPreviewsCardView showMoreRoutes](v22, "showMoreRoutes"))
  {
    v10 = (id)objc_msgSend(v20, "_linearFocusItems");
    objc_msgSend(v21[0], "addObjectsFromArray:");

  }
  v7 = -[CPSPagingTripPreviewsCardView borderedMoreRoutesButton](v22, "borderedMoreRoutesButton");
  v8 = -[CPSHairlineBorderedView contentView](v7, "contentView");
  v18 = 0;
  LOBYTE(v9) = 0;
  if ((-[UIView isEnabled](v8, "isEnabled") & 1) != 0)
  {
    v19 = -[CPSPagingTripPreviewsCardView borderedMoreRoutesButton](v22, "borderedMoreRoutesButton");
    v18 = 1;
    v9 = -[CPSHairlineBorderedView isHidden](v19, "isHidden") ^ 1;
  }
  if ((v18 & 1) != 0)

  if ((v9 & 1) != 0)
  {
    v6 = -[CPSPagingTripPreviewsCardView borderedMoreRoutesButton](v22, "borderedMoreRoutesButton");
    v5 = -[CPSHairlineBorderedView contentView](v6, "contentView");
    objc_msgSend(v21[0], "addObject:");

  }
  v4 = -[CPSPagingTripPreviewsCardView borderedGoButton](v22, "borderedGoButton");
  location = -[CPSHairlineBorderedView contentView](v4, "contentView");

  if (location && (objc_msgSend(location, "isHidden") & 1) == 0)
    objc_msgSend(v21[0], "addObject:", location);
  v3 = v21[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
  return v3;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  CPSHairlineBorderedView *v4;
  id v5;
  char v6;
  id location[2];
  CPSPagingTripPreviewsCardView *v8;
  char v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)objc_msgSend(location[0], "nextFocusedView");
  v4 = -[CPSPagingTripPreviewsCardView borderedAlternatesView](v8, "borderedAlternatesView");
  v6 = objc_msgSend(v5, "isDescendantOfView:");

  if ((v6 & 1) != 0)
    v9 = -[CPSPagingTripPreviewsCardView showMoreRoutes](v8, "showMoreRoutes");
  else
    v9 = 1;
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (NSMutableDictionary)estimatesForTripIdentifiers
{
  return self->_estimatesForTripIdentifiers;
}

- (CPSPagingControlView)pageControl
{
  return self->_pageControl;
}

- (CPSRouteOverviewView)overviewView
{
  return self->_overviewView;
}

- (CPSHairlineBorderedView)borderedAlternatesView
{
  return self->_borderedAlternatesView;
}

- (CPSHairlineBorderedView)borderedGoButton
{
  return self->_borderedGoButton;
}

- (CPSHairlineBorderedView)borderedMoreRoutesButton
{
  return self->_borderedMoreRoutesButton;
}

- (UIButton)moreRoutesButton
{
  return self->_moreRoutesButton;
}

- (BOOL)showMoreRoutes
{
  return self->_showMoreRoutes;
}

- (void)setShowMoreRoutes:(BOOL)a3
{
  self->_showMoreRoutes = a3;
}

- (NSLayoutConstraint)contentTopConstraint
{
  return self->_contentTopConstraint;
}

- (void)setContentTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentTopConstraint, a3);
}

- (NSLayoutConstraint)contentBottomConstraint
{
  return self->_contentBottomConstraint;
}

- (void)setContentBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentBottomConstraint, a3);
}

- (NSLayoutConstraint)alternateRoutesHeightConstraint
{
  return self->_alternateRoutesHeightConstraint;
}

- (void)setAlternateRoutesHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_alternateRoutesHeightConstraint, a3);
}

- (NSLayoutConstraint)toggleRoutesButtonHeightConstraint
{
  return self->_toggleRoutesButtonHeightConstraint;
}

- (void)setToggleRoutesButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toggleRoutesButtonHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleRoutesButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_alternateRoutesHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentTopConstraint, 0);
  objc_storeStrong((id *)&self->_moreRoutesButton, 0);
  objc_storeStrong((id *)&self->_borderedMoreRoutesButton, 0);
  objc_storeStrong((id *)&self->_borderedGoButton, 0);
  objc_storeStrong((id *)&self->_borderedAlternatesView, 0);
  objc_storeStrong((id *)&self->_overviewView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_estimatesForTripIdentifiers, 0);
}

@end

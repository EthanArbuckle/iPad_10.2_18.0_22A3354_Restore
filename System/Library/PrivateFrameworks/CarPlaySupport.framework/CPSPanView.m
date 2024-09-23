@implementation CPSPanView

- (CPSPanView)initWithFrame:(CGRect)a3
{
  CPSPanButton *v3;
  void *v4;
  CPSPanButton *v5;
  void *v6;
  CPSPanButton *v7;
  void *v8;
  CPSPanButton *v9;
  void *v10;
  CPSPanView *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
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
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  int v113;
  int v114;
  void (*v115)(_QWORD *, void *, void *, void *);
  void *v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  objc_super v123;
  SEL v124;
  id v125;
  CGRect v126;
  _QWORD v127[4];
  _QWORD v128[32];
  id v129;
  id v130;
  id v131;
  _QWORD v132[2];

  v132[1] = *MEMORY[0x24BDAC8D0];
  v126 = a3;
  v124 = a2;
  v125 = 0;
  v123.receiver = self;
  v123.super_class = (Class)CPSPanView;
  v125 = -[CPSPanView initWithFrame:](&v123, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&v125, v125);
  if (v125)
  {
    objc_msgSend(v125, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v3 = -[CPSPanButton initWithDirection:]([CPSPanButton alloc], "initWithDirection:");
    v4 = (void *)*((_QWORD *)v125 + 52);
    *((_QWORD *)v125 + 52) = v3;

    v14 = CPSLocalizedStringForKey(CFSTR("ACCESSIBILITY_PAN_LEFT"));
    v132[0] = v14;
    v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v132, 1);
    objc_msgSend(*((id *)v125 + 52), "setAccessibilityUserInputLabels:");

    objc_msgSend(v125, "addSubview:", *((_QWORD *)v125 + 52));
    v5 = -[CPSPanButton initWithDirection:]([CPSPanButton alloc], "initWithDirection:", 2);
    v6 = (void *)*((_QWORD *)v125 + 53);
    *((_QWORD *)v125 + 53) = v5;

    v16 = CPSLocalizedStringForKey(CFSTR("ACCESSIBILITY_PAN_RIGHT"));
    v131 = v16;
    v15 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v131, 1);
    objc_msgSend(*((id *)v125 + 53), "setAccessibilityUserInputLabels:");

    objc_msgSend(v125, "addSubview:", *((_QWORD *)v125 + 53));
    v7 = -[CPSPanButton initWithDirection:]([CPSPanButton alloc], "initWithDirection:");
    v8 = (void *)*((_QWORD *)v125 + 54);
    *((_QWORD *)v125 + 54) = v7;

    v18 = CPSLocalizedStringForKey(CFSTR("ACCESSIBILITY_PAN_UP"));
    v130 = v18;
    v17 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v130, 1);
    objc_msgSend(*((id *)v125 + 54), "setAccessibilityUserInputLabels:");

    objc_msgSend(v125, "addSubview:", *((_QWORD *)v125 + 54));
    v9 = -[CPSPanButton initWithDirection:]([CPSPanButton alloc], "initWithDirection:", 8);
    v10 = (void *)*((_QWORD *)v125 + 55);
    *((_QWORD *)v125 + 55) = v9;

    v20 = CPSLocalizedStringForKey(CFSTR("ACCESSIBILITY_PAN_DOWN"));
    v129 = v20;
    v19 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v129, 1);
    objc_msgSend(*((id *)v125 + 55), "setAccessibilityUserInputLabels:");

    objc_msgSend(v125, "addSubview:", *((_QWORD *)v125 + 55));
    v122 = objc_alloc_init(MEMORY[0x24BDF6A50]);
    objc_msgSend(v125, "addLayoutGuide:", v122);
    v121 = objc_alloc_init(MEMORY[0x24BDF6A50]);
    objc_msgSend(v125, "addLayoutGuide:", v121);
    v120 = objc_alloc_init(MEMORY[0x24BDF6A50]);
    objc_msgSend(v125, "addLayoutGuide:", v120);
    v119 = objc_alloc_init(MEMORY[0x24BDF6A50]);
    objc_msgSend(v125, "addLayoutGuide:", v119);
    v21 = (void *)MEMORY[0x24BDD1628];
    v110 = (id)objc_msgSend(*((id *)v125 + 52), "leftAnchor");
    v109 = (id)objc_msgSend(v125, "leftAnchor");
    v108 = (id)objc_msgSend(v110, "constraintEqualToAnchor:constant:");
    v128[0] = v108;
    v107 = (id)objc_msgSend(*((id *)v125 + 52), "centerYAnchor");
    v106 = (id)objc_msgSend(v125, "centerYAnchor");
    v105 = (id)objc_msgSend(v107, "constraintEqualToAnchor:");
    v128[1] = v105;
    v104 = (id)objc_msgSend(*((id *)v125 + 52), "widthAnchor");
    v103 = (id)objc_msgSend(v104, "constraintEqualToConstant:");
    v128[2] = v103;
    v102 = (id)objc_msgSend(*((id *)v125 + 52), "heightAnchor");
    v101 = (id)objc_msgSend(v102, "constraintEqualToConstant:", 28.0);
    v128[3] = v101;
    v100 = (id)objc_msgSend(*((id *)v125 + 53), "rightAnchor");
    v99 = (id)objc_msgSend(v125, "rightAnchor");
    v98 = (id)objc_msgSend(v100, "constraintEqualToAnchor:constant:");
    v128[4] = v98;
    v97 = (id)objc_msgSend(*((id *)v125 + 53), "centerYAnchor");
    v96 = (id)objc_msgSend(v125, "centerYAnchor");
    v95 = (id)objc_msgSend(v97, "constraintEqualToAnchor:");
    v128[5] = v95;
    v94 = (id)objc_msgSend(*((id *)v125 + 53), "widthAnchor");
    v93 = (id)objc_msgSend(v94, "constraintEqualToConstant:", 28.0);
    v128[6] = v93;
    v92 = (id)objc_msgSend(*((id *)v125 + 53), "heightAnchor");
    v91 = (id)objc_msgSend(v92, "constraintEqualToConstant:", 28.0);
    v128[7] = v91;
    v90 = (id)objc_msgSend(*((id *)v125 + 54), "topAnchor");
    v89 = (id)objc_msgSend(v125, "topAnchor");
    v88 = (id)objc_msgSend(v90, "constraintEqualToAnchor:constant:", 8.0);
    v128[8] = v88;
    v87 = (id)objc_msgSend(*((id *)v125 + 54), "centerXAnchor");
    v86 = (id)objc_msgSend(v125, "centerXAnchor");
    v85 = (id)objc_msgSend(v87, "constraintEqualToAnchor:");
    v128[9] = v85;
    v84 = (id)objc_msgSend(*((id *)v125 + 54), "widthAnchor");
    v83 = (id)objc_msgSend(v84, "constraintEqualToConstant:", 28.0);
    v128[10] = v83;
    v82 = (id)objc_msgSend(*((id *)v125 + 54), "heightAnchor");
    v81 = (id)objc_msgSend(v82, "constraintEqualToConstant:", 28.0);
    v128[11] = v81;
    v80 = (id)objc_msgSend(*((id *)v125 + 55), "bottomAnchor");
    v79 = (id)objc_msgSend(v125, "bottomAnchor");
    v78 = (id)objc_msgSend(v80, "constraintEqualToAnchor:constant:", -8.0);
    v128[12] = v78;
    v77 = (id)objc_msgSend(*((id *)v125 + 55), "centerXAnchor");
    v76 = (id)objc_msgSend(v125, "centerXAnchor");
    v75 = (id)objc_msgSend(v77, "constraintEqualToAnchor:");
    v128[13] = v75;
    v74 = (id)objc_msgSend(*((id *)v125 + 55), "widthAnchor");
    v73 = (id)objc_msgSend(v74, "constraintEqualToConstant:", 28.0);
    v128[14] = v73;
    v72 = (id)objc_msgSend(*((id *)v125 + 55), "heightAnchor");
    v71 = (id)objc_msgSend(v72, "constraintEqualToConstant:", 28.0);
    v128[15] = v71;
    v70 = (id)objc_msgSend(v122, "leftAnchor");
    v69 = (id)objc_msgSend(v125, "leftAnchor");
    v68 = (id)objc_msgSend(v70, "constraintEqualToAnchor:");
    v128[16] = v68;
    v67 = (id)objc_msgSend(v122, "rightAnchor");
    v66 = (id)objc_msgSend(*((id *)v125 + 52), "rightAnchor");
    v65 = (id)objc_msgSend(v67, "constraintEqualToAnchor:");
    v128[17] = v65;
    v64 = (id)objc_msgSend(v122, "bottomAnchor");
    v63 = (id)objc_msgSend(v125, "bottomAnchor");
    v62 = (id)objc_msgSend(v64, "constraintEqualToAnchor:");
    v128[18] = v62;
    v61 = (id)objc_msgSend(v122, "topAnchor");
    v60 = (id)objc_msgSend(v125, "topAnchor");
    v59 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
    v128[19] = v59;
    v58 = (id)objc_msgSend(v121, "leftAnchor");
    v57 = (id)objc_msgSend(*((id *)v125 + 53), "leftAnchor");
    v56 = (id)objc_msgSend(v58, "constraintEqualToAnchor:");
    v128[20] = v56;
    v55 = (id)objc_msgSend(v121, "rightAnchor");
    v54 = (id)objc_msgSend(v125, "rightAnchor");
    v53 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
    v128[21] = v53;
    v52 = (id)objc_msgSend(v121, "bottomAnchor");
    v51 = (id)objc_msgSend(v125, "bottomAnchor");
    v50 = (id)objc_msgSend(v52, "constraintEqualToAnchor:");
    v128[22] = v50;
    v49 = (id)objc_msgSend(v121, "topAnchor");
    v48 = (id)objc_msgSend(v125, "topAnchor");
    v47 = (id)objc_msgSend(v49, "constraintEqualToAnchor:");
    v128[23] = v47;
    v46 = (id)objc_msgSend(v120, "leftAnchor");
    v45 = (id)objc_msgSend(v125, "leftAnchor");
    v44 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
    v128[24] = v44;
    v43 = (id)objc_msgSend(v120, "rightAnchor");
    v42 = (id)objc_msgSend(v125, "rightAnchor");
    v41 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
    v128[25] = v41;
    v40 = (id)objc_msgSend(v120, "bottomAnchor");
    v39 = (id)objc_msgSend(*((id *)v125 + 54), "bottomAnchor");
    v38 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
    v128[26] = v38;
    v37 = (id)objc_msgSend(v120, "topAnchor");
    v36 = (id)objc_msgSend(v125, "topAnchor");
    v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
    v128[27] = v35;
    v34 = (id)objc_msgSend(v119, "leftAnchor");
    v33 = (id)objc_msgSend(v125, "leftAnchor");
    v32 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
    v128[28] = v32;
    v31 = (id)objc_msgSend(v119, "rightAnchor");
    v30 = (id)objc_msgSend(v125, "rightAnchor");
    v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
    v128[29] = v29;
    v28 = (id)objc_msgSend(v119, "bottomAnchor");
    v27 = (id)objc_msgSend(v125, "bottomAnchor");
    v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
    v128[30] = v26;
    v25 = (id)objc_msgSend(v119, "topAnchor");
    v24 = (id)objc_msgSend(*((id *)v125 + 55), "topAnchor");
    v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
    v128[31] = v23;
    v22 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v128, 32);
    objc_msgSend(v21, "activateConstraints:");

    v127[0] = *((_QWORD *)v125 + 52);
    v127[1] = *((_QWORD *)v125 + 53);
    v127[2] = *((_QWORD *)v125 + 54);
    v127[3] = *((_QWORD *)v125 + 55);
    v118 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v127, 4);
    v111 = v118;
    v112 = MEMORY[0x24BDAC760];
    v113 = -1073741824;
    v114 = 0;
    v115 = __28__CPSPanView_initWithFrame___block_invoke;
    v116 = &unk_24E26F288;
    v117 = v125;
    objc_msgSend(v111, "enumerateObjectsUsingBlock:", &v112);
    objc_storeStrong(&v117, 0);
    objc_storeStrong(&v118, 0);
    objc_storeStrong(&v119, 0);
    objc_storeStrong(&v120, 0);
    objc_storeStrong(&v121, 0);
    objc_storeStrong(&v122, 0);
  }
  v12 = (CPSPanView *)v125;
  objc_storeStrong(&v125, 0);
  return v12;
}

void __28__CPSPanView_initWithFrame___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[3] = a3;
  v10[2] = a4;
  v10[1] = a1;
  v10[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", a1[4], 0x1F2BACFC8uLL);
  objc_msgSend(v10[0], "setAllowedTouchTypes:", &unk_24E29A830);
  objc_msgSend(v10[0], "setMinimumPressDuration:");
  objc_msgSend(location[0], "addGestureRecognizer:", v10[0]);
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", a1[4], 0x1F5F932EEuLL);
  objc_msgSend(v9, "setAllowedTouchTypes:", &unk_24E29A848);
  objc_msgSend(v9, "requireGestureRecognizerToFail:", v10[0]);
  objc_msgSend(location[0], "addGestureRecognizer:", v9);
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", a1[4], 0x1F2BACFC8uLL);
  objc_msgSend(v8, "setAllowedPressTypes:", &unk_24E29A860);
  objc_msgSend(v8, "setMinimumPressDuration:", 0.25);
  objc_msgSend(location[0], "addGestureRecognizer:", v8);
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", a1[4], 0x1F5F932EEuLL);
  objc_msgSend(v7, "setAllowedPressTypes:", &unk_24E29A878);
  objc_msgSend(v7, "requireGestureRecognizerToFail:", v8);
  objc_msgSend(v7, "setDelegate:", a1[4]);
  objc_msgSend(location[0], "addGestureRecognizer:", v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleButtonTapped:(id)a3
{
  void *v3;
  id v4;
  CPSPanViewDelegate *v5;
  id v6;
  id location[2];
  CPSPanView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void *)objc_opt_class();
  v4 = (id)objc_msgSend(location[0], "view");
  v6 = CPSSafeCast_1(v3, v4);

  v5 = -[CPSPanView delegate](v8, "delegate");
  -[CPSPanViewDelegate panView:panWithDirection:](v5, "panView:panWithDirection:", v8, objc_msgSend(v6, "direction"));

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleLongPressGesture:(id)a3
{
  CPSPanViewDelegate *v3;
  CPSPanViewDelegate *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id location[2];
  CPSPanView *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (void *)objc_opt_class();
  v6 = (id)objc_msgSend(location[0], "view");
  v9 = CPSSafeCast_1(v5, v6);

  v8 = objc_msgSend(v9, "direction");
  v7 = objc_msgSend(location[0], "state");
  if (v7 == 1)
  {
    v4 = -[CPSPanView delegate](v11, "delegate");
    -[CPSPanViewDelegate panView:panBeganWithDirection:](v4, "panView:panBeganWithDirection:", v11, v8);

  }
  else if (v7 == 3)
  {
    v3 = -[CPSPanView delegate](v11, "delegate");
    -[CPSPanViewDelegate panView:panEndedWithDirection:](v3, "panView:panEndedWithDirection:", v11, v8);

  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  CPSPanView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  if ((_CPSUIPressesContainsPressTypes(location[0], &unk_24E29A890) & 1) == 0)
  {
    v5.receiver = v8;
    v5.super_class = (Class)CPSPanView;
    -[CPSPanView pressesBegan:withEvent:](&v5, sel_pressesBegan_withEvent_, location[0], v6);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  CPSPanView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  if ((_CPSUIPressesContainsPressTypes(location[0], &unk_24E29A8A8) & 1) == 0)
  {
    v5.receiver = v8;
    v5.super_class = (Class)CPSPanView;
    -[CPSPanView pressesChanged:withEvent:](&v5, sel_pressesChanged_withEvent_, location[0], v6);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  CPSPanView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  if ((_CPSUIPressesContainsPressTypes(location[0], &unk_24E29A8C0) & 1) == 0)
  {
    v5.receiver = v8;
    v5.super_class = (Class)CPSPanView;
    -[CPSPanView pressesCancelled:withEvent:](&v5, sel_pressesCancelled_withEvent_, location[0], v6);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  CPSPanView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  if ((_CPSUIPressesContainsPressTypes(location[0], &unk_24E29A8D8) & 1) == 0)
  {
    v5.receiver = v8;
    v5.super_class = (Class)CPSPanView;
    -[CPSPanView pressesEnded:withEvent:](&v5, sel_pressesEnded_withEvent_, location[0], v6);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (double)sideButtonTopInset
{
  CPSPanButton *v3;
  double MinY;
  CGRect v6;
  CGRect v7;

  v3 = -[CPSPanView panRightButton](self, "panRightButton");
  -[CPSPanButton frame](v3, "frame");
  MinY = CGRectGetMinY(v6);

  -[CPSPanView bounds](self, "bounds");
  return CGRectGetHeight(v7) - MinY;
}

- (CPSPanButton)panLeftButton
{
  return self->_panLeftButton;
}

- (CPSPanButton)panRightButton
{
  return self->_panRightButton;
}

- (CPSPanButton)panUpButton
{
  return self->_panUpButton;
}

- (CPSPanButton)panDownButton
{
  return self->_panDownButton;
}

- (CPSPanViewDelegate)delegate
{
  return (CPSPanViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_panDownButton, 0);
  objc_storeStrong((id *)&self->_panUpButton, 0);
  objc_storeStrong((id *)&self->_panRightButton, 0);
  objc_storeStrong((id *)&self->_panLeftButton, 0);
}

@end

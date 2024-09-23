@implementation _HUIDarkStepSliderView

- (_HUIDarkStepSliderView)initWithConfig:(id)a3
{
  id v5;
  _HUIDarkStepSliderView *v6;
  _HUIDarkStepSliderView *v7;
  HACCCapsuleDarkBackground *v8;
  HACCCapsuleDarkBackground *darkBackgroundView;
  HUIStepSlider *v10;
  HUIStepSlider *slider;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HUIDarkStepSliderView;
  v6 = -[_HUIDarkStepSliderView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = objc_alloc_init(HACCCapsuleDarkBackground);
    darkBackgroundView = v7->_darkBackgroundView;
    v7->_darkBackgroundView = v8;

    -[HACCCapsuleDarkBackground setAutoresizingMask:](v7->_darkBackgroundView, "setAutoresizingMask:", 18);
    -[_HUIDarkStepSliderView addSubview:](v7, "addSubview:", v7->_darkBackgroundView);
    -[HACCCapsuleDarkBackground setupBackgroundVisualStyle](v7->_darkBackgroundView, "setupBackgroundVisualStyle");
    v10 = objc_alloc_init(HUIStepSlider);
    slider = v7->_slider;
    v7->_slider = v10;

    -[HUIStepSlider setTranslatesAutoresizingMaskIntoConstraints:](v7->_slider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_HUIDarkStepSliderView addSubview:](v7, "addSubview:", v7->_slider);
    -[_HUIDarkStepSliderView _setContraintsFromConfig:](v7, "_setContraintsFromConfig:", v5);
  }

  return v7;
}

- (void)_setContraintsFromConfig:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[5];

  v55[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  switch(objc_msgSend(v4, "style"))
  {
    case 0:
      v48 = (void *)MEMORY[0x24BDD1628];
      -[_HUIDarkStepSliderView slider](self, "slider");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "leadingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HUIDarkStepSliderView leadingAnchor](self, "leadingAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      CCUILayoutGutter();
      objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v51;
      -[_HUIDarkStepSliderView slider](self, "slider");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "trailingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HUIDarkStepSliderView trailingAnchor](self, "trailingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      CCUILayoutGutter();
      objc_msgSend(v49, "constraintEqualToAnchor:constant:", v47, -v11);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v46;
      -[_HUIDarkStepSliderView slider](self, "slider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HUIDarkStepSliderView topAnchor](self, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v55[2] = v15;
      -[_HUIDarkStepSliderView slider](self, "slider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HUIDarkStepSliderView bottomAnchor](self, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v55[3] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "activateConstraints:", v20);

      goto LABEL_22;
    case 1:
      objc_msgSend(v4, "minImage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = objc_alloc(MEMORY[0x24BEBD668]);
        objc_msgSend(v4, "minImage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithImage:", v23);

        objc_msgSend(v24, "setContentMode:", 7);
        -[_HUIDarkStepSliderView setLeadingView:](self, "setLeadingView:", v24);

      }
      objc_msgSend(v4, "maxImage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
        goto LABEL_19;
      v26 = objc_alloc(MEMORY[0x24BEBD668]);
      objc_msgSend(v4, "maxImage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithImage:", v27);

      objc_msgSend(v28, "setContentMode:", 8);
      goto LABEL_18;
    case 2:
      objc_msgSend(v4, "minImage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v4, "minImageAction");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "minImageAction");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addAction:forControlEvents:", v32, 64);

          objc_msgSend(v4, "minImage");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setImage:forState:", v33, 0);

          objc_msgSend(v31, "setContentHorizontalAlignment:", 1);
        }
        else
        {
          v34 = objc_alloc(MEMORY[0x24BEBD668]);
          objc_msgSend(v4, "minImage");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v34, "initWithImage:", v35);

          objc_msgSend(v31, "setContentMode:", 7);
        }
        -[_HUIDarkStepSliderView setLeadingView:](self, "setLeadingView:", v31);

      }
      objc_msgSend(v4, "valueLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
        goto LABEL_19;
      v37 = -[_HUIDarkStepSliderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != 1;
      objc_msgSend(v4, "valueLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextAlignment:", 2 * v37);
      break;
    case 3:
    case 4:
      objc_msgSend(v4, "minTextLabel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_19;
      v6 = (void *)v5;
      objc_msgSend(v4, "valueLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_19;
      objc_msgSend(v4, "minTextLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextAlignment:", 0);

      objc_msgSend(v4, "valueLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextAlignment:", 2);

      objc_msgSend(v4, "minTextLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HUIDarkStepSliderView setLeadingView:](self, "setLeadingView:", v10);
      break;
    default:
      goto LABEL_19;
  }

  objc_msgSend(v4, "valueLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  -[_HUIDarkStepSliderView setTrailingView:](self, "setTrailingView:", v28);

LABEL_19:
  -[_HUIDarkStepSliderView leadingView](self, "leadingView");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[_HUIDarkStepSliderView trailingView](self, "trailingView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      -[_HUIDarkStepSliderView leadingView](self, "leadingView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[_HUIDarkStepSliderView trailingView](self, "trailingView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[_HUIDarkStepSliderView leadingView](self, "leadingView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HUIDarkStepSliderView addSubview:](self, "addSubview:", v43);

      -[_HUIDarkStepSliderView trailingView](self, "trailingView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HUIDarkStepSliderView addSubview:](self, "addSubview:", v44);

      -[_HUIDarkStepSliderView config](self, "config");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HUIDarkStepSliderView updateConstraintsWithConfig:](self, "updateConstraintsWithConfig:", v45);

    }
  }
LABEL_22:

}

- (void)updateConstraintsWithConfig:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  _QWORD v155[14];
  _QWORD v156[16];

  v156[14] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_HUIDarkStepSliderView setConfig:](self, "setConfig:", v4);
  -[_HUIDarkStepSliderView leadingView](self, "leadingView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[_HUIDarkStepSliderView trailingView](self, "trailingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_HUIDarkStepSliderView config](self, "config");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "style") == 2)
      {
        v9 = 1;
      }
      else
      {
        -[_HUIDarkStepSliderView config](self, "config");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "style") == 3)
        {
          v9 = 1;
        }
        else
        {
          -[_HUIDarkStepSliderView config](self, "config");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v11, "style") == 4;

        }
      }

      -[_HUIDarkStepSliderView config](self, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isLargeText");

      if (v13 && v9)
      {
        -[_HUIDarkStepSliderView defaultLayouts](self, "defaultLayouts");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = (void *)MEMORY[0x24BDD1628];
          -[_HUIDarkStepSliderView defaultLayouts](self, "defaultLayouts");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "deactivateConstraints:", v16);

        }
        -[_HUIDarkStepSliderView largeTextLayouts](self, "largeTextLayouts");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "leadingAnchor");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView leadingAnchor](self, "leadingAnchor");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          CCUILayoutGutter();
          objc_msgSend(v151, "constraintEqualToAnchor:constant:", v149);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          v156[0] = v147;
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "topAnchor");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView topAnchor](self, "topAnchor");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "constraintEqualToAnchor:", v141);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          v156[1] = v139;
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "bottomAnchor");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView slider](self, "slider");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "topAnchor");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "constraintEqualToAnchor:", v131);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v156[2] = v129;
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "widthAnchor");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView widthAnchor](self, "widthAnchor");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          CCUILayoutGutter();
          objc_msgSend(v125, "constraintEqualToAnchor:constant:", v123, v18 * -2.0);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v156[3] = v121;
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "heightAnchor");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "constraintGreaterThanOrEqualToConstant:", 52.0);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v156[4] = v115;
          -[_HUIDarkStepSliderView slider](self, "slider");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "leadingAnchor");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "leadingAnchor");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "constraintEqualToAnchor:", v107);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v156[5] = v105;
          -[_HUIDarkStepSliderView slider](self, "slider");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "trailingAnchor");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView trailingAnchor](self, "trailingAnchor");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          CCUILayoutGutter();
          objc_msgSend(v101, "constraintEqualToAnchor:constant:", v99, -v19);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v156[6] = v97;
          -[_HUIDarkStepSliderView slider](self, "slider");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "topAnchor");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "bottomAnchor");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "constraintEqualToAnchor:", v89);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v156[7] = v87;
          -[_HUIDarkStepSliderView slider](self, "slider");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "bottomAnchor");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView bottomAnchor](self, "bottomAnchor");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "constraintEqualToAnchor:constant:", v81, -10.0);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v156[8] = v79;
          -[_HUIDarkStepSliderView trailingView](self, "trailingView");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "leadingAnchor");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "leadingAnchor");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "constraintEqualToAnchor:", v71);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v156[9] = v69;
          -[_HUIDarkStepSliderView trailingView](self, "trailingView");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "trailingAnchor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView slider](self, "slider");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "trailingAnchor");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "constraintEqualToAnchor:", v61);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v156[10] = v59;
          -[_HUIDarkStepSliderView trailingView](self, "trailingView");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "topAnchor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView topAnchor](self, "topAnchor");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "constraintEqualToAnchor:", v53);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v156[11] = v51;
          -[_HUIDarkStepSliderView trailingView](self, "trailingView");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "bottomAnchor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView slider](self, "slider");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "topAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "constraintEqualToAnchor:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v156[12] = v21;
          -[_HUIDarkStepSliderView trailingView](self, "trailingView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "widthAnchor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "widthAnchor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v156[13] = v26;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v156, 14);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView setLargeTextLayouts:](self, "setLargeTextLayouts:", v27);

        }
        v28 = (void *)MEMORY[0x24BDD1628];
        -[_HUIDarkStepSliderView largeTextLayouts](self, "largeTextLayouts");
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[_HUIDarkStepSliderView largeTextLayouts](self, "largeTextLayouts");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v31 = (void *)MEMORY[0x24BDD1628];
          -[_HUIDarkStepSliderView largeTextLayouts](self, "largeTextLayouts");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "deactivateConstraints:", v32);

        }
        -[_HUIDarkStepSliderView defaultLayouts](self, "defaultLayouts");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "leadingAnchor");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView leadingAnchor](self, "leadingAnchor");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          CCUILayoutGutter();
          objc_msgSend(v152, "constraintEqualToAnchor:constant:", v150);
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v155[0] = v148;
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "topAnchor");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView topAnchor](self, "topAnchor");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "constraintEqualToAnchor:", v142);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          v155[1] = v140;
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "bottomAnchor");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView bottomAnchor](self, "bottomAnchor");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "constraintEqualToAnchor:", v134);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v155[2] = v132;
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "widthAnchor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = v34;
          v35 = objc_msgSend(v4, "style");
          v36 = 50.0;
          if (v35 != 4)
            v36 = 30.0;
          objc_msgSend(v34, "constraintEqualToConstant:", v36);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v155[3] = v126;
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "heightAnchor");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "constraintEqualToConstant:", 52.0);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v155[4] = v120;
          -[_HUIDarkStepSliderView slider](self, "slider");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "leadingAnchor");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "trailingAnchor");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "constraintEqualToAnchor:", v112);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v155[5] = v110;
          -[_HUIDarkStepSliderView slider](self, "slider");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "trailingAnchor");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView trailingView](self, "trailingView");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "leadingAnchor");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "constraintEqualToAnchor:", v102);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v155[6] = v100;
          -[_HUIDarkStepSliderView slider](self, "slider");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "topAnchor");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "topAnchor");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "constraintEqualToAnchor:", v92);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v155[7] = v90;
          -[_HUIDarkStepSliderView slider](self, "slider");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "bottomAnchor");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "bottomAnchor");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "constraintEqualToAnchor:", v82);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v155[8] = v80;
          -[_HUIDarkStepSliderView trailingView](self, "trailingView");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "leadingAnchor");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView slider](self, "slider");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "trailingAnchor");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "constraintEqualToAnchor:", v72);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v155[9] = v70;
          -[_HUIDarkStepSliderView trailingView](self, "trailingView");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "trailingAnchor");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView trailingAnchor](self, "trailingAnchor");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          CCUILayoutGutter();
          objc_msgSend(v66, "constraintEqualToAnchor:constant:", v64, -v37);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v155[10] = v62;
          -[_HUIDarkStepSliderView trailingView](self, "trailingView");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "topAnchor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "topAnchor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "constraintEqualToAnchor:", v54);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v155[11] = v52;
          -[_HUIDarkStepSliderView trailingView](self, "trailingView");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "bottomAnchor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView leadingView](self, "leadingView");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "bottomAnchor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "constraintEqualToAnchor:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v155[12] = v41;
          -[_HUIDarkStepSliderView trailingView](self, "trailingView");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "widthAnchor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "constraintGreaterThanOrEqualToConstant:", 30.0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v155[13] = v44;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v155, 14);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HUIDarkStepSliderView setDefaultLayouts:](self, "setDefaultLayouts:", v45);

        }
        v28 = (void *)MEMORY[0x24BDD1628];
        -[_HUIDarkStepSliderView defaultLayouts](self, "defaultLayouts");
        v29 = objc_claimAutoreleasedReturnValue();
      }
      v46 = (void *)v29;
      objc_msgSend(v28, "activateConstraints:", v29);

    }
  }

}

- (void)accessibilityDecrement
{
  id v2;

  -[_HUIDarkStepSliderView slider](self, "slider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDecrement");

}

- (void)accessibilityIncrement
{
  id v2;

  -[_HUIDarkStepSliderView slider](self, "slider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIncrement");

}

- (HUISliderConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (void)setLeadingView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingView, a3);
}

- (HUIStepSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (void)setTrailingView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingView, a3);
}

- (HACCCapsuleDarkBackground)darkBackgroundView
{
  return self->_darkBackgroundView;
}

- (void)setDarkBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_darkBackgroundView, a3);
}

- (NSArray)defaultLayouts
{
  return self->_defaultLayouts;
}

- (void)setDefaultLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLayouts, a3);
}

- (NSArray)largeTextLayouts
{
  return self->_largeTextLayouts;
}

- (void)setLargeTextLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextLayouts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextLayouts, 0);
  objc_storeStrong((id *)&self->_defaultLayouts, 0);
  objc_storeStrong((id *)&self->_darkBackgroundView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end

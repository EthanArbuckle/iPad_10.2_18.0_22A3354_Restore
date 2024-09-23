@implementation BCBrandedHeaderViewController

- (BCBrandedHeaderViewController)initWithBusinessItem:(id)a3
{
  id v5;
  BCBrandedHeaderViewController *v6;
  BCBrandedHeaderViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCBrandedHeaderViewController;
  v6 = -[BCBrandedHeaderViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_businessItem, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
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
  uint64_t v56;
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
  BCBrandedHeaderViewController *v105;
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
  objc_super v119;
  _QWORD v120[4];
  _QWORD v121[3];
  _QWORD v122[3];
  _QWORD v123[3];
  _QWORD v124[5];
  _QWORD v125[8];

  v125[6] = *MEMORY[0x24BDAC8D0];
  v119.receiver = self;
  v119.super_class = (Class)BCBrandedHeaderViewController;
  -[BCBrandedHeaderViewController viewDidLoad](&v119, sel_viewDidLoad);
  -[BCBrandedHeaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setAccessibilityIgnoresInvertColors:", 1);
  objc_msgSend(v3, "addSubview:", v4);
  v109 = v4;
  -[BCBrandedHeaderViewController setLogoImageView:](self, "setLogoImageView:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDF6B78]);
  objc_msgSend(v3, "addLayoutGuide:", v5);
  v6 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[BCBrandedHeaderViewController businessItem](self, "businessItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v6);
  v9 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[BCBrandedHeaderViewController businessItem](self, "businessItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "isVerified");

  if ((_DWORD)v8)
  {
    +[BCShared classBundle]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("VERIFIED"), &stru_24E0651E8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v12);

  }
  v117 = v5;
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v9);
  v13 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v105 = self;
  -[BCBrandedHeaderViewController businessItem](self, "businessItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", objc_msgSend(v14, "isVerified") ^ 1);

  objc_msgSend(v3, "addSubview:", v13);
  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 20.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF77E8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scaledFontForFont:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v17);

  objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v18);

  objc_msgSend(v6, "setNumberOfLines:", 4);
  objc_msgSend(v6, "setLineBreakMode:", 4);
  LODWORD(v19) = *(_DWORD *)"";
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v19);
  LODWORD(v20) = *(_DWORD *)"";
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 1, v20);
  LODWORD(v21) = 1148829696;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v21);
  v108 = v6;
  LODWORD(v22) = 1148829696;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v22);
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
  v23 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF77C0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scaledFontForFont:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v25);

    objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v26);

    objc_msgSend(v9, "setNumberOfLines:", 1);
    objc_msgSend(v9, "setLineBreakMode:", 4);
    LODWORD(v27) = 1148829696;
    objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v27);
    LODWORD(v28) = 1148829696;
    objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 1, v28);
    LODWORD(v29) = 1148829696;
    objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 0, v29);
    LODWORD(v30) = 1148829696;
    objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v30);
    v31 = (void *)MEMORY[0x24BDF6AE0];
    objc_msgSend(v9, "font");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "configurationWithFont:scale:", v32, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("checkmark.seal.fill"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "imageWithRenderingMode:", 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setImage:", v35);
  }
  v104 = (void *)v23;
  v116 = v9;
  objc_msgSend(v109, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCornerRadius:", 3.0);

  objc_msgSend(v109, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setMasksToBounds:", 1);

  objc_msgSend(v9, "textColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v38);

  v118 = (void *)objc_opt_new();
  objc_msgSend(v109, "leadingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v110);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v125[0] = v106;
  objc_msgSend(v109, "centerYAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:", v98);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v125[1] = v96;
  objc_msgSend(v109, "topAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintGreaterThanOrEqualToAnchor:", v92);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v125[2] = v90;
  objc_msgSend(v109, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:", v40);
  v103 = v13;
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v125[3] = v41;
  objc_msgSend(v109, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", 45.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v125[4] = v43;
  objc_msgSend(v109, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToConstant:", 45.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v125[5] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "addObjectsFromArray:", v46);

  objc_msgSend(v117, "leadingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:constant:", v111, 16.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = v101;
  objc_msgSend(v117, "trailingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v97);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v124[1] = v95;
  objc_msgSend(v117, "centerYAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v91);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v124[2] = v47;
  objc_msgSend(v117, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v124[3] = v50;
  objc_msgSend(v117, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v3;
  objc_msgSend(v3, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v124[4] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v124, 5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "addObjectsFromArray:", v54);

  objc_msgSend(v108, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "leadingAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v55;
  objc_msgSend(v55, "constraintEqualToAnchor:", v112);
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)v56;
  if (v116)
  {
    v123[0] = v56;
    objc_msgSend(v108, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v123[1] = v60;
    objc_msgSend(v108, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v123[2] = v63;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v123, 3);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObjectsFromArray:", v64);

    objc_msgSend(v116, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = v67;
    objc_msgSend(v116, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, 0.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v122[1] = v70;
    objc_msgSend(v116, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v122[2] = v73;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v122, 3);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObjectsFromArray:", v74);

    v75 = v116;
    v76 = v117;

    v77 = v103;
    objc_msgSend(v103, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "trailingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v78;
    objc_msgSend(v78, "constraintEqualToAnchor:constant:", v112, 4.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v57;
    objc_msgSend(v103, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v79;
    objc_msgSend(v79, "constraintLessThanOrEqualToAnchor:constant:", v80, 4.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = v81;
    objc_msgSend(v103, "centerYAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "centerYAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v121[2] = v84;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 3);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObjectsFromArray:", v85);
  }
  else
  {
    v120[0] = v56;
    objc_msgSend(v108, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v86;
    objc_msgSend(v86, "constraintEqualToAnchor:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v120[1] = v81;
    objc_msgSend(v108, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v120[2] = v84;
    objc_msgSend(v108, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "bottomAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v120[3] = v88;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v120, 4);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObjectsFromArray:", v89);

    v76 = v117;
    v75 = 0;
    v77 = v103;
  }

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v118);
  -[BCBrandedHeaderViewController _fetchLogo](v105, "_fetchLogo");

}

- (void)_fetchLogo
{
  NSObject *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  CFTimeInterval v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12[2];
  id location;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[BCBrandedHeaderViewController _fetchLogo]";
    _os_log_impl(&dword_21C655000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[BCBrandedHeaderViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, v4);

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)buf);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[BCBrandedHeaderViewController businessItem](self, "businessItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "brandedHeaderViewController:logoFetchingWillBeginForBusinessItem:", self, v6);

  }
  v7 = CACurrentMediaTime();
  v8 = objc_alloc_init(MEMORY[0x24BE0FF08]);
  -[BCBrandedHeaderViewController businessItem](self, "businessItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__BCBrandedHeaderViewController__fetchLogo__block_invoke;
  v10[3] = &unk_24E064D38;
  objc_copyWeak(&v11, &location);
  v12[1] = *(id *)&v7;
  objc_copyWeak(v12, (id *)buf);
  v10[4] = self;
  objc_msgSend(v8, "fetchSquareIconDataForBusinessItem:completion:", v9, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __43__BCBrandedHeaderViewController__fetchLogo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10[2];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[BCBrandedHeaderViewController _fetchLogo]_block_invoke";
    v13 = 2048;
    v14 = objc_msgSend(v3, "length");
    _os_log_impl(&dword_21C655000, v4, OS_LOG_TYPE_DEFAULT, "%s Fetched image length %ld", buf, 0x16u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__BCBrandedHeaderViewController__fetchLogo__block_invoke_21;
  block[3] = &unk_24E064D10;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = v3;
  v10[1] = *(id *)(a1 + 56);
  v5 = v3;
  objc_copyWeak(v10, (id *)(a1 + 48));
  v8 = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v10);

  objc_destroyWeak(&v9);
}

void __43__BCBrandedHeaderViewController__fetchLogo__block_invoke_21(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(*(id *)(a1 + 32), "length");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "logoImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v4);

    v6 = (uint64_t)(CACurrentMediaTime() + *(double *)(a1 + 64) * -1000.0);
    objc_msgSend(WeakRetained, "businessItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bizID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "businessItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageSubtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCLogger logEventWithName:businessURI:callToActionText:bizItemReturnedAfterAction:latency:](BCLogger, "logEventWithName:businessURI:callToActionText:bizItemReturnedAfterAction:latency:", CFSTR("com.apple.BusinessChatViewService.LogoAppears"), v8, v10, 0, v6);

  }
  else
  {
    LogCategory_Daemon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[BCBrandedHeaderViewController _fetchLogo]_block_invoke";
      _os_log_impl(&dword_21C655000, v11, OS_LOG_TYPE_DEFAULT, "%s Failed to fetch valid image", (uint8_t *)&v15, 0xCu);
    }

  }
  v12 = objc_loadWeakRetained((id *)(a1 + 56));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v13, "businessItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "brandedHeaderViewController:logoFetchingDidFinishForBusinessItem:success:", v13, v14, v3 != 0);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BCBrandedHeaderViewControllerDelegate)delegate
{
  return (BCBrandedHeaderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BCSBusinessItem)businessItem
{
  return self->_businessItem;
}

- (UIImageView)logoImageView
{
  return self->_logoImageView;
}

- (void)setLogoImageView:(id)a3
{
  objc_storeStrong((id *)&self->_logoImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_businessItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

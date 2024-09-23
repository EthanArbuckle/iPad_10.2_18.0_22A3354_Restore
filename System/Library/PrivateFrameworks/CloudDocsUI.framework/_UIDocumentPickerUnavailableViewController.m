@implementation _UIDocumentPickerUnavailableViewController

- (_UIDocumentPickerUnavailableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _UIDocumentPickerUnavailableViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
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
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  id v44;
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
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
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
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  objc_super v153;
  _QWORD v154[2];
  _QWORD v155[4];
  _QWORD v156[4];

  v156[2] = *MEMORY[0x24BDAC8D0];
  v153.receiver = self;
  v153.super_class = (Class)_UIDocumentPickerUnavailableViewController;
  v4 = -[_UIDocumentPickerUnavailableViewController initWithNibName:bundle:](&v153, sel_initWithNibName_bundle_, a3, a4);
  if (!v4)
    return v4;
  v5 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77B0], 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontWithDescriptor:size:", v6, 0.0);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("iCloud Drive[unavailable nav title]"), CFSTR("iCloud Drive"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController setTitle:](v4, "setTitle:", v9);

  -[_UIDocumentPickerUnavailableViewController setEdgesForExtendedLayout:](v4, "setEdgesForExtendedLayout:", 0);
  v10 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  -[_UIDocumentPickerUnavailableViewController setLeadImageView:](v4, "setLeadImageView:", v10);

  -[_UIDocumentPickerUnavailableViewController view](v4, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController leadImageView](v4, "leadImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[_UIDocumentPickerUnavailableViewController leadImageView](v4, "leadImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[_UIDocumentPickerUnavailableViewController leadImageView](v4, "leadImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController view](v4, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[_UIDocumentPickerUnavailableViewController leadImageView](v4, "leadImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController view](v4, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController setTopConstraint:](v4, "setTopConstraint:", v23);

  -[_UIDocumentPickerUnavailableViewController topConstraint](v4, "topConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  v25 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[_UIDocumentPickerUnavailableViewController setTitleLabel:](v4, "setTitleLabel:", v25);

  -[_UIDocumentPickerUnavailableViewController titleLabel](v4, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setNumberOfLines:", 1);

  -[_UIDocumentPickerUnavailableViewController titleLabel](v4, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x24BDF6A70], "_lightSystemFontOfSize:", 32.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController titleLabel](v4, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v28);

  -[_UIDocumentPickerUnavailableViewController view](v4, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController titleLabel](v4, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

  -[_UIDocumentPickerUnavailableViewController titleLabel](v4, "titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[_UIDocumentPickerUnavailableViewController titleLabel](v4, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController view](v4, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[_UIDocumentPickerUnavailableViewController titleLabel](v4, "titleLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "lastBaselineAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController leadImageView](v4, "leadImageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController setImageToTitleConstraint:](v4, "setImageToTitleConstraint:", v42);

  -[_UIDocumentPickerUnavailableViewController imageToTitleConstraint](v4, "imageToTitleConstraint");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setActive:", 1);

  v44 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[_UIDocumentPickerUnavailableViewController setTextLabel:](v4, "setTextLabel:", v44);

  -[_UIDocumentPickerUnavailableViewController textLabel](v4, "textLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumberOfLines:", 0);

  -[_UIDocumentPickerUnavailableViewController textLabel](v4, "textLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setTextAlignment:", 1);

  -[_UIDocumentPickerUnavailableViewController textLabel](v4, "textLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = (void *)v7;
  objc_msgSend(v47, "setFont:", v7);

  -[_UIDocumentPickerUnavailableViewController view](v4, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController textLabel](v4, "textLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addSubview:", v49);

  -[_UIDocumentPickerUnavailableViewController textLabel](v4, "textLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v141 = (void *)MEMORY[0x24BDD1628];
  -[_UIDocumentPickerUnavailableViewController textLabel](v4, "textLabel");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "leftAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController view](v4, "view");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "layoutMarginsGuide");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "leftAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v156[0] = v52;
  -[_UIDocumentPickerUnavailableViewController textLabel](v4, "textLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController view](v4, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "layoutMarginsGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "rightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v156[1] = v58;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v156, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "activateConstraints:", v59);

  -[_UIDocumentPickerUnavailableViewController textLabel](v4, "textLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "firstBaselineAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController titleLabel](v4, "titleLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "lastBaselineAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController setTitleToTextConstraint:](v4, "setTitleToTextConstraint:", v64);

  -[_UIDocumentPickerUnavailableViewController titleToTextConstraint](v4, "titleToTextConstraint");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setActive:", 1);

  if (+[_UIDocumentPickerDescriptor cloudMigrationStatus](_UIDocumentPickerDescriptor, "cloudMigrationStatus") <= 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("iCloud Drive[unavailable view title]"), CFSTR("iCloud Drive"), CFSTR("Localizable"));
    v67 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("NO_ICLOUD_MIGRATION_TEXT"), CFSTR("Store your files in iCloud and access them anytime on all your devices."), CFSTR("Localizable"));
    v69 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("NO_ICLOUD_MIGRATION_TEXT2"), CFSTR("Make edits on any device or any app, the most up-to-date version of your document is available everywhere."), CFSTR("Localizable"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("Upgrade"), CFSTR("Upgrade"), CFSTR("Localizable"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=CASTLE&path=CKDATABASESERVICE"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController setButtonURL:](v4, "setButtonURL:", v74);
LABEL_7:
    v78 = 0;
    goto LABEL_8;
  }
  v75 = +[_UIDocumentPickerDescriptor cloudEnabledStatus](_UIDocumentPickerDescriptor, "cloudEnabledStatus");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("No Documents[unavailable view title]"), CFSTR("No Documents"), CFSTR("Localizable"));
  v67 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v77;
  if (v75 != -2)
  {
    objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("NO_ICLOUD_DISABLED_TEXT"), CFSTR("Documents in iCloud Drive are not available because the iCloud Drive setting is disabled."), CFSTR("Localizable"));
    v69 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("Enable iCloud Drive"), CFSTR("Enable iCloud Drive"), CFSTR("Localizable"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=CASTLE&path=CKDATABASESERVICE"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController setButtonURL:](v4, "setButtonURL:", v74);
    v71 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("NO_ICLOUD_MDM_TEXT"), CFSTR("Access to iCloud documents has been disabled by a device management profile."), CFSTR("Localizable"));
  v69 = objc_claimAutoreleasedReturnValue();
  v73 = 0;
  v71 = 0;
  v78 = 1;
LABEL_8:

  -[_UIDocumentPickerUnavailableViewController titleLabel](v4, "titleLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = (void *)v67;
  objc_msgSend(v80, "setText:", v67);

  -[_UIDocumentPickerUnavailableViewController textLabel](v4, "textLabel");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = (void *)v69;
  objc_msgSend(v81, "setText:", v69);

  -[_UIDocumentPickerUnavailableViewController leadImageView](v4, "leadImageView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setHidden:", v78);

  -[_UIDocumentPickerUnavailableViewController textLabel](v4, "textLabel");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v73;
  if (objc_msgSend(v71, "length"))
  {
    v84 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[_UIDocumentPickerUnavailableViewController setTextLabel2:](v4, "setTextLabel2:", v84);

    -[_UIDocumentPickerUnavailableViewController textLabel2](v4, "textLabel2");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setNumberOfLines:", 0);

    -[_UIDocumentPickerUnavailableViewController textLabel2](v4, "textLabel2");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setTextAlignment:", 1);

    -[_UIDocumentPickerUnavailableViewController textLabel2](v4, "textLabel2");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setFont:", v152);

    -[_UIDocumentPickerUnavailableViewController view](v4, "view");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController textLabel2](v4, "textLabel2");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "addSubview:", v89);

    -[_UIDocumentPickerUnavailableViewController textLabel2](v4, "textLabel2");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerUnavailableViewController textLabel2](v4, "textLabel2");
    v144 = objc_claimAutoreleasedReturnValue();

    -[_UIDocumentPickerUnavailableViewController textLabel2](v4, "textLabel2");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "firstBaselineAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController textLabel](v4, "textLabel");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "lastBaselineAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController setTextToTextConstraint:](v4, "setTextToTextConstraint:", v95);

    v134 = (void *)MEMORY[0x24BDD1628];
    -[_UIDocumentPickerUnavailableViewController textLabel2](v4, "textLabel2");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "leftAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController view](v4, "view");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "layoutMarginsGuide");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "leftAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "constraintEqualToAnchor:", v137);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v155[0] = v136;
    -[_UIDocumentPickerUnavailableViewController textLabel2](v4, "textLabel2");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "rightAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController view](v4, "view");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "layoutMarginsGuide");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "rightAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "constraintEqualToAnchor:", v130);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v155[1] = v96;
    -[_UIDocumentPickerUnavailableViewController textLabel2](v4, "textLabel2");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "centerXAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController view](v4, "view");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "centerXAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v155[2] = v101;
    -[_UIDocumentPickerUnavailableViewController textToTextConstraint](v4, "textToTextConstraint");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v155[3] = v102;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v155, 4);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "activateConstraints:", v103);

    v73 = v151;
    -[_UIDocumentPickerUnavailableViewController textLabel2](v4, "textLabel2");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setText:", v71);

    v83 = (void *)v144;
  }
  if (v73)
  {
    +[BRTintColorButton buttonWithType:](BRTintColorButton, "buttonWithType:", 0);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController setButton:](v4, "setButton:", v105);

    -[_UIDocumentPickerUnavailableViewController button](v4, "button");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setTitle:forState:", v73, 0);

    -[_UIDocumentPickerUnavailableViewController button](v4, "button");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerUnavailableViewController button](v4, "button");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "addTarget:action:forControlEvents:", v4, sel__buttonPressed_, 64);

    objc_msgSend(MEMORY[0x24BDF6A70], "_thinSystemFontOfSize:", 26.0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController button](v4, "button");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "titleLabel");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setFont:", v109);

    -[_UIDocumentPickerUnavailableViewController view](v4, "view");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController button](v4, "button");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "addSubview:", v113);

    -[_UIDocumentPickerUnavailableViewController button](v4, "button");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "topAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "lastBaselineAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "constraintEqualToAnchor:", v116);
    v145 = v83;
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController setTextToButtonConstraint:](v4, "setTextToButtonConstraint:", v117);

    v118 = (void *)MEMORY[0x24BDD1628];
    -[_UIDocumentPickerUnavailableViewController button](v4, "button");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "centerXAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerUnavailableViewController view](v4, "view");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "centerXAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintEqualToAnchor:", v122);
    v123 = v71;
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v154[0] = v124;
    -[_UIDocumentPickerUnavailableViewController textToButtonConstraint](v4, "textToButtonConstraint");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v154[1] = v125;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v154, 2);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v118;
    v83 = v145;
    objc_msgSend(v127, "activateConstraints:", v126);

    v71 = v123;
    v73 = v151;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "addObserver:selector:name:object:", v4, sel__fontSizeDidChange_, *MEMORY[0x24BDF7670], 0);

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7670], 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerUnavailableViewController;
  -[_UIDocumentPickerUnavailableViewController dealloc](&v4, sel_dealloc);
}

- (void)_buttonPressed:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController buttonURL](self, "buttonURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openSensitiveURL:withOptions:", v4, 0);

}

- (id)_buttonBackgroundImageForState:(unint64_t)a3 traits:(id)a4
{
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a4, "displayScale");
  __asm { FMOV            V0.2D, #7.0 }
  _UIGraphicsDrawIntoImageContextWithOptions();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  UIEdgeInsetsMakeWithEdges();
  objc_msgSend(v10, "resizableImageWithCapInsets:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_fontSizeDidChange:(id)a3
{
  -[_UIDocumentPickerUnavailableViewController traitCollectionDidChange:](self, "traitCollectionDidChange:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
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
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  id v70;

  -[_UIDocumentPickerUnavailableViewController traitCollection](self, "traitCollection", a3);
  v70 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");
  v8 = v7;

  v9 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("iCloudNoDocs"), v10, v70);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "alignmentRectInsets");
  if (v12 == 0.0)
  {
    objc_msgSend(v70, "displayScale");
    if (fabs(v13 + -1.0) >= 2.22044605e-16)
    {
      if (fabs(v13 + -2.0) >= 2.22044605e-16)
      {
        if (fabs(v13 + -3.0) >= 2.22044605e-16)
          goto LABEL_9;
        v14 = 23.6666667;
      }
      else
      {
        v14 = 23.5;
      }
    }
    else
    {
      v14 = 25.0;
    }
    objc_msgSend(v11, "imageWithAlignmentRectInsets:", v14, 0.0, 31.0, 0.0);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
LABEL_9:
  -[_UIDocumentPickerUnavailableViewController leadImageView](self, "leadImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v11);

  v17 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77B0], 0, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fontWithDescriptor:size:", v18, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF7810], 0, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fontWithDescriptor:size:", v21, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "displayScale");
  v24 = v23;
  -[_UIDocumentPickerUnavailableViewController topConstraint](self, "topConstraint");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v27 = 28.0;
  if (v8 <= 480.0)
    v27 = 20.0;
  v28 = v27 + 1.0 / v24;
  if (v8 > 480.0)
    v29 = 21.0;
  else
    v29 = 20.0;
  objc_msgSend(v25, "setConstant:", v28);

  objc_msgSend(MEMORY[0x24BDF6A70], "_lightSystemFontOfSize:", 32.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(v19, "_scaledValueForValue:", 32.0);
  objc_msgSend(v31, "_lightSystemFontOfSize:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController titleLabel](self, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFont:", v32);

  -[_UIDocumentPickerUnavailableViewController textLabel](self, "textLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFont:", v19);

  -[_UIDocumentPickerUnavailableViewController textLabel2](self, "textLabel2");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFont:", v19);

  -[_UIDocumentPickerUnavailableViewController button](self, "button");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFont:", v22);

  -[_UIDocumentPickerUnavailableViewController button](self, "button");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController traitCollection](self, "traitCollection");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController _buttonBackgroundImageForState:traits:](self, "_buttonBackgroundImageForState:traits:", 0, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBackgroundImage:forState:", v40, 0);

  -[_UIDocumentPickerUnavailableViewController button](self, "button");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController button](self, "button");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "tintColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTitleColor:forState:", v43, 0);

  -[_UIDocumentPickerUnavailableViewController button](self, "button");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController traitCollection](self, "traitCollection");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerUnavailableViewController _buttonBackgroundImageForState:traits:](self, "_buttonBackgroundImageForState:traits:", 1, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setBackgroundImage:forState:", v46, 1);

  -[_UIDocumentPickerUnavailableViewController button](self, "button");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setTitleColor:forState:", v48, 1);

  -[_UIDocumentPickerUnavailableViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v51 = v50;
  -[_UIDocumentPickerUnavailableViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  UIFloorToViewScale();
  v54 = v53;
  -[_UIDocumentPickerUnavailableViewController button](self, "button");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setContentEdgeInsets:", v51, 11.0, v54, 11.0);

  objc_msgSend(v32, "_bodyLeading");
  v57 = v56 * 23.0;
  objc_msgSend(v30, "_bodyLeading");
  v59 = v29 + v57 / v58;
  -[_UIDocumentPickerUnavailableViewController imageToTitleConstraint](self, "imageToTitleConstraint");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setConstant:", v59);

  objc_msgSend(v19, "_scaledValueForValue:", 36.0);
  v62 = v61;
  -[_UIDocumentPickerUnavailableViewController titleToTextConstraint](self, "titleToTextConstraint");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setConstant:", v62);

  objc_msgSend(v19, "_scaledValueForValue:", 28.0);
  v65 = v64;
  -[_UIDocumentPickerUnavailableViewController textToTextConstraint](self, "textToTextConstraint");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setConstant:", v65);

  objc_msgSend(v19, "_scaledValueForValue:", 24.0);
  v68 = v67;
  -[_UIDocumentPickerUnavailableViewController textToButtonConstraint](self, "textToButtonConstraint");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setConstant:", v68);

}

- (UIImageView)leadImageView
{
  return self->_leadImageView;
}

- (void)setLeadImageView:(id)a3
{
  objc_storeStrong((id *)&self->_leadImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UILabel)textLabel2
{
  return self->_textLabel2;
}

- (void)setTextLabel2:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel2, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSURL)buttonURL
{
  return self->_buttonURL;
}

- (void)setButtonURL:(id)a3
{
  objc_storeStrong((id *)&self->_buttonURL, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)imageToTitleConstraint
{
  return self->_imageToTitleConstraint;
}

- (void)setImageToTitleConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageToTitleConstraint, a3);
}

- (NSLayoutConstraint)titleToTextConstraint
{
  return self->_titleToTextConstraint;
}

- (void)setTitleToTextConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleToTextConstraint, a3);
}

- (NSLayoutConstraint)textToTextConstraint
{
  return self->_textToTextConstraint;
}

- (void)setTextToTextConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textToTextConstraint, a3);
}

- (NSLayoutConstraint)textToButtonConstraint
{
  return self->_textToButtonConstraint;
}

- (void)setTextToButtonConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textToButtonConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textToButtonConstraint, 0);
  objc_storeStrong((id *)&self->_textToTextConstraint, 0);
  objc_storeStrong((id *)&self->_titleToTextConstraint, 0);
  objc_storeStrong((id *)&self->_imageToTitleConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_buttonURL, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_textLabel2, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_leadImageView, 0);
}

@end

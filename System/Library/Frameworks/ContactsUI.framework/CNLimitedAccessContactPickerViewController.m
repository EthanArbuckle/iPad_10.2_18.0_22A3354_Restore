@implementation CNLimitedAccessContactPickerViewController

- (id)initForOnboarding:(id)a3 selectedContacts:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "setWithArray:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNLimitedAccessContactPickerViewController initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:](self, "initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:", v7, &stru_1E20507A8, 1, v8, 0, 0);

  return v9;
}

- (id)initForShowSelected:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNLimitedAccessContactPickerViewController initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:](self, "initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:", &stru_1E20507A8, &stru_1E20507A8, 2, v4, 0, 0);

  return v5;
}

- (id)initForAppName:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[CNLimitedAccessPickerSupport allowedIdentifiersForBundleID:](CNLimitedAccessPickerSupport, "allowedIdentifiersForBundleID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNLimitedAccessContactPickerViewController initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:](self, "initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:", v7, v6, 3, v8, 0, 0);

  return v9;
}

- (id)initDeltaPickerForAppName:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[CNLimitedAccessPickerSupport allowedIdentifiersForBundleID:](CNLimitedAccessPickerSupport, "allowedIdentifiersForBundleID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNLimitedAccessContactPickerViewController initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:](self, "initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:", v7, v6, 4, v8, 0, 0);

  return v9;
}

- (id)initSettingsPickerForAppName:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[CNLimitedAccessPickerSupport allowedIdentifiersForBundleID:](CNLimitedAccessPickerSupport, "allowedIdentifiersForBundleID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNLimitedAccessContactPickerViewController initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:](self, "initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:", v7, v6, 5, v8, 0, 0);

  return v9;
}

- (id)initPickerWithContactsAvailableToAddForAppName:(id)a3 bundleId:(id)a4 searchText:(id)a5 caption:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[CNLimitedAccessPickerSupport allowedIdentifiersForBundleID:](CNLimitedAccessPickerSupport, "allowedIdentifiersForBundleID:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNLimitedAccessContactPickerViewController initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:](self, "initForAppName:bundleId:pickerType:selectedContacts:searchText:caption:", v12, v11, 6, v13, v10, a6);

  return v14;
}

- (id)initForAppName:(id)a3 bundleId:(id)a4 pickerType:(int)a5 selectedContacts:(id)a6 searchText:(id)a7 caption:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  CNLimitedAccessContactPickerViewController *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  uint64_t v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  id v72;
  CNLimitedAccessContactPickerViewController *v73;
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
  uint64_t v85;
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
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  id v118;
  id v119;
  void *v120;
  objc_super v121;
  void *v122;
  _QWORD v123[6];
  void *v124;
  _QWORD v125[5];
  _QWORD v126[5];

  v126[3] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v121.receiver = self;
  v121.super_class = (Class)CNLimitedAccessContactPickerViewController;
  v18 = -[CNLimitedAccessContactPickerViewController initWithNibName:bundle:](&v121, sel_initWithNibName_bundle_, 0, 0);
  if (v18)
  {
    v117 = v16;
    v19 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))();
    v119 = v14;
    if ((v19 & 1) == 0)
    {
      +[CNLimitedAccessPickerSupport appNameForBundleId:](CNLimitedAccessPickerSupport, "appNameForBundleId:", v15);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v18->_appName, v14);
    if ((v19 & 1) == 0)

    objc_storeStrong((id *)&v18->_appBundleId, a4);
    objc_storeStrong((id *)&v18->_selectedIdentifiersOnLoad, a6);
    v18->_pickerType = a5;
    objc_storeStrong((id *)&v18->_initalSearchText, a7);
    v18->_caption = a8;
    switch(a5)
    {
      case 0:
        -[CNLimitedAccessContactPickerViewController createGenericPickerViewWithMultiSelectSupport:](v18, "createGenericPickerViewWithMultiSelectSupport:", 1);
        break;
      case 1:
        -[CNLimitedAccessContactPickerViewController createOnboardingPickerView](v18, "createOnboardingPickerView");
        -[CNLimitedAccessContactPickerViewController createOnboardingHeaderView](v18, "createOnboardingHeaderView");
        -[CNLimitedAccessContactPickerViewController createOnboardingFooterView](v18, "createOnboardingFooterView");
        break;
      case 2:
        -[CNLimitedAccessContactPickerViewController createShowSelectedPickerView](v18, "createShowSelectedPickerView");
        -[CNLimitedAccessContactPickerViewController createShowSelectedFooterView](v18, "createShowSelectedFooterView");
        break;
      case 3:
        -[CNLimitedAccessContactPickerViewController createOOPEditSelectedPickerView](v18, "createOOPEditSelectedPickerView");
        -[CNLimitedAccessContactPickerViewController createManageOOPFooterView](v18, "createManageOOPFooterView");
        break;
      case 4:
        -[CNLimitedAccessContactPickerViewController createDeltaEditSelectedPickerView](v18, "createDeltaEditSelectedPickerView");
        -[CNLimitedAccessContactPickerViewController createDeltaFooterView](v18, "createDeltaFooterView");
        break;
      case 5:
        -[CNLimitedAccessContactPickerViewController createSettingsShowSelectedPickerView](v18, "createSettingsShowSelectedPickerView");
        break;
      case 6:
        -[CNLimitedAccessContactPickerViewController createContactsAvailableToSelectPickerView](v18, "createContactsAvailableToSelectPickerView");
        break;
      default:
        break;
    }
    v116 = v17;
    v118 = v15;
    -[CNContactPickerViewController view](v18->_contactPickerViewController, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNLimitedAccessContactPickerViewController addChildViewController:](v18, "addChildViewController:", v18->_contactPickerViewController);
    -[CNLimitedAccessContactPickerViewController view](v18, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController view](v18->_contactPickerViewController, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v22);

    if (a5 != 4)
      -[CNContactPickerViewController didMoveToParentViewController:](v18->_contactPickerViewController, "didMoveToParentViewController:", v18);
    v95 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactPickerViewController view](v18->_contactPickerViewController, "view");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "widthAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessContactPickerViewController view](v18, "view");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "widthAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:", v104);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v126[0] = v101;
    -[CNContactPickerViewController view](v18->_contactPickerViewController, "view");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessContactPickerViewController view](v18, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v126[1] = v25;
    -[CNContactPickerViewController view](v18->_contactPickerViewController, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessContactPickerViewController view](v18, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v126[2] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "activateConstraints:", v31);

    if (v18->_headerView)
    {
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSubview:", v18->_headerView);

      v102 = (void *)MEMORY[0x1E0CB3718];
      -[UIView widthAnchor](v18->_headerView, "widthAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "widthAnchor");
      v108 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "constraintEqualToAnchor:", v108);
      v99 = objc_claimAutoreleasedReturnValue();
      v125[0] = v99;
      -[UIView leadingAnchor](v18->_headerView, "leadingAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "leadingAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintEqualToAnchor:", v111);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v125[1] = v105;
      -[UIView trailingAnchor](v18->_headerView, "trailingAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "trailingAnchor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintEqualToAnchor:", v88);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v125[2] = v84;
      -[UIView topAnchor](v18->_headerView, "topAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "topAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v125[3] = v35;
      -[CNContactPickerViewController view](v18->_contactPickerViewController, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "topAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "topAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v125[4] = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 5);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "activateConstraints:", v41);

      v42 = v82;
      v43 = v96;

      v44 = v86;
      v45 = (void *)v99;

      v46 = v114;
      v47 = (void *)v108;

    }
    else
    {
      v48 = (void *)MEMORY[0x1E0CB3718];
      -[CNContactPickerViewController view](v18->_contactPickerViewController, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "topAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "topAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v45);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v124, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "activateConstraints:", v42);
    }

    if (v18->_footerView)
    {
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addSubview:", v18->_footerView);

      v94 = (void *)MEMORY[0x1E0CB3718];
      -[UIView widthAnchor](v18->_footerView, "widthAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "widthAnchor");
      v85 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "constraintEqualToAnchor:", v85);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v123[0] = v115;
      -[UIView leadingAnchor](v18->_footerView, "leadingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "leadingAnchor");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = v50;
      objc_msgSend(v50, "constraintEqualToAnchor:", v109);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v123[1] = v106;
      -[UIView trailingAnchor](v18->_footerView, "trailingAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "trailingAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "constraintEqualToAnchor:", v89);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v123[2] = v87;
      -[UIView topAnchor](v18->_footerView, "topAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactPickerViewController view](v18->_contactPickerViewController, "view");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "bottomAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "constraintEqualToAnchor:", v79);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v123[3] = v78;
      -[UIView bottomAnchor](v18->_footerView, "bottomAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "bottomAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:", v75);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v123[4] = v51;
      -[UIView layoutMarginsGuide](v18->_footerView, "layoutMarginsGuide");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "bottomAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "layoutMarginsGuide");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "bottomAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v123[5] = v57;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 6);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "activateConstraints:", v58);

      v59 = (void *)v85;
      v60 = v91;

      v61 = v83;
      v62 = v97;

    }
    else
    {
      v63 = (void *)MEMORY[0x1E0CB3718];
      -[CNContactPickerViewController view](v18->_contactPickerViewController, "view");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "bottomAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLimitedAccessContactPickerViewController view](v18, "view");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "bottomAnchor");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = v112;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = v63;
      v61 = (void *)v64;
      objc_msgSend(v65, "activateConstraints:", v64);
    }
    v15 = v118;
    v14 = v119;
    v17 = v116;
    v16 = v117;

    if (v18->_footerViewBorder)
    {
      -[UIView bounds](v18->_footerView, "bounds");
      v67 = v66;
      v69 = v68;
      v71 = v70;
      -[CAShapeLayer setFrame:](v18->_footerViewBorder, "setFrame:");
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v67, v69, v71, 0.0);
      v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setPath:](v18->_footerViewBorder, "setPath:", objc_msgSend(v72, "CGPath"));

    }
    -[CNLimitedAccessContactPickerViewController registerForTraitChanges](v18, "registerForTraitChanges");
    v73 = v18;
  }

  return v18;
}

- (void)createOnboardingPickerView
{
  -[CNLimitedAccessContactPickerViewController createGenericPickerViewWithMultiSelectSupport:](self, "createGenericPickerViewWithMultiSelectSupport:", 1);
  -[CNContactPickerViewController setPrompt:](self->_contactPickerViewController, "setPrompt:", &stru_1E20507A8);
}

- (void)createOnboardingHeaderView
{
  UIView *v3;
  UIView *headerView;
  UIButton *v5;
  UIButton *onboardingShowSelectedButton;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  headerView = self->_headerView;
  self->_headerView = v3;

  -[UIView setClipsToBounds:](self->_headerView, "setClipsToBounds:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  onboardingShowSelectedButton = self->_onboardingShowSelectedButton;
  self->_onboardingShowSelectedButton = v5;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_ONBOARDING_SELECTED"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTitle:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBaseForegroundColor:", v11);

  objc_msgSend(v25, "setTitleTextAttributesTransformer:", &__block_literal_global_85);
  -[UIButton setConfiguration:](self->_onboardingShowSelectedButton, "setConfiguration:", v25);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_onboardingShowSelectedButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_onboardingShowSelectedButton, "addTarget:action:forControlEvents:", self, sel_handleShowSelectedTapped, 64);
  -[UIView addSubview:](self->_headerView, "addSubview:", self->_onboardingShowSelectedButton);
  -[UIButton topAnchor](self->_onboardingShowSelectedButton, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_headerView, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 3.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  -[UIButton leadingAnchor](self->_onboardingShowSelectedButton, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_headerView, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v12, 20.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v13;
  -[UIButton trailingAnchor](self->_onboardingShowSelectedButton, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_headerView, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -20.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v16;
  -[UIButton heightAnchor](self->_onboardingShowSelectedButton, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_headerView, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
}

- (void)createOnboardingFooterView
{
  void *v3;
  UIButton *v4;
  UIButton *onboardingContinueButton;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  UIButton *v12;
  UIButton *onboardingLaterButton;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 18.0, *MEMORY[0x1E0DC1448]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessContactPickerViewController createGenericFooterView](self, "createGenericFooterView");
  v4 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  onboardingContinueButton = self->_onboardingContinueButton;
  self->_onboardingContinueButton = v4;

  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LIMITED_PICKER_CONTINUE"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __72__CNLimitedAccessContactPickerViewController_createOnboardingFooterView__block_invoke;
  v23[3] = &unk_1E204EB50;
  v10 = v3;
  v24 = v10;
  objc_msgSend(v6, "setTitleTextAttributesTransformer:", v23);
  objc_msgSend(v6, "background");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", 14.0);

  objc_msgSend(v6, "setCornerStyle:", -1);
  -[UIButton setConfiguration:](self->_onboardingContinueButton, "setConfiguration:", v6);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_onboardingContinueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_onboardingContinueButton, "addTarget:action:forControlEvents:", self, sel_handleContinueTapped, 64);
  -[UIView addSubview:](self->_footerView, "addSubview:", self->_onboardingContinueButton);
  v12 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  onboardingLaterButton = self->_onboardingLaterButton;
  self->_onboardingLaterButton = v12;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  CNContactsUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("LIMITED_PICKER_LATER"), &stru_1E20507A8, CFSTR("Localized"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v16);

  v18 = v9;
  v19 = 3221225472;
  v20 = __72__CNLimitedAccessContactPickerViewController_createOnboardingFooterView__block_invoke_2;
  v21 = &unk_1E204EB50;
  v22 = v10;
  v17 = v10;
  objc_msgSend(v14, "setTitleTextAttributesTransformer:", &v18);
  -[UIButton setConfiguration:](self->_onboardingLaterButton, "setConfiguration:", v14, v18, v19, v20, v21);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_onboardingLaterButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_onboardingLaterButton, "addTarget:action:forControlEvents:", self, sel_handleLaterTapped, 64);
  -[UIView addSubview:](self->_footerView, "addSubview:", self->_onboardingLaterButton);

}

- (void)setupOnboardingFooterConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *onboardingConstraints;
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
  void *v25;
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
  _QWORD v36[11];

  v36[9] = *MEMORY[0x1E0C80C00];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_onboardingConstraints);
  -[UIButton topAnchor](self->_onboardingContinueButton, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layoutMarginsGuide](self->_footerView, "layoutMarginsGuide");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 10.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v32;
  -[UIButton leadingAnchor](self->_onboardingContinueButton, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layoutMarginsGuide](self->_footerView, "layoutMarginsGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 20.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v28;
  -[UIButton trailingAnchor](self->_onboardingContinueButton, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layoutMarginsGuide](self->_footerView, "layoutMarginsGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, -20.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v24;
  -[UIButton heightAnchor](self->_onboardingContinueButton, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToConstant:", 50.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v22;
  -[UIButton leadingAnchor](self->_onboardingLaterButton, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layoutMarginsGuide](self->_footerView, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, 20.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v18;
  -[UIButton trailingAnchor](self->_onboardingLaterButton, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layoutMarginsGuide](self->_footerView, "layoutMarginsGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v15, -20.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v14;
  -[UIButton topAnchor](self->_onboardingLaterButton, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton bottomAnchor](self->_onboardingContinueButton, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 4.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v5;
  -[UIButton heightAnchor](self->_onboardingLaterButton, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 50.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v7;
  -[UIView layoutMarginsGuide](self->_footerView, "layoutMarginsGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton bottomAnchor](self->_onboardingLaterButton, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 9);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  onboardingConstraints = self->_onboardingConstraints;
  self->_onboardingConstraints = v12;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_onboardingConstraints);
}

- (void)handleContinueTapped
{
  id v2;

  -[CNContactPickerViewController navigationController](self->_contactPickerViewController, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didFinishLimitedAccessSelection");

}

- (void)handleLaterTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  if (-[NSSet count](self->_selectedIdentifiersInActivePicker, "count"))
  {
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LIMITED_PICKER_CANCEL_WARNING_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LIMITED_PICKER_CANCEL_WARNING_MESSAGE-%@"), &stru_1E20507A8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, self->_appName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, &__block_literal_global_106_54476);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v13);

    v14 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("LIMITED_PICKER_CANCEL_SELECT_LATER"), &stru_1E20507A8, CFSTR("Localized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__CNLimitedAccessContactPickerViewController_handleLaterTapped__block_invoke_2;
    v18[3] = &unk_1E204F7F0;
    v18[4] = self;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v17);

    -[CNLimitedAccessContactPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }
  else
  {
    -[CNLimitedAccessContactPickerViewController doLimitedWithNoContacts](self, "doLimitedWithNoContacts");
  }
}

- (void)doLimitedWithNoContacts
{
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "Limited picker select contacts later", v4, 2u);
  }

  -[CNContactPickerViewController pickerDidSelectContactsLater](self->_contactPickerViewController, "pickerDidSelectContactsLater");
  -[CNLimitedAccessContactPickerViewController callDelegateWithSelectedContactList:](self, "callDelegateWithSelectedContactList:", MEMORY[0x1E0C9AA60]);
}

- (void)createOOPEditSelectedPickerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNLimitedAccessContactPickerViewController createGenericPickerViewWithMultiSelectSupport:](self, "createGenericPickerViewWithMultiSelectSupport:", 1);
  v3 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LIMITED_PICKER_PRIVACY-%@"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, self->_appName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setPrompt:](self->_contactPickerViewController, "setPrompt:", v6);

  -[CNContactPickerViewController setHasPickerPrivacyUI:](self->_contactPickerViewController, "setHasPickerPrivacyUI:", 1);
}

- (void)createDeltaEditSelectedPickerView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNLimitedAccessContactPickerViewController createGenericPickerViewWithMultiSelectSupport:](self, "createGenericPickerViewWithMultiSelectSupport:", 1);
  v3 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LIMITED_PICKER_PRIVACY-%@"), &stru_1E20507A8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, self->_appName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setPrompt:](self->_contactPickerViewController, "setPrompt:", v5);

}

- (void)createSettingsShowSelectedPickerView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNContactPickerViewController setLimitedAccessContactSelection:](self->_contactPickerViewController, "setLimitedAccessContactSelection:", self->_selectedIdentifiersOnLoad);
  -[CNLimitedAccessContactPickerViewController createGenericPickerViewWithMultiSelectSupport:](self, "createGenericPickerViewWithMultiSelectSupport:", 1);
  -[CNContactPickerViewController setLimitedAccessContactSelection:](self->_contactPickerViewController, "setLimitedAccessContactSelection:", self->_selectedIdentifiersOnLoad);
  -[CNContactPickerViewController setHidesSearchableSources:](self->_contactPickerViewController, "setHidesSearchableSources:", 1);
  v3 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_SELECTED_PROMPT"), &stru_1E20507A8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, -[NSSet count](self->_selectedIdentifiersOnLoad, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setPrompt:](self->_contactPickerViewController, "setPrompt:", v5);

}

- (void)createShowSelectedPickerView
{
  -[CNLimitedAccessContactPickerViewController createGenericPickerViewWithMultiSelectSupport:](self, "createGenericPickerViewWithMultiSelectSupport:", 1);
  -[CNContactPickerViewController setLimitedAccessContactSelection:](self->_contactPickerViewController, "setLimitedAccessContactSelection:", self->_selectedIdentifiersOnLoad);
  -[CNContactPickerViewController setHidesSearchableSources:](self->_contactPickerViewController, "setHidesSearchableSources:", 1);
}

- (void)createContactsAvailableToSelectPickerView
{
  void *v3;
  id v4;

  -[CNLimitedAccessContactPickerViewController createGenericPickerViewWithMultiSelectSupport:](self, "createGenericPickerViewWithMultiSelectSupport:", 0);
  -[CNContactPickerViewController setLimitedAccessContactSelection:](self->_contactPickerViewController, "setLimitedAccessContactSelection:", self->_selectedIdentifiersOnLoad);
  -[CNContactPickerViewController setHidesSearchableSources:](self->_contactPickerViewController, "setHidesSearchableSources:", 1);
  -[CNContactPickerViewController setLimitedAccessSearchQuery:](self->_contactPickerViewController, "setLimitedAccessSearchQuery:", self->_initalSearchText);
  -[CNContactPickerViewController setLimitedAccessCaption:](self->_contactPickerViewController, "setLimitedAccessCaption:", self->_caption);
  -[CNContactPickerViewController setAllowsCancel:](self->_contactPickerViewController, "setAllowsCancel:", 1);
  CNContactsUIBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_APPAFFORDANCE_PICKER_PROMPT"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setPrompt:](self->_contactPickerViewController, "setPrompt:", v3);

}

- (void)createShowSelectedFooterView
{
  void *v3;
  UIButton *v4;
  UIButton *deselectAllButton;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 18.0, *MEMORY[0x1E0DC1440]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessContactPickerViewController createGenericFooterView](self, "createGenericFooterView");
  v4 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  deselectAllButton = self->_deselectAllButton;
  self->_deselectAllButton = v4;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_DESELECT_ALL"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__CNLimitedAccessContactPickerViewController_createShowSelectedFooterView__block_invoke;
  v10[3] = &unk_1E204EB50;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v6, "setTitleTextAttributesTransformer:", v10);
  -[UIButton setConfiguration:](self->_deselectAllButton, "setConfiguration:", v6);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_deselectAllButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_deselectAllButton, "addTarget:action:forControlEvents:", self, sel_handleDeselectAllTapped, 64);
  -[UIView addSubview:](self->_footerView, "addSubview:", self->_deselectAllButton);

}

- (void)createManageOOPFooterView
{
  void *v3;
  UILabel *v4;
  UILabel *selectContactsLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  UIButton *showSelectedButton;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 18.0, *MEMORY[0x1E0DC1448]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessContactPickerViewController createGenericFooterView](self, "createGenericFooterView");
  v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  selectContactsLabel = self->_selectContactsLabel;
  self->_selectContactsLabel = v4;

  v6 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_SELECT_CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v8, -[NSSet count](self->_selectedIdentifiersOnLoad, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_selectContactsLabel, "setText:", v9);

  -[UILabel setFont:](self->_selectContactsLabel, "setFont:", v3);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_selectContactsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_selectContactsLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UIView addSubview:](self->_footerView, "addSubview:", self->_selectContactsLabel);
  v10 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  showSelectedButton = self->_showSelectedButton;
  self->_showSelectedButton = v10;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_SHOW_SELECTED"), &stru_1E20507A8, CFSTR("Localized"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringWithFormat:", v15, -[NSSet count](self->_selectedIdentifiersOnLoad, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v16);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__CNLimitedAccessContactPickerViewController_createManageOOPFooterView__block_invoke;
  v18[3] = &unk_1E204EB50;
  v19 = v3;
  v17 = v3;
  objc_msgSend(v12, "setTitleTextAttributesTransformer:", v18);
  -[UIButton setConfiguration:](self->_showSelectedButton, "setConfiguration:", v12);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_showSelectedButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_showSelectedButton, "addTarget:action:forControlEvents:", self, sel_handleShowSelectedTapped, 64);
  -[UIView addSubview:](self->_footerView, "addSubview:", self->_showSelectedButton);

}

- (void)createDeltaFooterView
{
  UILabel *v3;
  UILabel *deltaSelectionCountLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *deltaEditedLabel;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *deltaAddedAndRemovedLabel;
  void *v16;
  UIButton *v17;
  UIButton *deltaUndoButton;
  UIButton *v19;
  void *v20;
  id v21;

  -[CNLimitedAccessContactPickerViewController createGenericFooterView](self, "createGenericFooterView");
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  deltaSelectionCountLabel = self->_deltaSelectionCountLabel;
  self->_deltaSelectionCountLabel = v3;

  v5 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SELECTED_CONTACTS_COUNT"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, -[NSSet count](self->_selectedIdentifiersOnLoad, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_deltaSelectionCountLabel, "setText:", v8);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_deltaSelectionCountLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_deltaSelectionCountLabel, "setFont:", v9);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_deltaSelectionCountLabel, "setAdjustsFontForContentSizeCategory:", 0);
  -[UIView addSubview:](self->_footerView, "addSubview:", self->_deltaSelectionCountLabel);
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC4900]);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  deltaEditedLabel = self->_deltaEditedLabel;
  self->_deltaEditedLabel = v10;

  CNContactsUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LIMITED_PICKER_EDITED"), &stru_1E20507A8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_deltaEditedLabel, "setText:", v13);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_deltaEditedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setFont:](self->_deltaEditedLabel, "setFont:", v21);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_deltaEditedLabel, "setAdjustsFontForContentSizeCategory:", 0);
  -[UILabel setHidden:](self->_deltaEditedLabel, "setHidden:", 1);
  -[UIView addSubview:](self->_footerView, "addSubview:", self->_deltaEditedLabel);
  v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  deltaAddedAndRemovedLabel = self->_deltaAddedAndRemovedLabel;
  self->_deltaAddedAndRemovedLabel = v14;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_deltaAddedAndRemovedLabel, "setTextColor:", v16);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_deltaAddedAndRemovedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setFont:](self->_deltaAddedAndRemovedLabel, "setFont:", v21);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_deltaAddedAndRemovedLabel, "setAdjustsFontForContentSizeCategory:", 0);
  -[UILabel setHidden:](self->_deltaAddedAndRemovedLabel, "setHidden:", 1);
  -[UIView addSubview:](self->_footerView, "addSubview:", self->_deltaAddedAndRemovedLabel);
  v17 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  deltaUndoButton = self->_deltaUndoButton;
  self->_deltaUndoButton = v17;

  v19 = self->_deltaUndoButton;
  objc_msgSend(MEMORY[0x1E0DC3870], "cnui_symbolImageNamed:scale:withColor:useFixedSize:", CFSTR("arrow.uturn.backward.circle"), 3, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](v19, "setImage:forState:", v20, 0);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_deltaUndoButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setHidden:](self->_deltaUndoButton, "setHidden:", 1);
  -[UIButton addTarget:action:forControlEvents:](self->_deltaUndoButton, "addTarget:action:forControlEvents:", self, sel_handleUndoTapped, 64);
  -[UIView addSubview:](self->_footerView, "addSubview:", self->_deltaUndoButton);

}

- (void)setupManagedOOPFooterConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *footerConstraints;
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
  _QWORD v25[8];

  v25[6] = *MEMORY[0x1E0C80C00];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_footerConstraints);
  -[UIButton centerYAnchor](self->_showSelectedButton, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_footerView, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  -[UIButton centerXAnchor](self->_showSelectedButton, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_footerView, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  -[UILabel centerYAnchor](self->_selectContactsLabel, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_footerView, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v16;
  -[UILabel centerXAnchor](self->_selectContactsLabel, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_footerView, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v3;
  -[UIView layoutMarginsGuide](self->_footerView, "layoutMarginsGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton heightAnchor](self->_showSelectedButton, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v7;
  -[UIView bottomAnchor](self->_footerView, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessContactPickerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  footerConstraints = self->_footerConstraints;
  self->_footerConstraints = v12;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_footerConstraints);
}

- (void)setupDeltaFooterConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *footerConstraints;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[14];

  v50[12] = *MEMORY[0x1E0C80C00];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_footerConstraints);
  -[UILabel intrinsicContentSize](self->_deltaSelectionCountLabel, "intrinsicContentSize");
  v4 = v3;
  -[UILabel intrinsicContentSize](self->_deltaEditedLabel, "intrinsicContentSize");
  v6 = v5;
  -[UILabel intrinsicContentSize](self->_deltaAddedAndRemovedLabel, "intrinsicContentSize");
  if (v4 < v6 + v7)
    v4 = v6 + v7;
  -[UIButton intrinsicContentSize](self->_deltaUndoButton, "intrinsicContentSize");
  if (v4 < v8)
    v4 = v8;
  -[UILabel centerYAnchor](self->_deltaSelectionCountLabel, "centerYAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_footerView, "centerYAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v47;
  -[UILabel centerXAnchor](self->_deltaSelectionCountLabel, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_footerView, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v44;
  -[UILabel bottomAnchor](self->_deltaEditedLabel, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_footerView, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v41;
  -[UILabel topAnchor](self->_deltaEditedLabel, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_footerView, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintGreaterThanOrEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v38;
  -[UILabel centerXAnchor](self->_deltaEditedLabel, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessContactPickerViewController footerView](self, "footerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v34;
  -[UILabel topAnchor](self->_deltaAddedAndRemovedLabel, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_footerView, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v31;
  -[UILabel bottomAnchor](self->_deltaAddedAndRemovedLabel, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_footerView, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v28;
  -[UILabel centerXAnchor](self->_deltaAddedAndRemovedLabel, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessContactPickerViewController footerView](self, "footerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v24;
  -[UIButton centerYAnchor](self->_deltaUndoButton, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_footerView, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v21;
  -[UIButton trailingAnchor](self->_deltaUndoButton, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layoutMarginsGuide](self->_footerView, "layoutMarginsGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v10, -10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v11;
  -[UIView heightAnchor](self->_footerView, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", v4 + 40.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50[10] = v13;
  -[UIView bottomAnchor](self->_footerView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessContactPickerViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v50[11] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 12);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  footerConstraints = self->_footerConstraints;
  self->_footerConstraints = v18;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_footerConstraints);
}

- (void)setupShowSelectedFooterConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *footerConstraints;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_footerConstraints);
  -[UIButton centerYAnchor](self->_deselectAllButton, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_footerView, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  -[UIButton centerXAnchor](self->_deselectAllButton, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_footerView, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  -[UIView layoutMarginsGuide](self->_footerView, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton heightAnchor](self->_showSelectedButton, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, 40.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v6;
  -[UIView bottomAnchor](self->_footerView, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessContactPickerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  footerConstraints = self->_footerConstraints;
  self->_footerConstraints = v11;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_footerConstraints);
}

- (void)handleShowSelectedTapped
{
  CNLimitedAccessContactPickerViewController *v3;
  void *v4;
  id v5;

  if (-[NSSet count](self->_selectedIdentifiersInActivePicker, "count"))
  {
    v3 = [CNLimitedAccessContactPickerViewController alloc];
    -[NSSet allObjects](self->_selectedIdentifiersInActivePicker, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CNLimitedAccessContactPickerViewController initForShowSelected:](v3, "initForShowSelected:", v4);

    objc_msgSend(v5, "setDelegate:", self);
    -[CNLimitedAccessContactPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)handleUndoTapped
{
  id v3;

  -[CNContactPickerViewController navigationController](self->_contactPickerViewController, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didResetLimitedAccessSelectionTo:", self->_selectedIdentifiersOnLoad);

}

- (void)handleDeselectAllTapped
{
  unint64_t v3;
  NSSet *v4;
  void *v5;
  NSSet *v6;

  v3 = -[NSSet count](self->_selectedIdentifiersInActivePicker, "count");
  if (v3 >= -[NSSet count](self->_selectedIdentifiersOnLoad, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_selectedIdentifiersOnLoad;
  }
  v6 = v4;
  -[CNContactPickerViewController navigationController](self->_contactPickerViewController, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didResetLimitedAccessSelectionTo:", v6);

}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[CNLimitedAccessContactPickerViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v3, sel_updateColors);

}

- (void)updateColors
{
  id v3;

  -[CNLimitedAccessContactPickerViewController footerBorderColor](self, "footerBorderColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_footerViewBorder, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

}

- (id)footerBorderColor
{
  void *v2;
  void *v3;

  -[CNLimitedAccessContactPickerViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)createGenericPickerViewWithMultiSelectSupport:(BOOL)a3
{
  _BOOL4 v3;
  CNContactPickerViewController *v5;
  CNContactPickerViewController *contactPickerViewController;
  CNLimitedAccessContactPickerViewController *v7;
  CNContactPickerDelegate *contactPickerDelegate;

  v3 = a3;
  v5 = objc_alloc_init(CNContactPickerViewController);
  contactPickerViewController = self->_contactPickerViewController;
  self->_contactPickerViewController = v5;

  if (v3)
    v7 = self;
  else
    v7 = -[CNContactPickerSingleContactDelegate initWithTargetViewController:]([CNContactPickerSingleContactDelegate alloc], "initWithTargetViewController:", self);
  contactPickerDelegate = self->_contactPickerDelegate;
  self->_contactPickerDelegate = (CNContactPickerDelegate *)v7;

  -[CNContactPickerViewController setDelegate:](self->_contactPickerViewController, "setDelegate:", self->_contactPickerDelegate);
  -[CNContactPickerViewController setMode:](self->_contactPickerViewController, "setMode:", 2);
  -[CNContactPickerViewController setShouldAllowSearchForMultiSelect:](self->_contactPickerViewController, "setShouldAllowSearchForMultiSelect:", 1);
  -[CNContactPickerViewController setOnlyRealContacts:](self->_contactPickerViewController, "setOnlyRealContacts:", 1);
  -[CNContactPickerViewController setLimitedAccessPickerType:](self->_contactPickerViewController, "setLimitedAccessPickerType:", self->_pickerType);
  -[CNContactPickerViewController setLimitedAccessContactSelection:](self->_contactPickerViewController, "setLimitedAccessContactSelection:", self->_selectedIdentifiersOnLoad);
  -[CNContactPickerViewController setLimitedAccessAppName:](self->_contactPickerViewController, "setLimitedAccessAppName:", self->_appName);
  -[CNContactPickerViewController setLimitedAccessAppBundleId:](self->_contactPickerViewController, "setLimitedAccessAppBundleId:", self->_appBundleId);
}

- (void)createGenericFooterView
{
  UIView *v3;
  UIView *footerView;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CAShapeLayer *v16;
  CAShapeLayer *footerViewBorder;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  footerView = self->_footerView;
  self->_footerView = v3;

  +[CNUIColorRepository contactPickerBackgroundColor](CNUIColorRepository, "contactPickerBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_footerView, "setBackgroundColor:", v5);

  -[UIView setClipsToBounds:](self->_footerView, "setClipsToBounds:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEffect:", v7);

  objc_msgSend(v8, "setClipsToBounds:", 1);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setAlpha:", 1.0);
  -[UIView addSubview:](self->_footerView, "addSubview:", v8);
  objc_msgSend(v8, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_footerView, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  objc_msgSend(v8, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_footerView, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v9;
  objc_msgSend(v8, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_footerView, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v12;
  objc_msgSend(v8, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_footerView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v16 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  footerViewBorder = self->_footerViewBorder;
  self->_footerViewBorder = v16;

  -[CNLimitedAccessContactPickerViewController footerBorderColor](self, "footerBorderColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_footerViewBorder, "setStrokeColor:", objc_msgSend(v18, "CGColor"));

  -[CAShapeLayer setFillColor:](self->_footerViewBorder, "setFillColor:", 0);
  -[UIView layer](self->_footerView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSublayer:", self->_footerViewBorder);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNLimitedAccessContactPickerViewController;
  -[CNLimitedAccessContactPickerViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  if (self->_footerView)
  {
    switch(self->_pickerType)
    {
      case 1:
        -[CNLimitedAccessContactPickerViewController setupOnboardingFooterConstraints](self, "setupOnboardingFooterConstraints");
        break;
      case 2:
        -[CNLimitedAccessContactPickerViewController setupShowSelectedFooterConstraints](self, "setupShowSelectedFooterConstraints");
        break;
      case 3:
        -[CNLimitedAccessContactPickerViewController setupManagedOOPFooterConstraints](self, "setupManagedOOPFooterConstraints");
        break;
      case 4:
        -[CNLimitedAccessContactPickerViewController setupDeltaFooterConstraints](self, "setupDeltaFooterConstraints");
        break;
      default:
        return;
    }
  }
}

- (void)updateOnboardingUIForSelectionCount:(unint64_t)a3
{
  UIButton *onboardingContinueButton;
  UIButton *onboardingShowSelectedButton;
  void *v7;
  UIButton *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  onboardingContinueButton = self->_onboardingContinueButton;
  if (a3)
  {
    -[UIButton setEnabled:](onboardingContinueButton, "setEnabled:", 1);
    onboardingShowSelectedButton = self->_onboardingShowSelectedButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  }
  else
  {
    -[UIButton setEnabled:](onboardingContinueButton, "setEnabled:");
    onboardingShowSelectedButton = self->_onboardingShowSelectedButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](onboardingShowSelectedButton, "setTitleColor:forState:", v7, 0);

  v8 = self->_onboardingShowSelectedButton;
  v9 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_ONBOARDING_SELECTED"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v8, "setTitle:forState:", v11, 0);

}

- (void)updateListViewWithSelectedContacts:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *selectedIdentifiersInActivePicker;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v11 = 134217984;
    v12 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_18AC56000, v5, OS_LOG_TYPE_INFO, "Reloading limited access summary for %lu contacts", (uint8_t *)&v11, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0C99E60];
  +[CNLimitedAccessPickerSupport identifiersFromContacts:](CNLimitedAccessPickerSupport, "identifiersFromContacts:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  selectedIdentifiersInActivePicker = self->_selectedIdentifiersInActivePicker;
  self->_selectedIdentifiersInActivePicker = v8;

  -[CNContactPickerViewController navigationController](self->_contactPickerViewController, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didResetLimitedAccessSelectionTo:", self->_selectedIdentifiersInActivePicker);

}

- (void)updateFooterShowSelectedButton:(unint64_t)a3
{
  id *p_showSelectedButton;
  UIButton *showSelectedButton;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    -[UILabel setHidden:](self->_selectContactsLabel, "setHidden:", 1);
    p_showSelectedButton = (id *)&self->_showSelectedButton;
    showSelectedButton = self->_showSelectedButton;
    v7 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_SHOW_SELECTED"), &stru_1E20507A8, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](showSelectedButton, "setTitle:forState:", v10, 0);

  }
  else
  {
    -[UIButton setHidden:](self->_showSelectedButton, "setHidden:", 1);
    p_showSelectedButton = (id *)&self->_selectContactsLabel;
  }
  objc_msgSend(*p_showSelectedButton, "setHidden:", 0);
}

- (void)saveSelectionToLimitedAccessContacts:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_18AC56000, v5, OS_LOG_TYPE_INFO, "Saving limited access selection for %lu contacts", (uint8_t *)&v6, 0xCu);
  }

  +[CNLimitedAccessPickerSupport removeAllLimitedAccessIdentifiersForBundleID:](CNLimitedAccessPickerSupport, "removeAllLimitedAccessIdentifiersForBundleID:", self->_appBundleId);
  +[CNLimitedAccessPickerSupport addContactsToLimitedAccess:forBundleID:](CNLimitedAccessPickerSupport, "addContactsToLimitedAccess:forBundleID:", v4, self->_appBundleId);

}

- (void)callDelegateWithSelectedContactList:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNLimitedAccessContactPickerViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 134217984;
      v10 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_18AC56000, v7, OS_LOG_TYPE_INFO, "Telling delegate limited access has %lu contacts", (uint8_t *)&v9, 0xCu);
    }

    -[CNLimitedAccessContactPickerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactPicker:didSelectContacts:", self, v4);

  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v8 = objc_claimAutoreleasedReturnValue();
      +[CNLimitedAccessPickerSupport addContactsToLimitedAccess:forBundleID:](CNLimitedAccessPickerSupport, "addContactsToLimitedAccess:forBundleID:", v8, self->_appBundleId);

      -[CNLimitedAccessContactPickerViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543362;
          v14 = v11;
          _os_log_impl(&dword_18AC56000, v10, OS_LOG_TYPE_INFO, "Telling delegate limited access that %{public}@ has been selected", (uint8_t *)&v13, 0xCu);

        }
        -[CNLimitedAccessContactPickerViewController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "contactPicker:didSelectContact:", self, v7);

      }
    }
  }

}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    switch(self->_pickerType)
    {
      case 1:
        -[CNLimitedAccessContactPickerViewController updateOnboardingUIForSelectionCount:](self, "updateOnboardingUIForSelectionCount:", objc_msgSend(v6, "count"));
        goto LABEL_4;
      case 3:
        -[CNLimitedAccessContactPickerViewController saveSelectionToLimitedAccessContacts:](self, "saveSelectionToLimitedAccessContacts:", v6);
        -[CNLimitedAccessContactPickerViewController updateListViewWithSelectedContacts:](self, "updateListViewWithSelectedContacts:", v7);
        -[CNLimitedAccessContactPickerViewController updateFooterShowSelectedButton:](self, "updateFooterShowSelectedButton:", objc_msgSend(v7, "count"));
        break;
      case 4:
        -[CNLimitedAccessContactPickerViewController saveSelectionToLimitedAccessContacts:](self, "saveSelectionToLimitedAccessContacts:", v6);
        break;
      case 5:
LABEL_4:
        -[CNLimitedAccessContactPickerViewController updateListViewWithSelectedContacts:](self, "updateListViewWithSelectedContacts:", v7);
        break;
      default:
        break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[CNLimitedAccessContactPickerViewController callDelegateWithSelectedContactList:](self, "callDelegateWithSelectedContactList:", v7);
  }

}

- (void)contactPickerDidCancel:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  if (self->_contactPickerViewController == a3)
  {
    -[CNLimitedAccessContactPickerViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_INFO, "Telling delegate limited picker cancelled", v8, 2u);
      }

      -[CNLimitedAccessContactPickerViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contactPickerDidCancel:", self);

    }
  }
}

- (void)contactPickerDidGoBack:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CNLimitedAccessContactPickerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NSSet allObjects](self->_selectedIdentifiersInActivePicker, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNLimitedAccessPickerSupport contactsFromIdentifiers:](CNLimitedAccessPickerSupport, "contactsFromIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_INFO, "Telling delegate limited access went back with %lu selections", (uint8_t *)&v10, 0xCu);
    }

    -[CNLimitedAccessContactPickerViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contactPicker:didGoBackWithSelectedContacts:", self, v7);

  }
}

- (void)contactListViewController:(id)a3 didUpdateLimitedAccessSelection:(id)a4
{
  uint64_t v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  id *p_deltaAddedAndRemovedLabel;
  int *v14;
  NSUInteger v15;
  UIButton *deselectAllButton;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a4;
  objc_storeStrong((id *)&self->_selectedIdentifiersInActivePicker, a4);
  v6 = objc_msgSend(v27, "count");
  v7 = v6;
  switch(self->_pickerType)
  {
    case 1:
      -[CNLimitedAccessContactPickerViewController updateOnboardingUIForSelectionCount:](self, "updateOnboardingUIForSelectionCount:", v6);
      break;
    case 2:
      v15 = -[NSSet count](self->_selectedIdentifiersOnLoad, "count");
      deselectAllButton = self->_deselectAllButton;
      CNContactsUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v7 >= v15)
        v19 = CFSTR("LIMITED_CONTACTS_DESELECT_ALL");
      else
        v19 = CFSTR("LIMITED_CONTACTS_SELECT_ALL");
      objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1E20507A8, CFSTR("Localized"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](deselectAllButton, "setTitle:forState:", v26, 0);

      break;
    case 3:
      -[CNLimitedAccessContactPickerViewController updateFooterShowSelectedButton:](self, "updateFooterShowSelectedButton:", v6);
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v27);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minusSet:", self->_selectedIdentifiersOnLoad);
      v9 = objc_msgSend(v8, "count");
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->_selectedIdentifiersOnLoad);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "minusSet:", v27);
      v11 = objc_msgSend(v10, "count");
      v12 = (v9 | v11) == 0;
      if (v9 | v11)
      {
        v20 = v11;
        v21 = (void *)MEMORY[0x1E0CB3940];
        CNContactsUIBundle();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_DELTA_CHANGES"), &stru_1E20507A8, CFSTR("Localized"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringWithFormat:", v23, v9, v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        p_deltaAddedAndRemovedLabel = (id *)&self->_deltaAddedAndRemovedLabel;
        -[UILabel setText:](self->_deltaAddedAndRemovedLabel, "setText:", v24);

        -[UILabel setHidden:](self->_deltaSelectionCountLabel, "setHidden:", 1);
        -[UILabel setHidden:](self->_deltaEditedLabel, "setHidden:", 0);
        v14 = &OBJC_IVAR___CNLimitedAccessContactPickerViewController__deltaUndoButton;
      }
      else
      {
        -[UILabel setHidden:](self->_deltaEditedLabel, "setHidden:", 1);
        -[UILabel setHidden:](self->_deltaAddedAndRemovedLabel, "setHidden:", 1);
        p_deltaAddedAndRemovedLabel = (id *)&self->_deltaUndoButton;
        v14 = &OBJC_IVAR___CNLimitedAccessContactPickerViewController__deltaSelectionCountLabel;
      }
      objc_msgSend(*p_deltaAddedAndRemovedLabel, "setHidden:", v12);
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v14), "setHidden:", 0);
      -[CNLimitedAccessContactPickerViewController view](self, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setNeedsLayout");

      break;
    default:
      break;
  }

}

- (void)contactListViewControllerShouldEditLimitedAccessSelection:(id)a3
{
  id v4;

  -[CNLimitedAccessContactPickerViewController setIsSettingsEditingSelection:](self, "setIsSettingsEditingSelection:", 1);
  v4 = -[CNLimitedAccessContactPickerViewController initDeltaPickerForAppName:bundleId:]([CNLimitedAccessContactPickerViewController alloc], "initDeltaPickerForAppName:bundleId:", self->_appName, self->_appBundleId);
  objc_msgSend(v4, "setDelegate:", self);
  -[CNLimitedAccessContactPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (CNLimitedAccessContactPickerDelegate)delegate
{
  return (CNLimitedAccessContactPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (NSSet)selectedIdentifiersOnLoad
{
  return self->_selectedIdentifiersOnLoad;
}

- (NSSet)selectedIdentifiersInActivePicker
{
  return self->_selectedIdentifiersInActivePicker;
}

- (void)setSelectedIdentifiersInActivePicker:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIdentifiersInActivePicker, a3);
}

- (BOOL)isSettingsEditingSelection
{
  return self->_isSettingsEditingSelection;
}

- (void)setIsSettingsEditingSelection:(BOOL)a3
{
  self->_isSettingsEditingSelection = a3;
}

- (NSString)initalSearchText
{
  return self->_initalSearchText;
}

- (unint64_t)caption
{
  return self->_caption;
}

- (CNContactPickerDelegate)contactPickerDelegate
{
  return self->_contactPickerDelegate;
}

- (CNContactPickerViewController)contactPickerViewController
{
  return self->_contactPickerViewController;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (CAShapeLayer)footerViewBorder
{
  return self->_footerViewBorder;
}

- (int)pickerType
{
  return self->_pickerType;
}

- (UIButton)onboardingShowSelectedButton
{
  return self->_onboardingShowSelectedButton;
}

- (UIButton)onboardingContinueButton
{
  return self->_onboardingContinueButton;
}

- (UIButton)onboardingLaterButton
{
  return self->_onboardingLaterButton;
}

- (NSArray)onboardingConstraints
{
  return self->_onboardingConstraints;
}

- (void)setOnboardingConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingConstraints, a3);
}

- (UILabel)deltaSelectionCountLabel
{
  return self->_deltaSelectionCountLabel;
}

- (UILabel)deltaEditedLabel
{
  return self->_deltaEditedLabel;
}

- (UILabel)deltaAddedAndRemovedLabel
{
  return self->_deltaAddedAndRemovedLabel;
}

- (UILabel)selectContactsLabel
{
  return self->_selectContactsLabel;
}

- (UIButton)deltaUndoButton
{
  return self->_deltaUndoButton;
}

- (UIButton)showSelectedButton
{
  return self->_showSelectedButton;
}

- (UIButton)deselectAllButton
{
  return self->_deselectAllButton;
}

- (NSArray)footerConstraints
{
  return self->_footerConstraints;
}

- (void)setFooterConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_footerConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerConstraints, 0);
  objc_storeStrong((id *)&self->_deselectAllButton, 0);
  objc_storeStrong((id *)&self->_showSelectedButton, 0);
  objc_storeStrong((id *)&self->_deltaUndoButton, 0);
  objc_storeStrong((id *)&self->_selectContactsLabel, 0);
  objc_storeStrong((id *)&self->_deltaAddedAndRemovedLabel, 0);
  objc_storeStrong((id *)&self->_deltaEditedLabel, 0);
  objc_storeStrong((id *)&self->_deltaSelectionCountLabel, 0);
  objc_storeStrong((id *)&self->_onboardingConstraints, 0);
  objc_storeStrong((id *)&self->_onboardingLaterButton, 0);
  objc_storeStrong((id *)&self->_onboardingContinueButton, 0);
  objc_storeStrong((id *)&self->_onboardingShowSelectedButton, 0);
  objc_storeStrong((id *)&self->_footerViewBorder, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contactPickerViewController, 0);
  objc_storeStrong((id *)&self->_contactPickerDelegate, 0);
  objc_storeStrong((id *)&self->_initalSearchText, 0);
  objc_storeStrong((id *)&self->_selectedIdentifiersInActivePicker, 0);
  objc_storeStrong((id *)&self->_selectedIdentifiersOnLoad, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

id __71__CNLimitedAccessContactPickerViewController_createManageOOPFooterView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC1138]);
  return v3;
}

id __74__CNLimitedAccessContactPickerViewController_createShowSelectedFooterView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC1138]);
  return v3;
}

uint64_t __63__CNLimitedAccessContactPickerViewController_handleLaterTapped__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doLimitedWithNoContacts");
}

id __72__CNLimitedAccessContactPickerViewController_createOnboardingFooterView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC1138]);
  return v3;
}

id __72__CNLimitedAccessContactPickerViewController_createOnboardingFooterView__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC1138]);
  return v3;
}

id __72__CNLimitedAccessContactPickerViewController_createOnboardingHeaderView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 13.0, *MEMORY[0x1E0DC1440]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC1138]);

  return v2;
}

+ (id)log
{
  if (log_cn_once_token_1_54492 != -1)
    dispatch_once(&log_cn_once_token_1_54492, &__block_literal_global_54493);
  return (id)log_cn_once_object_1_54494;
}

void __49__CNLimitedAccessContactPickerViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNLimitedAccessContactPickerViewController");
  v1 = (void *)log_cn_once_object_1_54494;
  log_cn_once_object_1_54494 = (uint64_t)v0;

}

@end

@implementation LUIUserInfoView

- (LUIUserInfoView)initWithFrame:(CGRect)a3
{
  LUIUserInfoView *v3;
  id v4;
  double y;
  double width;
  double height;
  UILabel *v8;
  UILabel *fullNameIndicatorLabel;
  void *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *givenNameIndicatorLabel;
  void *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  UILabel *familyNameIndicatorLabel;
  void *v20;
  void *v21;
  void *v22;
  UILabel *v23;
  UILabel *imageURLIndicatorLabel;
  void *v25;
  void *v26;
  void *v27;
  UILabel *v28;
  UILabel *appleIDIndicatorLabel;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  UILabel *v35;
  UILabel *lastLoginDateIndicatorLabel;
  void *v37;
  void *v38;
  void *v39;
  UILabel *v40;
  UILabel *lastRemoteAuthDateIndicatorLabel;
  void *v42;
  void *v43;
  void *v44;
  UILabel *v45;
  UILabel *passcodeTypeIndicatorLabel;
  void *v47;
  void *v48;
  void *v49;
  UILabel *v50;
  UILabel *isAccountDisabledIndicatorLabel;
  void *v52;
  void *v53;
  void *v54;
  UILabel *v55;
  UILabel *dataQuotaIndicatorLabel;
  void *v57;
  void *v58;
  void *v59;
  UILabel *v60;
  UILabel *dataUsedIndicatorLabel;
  void *v62;
  void *v63;
  void *v64;
  UILabel *v65;
  UILabel *hasDataToSyncIndicatorLabel;
  void *v67;
  void *v68;
  void *v69;
  UILabel *v70;
  UILabel *hasManagedCredentialIndicatorLabel;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  UILabel *v77;
  UILabel *fullNameLabel;
  UILabel *v79;
  UILabel *givenNameLabel;
  UILabel *v81;
  UILabel *familyNameLabel;
  UILabel *v83;
  UILabel *imageURLLabel;
  UILabel *v85;
  UILabel *appleIDLabel;
  UILabel *v87;
  UILabel *lastLoginDateLabel;
  UILabel *v89;
  UILabel *lastRemoteAuthDateLabel;
  UILabel *v91;
  UILabel *passcodeTypeLabel;
  UILabel *v93;
  UILabel *isAccountDisabledLabel;
  UILabel *v95;
  UILabel *dataQuotaLabel;
  UILabel *v97;
  UILabel *dataUsedLabel;
  UILabel *v99;
  UILabel *hasDataToSyncLabel;
  UILabel *v101;
  UILabel *hasManagedCredentialLabel;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  UIStackView *v107;
  UIStackView *fullNameStackView;
  id v109;
  void *v110;
  UIStackView *v111;
  UIStackView *givenNameStackView;
  id v113;
  void *v114;
  UIStackView *v115;
  UIStackView *familyNameStackView;
  id v117;
  void *v118;
  UIStackView *v119;
  UIStackView *imageURLStackView;
  id v121;
  void *v122;
  UIStackView *v123;
  UIStackView *appleIDStackView;
  id v125;
  void *v126;
  UIStackView *v127;
  UIStackView *lastLoginDateStackView;
  id v129;
  void *v130;
  UIStackView *v131;
  UIStackView *lastRemoteAuthDateStackView;
  id v133;
  void *v134;
  UIStackView *v135;
  UIStackView *passcodeTypeStackView;
  id v137;
  void *v138;
  UIStackView *v139;
  UIStackView *isAccountDisabledStackView;
  id v141;
  void *v142;
  UIStackView *v143;
  UIStackView *dataQuotaStackView;
  id v145;
  void *v146;
  UIStackView *v147;
  UIStackView *dataUsedStackView;
  id v149;
  void *v150;
  UIStackView *v151;
  UIStackView *hasDataToSyncStackView;
  id v153;
  void *v154;
  UIStackView *v155;
  UIStackView *hasManagedCredentialStackView;
  void *v157;
  void *v158;
  id v159;
  void *v160;
  UIStackView *v161;
  UIStackView *containerStackView;
  void *v163;
  uint64_t v164;
  UIButton *okButton;
  UIButton *v166;
  void *v167;
  void *v168;
  id v169;
  void *v170;
  UIStackView *v171;
  UIStackView *containerAndButtonStackView;
  objc_super v174;
  _QWORD v175[2];
  _QWORD v176[13];
  _QWORD v177[13];
  _QWORD v178[2];
  _QWORD v179[2];
  _QWORD v180[2];
  _QWORD v181[2];
  _QWORD v182[2];
  _QWORD v183[2];
  _QWORD v184[2];
  _QWORD v185[2];
  _QWORD v186[2];
  _QWORD v187[2];
  _QWORD v188[2];
  _QWORD v189[2];
  _QWORD v190[2];
  _QWORD v191[13];
  _QWORD v192[13];

  v174.receiver = self;
  v174.super_class = (Class)LUIUserInfoView;
  v3 = -[LUIUserInfoView initWithFrame:](&v174, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    fullNameIndicatorLabel = v3->_fullNameIndicatorLabel;
    v3->_fullNameIndicatorLabel = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FULL_NAME"), &stru_100069EB8, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_fullNameIndicatorLabel, "setText:", v12);

    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    givenNameIndicatorLabel = v3->_givenNameIndicatorLabel;
    v3->_givenNameIndicatorLabel = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("GIVEN_NAME"), &stru_100069EB8, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_givenNameIndicatorLabel, "setText:", v17);

    v18 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    familyNameIndicatorLabel = v3->_familyNameIndicatorLabel;
    v3->_familyNameIndicatorLabel = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("FAMILY_NAME"), &stru_100069EB8, 0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_familyNameIndicatorLabel, "setText:", v22);

    v23 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageURLIndicatorLabel = v3->_imageURLIndicatorLabel;
    v3->_imageURLIndicatorLabel = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("IMAGE_URL"), &stru_100069EB8, 0));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_imageURLIndicatorLabel, "setText:", v27);

    v28 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    appleIDIndicatorLabel = v3->_appleIDIndicatorLabel;
    v3->_appleIDIndicatorLabel = v28;

    LODWORD(v25) = _os_feature_enabled_impl("AppleAccount", "AABranding");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v31 = v30;
    if ((_DWORD)v25)
      v32 = CFSTR("APPLE_ACCOUNT_LABEL");
    else
      v32 = CFSTR("APPLE_ID_LABEL");
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", v32, &stru_100069EB8, 0));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_appleIDIndicatorLabel, "setText:", v34);

    v35 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    lastLoginDateIndicatorLabel = v3->_lastLoginDateIndicatorLabel;
    v3->_lastLoginDateIndicatorLabel = v35;

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("LAST_LOGIN_DATE"), &stru_100069EB8, 0));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_lastLoginDateIndicatorLabel, "setText:", v39);

    v40 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    lastRemoteAuthDateIndicatorLabel = v3->_lastRemoteAuthDateIndicatorLabel;
    v3->_lastRemoteAuthDateIndicatorLabel = v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("LAST_REMOTE_AUTH_DATE"), &stru_100069EB8, 0));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_lastRemoteAuthDateIndicatorLabel, "setText:", v44);

    v45 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    passcodeTypeIndicatorLabel = v3->_passcodeTypeIndicatorLabel;
    v3->_passcodeTypeIndicatorLabel = v45;

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("PASSCODE_TYPE"), &stru_100069EB8, 0));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_passcodeTypeIndicatorLabel, "setText:", v49);

    v50 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    isAccountDisabledIndicatorLabel = v3->_isAccountDisabledIndicatorLabel;
    v3->_isAccountDisabledIndicatorLabel = v50;

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_STATUS"), &stru_100069EB8, 0));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_isAccountDisabledIndicatorLabel, "setText:", v54);

    v55 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    dataQuotaIndicatorLabel = v3->_dataQuotaIndicatorLabel;
    v3->_dataQuotaIndicatorLabel = v55;

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("DATA_QUOTA"), &stru_100069EB8, 0));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_dataQuotaIndicatorLabel, "setText:", v59);

    v60 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    dataUsedIndicatorLabel = v3->_dataUsedIndicatorLabel;
    v3->_dataUsedIndicatorLabel = v60;

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("DATA_USED"), &stru_100069EB8, 0));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_dataUsedIndicatorLabel, "setText:", v64);

    v65 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    hasDataToSyncIndicatorLabel = v3->_hasDataToSyncIndicatorLabel;
    v3->_hasDataToSyncIndicatorLabel = v65;

    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("SYNC_STATUS"), &stru_100069EB8, 0));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_hasDataToSyncIndicatorLabel, "setText:", v69);

    v70 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    hasManagedCredentialIndicatorLabel = v3->_hasManagedCredentialIndicatorLabel;
    v3->_hasManagedCredentialIndicatorLabel = v70;

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("HAS_MC_STATUS"), &stru_100069EB8, 0));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "stringByAppendingString:", CFSTR(":")));
    -[UILabel setText:](v3->_hasManagedCredentialIndicatorLabel, "setText:", v74);

    v75 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUserInfoStyle sharedStyle](LUIUserInfoStyle, "sharedStyle"));
    v192[0] = v3->_fullNameIndicatorLabel;
    v192[1] = v3->_givenNameIndicatorLabel;
    v192[2] = v3->_familyNameIndicatorLabel;
    v192[3] = v3->_imageURLIndicatorLabel;
    v192[4] = v3->_appleIDIndicatorLabel;
    v192[5] = v3->_lastLoginDateIndicatorLabel;
    v192[6] = v3->_lastRemoteAuthDateIndicatorLabel;
    v192[7] = v3->_passcodeTypeIndicatorLabel;
    v192[8] = v3->_isAccountDisabledIndicatorLabel;
    v192[9] = v3->_dataQuotaIndicatorLabel;
    v192[10] = v3->_dataUsedIndicatorLabel;
    v192[11] = v3->_hasDataToSyncIndicatorLabel;
    v192[12] = v3->_hasManagedCredentialIndicatorLabel;
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v192, 13));
    objc_msgSend(v75, "applyIndicatorLabelThemeToLabels:", v76);

    v77 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    fullNameLabel = v3->_fullNameLabel;
    v3->_fullNameLabel = v77;

    v79 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    givenNameLabel = v3->_givenNameLabel;
    v3->_givenNameLabel = v79;

    v81 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    familyNameLabel = v3->_familyNameLabel;
    v3->_familyNameLabel = v81;

    v83 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageURLLabel = v3->_imageURLLabel;
    v3->_imageURLLabel = v83;

    v85 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    appleIDLabel = v3->_appleIDLabel;
    v3->_appleIDLabel = v85;

    v87 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    lastLoginDateLabel = v3->_lastLoginDateLabel;
    v3->_lastLoginDateLabel = v87;

    v89 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    lastRemoteAuthDateLabel = v3->_lastRemoteAuthDateLabel;
    v3->_lastRemoteAuthDateLabel = v89;

    v91 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    passcodeTypeLabel = v3->_passcodeTypeLabel;
    v3->_passcodeTypeLabel = v91;

    v93 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    isAccountDisabledLabel = v3->_isAccountDisabledLabel;
    v3->_isAccountDisabledLabel = v93;

    v95 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    dataQuotaLabel = v3->_dataQuotaLabel;
    v3->_dataQuotaLabel = v95;

    v97 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    dataUsedLabel = v3->_dataUsedLabel;
    v3->_dataUsedLabel = v97;

    v99 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    hasDataToSyncLabel = v3->_hasDataToSyncLabel;
    v3->_hasDataToSyncLabel = v99;

    v101 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    hasManagedCredentialLabel = v3->_hasManagedCredentialLabel;
    v3->_hasManagedCredentialLabel = v101;

    v103 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUserInfoStyle sharedStyle](LUIUserInfoStyle, "sharedStyle"));
    v191[0] = v3->_fullNameLabel;
    v191[1] = v3->_givenNameLabel;
    v191[2] = v3->_familyNameLabel;
    v191[3] = v3->_imageURLLabel;
    v191[4] = v3->_appleIDLabel;
    v191[5] = v3->_lastLoginDateLabel;
    v191[6] = v3->_lastRemoteAuthDateLabel;
    v191[7] = v3->_passcodeTypeLabel;
    v191[8] = v3->_isAccountDisabledLabel;
    v191[9] = v3->_dataQuotaLabel;
    v191[10] = v3->_dataUsedLabel;
    v191[11] = v3->_hasDataToSyncLabel;
    v191[12] = v3->_hasManagedCredentialLabel;
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v191, 13));
    objc_msgSend(v103, "applyThemeToLabels:", v104);

    v105 = objc_alloc((Class)UIStackView);
    v190[0] = v3->_fullNameIndicatorLabel;
    v190[1] = v3->_fullNameLabel;
    v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v190, 2));
    v107 = (UIStackView *)objc_msgSend(v105, "initWithArrangedSubviews:", v106);
    fullNameStackView = v3->_fullNameStackView;
    v3->_fullNameStackView = v107;

    v109 = objc_alloc((Class)UIStackView);
    v189[0] = v3->_givenNameIndicatorLabel;
    v189[1] = v3->_givenNameLabel;
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v189, 2));
    v111 = (UIStackView *)objc_msgSend(v109, "initWithArrangedSubviews:", v110);
    givenNameStackView = v3->_givenNameStackView;
    v3->_givenNameStackView = v111;

    v113 = objc_alloc((Class)UIStackView);
    v188[0] = v3->_familyNameIndicatorLabel;
    v188[1] = v3->_familyNameLabel;
    v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v188, 2));
    v115 = (UIStackView *)objc_msgSend(v113, "initWithArrangedSubviews:", v114);
    familyNameStackView = v3->_familyNameStackView;
    v3->_familyNameStackView = v115;

    v117 = objc_alloc((Class)UIStackView);
    v187[0] = v3->_imageURLIndicatorLabel;
    v187[1] = v3->_imageURLLabel;
    v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v187, 2));
    v119 = (UIStackView *)objc_msgSend(v117, "initWithArrangedSubviews:", v118);
    imageURLStackView = v3->_imageURLStackView;
    v3->_imageURLStackView = v119;

    v121 = objc_alloc((Class)UIStackView);
    v186[0] = v3->_appleIDIndicatorLabel;
    v186[1] = v3->_appleIDLabel;
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v186, 2));
    v123 = (UIStackView *)objc_msgSend(v121, "initWithArrangedSubviews:", v122);
    appleIDStackView = v3->_appleIDStackView;
    v3->_appleIDStackView = v123;

    v125 = objc_alloc((Class)UIStackView);
    v185[0] = v3->_lastLoginDateIndicatorLabel;
    v185[1] = v3->_lastLoginDateLabel;
    v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v185, 2));
    v127 = (UIStackView *)objc_msgSend(v125, "initWithArrangedSubviews:", v126);
    lastLoginDateStackView = v3->_lastLoginDateStackView;
    v3->_lastLoginDateStackView = v127;

    v129 = objc_alloc((Class)UIStackView);
    v184[0] = v3->_lastRemoteAuthDateIndicatorLabel;
    v184[1] = v3->_lastRemoteAuthDateLabel;
    v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v184, 2));
    v131 = (UIStackView *)objc_msgSend(v129, "initWithArrangedSubviews:", v130);
    lastRemoteAuthDateStackView = v3->_lastRemoteAuthDateStackView;
    v3->_lastRemoteAuthDateStackView = v131;

    v133 = objc_alloc((Class)UIStackView);
    v183[0] = v3->_passcodeTypeIndicatorLabel;
    v183[1] = v3->_passcodeTypeLabel;
    v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v183, 2));
    v135 = (UIStackView *)objc_msgSend(v133, "initWithArrangedSubviews:", v134);
    passcodeTypeStackView = v3->_passcodeTypeStackView;
    v3->_passcodeTypeStackView = v135;

    v137 = objc_alloc((Class)UIStackView);
    v182[0] = v3->_isAccountDisabledIndicatorLabel;
    v182[1] = v3->_isAccountDisabledLabel;
    v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v182, 2));
    v139 = (UIStackView *)objc_msgSend(v137, "initWithArrangedSubviews:", v138);
    isAccountDisabledStackView = v3->_isAccountDisabledStackView;
    v3->_isAccountDisabledStackView = v139;

    v141 = objc_alloc((Class)UIStackView);
    v181[0] = v3->_dataQuotaIndicatorLabel;
    v181[1] = v3->_dataQuotaLabel;
    v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v181, 2));
    v143 = (UIStackView *)objc_msgSend(v141, "initWithArrangedSubviews:", v142);
    dataQuotaStackView = v3->_dataQuotaStackView;
    v3->_dataQuotaStackView = v143;

    v145 = objc_alloc((Class)UIStackView);
    v180[0] = v3->_dataUsedIndicatorLabel;
    v180[1] = v3->_dataUsedLabel;
    v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v180, 2));
    v147 = (UIStackView *)objc_msgSend(v145, "initWithArrangedSubviews:", v146);
    dataUsedStackView = v3->_dataUsedStackView;
    v3->_dataUsedStackView = v147;

    v149 = objc_alloc((Class)UIStackView);
    v179[0] = v3->_hasDataToSyncIndicatorLabel;
    v179[1] = v3->_hasDataToSyncLabel;
    v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v179, 2));
    v151 = (UIStackView *)objc_msgSend(v149, "initWithArrangedSubviews:", v150);
    hasDataToSyncStackView = v3->_hasDataToSyncStackView;
    v3->_hasDataToSyncStackView = v151;

    v153 = objc_alloc((Class)UIStackView);
    v178[0] = v3->_hasManagedCredentialIndicatorLabel;
    v178[1] = v3->_hasManagedCredentialLabel;
    v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v178, 2));
    v155 = (UIStackView *)objc_msgSend(v153, "initWithArrangedSubviews:", v154);
    hasManagedCredentialStackView = v3->_hasManagedCredentialStackView;
    v3->_hasManagedCredentialStackView = v155;

    v157 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUserInfoStyle sharedStyle](LUIUserInfoStyle, "sharedStyle"));
    v177[0] = v3->_fullNameStackView;
    v177[1] = v3->_givenNameStackView;
    v177[2] = v3->_familyNameStackView;
    v177[3] = v3->_imageURLStackView;
    v177[4] = v3->_appleIDStackView;
    v177[5] = v3->_lastLoginDateStackView;
    v177[6] = v3->_lastRemoteAuthDateStackView;
    v177[7] = v3->_passcodeTypeStackView;
    v177[8] = v3->_isAccountDisabledStackView;
    v177[9] = v3->_dataQuotaStackView;
    v177[10] = v3->_dataUsedStackView;
    v177[11] = v3->_hasDataToSyncStackView;
    v177[12] = v3->_hasManagedCredentialStackView;
    v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v177, 13));
    objc_msgSend(v157, "applyRowStackViewPropertiesToStackViews:", v158);

    v159 = objc_alloc((Class)UIStackView);
    v176[0] = v3->_fullNameStackView;
    v176[1] = v3->_givenNameStackView;
    v176[2] = v3->_familyNameStackView;
    v176[3] = v3->_imageURLStackView;
    v176[4] = v3->_appleIDStackView;
    v176[5] = v3->_lastLoginDateStackView;
    v176[6] = v3->_lastRemoteAuthDateStackView;
    v176[7] = v3->_passcodeTypeStackView;
    v176[8] = v3->_isAccountDisabledStackView;
    v176[9] = v3->_dataQuotaStackView;
    v176[10] = v3->_dataUsedStackView;
    v176[11] = v3->_hasDataToSyncStackView;
    v176[12] = v3->_hasManagedCredentialStackView;
    v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v176, 13));
    v161 = (UIStackView *)objc_msgSend(v159, "initWithArrangedSubviews:", v160);
    containerStackView = v3->_containerStackView;
    v3->_containerStackView = v161;

    v163 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUserInfoStyle sharedStyle](LUIUserInfoStyle, "sharedStyle"));
    objc_msgSend(v163, "stackViewSpacing");
    -[UIStackView setSpacing:](v3->_containerStackView, "setSpacing:");

    -[UIStackView setAxis:](v3->_containerStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v3->_containerStackView, "setAlignment:", 1);
    v164 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    okButton = v3->_okButton;
    v3->_okButton = (UIButton *)v164;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_okButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v166 = v3->_okButton;
    v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100069EB8, 0));
    -[UIButton setTitle:forState:](v166, "setTitle:forState:", v168, 0);

    -[UIButton addTarget:action:forControlEvents:](v3->_okButton, "addTarget:action:forControlEvents:", v3, "okButtonPressed:", 64);
    v169 = objc_alloc((Class)UIStackView);
    v175[0] = v3->_containerStackView;
    v175[1] = v3->_okButton;
    v170 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v175, 2));
    v171 = (UIStackView *)objc_msgSend(v169, "initWithArrangedSubviews:", v170);
    containerAndButtonStackView = v3->_containerAndButtonStackView;
    v3->_containerAndButtonStackView = v171;

    -[UIStackView setSpacing:](v3->_containerAndButtonStackView, "setSpacing:", 20.0);
    -[UIStackView setAxis:](v3->_containerAndButtonStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v3->_containerAndButtonStackView, "setAlignment:", 3);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_containerAndButtonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[LUIUserInfoView addSubview:](v3, "addSubview:", v3->_containerAndButtonStackView);
    -[LUIUserInfoView activateConstraints](v3, "activateConstraints");
    -[LUIUserInfoView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("LUIUserInfoView"));
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  -[LUIUserInfoView layoutIfNeeded](self, "layoutIfNeeded", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView okButton](self, "okButton"));
  objc_msgSend(v4, "sizeToFit");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUserInfoStyle sharedStyle](LUIUserInfoStyle, "sharedStyle"));
  objc_msgSend(v5, "sidePadding");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUserInfoStyle sharedStyle](LUIUserInfoStyle, "sharedStyle"));
  objc_msgSend(v8, "bottomPadding");
  v10 = v7 + v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUserInfoStyle sharedStyle](LUIUserInfoStyle, "sharedStyle"));
  objc_msgSend(v11, "sidePadding");
  v13 = v12 + v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUserInfoStyle sharedStyle](LUIUserInfoStyle, "sharedStyle"));
  objc_msgSend(v14, "stackViewSpacing");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView containerStackView](self, "containerStackView"));
  objc_msgSend(v17, "frame");
  v19 = v13 + v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView containerStackView](self, "containerStackView"));
  objc_msgSend(v20, "frame");
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView okButton](self, "okButton"));
  objc_msgSend(v23, "frame");
  v25 = v16 + v10 + v22 + v24;

  v26 = v19;
  v27 = v25;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)activateConstraints
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[14];

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView fullNameIndicatorLabel](self, "fullNameIndicatorLabel"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "trailingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView givenNameIndicatorLabel](self, "givenNameIndicatorLabel"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v68));
  v72[0] = v67;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView givenNameIndicatorLabel](self, "givenNameIndicatorLabel"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView familyNameIndicatorLabel](self, "familyNameIndicatorLabel"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "trailingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v63));
  v72[1] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView familyNameIndicatorLabel](self, "familyNameIndicatorLabel"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView imageURLIndicatorLabel](self, "imageURLIndicatorLabel"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
  v72[2] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView imageURLIndicatorLabel](self, "imageURLIndicatorLabel"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView appleIDIndicatorLabel](self, "appleIDIndicatorLabel"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
  v72[3] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView appleIDIndicatorLabel](self, "appleIDIndicatorLabel"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView lastLoginDateIndicatorLabel](self, "lastLoginDateIndicatorLabel"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v72[4] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView lastLoginDateIndicatorLabel](self, "lastLoginDateIndicatorLabel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView lastRemoteAuthDateIndicatorLabel](self, "lastRemoteAuthDateIndicatorLabel"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v72[5] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView lastRemoteAuthDateIndicatorLabel](self, "lastRemoteAuthDateIndicatorLabel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView passcodeTypeIndicatorLabel](self, "passcodeTypeIndicatorLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v72[6] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView passcodeTypeIndicatorLabel](self, "passcodeTypeIndicatorLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView isAccountDisabledIndicatorLabel](self, "isAccountDisabledIndicatorLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v72[7] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView isAccountDisabledIndicatorLabel](self, "isAccountDisabledIndicatorLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView dataQuotaIndicatorLabel](self, "dataQuotaIndicatorLabel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v72[8] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView dataQuotaIndicatorLabel](self, "dataQuotaIndicatorLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView dataUsedIndicatorLabel](self, "dataUsedIndicatorLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v72[9] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView dataUsedIndicatorLabel](self, "dataUsedIndicatorLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView hasDataToSyncIndicatorLabel](self, "hasDataToSyncIndicatorLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v72[10] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView hasDataToSyncIndicatorLabel](self, "hasDataToSyncIndicatorLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView hasManagedCredentialIndicatorLabel](self, "hasManagedCredentialIndicatorLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v72[11] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView containerAndButtonStackView](self, "containerAndButtonStackView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView centerXAnchor](self, "centerXAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v72[12] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView containerAndButtonStackView](self, "containerAndButtonStackView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView centerYAnchor](self, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v72[13] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 14));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)setUser:(id)a3
{
  LKUser *v5;

  v5 = (LKUser *)a3;
  if (self->_user != v5)
  {
    objc_storeStrong((id *)&self->_user, a3);
    -[LUIUserInfoView _updateLabelsForUser:](self, "_updateLabelsForUser:", v5);
    -[LUIUserInfoView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateLabelsForUser:(id)a3
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v46;

  v46 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "displayName"));
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("N/A");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView fullNameLabel](self, "fullNameLabel"));
  objc_msgSend(v7, "setText:", v6);

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "givenName"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("N/A");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView givenNameLabel](self, "givenNameLabel"));
  objc_msgSend(v11, "setText:", v10);

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "familyName"));
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("N/A");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView familyNameLabel](self, "familyNameLabel"));
  objc_msgSend(v15, "setText:", v14);

  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "username"));
  v17 = (void *)v16;
  if (v16)
    v18 = (__CFString *)v16;
  else
    v18 = CFSTR("N/A");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView appleIDLabel](self, "appleIDLabel"));
  objc_msgSend(v19, "setText:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mediumImageURL"));
  if (v20)
  {
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mediumImageURL"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString absoluteString](v18, "absoluteString"));
  }
  else
  {
    v21 = CFSTR("N/A");
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView imageURLLabel](self, "imageURLLabel"));
  objc_msgSend(v22, "setText:", v21);

  if (v20)
  {

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "lastLoginDate"));
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = CFSTR("N/A");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView lastLoginDateLabel](self, "lastLoginDateLabel"));
  objc_msgSend(v27, "setText:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "lastRemoteAuthDate"));
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "description"));
  v30 = (void *)v29;
  if (v29)
    v31 = (const __CFString *)v29;
  else
    v31 = CFSTR("N/A");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView lastRemoteAuthDateLabel](self, "lastRemoteAuthDateLabel"));
  objc_msgSend(v32, "setText:", v31);

  switch((unint64_t)objc_msgSend(v46, "passcodeType"))
  {
    case 0uLL:
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView passcodeTypeLabel](self, "passcodeTypeLabel"));
      v34 = v33;
      v35 = CFSTR("4 Digit");
      break;
    case 1uLL:
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView passcodeTypeLabel](self, "passcodeTypeLabel"));
      v34 = v33;
      v35 = CFSTR("6 Digit");
      break;
    case 2uLL:
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView passcodeTypeLabel](self, "passcodeTypeLabel"));
      v34 = v33;
      v35 = CFSTR("Numeric Long");
      break;
    case 3uLL:
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView passcodeTypeLabel](self, "passcodeTypeLabel"));
      v34 = v33;
      v35 = CFSTR("Complex");
      break;
    default:
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView passcodeTypeLabel](self, "passcodeTypeLabel"));
      v34 = v33;
      v35 = CFSTR("N/A");
      break;
  }
  objc_msgSend(v33, "setText:", v35);

  if (objc_msgSend(v46, "isDisabled"))
    v36 = CFSTR("Disabled");
  else
    v36 = CFSTR("Not disabled");
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView isAccountDisabledLabel](self, "isAccountDisabledLabel"));
  objc_msgSend(v37, "setText:", v36);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStringfy dataSizeStringFromBytes:](LUIStringfy, "dataSizeStringFromBytes:", objc_msgSend(v46, "dataQuota")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView dataQuotaLabel](self, "dataQuotaLabel"));
  objc_msgSend(v39, "setText:", v38);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStringfy dataSizeStringFromBytes:](LUIStringfy, "dataSizeStringFromBytes:", objc_msgSend(v46, "dataUsed")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView dataUsedLabel](self, "dataUsedLabel"));
  objc_msgSend(v41, "setText:", v40);

  if (objc_msgSend(v46, "hasDataToSync"))
    v42 = CFSTR("Has data to sync");
  else
    v42 = CFSTR("Synced");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView hasDataToSyncLabel](self, "hasDataToSyncLabel"));
  objc_msgSend(v43, "setText:", v42);

  if (objc_msgSend(v46, "hasManagedCredentials"))
    v44 = CFSTR("Yes");
  else
    v44 = CFSTR("No");
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView hasManagedCredentialLabel](self, "hasManagedCredentialLabel"));
  objc_msgSend(v45, "setText:", v44);

}

- (void)okButtonPressed:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[LUIUserInfoView delegate](self, "delegate"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, "okButtonPressed:");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserInfoView delegate](self, "delegate"));
      objc_msgSend(v8, "okButtonPressed:", v9);

    }
  }

}

- (LKUser)user
{
  return self->_user;
}

- (LUIUserInfoViewDelegate)delegate
{
  return (LUIUserInfoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)fullNameIndicatorLabel
{
  return self->_fullNameIndicatorLabel;
}

- (void)setFullNameIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fullNameIndicatorLabel, a3);
}

- (UILabel)fullNameLabel
{
  return self->_fullNameLabel;
}

- (void)setFullNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fullNameLabel, a3);
}

- (UILabel)givenNameIndicatorLabel
{
  return self->_givenNameIndicatorLabel;
}

- (void)setGivenNameIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_givenNameIndicatorLabel, a3);
}

- (UILabel)givenNameLabel
{
  return self->_givenNameLabel;
}

- (void)setGivenNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_givenNameLabel, a3);
}

- (UILabel)familyNameIndicatorLabel
{
  return self->_familyNameIndicatorLabel;
}

- (void)setFamilyNameIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_familyNameIndicatorLabel, a3);
}

- (UILabel)familyNameLabel
{
  return self->_familyNameLabel;
}

- (void)setFamilyNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_familyNameLabel, a3);
}

- (UILabel)imageURLIndicatorLabel
{
  return self->_imageURLIndicatorLabel;
}

- (void)setImageURLIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_imageURLIndicatorLabel, a3);
}

- (UILabel)imageURLLabel
{
  return self->_imageURLLabel;
}

- (void)setImageURLLabel:(id)a3
{
  objc_storeStrong((id *)&self->_imageURLLabel, a3);
}

- (UILabel)appleIDIndicatorLabel
{
  return self->_appleIDIndicatorLabel;
}

- (void)setAppleIDIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDIndicatorLabel, a3);
}

- (UILabel)appleIDLabel
{
  return self->_appleIDLabel;
}

- (void)setAppleIDLabel:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDLabel, a3);
}

- (UILabel)lastLoginDateIndicatorLabel
{
  return self->_lastLoginDateIndicatorLabel;
}

- (void)setLastLoginDateIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lastLoginDateIndicatorLabel, a3);
}

- (UILabel)lastLoginDateLabel
{
  return self->_lastLoginDateLabel;
}

- (void)setLastLoginDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lastLoginDateLabel, a3);
}

- (UILabel)lastRemoteAuthDateIndicatorLabel
{
  return self->_lastRemoteAuthDateIndicatorLabel;
}

- (void)setLastRemoteAuthDateIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lastRemoteAuthDateIndicatorLabel, a3);
}

- (UILabel)lastRemoteAuthDateLabel
{
  return self->_lastRemoteAuthDateLabel;
}

- (void)setLastRemoteAuthDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lastRemoteAuthDateLabel, a3);
}

- (UILabel)passcodeTypeIndicatorLabel
{
  return self->_passcodeTypeIndicatorLabel;
}

- (void)setPasscodeTypeIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeTypeIndicatorLabel, a3);
}

- (UILabel)passcodeTypeLabel
{
  return self->_passcodeTypeLabel;
}

- (void)setPasscodeTypeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeTypeLabel, a3);
}

- (UILabel)isAccountDisabledIndicatorLabel
{
  return self->_isAccountDisabledIndicatorLabel;
}

- (void)setIsAccountDisabledIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_isAccountDisabledIndicatorLabel, a3);
}

- (UILabel)isAccountDisabledLabel
{
  return self->_isAccountDisabledLabel;
}

- (void)setIsAccountDisabledLabel:(id)a3
{
  objc_storeStrong((id *)&self->_isAccountDisabledLabel, a3);
}

- (UILabel)dataQuotaIndicatorLabel
{
  return self->_dataQuotaIndicatorLabel;
}

- (void)setDataQuotaIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dataQuotaIndicatorLabel, a3);
}

- (UILabel)dataQuotaLabel
{
  return self->_dataQuotaLabel;
}

- (void)setDataQuotaLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dataQuotaLabel, a3);
}

- (UILabel)dataUsedIndicatorLabel
{
  return self->_dataUsedIndicatorLabel;
}

- (void)setDataUsedIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dataUsedIndicatorLabel, a3);
}

- (UILabel)dataUsedLabel
{
  return self->_dataUsedLabel;
}

- (void)setDataUsedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dataUsedLabel, a3);
}

- (UILabel)hasDataToSyncIndicatorLabel
{
  return self->_hasDataToSyncIndicatorLabel;
}

- (void)setHasDataToSyncIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_hasDataToSyncIndicatorLabel, a3);
}

- (UILabel)hasDataToSyncLabel
{
  return self->_hasDataToSyncLabel;
}

- (void)setHasDataToSyncLabel:(id)a3
{
  objc_storeStrong((id *)&self->_hasDataToSyncLabel, a3);
}

- (UILabel)hasManagedCredentialIndicatorLabel
{
  return self->_hasManagedCredentialIndicatorLabel;
}

- (void)setHasManagedCredentialIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_hasManagedCredentialIndicatorLabel, a3);
}

- (UILabel)hasManagedCredentialLabel
{
  return self->_hasManagedCredentialLabel;
}

- (void)setHasManagedCredentialLabel:(id)a3
{
  objc_storeStrong((id *)&self->_hasManagedCredentialLabel, a3);
}

- (UIStackView)fullNameStackView
{
  return self->_fullNameStackView;
}

- (void)setFullNameStackView:(id)a3
{
  objc_storeStrong((id *)&self->_fullNameStackView, a3);
}

- (UIStackView)givenNameStackView
{
  return self->_givenNameStackView;
}

- (void)setGivenNameStackView:(id)a3
{
  objc_storeStrong((id *)&self->_givenNameStackView, a3);
}

- (UIStackView)familyNameStackView
{
  return self->_familyNameStackView;
}

- (void)setFamilyNameStackView:(id)a3
{
  objc_storeStrong((id *)&self->_familyNameStackView, a3);
}

- (UIStackView)imageURLStackView
{
  return self->_imageURLStackView;
}

- (void)setImageURLStackView:(id)a3
{
  objc_storeStrong((id *)&self->_imageURLStackView, a3);
}

- (UIStackView)appleIDStackView
{
  return self->_appleIDStackView;
}

- (void)setAppleIDStackView:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDStackView, a3);
}

- (UIStackView)containerStackView
{
  return self->_containerStackView;
}

- (void)setContainerStackView:(id)a3
{
  objc_storeStrong((id *)&self->_containerStackView, a3);
}

- (UIStackView)containerAndButtonStackView
{
  return self->_containerAndButtonStackView;
}

- (void)setContainerAndButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_containerAndButtonStackView, a3);
}

- (UIStackView)lastLoginDateStackView
{
  return self->_lastLoginDateStackView;
}

- (void)setLastLoginDateStackView:(id)a3
{
  objc_storeStrong((id *)&self->_lastLoginDateStackView, a3);
}

- (UIStackView)lastRemoteAuthDateStackView
{
  return self->_lastRemoteAuthDateStackView;
}

- (void)setLastRemoteAuthDateStackView:(id)a3
{
  objc_storeStrong((id *)&self->_lastRemoteAuthDateStackView, a3);
}

- (UIStackView)passcodeTypeStackView
{
  return self->_passcodeTypeStackView;
}

- (void)setPasscodeTypeStackView:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeTypeStackView, a3);
}

- (UIStackView)isAccountDisabledStackView
{
  return self->_isAccountDisabledStackView;
}

- (void)setIsAccountDisabledStackView:(id)a3
{
  objc_storeStrong((id *)&self->_isAccountDisabledStackView, a3);
}

- (UIStackView)dataQuotaStackView
{
  return self->_dataQuotaStackView;
}

- (void)setDataQuotaStackView:(id)a3
{
  objc_storeStrong((id *)&self->_dataQuotaStackView, a3);
}

- (UIStackView)dataUsedStackView
{
  return self->_dataUsedStackView;
}

- (void)setDataUsedStackView:(id)a3
{
  objc_storeStrong((id *)&self->_dataUsedStackView, a3);
}

- (UIStackView)hasDataToSyncStackView
{
  return self->_hasDataToSyncStackView;
}

- (void)setHasDataToSyncStackView:(id)a3
{
  objc_storeStrong((id *)&self->_hasDataToSyncStackView, a3);
}

- (UIStackView)hasManagedCredentialStackView
{
  return self->_hasManagedCredentialStackView;
}

- (void)setHasManagedCredentialStackView:(id)a3
{
  objc_storeStrong((id *)&self->_hasManagedCredentialStackView, a3);
}

- (UIButton)okButton
{
  return self->_okButton;
}

- (void)setOkButton:(id)a3
{
  objc_storeStrong((id *)&self->_okButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_hasManagedCredentialStackView, 0);
  objc_storeStrong((id *)&self->_hasDataToSyncStackView, 0);
  objc_storeStrong((id *)&self->_dataUsedStackView, 0);
  objc_storeStrong((id *)&self->_dataQuotaStackView, 0);
  objc_storeStrong((id *)&self->_isAccountDisabledStackView, 0);
  objc_storeStrong((id *)&self->_passcodeTypeStackView, 0);
  objc_storeStrong((id *)&self->_lastRemoteAuthDateStackView, 0);
  objc_storeStrong((id *)&self->_lastLoginDateStackView, 0);
  objc_storeStrong((id *)&self->_containerAndButtonStackView, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_appleIDStackView, 0);
  objc_storeStrong((id *)&self->_imageURLStackView, 0);
  objc_storeStrong((id *)&self->_familyNameStackView, 0);
  objc_storeStrong((id *)&self->_givenNameStackView, 0);
  objc_storeStrong((id *)&self->_fullNameStackView, 0);
  objc_storeStrong((id *)&self->_hasManagedCredentialLabel, 0);
  objc_storeStrong((id *)&self->_hasManagedCredentialIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_hasDataToSyncLabel, 0);
  objc_storeStrong((id *)&self->_hasDataToSyncIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_dataUsedLabel, 0);
  objc_storeStrong((id *)&self->_dataUsedIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_dataQuotaLabel, 0);
  objc_storeStrong((id *)&self->_dataQuotaIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_isAccountDisabledLabel, 0);
  objc_storeStrong((id *)&self->_isAccountDisabledIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_passcodeTypeLabel, 0);
  objc_storeStrong((id *)&self->_passcodeTypeIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_lastRemoteAuthDateLabel, 0);
  objc_storeStrong((id *)&self->_lastRemoteAuthDateIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_lastLoginDateLabel, 0);
  objc_storeStrong((id *)&self->_lastLoginDateIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_appleIDLabel, 0);
  objc_storeStrong((id *)&self->_appleIDIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_imageURLLabel, 0);
  objc_storeStrong((id *)&self->_imageURLIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_familyNameLabel, 0);
  objc_storeStrong((id *)&self->_familyNameIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_givenNameLabel, 0);
  objc_storeStrong((id *)&self->_givenNameIndicatorLabel, 0);
  objc_storeStrong((id *)&self->_fullNameLabel, 0);
  objc_storeStrong((id *)&self->_fullNameIndicatorLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_user, 0);
}

@end

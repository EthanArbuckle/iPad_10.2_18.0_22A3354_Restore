@implementation _HUUserAvatarHeaderView

- (_HUUserAvatarHeaderView)initWithUser:(id)a3 home:(id)a4 delegate:(id)a5
{
  _HUUserAvatarHeaderView *v8;
  _HUUserAvatarHeaderView *v9;
  HUContactView *v10;
  HUContactView *contactView;
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
  uint64_t v25;
  NAFuture *mediaAccountFuture;
  NAFuture *v27;
  id v28;
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
  id obj;
  id v57;
  id v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id location;
  objc_super v65;
  _QWORD v66[6];

  v66[4] = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v58 = a4;
  obj = a5;
  v65.receiver = self;
  v65.super_class = (Class)_HUUserAvatarHeaderView;
  v8 = -[_HUUserAvatarHeaderView initWithReuseIdentifier:](&v65, sel_initWithReuseIdentifier_, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mediaAccountDelegate, obj);
    v10 = objc_alloc_init(HUContactView);
    contactView = v9->_contactView;
    v9->_contactView = v10;

    -[HUContactView setContactNameFontTextStyle:](v9->_contactView, "setContactNameFontTextStyle:", *MEMORY[0x1E0CEB580]);
    objc_msgSend(v58, "hf_handleForUser:", v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(MEMORY[0x1E0D31320], "defaultStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HUUserAvatarHeaderView _keyDescriptors](v9, "_keyDescriptors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contactForUserHandle:withKeys:", v59, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUContactView setContact:](v9->_contactView, "setContact:", v14);

    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(v57, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contactWithDisplayName:emailOrPhoneNumber:", v16, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUContactView setContact:](v9->_contactView, "setContact:", v12);
    }

    if (!objc_msgSend(v59, "type"))
    {
      v17 = (void *)objc_opt_new();
      objc_msgSend(v59, "userID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v59, "userID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v19);

      }
      -[HUContactView setAccounts:](v9->_contactView, "setAccounts:", v17);
      objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "uniqueIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mediaAccountForHomeIdentifier:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v17, "addObject:", v23);
        -[HUContactView setAccounts:](v9->_contactView, "setAccounts:", v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "executeHomeMediaAccountFetchForHome:", v58);
        v25 = objc_claimAutoreleasedReturnValue();
        mediaAccountFuture = v9->_mediaAccountFuture;
        v9->_mediaAccountFuture = (NAFuture *)v25;

        objc_initWeak(&location, v9);
        v27 = v9->_mediaAccountFuture;
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __54___HUUserAvatarHeaderView_initWithUser_home_delegate___block_invoke;
        v60[3] = &unk_1E6F56338;
        objc_copyWeak(&v63, &location);
        v61 = v58;
        v62 = v17;
        v28 = (id)-[NAFuture addCompletionBlock:](v27, "addCompletionBlock:", v60);

        objc_destroyWeak(&v63);
        objc_destroyWeak(&location);
      }

    }
    -[_HUUserAvatarHeaderView contentView](v9, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "naui_addAutoLayoutSubview:", v9->_contactView);

    -[_HUUserAvatarHeaderView contentView](v9, "contentView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView contactView](v9, "contactView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, -20.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v51;
    -[_HUUserAvatarHeaderView contentView](v9, "contentView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "layoutMarginsGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView contactView](v9, "contactView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v45;
    -[_HUUserAvatarHeaderView contentView](v9, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layoutMarginsGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView contactView](v9, "contactView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v32;
    -[_HUUserAvatarHeaderView contentView](v9, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView contactView](v9, "contactView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, 20.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView setLayoutConstraints:](v9, "setLayoutConstraints:", v38);

    v39 = (void *)MEMORY[0x1E0CB3718];
    -[_HUUserAvatarHeaderView layoutConstraints](v9, "layoutConstraints");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v40);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_HUUserAvatarHeaderView mediaAccountFuture](self, "mediaAccountFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)_HUUserAvatarHeaderView;
  -[_HUUserAvatarHeaderView dealloc](&v4, sel_dealloc);
}

- (void)presentMultiUserTokenFixUIForMediaAccount:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HUMultiUserTokenFixTableView *v12;
  void *v13;
  HUMultiUserTokenFixTableView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
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
  _QWORD v93[8];
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  id v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  id v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v95 = v10;
    v96 = 2112;
    v97 = v7;
    v98 = 2112;
    v99 = v11;
    v100 = 2112;
    v101 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@ MutilUser Token Fix needed for account [%@], user [%@], in Home [%@]", buf, 0x2Au);

  }
  v12 = [HUMultiUserTokenFixTableView alloc];
  -[_HUUserAvatarHeaderView mediaAccountDelegate](self, "mediaAccountDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HUMultiUserTokenFixTableView initWithFrame:mediaAccount:home:delegate:](v12, "initWithFrame:mediaAccount:home:delegate:", v7, v8, v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_HUUserAvatarHeaderView setMultiUserTokenFixHeaderView:](self, "setMultiUserTokenFixHeaderView:", v14);

  -[_HUUserAvatarHeaderView contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "naui_addAutoLayoutSubview:", v16);

  v17 = (void *)MEMORY[0x1E0CB3718];
  -[_HUUserAvatarHeaderView layoutConstraints](self, "layoutConstraints");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deactivateConstraints:", v18);

  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HUUserAvatarHeaderView contentView](self, "contentView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v88;
  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "trailingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HUUserAvatarHeaderView contentView](self, "contentView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v84);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v82;
  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HUUserAvatarHeaderView contentView](self, "contentView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, -20.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = v76;
  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "heightAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "bounds");
  objc_msgSend(v73, "tableViewHeightForWidth:", v19);
  objc_msgSend(v72, "constraintEqualToConstant:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = v71;
  -[_HUUserAvatarHeaderView contactView](self, "contactView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v93[4] = v66;
  -[_HUUserAvatarHeaderView contactView](self, "contactView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v93[5] = v61;
  -[_HUUserAvatarHeaderView contactView](self, "contactView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v21, 20.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v93[6] = v22;
  -[_HUUserAvatarHeaderView contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HUUserAvatarHeaderView contactView](self, "contactView");
  v83 = v7;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v81 = v8;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 20.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v93[7] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HUUserAvatarHeaderView setLayoutConstraints:](self, "setLayoutConstraints:", v28);

  v29 = (void *)MEMORY[0x1E0CB3718];
  -[_HUUserAvatarHeaderView layoutConstraints](self, "layoutConstraints");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v30);

  -[_HUUserAvatarHeaderView contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  objc_msgSend(v40, "tableViewHeightForWidth:", v42);
  v44 = v39 + v43 + -20.0;

  -[_HUUserAvatarHeaderView contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v33, v35, v37, v44);

  -[_HUUserAvatarHeaderView frame](self, "frame");
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bounds");
  objc_msgSend(v54, "tableViewHeightForWidth:", v56);
  v58 = v53 + v57 + -20.0;

  -[_HUUserAvatarHeaderView setFrame:](self, "setFrame:", v47, v49, v51, v58);
}

- (void)dismissMultiUserTokenFixUI
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alpha");
    v7 = v6;

    if (v7 == 1.0)
    {
      -[_HUUserAvatarHeaderView contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;

      -[_HUUserAvatarHeaderView contentView](self, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      v17 = v16;
      -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "tableViewHeightForWidth:", v14);
      v20 = v17 - v19 + 20.0;

      -[_HUUserAvatarHeaderView contentView](self, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFrame:", v10, v12, v14, v20);

      -[_HUUserAvatarHeaderView frame](self, "frame");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      -[_HUUserAvatarHeaderView frame](self, "frame");
      v29 = v28;
      -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "tableViewHeightForWidth:", v27);
      v32 = v29 - v31 + 20.0;

      -[_HUUserAvatarHeaderView setFrame:](self, "setFrame:", v23, v25, v27, v32);
      -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "heightAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToConstant:", 20.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setActive:", 1);

      -[_HUUserAvatarHeaderView multiUserTokenFixHeaderView](self, "multiUserTokenFixHeaderView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAlpha:", 0.0);

      -[_HUUserAvatarHeaderView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)setAccounts:(id)a3 forHome:(id)a4
{
  id v7;
  HUContactView *contactView;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  HUSplitAccountHeaderTableView *v31;
  void *v32;
  HUSplitAccountHeaderTableView *v33;
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
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
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
  _QWORD v107[7];
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  _BYTE v111[10];
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  id v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  contactView = self->_contactView;
  v9 = a3;
  -[HUContactView setAccounts:](contactView, "setAccounts:", v9);
  -[_HUUserAvatarHeaderView accountStore](self, "accountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_activeiTunesAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_130);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v109 = v14;
    v110 = 1024;
    *(_DWORD *)v111 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
    *(_WORD *)&v111[4] = 1024;
    *(_DWORD *)&v111[6] = objc_msgSend(v7, "isMultiUserEnabled");
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@ isThisMac = %d, is MU Enabled = [%d] ", buf, 0x18u);

  }
  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aa_altDSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aa_altDSID");
    v18 = a2;
    v19 = v11;
    v20 = v7;
    v21 = v12;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v109 = v16;
    v110 = 2112;
    *(_QWORD *)v111 = v19;
    *(_WORD *)&v111[8] = 2112;
    v112 = v17;
    v113 = 2112;
    v114 = v21;
    v115 = 2112;
    v116 = v22;
    v117 = 2112;
    v118 = v20;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@ Active Media Account - [%@] with DSID - [%@] on this iOS device.  Fetched ams_iTunesAccount - [%@] with DSID - [%@] for Home [%@]", buf, 0x3Eu);

    v12 = v21;
    v7 = v20;
    v11 = v19;
    a2 = v18;

  }
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0
    && objc_msgSend(v7, "isMultiUserEnabled")
    && v11
    && (objc_msgSend(v11, "aa_altDSID"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "aa_altDSID"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v23, "isEqualToString:", v24),
        v24,
        v23,
        (v25 & 1) == 0))
  {
    v105 = v12;
    v106 = v10;
    HFLogForCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v109 = v30;
      _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, "%@ Found Accounts are Split. Displaying the Split account UI", buf, 0xCu);

    }
    v31 = [HUSplitAccountHeaderTableView alloc];
    -[_HUUserAvatarHeaderView mediaAccountDelegate](self, "mediaAccountDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[HUSplitAccountHeaderTableView initWithFrame:mediaAccount:home:delegate:](v31, "initWithFrame:mediaAccount:home:delegate:", v11, v7, v32, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[_HUUserAvatarHeaderView setSplitAccountHeaderView:](self, "setSplitAccountHeaderView:", v33);

    -[_HUUserAvatarHeaderView contentView](self, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "naui_addAutoLayoutSubview:", v35);

    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAlpha:", 0.0);

    v37 = (void *)MEMORY[0x1E0CB3718];
    -[_HUUserAvatarHeaderView layoutConstraints](self, "layoutConstraints");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "deactivateConstraints:", v38);

    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "leadingAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView contentView](self, "contentView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "leadingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:", v101);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v100;
    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView contentView](self, "contentView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "trailingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v96);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v107[1] = v95;
    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "topAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView contentView](self, "contentView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "topAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:constant:", v91, -20.0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v107[2] = v90;
    -[_HUUserAvatarHeaderView contactView](self, "contactView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "leadingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "leadingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v86);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v107[3] = v85;
    -[_HUUserAvatarHeaderView contactView](self, "contactView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "trailingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v81);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v107[4] = v80;
    -[_HUUserAvatarHeaderView contactView](self, "contactView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, 20.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v107[5] = v39;
    -[_HUUserAvatarHeaderView contentView](self, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView contactView](self, "contactView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43, 20.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v107[6] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 7);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView setLayoutConstraints:](self, "setLayoutConstraints:", v45);

    v46 = (void *)MEMORY[0x1E0CB3718];
    -[_HUUserAvatarHeaderView layoutConstraints](self, "layoutConstraints");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "activateConstraints:", v47);

    -[_HUUserAvatarHeaderView contentView](self, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "frame");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;

    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bounds");
    objc_msgSend(v57, "tableViewHeightForWidth:", v59);
    v61 = v56 + v60 + -20.0;

    -[_HUUserAvatarHeaderView contentView](self, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setFrame:", v50, v52, v54, v61);

    -[_HUUserAvatarHeaderView frame](self, "frame");
    v64 = v63;
    v66 = v65;
    v68 = v67;
    v70 = v69;
    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bounds");
    objc_msgSend(v71, "tableViewHeightForWidth:", v73);
    v75 = v70 + v74 + -20.0;

    -[_HUUserAvatarHeaderView setFrame:](self, "setFrame:", v64, v66, v68, v75);
    v12 = v105;
    v10 = v106;
  }
  else
  {
    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      HFLogForCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v109 = v28;
        _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@ Dismissing Split Account View", buf, 0xCu);

      }
      -[_HUUserAvatarHeaderView dismissSplitAccountView](self, "dismissSplitAccountView");
    }
  }
  -[_HUUserAvatarHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)showSplitAccountViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heightAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v6, "tableViewHeightForWidth:", v8);
    objc_msgSend(v5, "constraintEqualToConstant:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 1.0);

    -[_HUUserAvatarHeaderView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)dismissSplitAccountView
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alpha");
    v7 = v6;

    if (v7 == 1.0)
    {
      -[_HUUserAvatarHeaderView contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;

      -[_HUUserAvatarHeaderView contentView](self, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      v17 = v16;
      -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "tableViewHeightForWidth:", v14);
      v20 = v17 - v19 + 20.0;

      -[_HUUserAvatarHeaderView contentView](self, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFrame:", v10, v12, v14, v20);

      -[_HUUserAvatarHeaderView frame](self, "frame");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      -[_HUUserAvatarHeaderView frame](self, "frame");
      v29 = v28;
      -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "tableViewHeightForWidth:", v27);
      v32 = v29 - v31 + 20.0;

      -[_HUUserAvatarHeaderView setFrame:](self, "setFrame:", v23, v25, v27, v32);
      -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "heightAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToConstant:", 20.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setActive:", 1);

      -[_HUUserAvatarHeaderView splitAccountHeaderView](self, "splitAccountHeaderView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAlpha:", 0.0);

      -[_HUUserAvatarHeaderView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (ACAccountStore)accountStore
{
  ACAccountStore *accountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v4 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (NSAttributedString)message
{
  void *v2;
  void *v3;

  -[_HUUserAvatarHeaderView contactView](self, "contactView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_HUUserAvatarHeaderView contactView](self, "contactView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v4);

}

- (id)_keyDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97468], "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HUContactView)contactView
{
  return self->_contactView;
}

- (HUSplitAccountHeaderTableView)splitAccountHeaderView
{
  return self->_splitAccountHeaderView;
}

- (void)setSplitAccountHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_splitAccountHeaderView, a3);
}

- (HUMultiUserTokenFixTableView)multiUserTokenFixHeaderView
{
  return self->_multiUserTokenFixHeaderView;
}

- (void)setMultiUserTokenFixHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_multiUserTokenFixHeaderView, a3);
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (HUMediaAccountDelegate)mediaAccountDelegate
{
  return (HUMediaAccountDelegate *)objc_loadWeakRetained((id *)&self->_mediaAccountDelegate);
}

- (void)setMediaAccountDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mediaAccountDelegate, a3);
}

- (NAFuture)mediaAccountFuture
{
  return self->_mediaAccountFuture;
}

- (void)setMediaAccountFuture:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAccountFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAccountFuture, 0);
  objc_destroyWeak((id *)&self->_mediaAccountDelegate);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_multiUserTokenFixHeaderView, 0);
  objc_storeStrong((id *)&self->_splitAccountHeaderView, 0);
  objc_storeStrong((id *)&self->_contactView, 0);
}

@end

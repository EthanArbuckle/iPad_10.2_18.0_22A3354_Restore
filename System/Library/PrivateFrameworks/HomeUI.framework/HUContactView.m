@implementation HUContactView

- (HUContactView)initWithFrame:(CGRect)a3
{
  HUContactView *v3;
  HUContactView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUContactView;
  v3 = -[HUContactView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_avatarDiameter = 85.0;
    v3->_contactNameFormatStyle = 0;
    -[HUContactView _setupViews](v3, "_setupViews");
  }
  return v4;
}

- (void)setAvatarDiameter:(double)a3
{
  if (self->_avatarDiameter != a3)
  {
    self->_avatarDiameter = a3;
    -[HUContactView _updateConstraints](self, "_updateConstraints");
  }
}

- (void)setContact:(id)a3
{
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = -[CNContact isEqual:](self->_contact, "isEqual:", v12);
  v6 = v12;
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    if (self->_contact)
    {
      -[HUContactView avatarView](self, "avatarView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContact:", v12);

      v8 = (void *)MEMORY[0x1E0C97218];
      -[HUContactView contact](self, "contact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromContact:style:", v9, -[HUContactView contactNameFormatStyle](self, "contactNameFormatStyle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUContactView nameLabel](self, "nameLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v10);

    }
    -[HUContactView _updateConstraints](self, "_updateConstraints");
    v6 = v12;
  }

}

- (NSAttributedString)message
{
  void *v2;
  void *v3;

  -[HUContactView messageLabel](self, "messageLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[HUContactView messageLabel](self, "messageLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CEA700]);
      -[HUContactView setMessageLabel:](self, "setMessageLabel:", v5);

      -[HUContactView messageLabel](self, "messageLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[HUContactView messageLabel](self, "messageLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUContactView addSubview:](self, "addSubview:", v7);

    }
    v8 = -[HUContactView numberOfLinesForMessage](self, "numberOfLinesForMessage");
    -[HUContactView messageLabel](self, "messageLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", v8);

    -[HUContactView messageLabel](self, "messageLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributedText:", v12);

    -[HUContactView messageLabel](self, "messageLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeToFit");

    -[HUContactView _updateConstraints](self, "_updateConstraints");
  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");

    -[HUContactView setMessageLabel:](self, "setMessageLabel:", 0);
  }

}

- (void)setAccounts:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
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
  id obj;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (!v3)
  {
    v54 = 0;
    v5 = 0;
    goto LABEL_20;
  }
  v4 = v3;
  v54 = 0;
  v5 = 0;
  v6 = *(_QWORD *)v56;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v56 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
      objc_opt_class();
      v9 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      objc_opt_class();
      v12 = v9;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      if (v11)
      {
        v15 = v54;
        v54 = v12;
        v16 = v5;
      }
      else
      {
        v15 = v5;
        v16 = v12;
        if (!v14)
          goto LABEL_16;
      }
      v17 = v12;

      v5 = v16;
LABEL_16:

    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  }
  while (v4);
LABEL_20:
  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v54;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v60 = v20;
    v61 = 2112;
    v62 = v54;
    v63 = 2112;
    v64 = v5;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@ appleMusicAccount = [%@], appleIDAccount = [%@] ", buf, 0x20u);

  }
  if (v5)
  {
    if (v54)
      goto LABEL_24;
LABEL_27:
    -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeFromSuperview");

    -[HUContactView setAppleMusicAccountLabel:](self, "setAppleMusicAccountLabel:", 0);
    if (v5)
      goto LABEL_28;
  }
  else
  {
    -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeFromSuperview");

    -[HUContactView setAppleIDAccountLabel:](self, "setAppleIDAccountLabel:", 0);
    if (!v54)
      goto LABEL_27;
LABEL_24:
    if (v5)
    {
LABEL_28:
      -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v24 = objc_alloc_init(MEMORY[0x1E0CEA700]);
        -[HUContactView setAppleIDAccountLabel:](self, "setAppleIDAccountLabel:", v24);

        -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUContactView addSubview:](self, "addSubview:", v26);

      }
    }
  }
  if (v54)
  {
    objc_msgSend(v54, "username");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "isEqualToString:", v5) & 1) != 0)
      goto LABEL_34;
    -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      v29 = objc_alloc_init(MEMORY[0x1E0CEA700]);
      -[HUContactView setAppleMusicAccountLabel:](self, "setAppleMusicAccountLabel:", v29);

      -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUContactView addSubview:](self, "addSubview:", v27);
LABEL_34:

    }
  }
  if (!-[HUContactView _isPhoneNumberOnlyAccount](self, "_isPhoneNumberOnlyAccount"))
  {
    HFLogForCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v60 = v32;
      _os_log_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEFAULT, "%@ NOT a Phone Number ONLY Account, We will display iCloud and iTunes Accounts", buf, 0xCu);

    }
    v33 = *MEMORY[0x1E0CEB558];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFont:", v34);

    -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)MEMORY[0x1E0CB3940];
      _HULocalizedStringWithDefaultValue(CFSTR("HUUseriCloudAccount_Title"), CFSTR("HUUseriCloudAccount_Title"), 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: %@"), v35, v5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = v5;
    }
    -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", v38);

    if (v36)
    {

    }
    objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTextColor:", v40);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v33);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFont:", v42);

    v44 = (void *)MEMORY[0x1E0CB3940];
    _HULocalizedStringWithDefaultValue(CFSTR("HUUserAppleMusicAccount_Title"), CFSTR("HUUserAppleMusicAccount_Title"), 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v54;
    objc_msgSend(v54, "username");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", CFSTR(" %@: %@"), v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setText:", v47);

    objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setTextColor:", v49);

  }
  -[HUContactView _updateConstraints](self, "_updateConstraints");

}

- (void)setNumberOfLinesForMessage:(unint64_t)a3
{
  id v4;

  -[HUContactView messageLabel](self, "messageLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", a3);

}

- (void)setContactNameFontTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->_contactNameFontTextStyle, a3);
  -[HUContactView _updateNameLabelFont](self, "_updateNameLabelFont");
}

- (void)_setupViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C97468]);
  -[HUContactView setAvatarView:](self, "setAvatarView:", v3);

  -[HUContactView avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  -[HUContactView avatarView](self, "avatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUContactView avatarView](self, "avatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView addSubview:](self, "addSubview:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUContactView setNameLabel:](self, "setNameLabel:", v7);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView nameLabel](self, "nameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[HUContactView nameLabel](self, "nameLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUContactView nameLabel](self, "nameLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 2);

  -[HUContactView nameLabel](self, "nameLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextAlignment:", 1);

  -[HUContactView nameLabel](self, "nameLabel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[HUContactView addSubview:](self, "addSubview:", v13);

}

- (void)_updateNameLabelFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CEA5E8];
  -[HUContactView contactNameFontTextStyle](self, "contactNameFontTextStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView nameLabel](self, "nameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[HUContactView nameLabel](self, "nameLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)_updateConstraints
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
  double v39;
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
  uint64_t v112;
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
  uint64_t v139;
  void *v140;
  void *v141;
  id v142;

  -[HUContactView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUContactView constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[HUContactView constraints](self, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");
  }
  else
  {
    v6 = (void *)objc_opt_new();
    -[HUContactView setConstraints:](self, "setConstraints:", v6);
  }

  -[HUContactView constraints](self, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView avatarView](self, "avatarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView topAnchor](self, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

  -[HUContactView constraints](self, "constraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView avatarView](self, "avatarView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView centerXAnchor](self, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v16);

  -[HUContactView constraints](self, "constraints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView avatarView](self, "avatarView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView leadingAnchor](self, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v21);

  -[HUContactView constraints](self, "constraints");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView avatarView](self, "avatarView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView trailingAnchor](self, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v26);

  -[HUContactView constraints](self, "constraints");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView avatarView](self, "avatarView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView avatarDiameter](self, "avatarDiameter");
  objc_msgSend(v29, "constraintEqualToConstant:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v30);

  -[HUContactView constraints](self, "constraints");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView avatarView](self, "avatarView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView avatarDiameter](self, "avatarDiameter");
  objc_msgSend(v33, "constraintEqualToConstant:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v34);

  -[HUContactView nameLabel](self, "nameLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "firstBaselineAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView avatarView](self, "avatarView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, 20.0);
  v142 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v39) = 1144750080;
  objc_msgSend(v142, "setPriority:", v39);
  -[HUContactView constraints](self, "constraints");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObject:", v142);

  -[HUContactView constraints](self, "constraints");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView nameLabel](self, "nameLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView avatarView](self, "avatarView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObject:", v46);

  -[HUContactView constraints](self, "constraints");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView nameLabel](self, "nameLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerXAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView centerXAnchor](self, "centerXAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObject:", v51);

  -[HUContactView constraints](self, "constraints");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView nameLabel](self, "nameLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView leadingAnchor](self, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintGreaterThanOrEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:", v56);

  -[HUContactView constraints](self, "constraints");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView nameLabel](self, "nameLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView trailingAnchor](self, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObject:", v61);

  -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[HUContactView constraints](self, "constraints");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "firstBaselineAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView nameLabel](self, "nameLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "lastBaselineAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v67, 25.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addObject:", v68);

    -[HUContactView constraints](self, "constraints");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "centerXAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView centerXAnchor](self, "centerXAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObject:", v73);

    -[HUContactView constraints](self, "constraints");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView leadingAnchor](self, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintGreaterThanOrEqualToAnchor:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addObject:", v78);

    -[HUContactView constraints](self, "constraints");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView trailingAnchor](self, "trailingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintLessThanOrEqualToAnchor:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v83);

  }
  -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "lastBaselineAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v86)
    {
      -[HUContactView nameLabel](self, "nameLabel");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "lastBaselineAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[HUContactView constraints](self, "constraints");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "firstBaselineAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v86, 25.0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "addObject:", v91);

    -[HUContactView constraints](self, "constraints");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "centerXAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView centerXAnchor](self, "centerXAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:", v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addObject:", v96);

    -[HUContactView constraints](self, "constraints");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "trailingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUContactView trailingAnchor](self, "trailingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintLessThanOrEqualToAnchor:", v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "addObject:", v101);

  }
  -[HUContactView messageLabel](self, "messageLabel");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUContactView nameLabel](self, "nameLabel");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "lastBaselineAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v105;
  if (!v102)
  {

    if (v106)
    {
      -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
      v137 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v137)
      {
LABEL_23:
        -[HUContactView constraints](self, "constraints");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUContactView bottomAnchor](self, "bottomAnchor");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "constraintEqualToAnchor:", v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "addObject:", v134);
        goto LABEL_24;
      }
      -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v138 = v109;
    objc_msgSend(v109, "lastBaselineAnchor");
    v139 = objc_claimAutoreleasedReturnValue();

    v104 = (void *)v139;
    goto LABEL_23;
  }
  if (v105)
  {
    -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    if (v107)
    {
      -[HUContactView appleMusicAccountLabel](self, "appleMusicAccountLabel");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v111 = v108;
      objc_msgSend(v108, "lastBaselineAnchor");
      v112 = objc_claimAutoreleasedReturnValue();

      v104 = (void *)v112;
      goto LABEL_19;
    }
  }
  -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (v110)
  {
    -[HUContactView appleIDAccountLabel](self, "appleIDAccountLabel");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_19:
  -[HUContactView constraints](self, "constraints");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView messageLabel](self, "messageLabel");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "firstBaselineAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "constraintEqualToAnchor:constant:", v104, 25.0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "addObject:", v116);

  -[HUContactView constraints](self, "constraints");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView messageLabel](self, "messageLabel");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "centerXAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView centerXAnchor](self, "centerXAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:", v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "addObject:", v121);

  -[HUContactView constraints](self, "constraints");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView messageLabel](self, "messageLabel");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "leadingAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView leadingAnchor](self, "leadingAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "constraintGreaterThanOrEqualToAnchor:", v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "addObject:", v126);

  -[HUContactView constraints](self, "constraints");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView messageLabel](self, "messageLabel");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "trailingAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView trailingAnchor](self, "trailingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "constraintLessThanOrEqualToAnchor:", v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "addObject:", v131);

  -[HUContactView constraints](self, "constraints");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView messageLabel](self, "messageLabel");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "lastBaselineAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactView bottomAnchor](self, "bottomAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "constraintEqualToAnchor:", v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObject:", v136);

LABEL_24:
  v140 = (void *)MEMORY[0x1E0CB3718];
  -[HUContactView constraints](self, "constraints");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "activateConstraints:", v141);

}

- (BOOL)_isPhoneNumberOnlyAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97218];
  -[HUContactView contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromContact:style:", v4, -[HUContactView contactNameFormatStyle](self, "contactNameFormatStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C967C0];
  v14[0] = v8;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C97298]);
  objc_msgSend(v11, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v12, "hmf_isEmpty");

  return v8 ^ 1;
}

- (double)avatarDiameter
{
  return self->_avatarDiameter;
}

- (CNContact)contact
{
  return self->_contact;
}

- (int64_t)contactNameFormatStyle
{
  return self->_contactNameFormatStyle;
}

- (void)setContactNameFormatStyle:(int64_t)a3
{
  self->_contactNameFormatStyle = a3;
}

- (unint64_t)numberOfLinesForMessage
{
  return self->_numberOfLinesForMessage;
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (NSString)contactNameFontTextStyle
{
  return self->_contactNameFontTextStyle;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (UILabel)appleIDAccountLabel
{
  return self->_appleIDAccountLabel;
}

- (void)setAppleIDAccountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDAccountLabel, a3);
}

- (UILabel)appleMusicAccountLabel
{
  return self->_appleMusicAccountLabel;
}

- (void)setAppleMusicAccountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_appleMusicAccountLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicAccountLabel, 0);
  objc_storeStrong((id *)&self->_appleIDAccountLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_contactNameFontTextStyle, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end

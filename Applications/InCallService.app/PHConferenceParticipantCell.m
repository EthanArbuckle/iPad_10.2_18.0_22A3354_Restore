@implementation PHConferenceParticipantCell

- (PHConferenceParticipantCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PHConferenceParticipantCell *v4;
  uint64_t v5;
  UIButton *endCallButton;
  uint64_t v7;
  UIButton *privateButton;
  UILabel *v9;
  UILabel *nameLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIButton *v15;
  void *v16;
  id v17;
  void *v18;
  UIButton *v19;
  void *v20;
  id v21;
  void *v22;
  UIButton *v23;
  void *v24;
  id v25;
  void *v26;
  UIButton *v27;
  void *v28;
  id v29;
  void *v30;
  UILabel *v31;
  void *v32;
  UIButton *v33;
  void *v34;
  UIButton *v35;
  void *v36;
  UILabel *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UILabel *v43;
  void *v44;
  UIButton *v45;
  void *v46;
  void *v47;
  UIButton *v48;
  void *v49;
  void *v50;
  UIButton *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
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
  uint64_t v73;
  NSArray *badgeViewHiddenLayoutConstraints;
  uint64_t v75;
  NSArray *badgeViewVisibleLayoutConstraints;
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
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
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
  double v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  uint64_t v118;
  void *i;
  void *v120;
  void *v122;
  void *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  objc_super v128;
  _BYTE v129[128];
  void *v130;
  void *v131;
  _QWORD v132[3];
  _QWORD v133[3];

  v128.receiver = self;
  v128.super_class = (Class)PHConferenceParticipantCell;
  v4 = -[PHConferenceParticipantCell initWithStyle:reuseIdentifier:](&v128, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    endCallButton = v4->_endCallButton;
    v4->_endCallButton = (UIButton *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    privateButton = v4->_privateButton;
    v4->_privateButton = (UIButton *)v7;

    v9 = (UILabel *)objc_alloc_init((Class)UILabel);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_privateButton, "titleLabel"));
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_privateButton, "titleLabel"));
    objc_msgSend(v12, "setBaselineAdjustment:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_endCallButton, "titleLabel"));
    objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_endCallButton, "titleLabel"));
    objc_msgSend(v14, "setBaselineAdjustment:", 1);

    v15 = v4->_endCallButton;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v17 = sub_100034D60(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[UIButton setBackgroundImage:forState:](v15, "setBackgroundImage:forState:", v18, 0);

    v19 = v4->_privateButton;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.200000003));
    v21 = sub_100034D60(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[UIButton setBackgroundImage:forState:](v19, "setBackgroundImage:forState:", v22, 0);

    v23 = v4->_privateButton;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.349999994));
    v25 = sub_100034D60(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    -[UIButton setBackgroundImage:forState:](v23, "setBackgroundImage:forState:", v26, 4);

    v27 = v4->_privateButton;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.100000001));
    v29 = sub_100034D60(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    -[UIButton setBackgroundImage:forState:](v27, "setBackgroundImage:forState:", v30, 2);

    v31 = v4->_nameLabel;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v31, "setBackgroundColor:", v32);

    v33 = v4->_endCallButton;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTitleColor:forState:](v33, "setTitleColor:forState:", v34, 0);

    v35 = v4->_privateButton;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTitleColor:forState:](v35, "setTitleColor:forState:", v36, 0);

    v37 = v4->_nameLabel;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v37, "setTextColor:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_endCallButton, "titleLabel"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    objc_msgSend(v39, "setFont:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_privateButton, "titleLabel"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    objc_msgSend(v41, "setFont:", v42);

    v43 = v4->_nameLabel;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
    -[UILabel setFont:](v43, "setFont:", v44);

    -[UILabel setMinimumScaleFactor:](v4->_nameLabel, "setMinimumScaleFactor:", 0.850000024);
    v45 = v4->_privateButton;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("PRIVATE"), &stru_10028DC20, CFSTR("InCallService")));
    -[UIButton setTitle:forState:](v45, "setTitle:forState:", v47, 0);

    v48 = v4->_endCallButton;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("END_CALL"), &stru_10028DC20, CFSTR("InCallService")));
    -[UIButton setTitle:forState:](v48, "setTitle:forState:", v50, 0);

    -[UILabel setTextAlignment:](v4->_nameLabel, "setTextAlignment:", 1);
    v51 = v4->_privateButton;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.25));
    -[UIButton setTitleColor:forState:](v51, "setTitleColor:forState:", v52, 2);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_endCallButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_privateButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v4->_endCallButton, "addTarget:action:forControlEvents:", v4, "buttonTapped:", 64);
    -[UIButton addTarget:action:forControlEvents:](v4->_privateButton, "addTarget:action:forControlEvents:", v4, "buttonTapped:", 64);
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v4->_endCallButton, "layer"));
    objc_msgSend(v53, "setCornerRadius:", 5.0);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v4->_privateButton, "layer"));
    objc_msgSend(v54, "setCornerRadius:", 5.0);

    -[UIButton setClipsToBounds:](v4->_endCallButton, "setClipsToBounds:", 1);
    -[UIButton setClipsToBounds:](v4->_privateButton, "setClipsToBounds:", 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell contentView](v4, "contentView"));
    objc_msgSend(v55, "addSubview:", v4->_endCallButton);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell contentView](v4, "contentView"));
    objc_msgSend(v56, "addSubview:", v4->_privateButton);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell contentView](v4, "contentView"));
    objc_msgSend(v57, "addSubview:", v4->_nameLabel);

    v132[0] = CFSTR("endCallButton");
    v133[0] = v4->_endCallButton;
    v132[1] = CFSTR("privateButton");
    v133[1] = v4->_privateButton;
    v132[2] = CFSTR("nameLabel");
    v133[2] = v4->_nameLabel;
    v58 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v133, v132, 3));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_nameLabel, "leadingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell leadingAnchor](v4, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, 16.0));

    objc_msgSend(v61, "setActive:", 1);
    v62 = objc_msgSend(objc_alloc((Class)TPBadgeView), "initWithTitle:theme:", &stru_10028DC20, 1);
    objc_msgSend(v62, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v62, "setHidden:", 1);
    -[PHConferenceParticipantCell addSubview:](v4, "addSubview:", v62);
    -[PHConferenceParticipantCell setBadgeView:](v4, "setBadgeView:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "centerYAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_nameLabel, "centerYAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v64));
    -[PHConferenceParticipantCell addConstraint:](v4, "addConstraint:", v65);

    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "leadingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell leadingAnchor](v4, "leadingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 16.0));
    -[PHConferenceParticipantCell addConstraint:](v4, "addConstraint:", v68);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_nameLabel, "leadingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell badgeView](v4, "badgeView"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", v71, 6.0));

    objc_msgSend(v72, "setActive:", 0);
    v122 = v61;
    v131 = v61;
    v73 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v131, 1));
    badgeViewHiddenLayoutConstraints = v4->_badgeViewHiddenLayoutConstraints;
    v4->_badgeViewHiddenLayoutConstraints = (NSArray *)v73;

    v130 = v72;
    v75 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v130, 1));
    badgeViewVisibleLayoutConstraints = v4->_badgeViewVisibleLayoutConstraints;
    v4->_badgeViewVisibleLayoutConstraints = (NSArray *)v75;

    -[PHConferenceParticipantCell addConstraints:](v4, "addConstraints:", v4->_badgeViewHiddenLayoutConstraints);
    -[PHConferenceParticipantCell addConstraints:](v4, "addConstraints:", v4->_badgeViewVisibleLayoutConstraints);
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell contentView](v4, "contentView"));
    v123 = (void *)v58;
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-16-[endCallButton]-8-[privateButton]-16-|"), 16, 0, v58));
    objc_msgSend(v77, "addConstraints:", v78);

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell contentView](v4, "contentView"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell endCallButton](v4, "endCallButton"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell privateButton](v4, "privateButton"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v80, 7, 0, v81, 7, 1.0, 0.0));
    objc_msgSend(v79, "addConstraint:", v82);

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell nameLabel](v4, "nameLabel"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "lastBaselineAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell contentView](v4, "contentView"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "topAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
    objc_msgSend(v87, "_scaledValueForValue:", 24.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v86, ceil(v88)));
    objc_msgSend(v89, "setActive:", 1);

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell endCallButton](v4, "endCallButton"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "topAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell nameLabel](v4, "nameLabel"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "lastBaselineAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
    objc_msgSend(v94, "_scaledValueForValue:", 15.0);
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:constant:", v93, ceil(v95)));
    objc_msgSend(v96, "setActive:", 1);

    v97 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell privateButton](v4, "privateButton"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "topAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell endCallButton](v4, "endCallButton"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "topAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v100));
    objc_msgSend(v101, "setActive:", 1);

    v102 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell endCallButton](v4, "endCallButton"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "heightAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToConstant:", 44.0));
    objc_msgSend(v104, "setActive:", 1);

    v105 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell privateButton](v4, "privateButton"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "heightAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToConstant:", 44.0));
    objc_msgSend(v107, "setActive:", 1);

    v108 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell contentView](v4, "contentView"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "bottomAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell endCallButton](v4, "endCallButton"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "bottomAnchor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
    objc_msgSend(v112, "_scaledValueForValue:", 12.0);
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:constant:", v111, ceil(v113)));
    objc_msgSend(v114, "setActive:", 1);

    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell subviews](v4, "subviews"));
    v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v124, v129, 16);
    if (v116)
    {
      v117 = v116;
      v118 = *(_QWORD *)v125;
      do
      {
        for (i = 0; i != v117; i = (char *)i + 1)
        {
          if (*(_QWORD *)v125 != v118)
            objc_enumerationMutation(v115);
          v120 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v120, "setDelaysContentTouches:") & 1) != 0)
            objc_msgSend(v120, "setDelaysContentTouches:", 0);
        }
        v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v124, v129, 16);
      }
      while (v117);
    }

  }
  return v4;
}

- (void)setLocalizedSenderIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "length");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell badgeView](self, "badgeView"));
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setHidden:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell badgeView](self, "badgeView"));
    objc_msgSend(v7, "setTitle:", v12);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell badgeViewVisibleLayoutConstraints](self, "badgeViewVisibleLayoutConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

    v9 = objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell badgeViewHiddenLayoutConstraints](self, "badgeViewHiddenLayoutConstraints"));
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell badgeViewHiddenLayoutConstraints](self, "badgeViewHiddenLayoutConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);

    v9 = objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell badgeViewVisibleLayoutConstraints](self, "badgeViewVisibleLayoutConstraints"));
  }
  v11 = (void *)v9;
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v9);

}

- (void)setRepresentedCall:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayFirstName"));
  if (!objc_msgSend(v4, "length"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));

    v4 = (void *)v5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell nameLabel](self, "nameLabel"));
  objc_msgSend(v6, "setText:", v4);

}

- (void)setRepresentedHandle:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell nameLabel](self, "nameLabel"));
  objc_msgSend(v4, "setText:", v5);

}

- (void)buttonTapped:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ConferenceParticipantsList: button was tapped in call cell %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell endCallButton](self, "endCallButton"));
  if (v7 == v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell delegate](self, "delegate"));
    objc_msgSend(v9, "conferenceParticipantCellRequestedEndCall:", self);
    goto LABEL_7;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell privateButton](self, "privateButton"));

  if (v8 == v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell delegate](self, "delegate"));
    objc_msgSend(v9, "conferenceParticipantCellRequestedTakeCallPrivate:", self);
LABEL_7:

  }
}

- (void)makeHeld
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell privateButton](self, "privateButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HOLD_LABEL"), &stru_10028DC20, CFSTR("CallStatus")));
  objc_msgSend(v3, "setTitle:forState:", v5, 0);

  -[PHConferenceParticipantCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
}

- (void)setPrivateButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell privateButton](self, "privateButton"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setPrivateButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell privateButton](self, "privateButton"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setEndButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantCell endCallButton](self, "endCallButton"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (PHConferenceParticipantCellProtocol)delegate
{
  return (PHConferenceParticipantCellProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (BOOL)privateButtonEnabled
{
  return self->_privateButtonEnabled;
}

- (BOOL)privateButtonHidden
{
  return self->_privateButtonHidden;
}

- (BOOL)endButtonHidden
{
  return self->_endButtonHidden;
}

- (NSString)localizedSenderIdentity
{
  return self->_localizedSenderIdentity;
}

- (UIButton)endCallButton
{
  return (UIButton *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEndCallButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (UIButton)privateButton
{
  return (UIButton *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPrivateButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (TPBadgeView)badgeView
{
  return (TPBadgeView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBadgeView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)badgeViewHiddenLayoutConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)badgeViewVisibleLayoutConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeViewVisibleLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_badgeViewHiddenLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_privateButton, 0);
  objc_storeStrong((id *)&self->_endCallButton, 0);
  objc_storeStrong((id *)&self->_localizedSenderIdentity, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

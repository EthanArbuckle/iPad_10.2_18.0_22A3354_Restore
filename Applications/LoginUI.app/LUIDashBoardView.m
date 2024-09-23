@implementation LUIDashBoardView

- (LUIDashBoardView)initWithFrame:(CGRect)a3
{
  return -[LUIDashBoardView initWithFrame:callToActionLabelText:](self, "initWithFrame:callToActionLabelText:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (LUIDashBoardView)initWithFrame:(CGRect)a3 callToActionLabelText:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  LUIDashBoardView *v10;
  NSString *v11;
  NSString *callToActionLabelText;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LUIDashBoardView;
  v10 = -[LUIDashBoardView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v9, "copy");
    callToActionLabelText = v10->_callToActionLabelText;
    v10->_callToActionLabelText = v11;

    -[LUIDashBoardView commonInit](v10, "commonInit");
  }

  return v10;
}

- (LUIDashBoardView)initWithCoder:(id)a3
{
  LUIDashBoardView *v3;
  LUIDashBoardView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIDashBoardView;
  v3 = -[LUIDashBoardView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[LUIDashBoardView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[LUIDashBoardView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
  -[LUIDashBoardView addSubview:](self, "addSubview:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView subtitleLabel](self, "subtitleLabel"));
  -[LUIDashBoardView addSubview:](self, "addSubview:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView userAvatarView](self, "userAvatarView"));
  -[LUIDashBoardView addSubview:](self, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView privacyView](self, "privacyView"));
  -[LUIDashBoardView addSubview:](self, "addSubview:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
  -[LUIDashBoardView addSubview:](self, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView legalTextLabel](self, "legalTextLabel"));
  -[LUIDashBoardView addSubview:](self, "addSubview:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView spinner](self, "spinner"));
  -[LUIDashBoardView addSubview:](self, "addSubview:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  -[LUIDashBoardView applyStyle:](self, "applyStyle:", v11);

  -[LUIDashBoardView activateConstraints](self, "activateConstraints");
  self->_callToActionLabelEnabled = 1;
  if (MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) == 2)
    -[LUIDashBoardView _setupDynamicHomeAffordance](self, "_setupDynamicHomeAffordance");
}

- (void)dealloc
{
  objc_super v3;

  -[LUIDashBoardView setContact:](self, "setContact:", 0);
  v3.receiver = self;
  v3.super_class = (Class)LUIDashBoardView;
  -[LUIDashBoardView dealloc](&v3, "dealloc");
}

- (void)activateConstraints
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView _topConstraints](self, "_topConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v2);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double Width;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  objc_super v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v75.receiver = self;
  v75.super_class = (Class)LUIDashBoardView;
  -[LUIDashBoardView layoutSubviews](&v75, "layoutSubviews");
  -[LUIDashBoardView center](self, "center");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView userAvatarView](self, "userAvatarView"));
  objc_msgSend(v7, "setCenter:", v4, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
  objc_msgSend(v8, "sizeToFit");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
  objc_msgSend(v9, "frame");
  v11 = v10;

  -[LUIDashBoardView bounds](self, "bounds");
  v13 = v12 * 0.5;
  -[LUIDashBoardView bounds](self, "bounds");
  v15 = v14 - v11 * 0.5;
  v16 = MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0);
  v17 = 55.0;
  if (v16 == 2)
    v17 = 11.0;
  v18 = v15 - v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
  objc_msgSend(v19, "setCenter:", v13, v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
  objc_msgSend(v20, "center");
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
  objc_msgSend(v23, "center");
  v25 = v24;
  if (MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) == 2)
    v26 = 33.0;
  else
    v26 = 0.0;
  v27 = v25 - v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView spinner](self, "spinner"));
  objc_msgSend(v28, "setCenter:", v22, v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
  objc_msgSend(v29, "frame");
  v31 = v30;
  v33 = v32;

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView legalTextLabel](self, "legalTextLabel"));
  objc_msgSend(v34, "sizeToFit");

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView legalTextLabel](self, "legalTextLabel"));
  objc_msgSend(v35, "frame");
  v37 = v36;
  v39 = v38;

  -[LUIDashBoardView bounds](self, "bounds");
  v41 = (v40 - v37) * 0.5;
  v42 = v31 + v33 + 0.0;
  if (MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) == 2)
    v43 = 33.0;
  else
    v43 = 0.0;
  v44 = v42 - v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView legalTextLabel](self, "legalTextLabel"));
  objc_msgSend(v45, "setFrame:", v41, v44, v37, v39);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView privacyView](self, "privacyView"));
  objc_msgSend(v46, "sizeToFit");

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView privacyView](self, "privacyView"));
  objc_msgSend(v47, "frame");
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;

  -[LUIDashBoardView bounds](self, "bounds");
  Width = CGRectGetWidth(v76);
  v77.origin.x = v49;
  v77.origin.y = v51;
  v77.size.width = v53;
  v77.size.height = v55;
  v57 = (Width - CGRectGetWidth(v77)) * 0.5;
  v78.origin.x = v57;
  v78.origin.y = v51;
  v78.size.width = v53;
  v78.size.height = v55;
  v58 = v31 - CGRectGetHeight(v78);
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
  objc_msgSend(v59, "privacyViewBaselineToBottomPadding");
  v61 = v58 - v60;
  if (MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) == 2)
    v62 = 33.0;
  else
    v62 = 0.0;
  v63 = v61 - v62;

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView privacyView](self, "privacyView"));
  objc_msgSend(v64, "setFrame:", v57, v63, v53, v55);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView dynamicHomeAffordance](self, "dynamicHomeAffordance"));
  if (v65)
  {
    -[LUIDashBoardView _homeAffordanceRestingFrame](self, "_homeAffordanceRestingFrame");
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v73 = v72;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView dynamicHomeAffordance](self, "dynamicHomeAffordance"));
    objc_msgSend(v74, "setFrame:", v67, v69, v71, v73);

  }
}

- (id)_topConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  double v17;
  void *v18;
  id v20;
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
  _QWORD v54[9];

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView topAnchor](self, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v51, "edgeInsetsForHeader");
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v50, v3 + 20.0));
  v54[0] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "centerXAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView centerXAnchor](self, "centerXAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v54[1] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView leadingAnchor](self, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v42, "edgeInsetsForHeader");
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v41, v4));
  v54[2] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView trailingAnchor](self, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v37, "edgeInsetsForHeader");
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:constant:", v36, -v5));
  v54[3] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "heightAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
  objc_msgSend(v33, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintGreaterThanOrEqualToConstant:", v6));
  v54[4] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView subtitleLabel](self, "subtitleLabel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v27, "titleToSubTitleSpacing");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v26));
  v54[5] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView subtitleLabel](self, "subtitleLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "centerXAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView centerXAnchor](self, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v54[6] = v21;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView subtitleLabel](self, "subtitleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView leadingAnchor](self, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v10, "edgeInsetsForHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v9, v11));
  v54[7] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView subtitleLabel](self, "subtitleLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView trailingAnchor](self, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v16, "edgeInsetsForHeader");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:constant:", v15, -v17));
  v54[8] = v18;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 9));

  return v20;
}

- (void)applyStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headerTitleFont"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "overallTextColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headerSubTitleFont"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v10, "setFont:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "overallTextColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v12, "setTextColor:", v11);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v13, "setMinimumScaleFactor:", 0.0);

}

- (void)setContact:(id)a3
{
  id v5;
  CNContact **p_contact;
  void *v7;
  void *v8;
  CNContact *v9;

  v5 = a3;
  p_contact = &self->_contact;
  if ((-[CNContact isEqual:](self->_contact, "isEqual:", v5) & 1) == 0)
  {
    -[CNContact removeObserver:forKeyPath:context:](*p_contact, "removeObserver:forKeyPath:context:", self, CFSTR("imageData"), off_1000888C8);
    objc_storeStrong((id *)&self->_contact, a3);
    -[CNContact addObserver:forKeyPath:options:context:](*p_contact, "addObserver:forKeyPath:options:context:", self, CFSTR("imageData"), 1, off_1000888C8);
    if (*p_contact)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView userAvatarView](self, "userAvatarView"));
      v9 = *p_contact;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
      objc_msgSend(v7, "setContacts:", v8);

    }
  }

}

- (void)setUser:(id)a3 isTemporarySession:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSPersonNameComponents *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned int v24;
  NSPersonNameComponents *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
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
  unsigned int v45;
  id v46;

  v4 = a4;
  v46 = a3;
  if (v46)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContactCache sharedInstance](LUIContactCache, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[LKUser userFromUMUser:](LKUser, "userFromUMUser:", v46));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactForUser:isInstructor:isTemporarySession:", v7, 0, v4));
    -[LUIDashBoardView setContact:](self, "setContact:", v8);

    if (-[LUIDashBoardView gettingReadyViewEnabled](self, "gettingReadyViewEnabled"))
    {
LABEL_26:
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView userAvatarView](self, "userAvatarView"));
      objc_msgSend(v39, "sizeToFit");

      v40 = (void *)objc_claimAutoreleasedReturnValue(+[LUISyncTaskMonitor sharedInstance](LUISyncTaskMonitor, "sharedInstance"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView userAvatarView](self, "userAvatarView"));
      objc_msgSend(v40, "removeSyncTaskPresenter:", v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(+[LUISyncTaskMonitor sharedInstance](LUISyncTaskMonitor, "sharedInstance"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView userAvatarView](self, "userAvatarView"));
      objc_msgSend(v42, "addSyncTaskPresenter:forUser:", v43, v46);

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
      objc_msgSend(v44, "sizeToFit");

      goto LABEL_27;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("INFORMAL_WELCOME_TITLE_USER_NAME_FORMAT"), &stru_100069EB8, 0));

    v11 = objc_opt_new(NSPersonNameComponents);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView contact](self, "contact"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "givenName"));
    -[NSPersonNameComponents setGivenName:](v11, "setGivenName:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView contact](self, "contact"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "familyName"));
    -[NSPersonNameComponents setFamilyName:](v11, "setFamilyName:", v15);

    v16 = objc_msgSend(v10, "rangeOfString:options:", CFSTR("<[a-z]+>"), 1024);
    v18 = 0;
    v19 = 0;
    if (v16 == (id)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_24;
    v20 = v16;
    v21 = v17;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", v16, v17));
    v19 = v22;
    if (v22)
    {
      if (objc_msgSend(v22, "isEqualToString:", CFSTR("<firstname>")))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView contact](self, "contact"));
        v24 = objc_msgSend(v23, "isKeyAvailable:", CFSTR("givenName"));

        if (v24)
        {
          v25 = v11;
          v26 = 1;
          goto LABEL_8;
        }
      }
      else if (objc_msgSend(v19, "isEqualToString:", CFSTR("<surname>")))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView contact](self, "contact"));
        v29 = objc_msgSend(v28, "isKeyAvailable:", CFSTR("familyName"));

        if (v29)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView contact](self, "contact"));
          v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "familyName"));
          v31 = v21;
          v32 = (void *)v30;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v20, v31));

          goto LABEL_19;
        }
      }
      else if (objc_msgSend(v19, "isEqualToString:", CFSTR("<fullname>")))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView contact](self, "contact"));
        if ((objc_msgSend(v33, "isKeyAvailable:", CFSTR("givenName")) & 1) != 0)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView contact](self, "contact"));
          v45 = objc_msgSend(v34, "isKeyAvailable:", CFSTR("familyName"));

          if (v45)
          {
            v25 = v11;
            v26 = 2;
LABEL_8:
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:](NSPersonNameComponentsFormatter, "localizedStringFromPersonNameComponents:style:options:", v25, v26, 0));
            if (v27)
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v20, v21, v27));
            else
              v18 = 0;
LABEL_19:

            if (v18 && !v4)
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("INFORMAL_WELCOME_TITLE_FORMAT_USER"), &stru_100069EB8, 0));
              v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v18));

LABEL_25:
              v38 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
              objc_msgSend(v38, "setText:", v37);

              goto LABEL_26;
            }
LABEL_24:
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("INFORMAL_WELCOME_TITLE_NO_NAME"), &stru_100069EB8, 0));
            goto LABEL_25;
          }
        }
        else
        {

        }
      }
    }
    v18 = 0;
    goto LABEL_24;
  }
  -[LUIDashBoardView setContact:](self, "setContact:", 0);
LABEL_27:

}

- (void)setGettingReadyViewEnabled:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_gettingReadyViewEnabled != a3)
  {
    self->_gettingReadyViewEnabled = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView gettingReadyString](self, "gettingReadyString"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
      objc_msgSend(v5, "setText:", v4);

      -[LUIDashBoardView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setGettingReadyString:(id)a3
{
  NSString *v4;
  NSString *gettingReadyString;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!-[NSString isEqualToString:](self->_gettingReadyString, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v12, "copy");
    gettingReadyString = self->_gettingReadyString;
    self->_gettingReadyString = v4;

    v6 = self->_gettingReadyString;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView greetingLabel](self, "greetingLabel"));
    objc_msgSend(v7, "setText:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView privacyView](self, "privacyView"));
    objc_msgSend(v8, "setHidden:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
    objc_msgSend(v9, "setAlpha:", 0.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView legalTextLabel](self, "legalTextLabel"));
    objc_msgSend(v10, "setHidden:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView dynamicHomeAffordance](self, "dynamicHomeAffordance"));
    objc_msgSend(v11, "setHidden:", 1);

    -[LUIDashBoardView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSubtitleString:(id)a3
{
  NSString *v4;
  NSString *subtitleString;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_subtitleString, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    subtitleString = self->_subtitleString;
    self->_subtitleString = v4;

    v6 = self->_subtitleString;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v7, "setText:", v6);

    -[LUIDashBoardView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIActivityIndicatorView)spinner
{
  UIActivityIndicatorView *spinner;
  id v4;
  void *v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *v7;

  spinner = self->_spinner;
  if (!spinner)
  {
    v4 = objc_alloc((Class)UIActivityIndicatorView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v6 = (UIActivityIndicatorView *)objc_msgSend(v4, "initWithActivityIndicatorStyle:", objc_msgSend(v5, "activityIndicatorViewStyle"));
    v7 = self->_spinner;
    self->_spinner = v6;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView setAlpha:](self->_spinner, "setAlpha:", 1.0);
    spinner = self->_spinner;
  }
  return spinner;
}

- (SBUICallToActionLabel)callToActionLabel
{
  SBUICallToActionLabel *callToActionLabel;
  SBUICallToActionLabel *v4;
  SBUICallToActionLabel *v5;
  void *v6;
  void *v7;
  SBUICallToActionLabel *v8;
  NSString *callToActionLabelText;
  void *v10;
  void *v11;
  int v12;
  SBUICallToActionLabel *v13;

  callToActionLabel = self->_callToActionLabel;
  if (!callToActionLabel)
  {
    v4 = (SBUICallToActionLabel *)objc_msgSend(objc_alloc((Class)SBUICallToActionLabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_callToActionLabel;
    self->_callToActionLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wallpaperLegibilitySettings"));

    -[SBUICallToActionLabel setLegibilitySettings:](self->_callToActionLabel, "setLegibilitySettings:", v7);
    v8 = self->_callToActionLabel;
    callToActionLabelText = self->_callToActionLabelText;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "languageCode"));
    -[SBUICallToActionLabel setText:forLanguage:animated:](v8, "setText:forLanguage:animated:", callToActionLabelText, v11, 0);

    -[SBUICallToActionLabel sizeToFit](self->_callToActionLabel, "sizeToFit");
    v12 = MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0);
    v13 = self->_callToActionLabel;
    if (v12 == 2)
    {
      -[SBUICallToActionLabel setVisible:animated:](v13, "setVisible:animated:", 1, 0);
      -[SBUICallToActionLabel setAlpha:](self->_callToActionLabel, "setAlpha:", 0.0);
    }
    else
    {
      -[SBUICallToActionLabel setVisible:animated:](v13, "setVisible:animated:", 0, 0);
    }
    -[SBUICallToActionLabel setAccessibilityIdentifier:](self->_callToActionLabel, "setAccessibilityIdentifier:", CFSTR("SBUICallToActionLabel"));

    callToActionLabel = self->_callToActionLabel;
  }
  return callToActionLabel;
}

- (void)willMoveToWindow:(id)a3
{
  unsigned __int8 v5;

  v5 = -[LUIDashBoardView gettingReadyViewEnabled](self, "gettingReadyViewEnabled");
  if (!a3 && (v5 & 1) == 0)
    -[LUIDashBoardView _hideCallToAction](self, "_hideCallToAction");
}

- (void)didMoveToWindow
{
  void *v3;

  if (!-[LUIDashBoardView gettingReadyViewEnabled](self, "gettingReadyViewEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView window](self, "window"));

    if (v3)
    {
      if (-[LUIDashBoardView isCallToActionLabelEnabled](self, "isCallToActionLabelEnabled"))
        -[LUIDashBoardView _showCallToAction](self, "_showCallToAction");
    }
  }
}

- (void)_addTeachableMomentsAnimation
{
  -[LUIDashBoardView _addTextAnimation](self, "_addTextAnimation");
  -[LUIDashBoardView _addHomeAffordanceAnimation](self, "_addHomeAffordanceAnimation");
}

- (void)_addTeachableMomentsResetAnimation
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_addTeachableMomentsAnimation", 0);
  -[LUIDashBoardView _addTextResetAnimation](self, "_addTextResetAnimation");
  -[LUIDashBoardView _addHomeAffordanceResetAnimation](self, "_addHomeAffordanceResetAnimation");
}

- (void)_showCallToAction
{
  id v3;

  if (MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) == 2)
  {
    -[LUIDashBoardView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_addTeachableMomentsAnimation", 0, 3.0);
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
    objc_msgSend(v3, "setVisible:animated:", 1, 0);

  }
}

- (void)_hideCallToAction
{
  id v3;

  if (MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) == 2)
  {
    -[LUIDashBoardView _addTeachableMomentsResetAnimation](self, "_addTeachableMomentsResetAnimation");
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
    objc_msgSend(v3, "setVisible:animated:", 0, 0);

  }
}

- (LUIUserAvatarView)userAvatarView
{
  LUIUserAvatarView *userAvatarView;
  LUIUserAvatarView *v4;
  LUIUserAvatarView *v5;

  userAvatarView = self->_userAvatarView;
  if (!userAvatarView)
  {
    v4 = (LUIUserAvatarView *)objc_claimAutoreleasedReturnValue(+[LUIUserAvatarView avatarViewWithFrame:](LUIUserAvatarView, "avatarViewWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height));
    v5 = self->_userAvatarView;
    self->_userAvatarView = v4;

    -[LUIUserAvatarView setMonogramDiameter:](self->_userAvatarView, "setMonogramDiameter:", 256.0);
    -[LUIUserAvatarView setTranslatesAutoresizingMaskIntoConstraints:](self->_userAvatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[LUIUserAvatarView sizeToFit](self->_userAvatarView, "sizeToFit");
    userAvatarView = self->_userAvatarView;
  }
  return userAvatarView;
}

- (UILabel)greetingLabel
{
  UILabel *greetingLabel;
  UILabel *v4;
  UILabel *v5;

  greetingLabel = self->_greetingLabel;
  if (!greetingLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_greetingLabel;
    self->_greetingLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_greetingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    greetingLabel = self->_greetingLabel;
  }
  return greetingLabel;
}

- (UILabel)subtitleLabel
{
  UILabel *subtitleLabel;
  UILabel *v4;
  UILabel *v5;

  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_subtitleLabel;
    self->_subtitleLabel = v4;

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    subtitleLabel = self->_subtitleLabel;
  }
  return subtitleLabel;
}

- (LUIPrivacyView)privacyView
{
  LUIPrivacyView *privacyView;
  LUIPrivacyView *v4;
  LUIPrivacyView *v5;

  privacyView = self->_privacyView;
  if (!privacyView)
  {
    v4 = (LUIPrivacyView *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyView dynamicHeightPrivacyView](LUIPrivacyView, "dynamicHeightPrivacyView"));
    v5 = self->_privacyView;
    self->_privacyView = v4;

    -[LUIPrivacyView setTranslatesAutoresizingMaskIntoConstraints:](self->_privacyView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    privacyView = self->_privacyView;
  }
  return privacyView;
}

- (UILabel)legalTextLabel
{
  UILabel *v3;
  UILabel *legalTextLabel;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;

  if (!self->_legalTextLabel)
  {
    v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    legalTextLabel = self->_legalTextLabel;
    self->_legalTextLabel = v3;

    -[UILabel setAlpha:](self->_legalTextLabel, "setAlpha:", 0.6);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondaryColor"));
    -[UILabel setColor:](self->_legalTextLabel, "setColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 10.5));
    -[UILabel setFont:](self->_legalTextLabel, "setFont:", v7);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_legalTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = +[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild");
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView _legalString](self, "_legalString"));
      -[UILabel setText:](self->_legalTextLabel, "setText:", v9);

    }
    else
    {
      -[UILabel setText:](self->_legalTextLabel, "setText:", 0);
    }
    -[UILabel setHidden:](self->_legalTextLabel, "setHidden:", v8 ^ 1);
  }
  return self->_legalTextLabel;
}

- (id)_legalString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNAL_BUILD_LEGAL_DECLARATION_DO_NOT_LOCALIZE"), &stru_100069EB8, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INTERNAL_BUILD_LEGAL_INSTRUCTIONS_DO_NOT_LOCALIZE"), &stru_100069EB8, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INTERNAL_BUILD_LEGAL_CONTACT_DO_NOT_LOCALIZE"), &stru_100069EB8, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@ %@"), v3, v5, v7));
  return v8;
}

- (void)_setupDynamicHomeAffordance
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  MTLumaDodgePillView *dynamicHomeAffordance;
  id v8;

  v3 = objc_alloc_init((Class)MTLumaDodgePillView);
  -[LUIDashBoardView addSubview:](self, "addSubview:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wallpaperLegibilitySettings"));
  if (objc_msgSend(v5, "style") == (id)2)
    v6 = 3;
  else
    v6 = 4;
  objc_msgSend(v3, "setStyle:", v6);

  dynamicHomeAffordance = self->_dynamicHomeAffordance;
  self->_dynamicHomeAffordance = (MTLumaDodgePillView *)v3;
  v8 = v3;

  -[MTLumaDodgePillView setAccessibilityIdentifier:](self->_dynamicHomeAffordance, "setAccessibilityIdentifier:", CFSTR("LUIHomeAffordance"));
}

- (void)setCallToActionLabelEnabled:(BOOL)a3
{
  _QWORD v5[5];
  _QWORD block[5];

  if (a3)
  {
    if (!self->_callToActionLabelEnabled)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1000281DC;
      v5[3] = &unk_100068C58;
      v5[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000281D4;
    block[3] = &unk_100068C58;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  self->_callToActionLabelEnabled = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  objc_super v8;

  if (off_1000888C8 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("imageData"), a4, a5))
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView userAvatarView](self, "userAvatarView"));
      objc_msgSend(v7, "updateMonogram");

    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)LUIDashBoardView;
    -[LUIDashBoardView observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)startProgressAnimation
{
  id v3;

  if (MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) != 2)
    -[SBUICallToActionLabel setVisible:animated:](self->_callToActionLabel, "setVisible:animated:", 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView spinner](self, "spinner"));
  objc_msgSend(v3, "startAnimating");

}

- (void)stopProgressAnimation
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView spinner](self, "spinner"));
  objc_msgSend(v3, "stopAnimating");

  if (MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) != 2)
    -[SBUICallToActionLabel setVisible:animated:](self->_callToActionLabel, "setVisible:animated:", 1, 0);
}

- (id)_homeAffordancePositionAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("position.y")));
  objc_msgSend(v6, "setKeyTimes:", &off_10006CD10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -5.0, v7));
  v14[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -15.0));
  v14[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -2.0));
  v14[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
  v14[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 5));
  objc_msgSend(v6, "setValues:", v12);

  objc_msgSend(v6, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v6, "setDuration:", a3);
  objc_msgSend(v6, "setBeginTime:", a4);
  objc_msgSend(v6, "setAdditive:", 1);
  return v6;
}

- (void)_addHomeAffordanceAnimation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView dynamicHomeAffordance](self, "dynamicHomeAffordance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));

  -[LUIDashBoardView _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v4);
  -[LUIDashBoardView _removeNormalAnimationsForKeyPath:onLayer:](self, "_removeNormalAnimationsForKeyPath:onLayer:", CFSTR("position.y"), v4);
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000285DC;
  v5[3] = &unk_100069B08;
  objc_copyWeak(&v6, &location);
  -[LUIDashBoardView _addRepeatedAnimationWithProvider:animationDuration:toLayer:](self, "_addRepeatedAnimationWithProvider:animationDuration:toLayer:", v5, v4, 4.0);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)_addHomeAffordanceResetAnimation
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView dynamicHomeAffordance](self, "dynamicHomeAffordance"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));

  -[LUIDashBoardView _addResetAnimationForKeyPath:onLayer:](self, "_addResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v4);
}

- (CGRect)_homeAffordanceRestingFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  -[LUIDashBoardView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[MTLumaDodgePillView suggestedSizeForContentWidth:](self->_dynamicHomeAffordance, "suggestedSizeForContentWidth:", v3);
  v8 = v7;
  v10 = v9;
  v11 = (v4 - v7) * 0.5;
  -[MTLumaDodgePillView suggestedEdgeSpacing](self->_dynamicHomeAffordance, "suggestedEdgeSpacing");
  v13 = v6 - v10 - v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v15 = objc_msgSend(v14, "scale");
  v17 = BSRectRoundForScale(v15, v11, v13, v8, v10, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)_addTextAnimation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));

  -[LUIDashBoardView _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v4);
  -[LUIDashBoardView _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("opacity"), v4);
  -[LUIDashBoardView _removeNormalAnimationsForKeyPath:onLayer:](self, "_removeNormalAnimationsForKeyPath:onLayer:", CFSTR("position.y"), v4);
  -[LUIDashBoardView _removeNormalAnimationsForKeyPath:onLayer:](self, "_removeNormalAnimationsForKeyPath:onLayer:", CFSTR("opacity"), v4);
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000288E0;
  v5[3] = &unk_100069B08;
  objc_copyWeak(&v6, &location);
  -[LUIDashBoardView _addRepeatedAnimationWithProvider:animationDuration:toLayer:](self, "_addRepeatedAnimationWithProvider:animationDuration:toLayer:", v5, v4, 4.0);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)_addTextResetAnimation
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView callToActionLabel](self, "callToActionLabel"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));

  -[LUIDashBoardView _addResetAnimationForKeyPath:onLayer:](self, "_addResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v4);
  -[LUIDashBoardView _addResetAnimationForKeyPath:onLayer:](self, "_addResetAnimationForKeyPath:onLayer:", CFSTR("opacity"), v4);

}

- (id)_textPositionAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("position.y")));
  objc_msgSend(v6, "setKeyTimes:", &off_10006CD28);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -16.0, v7));
  v14[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -30.0));
  v14[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -33.0));
  v14[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -33.0));
  v14[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 5));
  objc_msgSend(v6, "setValues:", v12);

  objc_msgSend(v6, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v6, "setDuration:", a3);
  objc_msgSend(v6, "setBeginTime:", a4);
  objc_msgSend(v6, "setAdditive:", 1);
  return v6;
}

- (id)_textAlphaAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v7, "setKeyTimes:", &off_10006CD40);
  objc_msgSend(v7, "setValues:", &off_10006CD58);
  objc_msgSend(v7, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v7, "setDuration:", a3);
  objc_msgSend(v7, "setBeginTime:", a4);
  objc_msgSend(v7, "setAdditive:", 1);
  objc_msgSend(v7, "setDelegate:", self);
  return v7;
}

- (void)_addRepeatedAnimationWithProvider:(id)a3 animationDuration:(double)a4 toLayer:(id)a5
{
  id v8;
  double v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t (**v20)(double, double);
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v20 = (uint64_t (**)(double, double))a3;
  v8 = a5;
  v9 = CACurrentMediaTime();
  for (i = 0; i != 3; ++i)
  {
    v11 = v20[2](a4, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v16);
          if (i == 2)
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v16), "setValue:forKey:", &__kCFBooleanTrue, CFSTR("kLUIDashBoardIsLastAnimationKey"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "keyPath"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView _animationKeyForKeyPath:iteration:reset:](self, "_animationKeyForKeyPath:iteration:reset:", v18, i, 0));

          objc_msgSend(v8, "addAnimation:forKey:", v17, v19);
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }
    v9 = v9 + a4;

  }
}

- (void)_addResetAnimationForKeyPath:(id)a3 onLayer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentationLayer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKeyPath:", v7));
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKeyPath:", v7));
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  -[LUIDashBoardView _removeNormalAnimationsForKeyPath:onLayer:](self, "_removeNormalAnimationsForKeyPath:onLayer:", v7, v6);
  v19 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", v7));
  objc_msgSend(v19, "setDuration:", 0.2);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(v19, "setTimingFunction:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
  objc_msgSend(v19, "setFromValue:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
  objc_msgSend(v19, "setToValue:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView _animationKeyForKeyPath:iteration:reset:](self, "_animationKeyForKeyPath:iteration:reset:", v7, 0, 1));
  objc_msgSend(v6, "addAnimation:forKey:", v19, v18);

}

- (void)_removeResetAnimationForKeyPath:(id)a3 onLayer:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView _animationKeyForKeyPath:iteration:reset:](self, "_animationKeyForKeyPath:iteration:reset:", a3, 0, 1));
  objc_msgSend(v6, "removeAnimationForKey:", v7);

}

- (void)_removeNormalAnimationsForKeyPath:(id)a3 onLayer:(id)a4
{
  uint64_t i;
  void *v7;
  id v8;

  v8 = a4;
  for (i = 0; i != 3; ++i)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIDashBoardView _animationKeyForKeyPath:iteration:reset:](self, "_animationKeyForKeyPath:iteration:reset:", a3, i, 0));
    objc_msgSend(v8, "removeAnimationForKey:", v7);

  }
}

- (id)_animationKeyForKeyPath:(id)a3 iteration:(unint64_t)a4 reset:(BOOL)a5
{
  __CFString *v5;

  if (a5)
    v5 = CFSTR("kLUIDashBoardHomeAffordanceResetAnimation");
  else
    v5 = CFSTR("kLUIDashBoardHomeAffordanceNormalAnimation");
  return -[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR("-%@-%lu"), a3, a4);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  unsigned int v6;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("kLUIDashBoardIsLastAnimationKey")));
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
      -[LUIDashBoardView _showCallToAction](self, "_showCallToAction");
  }
}

- (BOOL)isCallToActionLabelEnabled
{
  return self->_callToActionLabelEnabled;
}

- (BOOL)gettingReadyViewEnabled
{
  return self->_gettingReadyViewEnabled;
}

- (NSString)gettingReadyString
{
  return self->_gettingReadyString;
}

- (NSString)subtitleString
{
  return self->_subtitleString;
}

- (void)setGreetingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_greetingLabel, a3);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void)setLegalTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_legalTextLabel, a3);
}

- (void)setPrivacyView:(id)a3
{
  objc_storeStrong((id *)&self->_privacyView, a3);
}

- (void)setUserAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_userAvatarView, a3);
}

- (void)setCallToActionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_callToActionLabel, a3);
}

- (NSString)callToActionLabelText
{
  return self->_callToActionLabelText;
}

- (void)setCallToActionLabelText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (MTLumaDodgePillView)dynamicHomeAffordance
{
  return self->_dynamicHomeAffordance;
}

- (void)setDynamicHomeAffordance:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicHomeAffordance, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_dynamicHomeAffordance, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_callToActionLabelText, 0);
  objc_storeStrong((id *)&self->_callToActionLabel, 0);
  objc_storeStrong((id *)&self->_userAvatarView, 0);
  objc_storeStrong((id *)&self->_privacyView, 0);
  objc_storeStrong((id *)&self->_legalTextLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_greetingLabel, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_gettingReadyString, 0);
}

@end

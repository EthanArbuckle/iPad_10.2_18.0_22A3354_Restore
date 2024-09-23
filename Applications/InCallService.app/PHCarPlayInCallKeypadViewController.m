@implementation PHCarPlayInCallKeypadViewController

- (PHCarPlayInCallKeypadViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHCarPlayInCallKeypadViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHCarPlayInCallKeypadViewController;
  v4 = -[PHCarPlayGenericViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVExternalDevice currentCarPlayExternalDevice](AVExternalDevice, "currentCarPlayExternalDevice"));
    -[PHCarPlayGenericDialerViewController setCarPlayExternalDevice:](v4, "setCarPlayExternalDevice:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = AVExternalDeviceLimitedUIChangedNotification;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController carPlayExternalDevice](v4, "carPlayExternalDevice"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, "limitedUINotification:", v7, v8);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayInCallKeypadViewController;
  -[PHCarPlayInCallKeypadViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  id v3;
  double y;
  double width;
  double height;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHCarPlayInCallKeyPadButton *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PHCarPlayInCallKeyPadButton *v18;
  void *v19;
  void *v20;
  void *v21;
  PHCarPlayInCallKeyPadButton *v22;
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
  id v113;
  DialerController *v114;
  id v115;
  _QWORD v116[14];
  _QWORD v117[3];
  _QWORD v118[3];

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v115 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
  objc_msgSend(v115, "setBackgroundColor:", v7);

  -[PHCarPlayInCallKeypadViewController setView:](self, "setView:", v115);
  v114 = -[DialerController initWithDialerType:]([DialerController alloc], "initWithDialerType:", 2);
  -[PHCarPlayGenericDialerViewController setDialerController:](self, "setDialerController:", v114);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v10, "addSubview:", v12);

  -[PHCarPlayInCallKeypadViewController addChildViewController:](self, "addChildViewController:", v114);
  v13 = (PHCarPlayInCallKeyPadButton *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v14 = *(PHCarPlayInCallKeyPadButton **)((char *)&self->_endButton + 1);
  *(PHCarPlayInCallKeyPadButton **)((char *)&self->_endButton + 1) = v13;

  objc_msgSend(*(id *)((char *)&self->_endButton + 1), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
  objc_msgSend(*(id *)((char *)&self->_endButton + 1), "setBackgroundColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", *(PHCarPlayInCallKeyPadButton **)((char *)&self->_endButton + 1));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  objc_msgSend(v17, "sendSubviewToBack:", *(PHCarPlayInCallKeyPadButton **)((char *)&self->_endButton + 1));

  v18 = -[PHCarPlayInCallKeyPadButton initWithKeyPadButtonType:usingSmallFont:]([PHCarPlayInCallKeyPadButton alloc], "initWithKeyPadButtonType:usingSmallFont:", 0, 0);
  v19 = *(AVExternalDevice **)((char *)&self->super._carPlayExternalDevice + 1);
  *(AVExternalDevice **)((char *)&self->super._carPlayExternalDevice + 1) = (AVExternalDevice *)v18;

  objc_msgSend(*(id *)((char *)&self->super._carPlayExternalDevice + 1), "addTarget:action:forControlEvents:", self, "backButtonTapped:", 64);
  v113 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "backButtonTapped:");
  objc_msgSend(v113, "setAllowedPressTypes:", &off_100296F78);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  objc_msgSend(v20, "addGestureRecognizer:", v113);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  objc_msgSend(v21, "addSubview:", *(AVExternalDevice **)((char *)&self->super._carPlayExternalDevice + 1));

  v22 = -[PHCarPlayInCallKeyPadButton initWithKeyPadButtonType:usingSmallFont:]([PHCarPlayInCallKeyPadButton alloc], "initWithKeyPadButtonType:usingSmallFont:", 1, 0);
  v23 = *(PHCarPlayInCallKeyPadButton **)((char *)&self->_backButton + 1);
  *(PHCarPlayInCallKeyPadButton **)((char *)&self->_backButton + 1) = v22;

  objc_msgSend(*(id *)((char *)&self->_backButton + 1), "addTarget:action:forControlEvents:", self, "endButtonTapped:", 64);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  objc_msgSend(v24, "addSubview:", *(PHCarPlayInCallKeyPadButton **)((char *)&self->_backButton + 1));

  v117[0] = CFSTR("backButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController backButton](self, "backButton"));
  v118[0] = v25;
  v117[1] = CFSTR("dialer");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
  v118[1] = v27;
  v117[2] = CFSTR("endButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController endButton](self, "endButton"));
  v118[2] = v28;
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v118, v117, 3));

  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_endButton + 1), "leftAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "safeAreaLayoutGuide"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "leftAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v108));
  v116[0] = v107;
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_endButton + 1), "rightAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "safeAreaLayoutGuide"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "rightAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:", v103));
  v116[1] = v102;
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_endButton + 1), "heightAnchor"));
  objc_msgSend((id)objc_opt_class(self, v29), "fakeNavigationBarHeight");
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToConstant:"));
  v116[2] = v100;
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_endButton + 1), "topAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "safeAreaLayoutGuide"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "topAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:", v96));
  v116[3] = v95;
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "view"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "topAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_endButton + 1), "topAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v91));
  v116[4] = v90;
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "view"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "bottomAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "safeAreaLayoutGuide"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "bottomAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v84));
  v116[5] = v83;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "view"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "leftAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "safeAreaLayoutGuide"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "leftAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v77));
  v116[6] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "view"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "rightAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "safeAreaLayoutGuide"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "rightAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v70));
  v116[7] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController endButton](self, "endButton"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "firstBaselineAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "safeAreaLayoutGuide"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, 30.0));
  v116[8] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController endButton](self, "endButton"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "rightAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "safeAreaLayoutGuide"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "rightAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, -7.0));
  v116[9] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController endButton](self, "endButton"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leftAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "dialerView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "lcdView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "rightAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintGreaterThanOrEqualToAnchor:", v51));
  v116[10] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController backButton](self, "backButton"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "firstBaselineAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "safeAreaLayoutGuide"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v45, 30.0));
  v116[11] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController backButton](self, "backButton"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leftAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "safeAreaLayoutGuide"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leftAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v30, 7.0));
  v116[12] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController backButton](self, "backButton"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "rightAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "dialerView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "lcdView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leftAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v37));
  v116[13] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v116, 14));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v39);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
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
  _QWORD v46[8];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController traitCollection](self, "traitCollection", a3));
  if ((objc_msgSend(v4, "interactionModel") & 2) != 0)
  {

    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "primaryInteractionModel");

  if (v6 == (id)8)
  {
LABEL_5:
    v7 = objc_alloc_init((Class)UIFocusContainerGuide);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
    objc_msgSend(v8, "addLayoutGuide:", v7);

    v9 = objc_alloc_init((Class)UIFocusContainerGuide);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
    objc_msgSend(v10, "addLayoutGuide:", v9);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "dialerView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "phonePadView"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v41));
    v46[0] = v40;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dialerView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "phonePadView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v34));
    v46[1] = v33;
    v39 = v7;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leftAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leftAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
    v46[2] = v29;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "rightAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
    v46[3] = v24;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_endButton + 1), "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
    v46[4] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_endButton + 1), "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    v46[5] = v14;
    v28 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leftAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_endButton + 1), "leftAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v46[6] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_endButton + 1), "rightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v46[7] = v20;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 8));

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);
  }
}

- (void)backButtonTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController presentingViewController](self, "presentingViewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)endButtonTapped:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", a3));
  objc_msgSend(v4, "disconnectCurrentCallAndActivateHeld");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayInCallKeypadViewController;
  -[PHCarPlayInCallKeypadViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[PHCarPlayInCallKeypadViewController setLimitedSoftPhoneKeypad:](self, "setLimitedSoftPhoneKeypad:", +[PHCarPlayUtilities shouldLimitKeypadAccess](PHCarPlayUtilities, "shouldLimitKeypadAccess"));
  -[PHCarPlayInCallKeypadViewController postMessageOverlayIfNeeded](self, "postMessageOverlayIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController endButton](self, "endButton"));
  v6 = objc_msgSend(v19, "isUsingSmallFont");
  if ((v6 & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController endButton](self, "endButton"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentAttributedTitle"));
    objc_msgSend(v3, "size");
    v8 = v7;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController endButton](self, "endButton"));
    objc_msgSend(v4, "frame");
    if (v8 > v9)
    {

      goto LABEL_10;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController backButton](self, "backButton"));
  if ((objc_msgSend(v10, "isUsingSmallFont") & 1) != 0)
  {

    if ((v6 & 1) == 0)
    {

    }
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController backButton](self, "backButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentAttributedTitle"));
  objc_msgSend(v12, "size");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController backButton](self, "backButton"));
  objc_msgSend(v15, "frame");
  v17 = v16;

  if ((v6 & 1) == 0)
  {

  }
  if (v14 > v17)
  {
LABEL_10:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController endButton](self, "endButton"));
    objc_msgSend(v18, "setUsingSmallFont:", 1);

    v19 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController backButton](self, "backButton"));
    objc_msgSend(v19, "setUsingSmallFont:", 1);
LABEL_11:

  }
}

+ (double)fakeNavigationBarHeight
{
  return 44.0;
}

- (void)limitedUINotification:(id)a3
{
  -[PHCarPlayInCallKeypadViewController setLimitedSoftPhoneKeypad:](self, "setLimitedSoftPhoneKeypad:", +[PHCarPlayUtilities shouldLimitKeypadAccess](PHCarPlayUtilities, "shouldLimitKeypadAccess", a3));
}

- (void)setLimitedSoftPhoneKeypad:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003A654;
  v3[3] = &unk_100284C98;
  v3[4] = self;
  v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)postMessageOverlayIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PHCarPlayNoContentBannerView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSBundle *v14;
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
  id v46;
  id v47;
  _QWORD v48[4];

  if (-[PHCarPlayGenericDialerViewController limitedSoftPhoneKeypad](self, "limitedSoftPhoneKeypad")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView")),
        v3,
        !v3))
  {
    v7 = -[PHCarPlayNoContentBannerView initWithFrame:]([PHCarPlayNoContentBannerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[PHCarPlayGenericDialerViewController setNoContentBannerView:](self, "setNoContentBannerView:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));
    objc_msgSend(v10, "setBackgroundColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));
    objc_msgSend(v11, "setAlpha:", 0.95);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("KEYPAD_ACCESS_IS_LIMITED"), &stru_10028DC20, CFSTR("PHCarPlay")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));
    objc_msgSend(v17, "setTitleString:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));
    objc_msgSend(v18, "setHidden:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
    objc_msgSend(v20, "setUserInteractionEnabled:", 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));
    objc_msgSend(v21, "addSubview:", v22);

    v47 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController fakeNavigationBar](self, "fakeNavigationBar"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
    v48[0] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "safeAreaLayoutGuide"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
    v48[1] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "safeAreaLayoutGuide"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leftAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leftAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v23));
    v48[2] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController view](self, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "safeAreaLayoutGuide"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "rightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "rightAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
    v48[3] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

    -[PHCarPlayInCallKeypadViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }
  else if (!-[PHCarPlayGenericDialerViewController limitedSoftPhoneKeypad](self, "limitedSoftPhoneKeypad"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController noContentBannerView](self, "noContentBannerView"));
      objc_msgSend(v5, "removeFromSuperview");

      -[PHCarPlayGenericDialerViewController setNoContentBannerView:](self, "setNoContentBannerView:", 0);
      v46 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "view"));
      objc_msgSend(v6, "setUserInteractionEnabled:", 1);

    }
  }
}

- (void)hardwareControlEventNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallKeypadViewController received hardware control event notification: %@", (uint8_t *)&v13, 0xCu);
  }

  if (-[PHCarPlayGenericViewController shouldRespondToHardwareControlEvent](self, "shouldRespondToHardwareControlEvent"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", kTUCarPlayHardwareControlButtonKey));
    v9 = (void *)kTUCarPlayHardwareControlButtonKeypad;

    if (v8 == v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", kTUCarPlayHardwareControlKeypadValueKey));
      objc_msgSend(v10, "performCharacterAddAction:", v12);

    }
  }

}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  if (-[PHCarPlayGenericDialerViewController limitedSoftPhoneKeypad](self, "limitedSoftPhoneKeypad"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController endButton](self, "endButton"));
    v9 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dialerView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "phonePadView"));
    v8 = v6;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  }
  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PHCarPlayInCallKeypadViewController;
  -[PHCarPlayInCallKeypadViewController didUpdateFocusInContext:withAnimationCoordinator:](&v18, "didUpdateFocusInContext:withAnimationCoordinator:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController backButton](self, "backButton"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController endButton](self, "endButton"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
  v12 = objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController endButton](self, "endButton"));
  if (v11 == (void *)v12)
  {

LABEL_5:
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarFocusedColor](UIColor, "dynamicCarFocusedColor"));
    objc_msgSend(v16, "setBackgroundColor:", v17);

    goto LABEL_6;
  }
  v13 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallKeypadViewController backButton](self, "backButton"));

  if (v14 == v15)
    goto LABEL_5;
LABEL_6:

}

- (PHCarPlayInCallKeyPadButton)backButton
{
  return (PHCarPlayInCallKeyPadButton *)objc_getProperty(self, a2, 49, 1);
}

- (void)setBackButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 49);
}

- (PHCarPlayInCallKeyPadButton)endButton
{
  return (PHCarPlayInCallKeyPadButton *)objc_getProperty(self, a2, 57, 1);
}

- (void)setEndButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 57);
}

- (UIView)fakeNavigationBar
{
  return (UIView *)objc_getProperty(self, a2, 65, 1);
}

- (void)setFakeNavigationBar:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 65);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_endButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_backButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->super._carPlayExternalDevice + 1), 0);
}

@end

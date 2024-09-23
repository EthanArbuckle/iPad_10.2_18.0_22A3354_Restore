@implementation HSPCNameIdentifyServiceRow

+ (id)_reuseIdentifier
{
  return CFSTR("HSPCNameIdentifyServiceRow");
}

- (HSPCNameIdentifyServiceRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HSPCNameIdentifyServiceRow *v4;
  HSPCNameIdentifyServiceRow *v5;
  void *v6;
  UIButton *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UIButton *identifyButton;
  UIButton *v12;
  UIActivityIndicatorView *v13;
  void *v14;
  UIActivityIndicatorView *spinner;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HSPCNameIdentifyServiceRow;
  v4 = -[HSPCNameToggleServiceRow initWithStyle:reuseIdentifier:](&v17, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](v4, "textField"));
    objc_msgSend(v6, "setClearButtonMode:", 1);

    v7 = (UIButton *)objc_claimAutoreleasedReturnValue(+[PRXButton buttonWithProximityType:](PRXButton, "buttonWithProximityType:", 0));
    v8 = HULocalizedString(CFSTR("HUChildServiceModuleIdentifyAccessoryViewTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[UIButton setTitle:forState:](v7, "setTitle:forState:", v9, 0);

    -[UIButton addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", v5, "identify", 64);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow contentView](v5, "contentView"));
    objc_msgSend(v10, "addSubview:", v7);

    identifyButton = v5->_identifyButton;
    v5->_identifyButton = v7;
    v12 = v7;

    v13 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow contentView](v5, "contentView"));
    objc_msgSend(v14, "addSubview:", v13);

    -[UIActivityIndicatorView setHidesWhenStopped:](v13, "setHidesWhenStopped:", 1);
    spinner = v5->_spinner;
    v5->_spinner = v13;

  }
  return v5;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
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
  double v40;
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
  objc_super v92;
  _QWORD v93[5];
  _QWORD v94[4];
  _QWORD v95[3];
  _QWORD v96[4];

  if (!-[HSPCRow constraintsSet](self, "constraintsSet"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v88 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "leadingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow contentView](self, "contentView"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "leadingAnchor"));
    +[HSPCRow horizontalLeadingMargin](HSPCRow, "horizontalLeadingMargin");
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:constant:", v76));
    v96[0] = v72;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "centerYAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow contentView](self, "contentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "centerYAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v4));
    v96[1] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
    +[HSPCRow leftImageSize](HSPCRow, "leftImageSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:", v8));
    v96[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "widthAnchor"));
    +[HSPCRow leftImageSize](HSPCRow, "leftImageSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:"));
    v96[3] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v96, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow identifyButton](self, "identifyButton"));
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow identifyButton](self, "identifyButton"));
    LODWORD(v16) = 1148846080;
    objc_msgSend(v15, "setContentHuggingPriority:forAxis:", 0, v16);

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow identifyButton](self, "identifyButton"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "topAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow contentView](self, "contentView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "topAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v77));
    v95[0] = v73;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow identifyButton](self, "identifyButton"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow contentView](self, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
    +[HSPCRow horizontalSpacing](HSPCRow, "horizontalSpacing");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v18, -v19));
    v95[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow identifyButton](self, "identifyButton"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow contentView](self, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
    v95[2] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v95, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow spinner](self, "spinner"));
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow spinner](self, "spinner"));
    LODWORD(v29) = 1148846080;
    objc_msgSend(v28, "setContentHuggingPriority:forAxis:", 0, v29);

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow spinner](self, "spinner"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "topAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow contentView](self, "contentView"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "topAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v78));
    v94[0] = v74;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow spinner](self, "spinner"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "bottomAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow contentView](self, "contentView"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "bottomAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v60));
    v94[1] = v57;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow spinner](self, "spinner"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "centerXAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow identifyButton](self, "identifyButton"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "centerXAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v31));
    v94[2] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow spinner](self, "spinner"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerYAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow identifyButton](self, "identifyButton"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "centerYAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));
    v94[3] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v94, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v91 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "leadingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow leftView](self, "leftView"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "trailingAnchor"));
    +[HSPCRow horizontalSpacing](HSPCRow, "horizontalSpacing");
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:constant:", v79));
    v93[0] = v75;
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "topAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow contentView](self, "contentView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v61));
    v93[1] = v58;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow identifyButton](self, "identifyButton"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
    +[HSPCRow horizontalTrailingMargin](HSPCRow, "horizontalTrailingMargin");
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -v40));
    v93[2] = v50;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow contentView](self, "contentView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v44));
    v93[3] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "heightAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToConstant:", 44.0));
    v93[4] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v93, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v49);

    -[HSPCRow setConstraintsSet:](self, "setConstraintsSet:", 1);
  }
  v92.receiver = self;
  v92.super_class = (Class)HSPCNameIdentifyServiceRow;
  -[HSPCNameServiceRow updateConstraints](&v92, "updateConstraints");
}

- (void)updateUIWithService:(id)a3 suggestedName:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HSPCNameIdentifyServiceRow;
  -[HSPCNameServiceRow updateUIWithService:suggestedName:](&v6, "updateUIWithService:suggestedName:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
  objc_msgSend(v5, "setClearButtonMode:", 0);

}

- (void)identify
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow identifyButton](self, "identifyButton"));
  objc_msgSend(v3, "setHighlighted:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow identifyButton](self, "identifyButton"));
  objc_msgSend(v4, "setHidden:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameIdentifyServiceRow spinner](self, "spinner"));
  objc_msgSend(v5, "startAnimating");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceRow service](self, "service"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessory"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004C750;
  v9[3] = &unk_1000A23C8;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v8, "identifyWithCompletionHandler:", v9);

}

- (UIButton)identifyButton
{
  return self->_identifyButton;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_identifyButton, 0);
}

@end

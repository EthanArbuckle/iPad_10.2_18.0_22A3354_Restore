@implementation BCAlertActionTableViewCell

- (BCAlertActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  BCAlertActionTableViewCell *v4;
  BCAlertActionTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCAlertActionTableViewCell;
  v4 = -[BCAlertActionTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[BCAlertActionTableViewCell loadContentView](v4, "loadContentView");
  return v5;
}

+ (id)reuseIdentifierForItem:(id)a3
{
  void *v3;
  id v4;
  __CFString *v5;
  __CFString *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "subTitle"));
  v4 = objc_msgSend(v3, "length");
  v5 = CFSTR("CellWithTitleSubTitleAndIcon");
  if (!v4)
    v5 = CFSTR("CellWithTitleAndIcon");
  v6 = v5;

  return v6;
}

+ (double)heightForActionItem:(id)a3 forWidth:(double)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  v9 = objc_msgSend((id)objc_opt_class(a1, v8), "reuseIdentifierForItem:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v7, "initWithStyle:reuseIdentifier:", 0, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "titleLabel"));
  objc_msgSend(v13, "setText:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subTitle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subTitleLabel"));
  objc_msgSend(v15, "setText:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "icon"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainImageView"));
  objc_msgSend(v17, "setImage:", v16);

  LODWORD(v18) = 1148846080;
  LODWORD(v19) = 1112014848;
  objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a4, 0.0, v18, v19);
  v21 = v20;
  objc_msgSend(v11, "layoutMargins");
  v23 = v21 + v22;
  objc_msgSend(v11, "layoutMargins");
  v25 = v23 + v24;

  return v25;
}

- (void)loadContentView
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  uint64_t v38;
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
  _QWORD *v55;
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
  id v87;
  id v88;
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
  NSMutableArray *v99;
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[3];
  _QWORD v103[5];
  _QWORD v104[10];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCAlertActionTableViewCell contentView](self, "contentView"));
  v88 = objc_alloc_init((Class)UILayoutGuide);
  objc_msgSend(v3, "addLayoutGuide:");
  v4 = objc_alloc_init((Class)UIImageView);
  objc_storeStrong((id *)&self->_mainImageView, v4);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v4);
  v87 = objc_alloc_init((Class)UILayoutGuide);
  objc_msgSend(v3, "addLayoutGuide:");
  v5 = objc_alloc_init((Class)UILabel);
  objc_storeStrong((id *)&self->_titleLabel, v5);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCAlertActionTableViewCell reuseIdentifier](self, "reuseIdentifier"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("CellWithTitleSubTitleAndIcon"));

  if (v7)
  {
    v8 = objc_alloc_init((Class)UILabel);
    objc_storeStrong((id *)&self->_subTitleLabel, v8);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", v8);
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 20.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleTitle3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scaledFontForFont:", v9));
  objc_msgSend(v5, "setFont:", v11);

  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _systemBlueColor2](UIColor, "_systemBlueColor2"));
  objc_msgSend(v5, "setTextColor:", v12);

  objc_msgSend(v5, "setNumberOfLines:", 2);
  objc_msgSend(v5, "setLineBreakMode:", 4);
  v83 = v5;
  v98 = v8;
  if (v8)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleCaption1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scaledFontForFont:", v13));
    objc_msgSend(v8, "setFont:", v15);

    objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v8, "setTextColor:", v16);

    objc_msgSend(v8, "setNumberOfLines:", 2);
    objc_msgSend(v8, "setLineBreakMode:", 4);
    v82 = (void *)v13;
  }
  else
  {
    v82 = v9;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("AlertActionIconColor")));
  objc_msgSend(v4, "setTintColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("CellBackgroundColor")));
  -[BCAlertActionTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v18);

  v99 = objc_opt_new(NSMutableArray);
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "leadingAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:constant:", v92, 16.0));
  v104[0] = v89;
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "centerYAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutMarginsGuide"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "centerYAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v76));
  v104[1] = v74;
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "topAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintGreaterThanOrEqualToAnchor:", v70));
  v104[2] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "bottomAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:", v66));
  v104[3] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "widthAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToConstant:", 44.0));
  v104[4] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "heightAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToConstant:", 44.0));
  v104[5] = v61;
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "centerXAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v104[6] = v58;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "centerYAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  v104[7] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widthAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 24.0));
  v104[8] = v23;
  v84 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heightAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:", 24.0));
  v104[9] = v25;
  v26 = v3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v104, 10));
  -[NSMutableArray addObjectsFromArray:](v99, "addObjectsFromArray:", v27);

  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "leadingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "trailingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:constant:", v93, 16.0));
  v103[0] = v90;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "trailingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layoutMarginsGuide"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "trailingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v75));
  v103[1] = v73;
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "centerYAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layoutMarginsGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "centerYAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v28));
  v103[2] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v31));
  v103[3] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "bottomAnchor"));
  v86 = v26;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v34));
  v103[4] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v103, 5));
  -[NSMutableArray addObjectsFromArray:](v99, "addObjectsFromArray:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "leadingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "leadingAnchor"));
  v97 = v37;
  v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v94));
  v91 = (void *)v38;
  if (v98)
  {
    v102[0] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
    v102[1] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "topAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v43));
    v102[2] = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v102, 3));
    -[NSMutableArray addObjectsFromArray:](v99, "addObjectsFromArray:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "leadingAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "leadingAnchor"));
    v97 = v46;
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v94));
    v101[0] = v91;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "trailingAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "trailingAnchor"));
    v81 = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v78));
    v101[1] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "bottomAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, 0.0));
    v101[2] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "bottomAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
    v101[3] = v54;
    v55 = v101;
  }
  else
  {
    v100[0] = v38;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "trailingAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "trailingAnchor"));
    v81 = v56;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v78));
    v100[1] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "topAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
    v100[2] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "bottomAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
    v100[3] = v54;
    v55 = v100;
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 4));
  -[NSMutableArray addObjectsFromArray:](v99, "addObjectsFromArray:", v57);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v99);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (UIImageView)mainImageView
{
  return self->_mainImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainImageView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

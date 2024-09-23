@implementation BCAlertHeaderTableViewCell

- (BCAlertHeaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  BCAlertHeaderTableViewCell *v4;
  BCAlertHeaderTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCAlertHeaderTableViewCell;
  v4 = -[BCAlertHeaderTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[BCAlertHeaderTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  return v5;
}

+ (id)reuseIdentifier
{
  return CFSTR("BCAlertHeaderTableViewCellReuseIdentifier");
}

+ (double)heightForBusinessItem:(id)a3 forWidth:(double)a4
{
  id v6;
  BCAlertHeaderTableViewCell *v7;
  uint64_t v8;
  id v9;
  void *v10;
  BCAlertHeaderTableViewCell *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  NSObject *v22;
  int v24;
  const char *v25;

  v6 = a3;
  if (v6)
  {
    v7 = [BCAlertHeaderTableViewCell alloc];
    v9 = objc_msgSend((id)objc_opt_class(a1, v8), "reuseIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = -[BCAlertHeaderTableViewCell initWithStyle:reuseIdentifier:](v7, "initWithStyle:reuseIdentifier:", 0, v10);

    -[BCAlertHeaderTableViewCell updateContentViewUsingBusinessItem:brandedHeaderDelegate:](v11, "updateContentViewUsingBusinessItem:brandedHeaderDelegate:", v6, 0);
    -[BCAlertHeaderTableViewCell layoutMargins](v11, "layoutMargins");
    v15 = v14;
    v16 = v12;
    v18 = v17 + v13;
    if (v17 + v13 >= a4)
      v18 = 0.0;
    LODWORD(v12) = 1148846080;
    LODWORD(v13) = 1112014848;
    -[BCAlertHeaderTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a4 - v18, 0.0, v12, v13);
    v20 = v16 + v15 + v19;

  }
  else
  {
    v21 = sub_1000081C4();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315138;
      v25 = "+[BCAlertHeaderTableViewCell heightForBusinessItem:forWidth:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Cannot update content view for nil BCSBusinessItem", (uint8_t *)&v24, 0xCu);
    }

    v20 = 0.0;
  }

  return v20;
}

- (void)updateContentViewUsingBusinessItem:(id)a3 brandedHeaderDelegate:(id)a4
{
  id v6;
  id v7;
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
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  uint8_t buf[4];
  const char *v41;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("CellBackgroundColor")));
    -[BCAlertHeaderTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCAlertHeaderTableViewCell contentView](self, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subviews"));
    objc_msgSend(v10, "makeObjectsPerformSelector:", "removeFromSuperview");

    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "makeBrandedHeaderViewController"));
    -[NSObject setDelegate:](v31, "setDelegate:", v7);
    v37 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject view](v31, "view"));
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCAlertHeaderTableViewCell contentView](self, "contentView"));
    objc_msgSend(v12, "addSubview:", v11);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BCAlertHeaderTableViewCell contentView](self, "contentView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layoutMarginsGuide"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v33));
    v39[0] = v32;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BCAlertHeaderTableViewCell contentView](self, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "layoutMarginsGuide"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v27));
    v39[1] = v26;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCAlertHeaderTableViewCell contentView](self, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layoutMarginsGuide"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v14));
    v39[2] = v15;
    v38 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCAlertHeaderTableViewCell contentView](self, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutMarginsGuide"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v19));
    v39[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

    v22 = v31;
    v6 = v38;

    v7 = v37;
  }
  else
  {
    v23 = sub_1000081C4();
    v22 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[BCAlertHeaderTableViewCell updateContentViewUsingBusinessItem:brandedHeaderDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Cannot update content view for nil BCSBusinessItem", buf, 0xCu);
    }
  }

}

- (UIImageView)mainImageView
{
  return self->_mainImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainImageView, 0);
}

@end

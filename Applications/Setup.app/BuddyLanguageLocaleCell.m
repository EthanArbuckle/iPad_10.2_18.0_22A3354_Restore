@implementation BuddyLanguageLocaleCell

- (BuddyLanguageLocaleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  UIColor *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSArray *v20;
  BuddyLanguageLocaleCell *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;
  id location;
  int64_t v43;
  SEL v44;
  id v45;
  _QWORD v46[5];

  v45 = self;
  v44 = a2;
  v43 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v45;
  v45 = 0;
  v41.receiver = v4;
  v41.super_class = (Class)BuddyLanguageLocaleCell;
  v45 = -[BuddyLanguageLocaleCell initWithStyle:reuseIdentifier:](&v41, "initWithStyle:reuseIdentifier:", v43, location);
  objc_storeStrong(&v45, v45);
  if (v45)
  {
    v5 = objc_alloc_init((Class)UILabel);
    objc_msgSend(v45, "setTitleLabel:", v5);

    v6 = objc_msgSend(v45, "titleLabel");
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = objc_msgSend(v45, "titleLabel");
    objc_msgSend(v7, "setNumberOfLines:", 0);

    v8 = objc_msgSend(v45, "contentView");
    v9 = objc_msgSend(v45, "titleLabel");
    objc_msgSend(v8, "addSubview:", v9);

    v10 = +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
    objc_msgSend(v45, "setBackgroundColor:", v10);

    v40 = objc_msgSend(v45, "titleLabel");
    v37 = objc_msgSend(v40, "leadingAnchor");
    v39 = objc_msgSend(v45, "contentView");
    v38 = objc_msgSend(v39, "layoutMarginsGuide");
    v36 = objc_msgSend(v38, "leadingAnchor");
    v35 = objc_msgSend(v37, "constraintEqualToAnchor:");
    v46[0] = v35;
    v34 = objc_msgSend(v45, "titleLabel");
    v31 = objc_msgSend(v34, "trailingAnchor");
    v33 = objc_msgSend(v45, "contentView");
    v32 = objc_msgSend(v33, "layoutMarginsGuide");
    v30 = objc_msgSend(v32, "trailingAnchor");
    v29 = objc_msgSend(v31, "constraintEqualToAnchor:");
    v46[1] = v29;
    v28 = objc_msgSend(v45, "titleLabel");
    v26 = objc_msgSend(v28, "topAnchor");
    v27 = objc_msgSend(v45, "contentView");
    v25 = objc_msgSend(v27, "topAnchor");
    v24 = objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:");
    v46[2] = v24;
    v23 = objc_msgSend(v45, "titleLabel");
    v11 = objc_msgSend(v23, "bottomAnchor");
    v12 = objc_msgSend(v45, "contentView");
    v13 = objc_msgSend(v12, "bottomAnchor");
    v14 = objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:", v13);
    v46[3] = v14;
    v15 = objc_msgSend(v45, "titleLabel");
    v16 = objc_msgSend(v15, "centerYAnchor");
    v17 = objc_msgSend(v45, "contentView");
    v18 = objc_msgSend(v17, "centerYAnchor");
    v19 = objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v46[4] = v19;
    v20 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 5);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

  }
  v21 = (BuddyLanguageLocaleCell *)v45;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v45, 0);
  return v21;
}

- (void)setMinimumHeight:(double)a3
{
  NSLayoutConstraint *v3;
  BOOL v4;
  double v5;
  NSLayoutConstraint *v6;
  id v7;
  id v8;
  id v9;
  NSLayoutConstraint *v10;
  char v11;
  NSLayoutConstraint *v12;

  v3 = -[BuddyLanguageLocaleCell heightConstraint](self, "heightConstraint");
  v11 = 0;
  v4 = 1;
  if (v3)
  {
    v12 = -[BuddyLanguageLocaleCell heightConstraint](self, "heightConstraint");
    v11 = 1;
    -[NSLayoutConstraint constant](v12, "constant");
    v4 = v5 != a3;
  }
  if ((v11 & 1) != 0)

  if (v4)
  {
    v6 = -[BuddyLanguageLocaleCell heightConstraint](self, "heightConstraint");
    -[NSLayoutConstraint setActive:](v6, "setActive:", 0);

    v7 = -[BuddyLanguageLocaleCell contentView](self, "contentView");
    v8 = objc_msgSend(v7, "heightAnchor");
    v9 = objc_msgSend(v8, "constraintGreaterThanOrEqualToConstant:", a3);
    -[BuddyLanguageLocaleCell setHeightConstraint:](self, "setHeightConstraint:", v9);

    v10 = -[BuddyLanguageLocaleCell heightConstraint](self, "heightConstraint");
    -[NSLayoutConstraint setActive:](v10, "setActive:", 1);

    -[BuddyLanguageLocaleCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (UIView)heightView
{
  return self->_heightView;
}

- (void)setHeightView:(id)a3
{
  objc_storeStrong((id *)&self->_heightView, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_heightView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

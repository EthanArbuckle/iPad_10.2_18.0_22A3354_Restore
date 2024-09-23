@implementation CBLanguageSelectorCell

- (CBLanguageSelectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CBLanguageSelectorCell *v4;
  id v5;
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
  objc_super v40;
  _QWORD v41[5];

  v40.receiver = self;
  v40.super_class = (Class)CBLanguageSelectorCell;
  v4 = -[CBLanguageSelectorCell initWithStyle:reuseIdentifier:](&v40, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init((Class)UILabel);
    -[CBLanguageSelectorCell setTitleLabel:](v4, "setTitleLabel:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell titleLabel](v4, "titleLabel"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell titleLabel](v4, "titleLabel"));
    objc_msgSend(v7, "setNumberOfLines:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell contentView](v4, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell titleLabel](v4, "titleLabel"));
    objc_msgSend(v8, "addSubview:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    -[CBLanguageSelectorCell setBackgroundColor:](v4, "setBackgroundColor:", v10);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell titleLabel](v4, "titleLabel"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell contentView](v4, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layoutMarginsGuide"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v35));
    v41[0] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell titleLabel](v4, "titleLabel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell contentView](v4, "contentView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "layoutMarginsGuide"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v29));
    v41[1] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell titleLabel](v4, "titleLabel"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell contentView](v4, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v24));
    v41[2] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell titleLabel](v4, "titleLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell contentView](v4, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v12));
    v41[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell titleLabel](v4, "titleLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell contentView](v4, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
    v41[4] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

  }
  return v4;
}

- (void)setMinimumHeight:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell heightConstraint](self, "heightConstraint"));
  if (!v5
    || (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell heightConstraint](self, "heightConstraint")),
        objc_msgSend(v7, "constant"),
        v9 = v8,
        v7,
        v6,
        v9 != a3))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell heightConstraint](self, "heightConstraint"));
    objc_msgSend(v10, "setActive:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell contentView](self, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintGreaterThanOrEqualToConstant:", a3));
    -[CBLanguageSelectorCell setHeightConstraint:](self, "setHeightConstraint:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorCell heightConstraint](self, "heightConstraint"));
    objc_msgSend(v14, "setActive:", 1);

    -[CBLanguageSelectorCell setNeedsLayout](self, "setNeedsLayout");
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

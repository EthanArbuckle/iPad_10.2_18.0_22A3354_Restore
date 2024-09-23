@implementation BuddyAppleIDTableCell

- (BuddyAppleIDTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 columnCount:(unint64_t)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSArray *v22;
  BuddyAppleIDTableCell *v23;
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
  objc_super v36;
  unint64_t v37;
  id location;
  int64_t v39;
  SEL v40;
  id v41;
  _QWORD v42[4];

  v41 = self;
  v40 = a2;
  v39 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v37 = a5;
  v6 = v41;
  v41 = 0;
  v36.receiver = v6;
  v36.super_class = (Class)BuddyAppleIDTableCell;
  v41 = -[BuddyAppleIDTableCell initWithStyle:reuseIdentifier:](&v36, "initWithStyle:reuseIdentifier:", v39, location);
  objc_storeStrong(&v41, v41);
  if (v41)
  {
    objc_msgSend(v41, "setSelectionStyle:", 0);
    objc_msgSend(v41, "setColumnCount:", v37);
    v7 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v41, "setStackView:", v7);

    v8 = objc_msgSend(v41, "stackView");
    objc_msgSend(v8, "setAxis:", 1);

    v9 = objc_msgSend(v41, "stackView");
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v10 = objc_msgSend(v41, "stackView");
    objc_msgSend(v10, "setSpacing:", 20.0);

    v11 = objc_msgSend(v41, "contentView");
    v12 = objc_msgSend(v41, "stackView");
    objc_msgSend(v11, "addSubview:", v12);

    v35 = objc_msgSend(v41, "contentView");
    v33 = objc_msgSend(v35, "topAnchor");
    v34 = objc_msgSend(v41, "stackView");
    v32 = objc_msgSend(v34, "topAnchor");
    v31 = objc_msgSend(v33, "constraintEqualToAnchor:");
    v42[0] = v31;
    v30 = objc_msgSend(v41, "contentView");
    v28 = objc_msgSend(v30, "trailingAnchor");
    v29 = objc_msgSend(v41, "stackView");
    v27 = objc_msgSend(v29, "trailingAnchor");
    v26 = objc_msgSend(v28, "constraintEqualToAnchor:");
    v42[1] = v26;
    v25 = objc_msgSend(v41, "contentView");
    v13 = objc_msgSend(v25, "bottomAnchor");
    v14 = objc_msgSend(v41, "stackView");
    v15 = objc_msgSend(v14, "bottomAnchor");
    v16 = objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v42[2] = v16;
    v17 = objc_msgSend(v41, "contentView");
    v18 = objc_msgSend(v17, "leadingAnchor");
    v19 = objc_msgSend(v41, "stackView");
    v20 = objc_msgSend(v19, "leadingAnchor");
    v21 = objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v42[3] = v21;
    v22 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

  }
  v23 = (BuddyAppleIDTableCell *)v41;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v41, 0);
  return v23;
}

- (id)addService:(id)a3 description:(id)a4
{
  BuddyAppleIDServiceView *v5;
  UIStackView *v6;
  UIStackView *v7;
  id v8;
  UIStackView *v9;
  UIStackView *v10;
  UIStackView *v11;
  UIStackView *v12;
  UIStackView *v13;
  UIStackView *v14;
  UIStackView *v15;
  UIStackView *v16;
  id v17;
  id v19;
  id v20;
  id location[2];
  BuddyAppleIDTableCell *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v5 = [BuddyAppleIDServiceView alloc];
  v19 = -[BuddyAppleIDServiceView initWithImage:description:](v5, "initWithImage:description:", location[0], v20);
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if ((id)-[BuddyAppleIDTableCell columnCount](v22, "columnCount") == (id)1)
  {
    v6 = -[BuddyAppleIDTableCell stackView](v22, "stackView");
    -[UIStackView addArrangedSubview:](v6, "addArrangedSubview:", v19);

  }
  else
  {
    v7 = -[BuddyAppleIDTableCell rowStackView](v22, "rowStackView");

    if (v7)
    {
      v16 = -[BuddyAppleIDTableCell rowStackView](v22, "rowStackView");
      -[UIStackView addArrangedSubview:](v16, "addArrangedSubview:", v19);

      -[BuddyAppleIDTableCell setRowStackView:](v22, "setRowStackView:", 0);
    }
    else
    {
      v8 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      -[BuddyAppleIDTableCell setRowStackView:](v22, "setRowStackView:", v8);

      v9 = -[BuddyAppleIDTableCell rowStackView](v22, "rowStackView");
      -[UIStackView setAxis:](v9, "setAxis:", 0);

      v10 = -[BuddyAppleIDTableCell rowStackView](v22, "rowStackView");
      -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v11 = -[BuddyAppleIDTableCell rowStackView](v22, "rowStackView");
      -[UIStackView setDistribution:](v11, "setDistribution:", 1);

      v12 = -[BuddyAppleIDTableCell rowStackView](v22, "rowStackView");
      -[UIStackView setSpacing:](v12, "setSpacing:", 23.0);

      v13 = -[BuddyAppleIDTableCell stackView](v22, "stackView");
      v14 = -[BuddyAppleIDTableCell rowStackView](v22, "rowStackView");
      -[UIStackView addArrangedSubview:](v13, "addArrangedSubview:", v14);

      v15 = -[BuddyAppleIDTableCell rowStackView](v22, "rowStackView");
      -[UIStackView addArrangedSubview:](v15, "addArrangedSubview:", v19);

    }
  }
  v17 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (unint64_t)columnCount
{
  return self->_columnCount;
}

- (void)setColumnCount:(unint64_t)a3
{
  self->_columnCount = a3;
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (UIStackView)rowStackView
{
  return (UIStackView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRowStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowStackView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end

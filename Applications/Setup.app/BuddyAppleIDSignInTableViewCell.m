@implementation BuddyAppleIDSignInTableViewCell

- (BuddyAppleIDSignInTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v4;
  BuddyAppleIDSignInTableViewCell *v5;
  id v6;
  void *v7;
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
  NSArray *v18;
  BuddyAppleIDSignInTableViewCell *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;
  id location;
  int64_t v30;
  SEL v31;
  id v32;
  _QWORD v33[4];

  v32 = self;
  v31 = a2;
  v30 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v32;
  v32 = 0;
  v28.receiver = v4;
  v28.super_class = (Class)BuddyAppleIDSignInTableViewCell;
  v5 = -[BuddyAppleIDSignInTableViewCell initWithStyle:reuseIdentifier:](&v28, "initWithStyle:reuseIdentifier:", v30, location);
  v32 = v5;
  objc_storeStrong(&v32, v5);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)UITextField), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v7 = (void *)*((_QWORD *)v32 + 1);
    *((_QWORD *)v32 + 1) = v6;

    objc_msgSend(*((id *)v32 + 1), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = objc_msgSend(v32, "contentView");
    objc_msgSend(v8, "addSubview:", *((_QWORD *)v32 + 1));

    v26 = objc_msgSend(*((id *)v32 + 1), "leadingAnchor");
    v27 = objc_msgSend(v32, "contentView");
    v25 = objc_msgSend(v27, "leadingAnchor");
    v24 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", 14.0);
    v33[0] = v24;
    v22 = objc_msgSend(*((id *)v32 + 1), "trailingAnchor");
    v23 = objc_msgSend(v32, "contentView");
    v21 = objc_msgSend(v23, "trailingAnchor");
    v9 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", -14.0);
    v33[1] = v9;
    v10 = objc_msgSend(*((id *)v32 + 1), "heightAnchor");
    v11 = objc_msgSend(v32, "contentView");
    v12 = objc_msgSend(v11, "heightAnchor");
    v13 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, -30.0);
    v33[2] = v13;
    v14 = objc_msgSend(*((id *)v32 + 1), "centerYAnchor");
    v15 = objc_msgSend(v32, "contentView");
    v16 = objc_msgSend(v15, "centerYAnchor");
    v17 = objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v33[3] = v17;
    v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

  }
  v19 = (BuddyAppleIDSignInTableViewCell *)v32;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v32, 0);
  return v19;
}

- (id)editableTextField
{
  return -[BuddyAppleIDSignInTableViewCell textField](self, "textField", a2, self);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
}

@end

@implementation BuddyMultilineButton

- (void)updateConstraints
{
  NSLayoutConstraint *v2;
  id v3;
  id v4;
  id v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  id v20;
  NSLayoutConstraint *v21;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id location[2];
  BuddyMultilineButton *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)NSMutableArray);
  v2 = -[BuddyMultilineButton labelTopConstraint](v32, "labelTopConstraint");

  if (!v2)
  {
    v3 = -[BuddyMultilineButton titleLabel](v32, "titleLabel");
    v4 = objc_msgSend(v3, "topAnchor");
    v5 = -[BuddyMultilineButton topAnchor](v32, "topAnchor");
    -[BuddyMultilineButton contentEdgeInsets](v32, "contentEdgeInsets");
    v27 = v6;
    v28 = v7;
    v29 = v8;
    v30 = v9;
    v10 = objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, v6);
    -[BuddyMultilineButton setLabelTopConstraint:](v32, "setLabelTopConstraint:", v10);

    v11 = -[BuddyMultilineButton labelTopConstraint](v32, "labelTopConstraint");
    objc_msgSend(location[0], "addObject:", v11);

  }
  v12 = -[BuddyMultilineButton labelBottomConstraint](v32, "labelBottomConstraint");

  if (!v12)
  {
    v13 = -[BuddyMultilineButton bottomAnchor](v32, "bottomAnchor");
    v14 = -[BuddyMultilineButton titleLabel](v32, "titleLabel");
    v15 = objc_msgSend(v14, "bottomAnchor");
    -[BuddyMultilineButton contentEdgeInsets](v32, "contentEdgeInsets");
    v23 = v16;
    v24 = v17;
    v25 = v18;
    v26 = v19;
    v20 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, v18);
    -[BuddyMultilineButton setLabelBottomConstraint:](v32, "setLabelBottomConstraint:", v20);

    v21 = -[BuddyMultilineButton labelBottomConstraint](v32, "labelBottomConstraint");
    objc_msgSend(location[0], "addObject:", v21);

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", location[0]);
  v22.receiver = v32;
  v22.super_class = (Class)BuddyMultilineButton;
  -[BuddyMultilineButton updateConstraints](&v22, "updateConstraints");
  objc_storeStrong(location, 0);
}

- (NSLayoutConstraint)labelTopConstraint
{
  return self->_labelTopConstraint;
}

- (void)setLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelTopConstraint, a3);
}

- (NSLayoutConstraint)labelBottomConstraint
{
  return self->_labelBottomConstraint;
}

- (void)setLabelBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_labelTopConstraint, 0);
}

@end

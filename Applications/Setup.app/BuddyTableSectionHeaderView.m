@implementation BuddyTableSectionHeaderView

- (BuddyTableSectionHeaderView)initWithPadding:(UIEdgeInsets)a3
{
  _OWORD *v3;
  __int128 v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSArray *v16;
  BuddyTableSectionHeaderView *v17;
  id v19;
  id v20;
  id v21;
  objc_super v22;
  SEL v23;
  id location;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];

  *((_QWORD *)&v25 + 1) = *(_QWORD *)&a3.left;
  *(CGFloat *)&v25 = a3.top;
  *(CGFloat *)&v26 = a3.bottom;
  *((_QWORD *)&v26 + 1) = *(_QWORD *)&a3.right;
  v23 = a2;
  location = 0;
  v22.receiver = self;
  v22.super_class = (Class)BuddyTableSectionHeaderView;
  location = -[BuddyTableSectionHeaderView init](&v22, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = (char *)location + 16;
    v4 = v25;
    *((_OWORD *)location + 2) = v26;
    *v3 = v4;
    v5 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v6 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v5;

    objc_msgSend(*((id *)location + 1), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)location + 1), "setNumberOfLines:", 0);
    objc_msgSend(location, "addSubview:", *((_QWORD *)location + 1));
    v21 = objc_msgSend(*((id *)location + 1), "leadingAnchor");
    v20 = objc_msgSend(location, "leadingAnchor");
    v19 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", *((double *)&v25 + 1));
    v27[0] = v19;
    v7 = objc_msgSend(*((id *)location + 1), "trailingAnchor");
    v8 = objc_msgSend(location, "trailingAnchor");
    v9 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, *((double *)&v26 + 1));
    v27[1] = v9;
    v10 = objc_msgSend(*((id *)location + 1), "topAnchor");
    v11 = objc_msgSend(location, "topAnchor");
    v12 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, *(double *)&v25);
    v27[2] = v12;
    v13 = objc_msgSend(*((id *)location + 1), "bottomAnchor");
    v14 = objc_msgSend(location, "bottomAnchor");
    v15 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -*(double *)&v26);
    v27[3] = v15;
    v16 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  v17 = (BuddyTableSectionHeaderView *)location;
  objc_storeStrong(&location, 0);
  return v17;
}

- (CGSize)intrinsicContentSize
{
  UILabel *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  CGSize result;

  -[BuddyTableSectionHeaderView bounds](self, "bounds");
  v2 = -[BuddyTableSectionHeaderView sectionLabel](self, "sectionLabel");
  -[UILabel intrinsicContentSize](v2, "intrinsicContentSize");
  -[BuddyTableSectionHeaderView padding](self, "padding");
  -[BuddyTableSectionHeaderView padding](self, "padding");
  sub_100120F30();
  v8 = v3;
  v9 = v4;

  v5 = v8;
  v6 = v9;
  result.height = v6;
  result.width = v5;
  return result;
}

- (UILabel)sectionLabel
{
  return self->_sectionLabel;
}

- (void)setSectionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sectionLabel, a3);
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  left = self->_padding.left;
  top = self->_padding.top;
  right = self->_padding.right;
  bottom = self->_padding.bottom;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionLabel, 0);
}

@end

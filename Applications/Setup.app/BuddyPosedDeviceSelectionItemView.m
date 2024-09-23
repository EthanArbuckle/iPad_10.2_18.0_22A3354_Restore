@implementation BuddyPosedDeviceSelectionItemView

- (BuddyPosedDeviceSelectionItemView)initWithContentView:(id)a3 selectionSegment:(int64_t)a4 accessoryView:(id)a5
{
  id v7;
  BuddyPosedDeviceSelectionItemView *v8;
  double v9;
  id v10;
  double v11;
  id v12;
  id v13;
  double v14;
  id v15;
  NSArray *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSArray *v30;
  id v31;
  BuddyPosedDeviceSelectionItemView *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  double v40;
  objc_super v41;
  id obj[2];
  id location[2];
  id v44;
  _QWORD v45[5];
  _QWORD v46[2];

  v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj[1] = (id)a4;
  obj[0] = 0;
  objc_storeStrong(obj, a5);
  v7 = v44;
  v44 = 0;
  v41.receiver = v7;
  v41.super_class = (Class)BuddyPosedDeviceSelectionItemView;
  v8 = -[BuddyPosedDeviceSelectionItemView initWithFrame:](&v41, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v44 = v8;
  objc_storeStrong(&v44, v8);
  if (v8)
  {
    objc_storeStrong((id *)v44 + 2, obj[0]);
    objc_storeStrong((id *)v44 + 1, location[0]);
    objc_msgSend(v44, "addSubview:", *((_QWORD *)v44 + 2));
    objc_msgSend(v44, "addSubview:", *((_QWORD *)v44 + 1));
    objc_msgSend(v44, "_mainViewToAccessoryViewPadding");
    v40 = v9;
    v10 = objc_msgSend(*((id *)v44 + 1), "heightAnchor");
    objc_msgSend(*((id *)v44 + 1), "bounds");
    v12 = objc_msgSend(v10, "constraintEqualToConstant:", v11);
    v46[0] = v12;
    v13 = objc_msgSend(*((id *)v44 + 1), "widthAnchor");
    objc_msgSend(*((id *)v44 + 1), "bounds");
    v15 = objc_msgSend(v13, "constraintEqualToConstant:", v14);
    v46[1] = v15;
    v16 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 2);
    v17 = (void *)*((_QWORD *)v44 + 4);
    *((_QWORD *)v44 + 4) = v16;

    objc_msgSend(*((id *)v44 + 1), "bounds");
    v19 = v18;
    objc_msgSend(*((id *)v44 + 1), "bounds");
    *((double *)v44 + 3) = v19 / v20;
    v39 = objc_msgSend(*((id *)v44 + 1), "topAnchor");
    v38 = objc_msgSend(v44, "topAnchor");
    v37 = objc_msgSend(v39, "constraintEqualToAnchor:");
    v45[0] = v37;
    v36 = objc_msgSend(*((id *)v44 + 1), "centerXAnchor");
    v35 = objc_msgSend(v44, "centerXAnchor");
    v34 = objc_msgSend(v36, "constraintEqualToAnchor:");
    v45[1] = v34;
    v21 = objc_msgSend(*((id *)v44 + 2), "topAnchor");
    v22 = objc_msgSend(*((id *)v44 + 1), "bottomAnchor");
    v23 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, v40);
    v45[2] = v23;
    v24 = objc_msgSend(*((id *)v44 + 2), "centerXAnchor");
    v25 = objc_msgSend(*((id *)v44 + 1), "centerXAnchor");
    v26 = objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v45[3] = v26;
    v27 = objc_msgSend(v44, "bottomAnchor");
    v28 = objc_msgSend(*((id *)v44 + 2), "bottomAnchor");
    v29 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, v40);
    v45[4] = v29;
    v30 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 5);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

    v31 = objc_msgSend(v44, "contentContainerWidthHeightConstraints");
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

    objc_msgSend(v44, "layoutSubviews");
    objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  v32 = (BuddyPosedDeviceSelectionItemView *)v44;
  objc_storeStrong(obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v44, 0);
  return v32;
}

- (BuddyPosedDeviceSelectionItemView)initWithContentImage:(id)a3 selectionSegment:(int64_t)a4 accessoryView:(id)a5 hostViewLayoutMargins:(NSDirectionalEdgeInsets)a6 posedDevicesPadding:(double)a7
{
  id v10;
  UIColor *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  BuddyPosedDeviceSelectionItemView *v23;
  id v25[5];
  double v26;
  id v27;
  double v28;
  id v29;
  int64_t v30;
  id location[2];
  id v32;
  NSDirectionalEdgeInsets v33;

  v33 = a6;
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = a4;
  v29 = 0;
  objc_storeStrong(&v29, a5);
  v28 = a7;
  v10 = objc_alloc((Class)UIImageView);
  v27 = objc_msgSend(v10, "initWithImage:", location[0]);
  v11 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.152941182, 0.152941182, 0.152941182, 1.0);
  objc_msgSend(v27, "setTintColor:", v11);

  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(location[0], "size");
  v25[3] = v12;
  v25[4] = v13;
  v14 = *(double *)&v13;
  objc_msgSend(location[0], "size");
  v25[1] = v15;
  v25[2] = v16;
  v26 = v14 / *(double *)&v15;
  v17 = v32;
  objc_msgSend(v27, "bounds");
  v25[0] = objc_msgSend(v17, "_createContainerSize:aspectRatio:hostViewLayoutMargins:posedDevicesPadding:", v18, v19, v20, v21, v26, *(_QWORD *)&v33.top, *(_QWORD *)&v33.leading, *(_QWORD *)&v33.bottom, *(_QWORD *)&v33.trailing, *(_QWORD *)&v28, *(_QWORD *)&v18, *(_QWORD *)&v19, *(_QWORD *)&v20, *(_QWORD *)&v21);
  objc_msgSend(v25[0], "addSubview:", v27);
  objc_msgSend(v27, "pinToEdges:", v25[0]);
  v22 = v32;
  v32 = 0;
  v32 = objc_msgSend(v22, "initWithContentView:selectionSegment:accessoryView:", v25[0], v30, v29);
  objc_storeStrong(&v32, v32);
  if (v32)
  {
    *((double *)v32 + 3) = v26;
    *(NSDirectionalEdgeInsets *)((char *)v32 + 48) = v33;
    *((double *)v32 + 5) = v28;
  }
  v23 = (BuddyPosedDeviceSelectionItemView *)v32;
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v32, 0);
  return v23;
}

- (double)_idealPosedDeviceSizeForAspectRatio:(double)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 posedDevicesPadding:(double)a5
{
  UIDevice *v5;
  id v6;
  double v7;
  uint64_t v8;
  double result;
  UIScreen *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double leading;
  double trailing;

  leading = a4.leading;
  trailing = a4.trailing;
  v5 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = -[UIDevice userInterfaceIdiom](v5, "userInterfaceIdiom");

  if (v6 == (id)1)
  {
    +[OBWelcomeController preferredContentSize](OBWelcomeController, "preferredContentSize");
    -[BuddyPosedDeviceSelectionItemView buddy_heightForContainerWidth:ratio:](self, "buddy_heightForContainerWidth:ratio:", (v7 - a5 - (leading + trailing)) / 3.0, a3, 0, v15, v17, v19, v21, *(_QWORD *)&v7, v8);
  }
  else
  {
    v10 = +[UIScreen mainScreen](UIScreen, "mainScreen");
    -[UIScreen bounds](v10, "bounds");
    v18 = v11;
    v16 = v12;
    v22 = v13;
    v20 = v14;
    v25 = v14 - a5 - (leading + trailing);

    -[BuddyPosedDeviceSelectionItemView buddy_heightForContainerWidth:ratio:](self, "buddy_heightForContainerWidth:ratio:", v25 / 3.0, a3, 0, v16, v18, *(_QWORD *)&v20, v22, v23, v24);
  }
  return result;
}

- (id)_createContainerSize:(CGRect)a3 aspectRatio:(double)a4 hostViewLayoutMargins:(NSDirectionalEdgeInsets)a5 posedDevicesPadding:(double)a6
{
  double v6;
  id v7;
  id v8;
  id location;
  double v11;
  SEL v12;
  BuddyPosedDeviceSelectionItemView *v13;
  NSDirectionalEdgeInsets v14;
  CGRect v15;

  v15 = a3;
  v14 = a5;
  v13 = self;
  v12 = a2;
  v11 = a4;
  location = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(location, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BuddyPosedDeviceSelectionItemView _idealPosedDeviceSizeForAspectRatio:layoutMargins:posedDevicesPadding:](v13, "_idealPosedDeviceSizeForAspectRatio:layoutMargins:posedDevicesPadding:", v11, a5.top, a5.leading, a5.bottom, a5.trailing, a6);
  v7 = objc_msgSend(location, "buddy_scaleHeightTo:ratio:", v6, v11);
  v8 = location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)setSelected:(BOOL)a3
{
  BuddyPosedDeviceSelectionItemAccessoryView *v4;

  v4 = -[BuddyPosedDeviceSelectionItemView accessoryView](self, "accessoryView");
  -[BuddyPosedDeviceSelectionItemAccessoryView setSelected:](v4, "setSelected:", a3);

}

- (BOOL)selected
{
  BuddyPosedDeviceSelectionItemAccessoryView *v2;
  unsigned __int8 v3;

  v2 = -[BuddyPosedDeviceSelectionItemView accessoryView](self, "accessoryView", a2, self);
  v3 = -[BuddyPosedDeviceSelectionItemAccessoryView selected](v2, "selected");

  return v3 & 1;
}

- (id)title
{
  BuddyPosedDeviceSelectionItemAccessoryView *v2;
  UILabel *v3;
  NSString *v4;

  v2 = -[BuddyPosedDeviceSelectionItemView accessoryView](self, "accessoryView", a2, self);
  v3 = -[BuddyPosedDeviceSelectionItemAccessoryView titleLabel](v2, "titleLabel");
  v4 = -[UILabel text](v3, "text");

  return v4;
}

- (double)updateBoundsForMaxContentHeight:(double)a3
{
  BuddyPosedDeviceSelectionItemAccessoryView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSArray *v17;
  UIView *v18;
  double v19;
  id v20;
  UIView *v21;
  NSLayoutDimension *v22;
  double v23;
  NSLayoutConstraint *v24;
  UIView *v25;
  NSLayoutDimension *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  NSLayoutConstraint *v31;
  NSArray *v32;
  NSArray *v33;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v41;
  _QWORD v43[2];

  v3 = -[BuddyPosedDeviceSelectionItemView accessoryView](self, "accessoryView");
  -[BuddyPosedDeviceSelectionItemAccessoryView bounds](v3, "bounds");
  v5 = v4;
  -[BuddyPosedDeviceSelectionItemView _mainViewToAccessoryViewPadding](self, "_mainViewToAccessoryViewPadding");
  v41 = a3 - (v5 + v6);

  -[BuddyPosedDeviceSelectionItemView aspectRatio](self, "aspectRatio");
  v8 = v7;
  -[BuddyPosedDeviceSelectionItemView hostViewLayoutMargins](self, "hostViewLayoutMargins");
  v36 = v9;
  v37 = v10;
  v38 = v11;
  v39 = v12;
  -[BuddyPosedDeviceSelectionItemView posedDevicesPadding](self, "posedDevicesPadding");
  -[BuddyPosedDeviceSelectionItemView _idealPosedDeviceSizeForAspectRatio:layoutMargins:posedDevicesPadding:](self, "_idealPosedDeviceSizeForAspectRatio:layoutMargins:posedDevicesPadding:", v8, v36, v37, v38, v39, v13);
  v15 = sub_1000FCA34(v41, v14);
  -[BuddyPosedDeviceSelectionItemView _preferredHeight](self, "_preferredHeight");
  v35 = sub_1000FCA34(v15, v16);
  v17 = -[BuddyPosedDeviceSelectionItemView contentContainerWidthHeightConstraints](self, "contentContainerWidthHeightConstraints");
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v17);

  v18 = -[BuddyPosedDeviceSelectionItemView contentContainer](self, "contentContainer");
  -[BuddyPosedDeviceSelectionItemView aspectRatio](self, "aspectRatio");
  v20 = -[UIView buddy_scaleHeightTo:ratio:](v18, "buddy_scaleHeightTo:ratio:", v35, v19);

  v21 = -[BuddyPosedDeviceSelectionItemView contentContainer](self, "contentContainer");
  v22 = -[UIView heightAnchor](v21, "heightAnchor");
  -[UIView bounds](self->_contentContainer, "bounds");
  v24 = -[NSLayoutDimension constraintEqualToConstant:](v22, "constraintEqualToConstant:", v23);
  v43[0] = v24;
  v25 = -[BuddyPosedDeviceSelectionItemView contentContainer](self, "contentContainer");
  v26 = -[UIView widthAnchor](v25, "widthAnchor");
  -[UIView bounds](self->_contentContainer, "bounds");
  v31 = -[NSLayoutDimension constraintEqualToConstant:](v26, "constraintEqualToConstant:", v29, v27, v28, *(_QWORD *)&v29, v30);
  v43[1] = v31;
  v32 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2);
  -[BuddyPosedDeviceSelectionItemView setContentContainerWidthHeightConstraints:](self, "setContentContainerWidthHeightConstraints:", v32);

  v33 = -[BuddyPosedDeviceSelectionItemView contentContainerWidthHeightConstraints](self, "contentContainerWidthHeightConstraints");
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

  return v35;
}

- (double)accessoryViewAndPaddingHeight
{
  BuddyPosedDeviceSelectionItemAccessoryView *v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  v2 = -[BuddyPosedDeviceSelectionItemView accessoryView](self, "accessoryView");
  -[BuddyPosedDeviceSelectionItemAccessoryView bounds](v2, "bounds");
  v4 = v3;
  -[BuddyPosedDeviceSelectionItemView _mainViewToAccessoryViewPadding](self, "_mainViewToAccessoryViewPadding", v5, v6, v7, *(_QWORD *)&v3);
  v9 = v4 + v8;

  return v9;
}

- (double)_preferredHeight
{
  UIScreen *v2;
  double v3;
  double v4;

  v2 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen bounds](v2, "bounds");
  v4 = v3 * 0.3;

  return v4;
}

- (double)_mainViewToAccessoryViewPadding
{
  id v2;
  id v3;
  double v5;

  v5 = 22.0;
  v2 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v3 = objc_msgSend(v2, "size");

  if (v3 == (id)2)
    return 10.0;
  return v5;
}

- (double)contentContainerHeight
{
  UIView *v2;
  double v3;
  double v4;

  v2 = -[BuddyPosedDeviceSelectionItemView contentContainer](self, "contentContainer");
  -[UIView bounds](v2, "bounds");
  v4 = v3;

  return v4;
}

- (UIView)contentContainer
{
  return self->_contentContainer;
}

- (void)setContentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_contentContainer, a3);
}

- (BuddyPosedDeviceSelectionItemAccessoryView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryView, a3);
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (NSArray)contentContainerWidthHeightConstraints
{
  return self->_contentContainerWidthHeightConstraints;
}

- (void)setContentContainerWidthHeightConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_contentContainerWidthHeightConstraints, a3);
}

- (NSDirectionalEdgeInsets)hostViewLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  leading = self->_hostViewLayoutMargins.leading;
  top = self->_hostViewLayoutMargins.top;
  trailing = self->_hostViewLayoutMargins.trailing;
  bottom = self->_hostViewLayoutMargins.bottom;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setHostViewLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  self->_hostViewLayoutMargins = a3;
}

- (double)posedDevicesPadding
{
  return self->_posedDevicesPadding;
}

- (void)setPosedDevicesPadding:(double)a3
{
  self->_posedDevicesPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContainerWidthHeightConstraints, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);
}

@end

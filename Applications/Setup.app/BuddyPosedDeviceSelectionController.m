@implementation BuddyPosedDeviceSelectionController

- (void)viewDidLoad
{
  BuddyPosedDeviceSelectionView *v2;
  BuddyPosedDeviceSelectionController *v3;
  BuddyPosedDeviceSelectionView *v4;
  id v5;
  BuddyPosedDeviceSelectionView *v6;
  id v7;
  int v8;
  double v9;
  id v10;
  id v11;
  BuddyPosedDeviceSelectionView *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  UIDevice *v17;
  id v18;
  BuddyPosedDeviceSelectionView *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  BuddyPosedDeviceSelectionView *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSArray *v33;
  BuddyPosedDeviceSelectionView *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  BuddyPosedDeviceSelectionView *v39;
  NSLayoutConstraint *v40;
  double v41;
  objc_super v42;
  SEL v43;
  BuddyPosedDeviceSelectionController *v44;
  _QWORD v45[4];

  v44 = self;
  v43 = a2;
  v42.receiver = self;
  v42.super_class = (Class)BuddyPosedDeviceSelectionController;
  -[BuddyPosedDeviceSelectionController viewDidLoad](&v42, "viewDidLoad");
  v2 = -[BuddyPosedDeviceSelectionController selectionView](v44, "selectionView");
  -[BuddyPosedDeviceSelectionView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v3 = v44;
  v4 = -[BuddyPosedDeviceSelectionController selectionView](v44, "selectionView");
  -[BuddyPosedDeviceSelectionView setDelegate:](v4, "setDelegate:", v3);

  v5 = -[BuddyPosedDeviceSelectionController contentView](v44, "contentView");
  v6 = -[BuddyPosedDeviceSelectionController selectionView](v44, "selectionView");
  objc_msgSend(v5, "addSubview:", v6);

  v7 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  if ((objc_msgSend(v7, "posedDeviceSelection_largeSizeDevice") & 1) != 0)
    v8 = 57;
  else
    v8 = 37;
  v9 = (double)v8;

  v41 = v9;
  v10 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v11 = objc_msgSend(v10, "size");

  if (v11 == (id)2)
    v41 = 16.0;
  v12 = -[BuddyPosedDeviceSelectionController selectionView](v44, "selectionView");
  v13 = -[BuddyPosedDeviceSelectionView topAnchor](v12, "topAnchor");
  v14 = -[BuddyPosedDeviceSelectionController headerView](v44, "headerView");
  v15 = objc_msgSend(v14, "bottomAnchor");
  v16 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, v41);
  -[BuddyPosedDeviceSelectionController setContentViewTopConstraint:](v44, "setContentViewTopConstraint:", v16);

  v17 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v18 = -[UIDevice userInterfaceIdiom](v17, "userInterfaceIdiom");

  if (v18 == (id)1)
  {
    v19 = -[BuddyPosedDeviceSelectionController selectionView](v44, "selectionView");
    v20 = -[BuddyPosedDeviceSelectionView topAnchor](v19, "topAnchor");
    v21 = -[BuddyPosedDeviceSelectionController contentView](v44, "contentView");
    v22 = objc_msgSend(v21, "topAnchor");
    v23 = objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    -[BuddyPosedDeviceSelectionController setContentViewTopConstraint:](v44, "setContentViewTopConstraint:", v23);

  }
  v40 = -[BuddyPosedDeviceSelectionController contentViewTopConstraint](v44, "contentViewTopConstraint");
  v45[0] = v40;
  v39 = -[BuddyPosedDeviceSelectionController selectionView](v44, "selectionView");
  v37 = -[BuddyPosedDeviceSelectionView leftAnchor](v39, "leftAnchor");
  v38 = -[BuddyPosedDeviceSelectionController contentView](v44, "contentView");
  v36 = objc_msgSend(v38, "leftAnchor");
  v35 = objc_msgSend(v37, "constraintEqualToAnchor:");
  v45[1] = v35;
  v34 = -[BuddyPosedDeviceSelectionController selectionView](v44, "selectionView");
  v24 = -[BuddyPosedDeviceSelectionView rightAnchor](v34, "rightAnchor");
  v25 = -[BuddyPosedDeviceSelectionController contentView](v44, "contentView");
  v26 = objc_msgSend(v25, "rightAnchor");
  v27 = objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v45[2] = v27;
  v28 = -[BuddyPosedDeviceSelectionController selectionView](v44, "selectionView");
  v29 = -[BuddyPosedDeviceSelectionView bottomAnchor](v28, "bottomAnchor");
  v30 = -[BuddyPosedDeviceSelectionController contentView](v44, "contentView");
  v31 = objc_msgSend(v30, "bottomAnchor");
  v32 = objc_msgSend(v29, "constraintEqualToAnchor:", v31);
  v45[3] = v32;
  v33 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 4);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

}

- (void)viewDidLayoutSubviews
{
  BuddyPosedDeviceSelectionController *v2;
  objc_super v3;
  SEL v4;
  BuddyPosedDeviceSelectionController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyPosedDeviceSelectionController;
  -[BuddyPosedDeviceSelectionController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  v2 = v5;
  -[BuddyPosedDeviceSelectionController _contentViewHeight](v5, "_contentViewHeight");
  -[BuddyPosedDeviceSelectionController _setPosedViewToBoundedHeight:animated:requireLayout:](v2, "_setPosedViewToBoundedHeight:animated:requireLayout:", 0, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  id v4;
  BuddyPosedDeviceSelectionController *v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  BuddyPosedDeviceSelectionController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyPosedDeviceSelectionController;
  -[BuddyPosedDeviceSelectionController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v3 = -[BuddyPosedDeviceSelectionController view](v9, "view");
  objc_msgSend(v3, "setNeedsLayout");

  v4 = -[BuddyPosedDeviceSelectionController view](v9, "view");
  objc_msgSend(v4, "layoutIfNeeded");

  v5 = v9;
  -[BuddyPosedDeviceSelectionController _contentViewHeight](v9, "_contentViewHeight");
  -[BuddyPosedDeviceSelectionController _setPosedViewToBoundedHeight:animated:](v5, "_setPosedViewToBoundedHeight:animated:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  BuddyPosedDeviceSelectionController *v3;
  objc_super v4;
  id location[2];
  BuddyPosedDeviceSelectionController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)BuddyPosedDeviceSelectionController;
  -[BuddyPosedDeviceSelectionController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", location[0]);
  v3 = v6;
  -[BuddyPosedDeviceSelectionController _contentViewHeight](v6, "_contentViewHeight");
  -[BuddyPosedDeviceSelectionController _setPosedViewToBoundedHeight:animated:](v3, "_setPosedViewToBoundedHeight:animated:", 0);
  objc_storeStrong(location, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  UIScreen *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(id *, void *);
  void *v14;
  id v15[5];
  double v16;
  double v17;
  int v18;
  id location[2];
  BuddyPosedDeviceSelectionController *v20;
  CGSize v21;

  v21 = a3;
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (-[BuddyPosedDeviceSelectionController _buttonTrayInlined](v20, "_buttonTrayInlined"))
  {
    v18 = 1;
  }
  else
  {
    v4 = +[UIScreen mainScreen](UIScreen, "mainScreen");
    -[UIScreen bounds](v4, "bounds");
    v15[2] = v5;
    v15[1] = v6;
    v15[4] = v7;
    v15[3] = v8;
    v16 = *(double *)&v8;
    v17 = *(double *)&v7;

    if (v16 - 88.0 < 820.0 || v17 - 88.0 < 820.0)
    {
      v9 = location[0];
      v10 = _NSConcreteStackBlock;
      v11 = -1073741824;
      v12 = 0;
      v13 = sub_1000F8C5C;
      v14 = &unk_100282D20;
      v15[0] = v20;
      objc_msgSend(v9, "animateAlongsideTransition:completion:", &v10, 0);
      objc_storeStrong(v15, 0);
    }
    v18 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)_setPosedViewToBoundedHeight:(double)a3 animated:(BOOL)a4
{
  -[BuddyPosedDeviceSelectionController _setPosedViewToBoundedHeight:animated:requireLayout:](self, "_setPosedViewToBoundedHeight:animated:requireLayout:", a4, 1, a3);
}

- (void)_setPosedViewToBoundedHeight:(double)a3 animated:(BOOL)a4 requireLayout:(BOOL)a5
{
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, char);
  void *v9;
  BuddyPosedDeviceSelectionController *v10;
  BOOL v11;
  BOOL v12;
  void **v13;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18[2];
  BOOL v19;
  BOOL v20;
  double v21;
  BOOL v22;
  BOOL v23;
  double v24;
  SEL v25;
  BuddyPosedDeviceSelectionController *v26;

  v26 = self;
  v25 = a2;
  v24 = a3;
  v23 = a4;
  v22 = a5;
  v21 = 0.7;
  if (!a4)
    v21 = 0.0;
  v13 = _NSConcreteStackBlock;
  v14 = -1073741824;
  v15 = 0;
  v16 = sub_1000F8EF4;
  v17 = &unk_100282DD0;
  v18[0] = v26;
  v18[1] = *(id *)&v24;
  v19 = v23;
  v20 = v22;
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000F9088;
  v9 = &unk_100282DF8;
  v11 = v23;
  v12 = v22;
  v10 = v26;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v13, &v5, v21);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v18, 0);
}

- (double)_landscapeDefaultSize
{
  UIScreen *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  BuddyPosedDeviceSelectionView *v7;
  BuddyPosedDeviceSelectionItemView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;

  v2 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen bounds](v2, "bounds");
  v14 = v3;
  v15 = v4;

  if (v14 >= v15)
    v5 = v15;
  else
    v5 = v14;
  v6 = v5;
  v7 = -[BuddyPosedDeviceSelectionController selectionView](self, "selectionView");
  v8 = -[BuddyPosedDeviceSelectionView leftPosedView](v7, "leftPosedView");
  -[BuddyPosedDeviceSelectionItemView accessoryViewAndPaddingHeight](v8, "accessoryViewAndPaddingHeight");
  v10 = v9 + v6 * 0.300000012;
  -[BuddyPosedDeviceSelectionController _headerToContentPadding](self, "_headerToContentPadding");
  v12 = v10 + v11;

  return v12;
}

- (double)_portraitDefaultHeight
{
  UIScreen *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BuddyPosedDeviceSelectionView *v10;
  BuddyPosedDeviceSelectionItemView *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;

  v2 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen bounds](v2, "bounds");
  v17 = v3;
  v16 = v4;
  v19 = v5;
  v18 = v6;
  v20 = v6;
  v21 = v5;

  if (v20 - 88.0 <= 820.0 || v21 - 88.0 <= 820.0)
  {
    if (v20 <= v21)
      v8 = v21;
    else
      v8 = v20;
    v9 = v8;
    v10 = -[BuddyPosedDeviceSelectionController selectionView](self, "selectionView", *(_QWORD *)&v8, v16, v17, *(_QWORD *)&v18, *(_QWORD *)&v19);
    v11 = -[BuddyPosedDeviceSelectionView leftPosedView](v10, "leftPosedView");
    -[BuddyPosedDeviceSelectionItemView accessoryViewAndPaddingHeight](v11, "accessoryViewAndPaddingHeight");
    v13 = v12 + v9 * 0.300000012;
    -[BuddyPosedDeviceSelectionController _headerToContentPadding](self, "_headerToContentPadding");
    v23 = v13 + v14;

  }
  else
  {
    -[BuddyPosedDeviceSelectionController _landscapeDefaultSize](self, "_landscapeDefaultSize", v21 - 88.0);
    return v7;
  }
  return v23;
}

- (BOOL)_buttonTrayInlined
{
  id v2;
  id v3;
  id v4;
  BOOL v5;

  v2 = -[BuddyPosedDeviceSelectionController buttonTray](self, "buttonTray", a2);
  v3 = objc_msgSend(v2, "superview");
  v4 = -[BuddyPosedDeviceSelectionController view](self, "view");
  v5 = v3 != v4;

  return v5;
}

- (double)_contentViewHeight
{
  id v2;
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v39;
  double v40;
  double v41;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;

  v2 = -[BuddyPosedDeviceSelectionController buttonTray](self, "buttonTray");
  objc_msgSend(v2, "frame");
  v4 = v3;
  v5 = -[BuddyPosedDeviceSelectionController contentView](self, "contentView");
  objc_msgSend(v5, "frame");
  v7 = v4 - v6;
  -[BuddyPosedDeviceSelectionController _headerToContentPadding](self, "_headerToContentPadding");
  v9 = v7 - v8;
  v10 = -[BuddyPosedDeviceSelectionController navigationController](self, "navigationController");
  v11 = objc_msgSend(v10, "navigationBar");
  objc_msgSend(v11, "frame");
  v46 = v12;
  v45 = v13;
  v48 = v14;
  v47 = v15;
  v16 = v9 - v14;

  v49 = v16;
  v43 = 0x3FD3333340000000;
  v17 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v18 = objc_msgSend(v17, "type");

  if (v18 == (id)1)
    v43 = 0x3FDEB851E0000000;
  v19 = -[BuddyPosedDeviceSelectionController navigationController](self, "navigationController", v43, v45, v46, v47, *(_QWORD *)&v48);
  v20 = objc_msgSend(v19, "view");
  v21 = objc_msgSend(v20, "window");
  v22 = objc_msgSend(v21, "windowScene");
  v23 = sub_1000F96E8((uint64_t)objc_msgSend(v22, "interfaceOrientation"));

  if (v23)
  {
    -[BuddyPosedDeviceSelectionController _landscapeDefaultSize](self, "_landscapeDefaultSize");
    if (v16 >= v24 || -[BuddyPosedDeviceSelectionController _buttonTrayInlined](self, "_buttonTrayInlined"))
    {
      -[BuddyPosedDeviceSelectionController _landscapeDefaultSize](self, "_landscapeDefaultSize");
      return v25;
    }
    else
    {
      -[BuddyPosedDeviceSelectionController _landscapeDefaultSize](self, "_landscapeDefaultSize");
      v27 = v26;
      -[BuddyPosedDeviceSelectionController _landscapeDefaultSize](self, "_landscapeDefaultSize");
      if (v49 > v27 + -v28 * v44)
        return v49;
      -[BuddyPosedDeviceSelectionController _landscapeDefaultSize](self, "_landscapeDefaultSize");
      v31 = v30;
      -[BuddyPosedDeviceSelectionController _landscapeDefaultSize](self, "_landscapeDefaultSize");
      return v31 + -v32 * v44;
    }
  }
  else
  {
    -[BuddyPosedDeviceSelectionController _portraitDefaultHeight](self, "_portraitDefaultHeight");
    if (v16 >= v33 || -[BuddyPosedDeviceSelectionController _buttonTrayInlined](self, "_buttonTrayInlined"))
    {
      -[BuddyPosedDeviceSelectionController _portraitDefaultHeight](self, "_portraitDefaultHeight");
      return v34;
    }
    else
    {
      -[BuddyPosedDeviceSelectionController _portraitDefaultHeight](self, "_portraitDefaultHeight");
      v36 = v35;
      -[BuddyPosedDeviceSelectionController _portraitDefaultHeight](self, "_portraitDefaultHeight");
      if (v49 > v36 + -v37 * v44)
        return v49;
      -[BuddyPosedDeviceSelectionController _portraitDefaultHeight](self, "_portraitDefaultHeight");
      v40 = v39;
      -[BuddyPosedDeviceSelectionController _portraitDefaultHeight](self, "_portraitDefaultHeight");
      return v40 + -v41 * v44;
    }
  }
}

- (double)_headerToContentPadding
{
  NSLayoutConstraint *v2;
  double v3;
  double v4;

  v2 = -[BuddyPosedDeviceSelectionController contentViewTopConstraint](self, "contentViewTopConstraint", a2, self);
  -[NSLayoutConstraint constant](v2, "constant");
  v4 = v3;

  return v4;
}

- (void)didSelectSegment:(int64_t)a3
{
  ;
}

- (BuddyPosedDeviceSelectionView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionView, a3);
}

- (id)selectionViewHeightChangeBlock
{
  return self->_selectionViewHeightChangeBlock;
}

- (void)setSelectionViewHeightChangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong(&self->_selectionViewHeightChangeBlock, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
}

@end
